/// Dot-notation config tree for ego.
///
/// Keys follow a dot-notation hierarchy, e.g.:
///   .my.aliases.fjodor  → did:ma:<...>
///   .my.home            → did:ma:<...>#actor
///   .my.did             → did:ma:<...>
///   .my.config.colour.alias     → #ffd700
///   .my.config.colour.text      → #00ff41
///   .my.config.colour.pending   → #004d00
///   .my.config.colour.replied   → #00ff41
///   .my.config.screensaver.timeout → 300
///
/// The tree is stored as a flat HashMap<String, String> in IndexedDB
/// (per-user) and serialized as JSON.
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

use crate::identity::storage::{load_config, save_config};

// ── Types ──────────────────────────────────────────────────────────────────

#[derive(Clone, Debug, Default, Serialize, Deserialize)]
pub struct EgoConfig {
    pub tree: HashMap<String, String>,
}

impl EgoConfig {
    pub fn new() -> Self {
        let mut cfg = Self::default();
        cfg.set_defaults();
        cfg
    }

    fn set_defaults(&mut self) {
        let defaults = [
            (".my.config.colour.text", "#00ff41"),
            (".my.config.colour.dimmed", "#008f11"),
            (".my.config.colour.pending", "#004d00"),
            (".my.config.colour.replied", "#00ff41"),
            (".my.config.colour.alias", "#ffd700"),
            (".my.config.colour.error", "#ff3333"),
            (".my.config.colour.system", "#888888"),
            (".my.config.colour.bg", "#0d0d0d"),
            (".my.config.colour.input_bg", "#0a0a0a"),
            (".my.config.colour.border", "#003300"),
            (".my.config.colour.cursor", "#00ff41"),
            (".my.config.colour.highlight", "#003300"),
            (".my.config.screensaver.timeout", "300"),
            (".my.config.editor.placement", "bottom"),
            (".my.config.editor.persistent", "false"),
        ];
        for (k, v) in &defaults {
            self.tree
                .entry(k.to_string())
                .or_insert_with(|| v.to_string());
        }
    }

    // ── CRUD ──────────────────────────────────────────────────────────────

    pub fn get(&self, key: &str) -> Option<&str> {
        self.tree.get(key).map(|s| s.as_str())
    }

    pub fn set(&mut self, key: impl Into<String>, value: impl Into<String>) {
        self.tree.insert(key.into(), value.into());
    }

    /// Read-only keys may not be written via `.key: value`. Currently only
    /// `.my.identity.did`, which is injected from the active session.
    pub fn is_read_only(key: &str) -> bool {
        key == ".my.identity.did"
    }

    /// True if `key` is an exact leaf (a value is stored at that path).
    pub fn is_leaf(&self, key: &str) -> bool {
        self.tree.contains_key(key)
    }

    /// True if any stored key has `key` as a strict dot-prefix — i.e. `key`
    /// is a subtree (e.g. `.my.aliases` when `.my.aliases.fjodor` exists).
    pub fn has_children(&self, key: &str) -> bool {
        let prefix = format!("{key}.");
        self.tree.keys().any(|k| k.starts_with(&prefix))
    }

    /// True if a strict ancestor of `key` is itself a leaf — setting `key`
    /// would shadow an existing value.
    pub fn has_leaf_ancestor(&self, key: &str) -> bool {
        let mut cur = key;
        while let Some(idx) = cur.rfind('.') {
            cur = &cur[..idx];
            if cur.is_empty() {
                break;
            }
            if self.tree.contains_key(cur) {
                return true;
            }
        }
        false
    }

    /// Delete every key matching `key` exactly OR sharing it as a dot-prefix.
    /// Returns the number of entries removed.
    pub fn delete_subtree(&mut self, key: &str) -> usize {
        let prefix = format!("{key}.");
        let victims: Vec<String> = self
            .tree
            .keys()
            .filter(|k| k.as_str() == key || k.starts_with(&prefix))
            .cloned()
            .collect();
        let n = victims.len();
        for k in victims {
            self.tree.remove(&k);
        }
        n
    }

    #[allow(dead_code)]
    pub fn delete(&mut self, key: &str) -> bool {
        self.tree.remove(key).is_some()
    }

    /// List all key=value pairs whose key starts with `prefix`.
    pub fn list(&self, prefix: &str) -> Vec<(&str, &str)> {
        let mut entries: Vec<(&str, &str)> = self
            .tree
            .iter()
            .filter(|(k, _)| k.starts_with(prefix))
            .map(|(k, v)| (k.as_str(), v.as_str()))
            .collect();
        entries.sort_by_key(|(k, _)| *k);
        entries
    }

    // ── Aliases ────────────────────────────────────────────────────────────

    pub fn resolve_alias(&self, name: &str) -> Option<&str> {
        let key = format!(".my.aliases.{name}");
        self.tree.get(&key).map(|s| s.as_str())
    }

    /// Reverse-lookup: given a DID, return the alias name (without `@`), if any.
    pub fn reverse_alias<'a>(&'a self, did: &str) -> Option<&'a str> {
        const PREFIX: &str = ".my.aliases.";
        self.tree
            .iter()
            .find(|(k, v)| k.starts_with(PREFIX) && v.as_str() == did)
            .map(|(k, _)| &k[PREFIX.len()..])
    }

    // ── Colour helpers ─────────────────────────────────────────────────────

    #[allow(dead_code)]
    pub fn colour_alias(&self) -> &str {
        self.get(".my.config.colour.alias").unwrap_or("#ffd700")
    }

    #[allow(dead_code)]
    pub fn colour_text(&self) -> &str {
        self.get(".my.config.colour.text").unwrap_or("#00ff41")
    }

    #[allow(dead_code)]
    pub fn screensaver_timeout_secs(&self) -> u64 {
        self.get(".my.config.screensaver.timeout")
            .and_then(|v| v.parse().ok())
            .unwrap_or(300)
    }

    // ── Serialization ──────────────────────────────────────────────────────

    pub fn to_json(&self) -> Result<String, String> {
        serde_json::to_string(&self).map_err(|e| e.to_string())
    }

    pub fn from_json(json: &str) -> Result<Self, String> {
        serde_json::from_str(json).map_err(|e| e.to_string())
    }

    // ── Profile serialization / merge ─────────────────────────────────────

    /// Prefixes included when serialising the portable profile blob.
    /// Explicitly excluded: .my.inbox.*, .my.identity.*, .my.ma.*,
    /// .profiles.* (local CID index, ephemeral), .my.acl (security-sensitive).
    const PROFILE_PREFIXES: &'static [&'static str] = &[
        ".my.aliases.",
        ".my.doc.",
        ".my.i18n",
        ".my.config.",
        ".my.profile.",
    ];

    /// The canonical key for the last profile publish timestamp (RFC3339 UTC string).
    /// Compared against `Document.updated_at` on startup to detect IPNS staleness.
    pub const PROFILE_PUBLISHED_AT_KEY: &'static str = ".my.profile.published_at";

    /// Serialize the portable profile subtrees to CBOR bytes.
    /// Only keys matching `PROFILE_PREFIXES` are included.
    pub fn serialize_profile_subtrees(&self) -> Result<Vec<u8>, String> {
        let selected: HashMap<&str, &str> = self
            .tree
            .iter()
            .filter(|(k, _)| {
                Self::PROFILE_PREFIXES
                    .iter()
                    .any(|prefix| k.as_str() == *prefix || k.starts_with(prefix))
            })
            .map(|(k, v)| (k.as_str(), v.as_str()))
            .collect();
        serde_ipld_dagcbor::to_vec(&selected).map_err(|e| e.to_string())
    }

    /// Replace the profile subtrees in this config with data from a remote profile blob.
    /// All local keys matching `PROFILE_PREFIXES` are removed first, then the remote
    /// keys are inserted wholesale — preventing buildup of stale aliases, inbox entries,
    /// and other profile data.
    pub fn merge_profile(&mut self, cbor_bytes: &[u8]) -> Result<usize, String> {
        let map: HashMap<String, String> =
            serde_ipld_dagcbor::from_slice(cbor_bytes).map_err(|e| e.to_string())?;
        // Remove all local keys covered by the profile prefixes so that old aliases
        // and similar data do not accumulate across profile fetches.
        self.tree.retain(|k, _| {
            !Self::PROFILE_PREFIXES
                .iter()
                .any(|prefix| k == *prefix || k.starts_with(prefix))
        });
        let count = map.len();
        for (k, v) in map {
            self.tree.insert(k, v);
        }
        Ok(count)
    }
}

// ── Persistence ────────────────────────────────────────────────────────────

pub async fn persist_config(username: &str, cfg: &EgoConfig) -> Result<(), String> {
    let json = cfg.to_json()?;
    save_config(username, &json).await
}

pub async fn restore_config(username: &str) -> Result<EgoConfig, String> {
    match load_config(username).await? {
        Some(json) => {
            let mut cfg = EgoConfig::from_json(&json)?;
            cfg.set_defaults();
            Ok(cfg)
        }
        None => Ok(EgoConfig::new()),
    }
}
