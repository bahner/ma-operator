use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::state::AppState;
use crate::views::{landing::Landing, screensaver::Screensaver, terminal::Terminal};

/// Read `?ma=` from the URL — a runtime DID or HTTP URL to connect to after login.
///
/// - `?ma=did:ma:<ipns>`  → remote runtime DID (shows privacy warning on landing page)
/// - `?ma=http://...`     → local/LAN runtime HTTP URL
fn url_ma() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    let val = params.get("ma")?.trim().to_string();
    if val.is_empty() {
        None
    } else {
        Some(val)
    }
}

/// Read `?msg=`, `?say=`, or `?emote=` from the current URL and return the
/// pre-filled terminal input string, or `None` if absent.
///
/// - `?msg=<did>`   → `@<did> `        (plain text message)
/// - `?say=<did>`   → `@<did>:say `    (say verb RPC)
/// - `?emote=<did>` → `@<did>:emote `  (emote verb RPC)
fn url_prefill() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    if let Some(target) = params.get("msg") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target} "));
        }
    }
    if let Some(target) = params.get("say") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target}:say "));
        }
    }
    if let Some(target) = params.get("emote") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target}:emote "));
        }
    }
    None
}

/// Read `?ctx=` from the URL — a DID-URL to auto-focus after login.
/// Accepts `@alias#fragment`, `@alias`, `did:ma:…#fragment` forms.
///
/// The `#fragment` part of a ctx value is a URL fragment and is
/// stripped by the browser from `location.search`.  We recover it
/// from `location.hash` and re-attach it when the ctx value does not
/// already contain a `#`.  This means both
///   `?ctx=@sky%23room`   (percent-encoded, explicit)
///   `?ctx=@sky#room`     (natural, fragment split by browser)
/// produce the same result: `"@sky#room"`.
fn url_ctx() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let hash = window.location().hash().ok().unwrap_or_default();
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    let target = params.get("ctx")?.trim().to_string();
    if target.is_empty() {
        return None;
    }
    // If ctx has no '#' but the URL hash has one, the browser split it.
    if !target.contains('#') && hash.starts_with('#') {
        Some(format!("{target}{hash}"))
    } else {
        Some(target)
    }
}

#[component]
pub fn App() -> impl IntoView {
    let state = AppState::new();
    provide_context(state.clone());
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());
    provide_context(config);

    // Parse URL params once at startup.
    if let Some(prefill) = url_prefill() {
        state.prefill_input.set(Some(prefill));
    }
    // ?ctx=<target> — auto-apply .use <target> after login.
    if let Some(ctx) = url_ctx() {
        state.startup_ctx.set(Some(ctx));
    }
    // ?ma=<runtime> — runtime DID or URL, pre-fills the runtime field on the landing page.
    if let Some(ma) = url_ma() {
        state.startup_ma.set(Some(ma));
    }

    view! {
        <div id="app">
            <Screensaver/>
            <Show
                when=move || state.session.get().is_none()
                fallback=move || view! { <Terminal/> }
            >
                <Landing/>
            </Show>
        </div>
    }
}
