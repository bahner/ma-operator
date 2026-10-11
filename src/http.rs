//! Raw HTTP fetch helpers.
//!
//! Two unrelated jobs live here: plain HTTP to the local runtime's status
//! endpoint (localhost ping/claim), and plain HTTP reads against an optional
//! local Kubo gateway when local gateway mode is active. Public IPFS/IPNS
//! content otherwise goes through [`crate::ipfs`] (verified-fetch).

use futures::{pin_mut, FutureExt as _};
use gloo_timers::future::TimeoutFuture;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::JsFuture;
use web_time::{Duration, Instant};

/// How long startup/profile fetches keep retrying a transiently failing
/// fetch. A freshly published block is cold on the network; the first request
/// warms the block, so the retry loop waits for that to land instead of giving
/// up after one deadline. The budget must exceed `ma-core`'s own per-fetch
/// deadline so a fast failure still leaves room to retry after the block has
/// warmed up.
pub const STARTUP_FETCH_TIMEOUT_MS: u32 = 120_000;

/// Local gateway read timeout. Kubo is on localhost, so a short deadline is
/// plenty; a hung gateway must not stall the UI indefinitely.
pub const GATEWAY_TIMEOUT_MS: u32 = 30_000;

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

pub(crate) async fn fetch_with_timeout(
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

/// Why a local-gateway read failed.
#[derive(Debug)]
pub enum GatewayError {
    /// The gateway could not be reached (transport error, timeout, DNS). It may
    /// be absent, so the caller should disable local and fall back to public.
    Unreachable(String),
    /// The gateway answered but the read failed (non-success status, or a name
    /// that could not be resolved). Not a reason to stop using it.
    Failed(String),
}

/// Turn a normalised `ipfs://…` / `ipns://…` resource into a gateway URL.
fn gateway_resource_url(gateway: &str, resource: &str) -> Result<String, String> {
    let base = gateway.trim_end_matches('/');
    let path = if let Some(rest) = resource.strip_prefix("ipfs://") {
        format!("/ipfs/{rest}")
    } else if let Some(rest) = resource.strip_prefix("ipns://") {
        format!("/ipns/{rest}")
    } else {
        return Err(format!("not a gateway resource: {resource}"));
    };
    Ok(format!("{base}{path}"))
}

/// Build gateway request options. Mutable (`/ipns/…`) reads bypass the browser
/// HTTP cache so a re-published DID document is never served stale — the local
/// analogue of verified-fetch's `nocache`/cache-clearing on the public path.
fn gateway_request(method: &str, mutable: bool) -> web_sys::RequestInit {
    let opts = web_sys::RequestInit::new();
    opts.set_method(method);
    if mutable {
        opts.set_cache(web_sys::RequestCache::NoStore);
    }
    opts
}

/// GET raw bytes from a local gateway for an `ipfs://`/`ipns://` resource.
/// No CID verification: the local node is trusted.
pub async fn fetch_gateway_bytes(gateway: &str, resource: &str) -> Result<Vec<u8>, GatewayError> {
    let url = gateway_resource_url(gateway, resource).map_err(GatewayError::Unreachable)?;
    let opts = gateway_request("GET", resource.starts_with("ipns://"));
    let resp = fetch_with_timeout(&url, &opts, GATEWAY_TIMEOUT_MS)
        .await
        .map_err(GatewayError::Unreachable)?;
    if !resp.ok() {
        return Err(GatewayError::Failed(format!("HTTP {}", resp.status())));
    }
    let promise = resp
        .array_buffer()
        .map_err(|e| GatewayError::Unreachable(format!("{e:?}")))?;
    let buffer = JsFuture::from(promise)
        .await
        .map_err(|e| GatewayError::Unreachable(format!("{e:?}")))?;
    Ok(js_sys::Uint8Array::new(&buffer).to_vec())
}

/// GET UTF-8 text from a local gateway for an `ipfs://`/`ipns://` resource.
pub async fn fetch_gateway_text(gateway: &str, resource: &str) -> Result<String, GatewayError> {
    let url = gateway_resource_url(gateway, resource).map_err(GatewayError::Unreachable)?;
    let opts = gateway_request("GET", resource.starts_with("ipns://"));
    let resp = fetch_with_timeout(&url, &opts, GATEWAY_TIMEOUT_MS)
        .await
        .map_err(GatewayError::Unreachable)?;
    if !resp.ok() {
        return Err(GatewayError::Failed(format!("HTTP {}", resp.status())));
    }
    let promise = resp
        .text()
        .map_err(|e| GatewayError::Unreachable(format!("{e:?}")))?;
    let text = JsFuture::from(promise)
        .await
        .map_err(|e| GatewayError::Unreachable(format!("{e:?}")))?;
    text.as_string()
        .ok_or_else(|| GatewayError::Unreachable("response is not a string".to_string()))
}

/// Resolve an `ipns://…` resource to its current `/ipfs/<cid>` path through a
/// local gateway, without downloading the content.
pub async fn gateway_resolve_ipns(gateway: &str, resource: &str) -> Result<String, GatewayError> {
    let url = gateway_resource_url(gateway, resource).map_err(GatewayError::Unreachable)?;
    let opts = gateway_request("HEAD", true);
    let resp = fetch_with_timeout(&url, &opts, GATEWAY_TIMEOUT_MS)
        .await
        .map_err(GatewayError::Unreachable)?;
    if !resp.ok() {
        return Err(GatewayError::Failed(format!("HTTP {}", resp.status())));
    }
    // A gateway that redirects /ipns/<name> to /ipfs/<cid> exposes the target
    // in the final response URL.
    if let Some(path) = ipfs_path_from_url(&resp.url()) {
        return Ok(path);
    }
    let headers = resp.headers();
    if let Ok(Some(path)) = headers.get("X-Ipfs-Path") {
        if path.starts_with("/ipfs/") {
            return Ok(path);
        }
    }
    if let Ok(Some(roots)) = headers.get("X-Ipfs-Roots") {
        if let Some(first) = roots
            .split(',')
            .map(str::trim)
            .find(|root| !root.is_empty())
        {
            return Ok(if first.starts_with('/') {
                first.to_string()
            } else {
                format!("/ipfs/{first}")
            });
        }
    }
    Err(GatewayError::Failed(format!(
        "no resolved /ipfs path for {resource}"
    )))
}

/// Extract a `/ipfs/<cid>[/path]` suffix from a gateway response URL.
fn ipfs_path_from_url(url: &str) -> Option<String> {
    let (_, rest) = url.split_once("/ipfs/")?;
    let rest = rest.split(['?', '#']).next().unwrap_or(rest);
    if rest.is_empty() {
        None
    } else {
        Some(format!("/ipfs/{rest}"))
    }
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
