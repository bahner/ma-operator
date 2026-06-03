use leptos::prelude::*;

use crate::state::AppState;
use crate::views::{landing::Landing, screensaver::Screensaver, terminal::Terminal};

/// Read `?chat=` or `?say=` from the current URL and return the pre-filled
/// terminal input string (e.g. `"@did:ma:... "`), or `None` if absent.
fn url_prefill() -> Option<String> {
    let window = web_sys::window()?;
    let search = window.location().search().ok()?;
    let params = web_sys::UrlSearchParams::new_with_str(&search).ok()?;
    for key in &["chat", "say"] {
        if let Some(target) = params.get(key) {
            let target = target.trim().to_string();
            if !target.is_empty() {
                // Prepend @ so the terminal grammar treats it as a send target.
                return Some(format!("@{target} "));
            }
        }
    }
    None
}

#[component]
pub fn App() -> impl IntoView {
    let state = AppState::new();
    provide_context(state.clone());

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
