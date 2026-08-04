/// Readline-style input bar with history, focus-mode prompt,
/// and a blinking cursor indicator.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;

use crate::state::FocusMode;

fn utf16_offset_to_byte_index(text: &str, offset: usize) -> usize {
    let mut utf16_offset = 0;
    for (byte_index, character) in text.char_indices() {
        if utf16_offset >= offset {
            return byte_index;
        }
        utf16_offset += character.len_utf16();
    }
    text.len()
}

fn insert_parentheses(text: &str, selection_start: usize, selection_end: usize) -> (String, usize) {
    let start = utf16_offset_to_byte_index(text, selection_start);
    let end = utf16_offset_to_byte_index(text, selection_end);
    let mut updated = String::with_capacity(text.len() + 2);
    updated.push_str(&text[..start]);
    updated.push('(');
    updated.push_str(&text[start..end]);
    updated.push(')');
    updated.push_str(&text[end..]);
    (updated, selection_start + 1)
}

fn skip_closing_parenthesis(text: &str, selection_start: usize, selection_end: usize) -> Option<usize> {
    if selection_start != selection_end {
        return None;
    }
    let start = utf16_offset_to_byte_index(text, selection_start);
    text[start..]
        .starts_with(')')
        .then_some(selection_start + 1)
}

#[component]
pub fn InputBar(
    on_submit: impl Fn(String) + 'static,
    focus_actor: RwSignal<Option<FocusMode>>,
    history: RwSignal<Vec<String>>,
    eval_input: RwSignal<Option<String>>,
    prefill_input: RwSignal<Option<String>>,
) -> impl IntoView {
    let value = RwSignal::new(String::new());
    let hist_idx: RwSignal<Option<usize>> = RwSignal::new(None);
    // Stash the current draft when navigating history
    let draft = RwSignal::new(String::new());

    let on_submit = std::rc::Rc::new(on_submit);

    // Pre-fill input from URL params. Consumed once on first Some value.
    Effect::new(move |_| {
        if let Some(text) = prefill_input.get() {
            prefill_input.set(None);
            value.set(text);
        }
    });

    // Process programmatic eval input exactly like a multi-line paste.
    // eval_input is set from outside (editor Eval button or :eval verb).
    // Use set_untracked so this Effect is not redundantly re-queued when
    // we clear the signal, and call on_submit directly (same as paste).
    {
        let on_submit = on_submit.clone();
        Effect::new(move |_| {
            if let Some(text) = eval_input.get() {
                eval_input.update_untracked(|v| *v = None);
                let lines: Vec<String> = text
                    .lines()
                    .map(|l| l.trim().to_string())
                    .filter(|l| !l.is_empty() && !l.starts_with('#'))
                    .collect();
                for line in lines {
                    on_submit(line);
                }
            }
        });
    }

    let on_keydown = {
        let on_submit = on_submit.clone();
        move |ev: web_sys::KeyboardEvent| {
            let key = js_sys::Reflect::get(&ev, &wasm_bindgen::JsValue::from_str("key"))
                .ok()
                .and_then(|v| v.as_string())
                .unwrap_or_default();
            match key.as_str() {
                "(" => {
                    let Some(input) = ev
                        .target()
                        .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                    else {
                        return;
                    };
                    ev.prevent_default();
                    let text = input.value();
                    let start = js_sys::Reflect::get(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionStart"),
                    )
                    .ok()
                    .and_then(|value| value.as_f64())
                    .unwrap_or_default() as usize;
                    let end = js_sys::Reflect::get(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionEnd"),
                    )
                    .ok()
                    .and_then(|value| value.as_f64())
                    .unwrap_or(start as f64) as usize;
                    let (updated, cursor) = insert_parentheses(&text, start, end);
                    input.set_value(&updated);
                    let cursor = wasm_bindgen::JsValue::from_f64(cursor as f64);
                    let _ = js_sys::Reflect::set(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionStart"),
                        &cursor,
                    );
                    let _ = js_sys::Reflect::set(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionEnd"),
                        &cursor,
                    );
                    hist_idx.set(None);
                    value.set(updated);
                }
                ")" => {
                    let Some(input) = ev
                        .target()
                        .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                    else {
                        return;
                    };
                    let text = input.value();
                    let start = js_sys::Reflect::get(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionStart"),
                    )
                    .ok()
                    .and_then(|value| value.as_f64())
                    .unwrap_or_default() as usize;
                    let end = js_sys::Reflect::get(
                        input.as_ref(),
                        &wasm_bindgen::JsValue::from_str("selectionEnd"),
                    )
                    .ok()
                    .and_then(|value| value.as_f64())
                    .unwrap_or(start as f64) as usize;
                    if let Some(cursor) = skip_closing_parenthesis(&text, start, end) {
                        ev.prevent_default();
                        let cursor = wasm_bindgen::JsValue::from_f64(cursor as f64);
                        let _ = js_sys::Reflect::set(
                            input.as_ref(),
                            &wasm_bindgen::JsValue::from_str("selectionStart"),
                            &cursor,
                        );
                        let _ = js_sys::Reflect::set(
                            input.as_ref(),
                            &wasm_bindgen::JsValue::from_str("selectionEnd"),
                            &cursor,
                        );
                    }
                }
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
            let Some(dt) = ev.clipboard_data() else {
                return;
            };
            let Ok(text) = dt.get_data("text/plain") else {
                return;
            };
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
        if let Some(input) = ev
            .target()
            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
        {
            hist_idx.set(None);
            value.set(input.value());
        }
    };

    let prompt_text = move || {
        focus_actor
            .get()
            .map(|focus| format!("{}› ", focus.prompt))
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn inserts_parentheses_around_selection() {
        assert_eq!(
            insert_parentheses("say hello", 4, 9),
            ("say (hello)".to_string(), 5)
        );
    }

    #[test]
    fn inserts_parentheses_at_utf16_cursor_offset() {
        assert_eq!(
            insert_parentheses("say 😀cafe", 6, 6),
            ("say 😀()cafe".to_string(), 7)
        );
    }

    #[test]
    fn skips_an_existing_closing_parenthesis() {
        assert_eq!(skip_closing_parenthesis("(look)", 5, 5), Some(6));
        assert_eq!(skip_closing_parenthesis("(look)", 1, 5), None);
    }
}
