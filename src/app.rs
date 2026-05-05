use leptos::prelude::*;

use crate::state::AppState;
use crate::views::{landing::Landing, screensaver::Screensaver, terminal::Terminal};

#[component]
pub fn App() -> impl IntoView {
    let state = AppState::new();
    provide_context(state.clone());

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
