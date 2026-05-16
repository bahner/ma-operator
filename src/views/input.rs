/// Readline-style input bar with history, focus-mode prompt,
/// and a blinking cursor indicator.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;

use crate::state::FocusMode;

#[component]
pub fn InputBar(
    on_submit: impl Fn(String) + 'static,
    focus_actor: RwSignal<Option<FocusMode>>,
    history: RwSignal<Vec<String>>,
    eval_input: RwSignal<Option<String>>,
) -> impl IntoView {
    let value = RwSignal::new(String::new());
    let hist_idx: RwSignal<Option<usize>> = RwSignal::new(None);
    // Stash the current draft when navigating history
    let draft = RwSignal::new(String::new());

    let on_submit = std::rc::Rc::new(on_submit);

    // Process programmatic eval input exactly like a multi-line paste.
    {
        let on_submit = on_submit.clone();
        Effect::new(move |_| {
            if let Some(text) = eval_input.get() {
                eval_input.set(None);
                for line in text.lines() {
                    let line = line.trim().to_string();
                    if !line.is_empty() && !line.starts_with('#') {
                        on_submit(line);
                    }
                }
            }
        });
    }

    let on_keydown = {
        let on_submit = on_submit.clone();
        move |ev: web_sys::KeyboardEvent| {
            match ev.key().as_str() {
                "Enter" => {
                    let line = value.get_untracked();
                    hist_idx.set(None);
                    value.set(String::new());
                    on_submit(line);
                }
                "ArrowUp" => {
                    ev.prevent_default();
                    let hist = history.get_untracked();
                    if hist.is_empty() {
                        return;
                    }
                    let idx = match hist_idx.get_untracked() {
                        None => {
                            draft.set(value.get_untracked());
                            hist.len() - 1
                        }
                        Some(0) => 0,
                        Some(i) => i - 1,
                    };
                    hist_idx.set(Some(idx));
                    value.set(hist[idx].clone());
                }
                "ArrowDown" => {
                    ev.prevent_default();
                    let hist = history.get_untracked();
                    match hist_idx.get_untracked() {
                        None => {}
                        Some(i) if i + 1 >= hist.len() => {
                            hist_idx.set(None);
                            value.set(draft.get_untracked());
                        }
                        Some(i) => {
                            let next = i + 1;
                            hist_idx.set(Some(next));
                            value.set(hist[next].clone());
                        }
                    }
                }
                _ => {}
            }
        }
    };

    let on_paste = {
        let on_submit = on_submit.clone();
        move |ev: web_sys::ClipboardEvent| {
            let Some(dt) = ev.clipboard_data() else { return };
            let Ok(text) = dt.get_data("text/plain") else { return };
            if !text.contains('\n') {
                return; // single-line paste: let the browser handle it normally
            }
            ev.prevent_default();
            // Prepend any text already in the input to the first pasted line.
            let existing = value.get_untracked();
            value.set(String::new());
            hist_idx.set(None);
            let mut lines = text.split('\n');
            if let Some(first) = lines.next() {
                let combined = format!("{existing}{first}");
                if !combined.trim().is_empty() {
                    on_submit(combined);
                }
            }
            for line in lines {
                if !line.trim().is_empty() {
                    on_submit(line.to_string());
                }
            }
        }
    };

    let on_input = move |ev: web_sys::Event| {
        let target = ev.target().unwrap();
        let input = target.unchecked_into::<HtmlInputElement>();
        hist_idx.set(None);
        value.set(input.value());
    };

    let prompt_text = move || {
        focus_actor
            .get()
            .map(|focus| format!("{} › ", focus.prompt))
            .unwrap_or_else(|| "› ".to_string())
    };

    let prompt_class = move || {
        if focus_actor.get().is_some() {
            "input-prompt focus-mode"
        } else {
            "input-prompt"
        }
    };

    view! {
        <div class="input-row">
            <span class=prompt_class>{move || prompt_text()}</span>
            <input
                class="input-field"
                type="text"
                prop:value=move || value.get()
                on:keydown=on_keydown
                on:input=on_input
                on:paste=on_paste
            />
        </div>
    }
}
