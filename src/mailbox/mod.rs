//! EgoConfig-backed inbox storage.
//!
//! Incoming `application/x-ma-message` messages are stored as flat leaves
//! in EgoConfig under `.my.inbox.<N>.*`, where N is a stable non-negative
//! integer.  Indices may have gaps after deletion — always list first.

use crate::config::EgoConfig;
use crate::i18n::t;
use crate::messages::IncomingMessage;
use ma_core::MESSAGE_TYPE_MESSAGE;
use std::collections::BTreeSet;

const INBOX_PREFIX: &str = ".my.inbox.";

// ── Index helpers ─────────────────────────────────────────────────────────

/// Scan existing `.my.inbox.*` keys and return the next available index.
pub fn next_inbox_index(cfg: &EgoConfig) -> usize {
    let entries = cfg.list(INBOX_PREFIX);
    let max = entries
        .iter()
        .filter_map(|(k, _)| {
            let tail = &k[INBOX_PREFIX.len()..];
            tail.split('.').next()?.parse::<usize>().ok()
        })
        .max();
    max.map_or(0, |m| m + 1)
}

/// Count distinct `.my.inbox.<N>` subtrees.
pub fn inbox_count(cfg: &EgoConfig) -> usize {
    let entries = cfg.list(INBOX_PREFIX);
    let indices: BTreeSet<&str> = entries
        .iter()
        .filter_map(|(k, _)| {
            let tail = &k[INBOX_PREFIX.len()..];
            let idx_str = tail.split('.').next()?;
            idx_str.parse::<usize>().ok()?;
            Some(idx_str)
        })
        .collect();
    indices.len()
}

// ── Ingestion ─────────────────────────────────────────────────────────────

/// Write all leaves for one incoming message into `cfg`.
/// Only `MESSAGE_TYPE_MESSAGE` messages are stored; others are ignored.
pub fn ingest_to_config(incoming: &IncomingMessage, cfg: &mut EgoConfig) {
    if incoming.message_type != MESSAGE_TYPE_MESSAGE {
        return;
    }
    let n = next_inbox_index(cfg);
    let base = format!("{INBOX_PREFIX}{n}");

    cfg.set(format!("{base}.from"), incoming.from.as_str());
    // `.sender` is the link-leaf used for lazy DID traversal (Phase 4).
    cfg.set(format!("{base}.sender"), incoming.from.as_str());
    cfg.set(
        format!("{base}.content_type"),
        incoming.content_type.as_str(),
    );
    cfg.set(
        format!("{base}.content"),
        String::from_utf8_lossy(&incoming.content).as_ref(),
    );
    cfg.set(format!("{base}.message_id"), incoming.message_id.as_str());
    cfg.set(
        format!("{base}.received_at"),
        format!("{:.3}", now_unix_secs()),
    );
    if let Some(ref rt) = incoming.reply_to {
        cfg.set(format!("{base}.reply_to"), rt.as_str());
    }
    if incoming.exp != 0 {
        cfg.set(format!("{base}.expires_at"), format!("{}", incoming.exp));
    }
}

// ── Expiry pruning ────────────────────────────────────────────────────────

/// Remove inbox entries whose `expires_at` is in the past.
/// Returns the number of keys removed (not the number of entries).
pub fn prune_inbox_expired(cfg: &mut EgoConfig, now_secs: f64) -> usize {
    let expired: BTreeSet<String> = {
        cfg.list(INBOX_PREFIX)
            .into_iter()
            .filter_map(|(k, v)| {
                let tail = &k[INBOX_PREFIX.len()..];
                let mut parts = tail.split('.');
                let idx_str = parts.next()?;
                let field = parts.next()?;
                if field == "expires_at" {
                    if let Ok(exp) = v.parse::<f64>() {
                        if exp < now_secs {
                            return Some(idx_str.to_string());
                        }
                    }
                }
                None
            })
            .collect()
    };
    let mut removed = 0usize;
    for idx in &expired {
        removed += cfg.delete_subtree(&format!("{INBOX_PREFIX}{idx}"));
    }
    removed
}

// ── Misc helpers ──────────────────────────────────────────────────────────

pub fn now_unix_secs() -> f64 {
    js_sys::Date::now() / 1000.0
}

/// True if `value` looks like an IPFS CID or a `did:ma:` DID — i.e. a
/// link-leaf that supports lazy sub-path traversal.
pub fn is_link_value(value: &str) -> bool {
    value.starts_with("did:ma:") || value.parse::<cid::Cid>().is_ok()
}

/// True if `token` is a valid bare CID (CIDv0 or CIDv1, any codec).
#[allow(dead_code)]
pub fn is_probable_cid(token: &str) -> bool {
    token.parse::<cid::Cid>().is_ok()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn make_cfg() -> EgoConfig {
        EgoConfig::default()
    }

    // ── is_link_value ─────────────────────────────────────────────────────

    #[test]
    fn is_link_value_did_ma() {
        assert!(is_link_value(
            "did:ma:k51qzi5uqu5dhl2je7b6t6j2qovwjhbmv2q3j9k"
        ));
    }

    #[test]
    fn is_link_value_cidv1_bafy() {
        assert!(is_link_value(
            "bafybeigdyrzt5sfp7udm7hu76uh7y26nf3efuylqabf3oclgtqy55fbzdi"
        ));
    }

    #[test]
    fn is_link_value_cidv1_bafkrei() {
        assert!(is_link_value(
            "bafkreiajw63hfajj5r2vonnzd46v2gyk5ppaklusvyay45x7jf25bm2igm"
        ));
    }

    #[test]
    fn is_link_value_cidv0_qm() {
        assert!(is_link_value(
            "QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG"
        ));
    }

    #[test]
    fn is_link_value_short_cid_not_link() {
        assert!(!is_link_value("bafyshort"));
    }

    #[test]
    fn is_link_value_plain_string_not_link() {
        assert!(!is_link_value("hello world"));
    }

    // ── is_probable_cid ───────────────────────────────────────────────────

    #[test]
    fn is_probable_cid_cidv1_bafy() {
        assert!(is_probable_cid(
            "bafybeigdyrzt5sfp7udm7hu76uh7y26nf3efuylqabf3oclgtqy55fbzdi"
        ));
    }

    #[test]
    fn is_probable_cid_cidv1_bafkrei() {
        assert!(is_probable_cid(
            "bafkreiajw63hfajj5r2vonnzd46v2gyk5ppaklusvyay45x7jf25bm2igm"
        ));
    }

    #[test]
    fn is_probable_cid_cidv0_qm() {
        assert!(is_probable_cid(
            "QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG"
        ));
    }

    #[test]
    fn is_probable_cid_with_non_alphanumeric_not_cid() {
        assert!(!is_probable_cid("bafy/path/component"));
    }

    #[test]
    fn is_probable_cid_too_short_not_cid() {
        assert!(!is_probable_cid("Qmshort"));
    }

    // ── next_inbox_index / inbox_count ────────────────────────────────────

    #[test]
    fn next_inbox_index_empty_cfg_is_zero() {
        let cfg = make_cfg();
        assert_eq!(next_inbox_index(&cfg), 0);
    }

    #[test]
    fn inbox_count_empty_cfg_is_zero() {
        let cfg = make_cfg();
        assert_eq!(inbox_count(&cfg), 0);
    }

    #[test]
    fn next_inbox_index_after_manual_entry() {
        let mut cfg = make_cfg();
        cfg.set(".my.inbox.0.from", "did:ma:test");
        cfg.set(".my.inbox.0.content", "hello");
        assert_eq!(next_inbox_index(&cfg), 1);
    }

    #[test]
    fn inbox_count_after_manual_entry() {
        let mut cfg = make_cfg();
        cfg.set(".my.inbox.0.from", "did:ma:test");
        cfg.set(".my.inbox.2.from", "did:ma:other"); // gap
        assert_eq!(inbox_count(&cfg), 2);
    }

    // ── prune_inbox_expired ───────────────────────────────────────────────

    #[test]
    fn prune_removes_expired_entries() {
        let mut cfg = make_cfg();
        cfg.set(".my.inbox.0.from", "did:ma:test");
        cfg.set(".my.inbox.0.expires_at", "1000.000"); // far in the past
        let removed = prune_inbox_expired(&mut cfg, 9_999_999.0);
        assert!(removed > 0, "should have removed at least one key");
        assert_eq!(inbox_count(&cfg), 0);
    }

    #[test]
    fn prune_keeps_non_expired_entries() {
        let mut cfg = make_cfg();
        cfg.set(".my.inbox.0.from", "did:ma:test");
        cfg.set(".my.inbox.0.expires_at", "9999999999.0"); // far in the future
        let removed = prune_inbox_expired(&mut cfg, 1_000.0);
        assert_eq!(removed, 0);
        assert_eq!(inbox_count(&cfg), 1);
    }

    #[test]
    fn prune_keeps_entries_without_expires_at() {
        let mut cfg = make_cfg();
        cfg.set(".my.inbox.0.from", "did:ma:test");
        // No expires_at set — should never be pruned.
        let removed = prune_inbox_expired(&mut cfg, 9_999_999.0);
        assert_eq!(removed, 0);
    }
}

#[allow(dead_code)]
pub fn open_target(target: &str) -> Result<(), String> {
    let window = web_sys::window().ok_or_else(|| "no browser window".to_string())?;
    let opened = window
        .open_with_url_and_target(target, "_blank")
        .map_err(|e| format!("open failed: {e:?}"))?;
    if opened.is_some() {
        Ok(())
    } else {
        Err(t("err-popup-blocked"))
    }
}
