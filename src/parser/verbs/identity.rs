use super::resolve_bare_did;
use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::{t, tf};
use crate::identity::load_identity;
use crate::state::AppState;
use crate::views::editor::EditorContext;
use js_sys;
use leptos::prelude::*;
use wasm_bindgen::JsCast;

pub(super) fn handle_identity(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    // ── .my.identity ──────────────────────────────────────────────────────
    if path == ".my.identity" && verb == "export" {
        let session = state
            .session
            .get_untracked()
            .ok_or_else(|| t("msg-not-logged-in"))?;
        let username = session.username.clone();
        let state2 = state.clone();
        let ego_cfg_json = config.get_untracked().for_export().to_json().ok();
        leptos::task::spawn_local(async move {
            match load_identity(&username).await {
                Ok(Some(stored)) => {
                    let filename = format!("{username}.zion.json");
                    let content = crate::identity::export_for_download(
                        &stored.export_json,
                        &username,
                        ego_cfg_json.as_deref(),
                    );
                    trigger_download(&filename, &content);
                    state2.push_command_ok(tf("identity-exported", &[("filename", &filename)]));
                }
                Ok(None) => {
                    state2.push_error(tf("error-identity-not-found", &[("name", &username)]))
                }
                Err(e) => state2.push_error(tf("identity-export-failed", &[("e", &e)])),
            }
        });
        return Ok(());
    }

    if path == ".my.identity" && verb == "publish" {
        if args.len() != 1 {
            return Err(t("publish-usage"));
        }
        let cfg = config.get_untracked();
        let publisher = resolve_bare_did(&args[0], &cfg)?;
        let publisher_disp = args[0].to_string();
        let cmd_id = state.push_command(format!(".my.identity!publish {publisher_disp}"));
        let state2 = state.clone();
        leptos::task::spawn_local(async move {
            match crate::transport::send_ipfs_publish(&publisher).await {
                Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                Err(e) => {
                    let mapped = crate::parser::verbs::doc::format_publish_error(&e);
                    state2.resolve_command_by_id(cmd_id, CommandStatus::Error(mapped.clone()));
                    state2.push_error(mapped);
                }
            }
        });
        return Ok(());
    }

    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}

fn trigger_download(filename: &str, content: &str) {
    let window = match web_sys::window() {
        Some(w) => w,
        None => return,
    };
    let document = match window.document() {
        Some(d) => d,
        None => return,
    };
    let bag = web_sys::BlobPropertyBag::new();
    bag.set_type("application/json");
    let Ok(blob) = web_sys::Blob::new_with_str_sequence_and_options(
        &js_sys::Array::of1(&wasm_bindgen::JsValue::from_str(content)),
        &bag,
    ) else {
        return;
    };
    let Ok(url) = web_sys::Url::create_object_url_with_blob(&blob) else {
        return;
    };
    let Ok(element) = document.create_element("a") else {
        let _ = web_sys::Url::revoke_object_url(&url);
        return;
    };
    let anchor: web_sys::HtmlAnchorElement = element.unchecked_into();
    anchor.set_href(&url);
    anchor.set_download(filename);
    anchor.click();
    let _ = web_sys::Url::revoke_object_url(&url);
}
