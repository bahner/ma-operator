use super::{resolve_bare_did, MA_URL};
use crate::config::EgoConfig;
use crate::http::fetch_url_text;
use crate::i18n::{t, tf};
use crate::identity::load_identity;
use crate::state::{AppState, PendingKind};
use crate::views::editor::EditorContext;
use futures::FutureExt as _;
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
    state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?;

    let raw = args.first().map(|s| s.as_str()).unwrap_or("");
    // @alias or did: → publish directly to that runtime, skip discover.
    if raw.starts_with('@') || raw.starts_with("did:") {
        let publisher = resolve_bare_did(raw, &config.get_untracked())?;
        let state2 = state.clone();
        let publisher_for_storage = publisher.clone();
        leptos::task::spawn_local(async move {
            if do_publish(publisher, config, &state2, None).await {
                crate::views::landing::save_last_runtime(&publisher_for_storage);
            }
        });
        return Ok(());
    }
    // No arg or port number → discover then publish.
    let port = args.first().and_then(|s| s.parse::<u16>().ok());
    let ma_base = ma_base_from_port(port, &config.get_untracked());
    let our_did = state
        .session
        .get_untracked()
        .map(|s| s.sender_did.clone())
        .unwrap_or_default();
    do_ma_connect(ma_base, our_did, config, state.clone());
    Ok(())
}

fn ma_base_from_port(port: Option<u16>, cfg: &EgoConfig) -> String {
    if let Some(p) = port {
        return format!("http://localhost:{p}");
    }
    cfg.get(".ma.ctx.url")
        .unwrap_or(MA_URL)
        .trim_end_matches('/')
        .to_string()
}

fn do_ma_connect(ma_base: String, our_did: String, config: RwSignal<EgoConfig>, state: AppState) {
    leptos::task::spawn_local(async move {
        // Claim (200 = new, 409 = already owned; errors silently skipped).
        let claim_url = format!("{ma_base}/claim");
        let body = format!(r#"{{"owner":"{}"}}"#, our_did);
        match fetch_post_json(&claim_url, &body).await {
            Ok(200) | Ok(409) | Err(_) => {}
            Ok(status) => {
                state.push_error(tf("claim-http-failed", &[("status", &status.to_string())]));
                return;
            }
        }
        // Discover — populate .ma.ctx.* and .my.aliases.ma.
        let did = match rediscover_ma(&ma_base, config).await {
            Ok(did) => {
                crate::views::landing::save_last_runtime(&ma_base);
                if let Some(sess) = state.session.get_untracked() {
                    let username = sess.username.clone();
                    let cfg = config.get_untracked();
                    leptos::task::spawn_local(async move {
                        let _ = crate::config::persist_config(&username, &cfg).await;
                    });
                }
                did
            }
            Err(e) => {
                let status_url = format!("{ma_base}/status.json");
                state.push_error(tf(
                    "discover-fetch-failed",
                    &[("url", &status_url), ("e", &e)],
                ));
                state.push_error(discover_fetch_hint(&e));
                return;
            }
        };
        // Publish profile + DID. 間 arrives via inbox reply when done.
        do_publish(did, config, &state, None).await;
    });
}

/// Build and upload the profile blob to IPFS, then queue the DID republish.
/// Returns `true` if the request was sent, `false` if an error was pushed.
/// Pass `cmd_id = Some(id)` to track the operation as a terminal command.
pub(super) async fn do_publish(
    publisher: String,
    config: RwSignal<EgoConfig>,
    state: &AppState,
    cmd_id: Option<u64>,
) -> bool {
    let username = match state.session.get_untracked().map(|s| s.username.clone()) {
        Some(u) => u,
        None => {
            state.push_error(t("msg-not-logged-in"));
            return false;
        }
    };
    // Step 1: Publish DID document (without profile) so the runtime caches our
    // current iroh endpoint.  Register a reply channel and wait for the ack
    // before sending the store — this guarantees the runtime has our endpoint
    // in doc_cache when the store reply needs to be delivered.
    let did_pub_rx = match crate::transport::send_identity_publish(&publisher).await {
        Ok(msg_id) => Some(crate::state::AwaitingReply::register(msg_id)),
        Err(_) => None,
    };
    if let Some(rx) = did_pub_rx {
        // Wait up to 60 s for the DID publish ack — timeout is fine, the
        // important thing is we don't race the store.
        futures::select! {
            _ = rx.fuse() => {},
            _ = gloo_timers::future::TimeoutFuture::new(60_000).fuse() => {},
        }
    }
    let identity_json = match load_identity(&username).await {
        Ok(Some(s)) => s.export_json,
        Ok(None) => {
            state.push_error(tf("error-identity-not-found", &[("name", &username)]));
            return false;
        }
        Err(e) => {
            state.push_error(e);
            return false;
        }
    };
    let identity_val: serde_json::Value =
        serde_json::from_str(&identity_json).unwrap_or(serde_json::Value::String(identity_json));
    let my_nested = config
        .get_untracked()
        .for_profile()
        .profile_to_nested_json();
    let profile_val = serde_json::json!({
        "username": username,
        "identity": identity_val,
        "my": my_nested,
    });
    let profile_bytes = match serde_ipld_dagcbor::to_vec(&profile_val) {
        Ok(b) => b,
        Err(e) => {
            state.push_error(tf("profile-publish-failed", &[("e", &e.to_string())]));
            return false;
        }
    };
    match crate::transport::send_ipfs_store(
        &publisher,
        profile_bytes,
        "application/vnd.ipld.dag-cbor",
    )
    .await
    {
        Ok(msg_id) => {
            state.register_pending(
                msg_id,
                PendingKind::ProfilePublish {
                    publisher_did: publisher,
                    cmd_id,
                },
                None,
            );
            true
        }
        Err(e) => {
            if let Some(id) = cmd_id {
                state.resolve_command_by_id(id, crate::core::CommandStatus::Error(e.clone()));
            }
            state.push_error(tf("profile-publish-failed", &[("e", &e)]));
            false
        }
    }
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
        cfg.set(".ma.ctx.url", ma_base.trim_end_matches('/'));
        cfg.set(".ma.ctx.did", &did);
        if !endpoint_id.is_empty() {
            cfg.set(".ma.ctx.endpoint_id", &endpoint_id);
        }
        if !ipns.is_empty() {
            cfg.set(".ma.ctx.ipns", &ipns);
        }
        cfg.set(".ma.ctx.ipfs_publisher", ipfs_publisher.to_string());
        cfg.set(".ma.ctx.ipfs_requests", ipfs_requests.to_string());
        cfg.set(".ma.ctx.rpc_requests", rpc_requests.to_string());
        cfg.set(".ma.ctx.started_at", started_at.to_string());
        cfg.set(".ma.ctx.uptime_secs", uptime_secs.to_string());
        if !runtime_cid.is_empty() {
            cfg.set(".ma.ctx.runtime", &runtime_cid);
        }
        if !entity_names.is_empty() {
            cfg.set(".ma.ctx.entity_names", &entity_names);
        }
        cfg.set(".my.aliases.ma", &did);
    });
    Ok(did)
}

pub(super) fn discover_fetch_hint(err: &str) -> String {
    t(discover_fetch_hint_key(err))
}

fn discover_fetch_hint_key(err: &str) -> &'static str {
    if err.contains("HTTP 404") {
        "discover-hint-endpoint-not-found"
    } else if err.contains("HTTP 5") {
        "discover-hint-server-error"
    } else if err.contains("TypeError") || err.contains("Failed to fetch") {
        "discover-hint-network"
    } else {
        "discover-hint-generic"
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn discover_fetch_hint_key_classifies_http_404() {
        assert_eq!(
            discover_fetch_hint_key("HTTP 404"),
            "discover-hint-endpoint-not-found"
        );
    }

    #[test]
    fn discover_fetch_hint_key_classifies_server_error() {
        assert_eq!(
            discover_fetch_hint_key("HTTP 503"),
            "discover-hint-server-error"
        );
    }

    #[test]
    fn discover_fetch_hint_key_classifies_browser_fetch_error() {
        assert_eq!(
            discover_fetch_hint_key("TypeError: Failed to fetch"),
            "discover-hint-network"
        );
    }

    #[test]
    fn discover_fetch_hint_key_classifies_fallback() {
        assert_eq!(discover_fetch_hint_key("boom"), "discover-hint-generic");
    }
}
