use leptos::prelude::*;
use crate::config::EgoConfig;
use crate::http::fetch_cid_text;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport;
use crate::views::editor::EditorContext;
use super::resolve_bare_did;

pub(super) fn handle_doc(path: &str, verb: &str, args: &[String], state: &AppState,
    config: RwSignal<EgoConfig>, show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>) -> Result<(), String> {
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
                let show_editor2 = show_editor;
                let doc_path2 = doc_path.clone();
                leptos::task::spawn_local(async move {
                    match fetch_cid_text(&cid).await {
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

        // :eval-sync — same as :eval but dispatches lines sequentially:
        // each line waits for the previous command to complete before
        // the next is dispatched. Useful for multi-step publish flows.
        "eval-sync" => {
            let cfg = config.get_untracked();
            let content = cfg
                .get(&format!("{doc_path}.content"))
                .unwrap_or_default()
                .to_string();
            if content.is_empty() {
                return Err(tf("doc-content-empty", &[("path", &doc_path)]));
            }
            let lines: std::collections::VecDeque<String> = content
                .lines()
                .map(|l| l.trim().to_string())
                .filter(|l| !l.is_empty() && !l.starts_with('#'))
                .collect();
            if lines.is_empty() {
                return Err(tf("doc-content-empty", &[("path", &doc_path)]));
            }
            state.push_command_done(format!("{doc_path}:eval-sync"));
            state.start_batch(lines);
            // Kick off the first line via batch_next_line signal.
            if let Some(first) = state.next_batch_line() {
                state.batch_next_line.set(Some(first));
            }
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
            let config2 = config;
            let doc_path2 = doc_path.clone();
            leptos::task::spawn_local(async move {
                match fetch_cid_text(&cid).await {
                    Ok(text) => {
                        config2.update(|c| {
                            c.set(format!("{doc_path2}.content"), &text);
                            c.set(format!("{doc_path2}.cid"), &cid);
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

        // :cat / :head / :tail / :wc — view stored content inline
        "cat" | "head" | "tail" | "wc" => {
            let cfg = config.get_untracked();
            let content = cfg
                .get(&format!("{doc_path}.content"))
                .unwrap_or_default()
                .to_string();
            if content.is_empty() {
                return Err(tf("doc-content-empty", &[("path", &doc_path)]));
            }
            let str_args: Vec<&str> = args.iter().map(String::as_str).collect();
            for line in crate::cid_ops::apply(verb, &content, &str_args) {
                state.push_output(line);
            }
            Ok(())
        }

        other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
    }
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
