/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::EgoConfig,
    core::{CommandStatus, Entry, SystemKind},
    dispatch::run_dispatch_loop,
    inbox_poll::run_inbox_poll,
    startup::{startup_connect, startup_load_config, startup_load_history},
    state::AppState,
    views::editor::{EditorContext, EditorModal},
};

#[component]
pub fn Terminal() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Per-session reactive config — created at App level, shared via context
    let config = use_context::<RwSignal<EgoConfig>>().expect("EgoConfig missing");

    // Editor modal signal — Some(EditorContext) opens the overlay
    let show_editor: RwSignal<Option<EditorContext>> = RwSignal::new(None);

    // When .my.config.editor.persistent is "true", keep the editor panel open
    // at all times using a scratch document.
    {
        Effect::new(move |_| {
            let is_persistent = config
                .get()
                .get(".my.config.editor.persistent")
                .unwrap_or("false")
                == "true";
            if is_persistent && show_editor.get().is_none() {
                let cfg = config.get_untracked();
                let initial = cfg.get(".my.doc.scratch").unwrap_or_default().to_string();
                show_editor.set(Some(EditorContext::new(".my.doc.scratch", initial)));
            }
        });
    }

    // Load config, then start iroh/connect. Connect may need aliases and .ma.ctx
    // from the restored config, and ?enter= must run after connect/publish.
    if let Some(sess) = state.session.get_untracked() {
        crate::scheme::init_session_env();
        let startup_ma = state.startup_ma.update_untracked(|v| v.take());
        let startup_state = state.clone();
        spawn_local(async move {
            startup_load_config(
                startup_state.clone(),
                config,
                sess.username.clone(),
                sess.sender_did.clone(),
            )
            .await;
            startup_connect(startup_state, config, sess, startup_ma).await;
        });
    }

    // Restore command history from IndexedDB
    if let Some(sess) = state.session.get_untracked() {
        spawn_local(startup_load_history(state.clone(), sess.username));
    }

    // Inbox polling loop
    spawn_local(run_inbox_poll(state.clone(), config, show_editor));

    // Signal for programmatic eval — InputBar watches this and processes each
    // line exactly like a paste, going through the same on_submit path.
    let eval_input: RwSignal<Option<String>> = RwSignal::new(None);

    // Eval callback — hands the document text to InputBar's paste mechanism.
    let eval_lines = Callback::new(move |text: String| {
        eval_input.set(Some(text));
    });

    // Dispatch loop — drains input_queue, handles batches, calls eval.
    spawn_local(run_dispatch_loop(
        state.clone(),
        config,
        show_editor,
        eval_lines,
    ));

    // Core input handler: push to dispatch queue. That's it.
    let handle_input_fn: std::sync::Arc<dyn Fn(String) + Send + Sync> = {
        let state = state.clone();
        std::sync::Arc::new(move |line: String| {
            let line = line.trim().to_string();
            if line.is_empty() {
                return;
            }
            state.input_queue.update(|q| q.push_back(line));
        })
    };

    let handle_input = {
        let f = handle_input_fn;
        move |line: String| f(line)
    };

    view! {
        <div class="terminal"
             class:placement-left=move || config.get().get(".my.config.editor.placement").unwrap_or("bottom") == "left"
             class:placement-right=move || config.get().get(".my.config.editor.placement").unwrap_or("bottom") == "right"
        >
            <OutputPane state=state.clone()/>
            <EditorModal show=show_editor config=config on_eval=eval_lines/>
            <crate::views::input::InputBar
                on_submit=handle_input
                focus_actor=state.focus_actor
                history=state.history
                eval_input=eval_input
                prefill_input=state.prefill_input
            />
        </div>
    }
}

// ── Output pane ────────────────────────────────────────────────────────────

#[component]
fn OutputPane(state: AppState) -> impl IntoView {
    let entries = state.entries;

    // Auto-scroll to bottom whenever entries change
    Effect::new(move |_| {
        let _ = entries.get(); // track signal
        if let Some(window) = web_sys::window() {
            let closure = wasm_bindgen::closure::Closure::<dyn FnMut()>::new(|| {
                if let Some(win) = web_sys::window() {
                    if let Some(doc) = win.document() {
                        if let Some(el) = doc.get_element_by_id("terminal-output") {
                            el.set_scroll_top(el.scroll_height());
                        }
                    }
                }
            });
            let _ = window.request_animation_frame(closure.as_ref().unchecked_ref());
            closure.forget();
        }
    });

    view! {
        <div
            class="terminal-output"
            id="terminal-output"
        >
            <For
                each=move || entries.get()
                key=|e| e.id()
                children=|entry| render_entry(entry)
            />
        </div>
    }
}

fn render_entry(entry: Entry) -> impl IntoView {
    match entry {
        Entry::Command(c) => {
            // `status` is `RwSignal<CommandStatus>` — Copy, so capture by value.
            // The reactive closures below re-run whenever `status.set()` is
            // called, updating the DOM without requiring `<For>` to re-render
            // the entire item (keyed `<For>` keeps existing nodes for unchanged keys).
            let status_cls = c.status.clone();
            let status_text = c.status.clone();
            let raw = c.raw.clone();
            let cls = move || match status_cls.get() {
                CommandStatus::Sent => "terminal-line line-pending",
                CommandStatus::Done => "terminal-line line-dimmed",
                CommandStatus::Replied(_) => "terminal-line line-replied",
                CommandStatus::Publishing => "terminal-line line-publishing",
                CommandStatus::Error(_) => "terminal-line line-error",
            };
            let text = move || match status_text.get() {
                CommandStatus::Publishing => {
                    format!("→ {}  {}…", raw, crate::i18n::t("status-publishing"))
                }
                _ => format!("→ {}", raw),
            };
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::Incoming(i) => {
            let cls = if i.is_error {
                "terminal-line line-error"
            } else if i.after_cmd_id.is_some() {
                "terminal-line line-reply"
            } else {
                "terminal-line line-output"
            };
            let text = i.display;
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::System(s) => {
            let cls = match s.kind {
                SystemKind::Info => "terminal-line line-system",
                SystemKind::Error => "terminal-line line-error",
            };
            let text = s.text;
            view! { <div class=cls>{text}</div> }.into_any()
        }
    }
}

// ── Command evaluator ──────────────────────────────────────────────────────
