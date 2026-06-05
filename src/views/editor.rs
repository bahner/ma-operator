/// CodeMirror 6 editor modal.
///
/// Driven by `RwSignal<Option<EditorContext>>`. When `Some`, renders a
/// full-screen overlay with a CM6 editor, a language selector, and three
/// action buttons:
///
/// - **Save** — persist `.content` and `.content_type` to `EgoConfig`,
///   keep the editor open.
/// - **Eval** — run the _current buffer_ (not necessarily saved) line-by-
///   line through the terminal evaluator, then close the editor.
/// - **Cancel** — close without saving.
///
/// # SECURITY
/// Only **Eval** (on the visible buffer) may trigger execution. Content
/// fetched from a CID is NEVER executed automatically — the editor is
/// always opened for human review first.
use leptos::prelude::*;
use wasm_bindgen::prelude::*;

use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::{t, tf};
use crate::state::{AppState, IpfsCrudPending, IpfsKindUpsertPending};

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
    /// Content uploaded to IPFS; CID registered via CRUD set.
    EntityEdit {
        /// DID of the runtime to send the updated entity to.
        target: String,
        /// Entity name (e.g. `"rms"`).
        entity_name: String,
    },
    /// Edit a single field of an entity (e.g. `acl`): Publish button only.
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
    /// Content uploaded to IPFS; CID registered via CRUD set.
    RuntimeAclEdit {
        /// DID of the runtime to send the updated ACL to.
        target: String,
    },
    /// Edit an arbitrary CRUD path on a remote runtime: Publish + Cancel.
    /// Save behaviour is determined by `content_type`:
    /// - `application/x-ma-term+dag-cbor` → serialise to DAG-CBOR, upload to
    ///   IPFS, register CID via CRUD set at `crud_path`.
    /// - anything else (`+cbor`, `+yaml`) → parse editor YAML, send inline
    ///   via CRUD set at `crud_path`.
    CrudEdit {
        /// DID of the runtime.
        target: String,
        /// Full CRUD path, e.g. `".entities.alice.fil"` or `".config.owners"`.
        crud_path: String,
        /// Content-type from the GET reply that opened this editor session.
        /// Drives the save handler — no further conditions needed.
        content_type: String,
    },
    /// Edit a kind definition: Publish + Cancel.
    /// Content serialised to DAG-CBOR, uploaded to IPFS; CID registered via
    /// CRUD set `:kinds [protocol_id, cid]`.
    KindEdit {
        /// DID of the runtime.
        target: String,
        /// Protocol ID (e.g. `/ma/stateful/python/0.0.1`).
        protocol_id: String,
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
    /// Command entry id of the originating `:edit` command, if any.
    /// Used to transition the command through Publishing → Replied/Error.
    pub cmd_id: Option<u64>,
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
            cmd_id: None,
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

    pub fn with_cmd_id(mut self, cmd_id: u64) -> Self {
        self.cmd_id = Some(cmd_id);
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
                c.set(format!("{}.content", ctx.doc_path), &text);
                c.set(
                    format!("{}.content_type", ctx.doc_path),
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
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            show.set(None); // close first so CM6 is destroyed cleanly
            on_eval.run(text);
        }
    };

    // Cancel / Close button.
    let on_cancel = {
        move |_| {
            show.set(None);
        }
    };

    // Reply button — send the buffer as a reply to the originating message.
    let on_reply = {
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
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(b) => b,
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
                        return;
                    }
                };
                match crate::transport::send_ipfs_store(
                    &target,
                    cbor_bytes,
                    "application/vnd.ipld.dag-cbor",
                )
                .await
                {
                    Ok(msg_id) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Publishing);
                        }
                        state2.pending_ipfs_crud.update(|m| {
                            m.insert(msg_id, IpfsCrudPending {
                                target_did: target.clone(),
                                crud_path: path.clone(),
                                cmd_id,
                            });
                        });
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]))
                    }
                }
            });
        }
    };

    // EntityFieldEdit — convert YAML buffer to DAG-CBOR and send to runtime.
    let on_entity_field_publish = {
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
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(b) => b,
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-field-publish-failed", &[("e", &e)]));
                        return;
                    }
                };
                match crate::transport::send_ipfs_store(
                    &target,
                    cbor_bytes,
                    "application/vnd.ipld.dag-cbor",
                )
                .await
                {
                    Ok(msg_id) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Publishing);
                        }
                        state2.pending_ipfs_crud.update(|m| {
                            m.insert(msg_id, IpfsCrudPending {
                                target_did: target.clone(),
                                crud_path: path.clone(),
                                cmd_id,
                            });
                        });
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-field-publish-failed", &[("e", &e)]))
                    }
                }
            });
        }
    };

    // RuntimeAclEdit — upload ACL content to IPFS then send CRUD set.
    let on_acl_publish = {
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::RuntimeAclEdit { target } = ctx.mode else {
                return;
            };
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match crate::transport::send_ipfs_store(&target, text.into_bytes(), "text/yaml")
                    .await
                {
                    Ok(msg_id) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Publishing);
                        }
                        state2.pending_ipfs_crud.update(|m| {
                            m.insert(msg_id, IpfsCrudPending {
                                target_did: target.clone(),
                                crud_path: ":acl".to_string(),
                                cmd_id,
                            });
                        });
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-acl-publish-failed", &[("e", &e)]))
                    }
                }
            });
        }
    };

    // CrudEdit — save handler; behaviour is driven entirely by `content_type`
    // from the GET reply that opened this session:
    //   application/x-ma-term+dag-cbor → IPFS publish flow
    //   anything else (+cbor, +yaml)   → parse YAML → CBOR → inline CRUD set
    let on_crud_save = {
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::CrudEdit {
                target,
                crud_path,
                content_type,
            } = ctx.mode
            else {
                return;
            };
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                match content_type.as_str() {
                    "application/x-ma-term+dag-cbor" => {
                        let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
                            Ok(b) => b,
                            Err(e) => {
                                if let Some(cid) = cmd_id {
                                    state2.resolve_command_by_id(
                                        cid,
                                        CommandStatus::Error(e.clone()),
                                    );
                                }
                                state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
                                return;
                            }
                        };
                        match crate::transport::send_ipfs_store(
                            &target,
                            cbor_bytes,
                            "application/vnd.ipld.dag-cbor",
                        )
                        .await
                        {
                            Ok(msg_id) => {
                                if let Some(cid) = cmd_id {
                                    state2.resolve_command_by_id(cid, CommandStatus::Publishing);
                                }
                                state2.pending_ipfs_crud.update(|m| {
                                    m.insert(msg_id, IpfsCrudPending {
                                        target_did: target.clone(),
                                        crud_path: crud_path.clone(),
                                        cmd_id,
                                    });
                                });
                            }
                            Err(e) => {
                                if let Some(cid) = cmd_id {
                                    state2.resolve_command_by_id(
                                        cid,
                                        CommandStatus::Error(e.clone()),
                                    );
                                }
                                state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
                            }
                        }
                    }
                    _ => {
                        // +cbor, +yaml, or unknown — parse YAML and send inline.
                        let cbor_val = match crate::messages::yaml_to_cbor_value(&text) {
                            Ok(v) => v,
                            Err(e) => {
                                if let Some(cid) = cmd_id {
                                    state2.resolve_command_by_id(
                                        cid,
                                        CommandStatus::Error(e.clone()),
                                    );
                                }
                                state2.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
                                return;
                            }
                        };
                        match crate::transport::send_crud_set(&target, &crud_path, cbor_val).await {
                            Ok(set_msg_id) => {
                                if let Some(original_cmd_id) = cmd_id {
                                    state2.pending_crud_confirms.update(|m| {
                                        m.insert(set_msg_id, original_cmd_id);
                                    });
                                }
                            }
                            Err(e) => {
                                if let Some(cid) = cmd_id {
                                    state2.resolve_command_by_id(
                                        cid,
                                        CommandStatus::Error(e.clone()),
                                    );
                                }
                                state2.push_error(e);
                            }
                        }
                    }
                }
            });
        }
    };

    // KindEdit — convert YAML buffer to DAG-CBOR and upload to IPFS; then
    // CRUD set :kinds [protocol_id, cid] to register the kind.
    let on_kind_publish = {
        let state = state.clone();
        move |_| {
            let text = js_editor_get_value(EDITOR_EL_ID);
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let EditorMode::KindEdit {
                target,
                protocol_id,
            } = ctx.mode
            else {
                return;
            };
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(async move {
                let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
                    Ok(b) => b,
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-kind-publish-failed", &[("e", &e)]));
                        return;
                    }
                };
                match crate::transport::send_ipfs_store(
                    &target,
                    cbor_bytes,
                    "application/vnd.ipld.dag-cbor",
                )
                .await
                {
                    Ok(msg_id) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Publishing);
                        }
                        state2.pending_ipfs_kind_upserts.update(|m| {
                            m.insert(msg_id, IpfsKindUpsertPending {
                                target_did: target.clone(),
                                protocol_id: protocol_id.clone(),
                                cmd_id,
                            });
                        });
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("msg-kind-publish-failed", &[("e", &e)]))
                    }
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
    let is_kind_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::KindEdit { .. })
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
    let is_crud_edit = move || {
        matches!(
            show.get().map(|c| c.mode),
            Some(EditorMode::CrudEdit { .. })
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
                        on:change=on_lang_change
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
                        on:click=on_eval_click
                    >{t("btn-eval")}</button>
                    // Cancel / Close — Standard + View; label adapts
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_standard() || is_view() { "" } else { "display:none" }
                        on:click=on_cancel
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
                        on:click=on_cancel
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
                        on:click=on_cancel
                    >{t("btn-cancel")}</button>
                    // Publish — KindEdit mode
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_kind_edit() { "" } else { "display:none" }
                        on:click=on_kind_publish.clone()
                    >{t("btn-publish")}</button>
                    // Cancel — KindEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_kind_edit() { "" } else { "display:none" }
                        on:click=on_cancel
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
                        on:click=on_cancel
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
                        on:click=on_cancel
                    >{t("btn-cancel")}</button>
                    // Save — CrudEdit mode
                    <button
                        class="editor-btn btn-save"
                        style=move || if is_crud_edit() { "" } else { "display:none" }
                        on:click=on_crud_save.clone()
                    >{t("btn-save")}</button>
                    // Cancel — CrudEdit mode
                    <button
                        class="editor-btn btn-cancel"
                        style=move || if is_crud_edit() { "" } else { "display:none" }
                        on:click=on_cancel
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
