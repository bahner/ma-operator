/// Readline-style input bar with history, focus-mode prompt,
/// and a blinking cursor indicator.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;

use crate::state::FocusMode;

fn matching_parentheses(text: &str, cursor_utf16: usize) -> Option<(usize, usize)> {
    let characters: Vec<char> = text.chars().collect();
    let mut utf16_position = 0;
    let mut cursor = 0;
    while cursor < characters.len() && utf16_position < cursor_utf16 {
        utf16_position += characters[cursor].len_utf16();
        cursor += 1;
    }
    if utf16_position != cursor_utf16 || cursor == 0 || characters[cursor - 1] != ')' {
        return None;
    }

    let closing = cursor - 1;
    let mut depth = 0;
    for opening in (0..closing).rev() {
        match characters[opening] {
            ')' => depth += 1,
            '(' if depth == 0 => return Some((opening, closing)),
            '(' => depth -= 1,
            _ => {}
        }
    }
    None
}

fn input_cursor(input: &HtmlInputElement) -> usize {
    js_sys::Reflect::get(
        input.as_ref(),
        &wasm_bindgen::JsValue::from_str("selectionStart"),
    )
    .ok()
    .and_then(|value| value.as_f64())
    .unwrap_or_default() as usize
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
    let cursor = RwSignal::new(0_usize);
    let scroll_left = RwSignal::new(0_i32);
    let hist_idx: RwSignal<Option<usize>> = RwSignal::new(None);
    // Stash the current draft when navigating history
    let draft = RwSignal::new(String::new());

    let on_submit = std::rc::Rc::new(on_submit);

    // Pre-fill input from URL params. Consumed once on first Some value.
    Effect::new(move |_| {
        if let Some(text) = prefill_input.get() {
            prefill_input.set(None);
            value.set(text);
            cursor.set(value.get_untracked().encode_utf16().count());
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
                for line in text.split('\n') {
                    on_submit(line.to_string());
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
                "Enter" => {
                    let line = value.get_untracked();
                    hist_idx.set(None);
                    value.set(String::new());
                    cursor.set(0);
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
                    cursor.set(value.get_untracked().encode_utf16().count());
                }
                "ArrowDown" => {
                    ev.prevent_default();
                    let hist = history.get_untracked();
                    match hist_idx.get_untracked() {
                        None => {}
                        Some(i) if i + 1 >= hist.len() => {
                            hist_idx.set(None);
                            value.set(draft.get_untracked());
                            cursor.set(value.get_untracked().encode_utf16().count());
                        }
                        Some(i) => {
                            let next = i + 1;
                            hist_idx.set(Some(next));
                            value.set(hist[next].clone());
                            cursor.set(value.get_untracked().encode_utf16().count());
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
                on_submit(combined);
            }
            for line in lines {
                on_submit(line.to_string());
            }
        }
    };

    let on_input = move |ev: web_sys::Event| {
        if let Some(input) = ev
            .target()
            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
        {
            hist_idx.set(None);
            cursor.set(input_cursor(&input));
            value.set(input.value());
        }
    };

    let update_cursor = move |ev: web_sys::Event| {
        if let Some(input) = ev
            .target()
            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
        {
            cursor.set(input_cursor(&input));
        }
    };

    let on_keyup = move |ev: web_sys::KeyboardEvent| update_cursor(ev.into());
    let on_click = move |ev: web_sys::MouseEvent| update_cursor(ev.into());
    let on_select = move |ev: web_sys::Event| update_cursor(ev);

    let on_scroll = move |ev: web_sys::Event| {
        if let Some(input) = ev
            .target()
            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
        {
            scroll_left.set(input.scroll_left());
        }
    };

    let prompt_text = move || {
        focus_actor
            .get().map_or_else(|| "› ".to_string(), |focus| format!("{}› ", focus.prompt))
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
            <div class="input-shell">
                <div
                    class="input-mirror"
                    style=move || format!("transform:translateX(-{}px)", scroll_left.get())
                >
                    {move || {
                        let matching = matching_parentheses(&value.get(), cursor.get());
                        value
                            .get()
                            .chars()
                            .enumerate()
                            .map(|(index, character)| {
                                let class = matching
                                    .is_some_and(|(opening, closing)| index == opening || index == closing)
                                    .then_some("input-paren-match");
                                view! { <span class=class>{character}</span> }
                            })
                            .collect_view()
                    }}
                </div>
                <input
                    class="input-field"
                    type="text"
                    prop:value=move || value.get()
                    on:keydown=on_keydown
                    on:input=on_input
                    on:keyup=on_keyup
                    on:click=on_click
                    on:select=on_select
                    on:scroll=on_scroll
                    on:paste=on_paste
                />
            </div>
        </div>
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn finds_opening_parenthesis_for_closing_parenthesis_at_cursor() {
        assert_eq!(matching_parentheses("(begin (look))", 14), Some((0, 13)));
        assert_eq!(matching_parentheses("(begin (look))", 13), Some((7, 12)));
        assert_eq!(matching_parentheses("(look", 5), None);
    }
}
