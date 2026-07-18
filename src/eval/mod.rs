//! Command evaluators: local/remote path CRUD, actor messages, alias
//! validation, config-to-DOM application, and lazy DID/CID link traversal.

pub(crate) mod actor;
pub(crate) mod actor_send {
    pub(crate) use super::actor::execute_outbox_task;
}

use leptos::prelude::*;

use ma_core::DidDocumentResolver;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    core::CommandStatus,
    i18n::{t, tf},
    parser::command::{Command, DotOp},
    parser::verbs::dispatch_meta,
    state::{AppState, AwaitingReply, FocusMode},
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
    if value.contains('#') {
        return Err(t("err-alias-value-fragment"));
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
    let doc = match cached {
        Some(v) => v,
        None => {
            let val: Result<serde_json::Value, String> = if link.starts_with("did:ma:") {
                // Use the session resolver — it owns the gateway URL, has a
                // positive cache, and falls back to public gateways automatically.
                let Some(resolver) = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone())
                else {
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
                    Ok(t) => {
                        serde_json::from_str::<serde_json::Value>(&t).map_err(|e| e.to_string())
                    }
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
        }
    };

    // Traverse subpath keys into the JSON document.
    let mut cur = &doc;
    for key in subpath.split(['/', '.']) {
        match cur.get(key) {
            Some(v) => cur = v,
            None => {
                state.push_error(tf("msg-link-key-not-found", &[("key", key)]));
                return;
            }
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

        Command::ActorMessage { target, verb, body } => {
            actor::eval_actor(target, verb, body, raw, state, config);
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
    _op: DotOp,
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
            state.session.set(None);
        }
        ".clear" => {
            state.entries.set(vec![]);
        }
        ".panic" => {
            state.screensaver.set(true);
        }
        ".ma" => {
            if let Err(e) =
                dispatch_meta(".ma", "connect", args, state, config, show_editor, on_eval)
            {
                state.push_error(e);
            }
        }
        ".history" => {
            let hist = state.history.get_untracked();
            let mut n = 0usize;
            let mut last: Option<&str> = None;
            for entry in &hist {
                if last != Some(entry.as_str()) {
                    n += 1;
                    state.push_system(format!("{n:>4}  {entry}"));
                    last = Some(entry.as_str());
                }
            }
        }
        ".enter" => {
            eval_enter(args, state, config);
        }
        ".leave" => {
            eval_leave(args, state, config);
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
        state.push_error("usage: .enter [nick]@runtime[#room]".to_string());
        return;
    };
    let cfg = config.get_untracked();
    let (requested_nick, actor_input) = match parse_enter_target(raw) {
        Ok(parsed) => parsed,
        Err(e) => {
            state.push_error(e);
            return;
        }
    };
    let resolved = match crate::parser::command::parse(&actor_input, &cfg) {
        Ok(crate::parser::command::Command::ActorMessage { target, .. }) => target,
        Ok(_) => {
            state.push_error(format!("not an actor address: {raw}"));
            return;
        }
        Err(e) => {
            state.push_error(e);
            return;
        }
    };
    if resolved.ends_with('#') {
        state.push_error("usage: .enter [nick]@runtime[#room]".to_string());
        return;
    }
    let target_actor = resolved.clone();

    let state2 = state.clone();
    let entered = raw.clone();
    spawn_local(async move {
        let cmd_id = state2.push_command(format!(".enter {entered}"));
        let (entry_runtime, room_actor) = target_actor
            .split_once('#')
            .map(|(runtime, _)| (runtime.to_string(), Some(target_actor.clone())))
            .unwrap_or_else(|| (target_actor.clone(), None));
        let entry_runtime = entry_runtime.to_string();
        let root = resolve_enter_root(&entry_runtime)
            .await
            .unwrap_or_else(|_| format!("{entry_runtime}#root"));
        let enter_args = match (room_actor.as_deref(), requested_nick.as_deref()) {
            (Some(room), Some(nick)) => vec![room, nick],
            (Some(room), None) => vec![room],
            (None, Some(nick)) => vec!["", nick],
            (None, None) => Vec::new(),
        };
        match transport::send_rpc(&root, "enter", &enter_args).await {
            Ok(_) => state2.resolve_command_by_id(cmd_id, CommandStatus::Done),
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("msg-send-failed", &[("e", &e)]));
                return;
            }
        }
    });
}

fn parse_enter_target(raw: &str) -> Result<(Option<String>, String), String> {
    if raw.starts_with('@') {
        if raw.len() == 1 {
            return Err("usage: .enter [nick]@runtime[#room]".to_string());
        }
        if raw[1..].contains('@') {
            return Err("usage: .enter [nick]@runtime[#room]".to_string());
        }
        return Ok((None, raw.to_string()));
    }
    let Some((nick, runtime)) = raw.split_once('@') else {
        return Err("usage: .enter [nick]@runtime[#room]".to_string());
    };
    let nick = nick.trim();
    let runtime = runtime.trim();
    if nick.is_empty() || runtime.is_empty() {
        return Err("usage: .enter [nick]@runtime[#room]".to_string());
    }
    let actor_input = format!("@{runtime}");
    if nick.is_empty() {
        Ok((None, actor_input))
    } else {
        Ok((Some(nick.to_string()), actor_input))
    }
}

#[cfg(test)]
mod tests {
    use super::parse_enter_target;

    #[test]
    fn parse_enter_target_accepts_nick_at_alias() {
        assert_eq!(
            parse_enter_target("Armageddon@sky"),
            Ok((Some("Armageddon".to_string()), "@sky".to_string()))
        );
    }

    #[test]
    fn parse_enter_target_accepts_explicit_at_alias_and_did_forms() {
        assert_eq!(parse_enter_target("@sky"), Ok((None, "@sky".to_string())));
        assert_eq!(
            parse_enter_target("@sky#room"),
            Ok((None, "@sky#room".to_string()))
        );
        assert_eq!(
            parse_enter_target("@did:ma:k51example"),
            Ok((None, "@did:ma:k51example".to_string()))
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
                "@did:ma:k51example".to_string()
            ))
        );
        assert_eq!(
            parse_enter_target("Armageddon@did:ma:k51example#room"),
            Ok((
                Some("Armageddon".to_string()),
                "@did:ma:k51example#room".to_string()
            ))
        );
    }
}

fn eval_leave(args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    if !args.is_empty() {
        state.push_error("usage: .leave".to_string());
        return;
    }
    clear_focus(state, config);
}

fn clear_focus(state: &AppState, config: RwSignal<EgoConfig>) {
    config.update(|c| c.set(".my.ctx.use", "false"));
    state.focus_actor.set(None);
    state.push_system(t("msg-focus-cleared"));
}

async fn resolve_enter_root(runtime: &str) -> Result<String, String> {
    let msg_id = transport::send_crud_get(runtime, "/config/root").await?;
    let rx = AwaitingReply::register(msg_id);
    let raw = rx
        .await
        .map_err(|_| "root discovery reply was cancelled".to_string())?;
    parse_config_root(&raw)
        .ok_or_else(|| "runtime /config/root is not a full actor DID-URL".to_string())
}

fn parse_config_root(raw: &str) -> Option<String> {
    let trimmed = raw.trim();
    let actor = serde_yaml::from_str::<String>(trimmed).unwrap_or_else(|_| trimmed.to_string());
    let actor = actor.trim().to_string();
    if actor.starts_with("did:ma:") && actor.contains('#') {
        Some(actor)
    } else {
        None
    }
}

/// Roots that are read-only remote fetches rather than local config.
pub(crate) fn is_remote_fetch_root(path: &str) -> bool {
    path.starts_with("/ipfs/") || path.starts_with("/ipns/") || path.starts_with("/ipld/")
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

    // ── /ipfs, /ipns, /ipld — read-only remote fetch ───────────────────────
    if is_remote_fetch_root(path) {
        match op {
            DotOp::Get => {
                let path_owned = path.to_string();
                // Push a pending Command entry (Sent) so `dispatch_eval_line`
                // sees a new entry and treats this as pending — this is what
                // lets a `.batch:sync` step wait for the fetch to finish
                // instead of advancing before it resolves.
                let cmd_id = state.push_command(path_owned.clone());
                let state2 = state.clone();
                spawn_local(async move {
                    match crate::http::fetch_path_text(&path_owned).await {
                        Ok(content) => {
                            state2.push_output(format!("{path_owned}: {content}"));
                            state2.resolve_command_by_id(cmd_id, CommandStatus::Done);
                        }
                        Err(e) => {
                            state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                            state2.push_error(e);
                        }
                    }
                });
            }
            _ => state.push_error(tf("err-read-only-path", &[("path", path)])),
        }
        return;
    }

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
    if EgoConfig::is_read_only(path) {
        state.push_error(tf("msg-read-only", &[("path", path)]));
        return;
    }
    if let Err(e) = validate_alias_set(path, &value) {
        state.push_error(e);
        return;
    }
    let (has_children, has_ancestor) = {
        let cfg = config.get_untracked();
        (cfg.has_children(path), cfg.has_leaf_ancestor(path))
    };
    if has_children {
        state.push_error(tf("msg-subtree-set", &[("path", path)]));
        return;
    }
    if has_ancestor {
        state.push_error(tf("msg-ancestor-leaf", &[("path", path)]));
        return;
    }
    // ── /ipfs, /ipns explicit fetch ─────────────────────────────────────────
    // `.my.path: /ipfs/bafy…` — fetch the content and store it as the value.
    // Plain text values (including bare `did:ma:…` aliases) are stored
    // literally; only an explicit `/ipfs`, `/ipns`, `/ipld` prefix triggers
    // a fetch.
    if is_remote_fetch_root(&value) {
        let path_owned = path.to_string();
        let uname = username.to_string();
        let state2 = state.clone();
        spawn_local(async move {
            match crate::http::fetch_path_text(&value).await {
                Ok(content) => {
                    config.update(|c| c.set(&path_owned, &content));
                    let cfg = config.get_untracked();
                    if let Err(e) = persist_config(&uname, &cfg).await {
                        state2.push_error(e);
                        return;
                    }
                    apply_config_to_dom(&cfg);
                    state2
                        .push_system(tf("msg-set", &[("path", &path_owned), ("value", &content)]));
                }
                Err(e) => state2.push_error(e),
            }
        });
        return;
    }
    config.update(|c| c.set(path, &value));
    // Reactive: .my.ctx.use: true/false drives focus_actor immediately.
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
    // ── Config tree read ──────────────────────────────────────────────────
    let cfg = config.get_untracked();
    let query = if args.is_empty() {
        None
    } else {
        Some(args.join(" "))
    };

    if cfg.is_leaf(path) {
        let value = cfg.get(path).unwrap_or("");
        match &query {
            None => state.push_output(format!("{path}: {value}")),
            Some(q) if value == q.as_str() => state.push_output(format!("{path}: {value}")),
            Some(_) => state.push_error(t("msg-no-match")),
        }
    } else if cfg.has_children(path) {
        show_children(path, &query, &cfg, state);
    } else {
        lazy_link_traverse(path, &cfg, state, config);
    }
}

/// List immediate children of `path`, optionally filtered by `query`.
fn show_children(
    path: &str,
    query: &Option<String>,
    cfg: &crate::config::EgoConfig,
    state: &AppState,
) {
    let prefix = format!("{path}.");
    let prefix_len = prefix.len();
    let mut children: std::collections::BTreeSet<String> = std::collections::BTreeSet::new();
    for (k, _) in cfg.list(&prefix) {
        let tail = &k[prefix_len..];
        let immediate = tail.split('.').next().unwrap_or(tail);
        children.insert(immediate.to_string());
    }
    state.push_output(format!("{path}:"));
    let mut shown = 0usize;
    for child in &children {
        let child_path = format!("{path}.{child}");
        if let Some(v) = cfg.get(&child_path) {
            if let Some(q) = query {
                if v != q.as_str() {
                    continue;
                }
            }
            state.push_output(format!("  {child}: {v}"));
            shown += 1;
        } else {
            if query.is_some() {
                continue;
            }
            state.push_output(format!("  {child}"));
            shown += 1;
        }
    }
    if shown == 0 && query.is_some() {
        state.push_error(t("msg-no-match"));
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
    let path_owned = path.to_string();
    let mut split_pos = path_owned.len();
    while let Some(dot) = path_owned[..split_pos].rfind('.') {
        split_pos = dot;
        let ancestor = &path_owned[..split_pos];
        if ancestor.is_empty() {
            break;
        }
        if let Some(link_val) = cfg.get(ancestor) {
            if crate::mailbox::is_link_value(link_val) {
                let link = link_val.to_string();
                let subpath = path_owned[split_pos + 1..].to_string();
                let state2 = state.clone();
                let cache = state.doc_cache;
                spawn_local(async move {
                    resolve_and_traverse(&link, &subpath, &state2, cache).await;
                });
                return;
            }
        }
        if split_pos == 0 {
            break;
        }
    }
    state.push_error(tf("msg-key-not-found", &[("path", path)]));
}

/// Build and apply a `FocusMode` from the current `.my.ctx.*` config values.
///
/// Called after any write to `.my.ctx.*` and at login to restore focus.
/// If `.my.ctx.use` is not `"true"` or `.my.ctx.runtime` is absent,
/// `focus_actor` is cleared.
pub(crate) fn apply_ctx_focus(cfg: &EgoConfig, state: &AppState) {
    let enabled = cfg.get(".my.ctx.use").map(|s| s == "true").unwrap_or(false);
    if !enabled {
        state.focus_actor.set(None);
        return;
    }
    let Some(runtime) = cfg.get(".my.ctx.runtime").map(|s| s.to_string()) else {
        state.focus_actor.set(None);
        return;
    };
    let room = cfg.get(".my.ctx.room").unwrap_or("").to_string();
    let avatar = cfg
        .get(".my.ctx.nick")
        .or_else(|| cfg.get(".my.ctx.alias"))
        .unwrap_or("")
        .to_string();
    let target = if room.is_empty() {
        runtime.clone()
    } else {
        format!("{runtime}{room}") // room already carries '#' prefix
    };
    let base_prompt = if let Some(alias) = cfg.reverse_alias(&runtime) {
        format!("@{alias}")
    } else {
        runtime.clone()
    };
    let prompt = if avatar.is_empty() {
        base_prompt
    } else {
        format!("{avatar}{base_prompt}")
    };
    state.focus_actor.set(Some(FocusMode {
        runtime,
        room: if room.is_empty() { None } else { Some(room) },
        target,
        root_actor: cfg.get(".my.ctx.root").map(|s| s.to_string()),
        avatar_actor: cfg.get(".my.ctx.avatar").map(|s| s.to_string()),
        prompt,
    }));
}
