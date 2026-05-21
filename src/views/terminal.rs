/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use ma_core::DidDocumentResolver;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    core::{CommandStatus, Entry, SystemKind},
    i18n::{t, tf},
    identity::storage::{load_history, save_history},
    parser::command::{parse, Command, DotOp},
    parser::verbs::dispatch_verb,
    state::{AppState, FocusMode},
    transport,
    views::editor::{EditorContext, EditorModal},
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

#[component]
pub fn Terminal() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Per-session reactive config
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());

    // Editor modal signal — Some(EditorContext) opens the overlay
    let show_editor: RwSignal<Option<EditorContext>> = RwSignal::new(None);

    // When .config.editor.persistent is "true", keep the editor panel open
    // at all times using a scratch document.
    {
        let config = config.clone();
        Effect::new(move |_| {
            let is_persistent = config
                .get()
                .get(".config.editor.persistent")
                .unwrap_or("false")
                == "true";
            if is_persistent && show_editor.get().is_none() {
                let cfg = config.get_untracked();
                let initial = cfg
                    .get(".my.documents.scratch.content")
                    .unwrap_or_default()
                    .to_string();
                show_editor.set(Some(EditorContext::new(".my.documents.scratch", initial)));
            }
        });
    }

    // Load config from IndexedDB on mount
    {
        let state2 = state.clone();
        let config = config.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let username = sess.username.clone();
            let sender_did = sess.sender_did.clone();
            spawn_local(async move {
                match restore_config(&username).await {
                    Ok(mut cfg) => {
                        // Read-only session-derived field; never persisted
                        // intentionally, but harmless if it leaks: it is
                        // re-injected on every login.
                        cfg.set(".my.identity.did", sender_did);
                        // Prune inbox entries that expired since last session.
                        let now = js_sys::Date::now() / 1000.0;
                        let pruned = crate::mailbox::prune_inbox_expired(&mut cfg, now);
                        apply_config_to_dom(&cfg);
                        if pruned > 0 {
                            if let Err(e) = persist_config(&username, &cfg).await {
                                state2.push_error(format!("inbox prune persist: {e}"));
                            }
                        }
                        config.set(cfg);
                    }
                    Err(e) => state2.push_error(format!("config load error: {e}")),
                }
                // Re-apply language preference from config if set.
                if let Some(lang) = config.get_untracked().get(".my.lang").map(|s| s.to_string()) {
                    let first = lang.split(':').next().unwrap_or(&lang).to_string();
                    crate::i18n::init(&first);
                    crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(lang));
                } else if let Some(lang) = config.get_untracked().get(".config.ui.language").map(|s| s.to_string()) {
                    crate::i18n::init(&lang);
                }
                state2.push_system(tf(
                    "msg-logged-in",
                    &[
                        ("version", env!("CARGO_PKG_VERSION")),
                        ("username", &username),
                    ],
                ));
                state2.push_system(t("msg-type-help"));
            });
        }
    }

    // Restore command history from IndexedDB
    {
        let state2 = state.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let username = sess.username.clone();
            spawn_local(async move {
                match load_history(&username).await {
                    Ok(Some(json)) => match serde_json::from_str::<Vec<String>>(&json) {
                        Ok(hist) => state2.history.set(hist),
                        Err(e) => state2.push_error(format!("history parse error: {e}")),
                    },
                    Ok(None) => {}
                    Err(e) => state2.push_error(format!("history load error: {e}")),
                }
            });
        }
    }

    // Start iroh endpoint
    {
        let state2 = state.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let iroh_key = sess.iroh_key;
            let ipns_secret_key = sess.ipns_secret_key;
            let did_signing_key = sess.did_signing_key;
            let did_encryption_key = sess.did_encryption_key;
            let sender_did = sess.sender_did.clone();
            let created_at = sess.created_at.clone();
            let username = sess.username.clone();
            spawn_local(async move {
                state2.push_system(t("msg-connecting"));
                match transport::connect(
                    iroh_key,
                    ipns_secret_key,
                    did_signing_key,
                    did_encryption_key,
                    sender_did,
                    created_at,
                )
                .await
                {
                    Ok(()) => state2.push_system(t("msg-iroh-ready")),
                    Err(e) => state2.push_error(tf("msg-iroh-failed", &[("e", &e)])),
                }
                let _ = username;
            });
        }
    }

    // Inbox polling loop
    {
        let state2 = state.clone();
        spawn_local(async move {
            loop {
                gloo_timers::future::TimeoutFuture::new(500).await;
                if !transport::is_connected() {
                    continue;
                }
                for incoming in transport::drain_inbox()
                    .into_iter()
                    .chain(transport::drain_rpc_inbox())
                {
                    // ACL gate — never filter replies (those are responses to
                    // our own outgoing messages, matched by reply_to message ID).
                    if incoming.reply_to.is_none() {
                        let cap = if incoming.message_type == ma_core::MESSAGE_TYPE_MESSAGE {
                            crate::acl::CAP_INBOX
                        } else {
                            crate::acl::CAP_RPC
                        };
                        let cfg = config.get_untracked();
                        if !crate::acl::check_ego_acl(&cfg, &incoming.from, cap) {
                            let from_disp = cfg
                                .reverse_alias(&incoming.from)
                                .map(|a| format!("@{a}"))
                                .unwrap_or_else(|| incoming.from.clone());
                            state2.push_system(tf(
                                "msg-blocked",
                                &[("cap", cap), ("from", &from_disp)],
                            ));
                            continue;
                        }
                    }
                    if incoming.message_type == ma_core::MESSAGE_TYPE_MESSAGE {
                        let from_display = {
                            let cfg = config.get_untracked();
                            cfg.reverse_alias(&incoming.from)
                                .map(|a| format!("@{a}"))
                                .unwrap_or_else(|| incoming.from.clone())
                        };
                        let count = state2.ingest_mailbox_message(&incoming, config);
                        // Persist asynchronously.
                        if let Some(sess) = state2.session.get_untracked() {
                            let uname = sess.username.clone();
                            let cfg_snap = config.get_untracked();
                            spawn_local(async move {
                                if let Err(e) = persist_config(&uname, &cfg_snap).await {
                                    web_sys::console::error_1(
                                        &format!("inbox persist: {e}").into(),
                                    );
                                }
                            });
                        }
                        state2.push_incoming(
                            format!(
                                "\u{2190} [{}] new message \u{2014} {} in inbox",
                                from_display, count
                            ),
                            None,
                            false,
                        );
                        continue;
                    }
                    let display = {
                        let cfg = config.get_untracked();
                        if let Some(alias) = cfg.reverse_alias(&incoming.from) {
                            incoming.display.replace(&incoming.from, &format!("@{alias}"))
                        } else {
                            incoming.display.clone()
                        }
                    };
                    match &incoming.reply_to {
                        Some(msg_id) => {
                            // Check if this is a pending entity-edit reply.
                            let pending = state2
                                .pending_rpc_edits
                                .get_untracked()
                                .get(msg_id)
                                .cloned();
                            if let Some(edit) = pending {
                                state2
                                    .pending_rpc_edits
                                    .update(|m| { m.remove(msg_id); });
                                let doc_path = edit.doc_path();
                                let yaml = match crate::messages::cbor_to_yaml(&incoming.content) {
                                    Ok(y) => y,
                                    Err(e) => {
                                        state2.push_error(format!("entity decode failed: {e}"));
                                        continue;
                                    }
                                };
                                let (doc_path, mode) = edit.into_editor_mode(doc_path);
                                let ctx = crate::views::editor::EditorContext {
                                    doc_path,
                                    initial: yaml,
                                    language: "yaml".to_string(),
                                    mode,
                                };
                                show_editor.set(Some(ctx));
                                continue;
                            }
                            let status = if incoming.is_error {
                                CommandStatus::Error(incoming.display.clone())
                            } else {
                                CommandStatus::Replied(incoming.display.clone())
                            };
                            let cmd_id = state2.resolve_command(msg_id, status);
                            state2.push_incoming(display, cmd_id, incoming.is_error);
                        }
                        None => {
                            state2.push_incoming(display, None, incoming.is_error);
                        }
                    }
                }
            }
        });
    }

    // Signal for programmatic eval — InputBar watches this and processes each
    // line exactly like a paste, going through the same on_submit path.
    let eval_input: RwSignal<Option<String>> = RwSignal::new(None);

    // Eval callback — hands the document text to InputBar's paste mechanism.
    let eval_lines = Callback::new(move |text: String| {
        eval_input.set(Some(text));
    });

    // Core input handler.
    let handle_input_fn: std::sync::Arc<dyn Fn(String) + Send + Sync> = {
        let state = state.clone();
        let config = config.clone();
        let eval_lines = eval_lines.clone();
        std::sync::Arc::new(move |line: String| {
            let line = line.trim().to_string();
            if line.is_empty() {
                return;
            }

            // History
            state.history.update(|h| {
                if h.last().map(|s| s.as_str()) != Some(&line) {
                    h.push(line.clone());
                }
                if h.len() > 200 {
                    h.drain(0..h.len() - 200);
                }
            });

            // Persist history (per-user) to IndexedDB.
            if let Some(sess) = state.session.get_untracked() {
                let username = sess.username;
                let hist = state.history.get_untracked();
                spawn_local(async move {
                    if let Ok(json) = serde_json::to_string(&hist) {
                        let _ = save_history(&username, &json).await;
                    }
                });
            }

            let focus = state.focus_actor.get_untracked();
            let cfg = config.get_untracked();

            match parse(&line, &cfg, focus.as_ref().map(|item| item.target.as_str())) {
                Ok(cmd) => eval(
                    cmd,
                    &line,
                    &state,
                    config.clone(),
                    show_editor,
                    eval_lines.clone(),
                ),
                Err(e) => state.push_error(format!("'{line}': {e}")),
            }
        })
    };

    // Thin wrapper satisfying InputBar's `impl Fn(String) + 'static` bound.
    let handle_input = {
        let f = handle_input_fn;
        move |line: String| f(line)
    };

    view! {
        <div class="terminal"
             class:placement-left=move || config.get().get(".config.editor.placement").unwrap_or("bottom") == "left"
             class:placement-right=move || config.get().get(".config.editor.placement").unwrap_or("bottom") == "right"
        >
            <OutputPane state=state.clone()/>
            <EditorModal show=show_editor config=config on_eval=eval_lines/>
            <crate::views::input::InputBar
                on_submit=handle_input
                focus_actor=state.focus_actor
                history=state.history
                eval_input=eval_input
            />
        </div>
    }
}

// ── Output pane ────────────────────────────────────────────────────────────

#[component]
fn OutputPane(state: AppState) -> impl IntoView {
    let entries = state.entries;

    // Auto-scroll to bottom whenever entries change
    Effect::new(move |_| {
        let _ = entries.get(); // track signal
        if let Some(window) = web_sys::window() {
            let closure = wasm_bindgen::closure::Closure::<dyn FnMut()>::new(|| {
                if let Some(win) = web_sys::window() {
                    if let Some(doc) = win.document() {
                        if let Some(el) = doc.get_element_by_id("terminal-output") {
                            el.set_scroll_top(el.scroll_height());
                        }
                    }
                }
            });
            let _ = window.request_animation_frame(closure.as_ref().unchecked_ref());
            closure.forget();
        }
    });

    view! {
        <div
            class="terminal-output"
            id="terminal-output"
        >
            <For
                each=move || entries.get()
                key=|e| e.id()
                children=|entry| render_entry(entry)
            />
        </div>
    }
}

fn render_entry(entry: Entry) -> impl IntoView {
    match entry {
        Entry::Command(c) => {
            let cls = match c.status {
                CommandStatus::Sent => "terminal-line line-pending",
                CommandStatus::Done => "terminal-line line-dimmed",
                CommandStatus::Replied(_) => "terminal-line line-replied",
                CommandStatus::Error(_) => "terminal-line line-error",
            };
            let text = format!("→ {}", c.raw);
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::Incoming(i) => {
            let cls = if i.is_error {
                "terminal-line line-error"
            } else if i.after_cmd_id.is_some() {
                "terminal-line line-reply"
            } else {
                "terminal-line line-output"
            };
            let text = i.display;
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::System(s) => {
            let cls = match s.kind {
                SystemKind::Info => "terminal-line line-system",
                SystemKind::Error => "terminal-line line-error",
            };
            let text = s.text;
            view! { <div class=cls>{text}</div> }.into_any()
        }
    }
}

// ── Command evaluator ──────────────────────────────────────────────────────

fn eval(
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
            // Bare `@alias` with no verb and empty body → just echo the
            // resolved DID. No message dispatch.
            if verb.is_none() && body.trim().is_empty() {
                state.push_output(target);
                return;
            }

            // Capture the prompt-prefixed raw line as the visual record.
            let focus_prefix = state
                .focus_actor
                .get_untracked()
                .map(|f| format!("{} ", f.prompt))
                .unwrap_or_default();
            let display = format!("{focus_prefix}{raw}");
            let cmd_id = state.push_command(display);

            let state_async = state.clone();
            spawn_local(async move {
                let result = match verb.as_deref() {
                    Some("say") => transport::send_chat(&target, &body).await,
                    Some("emote") => transport::send_emote(&target, &body).await,
                    Some(v) => {
                        // Detect `:entities.<name>[.<field>]:edit` with no body — record
                        // so the poll loop can open the editor when the reply arrives.
                        let pending_edit = if body.trim().is_empty() {
                            detect_entity_edit(&target, v)
                        } else {
                            None
                        };
                        let res = transport::send_rpc(
                            &target,
                            v,
                            &body.split_whitespace().collect::<Vec<_>>(),
                        )
                        .await;
                        if let (Ok(ref msg_id), Some(edit)) = (&res, pending_edit) {
                            state_async
                                .pending_rpc_edits
                                .update(|m| { m.insert(msg_id.clone(), edit); });
                        }
                        res
                    }
                    None => transport::send_text(&target, &body).await,
                };
                match result {
                    Ok(msg_id) => state_async.bind_message_id(cmd_id, msg_id),
                    Err(e) => {
                        state_async.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state_async.push_error(format!("send failed: {e}"));
                    }
                }
            });
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

    // ── Control commands (not config access) ─────────────────────────────
    match path {
        ".help" => {
            for line in help_text() {
                state.push_system(line);
            }
            return;
        }
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
        ".ma" => {
            state.push_output("間");
            return;
        }
        ".use" => {
            eval_use(args, state, config);
            return;
        }
        // Shorthand: `.edit [cid]` → `.my.documents.scratch:edit [cid]`
        ".edit" => {
            if let Err(e) = dispatch_verb(
                ".my.documents.scratch",
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
                    if path_owned == ".config.ui.language" {
                        crate::i18n::init(&value);
                    }
                    if path_owned == ".my.lang" {
                        let first = value.split(':').next().unwrap_or(&value).to_string();
                        crate::i18n::init(&first);
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
                        // Sub-subtree — show full path, skip when value-querying.
                        if query.is_some() {
                            continue;
                        }
                        state.push_output(format!("  {child_path}"));
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
    state.push_system(tf("msg-focusing", &[("did", &resolved), ("prompt", &prompt)]));
}

fn apply_config_to_dom(cfg: &EgoConfig) {
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
        cfg.get(".config.colour.text").unwrap_or("#00ff41"),
        cfg.get(".config.colour.dimmed").unwrap_or("#008f11"),
        cfg.get(".config.colour.pending").unwrap_or("#004d00"),
        cfg.get(".config.colour.replied").unwrap_or("#00ff41"),
        cfg.get(".config.colour.alias").unwrap_or("#ffd700"),
        cfg.get(".config.colour.error").unwrap_or("#ff3333"),
        cfg.get(".config.colour.system").unwrap_or("#888888"),
        cfg.get(".config.colour.bg").unwrap_or("#0d0d0d"),
        cfg.get(".config.colour.input_bg").unwrap_or("#0a0a0a"),
        cfg.get(".config.colour.border").unwrap_or("#003300"),
        cfg.get(".config.colour.cursor").unwrap_or("#00ff41"),
        cfg.get(".config.colour.highlight").unwrap_or("#003300"),
    );

    let _ = root.set_attribute("style", &style);
}

// ── Lazy DID / CID link traversal ─────────────────────────────────────────

/// Resolve a link value (`did:ma:…` or CID) and traverse `subpath` within
/// the fetched document, pushing the result to the terminal.
///
/// Documents are cached in `AppState::doc_cache` keyed by the link string.
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
                // Bare CID — fetch from local gateway.
                let url = format!("{}ipfs/{link}", crate::transport::connection::LOCAL_GATEWAY_URL);
                match fetch_url_text(&url).await {
                    Ok(t) => serde_json::from_str::<serde_json::Value>(&t).map_err(|e| e.to_string()),
                    Err(e) => Err(e),
                }
            };
            match val {
                Ok(v) => {
                    cache.update(|m| { m.insert(link.to_string(), v.clone()); });
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

/// Minimal HTTP GET → text, reusing the same gateway as the transport layer.
async fn fetch_url_text(url: &str) -> Result<String, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;
    let window = web_sys::window().ok_or("no window")?;
    let promise = window.fetch_with_str(url);
    let resp_val = JsFuture::from(promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    if !resp.ok() {
        return Err(format!("HTTP {}", resp.status()));
    }
    let text_promise = resp.text().map_err(|e| format!("{e:?}"))?;
    let text_val = JsFuture::from(text_promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    text_val
        .as_string()
        .ok_or_else(|| "response is not a string".to_string())
}

// ── Entity-edit helpers ───────────────────────────────────────────────────

/// If `verb` matches `entities.<name>:edit` or `entities.<name>.<field>:edit`
/// (with no body args), return the corresponding `PendingRpcEdit`.
fn detect_entity_edit(target: &str, verb: &str) -> Option<crate::state::PendingRpcEdit> {
    use crate::state::PendingRpcEdit;
    let v = verb.strip_prefix(':').unwrap_or(verb);
    let (path_part, verb_part) = v.split_once(':')?;
    if verb_part != "edit" {
        return None;
    }
    let mut parts = path_part.splitn(3, '.');
    if parts.next() != Some("entities") {
        return None;
    }
    let entity_name = parts.next()?.to_string();
    if entity_name.is_empty() {
        return None;
    }
    match parts.next() {
        None => Some(PendingRpcEdit::Entity {
            target: target.to_string(),
            entity_name,
        }),
        Some(field) if !field.is_empty() => {
            Some(PendingRpcEdit::Field {
                target: target.to_string(),
                entity_name,
                field: field.to_string(),
            })
        }
        _ => None,
    }
}

fn help_text() -> Vec<String> {
    vec![
        t("help-header-zion"),
        t("help-cmd-help"),
        t("help-cmd-clear"),
        t("help-cmd-panic"),
        t("help-cmd-logout"),
        String::new(),
        t("help-header-messaging"),
        t("help-msg-echo"),
        t("help-msg-send"),
        t("help-msg-fragment"),
        t("help-msg-escape"),
        String::new(),
        t("help-header-focus"),
        t("help-focus-set"),
        t("help-focus-clear"),
        String::new(),
        t("help-header-config"),
        t("help-config-get"),
        t("help-config-filter"),
        t("help-config-set"),
        t("help-config-delete"),
        t("help-config-verb"),
        String::new(),
        t("help-header-common"),
        t("help-my"),
        t("help-aliases"),
        t("help-aliases-set"),
        t("help-aliases-del"),
        t("help-runtime-discover"),
        t("help-runtime-claim"),
        t("help-identity"),
        t("help-identity-did"),
        t("help-identity-publish"),
        t("help-config-path"),
        String::new(),
        t("help-header-inbox"),
        t("help-inbox"),
        t("help-inbox-n"),
        t("help-inbox-from"),
        t("help-inbox-reply"),
        t("help-inbox-open"),
        t("help-inbox-del"),
        t("help-inbox-delall"),
        t("help-inbox-flush"),
        t("help-inbox-traverse"),
        String::new(),
        t("help-header-documents"),
        t("help-doc-edit"),
        t("help-doc-edit-cid"),
        t("help-doc-eval"),
        t("help-doc-publish"),
        t("help-doc-publish-ipld"),
        t("help-doc-fetch"),
        t("help-doc-cid"),
        t("help-doc-del"),
        t("help-footer"),
    ]
}
