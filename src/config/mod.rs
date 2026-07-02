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

use ma_zscheme::DotRegistry;

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

    /// Read-only keys may not be written or deleted.
    /// `.my` and `.my.identity` (including all children) are protected roots.
    pub fn is_read_only(key: &str) -> bool {
        key == ".my" || key == ".my.identity" || key.starts_with(".my.identity.")
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

    /// Returns true if a key should be included in the profile blob.
    /// Profile is all of `.my.*` — no exceptions.
    fn is_profile_key(k: &str) -> bool {
        k == ".my" || k.starts_with(".my.")
    }

    /// The canonical key for the last profile publish timestamp (RFC3339 UTC string).
    /// Compared against `Document.updated_at` on startup to detect IPNS staleness.
    pub const PROFILE_PUBLISHED_AT_KEY: &'static str = ".my.profile.published_at";

    /// Expand `.my.*` flat keys into a nested JSON map, stripping the `.my.` prefix.
    /// `.my.config.colour.bg = "#fff"` → `{"config": {"colour": {"bg": "#fff"}}}`.
    /// Used when building the IPFS profile blob.
    pub fn profile_to_nested_json(&self) -> serde_json::Value {
        let mut root = serde_json::Map::new();
        for (key, value) in &self.tree {
            if let Some(path) = key.strip_prefix(".my.") {
                let parts: Vec<&str> = path.split('.').collect();
                Self::insert_nested(&mut root, &parts, value.clone());
            }
        }
        serde_json::Value::Object(root)
    }

    fn insert_nested(
        obj: &mut serde_json::Map<String, serde_json::Value>,
        parts: &[&str],
        value: String,
    ) {
        if parts.is_empty() {
            return;
        }
        if parts.len() == 1 {
            obj.insert(parts[0].to_string(), serde_json::Value::String(value));
            return;
        }
        let entry = obj
            .entry(parts[0].to_string())
            .or_insert_with(|| serde_json::Value::Object(serde_json::Map::new()));
        if let serde_json::Value::Object(ref mut nested) = entry {
            Self::insert_nested(nested, &parts[1..], value);
        }
    }

    /// Replace the `.my.*` profile keys in this config from the nested `"my"` field
    /// of a profile blob. Flattens the nested structure back to `.my.*` flat keys.
    /// Returns `(count_of_keys_merged, username)`.
    pub fn merge_from_nested_profile(
        &mut self,
        profile: &serde_json::Value,
    ) -> Result<(usize, String), String> {
        let username = profile
            .get("username")
            .and_then(|v| v.as_str())
            .unwrap_or("")
            .to_string();
        let my = profile
            .get("my")
            .ok_or_else(|| "profile missing 'my' field".to_string())?;
        self.tree.retain(|k, _| !Self::is_profile_key(k.as_str()));
        let mut flat = HashMap::new();
        Self::flatten_nested(".my", my, &mut flat);
        let count = flat.len();
        self.tree.extend(flat);
        Ok((count, username))
    }

    fn flatten_nested(prefix: &str, val: &serde_json::Value, out: &mut HashMap<String, String>) {
        match val {
            serde_json::Value::Object(map) => {
                for (k, v) in map {
                    let new_prefix = format!("{}.{}", prefix, k);
                    Self::flatten_nested(&new_prefix, v, out);
                }
            }
            serde_json::Value::String(s) => {
                out.insert(prefix.to_string(), s.clone());
            }
            other => {
                out.insert(prefix.to_string(), other.to_string());
            }
        }
    }

    /// Return a copy of this config containing only profile keys (`.my.*`).
    /// Used when building the IPFS profile blob.
    pub fn for_profile(&self) -> Self {
        let tree = self
            .tree
            .iter()
            .filter(|(k, _)| Self::is_profile_key(k.as_str()))
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        Self { tree }
    }

    /// Return a copy of this config suitable for file export.
    /// Excludes `.ctx.ma.*` (device-specific runtime state).
    pub fn for_export(&self) -> Self {
        let tree = self
            .tree
            .iter()
            .filter(|(k, _)| !k.starts_with(".ctx.ma."))
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        Self { tree }
    }
}

// ── DotRegistry impl ──────────────────────────────────────────────────────

/// EgoConfig stores keys with a leading `.` (e.g. `.my.aliases.foo`).
/// DotRegistry paths may arrive without it; we normalise by adding it.
fn ego_key(path: &str) -> String {
    if path.starts_with('.') {
        path.to_string()
    } else {
        format!(".{path}")
    }
}

impl DotRegistry for EgoConfig {
    fn get(&self, path: &str) -> Option<String> {
        EgoConfig::get(self, &ego_key(path)).map(|s| s.to_string())
    }

    fn set(&mut self, path: &str, value: &str) {
        EgoConfig::set(self, ego_key(path), value);
    }

    fn delete_subtree(&mut self, path: &str) {
        EgoConfig::delete_subtree(self, &ego_key(path));
    }

    fn list(&self, prefix: &str) -> Vec<(String, String)> {
        EgoConfig::list(self, &ego_key(prefix))
            .into_iter()
            .map(|(k, v)| (k.to_string(), v.to_string()))
            .collect()
    }

    fn resolve_alias(&self, name: &str) -> Option<String> {
        EgoConfig::resolve_alias(self, name.trim_start_matches('@')).map(|s| s.to_string())
    }

    fn is_read_only(&self, path: &str) -> bool {
        EgoConfig::is_read_only(&ego_key(path))
    }
}

// ── Persistence ────────────────────────────────────────────────────────────────

pub async fn persist_config(username: &str, cfg: &EgoConfig) -> Result<(), String> {
    let json = cfg.to_json()?;
    save_config(username, &json).await
}

pub async fn restore_config(username: &str) -> Result<EgoConfig, String> {
    match load_config(username).await? {
        Some(json) => {
            let mut cfg = EgoConfig::from_json(&json)?;
            cfg.tree.retain(|k, _| {
                k.starts_with(".my.") || k.starts_with(".ctx.") || k.starts_with(".ma.")
            });
            cfg.set_defaults();
            Ok(cfg)
        }
        None => Ok(EgoConfig::new()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn bare() -> EgoConfig {
        EgoConfig::default()
    }

    // ── get / set ─────────────────────────────────────────────────────────

    #[test]
    fn get_missing_returns_none() {
        assert!(bare().get(".my.aliases.nobody").is_none());
    }

    #[test]
    fn set_then_get() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert_eq!(cfg.get(".my.aliases.alice"), Some("did:ma:abc"));
    }

    #[test]
    fn set_overwrites() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        cfg.set(".my.i18n", "sv");
        assert_eq!(cfg.get(".my.i18n"), Some("sv"));
    }

    // ── new() applies defaults ─────────────────────────────────────────────

    #[test]
    fn new_has_colour_defaults() {
        let cfg = EgoConfig::new();
        assert_eq!(cfg.get(".my.config.colour.text"), Some("#00ff41"));
        assert_eq!(cfg.get(".my.config.colour.alias"), Some("#ffd700"));
        assert_eq!(cfg.get(".my.config.screensaver.timeout"), Some("300"));
    }

    #[test]
    fn new_does_not_overwrite_existing() {
        let mut cfg = bare();
        cfg.set(".my.config.colour.text", "#ffffff");
        cfg.set_defaults();
        assert_eq!(cfg.get(".my.config.colour.text"), Some("#ffffff"));
    }

    // ── is_read_only ──────────────────────────────────────────────────────

    #[test]
    fn protected_roots_are_read_only() {
        assert!(EgoConfig::is_read_only(".my"));
        assert!(EgoConfig::is_read_only(".my.identity"));
        assert!(EgoConfig::is_read_only(".my.identity.did"));
        assert!(EgoConfig::is_read_only(".my.identity.signing_key"));
    }

    #[test]
    fn other_keys_not_read_only() {
        assert!(!EgoConfig::is_read_only(".my.aliases.alice"));
        assert!(!EgoConfig::is_read_only(".my.i18n"));
        assert!(!EgoConfig::is_read_only(".my.gossip.topic"));
    }

    // ── is_leaf / has_children / has_leaf_ancestor ────────────────────────

    #[test]
    fn is_leaf_present() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        assert!(cfg.is_leaf(".my.i18n"));
    }

    #[test]
    fn is_leaf_absent() {
        assert!(!bare().is_leaf(".my.i18n"));
    }

    #[test]
    fn has_children_true() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert!(cfg.has_children(".my.aliases"));
        assert!(cfg.has_children(".my"));
    }

    #[test]
    fn has_children_false_for_leaf() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        assert!(!cfg.has_children(".my.i18n"));
    }

    #[test]
    fn has_leaf_ancestor_true() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        // .my.i18n is a leaf; trying to set .my.i18n.subtag would have an ancestor leaf
        assert!(cfg.has_leaf_ancestor(".my.i18n.subtag"));
    }

    #[test]
    fn has_leaf_ancestor_false() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert!(!cfg.has_leaf_ancestor(".my.aliases.bob"));
    }

    // ── delete / delete_subtree ───────────────────────────────────────────

    #[test]
    fn delete_existing_key() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        assert!(cfg.delete(".my.i18n"));
        assert!(cfg.get(".my.i18n").is_none());
    }

    #[test]
    fn delete_absent_key_returns_false() {
        assert!(!bare().delete(".my.nonexistent"));
    }

    #[test]
    fn delete_subtree_removes_exact_and_children() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:a");
        cfg.set(".my.aliases.bob", "did:ma:b");
        cfg.set(".my.i18n", "nb");
        let n = cfg.delete_subtree(".my.aliases");
        assert_eq!(n, 2);
        assert!(cfg.get(".my.aliases.alice").is_none());
        assert!(cfg.get(".my.aliases.bob").is_none());
        assert_eq!(cfg.get(".my.i18n"), Some("nb")); // untouched
    }

    #[test]
    fn delete_subtree_exact_leaf() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        assert_eq!(cfg.delete_subtree(".my.i18n"), 1);
        assert!(cfg.get(".my.i18n").is_none());
    }

    #[test]
    fn delete_subtree_absent_returns_zero() {
        assert_eq!(bare().delete_subtree(".my.aliases"), 0);
    }

    // ── list ──────────────────────────────────────────────────────────────

    #[test]
    fn list_prefix_sorted() {
        let mut cfg = bare();
        cfg.set(".my.aliases.bob", "did:ma:b");
        cfg.set(".my.aliases.alice", "did:ma:a");
        let entries = cfg.list(".my.aliases.");
        // Keys come back sorted
        assert_eq!(entries[0].0, ".my.aliases.alice");
        assert_eq!(entries[1].0, ".my.aliases.bob");
    }

    #[test]
    fn list_empty_prefix() {
        assert!(bare().list(".my.aliases.").is_empty());
    }

    // ── resolve_alias / reverse_alias ─────────────────────────────────────

    #[test]
    fn resolve_alias_found() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert_eq!(cfg.resolve_alias("alice"), Some("did:ma:abc"));
    }

    #[test]
    fn resolve_alias_missing() {
        assert!(bare().resolve_alias("nobody").is_none());
    }

    #[test]
    fn reverse_alias_found() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert_eq!(cfg.reverse_alias("did:ma:abc"), Some("alice"));
    }

    #[test]
    fn reverse_alias_missing() {
        assert!(bare().reverse_alias("did:ma:unknown").is_none());
    }

    // ── JSON round-trip ───────────────────────────────────────────────────

    #[test]
    fn json_roundtrip() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        cfg.set(".my.aliases.alice", "did:ma:abc");
        let json = cfg.to_json().unwrap();
        let restored = EgoConfig::from_json(&json).unwrap();
        assert_eq!(restored.get(".my.i18n"), Some("nb"));
        assert_eq!(restored.get(".my.aliases.alice"), Some("did:ma:abc"));
    }

    #[test]
    fn from_json_invalid_fails() {
        assert!(EgoConfig::from_json("not json").is_err());
    }
}
