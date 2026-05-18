/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    core::{CommandStatus, Entry, SystemKind},
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
        return Err("alias name cannot be empty".to_string());
    }
    if name.contains('#') {
        return Err("alias names cannot contain '#'".to_string());
    }
    if value.contains('#') {
        return Err("alias value must be bare did:ma:<ipns> (no fragment)".to_string());
    }
    if value.contains('/') {
        return Err("alias value must be bare did:ma:<ipns> (no path)".to_string());
    }
    if !value.starts_with("did:ma:") {
        return Err("alias value must start with did:ma:".to_string());
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
                state2.push_system(format!(
                    "ego v{} — logged in as {username}",
                    env!("CARGO_PKG_VERSION")
                ));
                state2.push_system("Type .help for a list of commands.");
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
                state2.push_system("connecting to iroh...");
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
                    Ok(()) => state2.push_system("iroh endpoint ready"),
                    Err(e) => state2.push_error(format!("iroh: {e}")),
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
                        transport::send_rpc(
                            &target,
                            v,
                            &body.split_whitespace().collect::<Vec<_>>(),
                        )
                        .await
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
            for line in HELP_TEXT {
                state.push_system(*line);
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
                state.push_error(format!("{path} is read-only"));
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
                state.push_error(format!("{path} is a subtree; refusing to set"));
                return;
            }
            if has_ancestor {
                state.push_error(format!(
                    "an ancestor of {path} is a leaf; refusing to shadow"
                ));
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
                    state2.push_system(format!("{path_owned}: {value}"));
                }
            });
        }

        DotOp::Delete => {
            if EgoConfig::is_read_only(path) {
                state.push_error(format!("{path} is read-only"));
                return;
            }
            let removed = config.try_update(|c| c.delete_subtree(path)).unwrap_or(0);
            if removed == 0 {
                state.push_error(format!("key not found: {path}"));
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
                    state2.push_system(format!("deleted {path_owned} ({removed} entries)"));
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
                    Some(_) => state.push_error("no match"),
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
                    state.push_error("no match");
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
                    state.push_error(format!("key not found: {path}"));
                }
            }
        }

        DotOp::Verb(_) => unreachable!("handled above"),
    }
}

fn eval_use(args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    if args.is_empty() {
        state.focus_actor.set(None);
        state.push_system("focus cleared");
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
                state.push_error(format!("unknown alias: @{target}"));
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
    state.push_system(format!("focusing {resolved} as {prompt}"));
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
            // Fetch: DID → resolve via gateway; CID → fetch raw JSON.
            let text = if link.starts_with("did:ma:") {
                let url = format!(
                    "https://dweb.link/ipns/{}",
                    link.trim_start_matches("did:ma:")
                );
                fetch_url_text(&url).await
            } else {
                // Bare CID
                fetch_url_text(&format!("https://dweb.link/ipfs/{link}")).await
            };
            match text {
                Ok(t) => match serde_json::from_str::<serde_json::Value>(&t) {
                    Ok(v) => {
                        cache.update(|m| {
                            m.insert(link.to_string(), v.clone());
                        });
                        v
                    }
                    Err(e) => {
                        state.push_error(format!("link parse error: {e}"));
                        return;
                    }
                },
                Err(e) => {
                    state.push_error(format!("link fetch error: {e}"));
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
                state.push_error(format!("key `{key}` not found in linked document"));
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

const HELP_TEXT: &[&str] = &[
    "── ego commands ─────────────────────────────────────────────────────────",
    "  .help                        this text",
    "  .clear                       clear terminal",
    "  .logout                      log out",
    "",
    "── messaging ────────────────────────────────────────────────────────────",
    "  @alias                       echo resolved DID (no message sent)",
    "  @alias[:verb] body           send message / RPC to actor",
    "  @alias#fragment[:verb] body  send to alias with explicit DID fragment",
    "  \\@name                       literal @name (no alias lookup)",
    "",
    "── focus mode ───────────────────────────────────────────────────────────",
    "  .use @alias [as @name]       focus on actor (changes prompt)",
    "  .use                         clear focus",
    "",
    "── local config grammar ─────────────────────────────────────────────────",
    "  .path                        get leaf value or list subtree",
    "  .path value                  match query (filter by value)",
    "  .path: value                 set leaf",
    "  .path:                       delete leaf or subtree",
    "  .path:verb [args]            invoke local verb",
    "",
    "── common paths ─────────────────────────────────────────────────────────",
    "  .my                          show all personal config",
    "  .my.aliases                  list aliases",
    "  .my.aliases.<name>: <did>    add/update alias (bare DID, no #fragment)",
    "  .my.aliases.<name>:          remove alias",
    "  .my.間:discover              discover local runtime and create @間 alias",
    "  .my.ma:discover             ASCII alias for discovery",
    "  .my.identity                 show identity config",
    "  .my.identity.did             show own DID (read-only)",
    "  .my.identity:publish @pub    publish own DID via publisher service",
    "  .config                      show all .config.* entries",
    "",
    "── inbox ────────────────────────────────────────────────────────────────",
    "  .my.inbox                    list inbox (subtree view)",
    "  .my.inbox.N                  show entry N fields",
    "  .my.inbox.N.from             sender DID of entry N",
    "  .my.inbox.N:reply [body]     send reply (opens editor if no body)",
    "  .my.inbox.N:open             open entry content read-only in editor",
    "  .my.inbox.N:                 delete entry N",
    "  .my.inbox:                   delete all inbox entries",
    "  .my.inbox:flush              print all entries to terminal",
    "  .my.inbox.N.sender.<field>   traverse sender DID document lazily",
    "─────────────────────────────────────────────────────────────────────────",
];
