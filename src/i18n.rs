//! Minimal i18n support for zion.
//!
//! FTL files are embedded at compile time via `include_str!`.
//! Language is selected from `navigator.language` (browser), or
//! overridden via `.config.ui.language` in the user's config.
//!
//! # Usage
//!
//! ```rust
//! // At startup (before mounting components):
//! i18n::init_from_browser();
//!
//! // After config loads, re-apply if user has a preference:
//! if let Some(lang) = cfg.get(".config.ui.language") {
//!     i18n::init(lang);
//! }
//!
//! // Translate a key:
//! let label = t("btn-save");               // → "Save" / "Lagre"
//! let msg   = tf("msg-set", &[("path", ".my.aliases.bob"), ("value", "did:ma:...")]);
//! ```
//!
//! Unknown keys fall back to the key name itself.

use std::cell::RefCell;
use std::collections::HashMap;

thread_local! {
    static MESSAGES: RefCell<HashMap<String, String>> = RefCell::default();
    static CURRENT_LANG: RefCell<String> = RefCell::new("en".into());
}

/// Detect the browser's preferred language and initialise i18n.
///
/// Uses `window.navigator.language`. Falls back to English on any error.
pub fn init_from_browser() {
    let lang = web_sys::window()
        .map(|w| w.navigator().language().unwrap_or_default())
        .unwrap_or_default();
    init(&lang);
}

/// (Re-)initialise i18n for the given language code.
///
/// Accepts BCP-47 tags (`"nb-NO"`, `"nb"`, `"en-US"`, `"en"`, …).
/// Supported: `"en"` (English, default) and `"nb"` / `"nn"` / `"no"` (Norsk bokmål).
pub fn init(lang: &str) {
    let normalized = normalize(lang);
    let ftl: &str = match normalized.as_str() {
        "nb" => include_str!("../lang/nb.ftl"),
        _ => include_str!("../lang/en.ftl"),
    };
    CURRENT_LANG.with(|l| *l.borrow_mut() = normalized);
    MESSAGES.with(|m| *m.borrow_mut() = parse(ftl));
}

/// Return the active language code (`"en"`, `"nb"`, …).
#[allow(dead_code)]
pub fn lang() -> String {
    CURRENT_LANG.with(|l| l.borrow().clone())
}

/// Look up a translation key.
///
/// Returns the localised string, or the key name itself when not found.
pub fn t(key: &str) -> String {
    MESSAGES.with(|m| {
        m.borrow()
            .get(key)
            .cloned()
            .unwrap_or_else(|| key.to_string())
    })
}

/// Look up a translation key and substitute variables.
///
/// `vars` is a slice of `("varname", "value")` pairs.
/// Replaces every `{ $varname }` occurrence in the translated string.
pub fn tf(key: &str, vars: &[(&str, &str)]) -> String {
    let mut s = t(key);
    for (var, val) in vars {
        s = s.replace(&format!("{{ ${var} }}"), val);
    }
    s
}

// ── Internal helpers ───────────────────────────────────────────────────────

/// Normalise a BCP-47 tag to a supported language code.
fn normalize(lang: &str) -> String {
    let base = lang
        .split(['-', '_'])
        .next()
        .unwrap_or("en")
        .to_lowercase();
    match base.as_str() {
        "nb" | "nn" | "no" => "nb".into(),
        _ => "en".into(),
    }
}

/// Parse a subset of FTL: single-line `key = value` entries.
///
/// Ignores blank lines, lines starting with `#` (comments), and
/// continuation lines (those without ` = `).  Only the first occurrence
/// of a key is kept.
fn parse(ftl: &str) -> HashMap<String, String> {
    let mut map = HashMap::new();
    for line in ftl.lines() {
        let trimmed = line.trim_start();
        if trimmed.is_empty() || trimmed.starts_with('#') {
            continue;
        }
        if let Some(eq) = line.find(" = ") {
            let key = line[..eq].trim().to_string();
            let value = line[eq + 3..].to_string();
            map.entry(key).or_insert(value);
        }
    }
    map
}
