/// Per-key local verb registry.
///
/// `:verb` invocations on local dot-paths (`.path:verb [args]`) are
/// dispatched here. Each entry is `(path, verb)` and maps to an async
/// handler. Unknown `(path, verb)` pairs are an error.
use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport;
use crate::views::editor::EditorContext;

/// Default base URL for the local `ma` daemon.
/// Override per-profile with `.my.ma.url: http://host:port`.
const MA_URL: &str = "http://localhost:5003";

/// Resolve an argument that should refer to a bare `did:ma:<ipns>` (no
/// fragment, no path). Accepts either an alias name or a literal DID.
fn resolve_bare_did(arg: &str, cfg: &EgoConfig) -> Result<String, String> {
    let raw = arg.trim_start_matches('@');
    let resolved = if raw.starts_with("did:") {
        raw.to_string()
    } else {
        cfg.resolve_alias(raw)
            .map(|s| s.to_string())
            .ok_or_else(|| tf("err-unknown-alias", &[("name", raw)]))?
    };
    if resolved.contains('#') || resolved.contains('/') {
        return Err(tf("err-bare-did", &[("did", &resolved)]));
    }
    Ok(resolved)
}

/// Dispatch `.path:verb args…`. Returns `Ok(())` if the verb was handled
/// (even if the underlying work is async and continues in the background).
pub fn dispatch_verb(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    // Eval callback: runs a multi-line string through the terminal evaluator.
    on_eval: Callback<String>,
) -> Result<(), String> {
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

    // ── .my.ma ───────────────────────────────────────────────────────
    // .my.ma:discover — probe http://localhost:5003/status.json, configure
    // the local ma runtime, and create the @ma alias automatically.
    if path == ".my.ma" {
        // Read base URL once — .my.ma.url config key overrides MA_URL default.
        let ma_base = {
            let cfg = config.get_untracked();
            cfg.get(".my.ma.url")
                .unwrap_or(MA_URL)
                .trim_end_matches('/')
                .to_string()
        };
        match verb {
            "discover" => {
                let status_url = format!("{ma_base}/status.json");
                let state2 = state.clone();
                leptos::task::spawn_local(async move {
                    let json_str = match fetch_url_text(&status_url).await {
                        Ok(s) => s,
                        Err(e) => {
                            let hint = discover_fetch_hint(&e);
                            state2.push_error(tf(
                                "discover-fetch-failed",
                                &[("url", &status_url), ("e", &e)],
                            ));
                            state2.push_error(hint);
                            return;
                        }
                    };
                    let json: serde_json::Value = match serde_json::from_str(&json_str) {
                        Ok(v) => v,
                        Err(e) => {
                            state2.push_error(tf(
                                "discover-json-error",
                                &[("url", &status_url), ("e", &e.to_string())],
                            ));
                            return;
                        }
                    };
                    let did = match json.get("did").and_then(|v| v.as_str()) {
                        Some(d) => d.to_string(),
                        None => {
                            state2.push_error(t("discover-missing-did"));
                            return;
                        }
                    };
                    if !did.starts_with("did:ma:") {
                        state2.push_error(tf("discover-invalid-did", &[("did", &did)]));
                        return;
                    }
                    let endpoint_id = json
                        .get("endpoint_id")
                        .and_then(|v| v.as_str())
                        .unwrap_or("")
                        .to_string();
                    if endpoint_id.is_empty() {
                        state2.push_system(t("discover-no-endpoint"));
                    }

                    // Write config, then persist.
                    config.update(|cfg| {
                        cfg.set(".my.ma.did", &did);
                        if !endpoint_id.is_empty() {
                            cfg.set(".my.ma.endpoint_id", &endpoint_id);
                        }
                        cfg.set(".my.aliases.ma", &did);
                    });

                    if let Some(sess) = state2.session.get_untracked() {
                        let username = sess.username.clone();
                        let cfg = config.get_untracked();
                        leptos::task::spawn_local(async move {
                            if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                                web_sys::console::error_1(&format!("persist error: {e}").into());
                            }
                        });
                    }

                    state2.push_system(format!(
                        "ma discovered at {status_url}\n  DID: {did}\n  alias @ma created — publish with: .my.identity:publish @ma"
                    ));
                });
                return Ok(());
            }
            "claim" => {
                let claim_url = format!("{ma_base}/claim");
                let status_url = format!("{ma_base}/status.json");
                let our_did = match state.session.get_untracked() {
                    Some(sess) => sess.sender_did.clone(),
                    None => {
                        return Err(t("claim-no-session"));
                    }
                };
                let state2 = state.clone();
                leptos::task::spawn_local(async move {
                    let body = format!(r#"{{"owner":"{}"}}"#, our_did);
                    match fetch_post_json(&claim_url, &body).await {
                        Ok(200) => {
                            state2.push_system(tf("claim-success", &[("did", &our_did)]));
                            // Also fetch status to set .my.ma.did / .my.aliases.ma
                            if let Ok(json_str) = fetch_url_text(&status_url).await {
                                if let Ok(json) =
                                    serde_json::from_str::<serde_json::Value>(&json_str)
                                {
                                    if let Some(did) =
                                        json.get("did").and_then(|v| v.as_str())
                                    {
                                        let did = did.to_string();
                                        let endpoint_id = json
                                            .get("endpoint_id")
                                            .and_then(|v| v.as_str())
                                            .unwrap_or("")
                                            .to_string();
                                        config.update(|cfg| {
                                            cfg.set(".my.ma.did", &did);
                                            if !endpoint_id.is_empty() {
                                                cfg.set(".my.ma.endpoint_id", &endpoint_id);
                                            }
                                            cfg.set(".my.aliases.ma", &did);
                                        });
                                        if let Some(sess) = state2.session.get_untracked() {
                                            let username = sess.username.clone();
                                            let cfg = config.get_untracked();
                                            leptos::task::spawn_local(async move {
                                                if let Err(e) = crate::config::persist_config(
                                                    &username, &cfg,
                                                )
                                                .await
                                                {
                                                    web_sys::console::error_1(
                                                        &format!("persist error: {e}").into(),
                                                    );
                                                }
                                            });
                                        }
                                    }
                                }
                            }
                        }
                        Ok(409) => {
                            state2.push_error(t("claim-conflict"));
                        }
                        Ok(status) => {
                            state2.push_error(tf(
                                "claim-http-failed",
                                &[("status", &status.to_string())],
                            ));
                        }
                        Err(e) => {
                            state2.push_error(tf("claim-error", &[("e", &e)]));
                        }
                    }
                });
                return Ok(());
            }
            other => return Err(tf("runtime-no-verb", &[("verb", other), ("path", path)])),
        }
    }

    // ── .my.profile ───────────────────────────────────────────────────────
    // .my.profile:  — delete this profile entirely from the browser
    //                 (identity, config, history), then log out.
    if path == ".my.profile" {
        match verb {
            "" => {
                // Authenticated: only reachable while logged in.
                let username = state
                    .session
                    .get_untracked()
                    .map(|s| s.username.clone())
                    .unwrap_or_default();
                if username.is_empty() {
                    return Err(t("profile-delete-no-session"));
                }
                let state2 = state.clone();
                leptos::task::spawn_local(async move {
                    use crate::identity::{delete_config, delete_history, delete_identity};
                    let mut errors: Vec<String> = Vec::new();
                    if let Err(e) = delete_identity(&username).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_config(&username).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_history(&username).await {
                        errors.push(e);
                    }
                    if errors.is_empty() {
                        crate::transport::disconnect();
                        state2.session.set(None);
                    } else {
                        state2.push_error(tf(
                            "profile-delete-error",
                            &[("e", &errors.join("; "))],
                        ));
                    }
                });
                return Ok(());
            }
            other => return Err(tf("profile-no-verb", &[("verb", other)])),
        }
    }

    // ── .my.acl ───────────────────────────────────────────────────────────
    // .my.acl:edit  — open the ACL YAML in a config editor.
    // .my.acl:      — (delete) reset ACL to default (fully open).
    if path == ".my.acl" {
        match verb {
            "edit" => {
                let cfg = config.get_untracked();
                let current = cfg
                    .get(crate::acl::ACL_KEY)
                    .unwrap_or("\"*\": [inbox, rpc]\n")
                    .to_string();
                show_editor.set(Some(
                    EditorContext::new(".my.acl", current)
                        .with_language("yaml")
                        .with_mode(crate::views::editor::EditorMode::ConfigEdit {
                            key: crate::acl::ACL_KEY.to_string(),
                        }),
                ));
                return Ok(());
            }
            "" => {
                // Delete: revert to open ACL.
                config.update(|c| {
                    c.delete(crate::acl::ACL_KEY);
                });
                let cfg = config.get_untracked();
                let username = use_context::<AppState>()
                    .unwrap_or_else(|| state.clone())
                    .session
                    .get_untracked()
                    .map(|s| s.username.clone())
                    .unwrap_or_default();
                let state2 = state.clone();
                leptos::task::spawn_local(async move {
                    if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                        state2.push_error(tf("acl-persist-error", &[("e", &e)]));
                    }
                });
                state.push_command_ok(t("acl-reset"));
                return Ok(());
            }
            other => return Err(tf("acl-no-verb", &[("verb", other)])),
        }
    }

    // ── .my.identity ──────────────────────────────────────────────────────
    if path == ".my.identity" && verb == "publish" {
        if args.len() != 1 {
            return Err(t("publish-usage"));
        }
        let cfg = config.get_untracked();
        let publisher = resolve_bare_did(&args[0], &cfg)?;
        let publisher_disp = args[0].to_string();
        let cmd_id = state.push_command(format!(".my.identity:publish {publisher_disp}"));
        let state2 = state.clone();
        leptos::task::spawn_local(async move {
            match transport::send_ipfs_publish(&publisher).await {
                Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                Err(e) => {
                    let mapped = format_publish_error(&e);
                    state2.resolve_command_by_id(cmd_id, CommandStatus::Error(mapped.clone()));
                    state2.push_error(mapped);
                }
            }
        });
        return Ok(());
    }

    // ── .my.doc.<name>:<verb> ──────────────────────────────────────────────
    if let Some(doc_name) = path.strip_prefix(".my.doc.") {
        if doc_name.is_empty() {
            return Err(t("doc-missing-name"));
        }
        let doc_path = path.to_string(); // e.g. ".my.doc.readme"

        match verb {
            // :edit           — open with stored content (or empty)
            // :edit <cid>     — fetch from gateway, open for review ONLY
            "edit" => {
                let cfg = config.get_untracked();

                if args.is_empty() {
                    // Open with stored content
                    let content = cfg
                        .get(&format!("{doc_path}.content"))
                        .unwrap_or_default()
                        .to_string();
                    let lang = lang_for_content_type(
                        cfg.get(&format!("{doc_path}.content_type"))
                            .unwrap_or("text/plain"),
                    );
                    show_editor.set(Some(
                        EditorContext::new(doc_path, content).with_language(lang),
                    ));
                } else {
                    // :edit <cid> — fetch from gateway; NEVER auto-execute
                    let cid = args[0].clone();
                    let state2 = state.clone();
                    let show_editor2 = show_editor.clone();
                    let doc_path2 = doc_path.clone();
                    leptos::task::spawn_local(async move {
                        match fetch_from_gateway(&cid).await {
                            Ok(text) => {
                                state2.push_system(tf("msg-fetch-review", &[("cid", &cid)]));
                                show_editor2.set(Some(
                                    EditorContext::new(doc_path2, text).with_language("plain"),
                                ));
                            }
                            Err(e) => {
                                state2.push_error(tf(
                                    "msg-fetch-failed",
                                    &[("cid", &cid), ("e", &e)],
                                ));
                            }
                        }
                    });
                }
                Ok(())
            }

            // :eval — execute the SAVED .content line-by-line
            "eval" => {
                let cfg = config.get_untracked();
                let content = cfg
                    .get(&format!("{doc_path}.content"))
                    .unwrap_or_default()
                    .to_string();
                if content.is_empty() {
                    return Err(tf("doc-content-empty", &[("path", &doc_path)]));
                }
                state.push_command_done(format!("{doc_path}:eval"));
                on_eval.run(content);
                Ok(())
            }

            // :publish <@publisher-or-did>
            // Stores the raw content bytes as a plain IPFS blob (unixfs add).
            // Use :publish-ipld for YAML→DAG-CBOR structured storage.
            "publish" => {
                if args.len() != 1 {
                    return Err(t("doc-publish-usage"));
                }
                let cfg = config.get_untracked();
                let publisher = resolve_bare_did(&args[0], &cfg)?;
                let content_str = cfg
                    .get(&format!("{doc_path}.content"))
                    .unwrap_or_default()
                    .to_string();
                if content_str.is_empty() {
                    return Err(tf("doc-save-first", &[("path", &doc_path)]));
                }
                let content_type = cfg
                    .get(&format!("{doc_path}.content_type"))
                    .unwrap_or("text/plain")
                    .to_string();
                let content_bytes = content_str.into_bytes();

                let state2 = state.clone();
                let doc_path2 = doc_path.clone();
                let publisher_disp = publisher.clone();
                leptos::task::spawn_local(async move {
                    match transport::send_ipfs_store(&publisher, content_bytes, &content_type).await
                    {
                        Ok(msg_id) => {
                            state2.push_system(tf(
                                "doc-store-sent",
                                &[("id", &msg_id), ("pub", &publisher_disp)],
                            ));
                        }
                        Err(e) => {
                            state2.push_error(tf(
                                "doc-publish-failed",
                                &[("path", &doc_path2), ("e", &format_publish_error(&e))],
                            ));
                        }
                    }
                });
                Ok(())
            }

            // :publish-ipld <@publisher-or-did>
            // Requires a YAML mapping; converts to DAG-CBOR and stores as a
            // structured IPLD node via dag_put — fields are traversable directly.
            "publish-ipld" => {
                if args.len() != 1 {
                    return Err(t("doc-publish-ipld-usage"));
                }
                let cfg = config.get_untracked();
                let publisher = resolve_bare_did(&args[0], &cfg)?;
                let content_str = cfg
                    .get(&format!("{doc_path}.content"))
                    .unwrap_or_default()
                    .to_string();
                if content_str.is_empty() {
                    return Err(tf("doc-save-first", &[("path", &doc_path)]));
                }
                let dag_cbor = crate::messages::yaml_to_dag_cbor(&content_str)
                    .map_err(|e| tf("doc-publish-ipld-error", &[("e", &e)]))?;

                let state2 = state.clone();
                let doc_path2 = doc_path.clone();
                let publisher_disp = publisher.clone();
                leptos::task::spawn_local(async move {
                    match transport::send_ipfs_store(
                        &publisher,
                        dag_cbor,
                        "application/vnd.ipld.dag-cbor",
                    )
                    .await
                    {
                        Ok(msg_id) => {
                            state2.push_system(tf(
                                "doc-ipld-store-sent",
                                &[("id", &msg_id), ("pub", &publisher_disp)],
                            ));
                        }
                        Err(e) => {
                            state2.push_error(tf(
                                "doc-ipld-store-failed",
                                &[("path", &doc_path2), ("e", &format_publish_error(&e))],
                            ));
                        }
                    }
                });
                Ok(())
            }

            // :cid — display stored CID
            "cid" => {
                let cfg = config.get_untracked();
                match cfg.get(&format!("{doc_path}.cid")) {
                    Some(cid) => {
                        state.push_output(tf("doc-cid-value", &[("path", &doc_path), ("cid", cid)]))
                    }
                    None => state.push_output(tf("doc-cid-not-set", &[("path", &doc_path)])),
                }
                Ok(())
            }

            // :fetch <cid> — import content, no editor, no execution
            "fetch" => {
                if args.len() != 1 {
                    return Err(t("doc-fetch-usage"));
                }
                let cid = args[0].clone();
                let state2 = state.clone();
                let config2 = config.clone();
                let doc_path2 = doc_path.clone();
                leptos::task::spawn_local(async move {
                    match fetch_from_gateway(&cid).await {
                        Ok(text) => {
                            config2.update(|c| {
                                c.set(&format!("{doc_path2}.content"), &text);
                                c.set(&format!("{doc_path2}.cid"), &cid);
                            });
                            state2.push_system(tf(
                                "doc-fetch-done",
                                &[("cid", &cid), ("path", &doc_path2)],
                            ));
                        }
                        Err(e) => {
                            state2.push_error(tf("doc-fetch-failed", &[("cid", &cid), ("e", &e)]));
                        }
                    }
                });
                Ok(())
            }

            other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
        }
    // ── .my.i18n:list ─────────────────────────────────────────────────────
    } else if path == ".my.i18n" && verb == "list" {
        let mut lines = vec![t("lang-list-header")];
        for (code, name) in crate::i18n::SUPPORTED_LANGS {
            lines.push(format!("  {code:<20} {name}"));
        }
        state.push_system(lines.join("\n"));
        Ok(())
    } else {
        Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
    }
}

// ── Helpers ────────────────────────────────────────────────────────────────

fn lang_for_content_type(ct: &str) -> &'static str {
    if ct.contains("markdown") {
        "markdown"
    } else if ct.contains("yaml") {
        "yaml"
    } else {
        "plain"
    }
}

fn discover_fetch_hint(err: &str) -> &'static str {
    if err.contains("HTTP 404") {
        "Hint: endpoint not found. Check that `ma` is running and exposes /status.json on port 5003."
    } else if err.contains("HTTP 5") {
        "Hint: runtime answered with server error. Check `ma` logs and retry."
    } else if err.contains("TypeError") || err.contains("Failed to fetch") {
        "Hint: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser."
    } else {
        "Hint: verify `ma` and IPFS Desktop are running, then retry `.my.ma:discover`."
    }
}

fn format_publish_error(err: &str) -> String {
    let (code, hint) = classify_publish_error(err);
    format!("publish failed [{code}]: {err}\nHint: {hint}")
}

fn classify_publish_error(err: &str) -> (&'static str, &'static str) {
    let lower = err.to_ascii_lowercase();

    if lower.contains("not logged in") {
        (
            "session",
            "log in again so ego can access your identity keys",
        )
    } else if lower.contains("unknown alias") || lower.contains("expected bare did") {
        (
            "target",
            "use a valid publisher DID or alias that resolves to bare did:ma:<ipns>",
        )
    } else if lower.contains("http") || lower.contains("fetch") || lower.contains("connect") {
        (
            "network",
            "verify ma runtime and IPFS are reachable, then retry",
        )
    } else if lower.contains("outbox") || lower.contains("resolve") || lower.contains("did") {
        (
            "resolve",
            "verify the publisher DID document is published and contains a reachable endpoint",
        )
    } else if lower.contains("acl") || lower.contains("denied") || lower.contains("forbidden") {
        ("acl", "ask the publisher operator to allow your DID in ACL")
    } else if lower.contains("plugin") || lower.contains("handle_cast") || lower.contains(":error")
    {
        (
            "runtime",
            "runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime",
        )
    } else if lower.contains("ipfs") || lower.contains("kubo") || lower.contains("cid") {
        (
            "ipfs",
            "check local Kubo/IPFS health and publisher runtime status",
        )
    } else {
        (
            "unknown",
            "inspect runtime logs for detailed cause and retry",
        )
    }
}

/// Fetch raw text from any URL.
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

/// Fetch raw text bytes from an IPFS gateway.
/// Uses the dweb.link gateway (same resolver as transport layer).
async fn fetch_from_gateway(cid: &str) -> Result<String, String> {
    fetch_url_text(&format!("https://dweb.link/ipfs/{cid}")).await
}

/// POST a JSON string body to `url` and return the HTTP status code.
async fn fetch_post_json(url: &str, body: &str) -> Result<u16, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;

    let window = web_sys::window().ok_or("no window")?;
    let headers = web_sys::Headers::new().map_err(|e| format!("{e:?}"))?;
    headers
        .set("Content-Type", "application/json")
        .map_err(|e| format!("{e:?}"))?;
    let opts = web_sys::RequestInit::new();
    opts.set_method("POST");
    opts.set_body(&wasm_bindgen::JsValue::from_str(body));
    opts.set_headers(&headers);
    let request =
        web_sys::Request::new_with_str_and_init(url, &opts).map_err(|e| format!("{e:?}"))?;
    let promise = window.fetch_with_request(&request);
    let resp_val = JsFuture::from(promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    Ok(resp.status())
}
