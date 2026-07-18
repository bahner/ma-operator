/// CodeMirror 6 editor modal.
///
/// Driven by `RwSignal<Option<EditorContext>>`. When `Some`, renders a
/// full-screen overlay with a CM6 editor and action buttons:
///
/// - **Save** — persist the buffer to `EgoConfig`, keeping the editor open.
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
use crate::state::{AppState, PendingKind};

// ── JS bridge ─────────────────────────────────────────────────────────────

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "create")]
    fn js_editor_create(el_id: &str, value: &str, lang: &str);

    #[wasm_bindgen(js_namespace = ["window", "maEditor"], js_name = "getValue")]
    fn js_editor_get_value(el_id: &str) -> String;

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
    /// Save behaviour is determined by `is_link`:
    /// - `true` (the GET reply value was an `/ipfs/`- or `/ipns/`-prefixed
    ///   link) → serialise to DAG-CBOR, upload to IPFS, register the CID
    ///   (as an `/ipfs/<cid>` reference) via CRUD set at `crud_path`.
    /// - `false` → parse editor YAML, send inline via CRUD set at
    ///   `crud_path`.
    CrudEdit {
        /// DID of the runtime.
        target: String,
        /// Full CRUD path, e.g. `".entities.alice.fil"` or `".config.owners"`.
        crud_path: String,
        /// Whether the GET reply that opened this session was a link
        /// reference (`/ipfs/`, `/ipns/`, `/ipld/`-prefixed value). Drives
        /// the save handler — no further conditions needed.
        is_link: bool,
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
    /// The document path being edited (e.g. `.my.doc.foo`).
    pub doc_path: String,
    /// Editable "Save to" URL shown in the editor toolbar.
    /// Initialised from `doc_path` with alias resolution applied.
    /// The user may change it to redirect where the content is published.
    pub save_to: String,
    /// Initial content to load into the editor.
    pub initial: String,
    /// Language mode for CodeMirror (e.g. "markdown", "yaml").
    pub language: String,
    /// Determines which toolbar buttons are shown.
    pub mode: EditorMode,
    /// The command entry id that opened the editor, if any.
    /// Used to resolve the command status when the editor closes.
    pub cmd_id: Option<u64>,
}

impl EditorContext {
    pub fn new(doc_path: impl Into<String>, initial: impl Into<String>) -> Self {
        let doc_path = doc_path.into();
        let save_to = doc_path.clone();
        Self {
            doc_path,
            save_to,
            initial: initial.into(),
            language: "plain".to_string(),
            mode: EditorMode::Standard,
            cmd_id: None,
        }
    }

    pub fn with_save_to(mut self, save_to: impl Into<String>) -> Self {
        self.save_to = save_to.into();
        self
    }

    pub fn with_language(mut self, language: impl Into<String>) -> Self {
        self.language = language.into();
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

/// Re-resolve `(target_did, path)` from the "save to" toolbar field, which
/// the user may have edited to redirect where content gets published (e.g.
/// changing `@sky/entities/room` to `@sky/entities/restaurant`).
///
/// Returns `None` if the field isn't a valid `@alias/path` or `@did:ma:…/path`
/// reference (e.g. unknown alias, or no `/path` component) — callers should
/// fall back to the original `EditorMode` captured when the editor opened.
fn resolve_save_to(save_to: &str, config: &EgoConfig) -> Option<(String, String)> {
    let rest = save_to.trim().strip_prefix('@')?;
    let slash = rest.find('/')?;
    let (alias_or_did, path) = rest.split_at(slash);
    if path.len() <= 1 {
        return None;
    }
    let target = if alias_or_did.starts_with("did:") {
        alias_or_did.to_string()
    } else {
        config.resolve_alias(alias_or_did)?.to_string()
    };
    Some((target, path.to_string()))
}

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

    // Editable "Save to" URL — initialised from ctx.save_to when editor opens.
    let save_to = RwSignal::new(String::new());

    // Mount / unmount the CM6 editor when `show` changes.
    Effect::new({
        move |_| {
            match show.get() {
                Some(ref ctx) => {
                    save_to.set(ctx.save_to.clone());
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

    // Save button.
    let on_save = {
        let state = state.clone();
        move |_| {
            let Some(ctx) = show.get_untracked() else {
                return;
            };
            let text = js_editor_get_value(EDITOR_EL_ID);

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

            config.update(|c| c.set(&ctx.doc_path, &text));
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
            leptos::task::spawn_local(do_editor_reply(text, to, reply_to_id, state2));
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
            // Honour an edited "save to" field — e.g. redirecting from
            // `@sky/entities/room` to `@sky/entities/restaurant`.
            let (target, entity_name) = config
                .with_untracked(|c| resolve_save_to(&save_to.get_untracked(), c))
                .and_then(
                    |(t, p)| match crate::eval::actor::editor_mode_for_path(&p, &t) {
                        EditorMode::EntityEdit {
                            target,
                            entity_name,
                        } => Some((target, entity_name)),
                        _ => None,
                    },
                )
                .unwrap_or((target, entity_name));
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(do_entity_publish(text, target, entity_name, cmd_id, state2));
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
            // Honour an edited "save to" field.
            let (target, entity_name, field) = config
                .with_untracked(|c| resolve_save_to(&save_to.get_untracked(), c))
                .and_then(
                    |(t, p)| match crate::eval::actor::editor_mode_for_path(&p, &t) {
                        EditorMode::EntityFieldEdit {
                            target,
                            entity_name,
                            field,
                        } => Some((target, entity_name, field)),
                        _ => None,
                    },
                )
                .unwrap_or((target, entity_name, field));
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(do_entity_field_publish(
                text,
                target,
                entity_name,
                field,
                cmd_id,
                state2,
            ));
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
            // Honour an edited "save to" field (only the target may change;
            // the ACL path itself is always fixed).
            let target = config
                .with_untracked(|c| resolve_save_to(&save_to.get_untracked(), c))
                .map(|(t, _)| t)
                .unwrap_or(target);
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(do_acl_publish(text, target, cmd_id, state2));
        }
    };

    // CrudEdit — save handler; behaviour is driven entirely by `is_link`
    // from the GET reply that opened this session:
    //   is_link == true  → IPFS publish flow
    //   is_link == false → parse YAML → CBOR → inline CRUD set
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
                is_link,
            } = ctx.mode
            else {
                return;
            };
            // Honour an edited "save to" field.
            let (target, crud_path) = config
                .with_untracked(|c| resolve_save_to(&save_to.get_untracked(), c))
                .unwrap_or((target, crud_path));
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(do_crud_save(
                text, target, crud_path, is_link, cmd_id, state2,
            ));
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
            // Honour an edited "save to" field.
            let (target, protocol_id) = config
                .with_untracked(|c| resolve_save_to(&save_to.get_untracked(), c))
                .and_then(
                    |(t, p)| match crate::eval::actor::editor_mode_for_path(&p, &t) {
                        EditorMode::KindEdit {
                            target,
                            protocol_id,
                        } => Some((target, protocol_id)),
                        _ => None,
                    },
                )
                .unwrap_or((target, protocol_id));
            let cmd_id = ctx.cmd_id;
            show.set(None);
            let state2 = state.clone();
            leptos::task::spawn_local(do_kind_publish(text, target, protocol_id, cmd_id, state2));
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
                    // Editable "Save to" URL — hidden in View and Reply modes.
                    <input
                        type="text"
                        class="editor-doc-path"
                        style=move || if is_view() || is_reply() { "display:none" } else { "" }
                        prop:value=move || save_to.get()
                        on:input=move |ev| {
                            let val = event_target_value(&ev);
                            save_to.set(val);
                        }
                    />
                    // Static title in View / Reply modes.
                    <span
                        class="editor-doc-path"
                        style=move || if is_view() || is_reply() { "" } else { "display:none" }
                    >
                        {move || show.get().map(|c| c.doc_path).unwrap_or_default()}
                    </span>
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

// ── Editor save/publish handlers ────────────────────────────────────────────

async fn do_editor_reply(text: String, to: String, reply_to_id: String, state: AppState) {
    match crate::transport::send_text_reply(&to, &text, &reply_to_id).await {
        Ok(_) => state.push_system(t("msg-reply-sent")),
        Err(e) => state.push_error(tf("msg-reply-failed", &[("e", &e)])),
    }
}

async fn do_entity_publish(
    text: String,
    target: String,
    entity_name: String,
    cmd_id: Option<u64>,
    state: AppState,
) {
    let path = format!("/entities/{entity_name}");
    let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
        Ok(b) => b,
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
            return;
        }
    };
    match crate::transport::send_ipfs_store(&target, cbor_bytes, "application/vnd.ipld.dag-cbor")
        .await
    {
        Ok(msg_id) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Publishing);
            }
            state.register_pending(
                msg_id,
                PendingKind::IpfsCrud {
                    target_did: target.clone(),
                    crud_path: path.clone(),
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-entity-publish-failed", &[("e", &e)]))
        }
    }
}

async fn do_entity_field_publish(
    text: String,
    target: String,
    entity_name: String,
    field: String,
    cmd_id: Option<u64>,
    state: AppState,
) {
    let path = format!("/entities/{entity_name}/{field}");
    let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
        Ok(b) => b,
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-field-publish-failed", &[("e", &e)]));
            return;
        }
    };
    match crate::transport::send_ipfs_store(&target, cbor_bytes, "application/vnd.ipld.dag-cbor")
        .await
    {
        Ok(msg_id) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Publishing);
            }
            state.register_pending(
                msg_id,
                PendingKind::IpfsCrud {
                    target_did: target.clone(),
                    crud_path: path.clone(),
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-field-publish-failed", &[("e", &e)]))
        }
    }
}

async fn do_acl_publish(text: String, target: String, cmd_id: Option<u64>, state: AppState) {
    match crate::transport::send_ipfs_store(&target, text.into_bytes(), "text/yaml").await {
        Ok(msg_id) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Publishing);
            }
            state.register_pending(
                msg_id,
                PendingKind::IpfsCrud {
                    target_did: target.clone(),
                    crud_path: "acl".to_string(),
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-acl-publish-failed", &[("e", &e)]))
        }
    }
}

async fn do_crud_save(
    text: String,
    target: String,
    crud_path: String,
    is_link: bool,
    cmd_id: Option<u64>,
    state: AppState,
) {
    if is_link {
        let cbor_bytes = match crate::messages::yaml_any_to_dag_cbor(&text) {
            Ok(b) => b,
            Err(e) => {
                if let Some(cid) = cmd_id {
                    state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                }
                state.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
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
                    state.resolve_command_by_id(cid, CommandStatus::Publishing);
                }
                state.register_pending(
                    msg_id,
                    PendingKind::IpfsCrud {
                        target_did: target.clone(),
                        crud_path: crud_path.clone(),
                        cmd_id,
                    },
                    None,
                );
            }
            Err(e) => {
                if let Some(cid) = cmd_id {
                    state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                }
                state.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
            }
        }
    } else {
        // Inline data — parse YAML and send inline.
        let cbor_val = match crate::messages::yaml_to_cbor_value(&text) {
            Ok(v) => v,
            Err(e) => {
                if let Some(cid) = cmd_id {
                    state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                }
                state.push_error(tf("msg-entity-publish-failed", &[("e", &e)]));
                return;
            }
        };
        match crate::transport::send_crud_set(&target, &crud_path, cbor_val).await {
            Ok(set_msg_id) => {
                if let Some(original_cmd_id) = cmd_id {
                    state.register_pending(
                        set_msg_id,
                        PendingKind::CrudConfirm {
                            cmd_id: original_cmd_id,
                        },
                        None,
                    );
                }
            }
            Err(e) => {
                if let Some(cid) = cmd_id {
                    state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                }
                state.push_error(e);
            }
        }
    }
}

async fn do_kind_publish(
    text: String,
    target: String,
    protocol_id: String,
    cmd_id: Option<u64>,
    state: AppState,
) {
    let cbor_bytes = match crate::messages::yaml_to_dag_cbor(&text) {
        Ok(b) => b,
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-kind-publish-failed", &[("e", &e)]));
            return;
        }
    };
    match crate::transport::send_ipfs_store(&target, cbor_bytes, "application/vnd.ipld.dag-cbor")
        .await
    {
        Ok(msg_id) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Publishing);
            }
            state.register_pending(
                msg_id,
                PendingKind::IpfsKindUpsert {
                    target_did: target.clone(),
                    protocol_id: protocol_id.clone(),
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("msg-kind-publish-failed", &[("e", &e)]))
        }
    }
}
