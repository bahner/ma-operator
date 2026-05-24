/// CodeMirror 6 editor modal.
///
/// Driven by `RwSignal<Option<EditorContext>>`. When `Some`, renders a
/// full-screen overlay with a CM6 editor, a language selector, and three
/// action buttons:
///
/// - **Save** — persist `.content` and `.content_type` to `EgoConfig`,
///              keep the editor open.
/// - **Eval** — run the _current buffer_ (not necessarily saved) line-by-
///              line through the terminal evaluator, then close the editor.
/// - **Cancel** — close without saving.
///
/// # SECURITY
/// Only **Eval** (on the visible buffer) may trigger execution. Content
/// fetched from a CID is NEVER executed automatically — the editor is
/// always opened for human review first.
use leptos::prelude::*;
use wasm_bindgen::prelude::*;

use crate::config::EgoConfig;
use crate::i18n::{t, tf};
use crate::state::AppState;

// ── JS bridge ─────────────────────────────────────────────────────────────

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "create")]
    fn js_editor_create(el_id: &str, value: &str, lang: &str);

    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "getValue")]
    fn js_editor_get_value(el_id: &str) -> String;

    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "setLanguage")]
    fn js_editor_set_language(el_id: &str, lang: &str);

    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "destroy")]
    fn js_editor_destroy(el_id: &str);
}

// ── Public types ───────────────────────────────────────────────────────────

/// Controls which action buttons are shown in the editor toolbar.
#[derive(Clone, Debug, PartialEq)]
pub enum EditorMode {
    /// Standard document editing: Save + Eval + Cancel.
    Standard,
    /// Read-only view of an inbox message: Close only, no lang selector.
    View,
    /// Compose a reply: Reply button only.
    Reply {
        /// Recipient DID.
        to: String,
        /// The `Message.id` being replied to.
        reply_to_id: String,
    },
    /// Edit an entity definition: Publish button only.
    /// YAML buffer → DAG-CBOR → sent to runtime for dag_put + registration.
    EntityEdit {
        /// DID of the runtime to send the updated entity to.
        target: String,
        /// Entity name (e.g. `"rms"`).
        entity_name: String,
    },
    /// Edit a single field of an entity (e.g. `acl`): Publish button only.
    /// YAML buffer → DAG-CBOR → sent as `entities.<name>.<field>:edit`.
    EntityFieldEdit {
        /// DID of the runtime.
        target: String,
        /// Entity name.
        entity_name: String,
        /// Field name, e.g. `"acl"`.
        field: String,
    },
    /// Edit a raw config key: Save + Cancel, no eval.
    /// The editor content is written directly to `key` (not `<key>.content`).
    ConfigEdit {
        /// The EgoConfig key to write on save, e.g. `".my.acl"`.
        key: String,
    },
    /// Edit the root transport ACL of a remote runtime: Publish + Cancel.
    /// YAML buffer → DAG-CBOR → sent as `[:acl:edit, bytes]` to the runtime.
    RuntimeAclEdit {
        /// DID of the runtime to send the updated ACL to.
        target: String,
    },
}

/// All the state needed to open an editor session for a document.
#[derive(Clone, Debug)]
pub struct EditorContext {
    /// Dot-path key for the document, e.g. `.my.doc.readme`.
    pub doc_path: String,
    /// Content to pre-fill the editor (may be empty for a new doc).
    pub initial: String,
    /// Language mode: `"plain"` | `"markdown"` | `"yaml"`.
    pub language: String,
    /// Editor button / behaviour mode.
    pub mode: EditorMode,
}

impl EditorContext {
    pub fn new(doc_path: impl Into<String>, initial: impl Into<String>) -> Self {
        let initial = initial.into();
        // Infer language from existing content_type if we can, otherwise plain.
        Self {
            doc_path: doc_path.into(),
            initial,
            language: "plain".into(),
            mode: EditorMode::Standard,
        }
    }

    pub fn with_language(mut self, lang: impl Into<String>) -> Self {
        self.language = lang.into();
        self
    }

    pub fn with_mode(mut self, mode: EditorMode) -> Self {
        self.mode = mode;
        self
    }
}

// ── Component ─────────────────────────────────────────────────────────────

const EDITOR_EL_ID: &str = "ma-codemirror-host";

/// Modal editor overlay.  Mount this once inside `<Terminal>` and drive it
/// via the `show` signal.
#[component]
pub fn EditorModal(
    show: RwSignal<Option<EditorContext>>,
    config: RwSignal<EgoConfig>,
    /// Callback invoked when Eval is clicked; receives the buffer text.
    /// The caller is responsible for running it through the evaluator.
    on_eval: Callback<String>,
) -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Language selector state — initialised from context when editor opens.
    let language = RwSignal::new("plain".to_string());

    // Mount / unmount the CM6 editor when `show` changes.
    Effect::new({
        let language = language.clone();
        move |_| {
            match show.get() {
                Some(ref ctx) => {
                    language.set(ctx.language.clone());
                    // We need to defer the actual CM6 mount until the DOM
                    // element is rendered.  A rAF is sufficient.
                    let initial = ctx.initial.clone();
                    let lang = ctx.language.clone();
                    let _ = web_sys::window().and_then(|w| {
                        let cb = wasm_bindgen::closure::Closure::<dyn FnMut()>::new(move || {
                            js_editor_create(EDITOR_EL_ID, &initial, &lang)
                        });
                        let r = w.request_animation_frame(cb.as_ref().unchecked_ref()).ok();
                        cb.forget();
                        r
                    });
                }
                None => {
                    js_editor_destroy(EDITOR_EL_ID);
                }
            }
        }
    });

    // Language selector change handler.
    let on_lang_change = {
        let language = language.clone();
        move |ev: web_sys::Event| {
            let sel = ev
                .target()
                .and_then(|t| t.dyn_into::<web_sys::HtmlSelectElement>().ok())
                .map(|s| s.value())
                .unwrap_or_else(|| "plain".to_string());
            js_editor_set_language(EDITOR_EL_ID, &sel);
            language.set(sel);
        }
    };

    // Save button.
    let on_save = {
        let show = show.clone();
        let config = config.clone();
        let language = language.clone();
        let state = state.clone();
        move |_| {
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let text = js_editor_get_value(EDITOR_EL_ID);
            let lang = language.get_untracked();

            // ConfigEdit: write directly to the config key, not <key>.content.
            if let EditorMode::ConfigEdit { key } = &ctx.mode {
                let key = key.clone();
                config.update(|c| c.set(&key, &text));
                if let Some(sess) = use_context::<AppState>()
                    .unwrap_or_else(|| state.clone())
                    .session
                    .get_untracked()
                {
                    let username = sess.username.clone();
                    let cfg = config.get_untracked();
                    leptos::task::spawn_local(async move {
                        if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                            web_sys::console::error_1(&format!("persist error: {e}").into());
                        }
                    });
                }
                state.push_command_ok(tf("msg-editor-saved", &[("path", &ctx.doc_path)]));
                return;
            }

            config.update(|c| {
                c.set(&format!("{}.content", ctx.doc_path), &text);
                c.set(
                    &format!("{}.content_type", ctx.doc_path),
                    content_type_for(&lang),
                );
            });
            // Persist asynchronously.
            if let Some(sess) = use_context::<AppState>()
                .unwrap_or_else(|| state.clone())
                .session
                .get_untracked()
            {
                let username = sess.username.clone();
                let cfg = config.get_untracked();
                leptos::task::spawn_local(async move {
                    if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                        web_sys::console::error_1(&format!("persist error: {e}").into());
                    }
                });
            }
            state.push_command_ok(tf("msg-editor-saved", &[("path", &ctx.doc_path)]));
            // Keep editor open after save (per spec).
        }
    };

    // Eval button — run current buffer, close editor.
    let on_eval_click = {
        let show = show.clone();
        let on_eval = on_eval.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            show.set(None); // close first so CM6 is destroyed cleanly
            on_eval.run(text);
        }
    };

    // Cancel / Close button.
    let on_cancel = {
        let show = show.clone();
        move |_| {
            show.set(None);
        }
    };

    // Reply button — send the buffer as a reply to the originating message.
    let on_reply = {
        let show = show.clone();
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::Reply { to, reply_to_id } = ctx.mode else {
                return;
            };
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match crate::transport::send_text_reply(&to, &text, &reply_to_id).await {
                    Ok(_) => state2.push_system(t("msg-reply-sent")),
                    Err(e) => state2.push_error(tf("msg-reply-failed", &[("e", &e)])),
                }
            });
        }
    };

    // EntityEdit — convert YAML buffer to DAG-CBOR and send to runtime.
    let on_entity_publish = {
        let show = show.clone();
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::EntityEdit {
                target,
                entity_name,
            } = ctx.mode
            else {
                return;
            };
            let path = format!(":entities.{entity_name}");
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(dag_cbor) => {
                        match crate::transport::send_crud_edit_save(&target, &path, dag_cbor)
                            .await
                        {
                            Ok(_) => state2.push_system(tf(
                                "msg-entity-publish-sent",
                                &[("name", &entity_name)],
                            )),
                            Err(e) => {
                                state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]))
                            }
                        }
                    }
                    Err(e) => state2.push_error(tf("msg-yaml-error", &[("e", &e)])),
                }
            });
        }
    };

    // EntityFieldEdit — convert YAML buffer to DAG-CBOR and send field bytes to runtime.
    let on_entity_field_publish = {
        let show = show.clone();
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::EntityFieldEdit {
                target,
                entity_name,
                field,
            } = ctx.mode
            else {
                return;
            };
            let path = format!(":entities.{entity_name}.{field}");
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(dag_cbor) => {
                        match crate::transport::send_crud_edit_save(&target, &path, dag_cbor)
                            .await
                        {
                            Ok(_) => state2.push_system(tf(
                                "msg-field-publish-sent",
                                &[("name", &entity_name), ("field", &field)],
                            )),
                            Err(e) => {
                                state2.push_error(tf("msg-field-publish-failed", &[("e", &e)]))
                            }
                        }
                    }
                    Err(e) => state2.push_error(tf("msg-yaml-error", &[("e", &e)])),
                }
            });
        }
    };

    // RuntimeAclEdit — convert YAML buffer to DAG-CBOR, send as :acl edit-save to runtime.
    let on_acl_publish = {
        let show = show.clone();
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::RuntimeAclEdit { target } = ctx.mode else {
                return;
            };
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(dag_cbor) => {
                        match crate::transport::send_crud_edit_save(&target, ":acl", dag_cbor)
                            .await
                        {
                            Ok(_) => state2.push_system(t("msg-acl-publish-sent")),
                            Err(e) => state2.push_error(tf("msg-acl-publish-failed", &[("e", &e)])),
                        }
                    }
                    Err(e) => state2.push_error(tf("msg-yaml-error", &[("e", &e)])),
                }
            });
        }
    };

    // Mode-test closures — capture only `show` (RwSignal, Copy), so they are
    // Copy themselves.  Nested `style=move ||…` will COPY them, not move them,
    // leaving `on_save` etc. in the outer <Show> children closure as `Fn`.
    let is_standard = move || matches!(show.get().map(|c| c.mode), Some(EditorMode::Standard));
    let is_view = move || matches!(show.get().map(|c| c.mode), Some(EditorMode::View));
    let is_reply = move || matches!(show.get().map(|c| c.mode), Some(EditorMode::Reply { .. }));
    let is_entity_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::EntityEdit { .. })
        )
    };
    let is_entity_field_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::EntityFieldEdit { .. })
        )
    };
    let is_config_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::ConfigEdit { .. })
        )
    };
    let is_runtime_acl_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::RuntimeAclEdit { .. })
        )
    };

    view! {
        <Show when=move || show.get().is_some()>
            // Inline panel — sits at the bottom of the terminal column,
            // toolbar above the editor field, no backdrop.
            <div class="editor-panel">
                <div class="editor-toolbar">
                    <span class="editor-doc-path">
                        {move || show.get().map(|c| c.doc_path).unwrap_or_default()}
                    </span>
                    // Language selector — hidden in View / Reply modes.
                    <select
                        class="editor-lang-select"
                        style=move || if is_standard() { "" } else { "display:none" }
                        on:change=on_lang_change.clone()
                        prop:value=move || language.get()
                    >
                        <option value="plain">"plain"</option>
                        <option value="markdown">"markdown"</option>
                        <option value="yaml">"yaml"</option>
                    </select>
                    // Save — Standard only
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_standard() { "" } else { "display:none" }
                        on:click=on_save.clone()
                    >{t("btn-save")}</button>
                    // Eval — Standard only
                    <button
                        class="editor-btn btn-eval"
                        style=move || if is_standard() { "" } else { "display:none" }
                        on:click=on_eval_click.clone()
                    >{t("btn-eval")}</button>
                    // Cancel / Close — Standard + View; label adapts
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_standard() || is_view() { "" } else { "display:none" }
                        on:click=on_cancel.clone()
                    >{move || if is_view() { t("btn-close") } else { t("btn-cancel") }}</button>
                    // Reply — Reply mode only
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_reply() { "" } else { "display:none" }
                        on:click=on_reply.clone()
                    >{t("btn-reply")}</button>
                    // Publish — EntityEdit mode only
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_entity_edit() { "" } else { "display:none" }
                        on:click=on_entity_publish.clone()
                    >{t("btn-publish")}</button>
                    // Cancel — EntityEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_entity_edit() { "" } else { "display:none" }
                        on:click=on_cancel.clone()
                    >{t("btn-cancel")}</button>
                    // Publish — EntityFieldEdit mode
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_entity_field_edit() { "" } else { "display:none" }
                        on:click=on_entity_field_publish.clone()
                    >{t("btn-publish")}</button>
                    // Cancel — EntityFieldEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_entity_field_edit() { "" } else { "display:none" }
                        on:click=on_cancel.clone()
                    >{t("btn-cancel")}</button>
                    // Save — ConfigEdit mode
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_config_edit() { "" } else { "display:none" }
                        on:click=on_save.clone()
                    >{t("btn-save")}</button>
                    // Cancel — ConfigEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_config_edit() { "" } else { "display:none" }
                        on:click=on_cancel.clone()
                    >{t("btn-cancel")}</button>
                    // Publish — RuntimeAclEdit mode
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_runtime_acl_edit() { "" } else { "display:none" }
                        on:click=on_acl_publish.clone()
                    >{t("btn-publish")}</button>
                    // Cancel — RuntimeAclEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_runtime_acl_edit() { "" } else { "display:none" }
                        on:click=on_cancel.clone()
                    >{t("btn-cancel")}</button>
                </div>
                <div id=EDITOR_EL_ID class="editor-cm-host"></div>
            </div>
        </Show>
    }
}

// ── Helpers ────────────────────────────────────────────────────────────────

fn content_type_for(lang: &str) -> &str {
    match lang {
        "markdown" => "text/markdown",
        "yaml" => "text/yaml",
        _ => "text/plain",
    }
}
