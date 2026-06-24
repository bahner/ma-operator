//! Command evaluators: dot-path CRUD, actor messages, alias validation,
//! config-to-DOM application, and lazy DID/CID link traversal.

mod actor;
pub(crate) mod actor_send {
    pub(crate) use super::actor::execute_outbox_task;
}
mod profile;
mod topic;

use leptos::prelude::*;

use ma_core::DidDocumentResolver;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    http::fetch_cid_text,
    i18n::{t, tf},
    parser::command::{Command, DotOp},
    parser::verbs::dispatch_verb,
    state::{AppState, FocusMode},
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
        "--colour-text:{};--colour-dimmed:{};--colour-pending:{};--colour-replied:{};--colour-alias:{};--colour-error:{};--colour-system:{};--colour-bg:{};--colour-input-bg:{};--colour-border:{};--colour-cursor:{};--colour-highlight:{};",
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
                // Bare CID — fetch from local gateway.
                match fetch_cid_text(link).await {
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
    for key in subpath.split('.') {
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
    state.push_output(format!("{link}.{subpath}: {display}"));
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
        Command::PlainText(_) => {}

        Command::DotCommand { path, op, args } => {
            eval_dot(&path, op, &args, state, config, show_editor, on_eval);
        }

        Command::ActorMessage { target, verb, body } => {
            actor::eval_actor(target, verb, body, raw, state, config);
        }

        Command::TopicMessage { topic, verb, body } => {
            topic::eval_topic(topic, verb, body, state, config);
        }

        Command::TopicEmote { body } => {
            topic::eval_topic_emote(body, state, config);
        }
    }
}

fn eval_dot(
    path: &str,
    op: DotOp,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    let session = state.session.get_untracked();
    let username = session.map(|s| s.username).unwrap_or_default();

    // ── .help / .help.* ──────────────────────────────────────────────────
    if path == ".help" || path.starts_with(".help.") {
        let subtopic = path.strip_prefix(".help.").unwrap_or("");
        for line in crate::help::dispatch(subtopic) {
            state.push_system(line);
        }
        return;
    }

    // ── Control commands (not config access) ─────────────────────────────
    match path {
        ".logout" => {
            transport::disconnect();
            state.session.set(None);
            return;
        }
        ".clear" => {
            state.entries.set(vec![]);
            return;
        }
        ".panic" => {
            state.screensaver.set(true);
            return;
        }
        ".history" => {
            let hist = state.history.get_untracked();
            // uniq-style filter: suppress consecutive identical entries.
            let mut n = 0usize;
            let mut last: Option<&str> = None;
            for entry in &hist {
                if last != Some(entry.as_str()) {
                    n += 1;
                    state.push_system(format!("{n:>4}  {entry}"));
                    last = Some(entry.as_str());
                }
            }
            return;
        }
        ".ma" => {
            state.push_output("間");
            return;
        }
        ".use" => {
            eval_use(args, state, config);
            return;
        }
        // Shorthand: `.edit [cid]` → `.my.doc.scratch:edit [cid]`
        ".edit" => {
            if let Err(e) = dispatch_verb(
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
            return;
        }
        // Shorthand: `.batch:end` → `.my.doc.scratch:eval`  (parallel, fire-and-forget)
        ".batch:end" => {
            if let Err(e) = dispatch_verb(
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
            return;
        }
        _ => {}
    }

    // ── Verb dispatch ────────────────────────────────────────────────────
    if let DotOp::Verb(verb) = &op {
        if let Err(e) = dispatch_verb(path, verb, args, state, config, show_editor, on_eval) {
            state.push_error(e);
        }
        return;
    }

    // ── Generic CRUD on the dot tree ─────────────────────────────────────
    match op {
        DotOp::Set(value) => {
            // ── .profiles.<name>: <cid> — fetch+decrypt+merge from CID ──
            if let Some(profile_name) = path.strip_prefix(".profiles.") {
                if profile_name.contains('.') {
                    state.push_error(t("profile-wrong-user"));
                    return;
                }
                if profile_name != username.as_str() {
                    state.push_error(tf("profile-wrong-user-name", &[("name", profile_name)]));
                    return;
                }
                profile::handle_profile_set(
                    path.to_string(),
                    value,
                    username,
                    config,
                    state.clone(),
                );
                return;
            }
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
            config.update(|c| c.set(path, &value));
            let cfg = config.get_untracked();
            let uname = username.clone();
            let state2 = state.clone();
            let path_owned = path.to_string();
            spawn_local(async move {
                if let Err(e) = persist_config(&uname, &cfg).await {
                    state2.push_error(e);
                } else {
                    apply_config_to_dom(&cfg);
                    if path_owned == ".config.log.level" {
                        crate::apply_log_level(&value);
                    }
                    if path_owned == ".my.config.ui.language" {
                        let _ = crate::i18n::init(&value).await;
                        state2.lang.set(crate::i18n::lang());
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
                }
            });
        }

        DotOp::Delete => {
            if EgoConfig::is_read_only(path) {
                state.push_error(tf("msg-read-only", &[("path", path)]));
                return;
            }

            // ── .my.topics.<alias>: — delete alias + unsubscribe ─────────
            if let Some(alias) = path.strip_prefix(".my.topics.") {
                if !alias.is_empty() && !alias.contains('.') {
                    crate::parser::verbs::topics::handle_topics_delete(alias, state, config);
                    return;
                }
            }

            // ── .profiles.<name>: — delete a named profile ─────────────
            if let Some(target_name) = path.strip_prefix(".profiles.") {
                if target_name.is_empty() || target_name.contains('.') {
                    state.push_error(tf("profiles-not-found", &[("name", target_name)]));
                    return;
                }
                profile::handle_profile_delete(target_name.to_string(), username, state.clone());
                return;
            }

            // ── .profiles: — ambiguous bare delete, require explicit name ─
            if path == ".profiles" {
                state.push_error(t("profile-delete-needs-name"));
                return;
            }

            let removed = config.try_update(|c| c.delete_subtree(path)).unwrap_or(0);
            if removed == 0 {
                state.push_error(tf("msg-key-not-found", &[("path", path)]));
                return;
            }
            let cfg = config.get_untracked();
            let uname = username.clone();
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

        DotOp::Get => {
            // ── .profiles — virtual: list all IndexedDB profiles ────────
            if path == ".profiles" {
                profile::handle_profile_list(config, state.clone());
                return;
            }
            // ── .profiles.<name> — show CID if stored ───────────────────
            if let Some(profile_name) = path.strip_prefix(".profiles.") {
                if !profile_name.is_empty() && !profile_name.contains('.') {
                    profile::handle_profile_get(
                        profile_name.to_string(),
                        path.to_string(),
                        config,
                        state.clone(),
                    );
                    return;
                }
            }
            // ── .my.topics — list all defined topic aliases ──────────────
            if path == ".my.topics" {
                crate::parser::verbs::topics::handle_topics(path, "status", &[], state, config)
                    .unwrap_or_default();
                return;
            }
            // ── .my.topics.<alias> — show blake3 hash + status ───────────
            if let Some(alias) = path.strip_prefix(".my.topics.") {
                if !alias.is_empty() && !alias.contains('.') {
                    crate::parser::verbs::topics::handle_topics(path, "status", &[], state, config)
                        .unwrap_or_default();
                    return;
                }
            }

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
                let prefix = format!("{path}.");
                let prefix_len = prefix.len();
                // Collect immediate child names (deduplicated, sorted).
                let mut children: std::collections::BTreeSet<String> =
                    std::collections::BTreeSet::new();
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
                        // Immediate leaf — show `name: value`.
                        if let Some(q) = &query {
                            if v != q.as_str() {
                                continue;
                            }
                        }
                        state.push_output(format!("  {child}: {v}"));
                        shown += 1;
                    } else {
                        // Sub-subtree — show relative child name, skip when value-querying.
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
            } else {
                // ── Lazy link traversal ───────────────────────────────────
                // Check if any ancestor leaf holds a DID or CID link value.
                // If so, resolve it and traverse the remaining sub-path.
                let path_owned = path.to_string();
                let mut found_link = false;
                let mut split_pos = path_owned.len();
                while let Some(dot) = path_owned[..split_pos].rfind('.') {
                    split_pos = dot;
                    let ancestor = &path_owned[..split_pos];
                    if let Some(link_val) = cfg.get(ancestor) {
                        if crate::mailbox::is_link_value(link_val) {
                            let link = link_val.to_string();
                            let subpath = path_owned[split_pos + 1..].to_string();
                            let state2 = state.clone();
                            let cache = state.doc_cache;
                            spawn_local(async move {
                                resolve_and_traverse(&link, &subpath, &state2, cache).await;
                            });
                            found_link = true;
                            break;
                        }
                    }
                    if split_pos == 0 {
                        break;
                    }
                }
                if !found_link {
                    state.push_error(tf("msg-key-not-found", &[("path", path)]));
                }
            }
        }

        DotOp::Verb(_) => unreachable!("handled above"),
    }
}

fn eval_use(args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    if args.is_empty() {
        state.focus_actor.set(None);
        state.push_system(t("msg-focus-cleared"));
        return;
    }

    // .use #topic — topic focus mode
    if args[0].starts_with('#') {
        let alias = args[0].clone();
        state.focus_actor.set(Some(FocusMode {
            target: alias.clone(),
            prompt: format!("{alias}> "),
        }));
        state.push_system(tf(
            "msg-focusing",
            &[("did", &alias), ("prompt", &format!("{alias}> "))],
        ));
        return;
    }

    let target = args[0].trim_start_matches('@').to_string();
    let cfg = config.get_untracked();
    let resolved = if target.starts_with("did:") {
        target.clone()
    } else {
        match cfg.resolve_alias(&target) {
            Some(did) => did.to_string(),
            None => {
                state.push_error(tf("err-unknown-alias", &[("name", &target)]));
                return;
            }
        }
    };

    let prompt = if args.len() >= 3 && args[1] == "as" {
        let alias = args[2].trim().to_string();
        if alias.starts_with('@') {
            alias
        } else {
            format!("@{alias}")
        }
    } else if args[0].starts_with('@') {
        args[0].clone()
    } else {
        format!("@{target}")
    };

    state.focus_actor.set(Some(FocusMode {
        target: resolved.clone(),
        prompt: prompt.clone(),
    }));
    state.push_system(tf(
        "msg-focusing",
        &[("did", &resolved), ("prompt", &prompt)],
    ));
}
