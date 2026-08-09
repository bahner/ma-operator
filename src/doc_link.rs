//! Generic link-value resolution for `.my.*` doc leaves.
//!
//! A doc leaf (e.g. `.my.z.scheme`) may hold either literal content — today's
//! behaviour, unchanged — or a link to content addressed elsewhere: a bare
//! CID, or a `/ipfs/<cid>` / `/ipld/<cid>` path. This module detects that
//! case and resolves it, picking a codec-appropriate fetch based on the
//! CID's own multicodec (`cid::Cid::codec()`) — no network round-trip is
//! needed to decide which branch to take. Applies to any `.my.*` doc path;
//! never special-cased to a particular one.

use crate::http::{fetch_cid_bytes, fetch_cid_text};
use ma_core::CODEC_DAG_CBOR;
use std::collections::BTreeMap;

/// Resolved content of a `.my.*` doc leaf, after link resolution.
pub enum ResolvedDocContent {
    /// Plain text — literal content, or fetched from a non-dag-cbor CID.
    Text(String),
    /// A structured manifest — fetched from a dag-cbor CID.
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

/// Resolve a doc leaf's stored value.
///
/// Literal content (anything that doesn't parse as a CID/link) is returned
/// unchanged as `Text`. A link value is fetched; its codec picks the
/// interpretation: `dag-cbor` decodes as a `Manifest`, anything else fetches
/// as plain `Text`.
pub async fn resolve_doc_link(value: &str) -> Result<ResolvedDocContent, String> {
    let Some(cid) = parse_link_cid(value) else {
        return Ok(ResolvedDocContent::Text(value.to_string()));
    };
    let cid_str = cid.to_string();
    if cid.codec() == CODEC_DAG_CBOR {
        let bytes = fetch_cid_bytes(&cid_str).await?;
        let map: BTreeMap<String, String> =
            serde_ipld_dagcbor::from_slice(&bytes).map_err(|e| e.to_string())?;
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
