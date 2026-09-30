//! Trustless IPFS retrieval via the `@helia/verified-fetch` JS shim
//! (`www/ipfs.js`).
//!
//! All content/DID/IPNS reads go through `window.maIpfs`, which verifies every
//! byte against its CID and falls back to trustless gateways + delegated
//! routing. ma-core carries no IPFS backend on wasm, so the browser supplies
//! its own here.

use ma_core::DidDocumentResolver;
use wasm_bindgen::prelude::*;
use wasm_bindgen_futures::JsFuture;

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = ["window", "maIpfs"], js_name = "fetchBytes")]
    fn js_fetch_bytes(resource: &str) -> js_sys::Promise;

    #[wasm_bindgen(js_namespace = ["window", "maIpfs"], js_name = "fetchText")]
    fn js_fetch_text(resource: &str) -> js_sys::Promise;

    #[wasm_bindgen(js_namespace = ["window", "maIpfs"], js_name = "resolveIpns")]
    fn js_resolve_ipns(resource: &str) -> js_sys::Promise;
}

/// Normalize a user-facing content path into a verified-fetch resource string.
///
/// Accepts `ipfs://…` / `ipns://…` (passed through), `/ipfs/…` / `/ipns/…` /
/// `/ipld/…` (converted to `…://…`), or a bare CID / IPNS key (treated as
/// `ipfs://…`).
#[must_use]
pub fn to_verified_resource(path: &str) -> String {
    let trimmed = path.trim();
    if trimmed.starts_with("ipfs://") || trimmed.starts_with("ipns://") {
        return trimmed.to_string();
    }
    let trimmed = trimmed.trim_start_matches('/');
    for (prefix, scheme) in [
        ("ipfs/", "ipfs://"),
        ("ipns/", "ipns://"),
        ("ipld/", "ipfs://"),
    ] {
        if let Some(rest) = trimmed.strip_prefix(prefix) {
            return format!("{scheme}{rest}");
        }
    }
    format!("ipfs://{trimmed}")
}

async fn js_value(promise: js_sys::Promise) -> Result<JsValue, String> {
    JsFuture::from(promise).await.map_err(|e| format!("{e:?}"))
}

/// Fetch raw bytes (no JSON round-tripping) for a content resource.
pub async fn fetch_bytes(resource: &str) -> Result<Vec<u8>, String> {
    let value = js_value(js_fetch_bytes(resource)).await?;
    Ok(js_sys::Uint8Array::new(&value).to_vec())
}

/// Fetch UTF-8 text for a content resource.
pub async fn fetch_text(resource: &str) -> Result<String, String> {
    let value = js_value(js_fetch_text(resource)).await?;
    value
        .as_string()
        .ok_or_else(|| "ipfs response is not a string".to_string())
}

/// DID/IPNS resolver backed by the verified-fetch shim — the browser's
/// [`DidDocumentResolver`]: DID documents are fetched trustlessly via IPNS and
/// verified with `Document::decode` / `validate` / `verify`.
pub struct JsVerifiedResolver;

impl JsVerifiedResolver {
    /// Resolve an `/ipns/<name>` reference to its current `/ipfs/<cid>` path.
    ///
    /// Best-effort: relies on the shim exposing the resolved path. Use
    /// [`DidDocumentResolver::resolve`] for full document resolution.
    pub async fn resolve_ipns_path(&self, path: &str) -> ma_core::Result<String> {
        if !path.starts_with("/ipns/") || path.len() <= "/ipns/".len() {
            return Err(ma_core::Error::IpnsResolution {
                path: path.to_string(),
                detail: "expected a non-empty /ipns/<name> path".to_string(),
            });
        }
        let resource = to_verified_resource(path);
        match js_value(js_resolve_ipns(&resource)).await {
            Ok(value) => value
                .as_string()
                .ok_or_else(|| ma_core::Error::IpnsResolution {
                    path: path.to_string(),
                    detail: "resolved path is not a string".to_string(),
                }),
            Err(detail) => Err(ma_core::Error::IpnsResolution {
                path: path.to_string(),
                detail,
            }),
        }
    }
}

/// Decode, validate, and verify a DID document from raw DAG-CBOR bytes.
#[cfg(target_arch = "wasm32")]
fn parse_document(bytes: &[u8]) -> Result<ma_core::Document, String> {
    let document = ma_core::Document::decode(bytes).map_err(|e| e.to_string())?;
    document.validate().map_err(|e| e.to_string())?;
    document.verify().map_err(|e| e.to_string())?;
    Ok(document)
}

#[cfg_attr(target_arch = "wasm32", async_trait::async_trait(?Send))]
#[cfg_attr(not(target_arch = "wasm32"), async_trait::async_trait)]
impl DidDocumentResolver for JsVerifiedResolver {
    async fn resolve(&self, did: &str) -> ma_core::Result<ma_core::Document> {
        resolve_document(did).await
    }
}

/// Browser-side DID resolution. Wasm-only because it awaits `JsFuture`, which
/// is `!Send` and therefore cannot satisfy the native `DidDocumentResolver`
/// (`Send`) bound. The native build exists only for unit tests.
#[cfg(target_arch = "wasm32")]
async fn resolve_document(did: &str) -> ma_core::Result<ma_core::Document> {
    let parsed = ma_core::Did::try_from(did).map_err(ma_core::Error::Validation)?;
    let did_key = parsed.base_id();
    let resource = format!("ipns://{}", parsed.ipns);
    let bytes = fetch_bytes(&resource)
        .await
        .map_err(|detail| ma_core::Error::Resolution {
            did: did_key.clone(),
            detail,
        })?;
    parse_document(&bytes).map_err(|detail| ma_core::Error::Resolution {
        did: did_key,
        detail,
    })
}

/// Native stub: the operator only resolves DIDs in the browser. Returns an
/// already-resolved error future so the `Send` trait bound holds without
/// touching `JsFuture` (which is `!Send`).
#[cfg(not(target_arch = "wasm32"))]
fn resolve_document(did: &str) -> std::future::Ready<ma_core::Result<ma_core::Document>> {
    std::future::ready(Err(ma_core::Error::Resolution {
        did: did.to_string(),
        detail: "verified-fetch resolution is browser-only".to_string(),
    }))
}

#[cfg(test)]
mod tests {
    use super::to_verified_resource;

    #[test]
    fn verified_resource_passthrough_and_conversion() {
        assert_eq!(to_verified_resource("ipfs://bafy"), "ipfs://bafy");
        assert_eq!(to_verified_resource("ipns://k51abc"), "ipns://k51abc");
        assert_eq!(to_verified_resource("/ipfs/bafy"), "ipfs://bafy");
        assert_eq!(
            to_verified_resource("/ipfs/bafy/child"),
            "ipfs://bafy/child"
        );
        assert_eq!(to_verified_resource("/ipns/k51abc"), "ipns://k51abc");
        assert_eq!(to_verified_resource("/ipld/bafy"), "ipfs://bafy");
        assert_eq!(to_verified_resource("bafy"), "ipfs://bafy");
    }
}
