//! Raw HTTP fetch helpers for the local runtime (localhost status/ping).
//!
//! IPFS/IPNS content goes through [`crate::ipfs`] (verified-fetch), not here.
//! These helpers only talk plain HTTP to localhost (the trusted runtime's
//! status endpoint) and stay gateway-independent.

use futures::{pin_mut, FutureExt as _};
use gloo_timers::future::TimeoutFuture;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::JsFuture;
use web_time::{Duration, Instant};

/// How long startup/profile fetches keep retrying a transiently failing
/// gateway fetch. A freshly published block is cold on the public gateways;
/// the first request warms the block server-side, so the retry loop waits for
/// that to land instead of giving up after one gateway deadline. The budget
/// must exceed `ma-core`'s own per-fetch deadline so a fast `504` still leaves
/// room to retry after the block has warmed up.
pub const STARTUP_FETCH_TIMEOUT_MS: u32 = 120_000;

/// Exponential backoff between startup/profile fetch retry attempts. A freshly
/// published block can take time to propagate through delegated routing, so the
/// pause grows from 2 s to a 30 s cap instead of hammering every couple of
/// seconds.
pub fn retry_backoff_ms(attempt: u32) -> u32 {
    let factor = 1u32 << attempt.min(4);
    (2_000u32.saturating_mul(factor)).min(30_000)
}

pub struct HttpTextResponse {
    pub status: u16,
    pub body: String,
}

/// GET a URL and return the response body as text, aborting the request on timeout.
pub async fn fetch_url_text_timeout(url: &str, timeout_ms: u32) -> Result<String, String> {
    let opts = web_sys::RequestInit::new();
    opts.set_method("GET");
    let resp = fetch_with_timeout(url, &opts, timeout_ms).await?;
    response_text(resp).await
}

/// POST a JSON body and return both status and response body as text, aborting on timeout.
pub async fn post_json_text_timeout(
    url: &str,
    body: &str,
    timeout_ms: u32,
) -> Result<HttpTextResponse, String> {
    let headers = web_sys::Headers::new().map_err(|e| format!("{e:?}"))?;
    headers
        .set("Content-Type", "application/json")
        .map_err(|e| format!("{e:?}"))?;
    let opts = web_sys::RequestInit::new();
    opts.set_method("POST");
    opts.set_body(&wasm_bindgen::JsValue::from_str(body));
    opts.set_headers(&headers);
    let resp = fetch_with_timeout(url, &opts, timeout_ms).await?;
    let status = resp.status();
    let text_val = JsFuture::from(resp.text().map_err(|e| format!("{e:?}"))?)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let body = text_val.as_string().unwrap_or_default();
    Ok(HttpTextResponse { status, body })
}

/// Probe a URL with a raw browser `fetch` and report how the browser treated
/// it, bypassing ma-core/reqwest so the underlying rejection reason survives.
///
/// `no_cors` sets fetch mode `no-cors`: a resolved no-cors fetch (opaque
/// response) means the network path works, so any cors-mode failure is CORS
/// policy; a rejected no-cors fetch means the network/DNS path itself is
/// broken. Used by `.ma!gateway-test`.
pub async fn probe_fetch(url: &str, no_cors: bool, timeout_ms: u32) -> String {
    let mode_label = if no_cors { "no-cors" } else { "cors" };
    let opts = web_sys::RequestInit::new();
    opts.set_method("GET");
    if no_cors {
        opts.set_mode(web_sys::RequestMode::NoCors);
    }
    match fetch_with_timeout(url, &opts, timeout_ms).await {
        Ok(resp) => format!(
            "{mode_label}: resolved status={} type={:?}",
            resp.status(),
            resp.type_()
        ),
        Err(e) => format!("{mode_label}: rejected: {e}"),
    }
}

async fn fetch_with_timeout(
    url: &str,
    opts: &web_sys::RequestInit,
    timeout_ms: u32,
) -> Result<web_sys::Response, String> {
    let window = web_sys::window().ok_or("no window")?;
    let controller = web_sys::AbortController::new().map_err(|e| format!("{e:?}"))?;
    opts.set_signal(Some(&controller.signal()));
    let request =
        web_sys::Request::new_with_str_and_init(url, opts).map_err(|e| format!("{e:?}"))?;
    let fetch = JsFuture::from(window.fetch_with_request(&request)).fuse();
    let timeout = TimeoutFuture::new(timeout_ms).fuse();
    pin_mut!(fetch, timeout);
    futures::select! {
        resp_val = fetch => {
            let resp_val = resp_val.map_err(|e| format!("{e:?}"))?;
            resp_val.dyn_into().map_err(|_| "not a Response".to_string())
        }
        () = timeout => {
            controller.abort();
            Err(format!("timeout after {timeout_ms}ms"))
        }
    }
}

async fn response_text(resp: web_sys::Response) -> Result<String, String> {
    if !resp.ok() {
        return Err(format!("HTTP {}", resp.status()));
    }
    let text_val = JsFuture::from(resp.text().map_err(|e| format!("{e:?}"))?)
        .await
        .map_err(|e| format!("{e:?}"))?;
    text_val
        .as_string()
        .ok_or_else(|| "response is not a string".to_string())
}

/// Fetch raw bytes for a bare CID via verified-fetch.
pub async fn fetch_cid_bytes(cid: &str) -> Result<Vec<u8>, String> {
    crate::ipfs::fetch_bytes(&format!("ipfs://{cid}")).await
}

/// Fetch raw bytes for a bare CID, retrying transient failures within the
/// startup budget. Used by profile loading, where the blob was just published
/// and may not yet be discoverable.
pub async fn fetch_cid_bytes_retrying(cid: &str) -> Result<Vec<u8>, String> {
    let deadline = Instant::now() + Duration::from_millis(u64::from(STARTUP_FETCH_TIMEOUT_MS));
    let mut attempt = 0u32;
    loop {
        match fetch_cid_bytes(cid).await {
            Ok(bytes) => return Ok(bytes),
            Err(error) if Instant::now() < deadline => {
                log::warn!("[http] CID fetch failed, retrying: {error}");
                TimeoutFuture::new(retry_backoff_ms(attempt)).await;
                attempt = attempt.saturating_add(1);
            }
            Err(error) => return Err(error),
        }
    }
}

/// Fetch text for a bare CID via verified-fetch.
pub async fn fetch_cid_text(cid: &str) -> Result<String, String> {
    crate::ipfs::fetch_text(&format!("ipfs://{cid}")).await
}

/// Fetch raw bytes for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). Bytes are verified against the CID by
/// verified-fetch, so operator owns decoding.
pub async fn fetch_path_bytes(path: &str) -> Result<Vec<u8>, String> {
    crate::ipfs::fetch_bytes(&crate::ipfs::to_verified_resource(path)).await
}

/// Fetch text for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). See [`fetch_path_bytes`] for details.
pub async fn fetch_path_text(path: &str) -> Result<String, String> {
    crate::ipfs::fetch_text(&crate::ipfs::to_verified_resource(path)).await
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn retry_backoff_grows_and_caps() {
        assert_eq!(retry_backoff_ms(0), 2_000);
        assert_eq!(retry_backoff_ms(1), 4_000);
        assert_eq!(retry_backoff_ms(2), 8_000);
        assert_eq!(retry_backoff_ms(3), 16_000);
        assert_eq!(retry_backoff_ms(4), 30_000);
        assert_eq!(retry_backoff_ms(10), 30_000);
    }
}
