//! Verb dispatch for local path commands.
//!
//! `/path!verb` — side-effect / system operation

mod acl;
mod doc;
mod identity;
mod inbox;
pub(crate) mod ma;
mod scheme;

use crate::config::EgoConfig;
use crate::i18n::tf;
use crate::state::{AppState, QrIntent};
use crate::views::editor::EditorContext;
use leptos::prelude::*;
use ma_core::Ipld;

/// Extract the `ma.profile` CID string from a resolved `Document`, if present.
pub(crate) fn doc_profile_cid(doc: &ma_core::Document) -> Option<String> {
    match &doc.ma {
        Some(Ipld::Map(map)) => match map.get("profile") {
            Some(Ipld::Link(c)) => Some(c.to_string()),
            Some(Ipld::String(s)) => Some(s.clone()),
            Some(Ipld::Map(link)) => match link.get("/") {
                Some(Ipld::String(s)) => Some(s.clone()),
                Some(Ipld::Link(c)) => Some(c.to_string()),
                _ => None,
            },
            _ => None,
        },
        _ => None,
    }
}

pub(crate) fn doc_trusted_ma(doc: &ma_core::Document) -> Option<String> {
    let Some(Ipld::Map(map)) = &doc.ma else {
        return None;
    };
    let Some(Ipld::String(did)) = map.get("ma") else {
        return None;
    };
    is_bare_ma_did(did).then(|| did.clone())
}

pub(crate) fn is_bare_ma_did(did: &str) -> bool {
    did.starts_with("did:ma:") && !did.contains('#') && !did.contains('/')
}

/// Resolve an argument that should refer to a bare `did:ma:<ipns>` (no
/// fragment, no path). Accepts either an alias name or a literal DID.
fn resolve_bare_did(arg: &str, cfg: &EgoConfig) -> Result<String, String> {
    let raw = arg.trim_start_matches('@');
    let resolved = if raw.starts_with("did:") {
        raw.to_string()
    } else {
        cfg.resolve_alias(raw)
            .map(std::string::ToString::to_string)
            .ok_or_else(|| tf("err-unknown-alias", &[("name", raw)]))?
    };
    if !is_bare_ma_did(&resolved) {
        return Err(tf("err-bare-did", &[("did", &resolved)]));
    }
    Ok(resolved)
}

/// Dispatch `/path!verb` — all verb / side-effect operations.
pub fn dispatch_meta(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    if verb == "qr" {
        if !path.starts_with(".my.") {
            return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
        }
        let cfg = config.get_untracked();
        if EgoConfig::is_read_only(path) {
            return Err(tf("msg-read-only", &[("path", path)]));
        }
        if cfg.has_children(path) {
            return Err(tf("msg-subtree-set", &[("path", path)]));
        }
        if cfg.has_leaf_ancestor(path) {
            return Err(tf("msg-ancestor-leaf", &[("path", path)]));
        }
        state.qr_intent.set(Some(QrIntent::Capture {
            path: path.to_string(),
        }));
        return Ok(());
    }

    if path == ".my.z.scheme" || path.starts_with(".my.z.scheme.") {
        return scheme::handle_scheme(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.inbox" || path.starts_with(".my.inbox.") {
        return inbox::handle_inbox(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".ma" || path.starts_with(".ma.") {
        return ma::handle_ma(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.acl" || path.starts_with(".my.acl.") {
        return acl::handle_acl(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.identity" || path.starts_with(".my.identity.") {
        return identity::handle_identity(path, verb, args, state, config, show_editor, on_eval);
    }
    if path == ".my.i18n" && verb == "list" {
        return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
    }
    // Content-management verbs work on any non-read-only path.
    if matches!(verb, "publish" | "publish-ipld" | "cid" | "fetch") {
        return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
    }
    // Universal content-based verb routing: works on any leaf path.
    let has_content = config.get_untracked().get(path).is_some();
    if has_content || verb == "edit" {
        match verb {
            "edit" | "eval" => {
                return doc::handle_doc(path, verb, args, state, config, show_editor, on_eval);
            }
            _ => {}
        }
    }
    // Scheme function call: any other verb on a leaf path.
    let content = if has_content {
        config
            .get_untracked()
            .get(path)
            .map(std::string::ToString::to_string)
    } else {
        None
    };
    if let Some(content) = content {
        let verb = verb.to_string();
        let args = args.to_vec();
        let state2 = state.clone();
        let path2 = path.to_string();
        wasm_bindgen_futures::spawn_local(async move {
            let display = if args.is_empty() {
                format!("{path2}!{verb}")
            } else {
                format!("{path2}!{verb} {}", args.join(" "))
            };
            state2.push_command_done(display);
            match crate::scheme::call_content(&content, &verb, &args, &state2, config).await {
                Ok(val) => {
                    let s = val.to_splice_lossy();
                    if !s.is_empty() {
                        state2.push_system(s);
                    }
                }
                Err(e) => state2.push_error(format!("{path2}!{verb}: {e}")),
            }
        });
        return Ok(());
    }
    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}

#[cfg(test)]
mod tests {
    use super::*;
    use ma_core::{MaExtension, SecretBundle};

    fn document_with_ma(value: Ipld) -> ma_core::Document {
        SecretBundle::generate()
            .build_document(MaExtension::new().kind("agent").extra("ma", value))
            .expect("document")
    }

    #[test]
    fn trusted_ma_accepts_bare_ma_did() {
        let doc = document_with_ma(Ipld::String("did:ma:trusted".to_string()));

        assert_eq!(doc_trusted_ma(&doc), Some("did:ma:trusted".to_string()));
    }

    #[test]
    fn trusted_ma_rejects_urls_fragments_and_other_did_methods() {
        let values = [
            "http://localhost:5003",
            "did:ma:trusted#root",
            "did:web:runtime.example",
        ];

        for value in values {
            let doc = document_with_ma(Ipld::String(value.to_string()));
            assert_eq!(doc_trusted_ma(&doc), None);
        }
    }
}
