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
};

#[component]
pub fn Terminal() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Per-session reactive config
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());

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
                        apply_config_to_dom(&cfg);
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
                    Ok(Some(json)) => {
                        match serde_json::from_str::<Vec<String>>(&json) {
                            Ok(hist) => state2.history.set(hist),
                            Err(e) => state2
                                .push_error(format!("history parse error: {e}")),
                        }
                    }
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
            let sender_did = sess.sender_did.clone();
            let username = sess.username.clone();
            spawn_local(async move {
                state2.push_system("connecting to iroh...");
                match transport::connect(iroh_key, ipns_secret_key, did_signing_key, sender_did).await {
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
                for incoming in transport::drain_inbox() {
                    match &incoming.reply_to {
                        Some(msg_id) => {
                            let status = if incoming.is_error {
                                CommandStatus::Error(incoming.display.clone())
                            } else {
                                CommandStatus::Replied(incoming.display.clone())
                            };
                            let cmd_id = state2.resolve_command(msg_id, status);
                            state2.push_incoming(incoming.display, cmd_id);
                        }
                        None => {
                            state2.push_incoming(incoming.display, None);
                        }
                    }
                }
            }
        });
    }

    // Handler called by the input component with a submitted line
    let handle_input = {
        let state = state.clone();
        let config = config.clone();
        move |line: String| {
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
                Ok(cmd) => eval(cmd, &line, &state, config.clone()),
                Err(e) => state.push_error(format!("'{line}': {e}")),
            }
        }
    };

    view! {
        <div class="terminal">
            <OutputPane state=state.clone()/>
            <crate::views::input::InputBar
                on_submit=handle_input
                focus_actor=state.focus_actor
                history=state.history
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
            let _ = window.request_animation_frame(
                closure.as_ref().unchecked_ref()
            );
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
                CommandStatus::Replied(_) => "terminal-line line-replied",
                CommandStatus::Error(_) => "terminal-line line-error",
            };
            let text = format!("→ {}", c.raw);
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::Incoming(i) => {
            let cls = if i.after_cmd_id.is_some() {
                "terminal-line line-reply"
            } else {
                "terminal-line line-output"
            };
            view! { <div class=cls>{i.display}</div> }.into_any()
        }
        Entry::System(s) => {
            let cls = match s.kind {
                SystemKind::Info => "terminal-line line-system",
                SystemKind::Error => "terminal-line line-error",
            };
            view! { <div class=cls>{s.text}</div> }.into_any()
        }
    }
}

// ── Command evaluator ──────────────────────────────────────────────────────

fn eval(cmd: Command, raw: &str, state: &AppState, config: RwSignal<EgoConfig>) {
    match cmd {
        Command::PlainText(_) => {}

        Command::DotCommand { path, op, args } => {
            eval_dot(&path, op, &args, state, config);
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
                let result = match &verb {
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
                    Err(e) => state_async
                        .resolve_command_by_id(cmd_id, CommandStatus::Error(e)),
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
        _ => {}
    }

    // ── Verb dispatch ────────────────────────────────────────────────────
    if let DotOp::Verb(verb) = &op {
        if let Err(e) = dispatch_verb(path, verb, args, state, config) {
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
                    state2.push_system(format!(
                        "deleted {path_owned} ({removed} entries)"
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
                    Some(q) if value == q.as_str() => {
                        state.push_output(format!("{path}: {value}"))
                    }
                    Some(_) => state.push_error("no match"),
                }
            } else if cfg.has_children(path) {
                let prefix = format!("{path}.");
                let mut shown = 0usize;
                state.push_output(format!("{path}:"));
                for (k, v) in cfg.list(&prefix) {
                    if let Some(q) = &query {
                        if v != q.as_str() {
                            continue;
                        }
                    }
                    let tail = k.trim_start_matches(&prefix[..]);
                    state.push_output(format!("  {tail}: {v}"));
                    shown += 1;
                }
                if shown == 0 && query.is_some() {
                    state.push_error("no match");
                }
            } else {
                state.push_error(format!("key not found: {path}"));
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
        "--colour-text:{};--colour-dimmed:{};--colour-alias:{};--colour-error:{};--colour-system:{};--colour-bg:{};",
        cfg.get(".config.colour.text").unwrap_or("#00ff41"),
        cfg.get(".config.colour.dimmed").unwrap_or("#008f11"),
        cfg.get(".config.colour.alias").unwrap_or("#ffd700"),
        cfg.get(".config.colour.error").unwrap_or("#ff3333"),
        cfg.get(".config.colour.system").unwrap_or("#888888"),
        cfg.get(".config.colour.bg").unwrap_or("#0d0d0d"),
    );

    let _ = root.set_attribute("style", &style);
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
    "  .my.aliases.<name>: <did>    add/update alias",
    "  .my.aliases.<name>:          remove alias",
    "  .my.identity                 show identity config",
    "  .my.identity.did             show own DID (read-only)",
    "  .my.identity:publish @pub    publish own DID via publisher service",
    "  .config                      show all .config.* entries",
    "─────────────────────────────────────────────────────────────────────────",
];
