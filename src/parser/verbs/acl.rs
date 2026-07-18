use crate::config::EgoConfig;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::views::editor::EditorContext;
use leptos::prelude::*;

pub(super) fn handle_acl(
    path: &str,
    verb: &str,
    _args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    // ── .my.acl ───────────────────────────────────────────────────────────
    // .my.acl:edit  — open the ACL YAML in a config editor.
    // .my.acl:      — (delete) reset ACL to default (fully open).
    if path == ".my.acl" {
        return match verb {
            "edit" => {
                let cfg = config.get_untracked();
                let current = cfg
                    .get(crate::acl::ACL_KEY)
                    .unwrap_or("\"*\": [inbox, rpc]\n")
                    .to_string();
                show_editor.set(Some(
                    EditorContext::new(".my.acl", current)
                        .with_language("yaml")
                        .with_mode(crate::views::editor::EditorMode::ConfigEdit {
                            key: crate::acl::ACL_KEY.to_string(),
                        }),
                ));
                Ok(())
            }
            "" => {
                // Delete: revert to open ACL.
                config.update(|c| {
                    c.delete(crate::acl::ACL_KEY);
                });
                let cfg = config.get_untracked();
                let username = use_context::<AppState>()
                    .unwrap_or_else(|| state.clone())
                    .session
                    .get_untracked()
                    .map(|s| s.username.clone())
                    .unwrap_or_default();
                let state2 = state.clone();
                leptos::task::spawn_local(async move {
                    if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                        state2.push_error(tf("acl-persist-error", &[("e", &e)]));
                    }
                });
                state.push_command_ok(t("acl-reset"));
                Ok(())
            }
            other => Err(tf("acl-no-verb", &[("verb", other)])),
        };
    }

    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}
