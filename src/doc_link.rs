//! Generic link-value resolution for explicitly loaded documents.

use crate::http::{fetch_cid_bytes, fetch_cid_text};
use ma_core::CODEC_DAG_CBOR;
use std::collections::BTreeMap;

/// Resolved content of a linked document.
pub enum ResolvedDocContent {
    /// Plain text loaded from a non-DAG-CBOR CID.
    Text(String),
    /// A structured manifest loaded from a DAG-CBOR CID.
    Manifest(BTreeMap<String, String>),
}

/// Strip an optional `/ipfs/` or `/ipld/` prefix and parse the remainder as a CID.
pub fn parse_link_cid(value: &str) -> Option<cid::Cid> {
    let trimmed = value.trim();
    let stripped = trimmed
        .strip_prefix("/ipfs/")
        .or_else(|| trimmed.strip_prefix("/ipld/"))
        .unwrap_or(trimmed);
    stripped.parse::<cid::Cid>().ok()
}

/// Resolve an explicitly requested document link.
///
/// Startup uses this to load the manifest selected by `.my.z`.
pub async fn resolve_doc_link(value: &str) -> Result<ResolvedDocContent, String> {
    let Some(cid) = parse_link_cid(value) else {
        return Ok(ResolvedDocContent::Text(value.to_string()));
    };
    let cid_str = cid.to_string();
    if cid.codec() == CODEC_DAG_CBOR {
        let bytes = fetch_cid_bytes(&cid_str).await?;
        let map: BTreeMap<String, String> =
            serde_ipld_dagcbor::from_slice(&bytes).map_err(|error| error.to_string())?;
        Ok(ResolvedDocContent::Manifest(map))
    } else {
        let text = fetch_cid_text(&cid_str).await?;
        Ok(ResolvedDocContent::Text(text))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parse_link_cid_bare() {
        assert!(
            parse_link_cid("bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy").is_some()
        );
    }

    #[test]
    fn parse_link_cid_ipfs_prefixed() {
        assert!(parse_link_cid(
            "/ipfs/bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy"
        )
        .is_some());
    }

    #[test]
    fn parse_link_cid_ipld_prefixed() {
        assert!(parse_link_cid(
            "/ipld/bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy"
        )
        .is_some());
    }

    #[test]
    fn parse_link_cid_rejects_literal_text() {
        assert!(parse_link_cid("(define (foo) 42)").is_none());
        assert!(parse_link_cid("").is_none());
    }
}
