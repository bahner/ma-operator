/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::MouseEvent;

use crate::{
    config::EgoConfig,
    core::{CommandStatus, Entry, SystemKind},
    dispatch::run_dispatch_loop,
    inbox_poll::run_inbox_poll,
    startup::{startup_connect, startup_load_config, startup_load_history},
    state::{AppState, QrIntent},
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
        let startup_ma = state.startup_ma.update_untracked(std::option::Option::take);
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
            <QrOverlay state=state.clone()/>
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
fn QrOverlay(state: AppState) -> impl IntoView {
    let lang = state.lang;
    let qr_intent = state.qr_intent;
    let scan_feedback = RwSignal::new("searching");
    let scan_frames = RwSignal::new(0_u32);
    let scanning = RwSignal::new(false);
    let video_ref = NodeRef::<leptos::html::Video>::new();

    Effect::new(move |_| {
        let is_capture = matches!(qr_intent.get(), Some(QrIntent::Capture { .. }));
        if !is_capture || scanning.get_untracked() {
            return;
        }
        scanning.set(true);
        scan_feedback.set("searching");
        scan_frames.set(0);

        let state2 = state.clone();
        leptos::task::spawn_local(async move {
            let video = loop {
                if !matches!(
                    state2.qr_intent.get_untracked(),
                    Some(QrIntent::Capture { .. })
                ) {
                    scanning.set(false);
                    return;
                }
                if let Some(v) = video_ref.get_untracked() {
                    break v;
                }
                gloo_timers::future::TimeoutFuture::new(50).await;
            };

            let stream = match crate::views::qr::open_camera(&video).await {
                Ok(s) => s,
                Err(_) => {
                    scan_feedback.set("capture-error");
                    scanning.set(false);
                    return;
                }
            };

            let mut native_detector = crate::views::qr::NativeQrDetector::new();
            loop {
                if !matches!(
                    state2.qr_intent.get_untracked(),
                    Some(QrIntent::Capture { .. })
                ) {
                    break;
                }

                let scan_result = if let Some(detector) = native_detector.as_ref() {
                    if let Ok(result) = detector.decode(&video).await {
                        result
                    } else {
                        native_detector = None;
                        crate::views::qr::try_decode_frame(&video)
                    }
                } else {
                    crate::views::qr::try_decode_frame(&video)
                };

                match scan_result {
                    crate::views::qr::QrScanResult::WaitingForVideo => {
                        scan_feedback.set("waiting");
                    }
                    crate::views::qr::QrScanResult::CaptureError => {
                        scan_feedback.set("capture-error");
                    }
                    crate::views::qr::QrScanResult::NoCode => {
                        let frame = scan_frames.get_untracked().wrapping_add(1);
                        scan_frames.set(frame);
                        scan_feedback.set(if frame.is_multiple_of(2) {
                            "searching phase-a"
                        } else {
                            "searching phase-b"
                        });
                    }
                    crate::views::qr::QrScanResult::Unreadable => {
                        scan_frames.update(|frame| *frame = frame.wrapping_add(1));
                        scan_feedback.set("unreadable");
                    }
                    crate::views::qr::QrScanResult::Decoded(bytes) => {
                        scan_frames.update(|frame| *frame = frame.wrapping_add(1));
                        scan_feedback.set("decoded");

                        if let Some(payload) = crate::views::qr::text_payload(&bytes) {
                            let payload = payload.replace(['\n', '\r'], " ");
                            if let Some(QrIntent::Capture { path }) =
                                state2.qr_intent.get_untracked()
                            {
                                state2
                                    .input_queue
                                    .update(|q| q.push_back(format!("{path}: {payload}")));
                            }
                            state2.qr_intent.set(None);
                            break;
                        }

                        scan_feedback.set("unreadable");
                    }
                }
                gloo_timers::future::TimeoutFuture::new(300).await;
            }

            crate::views::qr::close_camera(&stream);
            video.set_src_object(None);
            scanning.set(false);
        });
    });

    let close_overlay = move |_: MouseEvent| {
        qr_intent.set(None);
    };

    view! {
        <Show when=move || qr_intent.get().is_some()>
            <div class="qr-export-overlay" role="dialog" aria-modal="true">
                <div class="qr-export-content">
                    <p class="qr-export-did">{move || match qr_intent.get() {
                        Some(QrIntent::Capture { path }) => path,
                        None => String::new(),
                    }}</p>

                    <div class="qr-panel">
                        <div class=move || format!("qr-video-frame {}", scan_feedback.get())>
                            <video
                                node_ref=video_ref
                                class="qr-video"
                                autoplay=""
                                muted=""
                                playsinline=""
                            ></video>
                            <span class="qr-scan-marker" aria-hidden="true"></span>
                        </div>
                        <p class=move || format!("qr-scan-status {}", scan_feedback.get())>
                            {move || {
                                let _ = lang.get();
                                crate::i18n::t("qr-scan-hint")
                            }}
                            <span class="qr-scan-stats">
                                {move || format!(
                                    "{}×{} · {}",
                                    video_ref.get().map_or(0, |video| video.video_width()),
                                    video_ref.get().map_or(0, |video| video.video_height()),
                                    scan_frames.get(),
                                )}
                            </span>
                        </p>
                    </div>

                    <div class="btn-row">
                        <button class="btn" on:click=close_overlay>
                            {move || {
                                let _ = lang.get();
                                crate::i18n::t("btn-close")
                            }}
                        </button>
                    </div>
                </div>
            </div>
        </Show>
    }
}

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
                _ => format!("→ {raw}"),
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
