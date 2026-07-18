//! Minimal WASM-safe HTTP fetch helpers.
//!
//! These are the only HTTP primitives in the codebase. All other modules
//! import from here rather than rolling their own fetch.

use crate::transport::connection::LOCAL_GATEWAY_URL;

/// GET a URL and return the response body as text.
pub async fn fetch_url_text(url: &str) -> Result<String, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;

    let window = web_sys::window().ok_or("no window")?;
    let resp_val = JsFuture::from(window.fetch_with_str(url))
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
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
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;

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

/// Fetch raw bytes for a bare CID from the local IPFS gateway.
pub async fn fetch_cid_bytes(cid: &str) -> Result<Vec<u8>, String> {
    fetch_url_bytes(&format!("{LOCAL_GATEWAY_URL}ipfs/{cid}")).await
}

/// Fetch text for a bare CID from the local IPFS gateway.
pub async fn fetch_cid_text(cid: &str) -> Result<String, String> {
    fetch_url_text(&format!("{LOCAL_GATEWAY_URL}ipfs/{cid}")).await
}

/// Fetch raw bytes for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). `/ipld/` is currently routed identically to
/// `/ipfs/` (aliased, no separate DAG-CBOR handling yet). The gateway
/// resolves `/ipns/` transparently — no client-side resolution needed.
pub async fn fetch_path_bytes(path: &str) -> Result<Vec<u8>, String> {
    let arg = path.trim_start_matches('/').replacen("ipld/", "ipfs/", 1);
    fetch_url_bytes(&format!("{LOCAL_GATEWAY_URL}{arg}")).await
}

/// Fetch text for a `/ipfs/<cid>`, `/ipns/<key>`, or `/ipld/<cid>` path
/// (user-facing path syntax). See [`fetch_path_bytes`] for details.
pub async fn fetch_path_text(path: &str) -> Result<String, String> {
    let arg = path.trim_start_matches('/').replacen("ipld/", "ipfs/", 1);
    fetch_url_text(&format!("{LOCAL_GATEWAY_URL}{arg}")).await
}
