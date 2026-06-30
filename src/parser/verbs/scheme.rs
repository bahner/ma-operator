/// Handler for `.my.scheme!verb` — session Scheme environment operations.
use crate::config::{persist_config, EgoConfig};
use crate::i18n::tf;
use crate::state::AppState;
use crate::views::editor::EditorContext;
use leptos::prelude::*;

pub(super) fn handle_scheme(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) -> Result<(), String> {
    match verb {
        // !save — serialise the current session env to .content and persist.
        "save" => {
            let source = crate::scheme::dump_env();
            let count = source.lines().filter(|l| l.starts_with("(define")).count();
            config.update(|c| {
                c.set(format!("{path}.content"), source.clone());
                c.set(format!("{path}.content_type"), "text/x-zscheme".to_string());
            });
            let username = state
                .session
                .get_untracked()
                .map(|s| s.username)
                .unwrap_or_default();
            let cfg = config.get_untracked();
            let state2 = state.clone();
            let path2 = path.to_string();
            wasm_bindgen_futures::spawn_local(async move {
                match persist_config(&username, &cfg).await {
                    Ok(()) => state2.push_system(format!("{path2}: {count} binding(s) saved")),
                    Err(e) => state2.push_error(e),
                }
            });
            Ok(())
        }
        // !edit, !eval, !publish, !cid, !fetch — delegate to doc handler.
        "edit" | "eval" | "publish" | "publish-ipld" | "cid" | "fetch" => {
            super::doc::handle_doc(path, verb, args, state, config, show_editor, on_eval)
        }
        other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
    }
}
