use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::state::AppState;
use crate::views::{landing::Landing, screensaver::Screensaver, terminal::Terminal};

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

#[component]
pub fn App() -> impl IntoView {
    let state = AppState::new();
    provide_context(state.clone());
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());
    provide_context(config);

    // Parse URL params once at startup. Stored in AppState so the value
    // survives the landing/login flow and is consumed by InputBar after login.
    if let Some(prefill) = url_prefill() {
        state.prefill_input.set(Some(prefill));
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
