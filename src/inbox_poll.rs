//! Background inbox polling loop and incoming-message routing.
//!
//! `run_inbox_poll` is spawned once at login. It drains all three iroh queues
//! every 500 ms and routes each incoming message to the right handler.
//! Reply handlers for pending requests live in `reply_handlers`.

use leptos::prelude::*;
use ma_core::CRUD_PROTOCOL_ID;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    i18n::tf,
    messages::IncomingMessage,
    reply_handlers::{
        cbor_reply_to_scheme_val, cbor_to_scheme_val, classify_reply, handle_crud_confirm,
        handle_crud_get_reply, handle_edit_open_reply, handle_ipfs_actor_behaviour_reply,
        handle_ipfs_crud_reply, handle_ipfs_kind_reply, handle_profile_publish_reply,
        handle_root_enter_reply, ReplyContext,
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
            .chain(transport::drain_live_inbox())
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
    auto_pong(&incoming, state);
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

    if handle_did_entry_reply(msg_id, &incoming, state, config) {
        return;
    }

    // One-shot RPC from `send_rpc_and_wait`: route reply to the oneshot channel.
    if let Some(sender) = crate::state::AwaitingReply::take(msg_id) {
        let (_, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
        let cfg = config.get_untracked();
        let result = if incoming.is_error {
            Err(text_opt.unwrap_or_else(|| display.clone()))
        } else {
            Ok(text_opt.unwrap_or_default())
        };
        let result = result.map(|text| cfg.substitute_display_dids(&text));
        let result = result.map_err(|error| cfg.substitute_display_dids(&error));
        let _ = sender.send(result);
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
            timeout_ms,
            logout_after,
        } => {
            handle_profile_publish_reply(
                crate::reply_handlers::ProfilePublishRequest {
                    publisher_did,
                    cmd_id,
                    reenter_saved_ctx,
                    timeout_ms,
                    logout_after,
                },
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
        PendingKind::RootEnterDiscovery {
            entry_runtime,
            cmd_id,
            effective_nick,
            enter_kind,
            inventory,
        } => {
            handle_root_enter_reply(
                entry_runtime,
                cmd_id,
                effective_nick,
                enter_kind,
                inventory,
                &incoming,
                state,
                config,
            );
        }
        PendingKind::Simple { cmd_id } => {
            if incoming.service == CRUD_PROTOCOL_ID {
                handle_crud_get_reply(cmd_id, &incoming, state, &display, config);
                return;
            }
            let (status, text_opt) = classify_reply(&incoming.content, incoming.is_error, &display);
            if incoming.is_error
                && stale_ctx_error(&incoming, text_opt.as_deref(), &config.get_untracked())
            {
                maybe_queue_ctx_recovery(cmd_id, state, config);
            }
            state.resolve_command_by_id(cmd_id, status);
            if let Some(text) = text_opt {
                let text = config.get_untracked().substitute_display_dids(&text);
                state.push_incoming(text, Some(cmd_id), incoming.is_error);
            }
        }
    }
}

pub(crate) struct DidEntryReply {
    pub(crate) parent: String,
    pub(crate) nick: String,
}

fn handle_did_entry_reply(
    msg_id: &str,
    incoming: &IncomingMessage,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    let Some(entry) = did_entry_reply(&incoming.content) else {
        return false;
    };
    let Some(pending) = state.pending_enter.get_untracked() else {
        return false;
    };
    if incoming.from != pending.desired_room || entry.parent != pending.desired_room {
        return false;
    }
    let Some((runtime, _)) = entry.parent.split_once('#') else {
        return false;
    };
    if !runtime.starts_with("did:ma:") {
        return false;
    }
    let Some(PendingKind::Simple { cmd_id }) = state.take_pending(msg_id) else {
        return false;
    };

    config.update(|cfg| {
        cfg.set(".my.ctx.runtime", runtime);
        cfg.set(".my.ctx.room", &entry.parent);
        cfg.delete(".my.ctx.kind");
        if entry.nick.is_empty() {
            cfg.delete(".my.ctx.nick");
            cfg.delete(".my.ctx.alias");
        } else {
            cfg.set(".my.ctx.nick", &entry.nick);
            cfg.delete(".my.ctx.alias");
        }
    });
    state.resolve_command_by_id(cmd_id, crate::core::CommandStatus::Replied(String::new()));
    state.clear_pending_enter();
    state.ctx_recovery_runtime.set(None);

    let cfg = config.get_untracked();
    crate::eval::apply_ctx_focus(&cfg, state);
    if let Some(session) = state.session.get_untracked() {
        let username = session.username.clone();
        let config_to_persist = cfg.clone();
        spawn_local(async move {
            if let Err(error) = persist_config(&username, &config_to_persist).await {
                web_sys::console::error_1(&format!("entry context persist: {error}").into());
            }
        });
    }
    true
}

pub(crate) fn did_entry_reply(content: &[u8]) -> Option<DidEntryReply> {
    let ciborium::Value::Array(items) =
        ciborium::de::from_reader::<ciborium::Value, _>(&mut &content[..]).ok()?
    else {
        return None;
    };
    if term_head(&items) != Some(":ok") {
        return None;
    }
    let ciborium::Value::Map(entries) = items.get(1)? else {
        return None;
    };
    let parent = map_text(entries, "parent")?.to_string();
    let nick = map_text(entries, "nick")?.to_string();
    map_text(entries, "name")?;
    map_text(entries, "description")?;
    entries.iter().find_map(|(key, value)| {
        (cbor_text(key) == Some("rev") && matches!(value, ciborium::Value::Integer(_)))
            .then_some(())
    })?;
    Some(DidEntryReply { parent, nick })
}

fn map_text<'a>(entries: &'a [(ciborium::Value, ciborium::Value)], key: &str) -> Option<&'a str> {
    entries.iter().find_map(|(entry_key, value)| {
        (cbor_text(entry_key) == Some(key))
            .then(|| cbor_text(value))
            .flatten()
    })
}

/// Parse root's `:enter?` reply, `[:ok, { parent, rev }]`, into the room
/// DID-URL to enter next.
pub(crate) fn root_enter_reply(content: &[u8]) -> Option<String> {
    let ciborium::Value::Array(items) =
        ciborium::de::from_reader::<ciborium::Value, _>(&mut &content[..]).ok()?
    else {
        return None;
    };
    if term_head(&items) != Some(":ok") {
        return None;
    }
    let ciborium::Value::Map(entries) = items.get(1)? else {
        return None;
    };
    let parent = map_text(entries, "parent")?;
    (parent.starts_with("did:ma:") && parent.contains('#')).then(|| parent.to_string())
}

/// Forward unsolicited actor-authored client terms to zscheme. Returns true
/// when handled.
///
/// Zion does not decide which verbs are interesting: every term reaches
/// `on-event`, and events.zscheme ignores the ones it does not want.
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
    let Some((event, args)) = decode_client_event(&term) else {
        return false;
    };
    forward_client_event(event, args, state, config)
}

fn term_head(items: &[ciborium::Value]) -> Option<&str> {
    items.first().and_then(cbor_text)
}

fn forward_client_event(
    event: String,
    args: Vec<crate::scheme::SchemeVal>,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> bool {
    if !crate::scheme::has_event_handler() {
        return false;
    }
    let state = state.clone();
    spawn_local(async move {
        if let Err(error) = crate::scheme::call_event(&event, args, &state, config).await {
            state.push_error(format!("event {event}: {error}"));
        }
    });
    true
}

/// Structural decode only: a bare `:verb` atom, or an array headed by one.
/// Argument shapes are zscheme's business, not Rust's.
fn decode_client_event(term: &ciborium::Value) -> Option<(String, Vec<crate::scheme::SchemeVal>)> {
    match term {
        ciborium::Value::Text(atom) => Some((atom.clone(), Vec::new())),
        ciborium::Value::Array(items) => Some((
            term_head(items)?.to_string(),
            items[1..].iter().map(cbor_to_scheme_val).collect(),
        )),
        _ => None,
    }
}

fn cbor_text(value: &ciborium::Value) -> Option<&str> {
    match value {
        ciborium::Value::Text(text) => Some(text),
        _ => None,
    }
}

/// Whether an error reply genuinely indicates a stale room context.
///
/// The runtime answers `unknown entity fragment: <name>` when a fragment no
/// longer resolves — that is the only signal that our cached room target is
/// gone. Ordinary room errors (authorisation, state, usage) are not staleness:
/// treating every room error as one navigated users back into the room on each
/// failed `roll-call`/`owner`/state command.
fn stale_ctx_error(incoming: &IncomingMessage, text: Option<&str>, cfg: &EgoConfig) -> bool {
    let Some(text) = text else {
        return false;
    };
    if !text
        .to_ascii_lowercase()
        .contains("unknown entity fragment")
    {
        return false;
    }
    // The unknown-fragment reply is authored by the runtime (bare DID or its
    // `#root`), not by the room itself. Restrict to our own ctx sphere so an
    // unrelated actor's fragment error never triggers a recovery re-enter.
    let room = cfg
        .get(".my.ctx.room")
        .map(str::trim)
        .filter(|r| !r.is_empty());
    let runtime = cfg
        .get(".my.ctx.runtime")
        .map(str::trim)
        .filter(|r| !r.is_empty());
    let root = runtime.map(|r| format!("{r}#root"));
    room == Some(incoming.from.as_str())
        || runtime == Some(incoming.from.as_str())
        || root.as_deref() == Some(incoming.from.as_str())
}

fn maybe_queue_ctx_recovery(cmd_id: u64, state: &AppState, config: RwSignal<EgoConfig>) {
    if state.entries.with_untracked(|entries| {
        entries.iter().any(|entry| {
            matches!(entry, crate::core::Entry::Command(command)
                if command.id == cmd_id && command.raw.trim_start().starts_with(".enter "))
        })
    }) {
        return;
    }

    let cfg = config.get_untracked();
    if cfg
        .get(".my.ctx.runtime")
        .is_none_or(|r| r.trim().is_empty())
    {
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

    if state.ctx_recovery_runtime.get_untracked().as_deref() == Some(runtime.as_str()) {
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
    state.ctx_recovery_runtime.set(Some(runtime));
    #[cfg(target_arch = "wasm32")]
    web_sys::console::warn_1(
        &format!("[ctx-recovery] stale room/fragment detected; queuing auto-enter: {enter}").into(),
    );
    state.push_system(format!(
        "auto-recovery: stale room detected, re-entering with .enter {enter}"
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

/// Answer transport-level `:ping` as a side effect, whatever consumes the term
/// afterwards. Liveness is ma-core protocol, not world policy.
fn auto_pong(incoming: &IncomingMessage, state: &AppState) {
    if incoming.reply_to.is_some() || incoming.message_type != ma_core::MESSAGE_TYPE_RPC {
        return;
    }
    let Ok(ciborium::Value::Text(atom)) =
        ciborium::de::from_reader::<ciborium::Value, _>(&mut &incoming.content[..])
    else {
        return;
    };
    if atom != ":ping" {
        return;
    }
    let target = incoming.from.clone();
    let reply_to_id = incoming.message_id.clone();
    state.outbox_queue.update(|q| {
        q.push_back(OutboxTask::RpcPong {
            target,
            reply_to_id,
        });
    });
}

/// Drop unsolicited RPC that no event handler claimed. Returns true when handled.
fn handle_unsolicited_rpc(incoming: &IncomingMessage, _state: &AppState) -> bool {
    if incoming.reply_to.is_some() || incoming.message_type != ma_core::MESSAGE_TYPE_RPC {
        return false;
    }
    // Room events are broadcast unsolicited RPC — let them through to display.
    if incoming.content_type == "application/vnd.ma.room.event" {
        return false;
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
    if incoming.service == crate::transport::LIVE_PROTOCOL_ID {
        display = format!("[live] {display}");
    }
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
    use crate::core::Entry;
    use crate::messages::IncomingMessage;
    use futures::executor::block_on;
    use std::collections::VecDeque;

    fn incoming(from: &str, display: &str) -> IncomingMessage {
        IncomingMessage {
            service: ma_core::RPC_PROTOCOL_ID.to_string(),
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

    fn event_ctx_value() -> ciborium::Value {
        ciborium::Value::Map(vec![
            (
                ciborium::Value::Text("did".to_string()),
                ciborium::Value::Text("did:ma:alice".to_string()),
            ),
            (
                ciborium::Value::Text("nick".to_string()),
                ciborium::Value::Text("Alice".to_string()),
            ),
        ])
    }

    #[test]
    fn awaited_ok_reply_is_silent_success() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let show_editor = RwSignal::new(None);
        let receiver = crate::state::AwaitingReply::register("request-1".to_string());
        let mut reply = incoming("did:ma:runtime#root", ":ok");
        reply.reply_to = Some("request-1".to_string());
        ciborium::ser::into_writer(
            &ciborium::Value::Text(":ok".to_string()),
            &mut reply.content,
        )
        .unwrap();

        dispatch_reply(
            "request-1",
            reply,
            ":ok".to_string(),
            &state,
            config,
            show_editor,
        );

        assert_eq!(block_on(receiver).unwrap(), Ok(String::new()));
        assert!(state.entries.get_untracked().is_empty());
    }

    #[test]
    fn awaited_error_reply_is_propagated_silently() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let show_editor = RwSignal::new(None);
        let receiver = crate::state::AwaitingReply::register("request-1".to_string());
        let mut reply = incoming("did:ma:runtime#root", "publication refused");
        reply.reply_to = Some("request-1".to_string());
        reply.is_error = true;
        ciborium::ser::into_writer(
            &ciborium::Value::Array(vec![
                ciborium::Value::Text(":error".to_string()),
                ciborium::Value::Text("publication refused".to_string()),
            ]),
            &mut reply.content,
        )
        .unwrap();

        dispatch_reply(
            "request-1",
            reply,
            "publication refused".to_string(),
            &state,
            config,
            show_editor,
        );

        assert_eq!(
            block_on(receiver).unwrap(),
            Err("publication refused".to_string())
        );
        assert!(state.entries.get_untracked().is_empty());
    }

    #[test]
    fn standard_client_events_decode_to_typed_arguments() {
        let ctx = event_ctx_value();
        let cases = [
            (":print", vec![ciborium::Value::Text("quack".to_string())]),
            (":arrive", vec![ctx.clone()]),
            (":leave", vec![ctx.clone()]),
            (":take", vec![ctx.clone()]),
            (":drop", vec![ctx.clone()]),
            (
                ":say",
                vec![ctx.clone(), ciborium::Value::Text("quack".to_string())],
            ),
            (
                ":emote",
                vec![ctx.clone(), ciborium::Value::Text("waddles".to_string())],
            ),
            (
                ":dig",
                vec![ctx.clone(), ciborium::Value::Text("north".to_string())],
            ),
            (
                ":fill",
                vec![ctx, ciborium::Value::Text("north".to_string())],
            ),
        ];

        for (event, args) in cases {
            let mut term = vec![ciborium::Value::Text(event.to_string())];
            term.extend(args);
            let (decoded_event, decoded_args) =
                decode_client_event(&ciborium::Value::Array(term)).expect("valid event");
            assert_eq!(decoded_event, event);
            assert!(!decoded_args.is_empty());
        }
    }

    #[test]
    fn unknown_verbs_and_bare_atoms_are_forwarded() {
        let (event, args) = decode_client_event(&ciborium::Value::Array(vec![
            ciborium::Value::Text(":unknown".to_string()),
            ciborium::Value::Text("anything".to_string()),
        ]))
        .expect("unknown verbs are zscheme's business");
        assert_eq!(event, ":unknown");
        assert_eq!(args.len(), 1);

        let (event, args) =
            decode_client_event(&ciborium::Value::Text(":roll-call-child".to_string()))
                .expect("bare atom is a verb with no arguments");
        assert_eq!(event, ":roll-call-child");
        assert!(args.is_empty());
    }

    #[test]
    fn non_verb_terms_are_rejected() {
        assert!(
            decode_client_event(&ciborium::Value::Array(vec![ciborium::Value::Integer(
                1.into()
            ),]))
            .is_none()
        );
        assert!(decode_client_event(&ciborium::Value::Array(vec![])).is_none());
        assert!(decode_client_event(&ciborium::Value::Integer(1.into())).is_none());
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
    fn format_display_marks_live_service_messages() {
        let _runtime = leptos::prelude::Owner::new();
        let config = RwSignal::new(EgoConfig::default());
        let mut live = incoming("did:ma:room", "dial request");
        live.service = crate::transport::LIVE_PROTOCOL_ID.to_string();

        assert_eq!(format_display(&live, config), "[live] dial request");
    }

    #[test]
    fn explicit_rpc_reply_bypasses_avatar_reply_handler() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let show_editor = RwSignal::new(None);
        crate::scheme::init_session_env();
        block_on(crate::scheme::load_content(
            "(define (on-reply verb value) nil)",
            &state,
            config,
        ))
        .expect("reply handler loads");

        let cmd_id = state.push_command("@sky#construct:look");
        state.pending_requests.update(|requests| {
            requests.insert(
                "request-1".to_string(),
                crate::state::TrackedRequest {
                    kind: PendingKind::Simple { cmd_id },
                    batch_id: None,
                    sent_at_ms: 0.0,
                },
            );
        });
        let mut content = Vec::new();
        ciborium::ser::into_writer(
            &ciborium::Value::Array(vec![
                ciborium::Value::Text(":ok".to_string()),
                ciborium::Value::Map(vec![(
                    ciborium::Value::Text("name".to_string()),
                    ciborium::Value::Text("Sky Construct".to_string()),
                )]),
            ]),
            &mut content,
        )
        .unwrap();
        let mut reply = incoming("did:ma:sky#construct", "RAW STRUCTURED REPLY");
        reply.reply_to = Some("request-1".to_string());
        reply.content = content;

        dispatch_reply(
            "request-1",
            reply,
            "RAW STRUCTURED REPLY".to_string(),
            &state,
            config,
            show_editor,
        );

        assert!(state
            .entries
            .with_untracked(|entries| entries.iter().any(|entry| {
                matches!(entry, Entry::Incoming(record) if record.display == "RAW STRUCTURED REPLY")
            })));
    }

    #[test]
    fn crud_service_selects_structured_reply_decoding() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let show_editor = RwSignal::new(None);
        let cmd_id = state.push_command("@ma/entities");
        state.pending_requests.update(|requests| {
            requests.insert(
                "request-1".to_string(),
                crate::state::TrackedRequest {
                    kind: PendingKind::Simple { cmd_id },
                    batch_id: None,
                    sent_at_ms: 0.0,
                },
            );
        });

        let mut content = Vec::new();
        ciborium::ser::into_writer(
            &ciborium::Value::Array(vec![
                ciborium::Value::Text("duckie".to_string()),
                ciborium::Value::Text("house".to_string()),
            ]),
            &mut content,
        )
        .unwrap();
        let mut reply = incoming("did:ma:runtime#root", "WRONG RPC DISPLAY");
        reply.service = CRUD_PROTOCOL_ID.to_string();
        reply.reply_to = Some("request-1".to_string());
        reply.content_type = ma_core::CONTENT_TYPE_TERM_CBOR.to_string();
        reply.content = content;

        dispatch_reply(
            "request-1",
            reply,
            "WRONG RPC DISPLAY".to_string(),
            &state,
            config,
            show_editor,
        );

        assert!(state
            .entries
            .with_untracked(|entries| entries.iter().any(|entry| {
                matches!(entry, Entry::Incoming(record)
                if record.display.contains("duckie")
                    && record.display.contains("house")
                    && !record.display.contains("WRONG RPC DISPLAY"))
            })));
    }

    #[test]
    fn did_entry_reply_requires_complete_presence_ctx() {
        let complete = ciborium::Value::Array(vec![
            ciborium::Value::Text(":ok".to_string()),
            ciborium::Value::Map(vec![
                (
                    ciborium::Value::Text("parent".to_string()),
                    ciborium::Value::Text("did:ma:k51runtime#room".to_string()),
                ),
                (
                    ciborium::Value::Text("name".to_string()),
                    ciborium::Value::Text("Alice".to_string()),
                ),
                (
                    ciborium::Value::Text("nick".to_string()),
                    ciborium::Value::Text("Alice".to_string()),
                ),
                (
                    ciborium::Value::Text("description".to_string()),
                    ciborium::Value::Text("A visitor.".to_string()),
                ),
                (
                    ciborium::Value::Text("rev".to_string()),
                    ciborium::Value::Integer(1.into()),
                ),
            ]),
        ]);
        let mut content = Vec::new();
        ciborium::ser::into_writer(&complete, &mut content).unwrap();

        let entry = did_entry_reply(&content).expect("complete DID ctx is accepted");
        assert_eq!(entry.parent, "did:ma:k51runtime#room");
        assert_eq!(entry.nick, "Alice");

        let incomplete = ciborium::Value::Array(vec![
            ciborium::Value::Text(":ok".to_string()),
            ciborium::Value::Map(vec![(
                ciborium::Value::Text("parent".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#room".to_string()),
            )]),
        ]);
        let mut incomplete_content = Vec::new();
        ciborium::ser::into_writer(&incomplete, &mut incomplete_content).unwrap();
        assert!(did_entry_reply(&incomplete_content).is_none());
    }

    #[test]
    fn root_enter_reply_extracts_parent_from_minimal_ctx() {
        let ok = ciborium::Value::Array(vec![
            ciborium::Value::Text(":ok".to_string()),
            ciborium::Value::Map(vec![
                (
                    ciborium::Value::Text("parent".to_string()),
                    ciborium::Value::Text("did:ma:k51runtime#construct".to_string()),
                ),
                (
                    ciborium::Value::Text("rev".to_string()),
                    ciborium::Value::Integer(1.into()),
                ),
            ]),
        ]);
        let mut content = Vec::new();
        ciborium::ser::into_writer(&ok, &mut content).unwrap();
        assert_eq!(
            root_enter_reply(&content).as_deref(),
            Some("did:ma:k51runtime#construct")
        );

        let error = ciborium::Value::Array(vec![
            ciborium::Value::Text(":error".to_string()),
            ciborium::Value::Text("root has no start room configured".to_string()),
        ]);
        let mut error_content = Vec::new();
        ciborium::ser::into_writer(&error, &mut error_content).unwrap();
        assert!(root_enter_reply(&error_content).is_none());

        let bad_parent = ciborium::Value::Array(vec![
            ciborium::Value::Text(":ok".to_string()),
            ciborium::Value::Map(vec![(
                ciborium::Value::Text("parent".to_string()),
                ciborium::Value::Text("not-a-did-url".to_string()),
            )]),
        ]);
        let mut bad_parent_content = Vec::new();
        ciborium::ser::into_writer(&bad_parent, &mut bad_parent_content).unwrap();
        assert!(root_enter_reply(&bad_parent_content).is_none());
    }

    #[test]
    fn matching_entry_reply_updates_focus_prompt() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.ma", "did:ma:k51runtime");
        let config = RwSignal::new(cfg);
        let room = "did:ma:k51runtime#garden";
        let cmd_id = state.push_command(format!(".enter {room}"));
        state.pending_enter.set(Some(crate::state::PendingEnter {
            cmd_id: Some(cmd_id),
            desired_runtime: "did:ma:k51runtime".to_string(),
            desired_room: room.to_string(),
            issued_at_ms: 0.0,
            visible: true,
        }));
        state.pending_requests.update(|requests| {
            requests.insert(
                "request-1".to_string(),
                crate::state::TrackedRequest {
                    kind: PendingKind::Simple { cmd_id },
                    batch_id: None,
                    sent_at_ms: 0.0,
                },
            );
        });
        let reply = ciborium::Value::Array(vec![
            ciborium::Value::Text(":ok".to_string()),
            ciborium::Value::Map(vec![
                (
                    ciborium::Value::Text("parent".to_string()),
                    ciborium::Value::Text(room.to_string()),
                ),
                (
                    ciborium::Value::Text("name".to_string()),
                    ciborium::Value::Text("Alice".to_string()),
                ),
                (
                    ciborium::Value::Text("nick".to_string()),
                    ciborium::Value::Text("Alice".to_string()),
                ),
                (
                    ciborium::Value::Text("description".to_string()),
                    ciborium::Value::Text("A visitor.".to_string()),
                ),
                (
                    ciborium::Value::Text("rev".to_string()),
                    ciborium::Value::Integer(1.into()),
                ),
            ]),
        ]);
        let mut incoming = incoming(room, "");
        ciborium::ser::into_writer(&reply, &mut incoming.content).unwrap();

        assert!(handle_did_entry_reply(
            "request-1",
            &incoming,
            &state,
            config
        ));
        assert_eq!(config.get_untracked().get(".my.ctx.room"), Some(room));
        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "Alice@ma#garden"
        );
    }

    #[cfg(any())]
    #[test]
    fn ctx_receipt_applies_flat_avatar_ctx_fields() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let payload = ciborium::Value::Array(vec![
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
        assert_eq!(cfg.get(".my.ctx.ctx"), None);
        assert_eq!(cfg.get(".my.ctx.protocol"), None);
        assert_eq!(cfg.get(".my.ctx.kind"), Some("agent"));
        assert_eq!(cfg.get(".my.ctx.room"), Some("did:ma:k51runtime#room"));
        assert_eq!(cfg.get(".my.ctx.tail.entries.0.ctx"), None);
        assert_eq!(cfg.get(".my.ctx.tail.entries.0.kind"), Some("agent"));
        assert_eq!(
            cfg.get(".my.ctx.tail.entries.0.room"),
            Some("did:ma:k51runtime#room")
        );
    }

    #[cfg(any())]
    #[test]
    fn duplicate_ctx_receipt_skips_focus_tail_and_text_updates() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let payload = ciborium::Value::Array(vec![
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":kind".to_string()),
                ciborium::Value::Text("avatar".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":root".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":avatar".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#alice".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":nick".to_string()),
                ciborium::Value::Text("Alice".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":room".to_string()),
                ciborium::Value::Text("did:ma:k51runtime#room".to_string()),
            ]),
            ciborium::Value::Array(vec![
                ciborium::Value::Text(":text".to_string()),
                ciborium::Value::Text("You arrive.".to_string()),
            ]),
        ]);
        let incoming = incoming("did:ma:k51runtime#alice", "");

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);
        let first_entries = state.entries.with_untracked(Vec::len);
        let first_tail = config
            .get_untracked()
            .get(".my.ctx.tail.entries.0.at_ms")
            .map(str::to_string);
        state.focus_actor.set(None);

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        assert!(state.focus_actor.get_untracked().is_none());
        assert_eq!(state.entries.with_untracked(Vec::len), first_entries);
        assert_eq!(
            config
                .get_untracked()
                .get(".my.ctx.tail.entries.0.at_ms")
                .map(str::to_string),
            first_tail
        );
    }

    #[cfg(any())]
    #[test]
    fn changed_ctx_receipt_updates_focus() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        let payload = |nick: &str| {
            ciborium::Value::Array(vec![
                ciborium::Value::Array(vec![
                    ciborium::Value::Text(":kind".to_string()),
                    ciborium::Value::Text("avatar".to_string()),
                ]),
                ciborium::Value::Array(vec![
                    ciborium::Value::Text(":root".to_string()),
                    ciborium::Value::Text("did:ma:k51runtime#root".to_string()),
                ]),
                ciborium::Value::Array(vec![
                    ciborium::Value::Text(":avatar".to_string()),
                    ciborium::Value::Text("did:ma:k51runtime#alice".to_string()),
                ]),
                ciborium::Value::Array(vec![
                    ciborium::Value::Text(":nick".to_string()),
                    ciborium::Value::Text(nick.to_string()),
                ]),
                ciborium::Value::Array(vec![
                    ciborium::Value::Text(":room".to_string()),
                    ciborium::Value::Text("did:ma:k51runtime#room".to_string()),
                ]),
            ])
        };
        let incoming = incoming("did:ma:k51runtime#alice", "");

        handle_ctx_receipt(Some(&payload("Alice")), &incoming, &state, config);
        handle_ctx_receipt(Some(&payload("Alicia")), &incoming, &state, config);

        assert_eq!(config.get_untracked().get(".my.ctx.nick"), Some("Alicia"));
        assert!(state
            .focus_actor
            .get_untracked()
            .is_some_and(|focus| focus.prompt.starts_with("Alicia@")));
    }

    #[cfg(any())]
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

        let second_cmd_id = state.push_command(format!(".enter {room}"));
        state.pending_enter.set(Some(crate::state::PendingEnter {
            cmd_id: Some(second_cmd_id),
            desired_runtime: "did:ma:k51target".to_string(),
            desired_room: room.to_string(),
            issued_at_ms: 0.0,
            visible: true,
        }));

        handle_ctx_receipt(Some(&payload), &incoming, &state, config);

        assert!(state.pending_enter.get_untracked().is_none());
        let second_status = state.entries.with_untracked(|entries| {
            entries.iter().find_map(|entry| match entry {
                crate::core::Entry::Command(command) if command.id == second_cmd_id => {
                    Some(command.status.get_untracked())
                }
                _ => None,
            })
        });
        assert_eq!(
            second_status,
            Some(crate::core::CommandStatus::Replied(String::new()))
        );
    }

    #[test]
    fn ordinary_room_error_does_not_trigger_recovery() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let room = "did:ma:k51runtime#construct";
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| {
            cfg.set(".my.ctx.use", "true");
            cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
            cfg.set(".my.ctx.room", room);
            cfg.set(".my.ctx.nick", "bahner");
        });
        let show_editor = RwSignal::new(None);
        let cmd_id = state.push_command("@ma#construct:roll-call end");
        let msg_id = "request-1".to_string();
        state.pending_requests.update(|m| {
            m.insert(
                msg_id.clone(),
                crate::state::TrackedRequest {
                    kind: PendingKind::Simple { cmd_id },
                    batch_id: None,
                    sent_at_ms: 0.0,
                },
            );
        });

        let mut reply = incoming(room, "no roll-call active");
        reply.reply_to = Some(msg_id);
        reply.is_error = true;
        ciborium::ser::into_writer(
            &ciborium::Value::Array(vec![
                ciborium::Value::Text(":error".to_string()),
                ciborium::Value::Text("no roll-call active".to_string()),
            ]),
            &mut reply.content,
        )
        .unwrap();

        dispatch_reply(
            "request-1",
            reply,
            "no roll-call active".to_string(),
            &state,
            config,
            show_editor,
        );

        assert!(state.input_queue.get_untracked().is_empty());
        assert!(state.ctx_recovery_runtime.get_untracked().is_none());
    }

    #[test]
    fn unknown_fragment_error_from_runtime_triggers_recovery() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| {
            cfg.set(".my.ctx.use", "true");
            cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
            cfg.set(".my.ctx.room", "did:ma:k51runtime#construct");
            cfg.set(".my.ctx.nick", "bahner");
        });
        let show_editor = RwSignal::new(None);
        let cmd_id = state.push_command("@ma#construct:look");
        let msg_id = "request-1".to_string();
        state.pending_requests.update(|m| {
            m.insert(
                msg_id.clone(),
                crate::state::TrackedRequest {
                    kind: PendingKind::Simple { cmd_id },
                    batch_id: None,
                    sent_at_ms: 0.0,
                },
            );
        });

        // The runtime (bare DID) answers when the fragment no longer resolves.
        let mut reply = incoming("did:ma:k51runtime", "unknown entity fragment: construct");
        reply.reply_to = Some(msg_id);
        reply.is_error = true;
        ciborium::ser::into_writer(
            &ciborium::Value::Array(vec![
                ciborium::Value::Text(":error".to_string()),
                ciborium::Value::Text("unknown entity fragment: construct".to_string()),
            ]),
            &mut reply.content,
        )
        .unwrap();

        dispatch_reply(
            "request-1",
            reply,
            "unknown entity fragment: construct".to_string(),
            &state,
            config,
            show_editor,
        );

        let queued: Vec<String> = state.input_queue.get_untracked().into_iter().collect();
        assert!(queued
            .iter()
            .any(|line| line == ".enter bahner@did:ma:k51runtime"));
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
            cfg.set(".my.ctx.room", format!("did:ma:k51runtime#{missing_room}"));
            cfg.set(".my.ctx.nick", "foo");
        });
        state.input_queue.set(VecDeque::new());
        let cmd_id = state.push_command("look");

        maybe_queue_ctx_recovery(cmd_id, &state, config);

        let queued: Vec<String> = state.input_queue.get_untracked().into_iter().collect();
        assert!(queued
            .iter()
            .any(|line| line == ".enter foo@did:ma:k51runtime"));
        assert!(!queued.iter().any(|line| line.contains(missing_room)));

        state.input_queue.update(std::collections::VecDeque::clear);
        maybe_queue_ctx_recovery(cmd_id, &state, config);
        assert!(state.input_queue.get_untracked().is_empty());
    }

    #[test]
    fn recovery_does_not_retry_a_failed_enter() {
        let _runtime = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = RwSignal::new(EgoConfig::default());
        config.update(|cfg| {
            cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
            cfg.set(".my.ctx.nick", "foo");
        });
        let cmd_id = state.push_command(".enter foo@did:ma:k51runtime");

        maybe_queue_ctx_recovery(cmd_id, &state, config);

        assert!(state.input_queue.get_untracked().is_empty());
        assert!(state.ctx_recovery_runtime.get_untracked().is_none());
    }
}
