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
        cbor_reply_to_scheme_val, classify_reply, handle_crud_confirm, handle_edit_open_reply,
        handle_ipfs_crud_reply, handle_ipfs_kind_reply, handle_profile_publish_reply, ReplyContext,
    },
    state::{AppState, OutboxTask, PendingKind},
    transport,
    views::editor::EditorContext,
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
            handle_profile_publish_reply(publisher_did, cmd_id, &incoming, state, config);
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
        PendingKind::Simple { cmd_id } => {
            let (status, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
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
            handle_ctx_receipt(items.get(1), incoming, state, config);
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
    let Some(root) = cfg.get(".my.ctx.root") else {
        return;
    };
    if incoming.from != root {
        return;
    }
    let Some(ciborium::Value::Array(pairs)) = payload else {
        return;
    };
    let root = ctx_value(pairs, ":root").map(str::to_string);
    let avatar = ctx_value(pairs, ":avatar").map(str::to_string);
    let nick = ctx_value(pairs, ":nick").map(str::to_string);
    let room = ctx_value(pairs, ":room").map(str::to_string);
    let text = ctx_value(pairs, ":text").map(str::to_string);

    config.update(|c| {
        if let Some(root) = &root {
            c.set(".my.ctx.root", root);
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
}
