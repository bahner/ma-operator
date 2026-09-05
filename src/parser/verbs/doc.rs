use super::resolve_bare_did;
use crate::config::OperatorConfig;
use crate::core::CommandStatus;
use crate::http::fetch_path_text;
use crate::i18n::{t, tf};
use crate::parser::command::{parse, Command, DotOp};
use crate::state::{AppState, AwaitingReply};
use crate::transport;
use crate::views::editor::EditorContext;
use leptos::prelude::*;
use std::collections::BTreeMap;

pub(super) fn handle_doc(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
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
        "eval" => doc_eval(path, args, state, config, on_eval),
        "publish" if path == ".z" => z_tree_publish(args, state, config),
        "publish" => doc_publish(path, args, state, config),
        "publish-ipld" => doc_publish_ipld(path, args, state, config),
        "cid" => doc_cid(path, args, state, config),
        "fetch" => doc_fetch(path, args, state, config),
        other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
    }
}

/// Publish the direct `.z.<name>` source leaves and their DAG-CBOR root.
fn z_tree_publish(
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
) -> Result<(), String> {
    if args.len() != 1 {
        return Err(t("doc-publish-usage"));
    }
    let cfg = config.get_untracked();
    let publisher = resolve_bare_did(&args[0], &cfg)?;
    let parts = z_tree_parts(&cfg);
    if parts.is_empty() {
        return Err(tf("doc-content-empty", &[("path", ".z")]));
    }

    let cmd_id = state.push_command(format!(".z!publish {}", args[0]));
    let state2 = state.clone();
    let username = state
        .session
        .get_untracked()
        .map(|session| session.username)
        .unwrap_or_default();
    leptos::task::spawn_local(async move {
        match publish_z_tree_and_select(&publisher, parts, &username, config).await {
            Ok(manifest_ref) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Replied(String::new()));
                state2.push_system(tf(
                    "msg-set",
                    &[("path", ".my.z"), ("value", &manifest_ref)],
                ));
            }
            Err(error) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(error.clone()));
                state2.push_error(tf(
                    "doc-publish-failed",
                    &[("path", ".z"), ("e", &format_publish_error(&error))],
                ));
            }
        }
    });
    Ok(())
}

pub(crate) fn z_tree_parts(cfg: &OperatorConfig) -> BTreeMap<String, String> {
    const PREFIX: &str = ".z.";
    cfg.list(PREFIX)
        .into_iter()
        .filter_map(|(path, value)| {
            let name = path.strip_prefix(PREFIX)?;
            (!name.is_empty() && !name.contains('.') && !value.is_empty())
                .then(|| (name.to_string(), value.to_string()))
        })
        .collect()
}

pub(crate) async fn publish_z_tree_and_select(
    publisher: &str,
    parts: BTreeMap<String, String>,
    username: &str,
    config: RwSignal<OperatorConfig>,
) -> Result<String, String> {
    let manifest_cid = publish_z_tree(publisher, parts).await?;
    let manifest_ref = format!("/ipfs/{manifest_cid}");
    config.update(|cfg| cfg.set(".my.z", &manifest_ref));
    let cfg = config.get_untracked();
    crate::config::persist_config(username, &cfg).await?;
    Ok(manifest_ref)
}

async fn publish_z_tree(
    publisher: &str,
    parts: BTreeMap<String, String>,
) -> Result<String, String> {
    let mut manifest = BTreeMap::new();
    for (name, source) in parts {
        let path = format!(".z.{name}");
        let cid = match z_tree_source_cid(&source) {
            Some(cid) => match crate::doc_link::resolve_doc_link(&source)
                .await
                .map_err(|error| format!("{path}: {error}"))?
            {
                crate::doc_link::ResolvedDocContent::Text(text) => {
                    let _content_length = text.len();
                    cid
                }
                crate::doc_link::ResolvedDocContent::Manifest(parts) => {
                    return Err(format!(
                        "{path}: expected text content, found a DAG-CBOR manifest with {} entries",
                        parts.len()
                    ));
                }
            },
            None => store_and_wait(publisher, source.into_bytes(), "text/plain")
                .await
                .map_err(|error| format!("{path}: {error}"))?,
        };
        manifest.insert(name, cid);
    }
    let bytes = serde_ipld_dagcbor::to_vec(&manifest).map_err(|error| error.to_string())?;
    store_and_wait(publisher, bytes, "application/vnd.ipld.dag-cbor").await
}

fn z_tree_source_cid(source: &str) -> Option<String> {
    crate::doc_link::parse_link_cid(source).map(|cid| cid.to_string())
}

async fn store_and_wait(
    publisher: &str,
    content: Vec<u8>,
    content_type: &str,
) -> Result<String, String> {
    let mut receiver = None;
    let mut registered_id = None;
    let send_result =
        transport::send_ipfs_store_with_msg_id(publisher, content, content_type, |msg_id| {
            registered_id = Some(msg_id.clone());
            receiver = Some(AwaitingReply::register(msg_id));
        })
        .await;
    if let Err(error) = send_result {
        if let Some(msg_id) = registered_id {
            AwaitingReply::take(&msg_id);
        }
        return Err(error);
    }
    let receiver = receiver.ok_or_else(|| "IPFS store reply was not registered".to_string())?;
    let reply = receiver
        .await
        .map_err(|_| "IPFS store reply was cancelled".to_string())??;
    let cid = reply.trim().strip_prefix("/ipfs/").unwrap_or(reply.trim());
    cid::Cid::try_from(cid)
        .map(|parsed| parsed.to_string())
        .map_err(|_| format!("IPFS store returned an invalid CID: {reply}"))
}

// ── Verb handlers ─────────────────────────────────────────────────────────

/// `:edit` — open with stored content, or fetch a CID for review (never exec).
fn doc_edit(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
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

/// `!eval [content-path]` — optionally fetch, store, then execute local content.
fn doc_eval(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    if args.len() > 1 {
        return Err(t("doc-fetch-usage"));
    }
    let source = args.first().cloned();
    if source.is_none()
        && config
            .get_untracked()
            .get(path)
            .unwrap_or_default()
            .is_empty()
    {
        return Err(tf("doc-content-empty", &[("path", path)]));
    }
    let display = source.as_ref().map_or_else(
        || format!("{path}!eval"),
        |source| format!("{path}!eval {source}"),
    );
    let cmd_id = state.push_command(display);
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        let result = async {
            if let Some(source) = source {
                fetch_to_path(&source, &path2, &state2, config).await?;
            }
            let content = config
                .get_untracked()
                .get(&path2)
                .unwrap_or_default()
                .to_string();
            eval_content(&content, &state2, config, on_eval).await
        }
        .await;
        match result {
            Ok(()) => state2.resolve_command_by_id(cmd_id, CommandStatus::Replied(String::new())),
            Err(error) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(error.clone()));
                state2.push_error(format!("{path2}!eval: {error}"));
            }
        }
    });
    Ok(())
}

async fn fetch_to_path(
    source: &str,
    path: &str,
    state: &AppState,
    config: RwSignal<OperatorConfig>,
) -> Result<(), String> {
    let content = fetch_path_text(source)
        .await
        .map_err(|error| tf("doc-fetch-failed", &[("cid", source), ("e", &error)]))?;
    config.update(|cfg| cfg.set(path, content));
    let username = state
        .session
        .get_untracked()
        .map(|session| session.username)
        .unwrap_or_default();
    let cfg = config.get_untracked();
    crate::config::persist_config(&username, &cfg).await
}

async fn eval_content(
    content: &str,
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    if needs_sequential_eval(content) {
        eval_document_content(content, state, config, on_eval).await
    } else {
        on_eval.run(content.to_string());
        Ok(())
    }
}

fn needs_sequential_eval(content: &str) -> bool {
    first_document_source_line(content).is_some_and(|line| line.starts_with('('))
        || content.lines().map(str::trim).any(is_sync_batch_delimiter)
        || content.lines().any(|line| {
            line.split_whitespace()
                .next()
                .is_some_and(|head| head.contains("!eval"))
        })
}

fn first_document_source_line(content: &str) -> Option<&str> {
    content
        .lines()
        .map(str::trim)
        .find(|line| !line.is_empty() && !line.starts_with(';'))
}

async fn eval_document_content(
    content: &str,
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    let text = content;

    if first_document_source_line(text).is_some_and(|line| line.starts_with('(')) {
        return crate::scheme::load_content(text, state, config).await;
    }

    for line in text
        .lines()
        .map(str::trim)
        .filter(|line| !line.is_empty() && !line.starts_with(';') && !is_sync_batch_delimiter(line))
    {
        let cfg = config.get_untracked();
        let command = parse(line, &cfg).map_err(|error| format!("'{line}': {error}"))?;
        let nested_path = match command {
            Command::DotCommand {
                path,
                op: DotOp::Meta(verb),
                args,
            }
            | Command::LocalCrud {
                path,
                op: DotOp::Meta(verb),
                args,
            } if verb == "eval" && args.is_empty() => Some(path),
            _ => None,
        };
        if let Some(path) = nested_path {
            let nested_content = config
                .get_untracked()
                .get(&path)
                .ok_or_else(|| tf("doc-content-empty", &[("path", &path)]))?
                .to_string();
            Box::pin(eval_document_content(
                &nested_content,
                state,
                config,
                on_eval,
            ))
            .await?;
        } else {
            on_eval.run(line.to_string());
        }
    }
    Ok(())
}

fn is_sync_batch_delimiter(line: &str) -> bool {
    matches!(line, ".batch!sync" | ".batch")
}

/// Validate publish args, resolve publisher DID, and read content.
/// Returns `(publisher_did, content_str)` or a user-facing error.
fn read_publish_args(
    path: &str,
    args: &[String],
    usage_err_key: &str,
    cfg: &OperatorConfig,
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
    config: RwSignal<OperatorConfig>,
) -> Result<(), String> {
    doc_publish_plain(path, args, state, config, "publish")
}

fn doc_publish_plain(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
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
    config: RwSignal<OperatorConfig>,
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
    config: RwSignal<OperatorConfig>,
) -> Result<(), String> {
    doc_publish_plain(path, args, state, config, "cid")
}

/// `:fetch <cid>` — import content from gateway; no editor, no execution.
fn doc_fetch(
    path: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
) -> Result<(), String> {
    if args.len() != 1 {
        return Err(t("doc-fetch-usage"));
    }
    let cid = args[0].clone();
    let state2 = state.clone();
    let path2 = path.to_string();
    leptos::task::spawn_local(async move {
        match fetch_to_path(&cid, &path2, &state2, config).await {
            Ok(()) => {
                state2.push_system(tf("doc-fetch-done", &[("cid", &cid), ("path", &path2)]));
            }
            Err(error) => state2.push_error(error),
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
    fn commented_scheme_source_uses_its_first_form_for_detection() {
        let source = ";; local zscheme library\n; loaded at startup\n\n(define value 1)\n";

        assert_eq!(first_document_source_line(source), Some("(define value 1)"));
        assert!(needs_sequential_eval(source));
    }

    #[test]
    fn local_sync_batch_delimiters_are_sequential_eval_control_lines() {
        let source = ".batch!sync\n.z.stdlib!eval\n.batch\n";

        assert!(needs_sequential_eval(source));
        assert!(is_sync_batch_delimiter(".batch!sync"));
        assert!(is_sync_batch_delimiter(".batch"));
        assert!(!is_sync_batch_delimiter(".batch!async"));
    }

    #[test]
    fn z_tree_parts_collects_direct_source_leaves_only() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".z.stdlib", "(define x 1)");
        cfg.set(
            ".z.runtime",
            "/ipfs/bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy",
        );
        cfg.set(".my.z", "/ipfs/bafyreimanifest");
        cfg.set(".z.runtime.debug", "ignored");

        let parts = z_tree_parts(&cfg);

        assert_eq!(parts.len(), 2);
        assert_eq!(parts.get("stdlib"), Some(&"(define x 1)".to_string()));
        assert!(parts.contains_key("runtime"));
    }

    #[test]
    fn z_tree_source_cid_canonicalises_existing_links() {
        let cid = "bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy";

        assert_eq!(
            z_tree_source_cid(&format!("/ipfs/{cid}")),
            Some(cid.to_string())
        );
        assert_eq!(z_tree_source_cid("(define x 1)"), None);
    }

    #[test]
    fn z_tree_manifest_encodes_as_the_startup_map_shape() {
        let mut manifest = BTreeMap::new();
        manifest.insert(
            "stdlib".to_string(),
            "bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy".to_string(),
        );

        let bytes = serde_ipld_dagcbor::to_vec(&manifest).expect("manifest should encode");
        let decoded: BTreeMap<String, String> =
            serde_ipld_dagcbor::from_slice(&bytes).expect("manifest should decode");

        assert_eq!(decoded, manifest);
    }

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
