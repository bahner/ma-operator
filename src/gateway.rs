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
//! gateway that fails is retried after a short cooldown (reads fall back to the
//! public path meanwhile) without changing the saved preference, so one
//! transient local failure cannot silently downgrade the whole session to
//! upstream content delivery.

use std::cell::{Cell, RefCell};
use web_time::{Duration, Instant};

/// Local gateway used when local mode is selected but no URL has been entered.
pub const DEFAULT_LOCAL_URL: &str = "http://localhost:8080";

/// How long a failed local-gateway read keeps using the public path before the
/// local gateway is tried again. A transient failure (Kubo restarting, one slow
/// or aborted read) must not divert the rest of the session to upstream.
pub const LOCAL_RETRY_COOLDOWN_MS: u64 = 30_000;

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
    /// While set and in the future, reads take the public path after a recent
    /// local-gateway failure. It expires on its own, so the local gateway is
    /// re-probed rather than abandoned for the rest of the session.
    static LOCAL_RETRY_AT: Cell<Option<Instant>> = const { Cell::new(None) };
}

/// Whether a local-gateway failure still suppresses local reads at `now`.
fn cooldown_active(retry_at: Option<Instant>, now: Instant) -> bool {
    retry_at.is_some_and(|deadline| now < deadline)
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
/// `None` when public mode is active or a recent local failure is still cooling
/// down.
#[must_use]
pub fn active_local_url() -> Option<String> {
    let cooling_down = LOCAL_RETRY_AT.with(|at| cooldown_active(at.get(), Instant::now()));
    if cooling_down {
        return None;
    }
    local_url()
}

/// Record that the local gateway failed; reads fall back to the public path for
/// [`LOCAL_RETRY_COOLDOWN_MS`], after which local is tried again.
pub fn mark_local_unavailable() {
    let retry_at = Instant::now() + Duration::from_millis(LOCAL_RETRY_COOLDOWN_MS);
    LOCAL_RETRY_AT.with(|at| at.set(Some(retry_at)));
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
    LOCAL_RETRY_AT.with(|at| at.set(None));
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
    let url = preferred_url();
    apply(mode, &url);
    match mode {
        Mode::Local => log::info!("[gateway] IPFS backend: local gateway {url}"),
        Mode::Public => log::info!("[gateway] IPFS backend: public verified-fetch"),
    }
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

#[cfg(test)]
mod tests {
    use super::{cooldown_active, LOCAL_RETRY_COOLDOWN_MS};
    use web_time::{Duration, Instant};

    #[test]
    fn cooldown_expires_after_the_deadline() {
        let now = Instant::now();
        assert!(!cooldown_active(None, now));
        assert!(cooldown_active(Some(now + Duration::from_millis(1)), now));
        let deadline = now + Duration::from_millis(LOCAL_RETRY_COOLDOWN_MS);
        assert!(!cooldown_active(Some(deadline), deadline));
    }
}
