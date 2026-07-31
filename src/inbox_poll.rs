//! Background inbox polling loop and incoming-message routing.
//!
//! `run_inbox_poll` is spawned once at login. It drains all three iroh queues
//! every 500 ms and routes each incoming message to the right handler.
//! Reply handlers for pending requests live in `reply_handlers`.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    i18n::tf,
    messages::IncomingMessage,
    reply_handlers::{
        cbor_reply_to_scheme_val, cbor_to_scheme_val, classify_reply, handle_crud_confirm,
        handle_edit_open_reply, handle_ipfs_actor_behaviour_reply, handle_ipfs_crud_reply,
        handle_ipfs_kind_reply, handle_profile_publish_reply, ReplyContext,
    },
    state::{AppState, CtxTailSnapshot, OutboxTask, PendingKind},
    transport,
    views::editor::EditorContext,
};

const LAMBDA_CTX_PROTOCOL: &str = "/ma/lambda/ctx/0.0.1";

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
    if handle_client_term(&incoming, state, config) {
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
        Some(msg_id) => dispatch_reply(&msg_id, incoming, display, state, config, show_editor),
        None => state.push_incoming(display, None, incoming.is_error),
    }
}

/// Dispatch a reply message by matching it against the pending-request table.
fn dispatch_reply(
    msg_id: &str,
    incoming: IncomingMessage,
    display: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
) {
    // Scheme-initiated RPC: route the reply directly to the waiting evaluator.
    if let Some(sender) = state.take_scheme_sender(msg_id) {
        let result = cbor_reply_to_scheme_val(&incoming.content, incoming.is_error, &display);
        let _ = sender.send(result);
        return;
    }

    if let Some(items) = client_term_array(&incoming) {
        let ctx_payload = ctx_payload_from_reply_items(&items);
        if let Some(payload) = ctx_payload {
            let kind = state.take_pending(msg_id);
            handle_ctx_receipt(Some(payload), &incoming, state, config);
            if let Some(PendingKind::Simple { cmd_id }) = kind {
                state.resolve_command_by_id(
                    cmd_id,
                    crate::core::CommandStatus::Replied(String::new()),
                );
            }
            return;
        }
    }

    // One-shot RPC from `send_rpc_and_wait`: route reply to the oneshot channel.
    if let Some(sender) = crate::state::AwaitingReply::take(msg_id) {
        let (_, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
        let cfg = config.get_untracked();
        let result = if incoming.is_error {
            text_opt.unwrap_or_else(|| display.clone())
        } else {
            text_opt.unwrap_or_default()
        };
        let _ = sender.send(cfg.substitute_display_dids(&result));
        return;
    }

    let Some(kind) = state.take_pending(msg_id) else {
        web_sys::console::warn_1(
            &format!(
                "[inbox] dropping stale reply message_id={} reply_to={msg_id} from={} type={}: {display}",
                incoming.message_id, incoming.from, incoming.message_type
            )
            .into(),
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
        PendingKind::IpfsActorBehaviour { target, cmd_id } => {
            handle_ipfs_actor_behaviour_reply(target, cmd_id, &incoming, state);
        }
        PendingKind::ProfilePublish {
            publisher_did,
            cmd_id,
            reenter_saved_ctx,
        } => {
            handle_profile_publish_reply(
                publisher_did,
                cmd_id,
                reenter_saved_ctx,
                &incoming,
                state,
                config,
            );
        }
        PendingKind::EditOpen {
            target,
            crud_path,
            editor_mode,
            cmd_id,
        } => {
            let ctx = ReplyContext {
                state,
                config,
                show_editor,
            };
            handle_edit_open_reply(target, crud_path, editor_mode, cmd_id, &incoming, &ctx);
        }
        PendingKind::CrudConfirm { cmd_id } => {
            handle_crud_confirm(cmd_id, &incoming, state, &display, config);
        }
        PendingKind::RoomLeave { room } => {
            if incoming.is_error {
                config.update(|cfg| state.retry_room_leave(&room, cfg));
            } else {
                config.update(|cfg| state.complete_room_leave(&room, cfg));
            }
        }
        PendingKind::Simple { cmd_id } => {
            let (status, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
            if incoming.is_error {
                if let Some(reason) = text_opt.as_deref() {
                    maybe_queue_ctx_recovery(reason, state, config);
                }
            }
            state.resolve_command_by_id(cmd_id, status);
            if let Some(text) = text_opt {
                let text = config.get_untracked().substitute_display_dids(&text);
                state.push_incoming(text, Some(cmd_id), incoming.is_error);
            }
        }
    }
}

/// Handle unsolicited actor-authored client terms. Returns true when handled.
fn handle_client_term(
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    if incoming.reply_to.is_some()
        || incoming.message_type != ma_core::MESSAGE_TYPE_RPC
        || incoming.content_type != ma_core::CONTENT_TYPE_TERM
    {
        return false;
    }
    let Ok(term) = ciborium::de::from_reader::<ciborium::Value, _>(&mut &incoming.content[..])
    else {
        return false;
    };
    match term {
        ciborium::Value::Array(items) => handle_client_term_array(items, incoming, state, config),
        _ => false,
    }
}

fn client_term_array(incoming: &IncomingMessage) -> Option<Vec<ciborium::Value>> {
    if !matches!(
        incoming.message_type.as_str(),
        ma_core::MESSAGE_TYPE_RPC | ma_core::MESSAGE_TYPE_RPC_REPLY
    ) || incoming.content_type != ma_core::CONTENT_TYPE_TERM
    {
        return None;
    }
    match ciborium::de::from_reader::<ciborium::Value, _>(&mut &incoming.content[..]).ok()? {
        ciborium::Value::Array(items) => Some(items),
        _ => None,
    }
}

fn term_head(items: &[ciborium::Value]) -> Option<&str> {
    items.first().and_then(cbor_text)
}

fn ctx_payload_from_items(items: &[ciborium::Value]) -> Option<&ciborium::Value> {
    if term_head(items) == Some(":ctx") {
        return items.get(1);
    }
    None
}

fn ctx_payload_from_reply_items(items: &[ciborium::Value]) -> Option<&ciborium::Value> {
    let Some(ciborium::Value::Array(payload)) = items.get(1) else {
        return None;
    };
    if term_head(items) == Some(":ok") && term_head(payload) == Some(":ctx") {
        payload.get(1)
    } else {
        None
    }
}

fn handle_client_term_array(
    items: Vec<ciborium::Value>,
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    let Some(ciborium::Value::Text(head)) = items.first() else {
        return false;
    };
    match head.as_str() {
        ":print" => {
            if let Some(text) = items.get(1).and_then(cbor_text) {
                let text = config.get_untracked().substitute_display_dids(text);
                state.push_incoming(text, None, false);
            }
            true
        }
        ":ctx" => {
            handle_ctx_receipt(ctx_payload_from_items(&items), incoming, state, config);
            true
        }
        _ => false,
    }
}

fn handle_ctx_receipt(
    payload: Option<&ciborium::Value>,
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    let cfg = config.get_untracked();
    if handle_movement_ctx(payload, incoming, state, &cfg) {
        return;
    }
    let Some(ciborium::Value::Array(pairs)) = payload else {
        return;
    };
    let pending_enter = state.pending_enter.get_untracked();
    let pending_room = pending_enter
        .as_ref()
        .map(|pending| pending.desired_room.as_str());
    let root = ctx_value(pairs, ":root").map(str::to_string);
    let avatar = ctx_value(pairs, ":avatar").map(str::to_string);
    let room = ctx_value(pairs, ":room").map(str::to_string);
    let protocol = ctx_value(pairs, ":protocol").map(str::to_string);
    let kind = ctx_value(pairs, ":kind").map(str::to_string);
    if protocol.as_deref() != Some(LAMBDA_CTX_PROTOCOL) {
        warn_ctx(&format!(
            "[ctx] dropping unsupported context protocol from={} protocol={protocol:?}",
            incoming.from
        ));
        return;
    }
    let expected_root = cfg.get(".my.ctx.root").map(str::to_string);
    let expected_avatar = cfg.get(".my.ctx.avatar").map(str::to_string);
    // Trust established directly from this message's own identity fields,
    // independent of any leftover `pending_enter` from an earlier/unrelated
    // `.enter` attempt. This is the strong signal: an avatar or root actor
    // reporting on itself.
    let trusted_by_identity = expected_root
        .as_deref()
        .is_some_and(|expected| incoming.from == expected)
        || root.as_deref().is_some_and(|root| incoming.from == root)
        || expected_avatar
            .as_deref()
            .is_some_and(|expected| incoming.from == expected)
        || avatar
            .as_deref()
            .is_some_and(|avatar| incoming.from == avatar);
    let trusted_by_pending =
        pending_room.is_some_and(|expected_room| incoming.from == expected_room);
    if !trusted_by_identity && !trusted_by_pending {
        warn_ctx(&format!(
            "[ctx] dropping untrusted :ctx from={} expected_root={expected_root:?} \
             expected_avatar={expected_avatar:?} payload_root={root:?} payload_avatar={avatar:?}",
            incoming.from
        ));
        return;
    }

    if let Some(pending) = pending_enter {
        let room_matches = room
            .as_deref()
            .is_some_and(|room| room == pending.desired_room);
        if room_matches {
            if let Some(cmd_id) = pending.cmd_id {
                state.resolve_command_by_id(
                    cmd_id,
                    crate::core::CommandStatus::Replied(String::new()),
                );
            }
            state.clear_pending_enter();
        } else if trusted_by_identity {
            // This ctx push is legitimately about the sender's own state (an
            // avatar/root reporting on itself) even though it doesn't match
            // a stale pending enter left over from an earlier attempt. Don't
            // let that stale pending block it forever; drop the stale
            // pending instead so future ctx pushes aren't blocked too.
            warn_ctx(&format!(
                "[ctx] room mismatch against stale pending_enter (desired={}, got={:?}); \
                 clearing stale pending and applying ctx anyway",
                pending.desired_room, room
            ));
            state.clear_pending_enter();
        } else {
            warn_ctx(&format!(
                "[ctx] dropping :ctx: room mismatch and only trusted via pending_enter \
                 (desired={}, got={:?})",
                pending.desired_room, room
            ));
            return;
        }
    }

    let nick = ctx_value(pairs, ":nick").map(str::to_string);
    let text = ctx_value(pairs, ":text").map(str::to_string);
    let runtime = root
        .as_deref()
        .or(Some(incoming.from.as_str()))
        .and_then(|actor| {
            actor
                .split_once('#')
                .map(|(runtime, _)| runtime.to_string())
        });
    let old_room = cfg.get(".my.ctx.room").map(str::to_string);
    let room_changed = matches!(
        (old_room.as_deref(), room.as_deref()),
        (Some(old_room), Some(new_room))
            if !old_room.is_empty() && !new_room.is_empty() && old_room != new_room
    );

    config.update(|c| {
        if room_changed {
            if let Some(old_room) = old_room.clone() {
                state.enqueue_room_leave(old_room, c);
            }
        }
        state.record_ctx_tail(
            CtxTailSnapshot {
                protocol: protocol.clone(),
                runtime: runtime.clone(),
                root: root.clone(),
                avatar: avatar.clone(),
                room: room.clone(),
                nick: nick.clone(),
                kind: kind.clone(),
                text: text.clone(),
            },
            c,
        );
        c.set(".my.ctx.use", "true");
        if let Some(runtime) = &runtime {
            c.set(".my.ctx.runtime", runtime);
        }
        if let Some(root) = &root {
            c.set(".my.ctx.root", root);
        }
        c.set(".my.ctx.protocol", LAMBDA_CTX_PROTOCOL);
        if let Some(kind) = &kind {
            if kind.is_empty() {
                c.delete(".my.ctx.kind");
            } else {
                c.set(".my.ctx.kind", kind);
            }
        }
        if let Some(avatar) = &avatar {
            if avatar.is_empty() {
                c.delete(".my.ctx.avatar");
            } else {
                c.set(".my.ctx.avatar", avatar);
            }
        }
        if let Some(nick) = &nick {
            if nick.is_empty() {
                c.delete(".my.ctx.nick");
                c.delete(".my.ctx.alias");
            } else {
                c.set(".my.ctx.nick", nick);
                c.delete(".my.ctx.alias");
            }
        }
        if let Some(room) = &room {
            if room.is_empty() {
                c.delete(".my.ctx.room");
            } else {
                c.set(".my.ctx.room", room);
            }
        }
    });

    let cfg = config.get_untracked();
    crate::eval::apply_ctx_focus(&cfg, state);
    if let Some(sess) = state.session.get_untracked() {
        let uname = sess.username.clone();
        let cfg_persist = cfg.clone();
        spawn_local(async move {
            if let Err(e) = persist_config(&uname, &cfg_persist).await {
                web_sys::console::error_1(&format!("ctx persist: {e}").into());
            }
        });
    }
    if let Some(text) = text {
        state.push_incoming(cfg.substitute_display_dids(&text), None, false);
    }
}

fn handle_movement_ctx(
    payload: Option<&ciborium::Value>,
    incoming: &IncomingMessage,
    state: &AppState,
    cfg: &EgoConfig,
) -> bool {
    let Some(payload) = payload else {
        return false;
    };
    if ctx_field(payload, "protocol").is_some() {
        return false;
    }
    let Some(actor) = ctx_field(payload, "actor") else {
        return false;
    };
    let Some(room) = ctx_field(payload, "room") else {
        return false;
    };
    let kind = ctx_field(payload, "kind");
    if !matches!(kind, Some("avatar" | "user")) {
        return false;
    }
    let Some(session_did) = transport::get_sender_did() else {
        return true;
    };
    if actor != session_did {
        warn_ctx(&format!(
            "[ctx] dropping movement ctx for different actor from={} actor={actor}",
            incoming.from
        ));
        return true;
    }
    if !room.starts_with("did:ma:") {
        warn_ctx(&format!(
            "[ctx] dropping movement ctx with invalid target room from={} room={room}",
            incoming.from
        ));
        return true;
    }

    let avatar = ctx_field(payload, "avatar");
    let expected_avatar = cfg.get(".my.ctx.avatar");
    let trusted_avatar = avatar.is_some_and(|avatar| incoming.from == avatar)
        || expected_avatar.is_some_and(|avatar| incoming.from == avatar)
        || incoming.from == session_did;
    if !trusted_avatar {
        warn_ctx(&format!(
            "[ctx] dropping untrusted movement ctx from={} actor={actor} avatar={avatar:?}",
            incoming.from
        ));
        return true;
    }

    let room = room.to_string();
    let runtime = room
        .split_once('#')
        .map(|(runtime, _)| runtime.to_string())
        .unwrap_or_else(|| room.clone());
    let ctx_arg = cbor_to_scheme_val(payload);
    let state2 = state.clone();
    spawn_local(async move {
        state2.set_hidden_pending_enter(runtime, room.clone());
        match transport::send_rpc_vals(&room, "enter", &[ctx_arg]).await {
            Ok(_) => {}
            Err(e) => {
                state2.clear_pending_enter();
                state2.push_error(tf("msg-send-failed", &[("e", &e)]));
            }
        }
    });
    true
}

fn ctx_field<'a>(payload: &'a ciborium::Value, key: &str) -> Option<&'a str> {
    let colon_key = format!(":{key}");
    match payload {
        ciborium::Value::Map(pairs) => pairs.iter().find_map(|(k, v)| match (k, v) {
            (ciborium::Value::Text(k), ciborium::Value::Text(v)) if k == key || k == &colon_key => {
                Some(v.as_str())
            }
            _ => None,
        }),
        ciborium::Value::Array(pairs) => pairs.iter().find_map(|pair| match pair {
            ciborium::Value::Array(items) if items.len() == 2 => match (&items[0], &items[1]) {
                (ciborium::Value::Text(k), ciborium::Value::Text(v))
                    if k == key || k == &colon_key =>
                {
                    Some(v.as_str())
                }
                _ => None,
            },
            _ => None,
        }),
        _ => None,
    }
}

#[cfg(target_arch = "wasm32")]
fn warn_ctx(message: &str) {
    web_sys::console::warn_1(&message.into());
}

#[cfg(not(target_arch = "wasm32"))]
fn warn_ctx(message: &str) {
    eprintln!("{message}");
}

fn ctx_value<'a>(pairs: &'a [ciborium::Value], key: &str) -> Option<&'a str> {
    pairs.iter().find_map(|pair| match pair {
        ciborium::Value::Array(items) if items.len() == 2 => match (&items[0], &items[1]) {
            (ciborium::Value::Text(k), ciborium::Value::Text(v)) if k == key => Some(v.as_str()),
            _ => None,
        },
        _ => None,
    })
}

fn cbor_text(value: &ciborium::Value) -> Option<&str> {
    match value {
        ciborium::Value::Text(text) => Some(text),
        _ => None,
    }
}

fn maybe_queue_ctx_recovery(reason: &str, state: &AppState, config: RwSignal<EgoConfig>) {
    let lower = reason.to_ascii_lowercase();
    if !lower.contains("unknown entity fragment") {
        return;
    }

    let cfg = config.get_untracked();
    if cfg.get(".my.ctx.use") != Some("true") {
        return;
    }

    let Some(runtime) = cfg
        .get(".my.ctx.runtime")
        .map(str::trim)
        .filter(|runtime| !runtime.is_empty())
        .map(str::to_string)
    else {
        return;
    };

    // Only recover automatically when there is an active avatar context.
    // Without an avatar (direct agent mode), just suggest the start room.
    if cfg
        .get(".my.ctx.avatar")
        .map(str::trim)
        .filter(|avatar| avatar.starts_with("did:ma:") && avatar.contains('#'))
        .is_none()
    {
        state.push_error(format!(
            "unknown entity fragment — use .enter @{runtime} to enter the default start room"
        ));
        return;
    }

    // Avoid enqueue storms while a recovery enter is already pending/queued.
    if state.pending_enter.get_untracked().is_some() {
        return;
    }
    if state
        .input_queue
        .with_untracked(|q| q.iter().any(|line| line.starts_with(".enter ")))
    {
        return;
    }

    // On unknown fragment, don't retry a possibly stale room target.
    // Re-enter via runtime and let runtime/root select a valid placement.
    let target = runtime.clone();
    let nick = cfg.get(".my.ctx.nick").map(str::trim).filter(|nick| {
        !nick.is_empty() && !nick.contains('@') && !nick.chars().any(char::is_whitespace)
    });

    let enter = match nick {
        Some(nick) => format!("{nick}@{target}"),
        None => normalize_enter_target(&target),
    };
    #[cfg(target_arch = "wasm32")]
    web_sys::console::warn_1(
        &format!("[ctx-recovery] stale avatar/fragment detected; queuing auto-enter: {enter}")
            .into(),
    );
    state.push_system(format!(
        "auto-recovery: stale avatar detected, re-entering with .enter {enter}"
    ));
    state
        .input_queue
        .update(|q| q.push_back(format!(".enter {enter}")));
}

fn normalize_enter_target(target: &str) -> String {
    if target.starts_with('@') || target.contains('@') {
        target.to_string()
    } else {
        format!("@{target}")
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
    let from_disp = alias_display(&cfg, &incoming.from);
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
    if incoming.content_type == "application/vnd.ma.room.event" {
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
    let mut display = cfg.substitute_display_dids(&incoming.display);
    let Some((alias, frag)) = cfg.split_alias(&incoming.from) else {
        return display;
    };
    let bare = incoming.message_type == ma_core::MESSAGE_TYPE_EMOTE
        || incoming.message_type == ma_core::MESSAGE_TYPE_CHAT;
    let replacement = match (bare, frag) {
        (true, Some(f)) => format!("{alias}#{f}"),
        (true, None) => alias,
        (false, Some(f)) => format!("@{alias}#{f}"),
        (false, None) => format!("@{alias}"),
    };
    display = display.replace(&incoming.from, &replacement);
    display
}

/// Format a `did:ma:<id>[#fragment]` DID-URL for display, substituting a
/// known alias (`@alias` / `@alias#fragment`) when one exists, or falling
/// back to the DID-URL unchanged. Shared by `acl_gate` and `display_sender`.
fn alias_display(cfg: &EgoConfig, did_url: &str) -> String {
    cfg.alias_display(did_url)
        .unwrap_or_else(|| did_url.to_string())
}

/// Alias-resolved sender string for display in inbox notifications.
fn display_sender(incoming: &IncomingMessage, config: RwSignal<EgoConfig>) -> String {
    let cfg = config.get_untracked();
    alias_display(&cfg, &incoming.from)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::messages::IncomingMessage;
    use std::collections::VecDeque;

    fn incoming(from: &str, display: &str) -> IncomingMessage {
        IncomingMessage {
            message_id: "msg".to_string(),
            message_type: ma_core::MESSAGE_TYPE_RPC.to_string(),
            from: from.to_string(),
            to: "did:ma:self".to_string(),
            reply_to: None,
            content_type: "text/plain".to_string(),
            content: Vec::new(),
            created_at: 0,
            exp: 0,
            display: display.to_string(),
            is_error: false,
        }
    }

    #[test]
    fn format_display_shortens_did_url_in_text() {
        let _runtime = leptos::prelude::Owner::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| cfg.set(".my.aliases.sky", "did:ma:k51qzabc"));
        assert_eq!(
            format_display(
                &incoming("did:ma:room", "did:ma:k51qzabc#room arrives."),
                config,
            ),
            "@sky#room arrives."
        );
    }

    #[test]
    fn format_display_prefers_exact_did_url_alias() {
        let _runtime = leptos::prelude::Owner::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| {
            cfg.set(".my.aliases.sky", "did:ma:k51qzabc");
            cfg.set(".my.aliases.home", "did:ma:k51qzabc#room");
        });
        assert_eq!(
            format_display(
                &incoming("did:ma:room", "did:ma:k51qzabc#room arrives."),
                config,
            ),
            "@home arrives."
        );
    }

    #[test]
    fn ctx_payload_is_extracted_from_direct_ctx_term() {
        let payload = ciborium::Value::Array(vec![ciborium::Value::Array(vec![
            ciborium::Value::Text(":root".to_string()),
            ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
        ])]);
        let items = vec![ciborium::Value::Text(":ctx".to_string()), payload];

        assert!(matches!(
            ctx_payload_from_items(&items),
            Some(ciborium::Value::Array(_))
        ));
    }

    #[test]
    fn avatar_ctx_is_extracted_from_ok_reply_payload() {
        let payload = ciborium::Value::Array(vec![ciborium::Value::Array(vec![
            ciborium::Value::Text(":root".to_string()),
            ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
        ])]);
        let ctx = ciborium::Value::Array(vec![ciborium::Value::Text(":ctx".to_string()), payload]);
        let term = ciborium::Value::Array(vec![ciborium::Value::Text(":ok".to_string()), ctx]);
        let mut content = Vec::new();
        ciborium::ser::into_writer(&term, &mut content).unwrap();
        let mut incoming = incoming("did:ma:k51runtime#root", "");
        incoming.message_type = ma_core::MESSAGE_TYPE_RPC_REPLY.to_string();
        incoming.content_type = ma_core::CONTENT_TYPE_TERM.to_string();
        incoming.content = content;

        assert!(matches!(
            client_term_array(&incoming)
                .as_deref()
                .and_then(ctx_payload_from_reply_items),
            Some(ciborium::Value::Array(_))
        ));
    }

    #[test]
    fn ctx_receipt_applies_supported_lambda_protocol_and_kind() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let payload = ciborium::Value::Array(vec![
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":protocol".to_string()),
                ciborium::Value::Text(LAMBDA_CTX_PROTOCOL.to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":kind".to_string()),
                ciborium::Value::Text("agent".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":root".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":room".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#room".to_string()),
            ]),
        ]);
        let incoming = incoming("did:ma:k51runtime#root", "");

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        let cfg = config.get_untracked();
        assert_eq!(cfg.get(".my.ctx.protocol"), Some(LAMBDA_CTX_PROTOCOL));
        assert_eq!(cfg.get(".my.ctx.kind"), Some("agent"));
        assert_eq!(cfg.get(".my.ctx.room"), Some("did:ma:k51runtime#room"));
    }

    #[test]
    fn ctx_receipt_accepts_new_cross_runtime_avatar_identity() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| {
            cfg.set(".my.ctx.use", "true");
            cfg.set(".my.ctx.runtime", "did:ma:k51source");
            cfg.set(".my.ctx.root", "did:ma:k51source#root");
            cfg.set(".my.ctx.avatar", "did:ma:k51source#alice");
            cfg.set(".my.ctx.room", "did:ma:k51source#room");
        });
        let payload = ciborium::Value::Array(vec![
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":protocol".to_string()),
                ciborium::Value::Text(LAMBDA_CTX_PROTOCOL.to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":kind".to_string()),
                ciborium::Value::Text("avatar".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":root".to_string()),
                ciborium::Value::Text("did:ma:k51target#root".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":avatar".to_string()),
                ciborium::Value::Text("did:ma:k51target#alice".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":nick".to_string()),
                ciborium::Value::Text("Alice".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":room".to_string()),
                ciborium::Value::Text("did:ma:k51target#construct".to_string()),
            ]),
        ]);
        let incoming = incoming("did:ma:k51target#alice", "");

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        let cfg = config.get_untracked();
        assert_eq!(cfg.get(".my.ctx.runtime"), Some("did:ma:k51target"));
        assert_eq!(cfg.get(".my.ctx.root"), Some("did:ma:k51target#root"));
        assert_eq!(cfg.get(".my.ctx.avatar"), Some("did:ma:k51target#alice"));
        assert_eq!(cfg.get(".my.ctx.nick"), Some("Alice"));
        assert_eq!(cfg.get(".my.ctx.room"), Some("did:ma:k51target#construct"));
    }

    #[test]
    fn ctx_receipt_resolves_matching_pending_enter_command() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let room = "did:ma:k51target#construct";
        let cmd_id = state.push_command(format!(".enter {room}"));
        state.pending_enter.set(Some(crate::state::PendingEnter {
            cmd_id: Some(cmd_id),
            desired_runtime: "did:ma:k51target".to_string(),
            desired_room: room.to_string(),
            issued_at_ms: 0.0,
            visible: true,
        }));
        let payload = ciborium::Value::Array(vec![
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":protocol".to_string()),
                ciborium::Value::Text(LAMBDA_CTX_PROTOCOL.to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":kind".to_string()),
                ciborium::Value::Text("avatar".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":root".to_string()),
                ciborium::Value::Text("did:ma:k51target#root".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":avatar".to_string()),
                ciborium::Value::Text("did:ma:k51target#alice".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":room".to_string()),
                ciborium::Value::Text(room.to_string()),
            ]),
        ]);
        let incoming = incoming("did:ma:k51target#alice", "");

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        assert!(state.pending_enter.get_untracked().is_none());
        let status = state.entries.with_untracked(|entries| {
            entries.iter().find_map(|entry| match entry {
                crate::core::Entry::Command(command) if command.id == cmd_id => {
                    Some(command.status.get_untracked())
                }
                _ => None,
            })
        });
        assert_eq!(
            status,
            Some(crate::core::CommandStatus::Replied(String::new()))
        );
    }

    #[test]
    fn hidden_pending_enter_does_not_render_command_entry() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let room = "did:ma:k51target#garden";

        state.set_hidden_pending_enter("did:ma:k51target".to_string(), room.to_string());

        assert!(state.entries.get_untracked().is_empty());
        let pending = state.pending_enter.get_untracked().unwrap();
        assert_eq!(pending.cmd_id, None);
        assert_eq!(pending.desired_room, room);
        assert!(!pending.visible);
    }

    #[test]
    fn ctx_receipt_rejects_unknown_protocol() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| cfg.set(".my.ctx.kind", "avatar"));
        let payload = ciborium::Value::Array(vec![
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":protocol".to_string()),
                ciborium::Value::Text("/ma/lambda/ctx/9.9.9".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":kind".to_string()),
                ciborium::Value::Text("agent".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":root".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
            ]),
        ]);
        let incoming = incoming("did:ma:k51runtime#root", "");

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        let cfg = config.get_untracked();
        assert_eq!(cfg.get(".my.ctx.kind"), Some("avatar"));
        assert_eq!(cfg.get(".my.ctx.protocol"), None);
    }

    #[test]
    fn recovery_reenters_with_unqualified_runtime_on_unknown_fragment() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let missing_room = "NONEXISTENT_FRAGMENT_SENTINEL";
        config.update(|cfg| {
            cfg.set(".my.ctx.use", "true");
            cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
            cfg.set(".my.ctx.room", &format!("did:ma:k51runtime#{missing_room}"));
            cfg.set(".my.ctx.avatar", "did:ma:k51runtime#avatar123");
            cfg.set(".my.ctx.nick", "foo");
        });
        state.input_queue.set(VecDeque::new());

        maybe_queue_ctx_recovery(
            &format!("unknown entity fragment: {missing_room}"),
            &state,
            config,
        );

        let queued: Vec<String> = state.input_queue.get_untracked().into_iter().collect();
        assert!(queued
            .iter()
            .any(|line| line == ".enter foo@did:ma:k51runtime"));
        assert!(!queued.iter().any(|line| line.contains(missing_room)));
    }
}
