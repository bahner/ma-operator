//! Verb dispatch for local dot-path commands.
//!
//! `.path:verb` — user Scheme function call
//! `.path!verb` — system/side-effect operation (dispatched via `dispatch_meta`)

mod acl;
mod doc;
mod identity;
mod inbox;
mod ma;
mod profiles;
mod scheme;

use crate::config::EgoConfig;
use crate::i18n::tf;
use crate::state::AppState;
use crate::views::editor::EditorContext;
use leptos::prelude::*;
use ma_core::Ipld;

/// Extract the `ma.agent` CID string from a resolved `Document`, if present.
pub(crate) fn doc_agent_cid(doc: &ma_core::Document) -> Option<String> {
    match &doc.ma {
        Some(Ipld::Map(map)) => match map.get("agent") {
            Some(Ipld::String(s)) => Some(s.clone()),
            _ => None,
        },
        _ => None,
    }
}

/// Default base URL for the local `ma` daemon.
/// Override per-profile with `.my.ma.url: http://host:port`.
pub(super) const MA_URL: &str = "http://localhost:5003";

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
    if path == ".my.inbox" || path.starts_with(".my.inbox.") {
        return inbox::handle_inbox(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.ma" || path.starts_with(".my.ma.") {
        return ma::handle_ma(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.acl" || path.starts_with(".my.acl.") {
        return acl::handle_acl(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.identity" || path.starts_with(".my.identity.") {
        return identity::handle_identity(path, verb, args, state, config, show_editor, on_eval);
    }
    if path.starts_with(".profiles.") {
        return profiles::handle_profiles(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.i18n" && verb == "list" {
        return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
    }
    // Content-management verbs work on any non-read-only path.
    if matches!(verb, "publish" | "publish-ipld" | "cid" | "fetch") {
        return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
    }
    // Universal content-based verb routing: works on any path with .content.
    let has_content = config
        .get_untracked()
        .get(&format!("{path}.content"))
        .is_some();
    if has_content || verb == "edit" {
        match verb {
            "edit" | "eval" => {
                return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
            }
            _ => {}
        }
    }
    // Scheme function call fallback: any other verb on a path with .content.
    let content = if has_content {
        config
            .get_untracked()
            .get(&format!("{path}.content"))
            .map(|s| s.to_string())
    } else {
        None
    };
    if let Some(content) = content {
        {
            let verb = verb.to_string();
            let args = args.to_vec();
            let state2 = state.clone();
            let path2 = path.to_string();
            wasm_bindgen_futures::spawn_local(async move {
                let display = if args.is_empty() {
                    format!("{path2}:{verb}")
                } else {
                    format!("{path2}:{verb} {}", args.join(" "))
                };
                state2.push_command_done(display);
                match crate::scheme::call_content(&content, &verb, &args, &state2, config).await {
                    Ok(val) => {
                        let s = val.to_splice_lossy();
                        if !s.is_empty() {
                            state2.push_system(s);
                        }
                    }
                    Err(e) => state2.push_error(format!("{path2}:{verb}: {e}")),
                }
            });
            return Ok(());
        }
    }
    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}

/// Dispatch `.path!verb` — system/side-effect operations.
/// These are never Scheme function calls; they always have well-defined behaviour.
pub fn dispatch_meta(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    // .my.scheme — session environment image
    if path == ".my.scheme" || path.starts_with(".my.scheme.") {
        return scheme::handle_scheme(path, verb, args, state, config, show_editor, on_eval);
    }
    // All other paths: route to doc handler (edit, eval, publish, cid, fetch, …)
    doc::handle_doc(path, verb, args, state, config, show_editor, on_eval)
}
