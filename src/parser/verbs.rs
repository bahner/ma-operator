/// Per-key local verb registry.
///
/// `:verb` invocations on local dot-paths (`.path:verb [args]`) are
/// dispatched here. Each entry is `(path, verb)` and maps to an async
/// handler. Unknown `(path, verb)` pairs are an error.
use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::state::AppState;
use crate::transport;
use crate::views::editor::EditorContext;

/// Resolve an argument that should refer to a bare `did:ma:<ipns>` (no
/// fragment, no path). Accepts either an alias name or a literal DID.
fn resolve_bare_did(arg: &str, cfg: &EgoConfig) -> Result<String, String> {
    let raw = arg.trim_start_matches('@');
    let resolved = if raw.starts_with("did:") {
        raw.to_string()
    } else {
        cfg.resolve_alias(raw)
            .map(|s| s.to_string())
            .ok_or_else(|| format!("unknown alias: @{raw}"))?
    };
    if resolved.contains('#') || resolved.contains('/') {
        return Err(format!(
            "expected bare did:ma:<ipns> (no fragment or path), got {resolved}"
        ));
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
    // ── .my.identity ──────────────────────────────────────────────────────
    if path == ".my.identity" && verb == "publish" {
        if args.len() != 1 {
            return Err("usage: .my.identity:publish <did-or-alias>".into());
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
                    state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                    state2.push_error(format!("publish failed: {e}"));
                }
            }
        });
        return Ok(());
    }

    // ── .my.documents.<name>:<verb> ───────────────────────────────────────
    if let Some(doc_name) = path.strip_prefix(".my.documents.") {
        if doc_name.is_empty() {
            return Err("missing document name".into());
        }
        let doc_path = path.to_string(); // e.g. ".my.documents.readme"

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
                                state2.push_system(format!("fetched {cid} — review before eval"));
                                show_editor2.set(Some(
                                    EditorContext::new(doc_path2, text).with_language("plain"),
                                ));
                            }
                            Err(e) => {
                                state2.push_error(format!("fetch {cid}: {e}"));
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
                    return Err(format!("{doc_path}.content is empty"));
                }
                state.push_command_done(format!("{doc_path}:eval"));
                on_eval.run(content);
                Ok(())
            }

            // :publish <@publisher-or-did>
            "publish" => {
                if args.len() != 1 {
                    return Err("usage: .my.documents.<name>:publish <publisher>".into());
                }
                let cfg = config.get_untracked();
                let publisher = resolve_bare_did(&args[0], &cfg)?;
                let content_str = cfg
                    .get(&format!("{doc_path}.content"))
                    .unwrap_or_default()
                    .to_string();
                if content_str.is_empty() {
                    return Err(format!("{doc_path}.content is empty — save first"));
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
                            state2.push_system(format!(
                                "store request sent ({msg_id}) → {publisher_disp}; \
                                 CID will arrive via RPC reply"
                            ));
                            // Record pending msg_id so the reply handler can
                            // store the CID back into EgoConfig when it arrives.
                            // (Handled in the inbox polling loop via bind_message_id)
                        }
                        Err(e) => {
                            state2.push_error(format!("publish {doc_path2}: {e}"));
                        }
                    }
                });
                Ok(())
            }

            // :cid — display stored CID
            "cid" => {
                let cfg = config.get_untracked();
                match cfg.get(&format!("{doc_path}.cid")) {
                    Some(cid) => state.push_output(format!("{doc_path}.cid = {cid}")),
                    None => state.push_output(format!("{doc_path}.cid is not set")),
                }
                Ok(())
            }

            // :fetch <cid> — import content, no editor, no execution
            "fetch" => {
                if args.len() != 1 {
                    return Err("usage: .my.documents.<name>:fetch <cid>".into());
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
                            state2.push_system(format!(
                                "fetched {cid} → {doc_path2}.content (not executed)"
                            ));
                        }
                        Err(e) => {
                            state2.push_error(format!("fetch {cid}: {e}"));
                        }
                    }
                });
                Ok(())
            }

            other => Err(format!("no verb `{other}` for {path}")),
        }
    } else {
        Err(format!("no verb `{verb}` for {path}"))
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

/// Fetch raw text bytes from an IPFS gateway.
/// Uses the dweb.link gateway (same resolver as transport layer).
async fn fetch_from_gateway(cid: &str) -> Result<String, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;

    let url = format!("https://dweb.link/ipfs/{cid}");
    let window = web_sys::window().ok_or("no window")?;
    let promise = window.fetch_with_str(&url);
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
