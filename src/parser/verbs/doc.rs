use super::resolve_bare_did;
use crate::config::EgoConfig;
use crate::http::fetch_cid_text;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport;
use crate::views::editor::EditorContext;
use leptos::prelude::*;

pub(super) fn handle_doc(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    if path == ".my.i18n" && verb == "list" {
        let mut lines = vec![t("lang-list-header")];
        for (code, name) in crate::i18n::SUPPORTED_LANGS {
            lines.push(format!("  {code:<20} {name}"));
        }
        state.push_system(lines.join("\n"));
        return Ok(());
    }
    match verb {
        "edit" => doc_edit(path, args, state, config, show_editor),
        "eval" => doc_eval(path, state, config, on_eval),
        "publish" => doc_publish(path, args, state, config),
        "publish-ipld" => doc_publish_ipld(path, args, state, config),
        "cid" => doc_cid(path, state, config),
        "fetch" => doc_fetch(path, args, state, config),
        "cat" | "head" | "tail" | "wc" => doc_view(path, verb, args, state, config),
        other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
    }
}

// ── Verb handlers ─────────────────────────────────────────────────────────

/// `:edit` — open with stored content, or fetch a CID for review (never exec).
fn doc_edit(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
) -> Result<(), String> {
    let cfg = config.get_untracked();
    if args.is_empty() {
        let content = cfg
            .get(&format!("{path}.content"))
            .unwrap_or_default()
            .to_string();
        let lang = lang_for_content_type(
            cfg.get(&format!("{path}.content_type"))
                .unwrap_or("text/plain"),
        );
        show_editor.set(Some(EditorContext::new(path, content).with_language(lang)));
    } else {
        let cid = args[0].clone();
        let state2 = state.clone();
        let path2 = path.to_string();
        leptos::task::spawn_local(async move {
            match fetch_cid_text(&cid).await {
                Ok(text) => {
                    state2.push_system(tf("msg-fetch-review", &[("cid", &cid)]));
                    show_editor.set(Some(EditorContext::new(path2, text).with_language("plain")));
                }
                Err(e) => state2.push_error(tf("msg-fetch-failed", &[("cid", &cid), ("e", &e)])),
            }
        });
    }
    Ok(())
}

/// `:eval` — execute the saved `.content` line-by-line.
fn doc_eval(
    path: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    let content = config
        .get_untracked()
        .get(&format!("{path}.content"))
        .unwrap_or_default()
        .to_string();
    if content.is_empty() {
        return Err(tf("doc-content-empty", &[("path", path)]));
    }
    state.push_command_done(format!("{path}:eval"));
    on_eval.run(content);
    Ok(())
}

/// `:publish <publisher>` — store content as a plain IPFS blob.
fn doc_publish(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    if args.len() != 1 {
        return Err(t("doc-publish-usage"));
    }
    let cfg = config.get_untracked();
    let publisher = resolve_bare_did(&args[0], &cfg)?;
    let content_str = cfg
        .get(&format!("{path}.content"))
        .unwrap_or_default()
        .to_string();
    if content_str.is_empty() {
        return Err(tf("doc-save-first", &[("path", path)]));
    }
    let content_type = cfg
        .get(&format!("{path}.content_type"))
        .unwrap_or("text/plain")
        .to_string();
    let content_bytes = content_str.into_bytes();
    let state2 = state.clone();
    let path2 = path.to_string();
    let publisher_disp = publisher.clone();
    leptos::task::spawn_local(async move {
        match transport::send_ipfs_store(&publisher, content_bytes, &content_type).await {
            Ok(msg_id) => state2.push_system(tf(
                "doc-store-sent",
                &[("id", &msg_id), ("pub", &publisher_disp)],
            )),
            Err(e) => state2.push_error(tf(
                "doc-publish-failed",
                &[("path", &path2), ("e", &format_publish_error(&e))],
            )),
        }
    });
    Ok(())
}

/// `:publish-ipld <publisher>` — convert YAML to DAG-CBOR and store as IPLD node.
fn doc_publish_ipld(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    if args.len() != 1 {
        return Err(t("doc-publish-ipld-usage"));
    }
    let cfg = config.get_untracked();
    let publisher = resolve_bare_did(&args[0], &cfg)?;
    let content_str = cfg
        .get(&format!("{path}.content"))
        .unwrap_or_default()
        .to_string();
    if content_str.is_empty() {
        return Err(tf("doc-save-first", &[("path", path)]));
    }
    let dag_cbor = crate::messages::yaml_to_dag_cbor(&content_str)
        .map_err(|e| tf("doc-publish-ipld-error", &[("e", &e)]))?;
    let state2 = state.clone();
    let path2 = path.to_string();
    let publisher_disp = publisher.clone();
    leptos::task::spawn_local(async move {
        match transport::send_ipfs_store(&publisher, dag_cbor, "application/vnd.ipld.dag-cbor")
            .await
        {
            Ok(msg_id) => state2.push_system(tf(
                "doc-ipld-store-sent",
                &[("id", &msg_id), ("pub", &publisher_disp)],
            )),
            Err(e) => state2.push_error(tf(
                "doc-ipld-store-failed",
                &[("path", &path2), ("e", &format_publish_error(&e))],
            )),
        }
    });
    Ok(())
}

/// `:cid` — display the stored CID.
fn doc_cid(path: &str, state: &AppState, config: RwSignal<EgoConfig>) -> Result<(), String> {
    let cfg = config.get_untracked();
    match cfg.get(&format!("{path}.cid")) {
        Some(cid) => state.push_output(tf("doc-cid-value", &[("path", path), ("cid", cid)])),
        None => state.push_output(tf("doc-cid-not-set", &[("path", path)])),
    }
    Ok(())
}

/// `:fetch <cid>` — import content from gateway; no editor, no execution.
fn doc_fetch(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    if args.len() != 1 {
        return Err(t("doc-fetch-usage"));
    }
    let cid = args[0].clone();
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        match fetch_cid_text(&cid).await {
            Ok(text) => {
                config.update(|c| {
                    c.set(format!("{path2}.content"), &text);
                    c.set(format!("{path2}.cid"), &cid);
                });
                state2.push_system(tf("doc-fetch-done", &[("cid", &cid), ("path", &path2)]));
            }
            Err(e) => state2.push_error(tf("doc-fetch-failed", &[("cid", &cid), ("e", &e)])),
        }
    });
    Ok(())
}

/// `:cat` / `:head` / `:tail` / `:wc` — view stored content inline.
fn doc_view(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let content = config
        .get_untracked()
        .get(&format!("{path}.content"))
        .unwrap_or_default()
        .to_string();
    if content.is_empty() {
        return Err(tf("doc-content-empty", &[("path", path)]));
    }
    let str_args: Vec<&str> = args.iter().map(String::as_str).collect();
    for line in crate::cid_ops::apply(verb, &content, &str_args) {
        state.push_output(line);
    }
    Ok(())
}

// ── Helpers ───────────────────────────────────────────────────────────────

pub(super) fn lang_for_content_type(ct: &str) -> &'static str {
    if ct.contains("markdown") {
        "markdown"
    } else if ct.contains("yaml") {
        "yaml"
    } else {
        "plain"
    }
}

pub(super) fn format_publish_error(err: &str) -> String {
    let (code, hint) = classify_publish_error(err);
    format!("publish failed [{code}]: {err}\nHint: {hint}")
}

pub(super) fn classify_publish_error(err: &str) -> (&'static str, &'static str) {
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
        ("runtime", "runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime")
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
