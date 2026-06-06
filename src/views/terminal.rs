/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::EgoConfig,
    core::{CommandStatus, Entry, SystemKind},
    eval::eval,
    identity::storage::save_history,
    inbox_poll::run_inbox_poll,
    parser::command::parse,
    startup::{startup_connect, startup_load_config, startup_load_history},
    state::AppState,
    views::editor::{EditorContext, EditorModal},
};

#[component]
pub fn Terminal() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Per-session reactive config
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());

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
                let initial = cfg
                    .get(".my.doc.scratch.content")
                    .unwrap_or_default()
                    .to_string();
                show_editor.set(Some(EditorContext::new(".my.doc.scratch", initial)));
            }
        });
    }

    // Load config from IndexedDB on mount
    if let Some(sess) = state.session.get_untracked() {
        spawn_local(startup_load_config(
            state.clone(),
            config,
            sess.username,
            sess.sender_did,
        ));
    }

    // Restore command history from IndexedDB
    if let Some(sess) = state.session.get_untracked() {
        spawn_local(startup_load_history(state.clone(), sess.username));
    }

    // Start iroh endpoint
    if let Some(sess) = state.session.get_untracked() {
        spawn_local(startup_connect(state.clone(), config, sess));
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

    // Core input handler.
    let handle_input_fn: std::sync::Arc<dyn Fn(String) + Send + Sync> = {
        let state = state.clone();
        std::sync::Arc::new(move |line: String| {
            let line = line.trim().to_string();
            if line.is_empty() {
                return;
            }

            // ── .batch:begin / .batch:end delimiter mode ──────────────────
            if line.starts_with(".batch:begin") {
                if state.batch_collecting.get_untracked().is_some() {
                    state.push_error(crate::i18n::t("batch-already-collecting"));
                } else {
                    let timeout_ms = line.split_whitespace()
                        .find_map(|tok| {
                            let v = tok.strip_prefix("timeout=")?;
                            if let Some(s) = v.strip_suffix("ms") {
                                s.parse::<u32>().ok()
                            } else if let Some(s) = v.strip_suffix('s') {
                                s.parse::<u32>().ok().map(|n| n * 1000)
                            } else {
                                v.parse::<u32>().ok()
                            }
                        })
                        .unwrap_or(30_000);
                    state.batch_timeout_ms.set(timeout_ms);
                    let cmd_id = state.push_command_done_id(line.clone());
                    state.batch_sync_cmd_id.set(Some(cmd_id));
                    state.batch_had_error.set(false);
                    state.batch_collecting.set(Some(Vec::new()));
                }
                return;
            }
            if state.batch_collecting.get_untracked().is_some() {
                if line == ".batch:end" {
                    let collected = state
                        .batch_collecting
                        .update_untracked(|c| c.take().unwrap_or_default());
                    state.batch_collecting.set(None);
                    if !collected.is_empty() {
                        let queue: std::collections::VecDeque<String> =
                            collected.into_iter().collect();
                        state.start_batch(queue);
                        if let Some(first) = state.next_batch_line() {
                            state.batch_next_line.set(Some(first));
                        }
                    }
                } else {
                    // Silently accumulate — will be submitted via on_submit when batch runs.
                    let trimmed = line.trim().to_string();
                    if !trimmed.is_empty() && !trimmed.starts_with('#') {
                        state.batch_collecting.update(|c| {
                            if let Some(v) = c { v.push(trimmed); }
                        });
                    }
                }
                return;
            }

            // History
            state.history.update(|h| {
                if h.last().map(|s| s.as_str()) != Some(&line) {
                    h.push(line.clone());
                }
                if h.len() > 200 {
                    h.drain(0..h.len() - 200);
                }
            });

            // Persist history (per-user) to IndexedDB.
            if let Some(sess) = state.session.get_untracked() {
                let username = sess.username;
                let hist = state.history.get_untracked();
                spawn_local(async move {
                    if let Ok(json) = serde_json::to_string(&hist) {
                        let _ = save_history(&username, &json).await;
                    }
                });
            }

            let focus = state.focus_actor.get_untracked();
            let cfg = config.get_untracked();

            match parse(&line, &cfg, focus.as_ref().map(|item| item.target.as_str())) {
                Ok(cmd) => eval(cmd, &line, &state, config, show_editor, eval_lines),
                Err(e) => state.push_error(format!("'{line}': {e}")),
            }
        })
    };

    // Thin wrapper satisfying InputBar's `impl Fn(String) + 'static` bound.
    // Clone for the batch effect before the wrapper takes ownership.
    let handle_input_for_batch = handle_input_fn.clone();
    let handle_input = {
        let f = handle_input_fn;
        move |line: String| f(line)
    };

    // Watch batch_next_line: when the batch machinery sets the next line,
    // submit it through handle_input_fn exactly as if typed by the user.
    // We peek at entry_counter before/after to detect whether a new command
    // entry was created, so we can bind it as the batch's current step.
    {
        let state2 = state.clone();
        Effect::new(move |_| {
            let line = state2.batch_next_line.get();
            let Some(line) = line else { return };
            state2.batch_next_line.set(None);
            let before_id = state2.peek_next_entry_id();
            handle_input_for_batch(line);
            let after_id = state2.peek_next_entry_id();
            if after_id > before_id {
                state2.bind_batch_step(after_id - 1);
                // Per-step timeout watchdog.
                let timeout_ms = state2.batch_timeout_ms.get_untracked();
                let cmd_id_to_watch = after_id - 1;
                let state3 = state2.clone();
                gloo_timers::callback::Timeout::new(timeout_ms, move || {
                    if state3.batch_waiting_for.get_untracked() == Some(cmd_id_to_watch) {
                        state3.push_error(crate::i18n::t("batch-step-timeout"));
                        state3.resolve_command_by_id(
                            cmd_id_to_watch,
                            crate::core::CommandStatus::Error(
                                crate::i18n::t("batch-step-timeout"),
                            ),
                        );
                        state3.batch_queue.set(None);
                        state3.batch_waiting_for.set(None);
                        state3.finish_batch(true);
                    }
                })
                .forget();
            } else {
                // Instant/local command — advance immediately.
                if let Some(next) = state2.next_batch_line() {
                    state2.batch_next_line.set(Some(next));
                } else {
                    state2.batch_queue.set(None);
                    state2.finish_batch(false);
                }
            }
        });
    }

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
            let status = c.status;
            let raw = c.raw.clone();
            let cls = move || match status.get() {
                CommandStatus::Sent => "terminal-line line-pending",
                CommandStatus::Done => "terminal-line line-dimmed",
                CommandStatus::Replied(_) => "terminal-line line-replied",
                CommandStatus::Publishing => "terminal-line line-publishing",
                CommandStatus::Error(_) => "terminal-line line-error",
            };
            let text = move || match status.get() {
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
