use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::state::AppState;
use crate::views::{landing::Landing, screensaver::Screensaver, terminal::Terminal};

/// Read a suggested runtime DID from `?ma=`.
fn url_ma() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    let val = params.get("ma")?.trim().to_string();
    crate::parser::verbs::is_bare_ma_did(&val).then_some(val)
}

/// Read `?msg=`, `?say=`, or `?emote=` from the current URL and return the
/// pre-filled terminal input string, or `None` if absent.
///
/// - `?msg=<did>`   → `@<did>!msg `    (plain text message command)
/// - `?say=<did>`   → `@<did>:say `    (actor RPC method)
/// - `?emote=<did>` → `@<did>:emote `  (actor RPC method)
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

/// Read a z tree manifest CID from `?z=` for one-time profile bootstrap.
fn url_z() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    let val = params.get("z")?.trim().to_string();
    (!val.is_empty()).then_some(val)
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
    // ?z=<manifest-cid> — seed an empty profile's complete z tree once.
    if let Some(z) = url_z() {
        state.startup_z.set(Some(z));
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
