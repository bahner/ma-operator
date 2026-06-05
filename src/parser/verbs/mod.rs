//! Verb dispatch for local dot-path commands (`.path:verb`).

mod acl;
mod doc;
mod identity;
mod inbox;
mod ma;
mod profiles;

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
    if path.starts_with(".my.doc.") || (path == ".my.i18n" && verb == "list") {
        return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
    }
    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}
