use super::{resolve_bare_did, MA_URL};
use crate::config::EgoConfig;
use crate::http::{fetch_url_text_timeout, post_json_text_timeout};
use crate::i18n::{t, tf};
use crate::identity::load_identity;
use crate::state::{AppState, PendingKind};
use crate::transport;
use crate::views::editor::EditorContext;
use futures::FutureExt as _;
use leptos::prelude::*;

pub(crate) const LOCAL_MA_HTTP_TIMEOUT_MS: u32 = 2_000;
pub(crate) const RUNTIME_PING_TIMEOUT_MS: u32 = 5_000;

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
    let cfg = config.get_untracked();
    let ma_base = ma_base_from_arg(raw, &cfg);
    let fallback_did = fallback_did_from_arg(raw, &cfg)?;
    let session = state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?;
    let username = session.username;
    let our_did = session.sender_did;
    let state2 = state.clone();
    state.push_system(t("msg-ma-connecting-matrix"));
    leptos::task::spawn_local(async move {
        connect_ma_runtime(
            state2,
            config,
            username,
            our_did,
            ma_base,
            fallback_did,
            ConnectMaOptions {
                publish: true,
                full_profile_publish: true,
            },
        )
        .await;
    });
    Ok(())
}

fn ma_base_from_arg(raw: &str, cfg: &EgoConfig) -> String {
    if raw.starts_with("http") {
        return raw.trim_end_matches('/').to_string();
    }
    if let Ok(p) = raw.parse::<u16>() {
        return format!("http://localhost:{p}");
    }
    cfg.get(".ma.ctx.url")
        .unwrap_or(MA_URL)
        .trim_end_matches('/')
        .to_string()
}

fn fallback_did_from_arg(raw: &str, cfg: &EgoConfig) -> Result<Option<String>, String> {
    if raw.starts_with('@') || raw.starts_with("did:") {
        return resolve_bare_did(raw, cfg).map(Some);
    }
    Ok(None)
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) enum ClaimResult {
    Claimed,
    AlreadyOwned,
    OwnedByOther,
    Unavailable,
    UnexpectedStatus(u16),
}

pub(crate) async fn claim_ma(ma_base: &str, our_did: &str) -> ClaimResult {
    let claim_url = format!("{ma_base}/claim");
    let body = format!(r#"{{"owner":"{}"}}"#, our_did);
    match post_json_text_timeout(&claim_url, &body, LOCAL_MA_HTTP_TIMEOUT_MS).await {
        Ok(resp) if resp.status == 200 => ClaimResult::Claimed,
        Ok(resp) if resp.status == 409 => {
            if conflict_contains_owner(&resp.body, our_did) {
                ClaimResult::AlreadyOwned
            } else {
                ClaimResult::OwnedByOther
            }
        }
        Ok(resp) => ClaimResult::UnexpectedStatus(resp.status),
        Err(_) => ClaimResult::Unavailable,
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) enum ConnectMaOutcome {
    Ready { did: String },
    Unavailable { target: String },
    PingTimedOut { did: String },
}

impl ConnectMaOutcome {
    pub(crate) fn allows_startup_enter(&self) -> bool {
        matches!(self, Self::Ready { .. })
    }

    pub(crate) fn target(&self) -> &str {
        match self {
            Self::Ready { did } | Self::PingTimedOut { did } => did,
            Self::Unavailable { target } => target,
        }
    }
}

fn should_continue_after_claim(result: &ClaimResult) -> bool {
    matches!(
        result,
        ClaimResult::Claimed
            | ClaimResult::AlreadyOwned
            | ClaimResult::OwnedByOther
            | ClaimResult::Unavailable
            | ClaimResult::UnexpectedStatus(_)
    )
}

fn conflict_contains_owner(body: &str, our_did: &str) -> bool {
    serde_json::from_str::<serde_json::Value>(body)
        .ok()
        .and_then(|json| json.get("owners").and_then(|v| v.as_array()).cloned())
        .is_some_and(|owners| owners.iter().any(|owner| owner.as_str() == Some(our_did)))
}

#[derive(Clone, Copy)]
pub(crate) struct ConnectMaOptions {
    pub publish: bool,
    pub full_profile_publish: bool,
}

pub(crate) async fn connect_ma_runtime(
    state: AppState,
    config: RwSignal<EgoConfig>,
    username: String,
    our_did: String,
    ma_base: String,
    fallback_did: Option<String>,
    options: ConnectMaOptions,
) -> ConnectMaOutcome {
    let status_url = format!("{}/status.json", ma_base.trim_end_matches('/'));
    state.push_system(tf("msg-ma-checking-url", &[("url", &status_url)]));
    let claim_result = claim_ma(&ma_base, &our_did).await;
    match &claim_result {
        ClaimResult::Claimed => state.push_system(t("msg-local-ma-claimed")),
        ClaimResult::AlreadyOwned => state.push_system(t("msg-local-ma-already-claimed")),
        ClaimResult::OwnedByOther | ClaimResult::UnexpectedStatus(_) => {
            state.push_system(t("msg-local-ma-claim-failed"));
        }
        ClaimResult::Unavailable => {
            state.push_system(t("msg-local-ma-claim-failed"));
        }
    }
    if !should_continue_after_claim(&claim_result) {
        return ping_and_publish_fallback(&state, config, fallback_did, &ma_base, options).await;
    }

    let did = match rediscover_ma(&ma_base, config).await {
        Ok(did) => did,
        Err(_) => {
            state.push_error(tf(
                "msg-local-ma-unreachable",
                &[
                    ("url", &ma_base),
                    ("seconds", &(LOCAL_MA_HTTP_TIMEOUT_MS / 1_000).to_string()),
                ],
            ));
            return ping_and_publish_fallback(&state, config, fallback_did, &ma_base, options)
                .await;
        }
    };
    state.push_system(tf("discover-success", &[("url", &ma_base)]));
    state.push_system(tf("discover-did-line", &[("did", &did)]));
    crate::views::landing::save_last_runtime(&ma_base);
    let cfg = config.get_untracked();
    let _ = crate::config::persist_config(&username, &cfg).await;
    if !options.publish {
        return ConnectMaOutcome::Ready { did };
    }
    let published = if options.full_profile_publish {
        do_publish(did.clone(), config, &state, None).await
    } else {
        match send_identity_publish_and_wait(&did).await {
            Ok(()) => {
                state.push_system(tf("msg-auto-published", &[("url", &ma_base)]));
                true
            }
            Err(_) => false,
        }
    };
    if !published {
        return ping_and_publish_fallback(&state, config, fallback_did, &ma_base, options).await;
    }
    ConnectMaOutcome::Ready { did }
}

fn fallback_did_candidate(
    config: RwSignal<EgoConfig>,
    fallback_did: Option<String>,
) -> Option<String> {
    fallback_did.or_else(|| {
        config
        .get_untracked()
        .get(".ma.ctx.did")
        .filter(|did| did.starts_with("did:ma:"))
        .map(|did| did.to_string())
    })
}

async fn ping_and_publish_fallback(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    fallback_did: Option<String>,
    unavailable_target: &str,
    options: ConnectMaOptions,
) -> ConnectMaOutcome {
    let Some(did) = fallback_did_candidate(config, fallback_did) else {
        return ConnectMaOutcome::Unavailable {
            target: unavailable_target.to_string(),
        };
    };
    match ping_runtime(state, &did).await {
        Ok(()) => {}
        Err(_) => {
            state.push_error(tf(
                "msg-runtime-ping-timeout",
                &[
                    ("did", &did),
                    ("seconds", &(RUNTIME_PING_TIMEOUT_MS / 1_000).to_string()),
                ],
            ));
            return ConnectMaOutcome::PingTimedOut { did };
        }
    }
    if !options.publish {
        return ConnectMaOutcome::Ready { did };
    }
    let published = if options.full_profile_publish {
        do_publish(did.clone(), config, state, None).await
    } else {
        send_identity_publish_and_wait(&did).await.is_ok()
    };
    if published {
        crate::views::landing::save_last_runtime(&did);
        state.push_system(tf("msg-auto-published", &[("url", &did)]));
    }
    ConnectMaOutcome::Ready { did }
}

async fn ping_runtime(state: &AppState, did: &str) -> Result<(), String> {
    state.push_system(tf("msg-runtime-pinging", &[("did", did)]));
    let send_and_wait = async move {
        let msg_id = transport::send_rpc(did, "ping", &[]).await?;
        let rx = crate::state::AwaitingReply::register(msg_id);
        rx.await
            .map(|_| ())
            .map_err(|_| "runtime ping reply was cancelled".to_string())
    }
    .fuse();
    let timeout = gloo_timers::future::TimeoutFuture::new(RUNTIME_PING_TIMEOUT_MS).fuse();
    futures::pin_mut!(send_and_wait, timeout);
    futures::select! {
        result = send_and_wait => result,
        _ = timeout => Err("runtime ping timed out".to_string()),
    }
}

async fn send_identity_publish_and_wait(publisher: &str) -> Result<(), String> {
    let msg_id = crate::transport::send_identity_publish(publisher).await?;
    let rx = crate::state::AwaitingReply::register(msg_id);
    futures::select! {
        reply = rx.fuse() => reply.map(|_| ()).map_err(|_| "identity publish reply was cancelled".to_string()),
        _ = gloo_timers::future::TimeoutFuture::new(60_000).fuse() => Err("identity publish timed out".to_string()),
    }
}

/// Build and upload the profile blob to IPFS, then queue the DID republish.
/// Returns `true` if the request was sent, `false` if an error was pushed.
/// Pass `cmd_id = Some(id)` to track the operation as a terminal command.
pub(crate) async fn do_publish(
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

pub(crate) async fn rediscover_ma(
    ma_base: &str,
    config: leptos::prelude::RwSignal<crate::config::EgoConfig>,
) -> Result<String, String> {
    let status_url = format!("{ma_base}/status.json");
    let json_str = fetch_url_text_timeout(&status_url, LOCAL_MA_HTTP_TIMEOUT_MS).await?;
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn conflict_contains_owner_matches_existing_owner() {
        let body = r#"{"error":"already claimed","owners":["did:ma:one","did:ma:two"]}"#;

        assert!(conflict_contains_owner(body, "did:ma:two"));
    }

    #[test]
    fn conflict_contains_owner_rejects_missing_owner() {
        let body = r#"{"error":"already claimed","owners":["did:ma:one"]}"#;

        assert!(!conflict_contains_owner(body, "did:ma:two"));
    }

    #[test]
    fn claim_failures_do_not_abort_publish_path() {
        assert!(should_continue_after_claim(&ClaimResult::OwnedByOther));
        assert!(should_continue_after_claim(&ClaimResult::UnexpectedStatus(
            500
        )));
        assert!(should_continue_after_claim(&ClaimResult::Unavailable));
    }

    #[test]
    fn connect_outcome_reports_target_for_startup_messages() {
        assert_eq!(
            ConnectMaOutcome::Ready {
                did: "did:ma:k51runtime".to_string()
            }
            .target(),
            "did:ma:k51runtime"
        );
        assert_eq!(
            ConnectMaOutcome::Unavailable {
                target: "http://localhost:5003".to_string()
            }
            .target(),
            "http://localhost:5003"
        );
    }

    #[test]
    fn explicit_fallback_did_wins_over_stored_ma_context() {
        let config = RwSignal::new(EgoConfig::default());
        config.update_untracked(|cfg| cfg.set(".ma.ctx.did", "did:ma:stored"));

        assert_eq!(
            fallback_did_candidate(config, Some("did:ma:explicit".to_string())),
            Some("did:ma:explicit".to_string())
        );
    }
}
