//! Minimal WASM-safe HTTP fetch helpers.
//!
//! These are the only HTTP primitives in the codebase. All other modules
//! import from here rather than rolling their own fetch.

use crate::transport::connection::ipfs_gateway_list;
use futures::{pin_mut, FutureExt as _};
use gloo_timers::future::TimeoutFuture;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::JsFuture;

pub struct HttpTextResponse {
    pub status: u16,
    pub body: String,
}

/// GET a URL and return the response body as text.
pub async fn fetch_url_text(url: &str) -> Result<String, String> {
    let window = web_sys::window().ok_or("no window")?;
    let resp_val = JsFuture::from(window.fetch_with_str(url))
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    response_text(resp).await
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
        _ = timeout => {
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

/// GET a URL and return the response body as raw bytes.
pub async fn fetch_url_bytes(url: &str) -> Result<Vec<u8>, String> {
    let window = web_sys::window().ok_or("no window")?;
    let resp_val = JsFuture::from(window.fetch_with_str(url))
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    if !resp.ok() {
        return Err(format!("HTTP {}", resp.status()));
    }
    let buf_val = JsFuture::from(resp.array_buffer().map_err(|e| format!("{e:?}"))?)
        .await
        .map_err(|e| format!("{e:?}"))?;
    Ok(js_sys::Uint8Array::new(&buf_val).to_vec())
}

/// Fetch raw bytes for a bare CID from the active IPFS gateway.
pub async fn fetch_cid_bytes(cid: &str) -> Result<Vec<u8>, String> {
    let mut errors = Vec::new();
    for gateway in ipfs_gateway_list() {
        match fetch_url_bytes(&format!("{gateway}ipfs/{cid}")).await {
            Ok(bytes) => return Ok(bytes),
            Err(e) => errors.push(format!("{gateway}: {e}")),
        }
    }
    Err(errors.join("; "))
}

/// Fetch text for a bare CID from the active IPFS gateway.
pub async fn fetch_cid_text(cid: &str) -> Result<String, String> {
    let mut errors = Vec::new();
    for gateway in ipfs_gateway_list() {
        match fetch_url_text(&format!("{gateway}ipfs/{cid}")).await {
            Ok(text) => return Ok(text),
            Err(e) => errors.push(format!("{gateway}: {e}")),
        }
    }
    Err(errors.join("; "))
}

/// Fetch raw bytes for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). Root `/ipfs/<cid>` links are fetched as raw
/// blocks so zion, not the gateway, owns decoding.
pub async fn fetch_path_bytes(path: &str) -> Result<Vec<u8>, String> {
    let mut errors = Vec::new();
    for gateway in ipfs_gateway_list() {
        for arg in fetch_path_bytes_args(path) {
            let url = format!("{gateway}{arg}");
            match fetch_url_bytes(&url).await {
                Ok(bytes) => return Ok(bytes),
                Err(e) => errors.push(format!("{url}: {e}")),
            }
        }
    }
    Err(errors.join("; "))
}

/// Fetch text for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). See [`fetch_path_bytes`] for details.
pub async fn fetch_path_text(path: &str) -> Result<String, String> {
    let arg = path.trim_start_matches('/').replacen("ipld/", "ipfs/", 1);
    let mut errors = Vec::new();
    for gateway in ipfs_gateway_list() {
        match fetch_url_text(&format!("{gateway}{arg}")).await {
            Ok(text) => return Ok(text),
            Err(e) => errors.push(format!("{gateway}: {e}")),
        }
    }
    Err(errors.join("; "))
}

fn fetch_path_bytes_args(path: &str) -> Vec<String> {
    let trimmed = path.trim_start_matches('/');
    if let Some(root_cid) = root_cid_from_ipfs_path(path) {
        if ipfs_path_has_no_subpath(path) {
            return vec![format!("ipfs/{root_cid}?format=raw"), trimmed.to_string()];
        }
    }
    vec![trimmed.to_string()]
}

fn root_cid_from_ipfs_path(path: &str) -> Option<&str> {
    path.strip_prefix("/ipfs/")?
        .split('/')
        .next()
        .filter(|cid| !cid.is_empty())
}

fn ipfs_path_has_no_subpath(path: &str) -> bool {
    path.strip_prefix("/ipfs/")
        .is_some_and(|rest| !rest.contains('/'))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fetch_path_bytes_uses_raw_gateway_format_for_root_cids() {
        let cbor_cid = cid::Cid::new_v1(
            ma_core::CODEC_DAG_CBOR,
            cid::multihash::Multihash::wrap(0x12, &[42; 32]).unwrap(),
        )
        .to_string();
        let raw_cid = cid::Cid::new_v1(
            ma_core::CODEC_RAW,
            cid::multihash::Multihash::wrap(0x12, &[99; 32]).unwrap(),
        )
        .to_string();

        assert_eq!(
            fetch_path_bytes_args(&format!("/ipfs/{cbor_cid}")),
            vec![
                format!("ipfs/{cbor_cid}?format=raw"),
                format!("ipfs/{cbor_cid}"),
            ]
        );
        assert_eq!(
            fetch_path_bytes_args(&format!("/ipfs/{raw_cid}")),
            vec![
                format!("ipfs/{raw_cid}?format=raw"),
                format!("ipfs/{raw_cid}")
            ]
        );
    }

    #[test]
    fn fetch_path_bytes_keeps_subpaths_on_normal_gateway_path() {
        let ipld_cid = cid::Cid::new_v1(
            ma_core::CODEC_DAG_CBOR,
            cid::multihash::Multihash::wrap(0x12, &[42; 32]).unwrap(),
        )
        .to_string();

        assert_eq!(
            fetch_path_bytes_args(&format!("/ipfs/{ipld_cid}/child")),
            vec![format!("ipfs/{ipld_cid}/child")]
        );
    }
}
