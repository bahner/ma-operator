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
/// - `?msg=<did>`   → `@<did>!msg `    (plain text message command)
/// - `?say=<did>`   → `@<did>!say `    (local chat message command)
/// - `?emote=<did>` → `@<did>!emote `  (local emote message command)
fn url_prefill() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    if let Some(target) = params.get("msg") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target}!msg "));
        }
    }
    if let Some(target) = params.get("say") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target}!say "));
        }
    }
    if let Some(target) = params.get("emote") {
        let target = target.trim().to_string();
        if !target.is_empty() {
            return Some(format!("@{target}!emote "));
        }
    }
    None
}

/// Read `?enter=` from the URL — a runtime DID or alias to enter after login.
fn url_enter() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    let val = params.get("enter")?.trim().to_string();
    if val.is_empty() {
        None
    } else {
        Some(val)
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
    // ?enter=<runtime> — auto-enter the runtime world after login.
    if let Some(runtime) = url_enter() {
        state.startup_enter.set(Some(runtime));
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
