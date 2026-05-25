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
        let exp_secs = incoming.exp as f64 / 1_000_000_000.0;
        cfg.set(format!("{base}.expires_at"), format!("{exp_secs:.3}"));
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
    value.starts_with("did:ma:")
        || (value.starts_with("bafy") && value.len() >= 20)
        || (value.starts_with("Qm") && value.len() >= 20)
}

/// True if `token` is probably a bare CID (not prefixed with a scheme).
#[allow(dead_code)]
pub fn is_probable_cid(token: &str) -> bool {
    (token.starts_with("bafy") || token.starts_with("Qm"))
        && token.len() >= 20
        && token.chars().all(|c| c.is_ascii_alphanumeric())
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
