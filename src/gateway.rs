//! IPFS gateway selection: the public trustless path (`@helia/verified-fetch`)
//! or a local Kubo HTTP gateway.
//!
//! Operator is frequently served from the same host as a local `ma` runtime,
//! which means a Kubo daemon — and its HTTP gateway — is reachable. Reading
//! through that gateway is simpler and faster than trustless retrieval and
//! needs no CID verification, because the node is trusted. On a public host the
//! default stays the verified-fetch path.
//!
//! The active choice lives in a thread-local, seeded by
//! [`init_from_environment`] from the serving hostname and any explicit choice
//! persisted in `localStorage`. Only explicit user choices are persisted, so
//! the host-based default remains the fallback on a fresh browser. A local
//! gateway that proves unreachable is disabled for the session (reads fall back
//! to the public path) without changing the saved preference.

use std::cell::{Cell, RefCell};

/// Local gateway used when local mode is selected but no URL has been entered.
pub const DEFAULT_LOCAL_URL: &str = "http://localhost:8080";

const MODE_KEY: &str = "operator_ipfs_mode";
const URL_KEY: &str = "operator_ipfs_gateway";

/// Which IPFS backend operator reads through.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Mode {
    /// Trustless retrieval via the verified-fetch shim (default off-host).
    Public,
    /// Plain HTTP against a local Kubo gateway; content is trusted, not verified.
    Local,
}

thread_local! {
    /// `None` is [`Mode::Public`]; `Some(url)` is [`Mode::Local`].
    static LOCAL_URL: RefCell<Option<String>> = const { RefCell::new(None) };
    /// Set for the session once the local gateway proves unreachable; reads then
    /// go to the public path until local is explicitly re-selected.
    static LOCAL_DOWN: Cell<bool> = const { Cell::new(false) };
}

/// Hostnames that imply a co-located `ma` runtime (and therefore Kubo).
fn is_local_host(host: &str) -> bool {
    matches!(host, "localhost" | "127.0.0.1" | "::1" | "[::1]")
}

fn normalise_url(url: &str) -> String {
    let trimmed = url.trim().trim_end_matches('/');
    if trimmed.is_empty() {
        DEFAULT_LOCAL_URL.to_string()
    } else {
        trimmed.to_string()
    }
}

fn storage() -> Option<web_sys::Storage> {
    web_sys::window().and_then(|window| window.local_storage().ok().flatten())
}

fn storage_get(key: &str) -> Option<String> {
    storage()
        .and_then(|store| store.get_item(key).ok().flatten())
        .filter(|value| !value.is_empty())
}

fn storage_set(key: &str, value: &str) {
    if let Some(store) = storage() {
        let _ = store.set_item(key, value);
    }
}

/// The active gateway mode (the configured choice, not the transient fallback).
#[must_use]
pub fn mode() -> Mode {
    if local_url().is_some() {
        Mode::Local
    } else {
        Mode::Public
    }
}

/// The configured local gateway URL, or `None` when the public path is active.
#[must_use]
pub fn local_url() -> Option<String> {
    LOCAL_URL.with(|url| url.borrow().clone())
}

/// The local gateway URL to use for a read right now: the configured URL, or
/// `None` when public mode is active *or* the gateway has failed this session.
#[must_use]
pub fn active_local_url() -> Option<String> {
    if LOCAL_DOWN.with(Cell::get) {
        return None;
    }
    local_url()
}

/// Record that the local gateway is unreachable; reads fall back to the public
/// path for the rest of the session until local is re-selected.
pub fn mark_local_unavailable() {
    LOCAL_DOWN.with(|down| down.set(true));
}

/// The local gateway URL regardless of mode — the last selected URL, or the
/// default. Seeds the URL field in the config tab.
#[must_use]
pub fn preferred_url() -> String {
    storage_get(URL_KEY).map_or_else(|| DEFAULT_LOCAL_URL.to_string(), |url| normalise_url(&url))
}

fn apply(mode: Mode, url: &str) {
    let stored = match mode {
        Mode::Local => Some(url.to_string()),
        Mode::Public => None,
    };
    LOCAL_URL.with(|slot| *slot.borrow_mut() = stored);
    LOCAL_DOWN.with(|down| down.set(false));
}

/// Seed the active gateway from the serving hostname and any persisted choice.
/// Must run before the first IPFS read.
pub fn init_from_environment() {
    let host = web_sys::window()
        .and_then(|window| window.location().hostname().ok())
        .unwrap_or_default();
    let default = if is_local_host(&host) {
        Mode::Local
    } else {
        Mode::Public
    };
    let mode = match storage_get(MODE_KEY).as_deref() {
        Some("local") => Mode::Local,
        Some("public") => Mode::Public,
        _ => default,
    };
    apply(mode, &preferred_url());
}

/// Apply and persist an explicit user choice.
pub fn select(mode: Mode, url: &str) {
    let url = normalise_url(url);
    apply(mode, &url);
    storage_set(URL_KEY, &url);
    storage_set(
        MODE_KEY,
        match mode {
            Mode::Local => "local",
            Mode::Public => "public",
        },
    );
}
