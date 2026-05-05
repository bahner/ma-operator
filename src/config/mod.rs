/// Dot-notation config tree for ego.
///
/// Keys follow a dot-notation hierarchy, e.g.:
///   .my.aliases.fjodor  → did:ma:<...>
///   .my.home            → did:ma:<...>#actor
///   .my.did             → did:ma:<...>
///   .config.colour.alias     → #ffd700
///   .config.colour.text      → #00ff41
///   .config.screensaver.timeout → 300
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
            (".config.colour.text", "#00ff41"),
            (".config.colour.dimmed", "#008f11"),
            (".config.colour.alias", "#ffd700"),
            (".config.colour.error", "#ff3333"),
            (".config.colour.system", "#888888"),
            (".config.colour.bg", "#0d0d0d"),
            (".config.screensaver.timeout", "300"),
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

    pub fn add_alias(&mut self, name: &str, did: &str) {
        let key = format!(".my.aliases.{name}");
        self.tree.insert(key, did.to_string());
    }

    pub fn remove_alias(&mut self, name: &str) -> bool {
        let key = format!(".my.aliases.{name}");
        self.tree.remove(&key).is_some()
    }

    pub fn resolve_alias(&self, name: &str) -> Option<&str> {
        let key = format!(".my.aliases.{name}");
        self.tree.get(&key).map(|s| s.as_str())
    }

    pub fn list_aliases(&self) -> Vec<(&str, &str)> {
        self.list(".my.aliases.")
    }

    // ── Colour helpers ─────────────────────────────────────────────────────

    #[allow(dead_code)]
    pub fn colour_alias(&self) -> &str {
        self.get(".config.colour.alias").unwrap_or("#ffd700")
    }

    #[allow(dead_code)]
    pub fn colour_text(&self) -> &str {
        self.get(".config.colour.text").unwrap_or("#00ff41")
    }

    #[allow(dead_code)]
    pub fn screensaver_timeout_secs(&self) -> u64 {
        self.get(".config.screensaver.timeout")
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
