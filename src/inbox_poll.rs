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
    state::AppState,
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
            if !acl_gate(&incoming, &state, config) {
                continue;
            }
            if handle_inbox_message(&incoming, &state, config) {
                continue;
            }
            if handle_unsolicited_rpc(&incoming, &state) {
                continue;
            }
            if loopback_suppress(&incoming) {
                continue;
            }

            let display = format_display(&incoming, config);

            match &incoming.reply_to {
                Some(msg_id) => {
                    if handle_ipfs_crud_reply(msg_id, &incoming, &state, config) {
                        continue;
                    }
                    if handle_ipfs_kind_reply(msg_id, &incoming, &state, config) {
                        continue;
                    }
                    if handle_profile_publish_reply(msg_id, &incoming, &state, config) {
                        continue;
                    }
                    if handle_edit_open_reply(msg_id, &incoming, &state, show_editor) {
                        continue;
                    }
                    if handle_cid_op_reply(msg_id, &incoming, &state) {
                        continue;
                    }
                    if handle_crud_confirm(msg_id, &incoming, &state, &display) {
                        continue;
                    }
                    // Generic reply — resolve the waiting command.
                    let (status, push_opt) =
                        classify_reply(&incoming.content, incoming.is_error, &display);
                    let cmd_id = state.resolve_command(msg_id, status);
                    if let Some(text) = push_opt {
                        state.push_incoming(text, cmd_id, incoming.is_error);
                    }
                }
                None => {
                    state.push_incoming(display, None, incoming.is_error);
                }
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
    if let Ok(ciborium::Value::Text(atom)) =
        ciborium::de::from_reader::<ciborium::Value, _>(&mut &incoming.content[..])
    {
        if atom == ":ping" {
            let pong_target = incoming.from.clone();
            let pong_reply_to = incoming.message_id.clone();
            spawn_local(async move {
                let _ = transport::send_rpc_pong(&pong_target, &pong_reply_to).await;
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

// ── Reply handlers — each returns true when it consumed the message ────────

/// IPFS-store reply → trigger a CRUD SET with the returned CID.
fn handle_ipfs_crud_reply(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    _config: RwSignal<EgoConfig>,
) -> bool {
    let pending = state.pending_ipfs_crud.get_untracked().get(msg_id).cloned();
    let Some(p) = pending else { return false };
    let (crud_target, crud_path, cmd_id_opt) = (p.target_did, p.crud_path, p.cmd_id);
    state.pending_ipfs_crud.update(|m| {
        m.remove(msg_id);
    });
    if incoming.is_error {
        if let Some(cid) = cmd_id_opt {
            state.resolve_command_by_id(cid, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return true;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid) => {
            let state2 = state.clone();
            spawn_local(async move {
                match crate::transport::send_crud_set(
                    &crud_target,
                    &crud_path,
                    ciborium::Value::Text(cid),
                )
                .await
                {
                    Ok(set_msg_id) => {
                        if let Some(original_cmd_id) = cmd_id_opt {
                            state2.pending_crud_confirms.update(|m| {
                                m.insert(set_msg_id, original_cmd_id);
                            });
                        }
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id_opt {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(e);
                    }
                }
            });
        }
        Err(e) => {
            if let Some(cid) = cmd_id_opt {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
    true
}

/// IPFS-store reply for a kind upsert → trigger a CRUD SET on `.kinds`.
fn handle_ipfs_kind_reply(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    _config: RwSignal<EgoConfig>,
) -> bool {
    let pending = state
        .pending_ipfs_kind_upserts
        .get_untracked()
        .get(msg_id)
        .cloned();
    let Some(p) = pending else { return false };
    let (kind_target, protocol_id, cmd_id_opt) = (p.target_did, p.protocol_id, p.cmd_id);
    state.pending_ipfs_kind_upserts.update(|m| {
        m.remove(msg_id);
    });
    if incoming.is_error {
        if let Some(cid) = cmd_id_opt {
            state.resolve_command_by_id(cid, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return true;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid) => {
            let state2 = state.clone();
            spawn_local(async move {
                match crate::transport::send_crud_set(
                    &kind_target,
                    ".kinds",
                    ciborium::Value::Array(vec![
                        ciborium::Value::Text(protocol_id.clone()),
                        ciborium::Value::Text(cid),
                    ]),
                )
                .await
                {
                    Ok(set_msg_id) => {
                        if let Some(original_cmd_id) = cmd_id_opt {
                            state2.pending_crud_confirms.update(|m| {
                                m.insert(set_msg_id, original_cmd_id);
                            });
                        }
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id_opt {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(e);
                    }
                }
            });
        }
        Err(e) => {
            if let Some(cid) = cmd_id_opt {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
    true
}

/// Profile-publish reply: the encrypted blob CID is now stored — republish DID doc.
fn handle_profile_publish_reply(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    let pending = state
        .pending_profile_publish
        .get_untracked()
        .get(msg_id)
        .cloned();
    let Some(p) = pending else { return false };
    let (ma_did, cmd_id_opt) = (p.publisher_did, p.cmd_id);
    state.pending_profile_publish.update(|m| {
        m.remove(msg_id);
    });
    if incoming.is_error {
        if let Some(cid) = cmd_id_opt {
            state.resolve_command_by_id(cid, CommandStatus::Error(incoming.display.clone()));
        }
        state.push_error(incoming.display.clone());
        return true;
    }
    match crate::messages::extract_ok_text(&incoming.content) {
        Ok(cid_str) => {
            crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(cid_str.clone()));
            let own_username = state
                .session
                .get_untracked()
                .map(|s| s.username.clone())
                .unwrap_or_default();
            let cid_key = format!(".profiles.{own_username}");
            let state2 = state.clone();
            spawn_local(async move {
                // Retry once on transient transport errors.
                let result = transport::send_ipfs_publish(&ma_did).await;
                let result = match result {
                    Err(ref e) if e.contains("timed out") || e.contains("connect failed") => {
                        transport::send_ipfs_publish(&ma_did).await
                    }
                    other => other,
                };
                match result {
                    Ok(msg_id2) => {
                        config.update(|cfg| cfg.set(&cid_key, &cid_str));
                        let cfg = config.get_untracked();
                        let _ = persist_config(&own_username, &cfg).await;
                        if let Some(cid) = cmd_id_opt {
                            state2.bind_message_id(cid, msg_id2);
                        }
                    }
                    Err(e) => {
                        if let Some(cid) = cmd_id_opt {
                            state2.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
                        }
                        state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                    }
                }
            });
        }
        Err(e) => {
            if let Some(cid) = cmd_id_opt {
                state.resolve_command_by_id(cid, CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
        }
    }
    true
}

/// Edit-open reply: decode the CBOR payload and open the editor in the right mode.
fn handle_edit_open_reply(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    show_editor: RwSignal<Option<EditorContext>>,
) -> bool {
    let pending = state
        .pending_edit_opens
        .get_untracked()
        .get(msg_id)
        .cloned();
    let Some(ctx) = pending else { return false };
    state.pending_edit_opens.update(|m| {
        m.remove(msg_id);
    });
    if incoming.is_error {
        state.resolve_command_by_id(ctx.cmd_id, CommandStatus::Error(incoming.display.clone()));
        state.push_error(incoming.display.clone());
        return true;
    }
    let content_bytes = incoming.content.clone();
    let content_type = incoming.content_type.clone();
    let doc_path = format!("@{}{}", ctx.target, ctx.crud_path);
    let state2 = state.clone();
    let resolved_cmd = ctx.cmd_id;
    let editor_mode = match ctx.editor_mode {
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
            match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
                Ok(ciborium::Value::Text(cid)) => {
                    spawn_local(async move {
                        match fetch_cid_bytes(&cid).await {
                            Ok(bytes) => match crate::messages::cbor_bytes_to_yaml(&bytes) {
                                Ok(yaml) => show_editor.set(Some(
                                    EditorContext::new(doc_path, yaml)
                                        .with_language("yaml")
                                        .with_mode(editor_mode)
                                        .with_cmd_id(resolved_cmd),
                                )),
                                Err(e) => {
                                    state2.resolve_command_by_id(
                                        resolved_cmd,
                                        CommandStatus::Error(e.clone()),
                                    );
                                    state2.push_error(tf("err-edit-decode-failed", &[("e", &e)]));
                                }
                            },
                            Err(e) => {
                                state2.resolve_command_by_id(
                                    resolved_cmd,
                                    CommandStatus::Error(e.clone()),
                                );
                                state2.push_error(tf("err-edit-fetch-failed", &[("e", &e)]));
                            }
                        }
                    });
                }
                Ok(_) | Err(_) => {
                    state2.resolve_command_by_id(
                        resolved_cmd,
                        CommandStatus::Error(t("err-edit-cbor")),
                    );
                    state2.push_error(t("err-edit-cbor"));
                }
            }
        }
        "application/x-ma-term+cbor" => match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
            Ok(yaml) => show_editor.set(Some(
                EditorContext::new(doc_path, yaml)
                    .with_language("yaml")
                    .with_mode(editor_mode)
                    .with_cmd_id(resolved_cmd),
            )),
            Err(e) => {
                state2.resolve_command_by_id(resolved_cmd, CommandStatus::Error(e.clone()));
                state2.push_error(tf("err-edit-decode-failed", &[("e", &e)]));
            }
        },
        "application/x-ma-term+yaml" => {
            match ciborium::de::from_reader::<ciborium::Value, _>(&mut &content_bytes[..]) {
                Ok(ciborium::Value::Text(yaml)) => show_editor.set(Some(
                    EditorContext::new(doc_path, yaml)
                        .with_language("yaml")
                        .with_mode(editor_mode)
                        .with_cmd_id(resolved_cmd),
                )),
                Ok(_) | Err(_) => {
                    // Fallback: try raw CBOR → YAML.
                    match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
                        Ok(yaml) => show_editor.set(Some(
                            EditorContext::new(doc_path, yaml)
                                .with_language("yaml")
                                .with_mode(editor_mode)
                                .with_cmd_id(resolved_cmd),
                        )),
                        Err(e) => {
                            state2.resolve_command_by_id(
                                resolved_cmd,
                                CommandStatus::Error(e.clone()),
                            );
                            state2.push_error(tf("err-edit-decode-failed", &[("e", &e)]));
                        }
                    }
                }
            }
        }
        _ => {
            // Unknown / legacy content-type — best-effort CBOR → YAML.
            match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
                Ok(yaml) => show_editor.set(Some(
                    EditorContext::new(doc_path, yaml)
                        .with_language("yaml")
                        .with_mode(editor_mode)
                        .with_cmd_id(resolved_cmd),
                )),
                Err(e) => {
                    state2.resolve_command_by_id(resolved_cmd, CommandStatus::Error(e.clone()));
                    state2.push_error(tf("err-edit-decode-failed", &[("e", &e)]));
                }
            }
        }
    }
    true
}

/// CID content-op reply: fetch the CID and apply the op (cat/head/tail/wc).
fn handle_cid_op_reply(msg_id: &str, incoming: &IncomingMessage, state: &AppState) -> bool {
    let pending = state.pending_cid_ops.update_untracked(|m| m.remove(msg_id));
    let Some(ctx) = pending else { return false };
    if incoming.is_error {
        state.resolve_command_by_id(ctx.cmd_id, CommandStatus::Error(incoming.display.clone()));
        state.push_error(incoming.display.clone());
        return true;
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
                        let args_ref: Vec<&str> = ctx.args.iter().map(|s| s.as_str()).collect();
                        for line in crate::cid_ops::apply(&ctx.op, &text, &args_ref) {
                            state2.push_output(line);
                        }
                        state2.resolve_command_by_id(ctx.cmd_id, CommandStatus::Done);
                    }
                    Err(e) => {
                        state2.resolve_command_by_id(ctx.cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("cid-op-fetch-failed", &[("e", &e)]));
                    }
                }
            }
            _ => {
                // Not a CID — display as plain text.
                state2.push_output(fallback_display);
                state2.resolve_command_by_id(ctx.cmd_id, CommandStatus::Done);
            }
        }
    });
    true
}

/// CRUD SET confirmation (end of the IPFS-store → CRUD-SET publish flow).
fn handle_crud_confirm(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    display: &str,
) -> bool {
    let Some(original_cmd_id) = state
        .pending_crud_confirms
        .update_untracked(|m| m.remove(msg_id))
    else {
        return false;
    };
    let (status, push_opt) = classify_reply(&incoming.content, incoming.is_error, display);
    state.resolve_command_by_id(original_cmd_id, status);
    if let Some(text) = push_opt {
        state.push_incoming(text, Some(original_cmd_id), incoming.is_error);
    }
    true
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
                Some(_) | None => (CommandStatus::Replied(String::new()), None),
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
