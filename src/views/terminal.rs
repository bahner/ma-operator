/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    core::{CommandStatus, Entry, SystemKind},
    identity::storage::{load_history, save_history},
    parser::command::{parse, Command},
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
            spawn_local(async move {
                match restore_config(&username).await {
                    Ok(cfg) => {
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

        Command::DotCommand { path, args } => {
            eval_dot(&path, &args, state, config);
        }

        Command::ActorMessage { target, verb, body } => {
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

fn eval_dot(path: &str, args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    let session = state.session.get_untracked();
    let username = session.map(|s| s.username).unwrap_or_default();

    match path {
        ".help" => {
            for line in HELP_TEXT {
                state.push_system(*line);
            }
        }
        ".logout" => {
            transport::disconnect();
            state.session.set(None);
        }
        ".clear" => {
            state.entries.set(vec![]);
        }

        // ── .use ──────────────────────────────────────────────────────────
        ".use" => {
            if args.is_empty() {
                state.focus_actor.set(None);
                state.push_system("focus cleared");
            } else {
                let target = args[0].trim_start_matches('@').to_string();
                // Resolve alias if needed
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
        }

        // ── .my.aliases ───────────────────────────────────────────────────
        ".my.aliases" => {
            match args.first().map(String::as_str) {
                Some("add") => {
                    if args.len() < 3 {
                        state.push_error("usage: .my.aliases add <name> <did>");
                        return;
                    }
                    let name = args[1].trim_start_matches('@').to_string();
                    let did = args[2].clone();
                    let uname = username.clone();
                    let state2 = state.clone();
                    config.update(|c| c.add_alias(&name, &did));
                    let cfg = config.get_untracked();
                    spawn_local(async move {
                        if let Err(e) = persist_config(&uname, &cfg).await {
                            state2.push_error(e);
                        } else {
                            state2.push_system(format!("alias @{name} → {did}"));
                        }
                    });
                }
                Some("remove") => {
                    if args.len() < 2 {
                        state.push_error("usage: .my.aliases remove <name>");
                        return;
                    }
                    let name = args[1].trim_start_matches('@').to_string();
                    let removed = {
                        let mut cfg = config.get_untracked();
                        cfg.remove_alias(&name)
                    };
                    if removed {
                        config.update(|c| {
                            c.remove_alias(&name);
                        });
                        let cfg = config.get_untracked();
                        let uname = username.clone();
                        let state2 = state.clone();
                        spawn_local(async move {
                            if let Err(e) = persist_config(&uname, &cfg).await {
                                state2.push_error(e);
                            } else {
                                state2.push_system(format!("removed alias @{name}"));
                            }
                        });
                    } else {
                        state.push_error(format!("alias @{name} not found"));
                    }
                }
                Some(other) => {
                    state.push_error(format!("unknown .my.aliases subcommand: {other}"));
                }
                None => {
                    let cfg = config.get_untracked();
                    let aliases = cfg.list_aliases();
                    if aliases.is_empty() {
                        state.push_output("(no aliases)");
                    } else {
                        for (k, v) in aliases {
                            let name = k.trim_start_matches(".my.aliases.");
                            state.push_output(format!("  {name:<20} {v}"));
                        }
                    }
                }
            }
        }

        // ── .config ───────────────────────────────────────────────────────
        ".config" => {
            let cfg = config.get_untracked();
            let entries = cfg.list(".config");
            for (k, v) in entries {
                state.push_output(format!("  {k}: {v}"));
            }
        }

        // ── .my.identity ─────────────────────────────────────────────────
        ".my.identity" => {
            let sess = state.session.get_untracked();
            if let Some(sess) = sess {
                state.push_output(format!(".my.identity.did: {}", sess.sender_did));
                let cfg = config.get_untracked();
                for (k, v) in cfg.list(".my.identity") {
                    state.push_output(format!("  {k}: {v}"));
                }
            }
        }

        ".my.identity.publish" => {
            let cfg = config.get_untracked();
            let publisher = match cfg.get(".my.identity.publisher") {
                Some(p) => p.to_string(),
                None => {
                    state.push_error(".my.identity.publisher not set — use: .my.identity.publisher: did:ma:<publisher>");
                    return;
                }
            };
            let sess = state.session.get_untracked();
            let did = sess.map(|s| s.sender_did).unwrap_or_default();
            let state2 = state.clone();
            spawn_local(async move {
                match transport::send_rpc(&publisher, "publish", &[&did]).await {
                    Ok(_msg_id) => state2.push_system(format!("published {did} to {publisher}")),
                    Err(e) => state2.push_error(format!("publish failed: {e}")),
                }
            });
        }

        // ── .my ───────────────────────────────────────────────────────────
        ".my" => {
            let cfg = config.get_untracked();
            for (k, v) in cfg.list(".my") {
                state.push_output(format!("  {k}: {v}"));
            }
        }

        // ── Dot-get / dot-set ─────────────────────────────────────────────
        key if key.starts_with('.') => {
            if key.ends_with(':') {
                // Setter: .config.colour.alias: #ff0
                let key = key.trim_end_matches(':').to_string();
                if args.is_empty() {
                    state.push_error("usage: .key: value");
                    return;
                }
                let value = args.join(" ");
                config.update(|c| c.set(&key, &value));
                let cfg = config.get_untracked();
                let uname = username.clone();
                let state2 = state.clone();
                spawn_local(async move {
                    if let Err(e) = persist_config(&uname, &cfg).await {
                        state2.push_error(e);
                    } else {
                            apply_config_to_dom(&cfg);
                        state2.push_system(format!("{key}: {value}"));
                    }
                });
            } else {
                // Getter: .config.colour.alias
                let cfg = config.get_untracked();
                match cfg.get(key) {
                    Some(v) => state.push_output(format!("{key}: {v}")),
                    None => {
                        // Try listing as prefix
                        let entries = cfg.list(key);
                        if entries.is_empty() {
                            state.push_error(format!("key not found: {key}"));
                        } else {
                            for (k, v) in entries {
                                state.push_output(format!("  {k}: {v}"));
                            }
                        }
                    }
                }
            }
        }

        other => {
            state.push_error(format!("unknown command: {other}"));
        }
    }
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
    "  @alias[:verb] [body]         send message / RPC to actor",
    "  \\@name                       literal @name (no alias lookup)",
    "",
    "── focus mode ───────────────────────────────────────────────────────────",
    "  .use @alias                  focus on actor (changes prompt)",
    "  .use @alias as @name         focus with local prompt alias",
    "  .use                         clear focus",
    "",
    "── aliases ──────────────────────────────────────────────────────────────",
    "  .my.aliases                  list aliases",
    "  .my.aliases add @name <did>  add alias",
    "  .my.aliases remove @name     remove alias",
    "",
    "── identity ─────────────────────────────────────────────────────────────",
    "  .my.identity                 show DID and identity config",
    "  .my.identity.publisher: did  set publisher service DID",
    "  .my.identity.publish         publish DID to configured publisher",
    "",
    "── config ───────────────────────────────────────────────────────────────",
    "  .config                      list all config",
    "  .config.key                  get value",
    "  .config.key: value           set value",
    "─────────────────────────────────────────────────────────────────────────",
];
