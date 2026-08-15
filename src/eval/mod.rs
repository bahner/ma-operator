//! Command evaluators: local/remote path CRUD, actor messages, alias
//! validation, config-to-DOM application, and lazy DID/CID link traversal.

pub(crate) mod actor;
pub(crate) mod actor_send {
    pub(crate) use super::actor::execute_outbox_task;
}

use leptos::prelude::*;
use std::collections::BTreeMap;

use ma_core::DidDocumentResolver;
use ma_zscheme::SchemeVal;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    core::CommandStatus,
    i18n::{msg_jobs_cancelled, t, tf},
    parser::command::{Command, DotOp},
    parser::verbs::dispatch_meta,
    state::{AppState, FocusMode, PendingKind},
    transport,
    views::editor::EditorContext,
};

fn validate_alias_set(path: &str, value: &str) -> Result<(), String> {
    const PREFIX: &str = ".my.aliases.";
    if !path.starts_with(PREFIX) {
        return Ok(());
    }

    let name = &path[PREFIX.len()..];
    if name.is_empty() {
        return Err(t("err-alias-name-empty"));
    }
    if name.contains('.') {
        return Err(t("err-alias-has-dot"));
    }
    if name.contains('#') {
        return Err(t("err-alias-has-fragment"));
    }
    if value.chars().any(char::is_whitespace) {
        return Err(t("err-alias-not-did"));
    }
    let fragment_count = value.matches('#').count();
    if fragment_count > 1 || value.ends_with('#') {
        return Err(t("err-alias-value-fragment"));
    }
    if let Some((_, fragment)) = value.split_once('#') {
        if fragment.is_empty()
            || fragment
                .chars()
                .any(|c| !(c.is_ascii_alphanumeric() || c == '_' || c == '-'))
        {
            return Err(t("err-alias-value-fragment"));
        }
    }
    if value.contains('/') {
        return Err(t("err-alias-value-path"));
    }
    if !value.starts_with("did:ma:") {
        return Err(t("err-alias-not-did"));
    }
    Ok(())
}

pub(crate) fn apply_config_to_dom(cfg: &EgoConfig) {
    let Some(window) = web_sys::window() else {
        return;
    };
    let Some(document) = window.document() else {
        return;
    };
    let Some(root) = document.document_element() else {
        return;
    };

    let style = format!(
        "--colour-text:{};--colour-dimmed:{};--colour-pending:{};--colour-replied:{};--colour-alias:{};--colour-error:{};--colour-system:{};--colour-bg:{};--colour-input-bg:{};--colour-border:{};--colour-cursor:{};--colour-highlight:{};--colour-editor-bg:{};",
        cfg.get(".my.config.colour.text").unwrap_or("#00ff41"),
        cfg.get(".my.config.colour.dimmed").unwrap_or("#008f11"),
        cfg.get(".my.config.colour.pending").unwrap_or("#004d00"),
        cfg.get(".my.config.colour.replied").unwrap_or("#00ff41"),
        cfg.get(".my.config.colour.alias").unwrap_or("#ffd700"),
        cfg.get(".my.config.colour.error").unwrap_or("#ff3333"),
        cfg.get(".my.config.colour.system").unwrap_or("#888888"),
        cfg.get(".my.config.colour.bg").unwrap_or("#0d0d0d"),
        cfg.get(".my.config.colour.input_bg").unwrap_or("#0a0a0a"),
        cfg.get(".my.config.colour.border").unwrap_or("#003300"),
        cfg.get(".my.config.colour.cursor").unwrap_or("#00ff41"),
        cfg.get(".my.config.colour.highlight").unwrap_or("#003300"),
        cfg.get(".my.config.colour.editor.background").unwrap_or("#0d0d0d"),
    );

    let _ = root.set_attribute("style", &style);
}

async fn resolve_and_traverse(
    link: &str,
    subpath: &str,
    state: &AppState,
    cache: RwSignal<std::collections::HashMap<String, serde_json::Value>>,
) {
    // Check cache first.
    let cached = cache.with_untracked(|m| m.get(link).cloned());
    let doc = if let Some(v) = cached {
        v
    } else {
        let val: Result<serde_json::Value, String> = if link.starts_with("did:ma:") {
            // Use the session resolver — it owns the gateway URL, has a
            // positive cache, and falls back to public gateways automatically.
            let Some(resolver) = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone()) else {
                state.push_error(t("msg-link-not-connected"));
                return;
            };
            resolver
                .resolve(link)
                .await
                .map_err(|e| e.to_string())
                .and_then(|doc| serde_json::to_value(&doc).map_err(|e| e.to_string()))
        } else {
            // Bare CID (IPLD link value) — fetch from local gateway.
            match crate::http::fetch_cid_text(link).await {
                Ok(t) => serde_json::from_str::<serde_json::Value>(&t).map_err(|e| e.to_string()),
                Err(e) => Err(e),
            }
        };
        match val {
            Ok(v) => {
                cache.update(|m| {
                    m.insert(link.to_string(), v.clone());
                });
                v
            }
            Err(e) => {
                state.push_error(tf("msg-link-fetch-error", &[("e", &e)]));
                return;
            }
        }
    };

    // Traverse subpath keys into the JSON document.
    let mut cur = &doc;
    for key in subpath.split(['/', '.']) {
        if let Some(v) = cur.get(key) {
            cur = v;
        } else {
            state.push_error(tf("msg-link-key-not-found", &[("key", key)]));
            return;
        }
    }
    let display = match cur {
        serde_json::Value::String(s) => s.clone(),
        other => other.to_string(),
    };
    state.push_output(format!("{link}/{subpath}: {display}"));
}

pub(crate) fn eval(
    cmd: Command,
    raw: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    match cmd {
        Command::PlainText(text) => {
            if !text.is_empty() {
                state.push_system(text);
            }
        }

        Command::DotCommand { path, op, args } => {
            eval_control(&path, op, &args, state, config, show_editor, on_eval);
        }

        Command::LocalCrud { path, op, args } => {
            eval_local(&path, op, &args, state, config, show_editor, on_eval);
        }

        Command::RemoteCrud { target, path, op } => {
            actor::eval_remote_crud(target, path, op, raw, state, show_editor, config);
        }

        Command::ActorMessage {
            target,
            verb,
            meta,
            body,
        } => {
            actor::eval_actor(target, verb, meta, body, raw, state, config);
        }

        Command::ActorLocalCommand {
            target,
            command,
            body,
        } => {
            actor::eval_actor_local(target, command, body, raw, state);
        }
    }
}

fn eval_control(
    path: &str,
    op: DotOp,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    // ── .help / .help/* ───────────────────────────────────────────────────
    if path == ".help" || path.starts_with(".help/") {
        let subtopic = path.strip_prefix(".help/").unwrap_or("");
        for line in crate::help::dispatch(subtopic) {
            state.push_system(line);
        }
        return;
    }

    // ── Control commands ──────────────────────────────────────────────────
    match path {
        ".logout" => {
            transport::disconnect();
            crate::scheme::reset_session_env();
            config.update(|cfg| {
                cfg.delete_subtree(".ma");
                cfg.delete(".my.aliases.ma");
            });
            state.session.set(None);
        }
        ".clear" => {
            state.entries.set(vec![]);
        }
        ".cancel" => {
            state.cancel_jobs();
            state.push_system(msg_jobs_cancelled());
        }
        ".panic" => {
            state.screensaver.set(true);
        }
        ".ma" => {
            let (verb, ma_args) = match op {
                DotOp::Get if args.is_empty() => ("publish", Vec::new()),
                DotOp::Set(value) => {
                    let value = value.trim();
                    if value == "claim" {
                        ("claim", Vec::new())
                    } else if let Some(port) = value.strip_prefix("claim ") {
                        ("claim", vec![port.trim().to_string()])
                    } else {
                        ("set", vec![value.to_string()])
                    }
                }
                _ => {
                    state.push_error("usage: .ma | .ma: did:ma:… | .ma: claim [port]");
                    return;
                }
            };
            if let Err(e) =
                dispatch_meta(".ma", verb, &ma_args, state, config, show_editor, on_eval)
            {
                state.push_error(e);
            }
        }
        ".history" => {
            let hist = state.history.get_untracked();
            let mut deduped: Vec<&str> = Vec::new();
            let mut last: Option<&str> = None;
            for entry in &hist {
                if last != Some(entry.as_str()) {
                    deduped.push(entry.as_str());
                    last = Some(entry.as_str());
                }
            }
            let tail = match args.first().map(|s| s.parse::<usize>()) {
                Some(Ok(n)) => deduped.len().saturating_sub(n),
                Some(Err(_)) => {
                    state.push_error(t("err-history-count-invalid"));
                    return;
                }
                None => 0,
            };
            for (i, entry) in deduped.iter().enumerate().skip(tail) {
                state.push_system(format!("{:>4}  {entry}", i + 1));
            }
        }
        ".leave" => {
            handle_leave(state, config);
        }
        ".enter" => {
            eval_enter(args, state, config);
        }
        ".edit" => {
            if let Err(e) = dispatch_meta(
                ".my.doc.scratch",
                "edit",
                args,
                state,
                config,
                show_editor,
                on_eval,
            ) {
                state.push_error(e);
            }
        }
        ".batch:end" => {
            if let Err(e) = dispatch_meta(
                ".my.doc.scratch",
                "eval",
                args,
                state,
                config,
                show_editor,
                on_eval,
            ) {
                state.push_error(e);
            }
        }
        _ => {
            state.push_error(tf("err-unknown-command", &[("path", path)]));
        }
    }
}

fn eval_enter(args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    let Some(raw) = args.first() else {
        enter_no_args(state, config);
        return;
    };
    let cfg = config.get_untracked();
    let (requested_nick, actor_input, requested_kind) = match parse_enter_target(raw) {
        Ok(parsed) => parsed,
        Err(e) => {
            state.push_error(format!("{e}: {raw}"));
            return;
        }
    };
    let resolved = match crate::parser::command::resolve_target(&actor_input, &cfg) {
        Ok(target) => target,
        Err(e) => {
            state.push_error(format!("not an actor address: {raw}: {e}"));
            return;
        }
    };
    if resolved.ends_with('#') {
        state.push_error("usage: .enter [nick]@runtime[#room]".to_string());
        return;
    }
    let target_actor = resolved.clone();
    let requested_nick_display = requested_nick.clone();
    let effective_nick = requested_nick.or_else(|| {
        cfg.get(".my.ctx.nick")
            .filter(|nick| !nick.is_empty())
            .map(str::to_string)
    });
    let inventory = configured_inventory(&cfg).map(str::to_string);

    let entered_display =
        enter_target_display(&target_actor, requested_nick_display.as_deref(), &cfg);
    let state2 = state.clone();
    let cancel_epoch = state.cancel_epoch();
    let enter_kind = match enter_ctx_kind(requested_kind.as_deref()) {
        Ok(kind) => kind.map(str::to_string),
        Err(e) => {
            state.push_error(e);
            return;
        }
    };
    spawn_local(async move {
        if state2.was_cancelled_since(cancel_epoch) {
            return;
        }
        let cmd_id = state2.push_command(format!(".enter {entered_display}"));
        if state2.was_cancelled_since(cancel_epoch) {
            state2.resolve_command_by_id(cmd_id, CommandStatus::Error("cancelled".to_string()));
            return;
        }
        let (entry_runtime, requested_room) = target_actor.split_once('#').map_or_else(
            || (target_actor.clone(), None),
            |(runtime, _)| (runtime.to_string(), Some(target_actor.clone())),
        );

        if let Some(room_actor) = requested_room {
            enter_room(
                &state2,
                config,
                cmd_id,
                cancel_epoch,
                &entry_runtime,
                &room_actor,
                effective_nick.as_deref(),
                enter_kind.as_deref(),
                inventory.as_deref(),
            )
            .await;
            return;
        }

        // A bare runtime has no default room on the wire (lambda-ma
        // REFERENCE.md "Entry and room API"): ask root's `:enter?`, which
        // always names a room to enter.
        discover_and_enter_room(
            &state2,
            cmd_id,
            cancel_epoch,
            entry_runtime,
            effective_nick,
            enter_kind,
            inventory,
        )
        .await;
    });
}

/// Send `:enter` directly to a known room and track the reply via
/// `pending_enter`/`handle_did_entry_reply`.
#[allow(clippy::too_many_arguments)]
pub(crate) async fn enter_room(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    cmd_id: u64,
    cancel_epoch: u64,
    entry_runtime: &str,
    room_actor: &str,
    effective_nick: Option<&str>,
    enter_kind: Option<&str>,
    inventory: Option<&str>,
) {
    if state.was_cancelled_since(cancel_epoch) {
        return;
    }
    state.set_pending_enter(cmd_id, entry_runtime.to_string(), room_actor.to_string());
    let cfg = config.get_untracked();
    let send_result = match enter_kind {
        None => {
            let enter_args = did_enter_args(effective_nick, inventory);
            transport::send_rpc(room_actor, "enter", &enter_args).await
        }
        Some(kind) => {
            let enter_args = build_enter_ctx(state, effective_nick, kind, &cfg);
            transport::send_rpc_vals(room_actor, "enter", &[enter_args]).await
        }
    };
    if state.was_cancelled_since(cancel_epoch) {
        return;
    }
    match send_result {
        Ok(msg_id) => {
            state.bind_message_id(cmd_id, msg_id);
        }
        Err(e) => {
            state.clear_pending_enter();
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
            state.push_error(tf("msg-send-failed", &[("e", &e)]));
        }
    }
}

/// Ask `#root` for a room to enter (`root.ma`'s `:enter?`). Root always
/// replies with a ctx naming a room, defaulting to the configured `start`
/// room; `handle_root_enter_reply` falls back to `#construct` client-side
/// only if root's reply cannot be parsed (e.g. an older root without this
/// verb).
async fn discover_and_enter_room(
    state: &AppState,
    cmd_id: u64,
    cancel_epoch: u64,
    entry_runtime: String,
    effective_nick: Option<String>,
    enter_kind: Option<String>,
    inventory: Option<String>,
) {
    let root = format!("{entry_runtime}#root");
    let batch_id = state
        .cmd_to_batch
        .with_untracked(|m| m.get(&cmd_id).copied());
    let mut registered_msg_id: Option<String> = None;
    let send_result = transport::send_rpc_with_msg_id(&root, "enter?", &[], |msg_id| {
        registered_msg_id = Some(msg_id.clone());
        state.register_pending(
            msg_id,
            PendingKind::RootEnterDiscovery {
                entry_runtime: entry_runtime.clone(),
                cmd_id,
                effective_nick: effective_nick.clone(),
                enter_kind: enter_kind.clone(),
                inventory: inventory.clone(),
            },
            batch_id,
        );
    })
    .await;
    if state.was_cancelled_since(cancel_epoch) {
        if let Some(msg_id) = registered_msg_id {
            state.take_pending(&msg_id);
        }
        return;
    }
    if let Err(e) = send_result {
        if let Some(msg_id) = registered_msg_id {
            state.take_pending(&msg_id);
        }
        state.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
        state.push_error(tf("msg-send-failed", &[("e", &e)]));
    }
}

fn enter_target_display(
    target_actor: &str,
    requested_nick: Option<&str>,
    cfg: &EgoConfig,
) -> String {
    let actor = cfg
        .alias_display(target_actor)
        .unwrap_or_else(|| format!("@{target_actor}"));
    match requested_nick {
        Some(nick) => format!("{nick}@{}", actor.trim_start_matches('@')),
        None => actor,
    }
}

fn enter_no_args(state: &AppState, config: RwSignal<EgoConfig>) {
    let cfg = config.get_untracked();
    // Re-enter existing ctx if present.
    if cfg.get(".my.ctx.runtime").is_some_and(|r| !r.is_empty()) {
        apply_ctx_focus(&cfg, state);
        return;
    }
    // Fall back to .my.config.ctx default.
    if let Some(default_ctx) = cfg.get(".my.config.ctx").filter(|s| !s.is_empty()) {
        eval_enter(&[default_ctx.to_string()], state, config);
        return;
    }
    state.push_error(
        "no context to enter; use .enter @runtime[#room] or set .my.config.ctx".to_string(),
    );
}

fn handle_leave(state: &AppState, config: RwSignal<EgoConfig>) {
    let cfg = config.get_untracked();
    let target = cfg
        .get(".my.ctx.room")
        .or_else(|| cfg.get(".my.ctx.runtime"))
        .filter(|s| !s.is_empty())
        .map(str::to_string);
    if let Some(target) = target {
        let state2 = state.clone();
        spawn_local(async move {
            let _ = crate::transport::send_rpc(&target, "leave", &[]).await;
            state2.push_system(t("msg-left"));
        });
    }
    state.focus_actor.set(None);
}

fn did_enter_args<'a>(nick: Option<&'a str>, inventory: Option<&'a str>) -> Vec<&'a str> {
    match (nick, inventory) {
        (Some(nick), Some(inventory)) => vec![nick, inventory],
        (None, Some(inventory)) => vec!["", inventory],
        (Some(nick), None) => vec![nick],
        (None, None) => Vec::new(),
    }
}

fn configured_inventory(cfg: &EgoConfig) -> Option<&str> {
    cfg.get(".my.ctx.inv").filter(|inventory| {
        inventory.split_once('#').is_some_and(|(did, fragment)| {
            did.starts_with("did:ma:")
                && !fragment.is_empty()
                && !fragment.contains('#')
                && !inventory.chars().any(char::is_whitespace)
        })
    })
}

fn build_enter_ctx(
    state: &AppState,
    requested_nick: Option<&str>,
    kind: &str,
    cfg: &EgoConfig,
) -> SchemeVal {
    let username = state
        .session
        .get_untracked()
        .map_or_else(|| "traveler".to_string(), |s| s.username);
    let name = trim_or_fallback(
        cfg.get(".my.profile.name")
            .map(str::to_string)
            .or_else(|| cfg.get(".my.profile.username").map(str::to_string)),
        &username,
    );
    let nick = trim_or_fallback(
        requested_nick
            .map(str::to_string)
            .or_else(|| cfg.get(".my.ctx.nick").map(str::to_string)),
        &name,
    );
    let description = trim_or_fallback(
        cfg.get(".my.profile.description").map(str::to_string),
        "A ruggedly handsome gentleman",
    );

    let mut ctx = BTreeMap::new();
    ctx.insert("kind".to_string(), SchemeVal::Str(kind.to_string()));
    ctx.insert("name".to_string(), SchemeVal::Str(name));
    ctx.insert("nick".to_string(), SchemeVal::Str(nick));
    ctx.insert("description".to_string(), SchemeVal::Str(description));
    SchemeVal::Map(ctx)
}

fn enter_ctx_kind(kind: Option<&str>) -> Result<Option<&str>, String> {
    match kind.map(str::trim).filter(|kind| !kind.is_empty()) {
        None | Some("avatar") => Ok(None),
        Some("agent") => Ok(Some("agent")),
        Some("thing") => Ok(Some("thing")),
        Some(other) => Err(format!(
            "unsupported enter kind: {other}; use kind=agent or kind=thing, or omit kind for session entry"
        )),
    }
}

fn trim_or_fallback(value: Option<String>, fallback: &str) -> String {
    value
        .map(|v| v.trim().to_string())
        .filter(|v| !v.is_empty())
        .unwrap_or_else(|| fallback.to_string())
}

fn parse_enter_target(raw: &str) -> Result<(Option<String>, String, Option<String>), String> {
    const USAGE: &str = "usage: .enter [nick]@runtime[#room][?kind=agent]";
    // Strip optional ?key=value query params; extract `kind` if present.
    let (url_part, query_part) = raw.split_once('?').unwrap_or((raw, ""));
    let kind = query_part
        .split('&')
        .filter_map(|kv| kv.split_once('='))
        .find(|(k, _)| *k == "kind")
        .map(|(_, v)| v.trim().to_string())
        .filter(|v| !v.is_empty());

    if let Some(stripped) = url_part.strip_prefix('@') {
        if url_part.len() == 1 {
            return Err(USAGE.to_string());
        }
        if stripped.contains('@') {
            return Err(USAGE.to_string());
        }
        return Ok((None, url_part.to_string(), kind));
    }
    let Some((nick, runtime)) = url_part.split_once('@') else {
        return Err(USAGE.to_string());
    };
    let nick = nick.trim();
    let runtime = runtime.trim();
    if nick.is_empty() || runtime.is_empty() {
        return Err(USAGE.to_string());
    }
    Ok((Some(nick.to_string()), format!("@{runtime}"), kind))
}

fn eval_local(
    path: &str,
    op: DotOp,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    let username = state
        .session
        .get_untracked()
        .map(|s| s.username)
        .unwrap_or_default();

    // ── Verb dispatch ─────────────────────────────────────────────────────
    if let DotOp::Meta(verb) = &op {
        if let Err(e) = dispatch_meta(path, verb, args, state, config, show_editor, on_eval) {
            state.push_error(e);
        }
        return;
    }

    // ── Generic CRUD ───────────────────────────────────────────────────
    match op {
        DotOp::Set(value) => handle_dot_set(path, value, &username, state, config),
        DotOp::Delete => handle_dot_delete(path, &username, state, config),
        DotOp::Get => handle_dot_get(path, args, state, config),
        DotOp::Meta(_) => unreachable!("handled above"),
    }
}

fn handle_dot_set(
    path: &str,
    value: String,
    username: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    let cfg = config.get_untracked();
    if let Err(e) = validate_dot_set(path, &value, &cfg) {
        state.push_error(e);
        return;
    }
    config.update(|c| c.set(path, &value));
    // Reactive: .my.ctx.* writes rebuild the prompt immediately.
    if path.starts_with(".my.ctx") {
        let cfg = config.get_untracked();
        apply_ctx_focus(&cfg, state);
    }
    let cfg = config.get_untracked();
    let uname = username.to_string();
    let state2 = state.clone();
    let path_owned = path.to_string();
    spawn_local(async move {
        if let Err(e) = persist_config(&uname, &cfg).await {
            state2.push_error(e);
            return;
        }
        apply_config_to_dom(&cfg);
        if path_owned == ".my.config.log.level" {
            crate::apply_log_level(&value);
        }
        if path_owned == ".my.i18n" {
            let first = value.split(':').next().unwrap_or(&value).to_string();
            if !crate::i18n::init(&first).await {
                state2.push_error(tf("err-lang-not-found", &[("lang", &first)]));
            }
            state2.lang.set(crate::i18n::lang());
            crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(value.clone()));
        }
        state2.push_system(tf("msg-set", &[("path", &path_owned), ("value", &value)]));
    });
}

fn validate_dot_set(path: &str, value: &str, cfg: &EgoConfig) -> Result<(), String> {
    if EgoConfig::is_read_only(path) {
        return Err(tf("msg-read-only", &[("path", path)]));
    }
    validate_alias_set(path, value)?;
    if cfg.has_children(path) {
        return Err(tf("msg-subtree-set", &[("path", path)]));
    }
    if cfg.has_leaf_ancestor(path) {
        return Err(tf("msg-ancestor-leaf", &[("path", path)]));
    }
    Ok(())
}

fn handle_dot_delete(path: &str, username: &str, state: &AppState, config: RwSignal<EgoConfig>) {
    if EgoConfig::is_read_only(path) {
        state.push_error(tf("msg-read-only", &[("path", path)]));
        return;
    }
    let removed = config.try_update(|c| c.delete_subtree(path)).unwrap_or(0);
    if removed == 0 {
        state.push_error(tf("msg-key-not-found", &[("path", path)]));
        return;
    }
    let cfg = config.get_untracked();
    let uname = username.to_string();
    let state2 = state.clone();
    let path_owned = path.to_string();
    spawn_local(async move {
        if let Err(e) = persist_config(&uname, &cfg).await {
            state2.push_error(e);
        } else {
            state2.push_system(tf(
                "msg-deleted",
                &[("path", &path_owned), ("count", &removed.to_string())],
            ));
        }
    });
}

fn handle_dot_get(path: &str, args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    let cfg = config.get_untracked();
    let filter = args.first().map(String::as_str);
    if let Some(list_path) = path.strip_suffix('.').filter(|path| !path.is_empty()) {
        if cfg.has_children(list_path) {
            show_full_listing(list_path, &cfg, state, filter);
        } else {
            state.push_error(tf("msg-key-not-found", &[("path", list_path)]));
        }
        return;
    }
    if cfg.is_leaf(path) {
        let value = cfg.get(path).unwrap_or("");
        state.push_output(format!("{path}: {value}"));
    } else if cfg.has_children(path) {
        show_children(path, &cfg, state, filter);
    } else {
        lazy_link_traverse(path, &cfg, state, config);
    }
}

fn show_children(
    path: &str,
    cfg: &crate::config::EgoConfig,
    state: &AppState,
    filter: Option<&str>,
) {
    let prefix = format!("{path}.");
    let prefix_len = prefix.len();
    let mut children: std::collections::BTreeSet<String> = std::collections::BTreeSet::new();
    for (k, _) in cfg.list(&prefix) {
        let tail = &k[prefix_len..];
        let immediate = tail.split('.').next().unwrap_or(tail);
        if filter.is_none_or(|filter| immediate.contains(filter)) {
            children.insert(immediate.to_string());
        }
    }
    state.push_output(format!("{path}:"));
    for child in &children {
        state.push_output(format!("  {child}"));
    }
}

fn show_full_listing(
    path: &str,
    cfg: &crate::config::EgoConfig,
    state: &AppState,
    filter: Option<&str>,
) {
    let prefix = format!("{path}.");
    let prefix_len = prefix.len();
    state.push_output(format!("{path}:"));
    for (key, value) in cfg.list(&prefix) {
        let tail = &key[prefix_len..];
        let immediate = tail.split('.').next().unwrap_or(tail);
        if filter.is_none_or(|filter| immediate.contains(filter)) {
            state.push_output(format!("  {tail}: {value}"));
        }
    }
}

/// Walk ancestor paths looking for a DID/CID link value; resolve and traverse
/// the remaining sub-path if found.
fn lazy_link_traverse(
    path: &str,
    cfg: &crate::config::EgoConfig,
    state: &AppState,
    _config: RwSignal<EgoConfig>,
) {
    if let Some((link, subpath)) = find_link_ancestor(path, cfg) {
        let state2 = state.clone();
        let cache = state.doc_cache;
        spawn_local(async move {
            resolve_and_traverse(&link, &subpath, &state2, cache).await;
        });
    } else {
        state.push_error(tf("msg-key-not-found", &[("path", path)]));
    }
}

/// Return (`link_value`, `sub_path`) for the nearest ancestor that holds a DID/CID link.
fn find_link_ancestor(path: &str, cfg: &crate::config::EgoConfig) -> Option<(String, String)> {
    let mut split_pos = path.len();
    while let Some(dot) = path[..split_pos].rfind('.') {
        split_pos = dot;
        let ancestor = &path[..split_pos];
        if ancestor.is_empty() {
            break;
        }
        if let Some(link_val) = cfg.get(ancestor) {
            if crate::mailbox::is_link_value(link_val) {
                return Some((link_val.to_string(), path[split_pos + 1..].to_string()));
            }
        }
        if split_pos == 0 {
            break;
        }
    }
    None
}

/// Build and apply a `FocusMode` prompt from the current `.my.ctx.*` config values.
///
/// Called after any write to `.my.ctx.*` and at login to restore the prompt.
pub(crate) fn apply_ctx_focus(cfg: &EgoConfig, state: &AppState) {
    let Some(runtime) = cfg.get(".my.ctx.runtime").filter(|s| !s.is_empty()) else {
        state.focus_actor.set(None);
        return;
    };
    state.focus_actor.set(Some(FocusMode {
        prompt: build_ctx_prompt(cfg, runtime),
    }));
}

fn build_ctx_prompt(cfg: &EgoConfig, runtime: &str) -> String {
    let nick = cfg
        .get(".my.ctx.nick")
        .or_else(|| cfg.get(".my.ctx.alias"))
        .unwrap_or_default();
    let target = cfg
        .get(".my.ctx.room")
        .filter(|room| !room.is_empty())
        .unwrap_or(runtime);
    let base = cfg
        .alias_display(target)
        .unwrap_or_else(|| format!("@{target}"));
    if nick.is_empty() {
        base
    } else {
        format!("{nick}{base}")
    }
}

#[cfg(test)]
mod tests {
    use super::{
        apply_ctx_focus, build_enter_ctx, configured_inventory, did_enter_args, enter_ctx_kind,
        enter_no_args, enter_target_display, handle_dot_get, parse_enter_target,
        validate_alias_set,
    };
    use crate::{config::EgoConfig, core::Entry, state::AppState};
    use leptos::prelude::{GetUntracked, RwSignal, Set};
    use ma_zscheme::value::SchemeVal;

    #[test]
    fn validate_alias_set_accepts_did_url() {
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example#room").is_ok());
    }

    #[test]
    fn validate_alias_set_rejects_malformed_did_url() {
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example#").is_err());
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example#room#other").is_err());
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example#bad fragment").is_err());
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example#bad.fragment").is_err());
        assert!(validate_alias_set(".my.aliases.home", "did:ma:k51example/path").is_err());
    }

    #[test]
    fn subtree_listing_filters_names_and_trailing_dot_shows_values() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.alice", "did:ma:alice");
        cfg.set(".my.aliases.alice-smith", "did:ma:alice-smith");
        cfg.set(".my.aliases.sky", "did:ma:sky");
        let config = RwSignal::new(cfg);
        let state = AppState::new();

        handle_dot_get(".my.aliases", &["alice".to_string()], &state, config);
        let names: Vec<String> = state
            .entries
            .get_untracked()
            .into_iter()
            .filter_map(|entry| match entry {
                Entry::System(record) => Some(record.text),
                _ => None,
            })
            .collect();
        assert_eq!(names, [".my.aliases:", "  alice", "  alice-smith"]);

        state.entries.set(Vec::new());
        handle_dot_get(".my.aliases.", &["alice".to_string()], &state, config);
        let values: Vec<String> = state
            .entries
            .get_untracked()
            .into_iter()
            .filter_map(|entry| match entry {
                Entry::System(record) => Some(record.text),
                _ => None,
            })
            .collect();
        assert_eq!(
            values,
            [
                ".my.aliases:",
                "  alice: did:ma:alice",
                "  alice-smith: did:ma:alice-smith"
            ]
        );
    }

    #[test]
    fn parse_enter_target_accepts_nick_at_alias() {
        assert_eq!(
            parse_enter_target("Armageddon@sky"),
            Ok((Some("Armageddon".to_string()), "@sky".to_string(), None))
        );
    }

    #[test]
    fn parse_enter_target_accepts_explicit_at_alias_and_did_forms() {
        assert_eq!(
            parse_enter_target("@sky"),
            Ok((None, "@sky".to_string(), None))
        );
        assert_eq!(
            parse_enter_target("@sky#room"),
            Ok((None, "@sky#room".to_string(), None))
        );
        assert_eq!(
            parse_enter_target("@did:ma:k51example"),
            Ok((None, "@did:ma:k51example".to_string(), None))
        );
    }

    #[test]
    fn parse_enter_target_rejects_unprefixed_runtime_forms() {
        assert!(parse_enter_target("sky").is_err());
        assert!(parse_enter_target("did:ma:k51example").is_err());
    }

    #[test]
    fn parse_enter_target_rejects_at_prefixed_nick_form() {
        assert!(parse_enter_target("@Armageddon@sky").is_err());
    }

    #[test]
    fn parse_enter_target_accepts_nick_at_did() {
        assert_eq!(
            parse_enter_target("Armageddon@did:ma:k51example"),
            Ok((
                Some("Armageddon".to_string()),
                "@did:ma:k51example".to_string(),
                None
            ))
        );
        assert_eq!(
            parse_enter_target("Armageddon@did:ma:k51example#room"),
            Ok((
                Some("Armageddon".to_string()),
                "@did:ma:k51example#room".to_string(),
                None
            ))
        );
    }

    #[test]
    fn parse_enter_target_extracts_kind_query_param() {
        assert_eq!(
            parse_enter_target("@sky#room?kind=avatar"),
            Ok((None, "@sky#room".to_string(), Some("avatar".to_string())))
        );
        assert_eq!(
            parse_enter_target("Nick@sky#room?kind=agent"),
            Ok((
                Some("Nick".to_string()),
                "@sky#room".to_string(),
                Some("agent".to_string())
            ))
        );
        assert_eq!(
            parse_enter_target("@sky?kind=wizard"),
            Ok((None, "@sky".to_string(), Some("wizard".to_string())))
        );
        // No kind param → None
        assert_eq!(
            parse_enter_target("@sky#room"),
            Ok((None, "@sky#room".to_string(), None))
        );
    }

    #[test]
    fn enter_ctx_kind_reifies_session_vs_direct_entry() {
        assert_eq!(enter_ctx_kind(None), Ok(None));
        assert_eq!(enter_ctx_kind(Some("avatar")), Ok(None));
        assert_eq!(enter_ctx_kind(Some("agent")), Ok(Some("agent")));
        assert_eq!(enter_ctx_kind(Some("thing")), Ok(Some("thing")));
        assert!(enter_ctx_kind(Some("wizard")).is_err());
    }

    #[test]
    fn build_enter_ctx_requires_direct_entry_kind() {
        let state = AppState::new();
        let cfg = EgoConfig::default();
        let SchemeVal::Map(thing_ctx) = build_enter_ctx(&state, Some("stone"), "thing", &cfg)
        else {
            panic!("expected ctx map");
        };
        assert!(matches!(
            thing_ctx.get("kind"),
            Some(SchemeVal::Str(kind)) if kind == "thing"
        ));
    }

    #[test]
    fn enter_target_display_uses_alias_without_changing_target() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.ma", "did:ma:k51runtime");

        assert_eq!(
            enter_target_display("did:ma:k51runtime#construct", Some("Pondus"), &cfg),
            "Pondus@ma#construct"
        );
    }

    #[test]
    fn did_enter_args_carry_inventory_without_requiring_nick() {
        let inventory = "did:ma:k51source#inventory";

        assert_eq!(did_enter_args(None, Some(inventory)), vec!["", inventory]);
    }

    #[test]
    fn configured_inventory_requires_full_did_url() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.ctx.inv", "did:ma:k51source#inventory");
        assert_eq!(
            configured_inventory(&cfg),
            Some("did:ma:k51source#inventory")
        );

        cfg.set(".my.ctx.inv", "#inventory");
        assert_eq!(configured_inventory(&cfg), None);
    }

    #[test]
    fn focus_prompt_prefixes_unaliased_runtime_did() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.nick", "avatar");
        let state = AppState::new();

        apply_ctx_focus(&cfg, &state);

        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "avatar@did:ma:k51runtime"
        );
    }

    #[test]
    fn focus_prompt_keeps_aliased_runtime_display() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.nick", "avatar");
        cfg.set(".my.aliases.ma", "did:ma:k51runtime");
        let state = AppState::new();

        apply_ctx_focus(&cfg, &state);

        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "avatar@ma"
        );
    }

    #[test]
    fn focus_prompt_updates_when_room_changes() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.nick", "avatar");
        cfg.set(".my.aliases.ma", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51runtime#garden");
        let state = AppState::new();

        apply_ctx_focus(&cfg, &state);
        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "avatar@ma#garden"
        );

        cfg.set(".my.ctx.room", "did:ma:k51runtime#house");
        apply_ctx_focus(&cfg, &state);
        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "avatar@ma#house"
        );
    }

    #[test]
    fn enter_without_args_with_saved_ctx_restores_prompt() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.nick", "avatar");
        let config = RwSignal::new(cfg);
        let state = AppState::new();

        enter_no_args(&state, config);

        assert_eq!(
            state.focus_actor.get_untracked().unwrap().prompt,
            "avatar@did:ma:k51runtime"
        );
    }

    #[test]
    fn enter_without_args_without_saved_ctx_shows_error() {
        let config = RwSignal::new(EgoConfig::default());
        let state = AppState::new();

        enter_no_args(&state, config);

        let entries = state.entries.get_untracked();
        let Entry::System(entry) = entries.last().unwrap() else {
            panic!("expected system error entry");
        };
        assert!(entry.text.contains(".my.config.ctx"));
        assert!(state.focus_actor.get_untracked().is_none());
    }

    #[test]
    fn enter_without_args_without_saved_ctx_is_silent() {
        let config = RwSignal::new(EgoConfig::default());
        let state = AppState::new();

        enter_no_args(&state, config);

        assert!(state.focus_actor.get_untracked().is_none());
    }
}
