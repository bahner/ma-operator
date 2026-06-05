use leptos::prelude::*;
use crate::config::EgoConfig;
use crate::http::fetch_url_text;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::views::editor::EditorContext;
use super::MA_URL;

pub(super) fn handle_ma(
    path: &str,
    verb: &str,
    _args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    if path != ".my.ma" {
        return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
    }
    let ma_base = {
        let cfg = config.get_untracked();
        cfg.get(".my.ma.url")
            .unwrap_or(MA_URL)
            .trim_end_matches('/')
            .to_string()
    };
    match verb {
        "discover" => do_ma_discover(ma_base, config, state.clone()),
        "claim" => do_ma_claim(ma_base, config, state.clone()),
        other => return Err(tf("runtime-no-verb", &[("verb", other), ("path", path)])),
    }
    Ok(())
}

fn do_ma_discover(ma_base: String, config: RwSignal<EgoConfig>, state: AppState) {
    let state2 = state.clone();
    leptos::task::spawn_local(async move {
        let did = match rediscover_ma(&ma_base, config).await {
            Ok(did) => did,
            Err(e) => {
                let status_url = format!("{ma_base}/status.json");
                let hint = discover_fetch_hint(&e);
                state2.push_error(tf(
                    "discover-fetch-failed",
                    &[("url", &status_url), ("e", &e)],
                ));
                state2.push_error(hint);
                return;
            }
        };
        if let Some(sess) = state2.session.get_untracked() {
            let username = sess.username.clone();
            let cfg = config.get_untracked();
            leptos::task::spawn_local(async move {
                if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                    web_sys::console::error_1(&format!("persist error: {e}").into());
                }
            });
        }
        state2.push_system(tf(
            "discover-success",
            &[("url", &ma_base), ("did", &did)],
        ));
    });
}

fn do_ma_claim(ma_base: String, config: RwSignal<EgoConfig>, state: AppState) {
    let our_did = match state.session.get_untracked() {
        Some(sess) => sess.sender_did.clone(),
        None => {
            state.push_error(t("claim-no-session"));
            return;
        }
    };
    leptos::task::spawn_local(async move {
        let claim_url = format!("{ma_base}/claim");
        let body = format!(r#"{{"owner":"{}"}}"#, our_did);
        match fetch_post_json(&claim_url, &body).await {
            Ok(200) => {
                state.push_system(tf("claim-success", &[("did", &our_did)]));
                // Fetch status to update .my.ma.did / .my.aliases.ma.
                if rediscover_ma(&ma_base, config).await.is_ok() {
                    if let Some(sess) = state.session.get_untracked() {
                        let username = sess.username.clone();
                        let cfg = config.get_untracked();
                        leptos::task::spawn_local(async move {
                            let _ = crate::config::persist_config(&username, &cfg).await;
                        });
                    }
                }
            }
            Ok(409) => state.push_error(t("claim-conflict")),
            Ok(status) => state
                .push_error(tf("claim-http-failed", &[("status", &status.to_string())])),
            Err(e) => state.push_error(tf("claim-error", &[("e", &e)])),
        }
    });
}

pub(super) async fn rediscover_ma(
    ma_base: &str,
    config: leptos::prelude::RwSignal<crate::config::EgoConfig>,
) -> Result<String, String> {
    let status_url = format!("{ma_base}/status.json");
    let json_str = fetch_url_text(&status_url).await?;
    let json: serde_json::Value = serde_json::from_str(&json_str).map_err(|e| e.to_string())?;
    let did = json
        .get("did")
        .and_then(|v| v.as_str())
        .filter(|s| s.starts_with("did:ma:"))
        .ok_or_else(|| "no valid DID in status".to_string())?
        .to_string();
    let endpoint_id = json
        .get("endpoint_id")
        .and_then(|v| v.as_str())
        .unwrap_or("")
        .to_string();
    config.update(|cfg| {
        cfg.set(".my.ma.did", &did);
        if !endpoint_id.is_empty() {
            cfg.set(".my.ma.endpoint_id", &endpoint_id);
        }
        cfg.set(".my.aliases.ma", &did);
    });
    Ok(did)
}

pub(super) fn discover_fetch_hint(err: &str) -> &'static str {
    if err.contains("HTTP 404") {
        "Hint: endpoint not found. Check that `ma` is running and exposes /status.json on port 5003."
    } else if err.contains("HTTP 5") {
        "Hint: runtime answered with server error. Check `ma` logs and retry."
    } else if err.contains("TypeError") || err.contains("Failed to fetch") {
        "Hint: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser."
    } else {
        "Hint: verify `ma` and IPFS Desktop are running, then retry `.my.ma:discover`."
    }
}

async fn fetch_post_json(url: &str, body: &str) -> Result<u16, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;

    let window = web_sys::window().ok_or("no window")?;
    let headers = web_sys::Headers::new().map_err(|e| format!("{e:?}"))?;
    headers
        .set("Content-Type", "application/json")
        .map_err(|e| format!("{e:?}"))?;
    let opts = web_sys::RequestInit::new();
    opts.set_method("POST");
    opts.set_body(&wasm_bindgen::JsValue::from_str(body));
    opts.set_headers(&headers);
    let request =
        web_sys::Request::new_with_str_and_init(url, &opts).map_err(|e| format!("{e:?}"))?;
    let promise = window.fetch_with_request(&request);
    let resp_val = JsFuture::from(promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    Ok(resp.status())
}
