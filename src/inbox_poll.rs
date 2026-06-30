//! Background inbox polling loop and reply dispatchers.
//!
//! `run_inbox_poll` is spawned once at login. It drains all three iroh queues
//! every 500 ms and routes each incoming message to the right handler.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    core::CommandStatus,
    http::{fetch_cid_bytes, fetch_cid_text},
    i18n::{t, tf},
    messages::IncomingMessage,
    state::{AppState, OutboxTask, PendingKind},
    transport,
    views::editor::{EditorContext, EditorMode},
};

// ── Public entry point ─────────────────────────────────────────────────────

pub async fn run_inbox_poll(
    state: AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
) {
    loop {
        gloo_timers::future::TimeoutFuture::new(500).await;
        if !transport::is_connected() {
            continue;
        }
        for incoming in transport::drain_inbox()
            .into_iter()
            .chain(transport::drain_rpc_inbox())
            .chain(transport::drain_crud_inbox())
        {
            route_incoming(incoming, &state, config, show_editor);
        }
    }
}

/// Route a single incoming message: filter, classify, and dispatch.
fn route_incoming(
    incoming: IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
) {
    if !acl_gate(&incoming, state, config) {
        return;
    }
    if handle_inbox_message(&incoming, state, config) {
        return;
    }
    if handle_unsolicited_rpc(&incoming, state) {
        return;
    }
    if loopback_suppress(&incoming) {
        return;
    }
    let display = format_display(&incoming, config);
    match incoming.reply_to.clone() {
        Some(msg_id) => dispatch_reply(&msg_id, incoming, display, state, show_editor),
        None => state.push_incoming(display, None, incoming.is_error),
    }
}

/// Dispatch a reply message by matching it against the pending-request table.
fn dispatch_reply(
    msg_id: &str,
    incoming: IncomingMessage,
    display: String,
    state: &AppState,
    show_editor: RwSignal<Option<EditorContext>>,
) {
    // Scheme-initiated RPC: route the reply directly to the waiting evaluator.
    if let Some(sender) = state.take_scheme_sender(msg_id) {
        let (_, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
        let result = if incoming.is_error {
            Err(text_opt.unwrap_or_else(|| display.clone()))
        } else {
            Ok(text_opt.unwrap_or_default())
        };
        let _ = sender.send(result);
        return;
    }

    // One-shot RPC from `send_rpc_and_wait`: route reply to the oneshot channel.
    if let Some(sender) = crate::state::AwaitingReply::take(msg_id) {
        let (_, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
        let result = if incoming.is_error {
            text_opt.unwrap_or_else(|| display.clone())
        } else {
            text_opt.unwrap_or_default()
        };
        let _ = sender.send(result);
        return;
    }

    let Some(kind) = state.take_pending(msg_id) else {
        web_sys::console::warn_1(
            &format!("[inbox] dropping stale reply (reply_to={msg_id}): {display}").into(),
        );
        return;
    };
    match kind {
        PendingKind::IpfsCrud {
            target_did,
            crud_path,
            cmd_id,
        } => {
            handle_ipfs_crud_reply(target_did, crud_path, cmd_id, &incoming, state);
        }
        PendingKind::IpfsKindUpsert {
            target_did,
            protocol_id,
            cmd_id,
        } => {
            handle_ipfs_kind_reply(target_did, protocol_id, cmd_id, &incoming, state);
        }
        PendingKind::ProfilePublish {
            publisher_did,
            cmd_id,
        } => {
            handle_profile_publish_reply(publisher_did, cmd_id, &incoming, state);
        }
        PendingKind::EditOpen {
            target,
            crud_path,
            editor_mode,
            cmd_id,
        } => {
            handle_edit_open_reply(
                target,
                crud_path,
                editor_mode,
                cmd_id,
                &incoming,
                state,
                show_editor,
            );
        }
        PendingKind::CidOp { op, args, cmd_id } => {
            handle_cid_op_reply(op, args, cmd_id, &incoming, state);
        }
        PendingKind::CrudConfirm { cmd_id } => {
            handle_crud_confirm(cmd_id, &incoming, state, &display);
        }
        PendingKind::Simple { cmd_id } => {
            let (status, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
            state.resolve_command_by_id(cmd_id, status);
            if let Some(text) = text_opt {
                state.push_incoming(text, Some(cmd_id), incoming.is_error);
            }
        }
    }
}

// ── Per-message filters ────────────────────────────────────────────────────

/// Returns false (and pushes a "blocked" message) when the ACL denies.
fn acl_gate(incoming: &IncomingMessage, state: &AppState, config: RwSignal<EgoConfig>) -> bool {
    if incoming.reply_to.is_some() {
        return true; // replies are never filtered
    }
    let cap = if incoming.message_type == ma_core::MESSAGE_TYPE_MESSAGE {
        crate::acl::CAP_INBOX
    } else {
        crate::acl::CAP_RPC
    };
    let cfg = config.get_untracked();
    if crate::acl::check_ego_acl(&cfg, &incoming.from, cap) {
        return true;
    }
    let (base, frag) = incoming
        .from
        .split_once('#')
        .unwrap_or((&incoming.from, ""));
    let from_disp = match cfg.reverse_alias(base) {
        Some(a) if frag.is_empty() => format!("@{a}"),
        Some(a) => format!("@{a}#{frag}"),
        None => incoming.from.clone(),
    };
    state.push_system(tf("msg-blocked", &[("cap", cap), ("from", &from_disp)]));
    false
}

/// Handle a plain text/chat/emote inbox message. Returns true when handled.
fn handle_inbox_message(
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    if incoming.message_type != ma_core::MESSAGE_TYPE_MESSAGE {
        return false;
    }
    let from_display = display_sender(incoming, config);
    let count = state.ingest_mailbox_message(incoming, config);
    if let Some(sess) = state.session.get_untracked() {
        let uname = sess.username.clone();
        let cfg_snap = config.get_untracked();
        spawn_local(async move {
            if let Err(e) = persist_config(&uname, &cfg_snap).await {
                web_sys::console::error_1(&format!("inbox persist: {e}").into());
            }
        });
    }
    state.push_incoming(
        tf(
            "msg-new-message",
            &[
                ("from", from_display.as_str()),
                ("count", &count.to_string()),
            ],
        ),
        None,
        false,
    );
    true
}

/// Auto-pong :ping; silently drop all other unsolicited RPC. Returns true when handled.
fn handle_unsolicited_rpc(incoming: &IncomingMessage, _state: &AppState) -> bool {
    if incoming.reply_to.is_some() || incoming.message_type != ma_core::MESSAGE_TYPE_RPC {
        return false;
    }
    // Room events are broadcast unsolicited RPC — let them through to display.
    if incoming.content_type == "application/x-ma-room-event" {
        return false;
    }
    if let Ok(ciborium::Value::Text(atom)) =
        ciborium::de::from_reader::<ciborium::Value, _>(&mut &incoming.content[..])
    {
        if atom == ":ping" {
            let pong_target = incoming.from.clone();
            let pong_reply_to = incoming.message_id.clone();
            _state.outbox_queue.update(|q| {
                q.push_back(OutboxTask::RpcPong {
                    target: pong_target,
                    reply_to_id: pong_reply_to,
                });
            });
        }
    }
    // Drop all unsolicited RPC including unknown verbs and loopback echoes.
    true
}

/// Drop non-reply messages from our own DID (loopback echo). Returns true when suppressed.
fn loopback_suppress(incoming: &IncomingMessage) -> bool {
    if incoming.reply_to.is_some() {
        return false;
    }
    let own_did = transport::get_sender_did().unwrap_or_default();
    !own_did.is_empty() && incoming.from == own_did
}

/// Build the display string for an incoming message (alias substitution).
fn format_display(incoming: &IncomingMessage, config: RwSignal<EgoConfig>) -> String {
    let cfg = config.get_untracked();
    let (base, frag) = incoming
        .from
        .split_once('#')
        .unwrap_or((&incoming.from, ""));
    let Some(alias) = cfg.reverse_alias(base) else {
        return incoming.display.clone();
    };
    let bare = incoming.message_type == ma_core::MESSAGE_TYPE_EMOTE
        || incoming.message_type == ma_core::MESSAGE_TYPE_CHAT;
    let replacement = if bare {
        if frag.is_empty() {
            alias.to_string()
        } else {
            format!("{alias}#{frag}")
        }
    } else if frag.is_empty() {
        format!("@{alias}")
    } else {
        format!("@{alias}#{frag}")
    };
    incoming.display.replace(&incoming.from, &replacement)
}

/// Alias-resolved sender string for display in inbox notifications.
fn display_sender(incoming: &IncomingMessage, config: RwSignal<EgoConfig>) -> String {
    let cfg = config.get_untracked();
    let (base, frag) = incoming
        .from
        .split_once('#')
        .unwrap_or((&incoming.from, ""));
    match cfg.reverse_alias(base) {
        Some(a) if frag.is_empty() => format!("@{a}"),
        Some(a) => format!("@{a}#{frag}"),
        None => incoming.from.clone(),
    }
}

// ── Reply handlers ─────────────────────────────────────────────────────────

/// IPFS-store reply → trigger a CRUD SET with the returned CID.
fn handle_ipfs_crud_reply(
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
            state.outbox_queue.update(|q| {
                q.push_back(OutboxTask::CrudSet {
                    target_did,
                    crud_path,
                    value: ciborium::Value::Text(cid),
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
fn handle_ipfs_kind_reply(
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
            state.outbox_queue.update(|q| {
                q.push_back(OutboxTask::CrudSet {
                    target_did,
                    crud_path: ".kinds".to_string(),
                    value: ciborium::Value::Array(vec![
                        ciborium::Value::Text(protocol_id),
                        ciborium::Value::Text(cid),
                    ]),
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

/// Profile-publish reply: the encrypted blob CID is now stored — republish DID doc.
fn handle_profile_publish_reply(
    publisher_did: String,
    cmd_id: Option<u64>,
    incoming: &IncomingMessage,
    state: &AppState,
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
            // Store profile CID in session — it will be embedded in the next DID publish.
            crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(cid_str.clone()));
            if let Some(id) = cmd_id {
                state.resolve_command_by_id(id, CommandStatus::Replied(cid_str.clone()));
                state.push_incoming(cid_str, Some(id), false);
            }
            // Re-publish DID document so ma.profile is updated (fire-and-forget).
            let publisher_did2 = publisher_did.clone();
            leptos::task::spawn_local(async move {
                let _ = crate::transport::send_ipfs_publish(&publisher_did2).await;
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

/// Edit-open reply: decode the CBOR payload and open the editor in the right mode.
fn handle_edit_open_reply(
    target: String,
    crud_path: String,
    editor_mode: EditorMode,
    cmd_id: u64,
    incoming: &IncomingMessage,
    state: &AppState,
    show_editor: RwSignal<Option<EditorContext>>,
) {
    if incoming.is_error {
        state.resolve_command_by_id(cmd_id, CommandStatus::Error(incoming.display.clone()));
        state.push_error(incoming.display.clone());
        return;
    }
    let content_bytes = incoming.content.clone();
    let content_type = incoming.content_type.clone();
    let doc_path = format!("@{}{}", target, crud_path);
    let state2 = state.clone();
    let editor_mode = match editor_mode {
        EditorMode::CrudEdit {
            target, crud_path, ..
        } => EditorMode::CrudEdit {
            target,
            crud_path,
            content_type: content_type.clone(),
        },
        other => other,
    };

    match content_type.as_str() {
        "application/x-ma-term+dag-cbor" => {
            open_editor_via_cid(
                state2,
                show_editor,
                doc_path,
                content_bytes,
                editor_mode,
                cmd_id,
            );
        }
        "application/x-ma-term+cbor" => match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
            Ok(yaml) => open_editor(show_editor, doc_path, yaml, "yaml", editor_mode, cmd_id),
            Err(e) => edit_error(&state2, cmd_id, "err-edit-decode-failed", &e),
        },
        "application/x-ma-term+yaml" => {
            open_editor_from_yaml_cbor(
                state2,
                show_editor,
                doc_path,
                content_bytes,
                editor_mode,
                cmd_id,
            );
        }
        _ => {
            // Unknown / legacy content-type — best-effort CBOR → YAML.
            match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
                Ok(yaml) => open_editor(show_editor, doc_path, yaml, "yaml", editor_mode, cmd_id),
                Err(e) => edit_error(&state2, cmd_id, "err-edit-decode-failed", &e),
            }
        }
    }
}

/// Open the editor immediately with a known YAML string.
fn open_editor(
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    yaml: String,
    language: &str,
    mode: EditorMode,
    cmd_id: u64,
) {
    show_editor.set(Some(
        EditorContext::new(doc_path, yaml)
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

/// For `application/x-ma-term+dag-cbor`: extract a CID from the payload,
/// fetch it, convert to YAML, and open the editor.
fn open_editor_via_cid(
    state: AppState,
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    content_bytes: Vec<u8>,
    mode: EditorMode,
    cmd_id: u64,
) {
    match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
        Ok(ciborium::Value::Text(cid)) => {
            spawn_local(async move {
                match fetch_cid_bytes(&cid).await {
                    Ok(bytes) => match crate::messages::cbor_bytes_to_yaml(&bytes) {
                        Ok(yaml) => open_editor(show_editor, doc_path, yaml, "yaml", mode, cmd_id),
                        Err(e) => edit_error(&state, cmd_id, "err-edit-decode-failed", &e),
                    },
                    Err(e) => edit_error(&state, cmd_id, "err-edit-fetch-failed", &e),
                }
            });
        }
        Ok(_) | Err(_) => {
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(t("err-edit-cbor")));
            state.push_error(t("err-edit-cbor"));
        }
    }
}

/// For `application/x-ma-term+yaml`: unwrap the CBOR text wrapper, or fall
/// back to raw CBOR → YAML conversion.
fn open_editor_from_yaml_cbor(
    state: AppState,
    show_editor: RwSignal<Option<EditorContext>>,
    doc_path: String,
    content_bytes: Vec<u8>,
    mode: EditorMode,
    cmd_id: u64,
) {
    match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
        Ok(ciborium::Value::Text(yaml)) => {
            open_editor(show_editor, doc_path, yaml, "yaml", mode, cmd_id);
        }
        Ok(_) | Err(_) => match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
            Ok(yaml) => open_editor(show_editor, doc_path, yaml, "yaml", mode, cmd_id),
            Err(e) => edit_error(&state, cmd_id, "err-edit-decode-failed", &e),
        },
    }
}

/// CID content-op reply: fetch the CID and apply the op (cat/head/tail/wc).
fn handle_cid_op_reply(
    op: String,
    args: Vec<String>,
    cmd_id: u64,
    incoming: &IncomingMessage,
    state: &AppState,
) {
    if incoming.is_error {
        state.resolve_command_by_id(cmd_id, CommandStatus::Error(incoming.display.clone()));
        state.push_error(incoming.display.clone());
        return;
    }
    let content_bytes = incoming.content.clone();
    let fallback_display = incoming.display.clone();
    let state2 = state.clone();
    spawn_local(async move {
        match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
            Ok(ciborium::Value::Text(cid))
                if (cid.starts_with('b') || cid.starts_with('Q')) && cid.len() > 10 =>
            {
                match fetch_cid_text(&cid).await {
                    Ok(text) => {
                        let args_ref: Vec<&str> = args.iter().map(|s| s.as_str()).collect();
                        for line in crate::cid_ops::apply(&op, &text, &args_ref) {
                            state2.push_output(line);
                        }
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Done);
                    }
                    Err(e) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("cid-op-fetch-failed", &[("e", &e)]));
                    }
                }
            }
            _ => {
                // Not a CID — display as plain text.
                state2.push_output(fallback_display);
                state2.resolve_command_by_id(cmd_id, CommandStatus::Done);
            }
        }
    });
}

/// CRUD SET confirmation (end of the IPFS-store → CRUD-SET publish flow).
fn handle_crud_confirm(cmd_id: u64, incoming: &IncomingMessage, state: &AppState, display: &str) {
    let (status, push_opt) = classify_reply(&incoming.content, incoming.is_error, display);
    state.resolve_command_by_id(cmd_id, status);
    if let Some(text) = push_opt {
        state.push_incoming(text, Some(cmd_id), incoming.is_error);
    }
}

// ── Reply classifier ───────────────────────────────────────────────────────

/// Classify an incoming reply into a `CommandStatus` transition and optional
/// display text to print below the command line.
pub fn classify_reply(
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
