/// Path config tree for ego.
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
/// The tree is stored as a flat `HashMap`<String, String> in `IndexedDB`
/// (per-user) and serialised as JSON.
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
            (".my.config.colour.editor.background", "#0d0d0d"),
            (".my.config.screensaver.timeout", "300"),
            (".my.config.editor.placement", "bottom"),
            (".my.config.editor.persistent", "false"),
            (".my.ctx.tail.length", "100"),
            (".my.z.scheme", ""),
        ];
        for (k, v) in &defaults {
            self.tree
                .entry(k.to_string())
                .or_insert_with(|| v.to_string());
        }
    }

    // ── CRUD ──────────────────────────────────────────────────────────────

    pub fn get(&self, key: &str) -> Option<&str> {
        self.tree.get(key).map(std::string::String::as_str)
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
        self.tree.get(&key).map(std::string::String::as_str)
    }

    /// Reverse-lookup: given a DID or DID-URL, return the alias name (without `@`), if any.
    pub fn reverse_alias<'a>(&'a self, did_url: &str) -> Option<&'a str> {
        const PREFIX: &str = ".my.aliases.";
        self.tree
            .iter()
            .find(|(k, v)| k.starts_with(PREFIX) && v.as_str() == did_url)
            .map(|(k, _)| &k[PREFIX.len()..])
    }

    /// Split `did_url` (a `did:ma:<id>` DID or a `did:ma:<id>#fragment`
    /// DID-URL) into `(alias, fragment)` when a known alias matches. Exact
    /// DID-URL aliases win; otherwise a DID alias is reused with the fragment
    /// preserved. `alias` is returned without any `@` prefix so callers can
    /// format it as needed (plain for emote/chat text, `@alias` otherwise).
    /// Returns `None` when no matching alias exists.
    pub fn split_alias(&self, did_url: &str) -> Option<(String, Option<String>)> {
        if let Some(alias) = self.reverse_alias(did_url) {
            return Some((alias.to_string(), None));
        }
        let (base, frag) = did_url.split_once('#').unwrap_or((did_url, ""));
        let alias = self.reverse_alias(base)?.to_string();
        let frag = if frag.is_empty() {
            None
        } else {
            Some(frag.to_string())
        };
        Some((alias, frag))
    }

    pub fn alias_display(&self, did_url: &str) -> Option<String> {
        match self.split_alias(did_url) {
            Some((alias, Some(frag))) => Some(format!("@{alias}#{frag}")),
            Some((alias, None)) => Some(format!("@{alias}")),
            None => None,
        }
    }

    fn did_token_len(text: &str) -> usize {
        const PREFIX: &str = "did:ma:";
        if !text.starts_with(PREFIX) {
            return 0;
        }
        let after_prefix = &text[PREFIX.len()..];
        let id_len = after_prefix
            .find(|c: char| !c.is_ascii_alphanumeric())
            .unwrap_or(after_prefix.len());
        let mut len = PREFIX.len() + id_len;
        let tail = &text[len..];
        if let Some(stripped) = tail.strip_prefix('#') {
            let frag_len = stripped
                .find(|c: char| !(c.is_ascii_alphanumeric() || c == '_' || c == '-'))
                .unwrap_or(stripped.len());
            if frag_len > 0 {
                len += 1 + frag_len;
            }
        }
        len
    }

    pub fn substitute_display_dids(&self, text: &str) -> String {
        const PREFIX: &str = "did:ma:";
        let mut out = String::with_capacity(text.len());
        let mut rest = text;
        loop {
            let Some(pos) = rest.find(PREFIX) else {
                out.push_str(rest);
                return out;
            };
            let actor_ref = pos > 0 && rest.as_bytes()[pos - 1] == b'@';
            let before_end = if actor_ref { pos - 1 } else { pos };
            out.push_str(&rest[..before_end]);

            let token_len = Self::did_token_len(&rest[pos..]);
            if token_len == 0 {
                if actor_ref {
                    out.push('@');
                }
                out.push_str(PREFIX);
                rest = &rest[pos + PREFIX.len()..];
                continue;
            }
            let did_url = &rest[pos..pos + token_len];
            if let Some(alias) = self.alias_display(did_url) {
                out.push_str(&alias);
            } else {
                if actor_ref {
                    out.push('@');
                }
                out.push_str(did_url);
            }
            rest = &rest[pos + token_len..];
        }
    }

    /// Scan free-form text for `@did:ma:<id>[#fragment]` occurrences — i.e.
    /// an actor reference, not a bare DID value — and replace each with
    /// `@<alias>` (or `@<alias>#<fragment>`) whenever a matching alias is
    /// known (this includes the user's own DID, if they have aliased
    /// themselves, e.g. `@me`). Only DIDs prefixed with `@` are considered;
    /// a bare `did:ma:…` with no leading `@` is left untouched, since it is
    /// not being used as an actor reference. DIDs with no matching alias are
    /// also left unchanged (still prefixed with `@`).
    ///
    /// A backslash immediately before the `@` escapes it, mirroring the
    /// outbound `\@name` convention in `parser/alias.rs::resolve_targets`:
    /// `\@did:ma:…` has the backslash stripped and is never alias-substituted,
    /// even when a matching alias exists.
    #[cfg(test)]
    pub fn substitute_dids(&self, text: &str) -> String {
        const PREFIX: &str = "@did:ma:";
        let mut out = String::with_capacity(text.len());
        let mut rest = text;
        loop {
            let Some(pos) = rest.find(PREFIX) else {
                out.push_str(rest);
                return out;
            };
            let escaped = pos > 0 && rest.as_bytes()[pos - 1] == b'\\';
            if escaped {
                // Strip the backslash, emit the literal "@did:ma:" prefix,
                // and never look up an alias for what follows.
                out.push_str(&rest[..pos - 1]);
                out.push_str(PREFIX);
                rest = &rest[pos + PREFIX.len()..];
                continue;
            }
            out.push_str(&rest[..pos]);
            let token_len = Self::did_token_len(&rest[pos + 1..]);
            let did_url = &rest[pos + 1..pos + 1 + token_len];
            out.push('@');
            match self.split_alias(did_url) {
                Some((alias, Some(f))) => {
                    out.push_str(&alias);
                    out.push('#');
                    out.push_str(&f);
                }
                Some((alias, None)) => out.push_str(&alias),
                None => out.push_str(did_url),
            }
            rest = &rest[pos + 1 + token_len..];
        }
    }

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

    // ── Profile serialisation / merge ─────────────────────────────────────

    /// Returns true if a key should be included in the profile blob.
    /// Profile is all of `.my.*` — no exceptions.
    fn is_profile_key(k: &str) -> bool {
        k == ".my" || k.starts_with(".my.")
    }

    /// The canonical key for the last profile publish timestamp (RFC3339 UTC string).
    /// Compared against `Document.updated_at` on startup to detect IPNS staleness.
    pub const PROFILE_PUBLISHED_AT_KEY: &'static str = ".my.profile.published_at";

    /// The canonical key for the last published profile blob CID.
    /// Restored into session state before DID document publishing.
    pub const PROFILE_CID_KEY: &'static str = ".my.profile.cid";

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
                    let new_prefix = format!("{prefix}.{k}");
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
            .filter(|(k, _)| {
                Self::is_profile_key(k.as_str()) && k.as_str() != ".my.aliases.ma"
            })
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        Self { tree }
    }

    /// Return a copy containing only persistent profile state.
    fn for_persistence(&self) -> Self {
        let tree = self
            .tree
            .iter()
            .filter(|(k, _)| k.starts_with(".my.") && k.as_str() != ".my.aliases.ma")
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        Self { tree }
    }

    /// Return a copy of this config suitable for file export.
    /// Excludes the session-only `.ma` tree.
    pub fn for_export(&self) -> Self {
        self.for_persistence()
    }

    fn migrate_slash_keys(&mut self) {
        let old = std::mem::take(&mut self.tree);
        for (key, value) in old.iter().filter(|(key, _)| !Self::legacy_key(key)) {
            self.tree.insert(key.clone(), value.clone());
        }
        for (key, value) in old.iter().filter(|(key, _)| Self::legacy_key(key)) {
            if let Some(migrated) = Self::migrate_key(key) {
                self.tree.entry(migrated).or_insert_with(|| value.clone());
            }
        }
        let moved: Vec<(String, String, String)> = self
            .tree
            .iter()
            .filter_map(|(key, value)| {
                Self::migrate_ma_ctx_key(key).map(|migrated| (key.clone(), migrated, value.clone()))
            })
            .collect();
        for (old_key, migrated, value) in moved {
            self.tree.entry(migrated).or_insert(value);
            self.tree.remove(&old_key);
        }
    }

    fn legacy_key(key: &str) -> bool {
        key == "/my" || key.starts_with("/my/") || key == "/ctx" || key.starts_with("/ctx/")
    }

    fn migrate_key(key: &str) -> Option<String> {
        match key {
            "/my" => Some(".my".to_string()),
            "/ctx" => None,
            _ => key
                .strip_prefix("/my/")
                .map(|path| format!(".my.{}", path.replace('/', ".")))
                .or_else(|| {
                    key.strip_prefix("/ctx/ma")
                        .map(|path| format!(".ma.ctx{}", path.replace('/', ".")))
                }),
        }
    }

    fn migrate_ma_ctx_key(key: &str) -> Option<String> {
        key.strip_prefix(".ctx.ma")
            .map(|path| format!(".ma.ctx{path}"))
    }
}

// ── DotRegistry impl ──────────────────────────────────────────────────────

/// `EgoConfig` stores keys with a leading `.` (e.g. `.my.aliases.foo`).
/// `DotRegistry` paths may arrive without it; we normalise by adding it.
fn ego_key(path: &str) -> String {
    if path.starts_with('.') || path.starts_with('/') {
        path.to_string()
    } else {
        format!(".{path}")
    }
}

impl DotRegistry for EgoConfig {
    fn get(&self, path: &str) -> Option<String> {
        EgoConfig::get(self, &ego_key(path)).map(std::string::ToString::to_string)
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
        EgoConfig::resolve_alias(self, name.trim_start_matches('@'))
            .map(std::string::ToString::to_string)
    }

    fn is_read_only(&self, path: &str) -> bool {
        EgoConfig::is_read_only(&ego_key(path))
    }
}

// ── Persistence ────────────────────────────────────────────────────────────────

pub async fn persist_config(username: &str, cfg: &EgoConfig) -> Result<(), String> {
    let json = cfg.for_persistence().to_json()?;
    save_config(username, &json).await
}

pub async fn restore_config(username: &str) -> Result<EgoConfig, String> {
    match load_config(username).await? {
        Some(json) => {
            let mut cfg = EgoConfig::from_json(&json)?;
            cfg.migrate_slash_keys();
            cfg.tree.retain(|k, _| k.starts_with(".my."));
            cfg.delete(".my.aliases.ma");
            cfg.set_defaults();
            let json = cfg.for_persistence().to_json()?;
            save_config(username, &json).await?;
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
        assert_eq!(cfg.get(".my.z.scheme"), Some(""));
        assert_eq!(cfg.get(".my.z.avatar"), None);
    }

    #[test]
    fn new_does_not_overwrite_existing() {
        let mut cfg = bare();
        cfg.set(".my.config.colour.text", "#ffffff");
        cfg.set(".my.z.avatar", "(define (custom-avatar) :ok)");
        cfg.set_defaults();
        assert_eq!(cfg.get(".my.config.colour.text"), Some("#ffffff"));
        assert_eq!(
            cfg.get(".my.z.avatar"),
            Some("(define (custom-avatar) :ok)")
        );
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
    fn reverse_alias_finds_did_url() {
        let mut cfg = bare();
        cfg.set(".my.aliases.home", "did:ma:abc#room");
        assert_eq!(cfg.reverse_alias("did:ma:abc#room"), Some("home"));
    }

    #[test]
    fn reverse_alias_missing() {
        assert!(bare().reverse_alias("did:ma:unknown").is_none());
    }

    // ── split_alias ─────────────────────────────────────────────────────────

    #[test]
    fn split_alias_found_no_fragment() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert_eq!(
            cfg.split_alias("did:ma:abc"),
            Some(("alice".to_string(), None))
        );
    }

    #[test]
    fn split_alias_found_with_fragment() {
        let mut cfg = bare();
        cfg.set(".my.aliases.alice", "did:ma:abc");
        assert_eq!(
            cfg.split_alias("did:ma:abc#room"),
            Some(("alice".to_string(), Some("room".to_string())))
        );
    }

    #[test]
    fn split_alias_exact_did_url_wins() {
        let mut cfg = bare();
        cfg.set(".my.aliases.sky", "did:ma:abc");
        cfg.set(".my.aliases.home", "did:ma:abc#room");
        assert_eq!(
            cfg.split_alias("did:ma:abc#room"),
            Some(("home".to_string(), None))
        );
        assert_eq!(
            cfg.split_alias("did:ma:abc#garden"),
            Some(("sky".to_string(), Some("garden".to_string())))
        );
    }

    #[test]
    fn split_alias_missing() {
        assert!(bare().split_alias("did:ma:unknown").is_none());
    }

    // ── substitute_dids ─────────────────────────────────────────────────────

    #[test]
    fn substitute_dids_replaces_own_aliased_did() {
        let mut cfg = bare();
        cfg.set(".my.aliases.me", "did:ma:k51qzabc");
        assert_eq!(
            cfg.substitute_dids("The owner is @did:ma:k51qzabc."),
            "The owner is @me."
        );
    }

    #[test]
    fn substitute_dids_preserves_fragment() {
        let mut cfg = bare();
        cfg.set(".my.aliases.sky", "did:ma:k51qzabc");
        assert_eq!(
            cfg.substitute_dids("target is @did:ma:k51qzabc#room"),
            "target is @sky#room"
        );
    }

    #[test]
    fn substitute_dids_prefers_exact_did_url_alias() {
        let mut cfg = bare();
        cfg.set(".my.aliases.sky", "did:ma:k51qzabc");
        cfg.set(".my.aliases.home", "did:ma:k51qzabc#room");
        assert_eq!(
            cfg.substitute_dids("target is @did:ma:k51qzabc#room"),
            "target is @home"
        );
    }

    #[test]
    fn substitute_display_dids_replaces_bare_did_url() {
        let mut cfg = bare();
        cfg.set(".my.aliases.sky", "did:ma:k51qzabc");
        assert_eq!(
            cfg.substitute_display_dids("did:ma:k51qzabc#room arrives."),
            "@sky#room arrives."
        );
    }

    #[test]
    fn substitute_display_dids_prefers_exact_did_url_alias() {
        let mut cfg = bare();
        cfg.set(".my.aliases.sky", "did:ma:k51qzabc");
        cfg.set(".my.aliases.home", "did:ma:k51qzabc#room");
        assert_eq!(
            cfg.substitute_display_dids("did:ma:k51qzabc#room arrives."),
            "@home arrives."
        );
        assert_eq!(
            cfg.substitute_display_dids("@did:ma:k51qzabc#room arrives."),
            "@home arrives."
        );
    }

    #[test]
    fn substitute_dids_leaves_unknown_did_unchanged() {
        assert_eq!(
            bare().substitute_dids("The owner is @did:ma:unknownid."),
            "The owner is @did:ma:unknownid."
        );
    }

    #[test]
    fn substitute_dids_handles_multiple_occurrences() {
        let mut cfg = bare();
        cfg.set(".my.aliases.me", "did:ma:aaa");
        cfg.set(".my.aliases.sky", "did:ma:bbb");
        assert_eq!(
            cfg.substitute_dids("from @did:ma:bbb to @did:ma:aaa"),
            "from @sky to @me"
        );
    }

    #[test]
    fn substitute_dids_no_did_present() {
        assert_eq!(bare().substitute_dids("no dids here"), "no dids here");
    }

    #[test]
    fn substitute_dids_leaves_bare_did_without_at_prefix_unchanged() {
        let mut cfg = bare();
        cfg.set(".my.aliases.me", "did:ma:k51qzabc");
        // No leading '@' — not an actor reference, must not be touched.
        assert_eq!(
            cfg.substitute_dids("The owner is did:ma:k51qzabc."),
            "The owner is did:ma:k51qzabc."
        );
    }

    #[test]
    fn substitute_dids_escaped_backslash_not_aliased() {
        let mut cfg = bare();
        cfg.set(".my.aliases.me", "did:ma:k51qzabc");
        // Backslash-escaped: stripped, but NOT alias-substituted even though
        // a matching alias exists.
        assert_eq!(
            cfg.substitute_dids(r"The owner is \@did:ma:k51qzabc."),
            "The owner is @did:ma:k51qzabc."
        );
    }

    #[test]
    fn substitute_dids_escaped_unknown_did_still_stripped() {
        // Escaping still strips the backslash even when there's no alias to
        // avoid — the escape itself is unconditional.
        assert_eq!(
            bare().substitute_dids(r"see \@did:ma:unknownid here"),
            "see @did:ma:unknownid here"
        );
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
    fn persistence_excludes_entire_live_ma_tree() {
        let mut cfg = bare();
        cfg.set(".my.i18n", "nb");
        cfg.set(".my.aliases.ma", "did:ma:runtime");
        cfg.set(".ma.ctx.did", "did:ma:runtime");
        cfg.set(".ma.live.peer", "did:ma:peer");

        let persisted = cfg.for_persistence();

        assert_eq!(persisted.get(".my.i18n"), Some("nb"));
        assert_eq!(persisted.get(".my.aliases.ma"), None);
        assert!(!persisted.has_children(".ma"));
    }

    #[test]
    fn migrate_slash_keys_rewrites_local_roots() {
        let mut cfg = bare();
        cfg.set("/my/aliases/alice", "did:ma:abc");
        cfg.set("/ctx/ma/url", "http://localhost:5003");

        cfg.migrate_slash_keys();

        assert_eq!(cfg.get(".my.aliases.alice"), Some("did:ma:abc"));
        assert_eq!(cfg.get(".ma.ctx.url"), Some("http://localhost:5003"));
        assert!(cfg.get("/my/aliases/alice").is_none());
        assert!(cfg.get("/ctx/ma/url").is_none());
        assert!(cfg.get(".ctx.ma.url").is_none());
    }

    #[test]
    fn migrate_slash_keys_rewrites_old_dot_ma_context() {
        let mut cfg = bare();
        cfg.set(".ctx.ma.did", "did:ma:abc");

        cfg.migrate_slash_keys();

        assert_eq!(cfg.get(".ma.ctx.did"), Some("did:ma:abc"));
        assert!(cfg.get(".ctx.ma.did").is_none());
    }

    #[test]
    fn migrate_slash_keys_keeps_existing_dot_value() {
        let mut cfg = bare();
        cfg.set("/my/i18n", "nb");
        cfg.set(".my.i18n", "sv");

        cfg.migrate_slash_keys();

        assert_eq!(cfg.get(".my.i18n"), Some("sv"));
    }

    #[test]
    fn from_json_invalid_fails() {
        assert!(EgoConfig::from_json("not json").is_err());
    }
}
