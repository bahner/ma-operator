//! Handlers for replies to requests *we* sent.
//!
//! Each `handle_*_reply` function corresponds to one `PendingKind` variant and
//! is called from `inbox_poll::dispatch_reply` when a matching reply arrives.

use ciborium::Value as CborValue;
use leptos::prelude::*;
use ma_core::{CONTENT_TYPE_TERM_CBOR, CONTENT_TYPE_TERM_YAML};
use ma_zscheme::SchemeVal;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    core::CommandStatus,
    eval::is_remote_fetch_root,
    http::fetch_path_bytes,
    i18n::tf,
    messages::IncomingMessage,
    state::{AppState, OutboxTask},
    views::editor::{EditorContext, EditorMode},
};

// ── IPFS CRUD ──────────────────────────────────────────────────────────────

/// IPFS-store reply → trigger a CRUD SET with the returned CID.
pub(crate) fn handle_ipfs_crud_reply(
    target_did: String,
    crud_path: String,
    cmd_id: Option<u64>,
    incoming: &IncomingMessage,
    state: &AppState,
) {
    if incoming.is_error {
        if let Some(cid) = cmd_id {
            state.resolve_command_by_id(cid, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid) => {
            let ipfs_ref = format!("/ipfs/{cid}");
            state.outbox_queue.update(|q| {
                q.push_back(OutboxTask::CrudSet {
                    target_did,
                    crud_path,
                    value: ciborium::Value::Text(ipfs_ref),
                    cmd_id,
                });
            });
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
}

/// IPFS-store reply for a kind upsert → trigger a CRUD SET on `.kinds`.
pub(crate) fn handle_ipfs_kind_reply(
    target_did: String,
    protocol_id: String,
    cmd_id: Option<u64>,
    incoming: &IncomingMessage,
    state: &AppState,
) {
    if incoming.is_error {
        if let Some(cid) = cmd_id {
            state.resolve_command_by_id(cid, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid) => {
            // Path: /kinds/ma/avatar/0.0.1 (strip leading / from protocol_id)
            let path = format!("/kinds{}", protocol_id);
            state.outbox_queue.update(|q| {
                q.push_back(OutboxTask::CrudSet {
                    target_did,
                    crud_path: path,
                    value: ciborium::Value::Text(format!("/ipfs/{cid}")),
                    cmd_id,
                });
            });
        }
        Err(e) => {
            if let Some(cid) = cmd_id {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
}

// ── Profile publish ────────────────────────────────────────────────────────

/// Profile-publish reply: the encrypted blob CID is now stored — republish DID doc.
pub(crate) fn handle_profile_publish_reply(
    publisher_did: String,
    cmd_id: Option<u64>,
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    if incoming.is_error {
        if let Some(id) = cmd_id {
            state.resolve_command_by_id(id, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid_str) => {
            // Store profile CID in session — embedded in the DID document on next publish.
            crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(cid_str.clone()));
            // Record publish timestamp so the startup guard can detect IPNS-lagged
            // DID docs on the next login and skip the merge (preserving local state).
            let now = js_sys::Date::new_0()
                .to_iso_string()
                .as_string()
                .unwrap_or_default();
            config.update(|c| c.set(EgoConfig::PROFILE_PUBLISHED_AT_KEY, &now));
            let username = state
                .session
                .get_untracked()
                .map(|s| s.username.clone())
                .unwrap_or_default();
            // Republish DID document with ma.profile = new CID embedded.
            // For tracked commands the DID-doc reply is the visible result;
            // for untracked commands push 間 on completion.
            let state2 = state.clone();
            let cfg_snap = config.get_untracked();
            leptos::task::spawn_local(async move {
                let _ = persist_config(&username, &cfg_snap).await;
                match crate::transport::send_identity_publish(&publisher_did).await {
                    Ok(did_msg_id) => {
                        if let Some(id) = cmd_id {
                            // Bind the DID-doc reply to the original terminal command.
                            state2.bind_message_id(id, did_msg_id);
                        } else {
                            state2.push_output("間");
                        }
                    }
                    Err(e) => {
                        if let Some(id) = cmd_id {
                            state2.resolve_command_by_id(id, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(e);
                    }
                }
            });
        }
        Err(e) => {
            if let Some(id) = cmd_id {
                state.resolve_command_by_id(id, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
}

// ── Editor open ────────────────────────────────────────────────────────────

/// Shared handles needed to react to a reply and (possibly) open the editor.
/// Bundles the three values that are threaded through every reply handler in
/// this module, keeping individual handler signatures short.
#[derive(Clone, Copy)]
pub(crate) struct ReplyContext<'a> {
    pub state: &'a AppState,
    pub config: RwSignal<EgoConfig>,
    pub show_editor: RwSignal<Option<EditorContext>>,
}

/// Edit-open reply: decode the CBOR payload and open the editor in the right mode.
pub(crate) fn handle_edit_open_reply(
    target: String,
    crud_path: String,
    editor_mode: EditorMode,
    cmd_id: u64,
    incoming: &IncomingMessage,
    ctx: &ReplyContext,
) {
    let ReplyContext {
        state,
        config,
        show_editor,
    } = *ctx;
    // Resolve alias: show @sky/path instead of @did:ma:.../path in the editor toolbar.
    let display_target = config.with_untracked(|c| {
        c.reverse_alias(&target)
            .map(|a| a.to_string())
            .unwrap_or_else(|| target.clone())
    });
    let save_to = format!("@{}{}", display_target, crud_path);
    // For KindEdit, show just the crud_path (e.g. /kinds/ma/avatar/0.0.1) as title.
    // For everything else, include the target DID to make the path unambiguous.
    let doc_path = match &editor_mode {
        EditorMode::KindEdit { .. } => crud_path.clone(),
        _ => format!("@{}{}", target, crud_path),
    };

    if incoming.is_error {
        // GET failed because the entity/kind doesn't exist yet — for modes that
        // support creating a new one via Publish (an upsert on the runtime side),
        // open a blank editor instead of just erroring out. Any other error
        // (ACL denial, network, etc.) still fails normally.
        let creatable = matches!(
            editor_mode,
            EditorMode::EntityEdit { .. }
                | EditorMode::EntityFieldEdit { .. }
                | EditorMode::KindEdit { .. }
                | EditorMode::CrudEdit {
                    creatable: true,
                    ..
                }
        );
        let not_found = is_missing_for_creatable_edit(incoming);
        if creatable && not_found {
            state.resolve_command_by_id(cmd_id, CommandStatus::Done);
            show_editor.set(Some(
                EditorContext::new(doc_path, String::new())
                    .with_save_to(save_to)
                    .with_language("yaml")
                    .with_mode(editor_mode)
                    .with_cmd_id(cmd_id),
            ));
            return;
        }
        state.resolve_command_by_id(cmd_id, CommandStatus::Error(incoming.display.clone()));
        state.push_error(incoming.display.clone());
        return;
    }
    let content_bytes = incoming.content.clone();
    let content_type = incoming.content_type.clone();
    let state2 = state.clone();

    // Decode the value once so we can tell whether this GET reply is a link
    // reference (`/ipfs/`, `/ipns/`, `/ipld/`-prefixed) that needs to be
    // fetched and resolved, or inline data to be displayed as-is. This
    // mirrors the SET-side convention (ma-crud-service-v1.md §3.3/§4) and
    // replaces the old dedicated `+dag-cbor` content-type.
    let link_path: Option<String> = match content_type.as_str() {
        t if t == "text/yaml" || t == CONTENT_TYPE_TERM_CBOR || t == CONTENT_TYPE_TERM_YAML => None,
        _ => match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
            Ok(ciborium::Value::Text(s)) if is_remote_fetch_root(&s) => Some(s),
            _ => None,
        },
    };
    let editor_mode = match editor_mode {
        EditorMode::CrudEdit {
            target,
            crud_path,
            creatable,
            ..
        } => EditorMode::CrudEdit {
            target,
            crud_path,
            creatable,
            is_link: link_path.is_some(),
        },
        other => other,
    };

    match content_type.as_str() {
        "text/yaml" => {
            // Content is [":ok", yaml_string] CBOR — unwrap and open editor.
            match crate::messages::extract_ok_yaml(&content_bytes) {
                Ok(yaml) => open_editor(
                    show_editor,
                    doc_path,
                    save_to,
                    yaml,
                    "yaml",
                    editor_mode,
                    cmd_id,
                ),
                Err(e) => edit_error(&state2, cmd_id, "err-edit-decode-failed", &e),
            }
        }
        CONTENT_TYPE_TERM_CBOR => match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
            Ok(yaml) => open_editor(
                show_editor,
                doc_path,
                save_to,
                yaml,
                "yaml",
                editor_mode,
                cmd_id,
            ),
            Err(e) => edit_error(&state2, cmd_id, "err-edit-decode-failed", &e),
        },
        CONTENT_TYPE_TERM_YAML => {
            open_editor_from_yaml_cbor(
                state2,
                show_editor,
                doc_path,
                save_to,
                content_bytes,
                editor_mode,
                cmd_id,
            );
        }
        _ => {
            if let Some(path) = link_path {
                open_editor_via_path(
                    state2,
                    show_editor,
                    doc_path,
                    save_to,
                    path,
                    editor_mode,
                    cmd_id,
                );
            } else {
                // Inline data — best-effort CBOR → YAML.
                match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
                    Ok(yaml) => open_editor(
                        show_editor,
                        doc_path,
                        save_to,
                        yaml,
                        "yaml",
                        editor_mode,
                        cmd_id,
                    ),
                    Err(e) => edit_error(&state2, cmd_id, "err-edit-decode-failed", &e),
                }
            }
        }
    }
}

fn is_missing_for_creatable_edit(incoming: &IncomingMessage) -> bool {
    has_missing_marker(&incoming.display)
        || match ciborium::de::from_reader::<CborValue, _>(&mut &incoming.content[..]) {
            Ok(CborValue::Text(s)) => has_missing_marker(&s),
            Ok(CborValue::Array(items)) => items.iter().any(|item| match item {
                CborValue::Text(s) => has_missing_marker(s),
                _ => false,
            }),
            _ => false,
        }
}

fn has_missing_marker(text: &str) -> bool {
    let text = text.to_ascii_lowercase();
    text.contains("not found") || text.contains("not-found")
}

/// Open the editor immediately with a known YAML string.
fn open_editor(
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    save_to: String,
    yaml: String,
    language: &str,
    mode: EditorMode,
    cmd_id: u64,
) {
    show_editor.set(Some(
        EditorContext::new(doc_path, yaml)
            .with_save_to(save_to)
            .with_language(language)
            .with_mode(mode)
            .with_cmd_id(cmd_id),
    ));
}

/// Record an edit-open error on the command and push an error line.
fn edit_error(state: &AppState, cmd_id: u64, i18n_key: &str, e: &str) {
    state.resolve_command_by_id(cmd_id, CommandStatus::Error(e.to_string()));
    state.push_error(tf(i18n_key, &[("e", e)]));
}

/// For a `/ipfs/`, `/ipns/`, or `/ipld/`-prefixed link value: fetch the
/// referenced content, convert to YAML, and open the editor.
fn open_editor_via_path(
    state: AppState,
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    save_to: String,
    path: String,
    mode: EditorMode,
    cmd_id: u64,
) {
    spawn_local(async move {
        match fetch_path_bytes(&path).await {
            Ok(bytes) => match crate::messages::cbor_bytes_to_yaml(&bytes) {
                Ok(yaml) => open_editor(show_editor, doc_path, save_to, yaml, "yaml", mode, cmd_id),
                Err(e) => edit_error(&state, cmd_id, "err-edit-decode-failed", &e),
            },
            Err(e) => edit_error(&state, cmd_id, "err-edit-fetch-failed", &e),
        }
    });
}

/// For `application/vnd.ma.term+yaml`: unwrap the CBOR text wrapper, or fall
/// back to raw CBOR → YAML conversion.
fn open_editor_from_yaml_cbor(
    state: AppState,
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    save_to: String,
    content_bytes: Vec<u8>,
    mode: EditorMode,
    cmd_id: u64,
) {
    match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
        Ok(ciborium::Value::Text(yaml)) => {
            open_editor(show_editor, doc_path, save_to, yaml, "yaml", mode, cmd_id);
        }
        Ok(_) | Err(_) => match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
            Ok(yaml) => open_editor(show_editor, doc_path, save_to, yaml, "yaml", mode, cmd_id),
            Err(e) => edit_error(&state, cmd_id, "err-edit-decode-failed", &e),
        },
    }
}

// ── CRUD confirm ───────────────────────────────────────────────────────────

/// CRUD SET confirmation (end of the IPFS-store → CRUD-SET publish flow).
pub(crate) fn handle_crud_confirm(
    cmd_id: u64,
    incoming: &IncomingMessage,
    state: &AppState,
    display: &str,
    config: RwSignal<EgoConfig>,
) {
    let (status, push_opt) = classify_reply(&incoming.content, incoming.is_error, display);
    state.resolve_command_by_id(cmd_id, status);
    if let Some(text) = push_opt {
        let text = config.get_untracked().substitute_dids(&text);
        state.push_incoming(text, Some(cmd_id), incoming.is_error);
    }
}

// ── Reply classifier ───────────────────────────────────────────────────────

/// Classify an incoming reply into a `CommandStatus` transition and optional
/// display text to print below the command line.
pub(crate) fn classify_reply(
    content: &[u8],
    is_error: bool,
    fallback: &str,
) -> (CommandStatus, Option<String>) {
    use ciborium::Value as V;
    if is_error {
        let reason = match ciborium::de::from_reader::<V, _>(&mut &content[..]) {
            Ok(V::Array(items)) => items
                .get(1)
                .and_then(|v| {
                    if let V::Text(s) = v {
                        Some(s.clone())
                    } else {
                        None
                    }
                })
                .unwrap_or_else(|| fallback.to_string()),
            _ => fallback.to_string(),
        };
        return (CommandStatus::Error(String::new()), Some(reason));
    }
    match ciborium::de::from_reader::<V, _>(&mut &content[..]) {
        Ok(V::Text(s)) => {
            if s == ":ok" {
                (CommandStatus::Replied(String::new()), None)
            } else {
                (CommandStatus::Replied(String::new()), Some(s))
            }
        }
        Ok(V::Array(items)) => match (items.first(), items.get(1)) {
            (Some(V::Text(verb)), value) if verb == ":ok" => match value {
                Some(V::Text(s)) => (CommandStatus::Replied(String::new()), Some(s.clone())),
                Some(_) => (
                    CommandStatus::Replied(String::new()),
                    Some(fallback.to_string()),
                ),
                None => (CommandStatus::Replied(String::new()), None),
            },
            (Some(V::Text(verb)), value) if verb == ":error" => {
                let reason = value
                    .and_then(|v| {
                        if let V::Text(s) = v {
                            Some(s.clone())
                        } else {
                            None
                        }
                    })
                    .unwrap_or_else(|| fallback.to_string());
                (CommandStatus::Error(String::new()), Some(reason))
            }
            _ => (
                CommandStatus::Replied(String::new()),
                Some(fallback.to_string()),
            ),
        },
        _ => (
            CommandStatus::Replied(String::new()),
            Some(fallback.to_string()),
        ),
    }
}

// ── CBOR → SchemeVal conversion ───────────────────────────────────────

fn cbor_to_scheme_val(v: &ciborium::Value) -> SchemeVal {
    use ciborium::Value as V;
    match v {
        V::Text(s) => SchemeVal::Str(s.clone()),
        V::Integer(n) => SchemeVal::Int(i128::from(*n) as i64),
        V::Float(f) => SchemeVal::Float(*f),
        V::Bool(b) => SchemeVal::Bool(*b),
        V::Null => SchemeVal::Nil,
        V::Array(items) => SchemeVal::List(items.iter().map(cbor_to_scheme_val).collect()),
        V::Map(pairs) => SchemeVal::List(
            pairs
                .iter()
                .map(|(k, v)| SchemeVal::List(vec![cbor_to_scheme_val(k), cbor_to_scheme_val(v)]))
                .collect(),
        ),
        V::Tag(_, inner) => cbor_to_scheme_val(inner),
        _ => SchemeVal::Str(format!("{v:?}")),
    }
}

/// Decode a raw CBOR reply payload into a `SchemeVal`, unwrapping the
/// `[:ok, payload]` envelope. Used by `inbox_poll::dispatch_reply` for
/// Scheme-initiated RPC calls so the evaluator receives structured values.
pub(crate) fn cbor_reply_to_scheme_val(
    content: &[u8],
    is_error: bool,
    fallback: &str,
) -> Result<SchemeVal, String> {
    use ciborium::Value as V;
    if is_error {
        let reason = match ciborium::de::from_reader::<V, _>(&mut &content[..]) {
            Ok(V::Array(items)) => items
                .get(1)
                .and_then(|v| {
                    if let V::Text(s) = v {
                        Some(s.clone())
                    } else {
                        None
                    }
                })
                .unwrap_or_else(|| fallback.to_string()),
            _ => fallback.to_string(),
        };
        return Err(reason);
    }
    let val: V = match ciborium::de::from_reader(&mut &content[..]) {
        Ok(v) => v,
        Err(_) => return Ok(SchemeVal::Str(fallback.to_string())),
    };
    match &val {
        V::Text(s) if s == ":ok" => Ok(SchemeVal::Nil),
        V::Array(items) => match (items.first(), items.get(1)) {
            (Some(V::Text(verb)), _) if verb == ":ok" => match items.get(1) {
                Some(v) => Ok(cbor_to_scheme_val(v)),
                None => Ok(SchemeVal::Nil),
            },
            (Some(V::Text(verb)), _) if verb == ":error" => {
                let reason = items
                    .get(1)
                    .and_then(|v| {
                        if let V::Text(s) = v {
                            Some(s.clone())
                        } else {
                            None
                        }
                    })
                    .unwrap_or_else(|| fallback.to_string());
                Err(reason)
            }
            _ => Ok(cbor_to_scheme_val(&val)),
        },
        _ => Ok(cbor_to_scheme_val(&val)),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn error_reply(reason: &str, display: &str) -> IncomingMessage {
        let mut content = Vec::new();
        ciborium::ser::into_writer(
            &CborValue::Array(vec![
                CborValue::Text(":error".to_string()),
                CborValue::Text(reason.to_string()),
            ]),
            &mut content,
        )
        .expect("encode test CBOR");

        IncomingMessage {
            message_id: "reply-1".to_string(),
            message_type: "application/vnd.ma.rpc.reply".to_string(),
            from: "did:ma:test-runtime".to_string(),
            to: "did:ma:test-user".to_string(),
            reply_to: Some("request-1".to_string()),
            content_type: CONTENT_TYPE_TERM_CBOR.to_string(),
            content,
            created_at: 0,
            exp: 0,
            display: display.to_string(),
            is_error: true,
        }
    }

    #[test]
    fn creatable_edit_missing_detects_hyphenated_runtime_code() {
        let incoming = error_reply("kind-not-found", "fot: kind-not-found");

        assert!(is_missing_for_creatable_edit(&incoming));
    }

    #[test]
    fn creatable_edit_missing_rejects_other_errors() {
        let incoming = error_reply("acl-denied", "fot: acl-denied");

        assert!(!is_missing_for_creatable_edit(&incoming));
    }
}
