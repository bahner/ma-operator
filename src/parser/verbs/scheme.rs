/// Handler for the persistent Scheme bootstrap sources.
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
        // Rebuild the sole active session from the stable Scheme layer and
        // the avatar layer. This removes bindings deleted from either source.
        "eval" => {
            let cfg = config.get_untracked();
            if cfg.get(path).is_none() {
                return Err(tf("msg-key-not-found", &[("path", path)]));
            }
            let scheme_source = cfg.get(".my.scheme").unwrap_or_default().to_string();
            let avatar_source = cfg.get(".my.avatar").unwrap_or_default().to_string();
            let display = format!("{path}!eval");
            state.push_command_done(display);
            let state = state.clone();
            leptos::task::spawn_local(async move {
                if let Err(error) =
                    crate::scheme::bootstrap_session(&scheme_source, &avatar_source, &state, config)
                        .await
                {
                    crate::scheme::reset_session_env();
                    state.push_error(format!("Scheme bootstrap stopped: {error}"));
                }
            });
            Ok(())
        }
        // !save — serialise the current session env and persist.
        "save" if path == ".my.scheme" || path.starts_with(".my.scheme.") => {
            let source = crate::scheme::dump_env();
            let count = source.lines().filter(|l| l.starts_with("(define")).count();
            config.update(|c| c.set(path, source.clone()));
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
        // !edit, !publish, !cid, !fetch — delegate to doc handler.
        "edit" | "publish" | "publish-ipld" | "cid" | "fetch" => {
            super::doc::handle_doc(path, verb, args, state, config, show_editor, on_eval)
        }
        other => Err(tf("doc-no-verb", &[("verb", other), ("path", path)])),
    }
}
