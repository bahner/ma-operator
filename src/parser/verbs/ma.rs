use super::MA_URL;
use crate::config::EgoConfig;
use crate::http::fetch_url_text;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::views::editor::EditorContext;
use leptos::prelude::*;

pub(super) fn handle_ma(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    if path != ".ma" {
        return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
    }
    if verb != "connect" {
        return Err(tf("runtime-no-verb", &[("verb", verb), ("path", path)]));
    }
    let our_did = state
        .session
        .get_untracked()
        .map(|s| s.sender_did.clone())
        .ok_or_else(|| t("msg-not-logged-in"))?;
    let port = args.first().and_then(|s| s.parse::<u16>().ok());
    let ma_base = ma_base_from_port(port, &config.get_untracked());
    do_ma_connect(ma_base, our_did, config, state.clone());
    Ok(())
}

fn ma_base_from_port(port: Option<u16>, cfg: &EgoConfig) -> String {
    if let Some(p) = port {
        return format!("http://localhost:{p}");
    }
    cfg.get(".ctx.ma.url")
        .unwrap_or(MA_URL)
        .trim_end_matches('/')
        .to_string()
}

fn do_ma_connect(ma_base: String, our_did: String, config: RwSignal<EgoConfig>, state: AppState) {
    leptos::task::spawn_local(async move {
        // Try to claim — 200 = claimed now, 409 = already owned, error = skip
        let claim_url = format!("{ma_base}/claim");
        let body = format!(r#"{{"owner":"{}"}}"#, our_did);
        match fetch_post_json(&claim_url, &body).await {
            Ok(200) => state.push_system(tf("claim-success", &[("did", &our_did)])),
            Ok(409) => {} // already claimed — continue to discover
            Ok(status) => {
                state.push_error(tf("claim-http-failed", &[("status", &status.to_string())]));
                return;
            }
            Err(_) => {} // claim endpoint unavailable — continue to discover
        }
        // Discover — populate .ctx.ma.* from status.json
        match rediscover_ma(&ma_base, config).await {
            Ok(did) => {
                if let Some(sess) = state.session.get_untracked() {
                    let username = sess.username.clone();
                    let cfg = config.get_untracked();
                    leptos::task::spawn_local(async move {
                        if let Err(e) = crate::config::persist_config(&username, &cfg).await {
                            web_sys::console::error_1(&format!("persist error: {e}").into());
                        }
                    });
                }
                state.push_system(tf("discover-success", &[("url", &ma_base), ("did", &did)]));
            }
            Err(e) => {
                let status_url = format!("{ma_base}/status.json");
                state.push_error(tf(
                    "discover-fetch-failed",
                    &[("url", &status_url), ("e", &e)],
                ));
                state.push_error(discover_fetch_hint(&e));
            }
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
    let ipns = json
        .get("ipns")
        .and_then(|v| v.as_str())
        .unwrap_or("")
        .to_string();
    let ipfs_publisher = json
        .get("ipfs_publisher")
        .and_then(|v| v.as_bool())
        .unwrap_or(false);
    let ipfs_requests = json
        .get("ipfs_requests")
        .and_then(|v| v.as_u64())
        .unwrap_or(0);
    let rpc_requests = json
        .get("rpc_requests")
        .and_then(|v| v.as_u64())
        .unwrap_or(0);
    let started_at = json.get("started_at").and_then(|v| v.as_u64()).unwrap_or(0);
    let uptime_secs = json
        .get("uptime_secs")
        .and_then(|v| v.as_u64())
        .unwrap_or(0);
    let runtime_cid = json
        .get("runtime")
        .and_then(|v| v.get("/"))
        .and_then(|v| v.as_str())
        .unwrap_or("")
        .to_string();
    let entity_names = json
        .get("entity_names")
        .and_then(|v| v.as_array())
        .map(|arr| {
            arr.iter()
                .filter_map(|v| v.as_str())
                .collect::<Vec<_>>()
                .join(",")
        })
        .unwrap_or_default();

    config.update(|cfg| {
        cfg.set(".ctx.ma.did", &did);
        if !endpoint_id.is_empty() {
            cfg.set(".ctx.ma.endpoint_id", &endpoint_id);
        }
        if !ipns.is_empty() {
            cfg.set(".ctx.ma.ipns", &ipns);
        }
        cfg.set(".ctx.ma.ipfs_publisher", ipfs_publisher.to_string());
        cfg.set(".ctx.ma.ipfs_requests", ipfs_requests.to_string());
        cfg.set(".ctx.ma.rpc_requests", rpc_requests.to_string());
        cfg.set(".ctx.ma.started_at", started_at.to_string());
        cfg.set(".ctx.ma.uptime_secs", uptime_secs.to_string());
        if !runtime_cid.is_empty() {
            cfg.set(".ctx.ma.runtime", &runtime_cid);
        }
        if !entity_names.is_empty() {
            cfg.set(".ctx.ma.entity_names", &entity_names);
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
        "Hint: verify `ma` and IPFS Desktop are running, then retry `.ma`."
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
