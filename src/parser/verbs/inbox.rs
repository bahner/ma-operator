use leptos::prelude::*;
use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport;
use crate::views::editor::EditorContext;
use super::doc::lang_for_content_type;
use super::resolve_bare_did;

pub(super) fn handle_inbox(path: &str, verb: &str, args: &[String], state: &AppState,
    config: RwSignal<EgoConfig>, show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>) -> Result<(), String> {
// ── .my.inbox ──────────────────────────────────────────────────────────
// Flush: .my.inbox:flush — print all entries to terminal in order.
if path == ".my.inbox" && verb == "flush" {
    let cfg = config.get_untracked();
    let entries = cfg.list(".my.inbox.");
    // Collect distinct numeric indices (sorted).
    let mut indices: std::collections::BTreeSet<usize> = std::collections::BTreeSet::new();
    for (k, _) in &entries {
        let tail = &k[".my.inbox.".len()..];
        if let Some(idx_str) = tail.split('.').next() {
            if let Ok(n) = idx_str.parse::<usize>() {
                indices.insert(n);
            }
        }
    }
    if indices.is_empty() {
        state.push_system(t("inbox-empty"));
    }
    for n in &indices {
        let base = format!(".my.inbox.{n}");
        let from = cfg.get(&format!("{base}.from")).unwrap_or("?").to_string();
        let ct = cfg
            .get(&format!("{base}.content_type"))
            .unwrap_or("")
            .to_string();
        let body = cfg
            .get(&format!("{base}.content"))
            .unwrap_or("")
            .to_string();
        state.push_output(format!("[{n}] from: {from}  ({ct})"));
        for line in body.lines() {
            state.push_output(format!("    {line}"));
        }
    }
    return Ok(());
}

// Filter: .my.inbox:filter @who — show only entries from a specific sender.
if path == ".my.inbox" && verb == "filter" {
    let raw_arg = args.first().ok_or_else(|| t("inbox-filter-no-arg"))?;
    let cfg = config.get_untracked();
    let target_did = resolve_bare_did(raw_arg, &cfg)?;
    let entries = cfg.list(".my.inbox.");
    let mut indices: std::collections::BTreeSet<usize> = std::collections::BTreeSet::new();
    for (k, _) in &entries {
        let tail = &k[".my.inbox.".len()..];
        if let Some(idx_str) = tail.split('.').next() {
            if let Ok(n) = idx_str.parse::<usize>() {
                indices.insert(n);
            }
        }
    }
    let mut found = false;
    for n in &indices {
        let base = format!(".my.inbox.{n}");
        let from = cfg.get(&format!("{base}.from")).unwrap_or("").to_string();
        if from != target_did {
            continue;
        }
        found = true;
        let ct = cfg
            .get(&format!("{base}.content_type"))
            .unwrap_or("")
            .to_string();
        let body = cfg
            .get(&format!("{base}.content"))
            .unwrap_or("")
            .to_string();
        state.push_output(format!("[{n}] from: {from}  ({ct})"));
        for line in body.lines() {
            state.push_output(format!("    {line}"));
        }
    }
    if !found {
        state.push_system(tf("inbox-filter-empty", &[("did", &target_did)]));
    }
    return Ok(());
}

// Entry verbs: .my.inbox.<N>:reply | :open
if let Some(n_str) = path
    .strip_prefix(".my.inbox.")
    .filter(|t| !t.contains('.') && !t.is_empty())
{
    let n: usize = n_str
        .parse()
        .map_err(|_| tf("inbox-invalid-index", &[("n", n_str)]))?;
    let base = format!(".my.inbox.{n}");

    match verb {
        "reply" => {
            let cfg = config.get_untracked();
            let from = cfg
                .get(&format!("{base}.from"))
                .ok_or_else(|| tf("inbox-entry-not-found", &[("n", &n.to_string())]))?
                .to_string();
            let msg_id = cfg
                .get(&format!("{base}.message_id"))
                .ok_or_else(|| tf("inbox-no-message-id", &[("n", &n.to_string())]))?
                .to_string();
            // Use stored reply_to if present, else reply to the message id.
            let reply_to_id = cfg
                .get(&format!("{base}.reply_to"))
                .unwrap_or(&msg_id)
                .to_string();

            if args.is_empty() {
                // No body — open editor with Reply mode.
                show_editor.set(Some(EditorContext::new(base, "").with_mode(
                    crate::views::editor::EditorMode::Reply {
                        to: from,
                        reply_to_id,
                    },
                )));
            } else {
                // Immediate send.
                let body = args.join(" ");
                let to = from.clone();
                let state2 = state.clone();
                let cmd_id = state.push_command(format!("{path}:reply {body}"));
                leptos::task::spawn_local(async move {
                    match transport::send_text_reply(&to, &body, &reply_to_id).await {
                        Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                        Err(e) => {
                            state2
                                .resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                            state2.push_error(tf("msg-reply-failed", &[("e", &e)]));
                        }
                    }
                });
            }
            return Ok(());
        }

        "open" => {
            let cfg = config.get_untracked();
            let content = cfg
                .get(&format!("{base}.content"))
                .unwrap_or("")
                .to_string();
            let ct = cfg
                .get(&format!("{base}.content_type"))
                .unwrap_or("text/plain");
            let lang = lang_for_content_type(ct);
            show_editor.set(Some(
                EditorContext::new(base, content)
                    .with_language(lang)
                    .with_mode(crate::views::editor::EditorMode::View),
            ));
            return Ok(());
        }

        other => {
            return Err(tf(
                "inbox-no-verb",
                &[("verb", other), ("n", &n.to_string())],
            ))
        }
    }
}

    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}
