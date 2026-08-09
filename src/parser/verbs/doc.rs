use super::resolve_bare_did;
use crate::config::EgoConfig;
use crate::http::fetch_path_text;
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
        "cid" => doc_cid(path, args, state, config),
        "fetch" => doc_fetch(path, args, state, config),
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
        let content = cfg.get(path).unwrap_or_default().to_string();
        show_editor.set(Some(
            EditorContext::new(path, content).with_language("plain"),
        ));
    } else {
        let cid = args[0].clone();
        let state2 = state.clone();
        let path2 = path.to_string();
        leptos::task::spawn_local(async move {
            match fetch_path_text(&cid).await {
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

/// `:eval` — execute saved content as an ordinary Zion script.
///
/// A link value (bare CID, or `/ipfs/`/`/ipld/`-prefixed) is fetched and
/// resolved before evaluation; literal content evaluates unchanged. The
/// editor callback submits it through the same path as a multi-line paste.
fn doc_eval(
    path: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    let content = config
        .get_untracked()
        .get(path)
        .unwrap_or_default()
        .to_string();
    if content.is_empty() {
        return Err(tf("doc-content-empty", &[("path", path)]));
    }
    state.push_command_done(format!("{path}!eval"));
    // Literal content stays fully synchronous, unchanged from before link
    // resolution existed. Only a recognised link value needs a fetch.
    if crate::doc_link::parse_link_cid(&content).is_none() {
        on_eval.run(content);
        return Ok(());
    }
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        match crate::doc_link::resolve_doc_link(&content).await {
            Ok(crate::doc_link::ResolvedDocContent::Text(text)) => on_eval.run(text),
            Ok(crate::doc_link::ResolvedDocContent::Manifest(_)) => {
                state2.push_error(tf("doc-eval-manifest", &[("path", &path2)]));
            }
            Err(e) => {
                state2.push_error(tf("doc-link-fetch-failed", &[("path", &path2), ("e", &e)]));
            }
        }
    });
    Ok(())
}

/// Validate publish args, resolve publisher DID, and read content.
/// Returns `(publisher_did, content_str)` or a user-facing error.
fn read_publish_args(
    path: &str,
    args: &[String],
    usage_err_key: &str,
    cfg: &EgoConfig,
) -> Result<(String, String), String> {
    if args.len() != 1 {
        return Err(t(usage_err_key));
    }
    let publisher = resolve_bare_did(&args[0], cfg)?;
    let content = cfg.get(path).unwrap_or_default().to_string();
    if content.is_empty() {
        return Err(tf("doc-save-first", &[("path", path)]));
    }
    Ok((publisher, content))
}

/// `:publish <publisher>` — store content as a plain IPFS blob.
fn doc_publish(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    doc_publish_plain(path, args, state, config, "publish")
}

fn doc_publish_plain(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    verb: &str,
) -> Result<(), String> {
    let cfg = config.get_untracked();
    let (publisher, content_str) = read_publish_args(path, args, "doc-publish-usage", &cfg)?;
    let content_bytes = content_str.into_bytes();
    let display = format!("{path}!{verb} {}", args.join(" "));
    let cmd_id = state.push_command(display);
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        match transport::send_ipfs_store(&publisher, content_bytes, "text/plain").await {
            Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
            Err(e) => {
                state2.resolve_command_by_id(
                    cmd_id,
                    crate::core::CommandStatus::Error(format_publish_error(&e)),
                );
                state2.push_error(tf(
                    "doc-publish-failed",
                    &[("path", &path2), ("e", &format_publish_error(&e))],
                ));
            }
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
    let cfg = config.get_untracked();
    let (publisher, content_str) = read_publish_args(path, args, "doc-publish-ipld-usage", &cfg)?;
    let dag_cbor = crate::messages::yaml_to_dag_cbor(&content_str)
        .map_err(|e| tf("doc-publish-ipld-error", &[("e", &e)]))?;
    let display = format!("{path}!publish-ipld {}", args.join(" "));
    let cmd_id = state.push_command(display);
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        match transport::send_ipfs_store(&publisher, dag_cbor, "application/vnd.ipld.dag-cbor")
            .await
        {
            Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
            Err(e) => {
                state2.resolve_command_by_id(
                    cmd_id,
                    crate::core::CommandStatus::Error(format_publish_error(&e)),
                );
                state2.push_error(tf(
                    "doc-ipld-store-failed",
                    &[("path", &path2), ("e", &format_publish_error(&e))],
                ));
            }
        }
    });
    Ok(())
}

/// `:cid <publisher>` — publish and print the returned CID reply.
fn doc_cid(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    doc_publish_plain(path, args, state, config, "cid")
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
        match fetch_path_text(&cid).await {
            Ok(text) => {
                config.update(|c| c.set(&path2, &text));
                state2.push_system(tf("doc-fetch-done", &[("cid", &cid), ("path", &path2)]));
            }
            Err(e) => state2.push_error(tf("doc-fetch-failed", &[("cid", &cid), ("e", &e)])),
        }
    });
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
    let (code, hint_key) = classify_publish_error(err);
    let hint = t(hint_key);
    let detail = tf("doc-publish-error-detail", &[("code", code), ("err", err)]);
    let hint_line = tf("doc-publish-error-hint", &[("hint", &hint)]);
    format!("{detail}\n{hint_line}")
}

pub(super) fn classify_publish_error(err: &str) -> (&'static str, &'static str) {
    let lower = err.to_ascii_lowercase();

    if lower.contains("not logged in") {
        ("session", "doc-publish-hint-session")
    } else if lower.contains("unknown alias") || lower.contains("expected bare did") {
        ("target", "doc-publish-hint-target")
    } else if lower.contains("http") || lower.contains("fetch") || lower.contains("connect") {
        ("network", "doc-publish-hint-network")
    } else if lower.contains("outbox") || lower.contains("resolve") || lower.contains("did") {
        ("resolve", "doc-publish-hint-resolve")
    } else if lower.contains("acl") || lower.contains("denied") || lower.contains("forbidden") {
        ("acl", "doc-publish-hint-acl")
    } else if lower.contains("plugin") || lower.contains("handle_cast") || lower.contains(":error")
    {
        ("runtime", "doc-publish-hint-runtime")
    } else if lower.contains("ipfs") || lower.contains("kubo") || lower.contains("cid") {
        ("ipfs", "doc-publish-hint-ipfs")
    } else {
        ("unknown", "doc-publish-hint-unknown")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn classify_publish_error_identifies_session_errors() {
        assert_eq!(
            classify_publish_error("not logged in"),
            ("session", "doc-publish-hint-session")
        );
    }

    #[test]
    fn classify_publish_error_identifies_target_errors() {
        assert_eq!(
            classify_publish_error("unknown alias @runtime"),
            ("target", "doc-publish-hint-target")
        );
    }

    #[test]
    fn classify_publish_error_identifies_network_errors() {
        assert_eq!(
            classify_publish_error("failed to fetch"),
            ("network", "doc-publish-hint-network")
        );
    }

    #[test]
    fn classify_publish_error_identifies_fallback() {
        assert_eq!(
            classify_publish_error("boom"),
            ("unknown", "doc-publish-hint-unknown")
        );
    }
}
