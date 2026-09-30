use super::resolve_bare_did;
use crate::config::OperatorConfig;
use crate::editor::EditorContext;
use crate::http::{fetch_url_text_timeout, post_json_text_timeout};
use crate::i18n::{t, tf};
use crate::identity::load_identity;
use crate::state::{AppState, MaOp, PendingKind};
use crate::transport;
use futures::FutureExt as _;
use leptos::prelude::*;
use web_time::{Duration, Instant};

pub(crate) const LOCAL_MA_HTTP_TIMEOUT_MS: u32 = 2_000;
/// How long a startup liveness ping waits for the runtime to answer.
///
/// This must exceed `transport::connection`'s per-send timeout so a first
/// connection (iroh QUIC handshake, possibly via relay) is given a chance to
/// finish before the ping gives up. A shorter value here made a reachable
/// runtime report "runtime ping timed out" on cold start.
pub(crate) const RUNTIME_PING_TIMEOUT_MS: u32 = 15_000;
const DEFAULT_MA_TIMEOUT_SECS: u32 = 120;
const MA_TIMEOUT_CONFIG: &str = ".my.config.ma.timeout";
const MA_CTX_DID: &str = ".ma.ctx.did";
const MA_CTX_URL: &str = ".ma.ctx.url";

pub(crate) fn active_ma_did(cfg: &OperatorConfig) -> Option<String> {
    cfg.get(MA_CTX_DID)
        .filter(|did| did.starts_with("did:ma:"))
        .map(ToString::to_string)
}

pub(crate) fn preferred_ma_prefill(
    published: Option<String>,
    invited: Option<String>,
) -> Option<String> {
    published.or(invited)
}

pub(crate) fn ma_choices(published: Option<String>, invited: Option<String>) -> Vec<String> {
    let mut choices = Vec::new();
    for did in [published, invited].into_iter().flatten() {
        if !choices.contains(&did) {
            choices.push(did);
        }
    }
    choices
}

pub(super) fn handle_ma(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    if path != ".ma" {
        if path == ".ma.live" || path.starts_with(".ma.live.") {
            return handle_ma_live(path, verb, args, state, config, _show_editor, _on_eval);
        }
        return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
    }
    state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?;

    let op = match verb {
        "set" => {
            let did = args
                .first()
                .filter(|_| args.len() == 1)
                .ok_or_else(|| "usage: .ma: did:ma:trustedruntime".to_string())?;
            let did = resolve_bare_did(did, &config.get_untracked())?;
            MaOp::Set { did }
        }
        "claim" => {
            let port = match args {
                [] => 5003,
                [port] => port
                    .parse::<u16>()
                    .map_err(|_| "usage: .ma: claim [port]".to_string())?,
                _ => return Err("usage: .ma: claim [port]".to_string()),
            };
            MaOp::Claim { port }
        }
        "publish" => {
            let cfg = config.get_untracked();
            let trusted_ma = active_ma_did(&cfg).ok_or_else(|| {
                "no trusted runtime; use .ma: did:ma:… or .ma: claim [port]".to_string()
            })?;
            MaOp::Publish { trusted_ma }
        }
        _ => return Err(tf("runtime-no-verb", &[("verb", verb), ("path", path)])),
    };
    state.ma_queue.update(|queue| queue.push_back(op));
    Ok(())
}

/// Drain the `.ma` operation queue one operation at a time, on its own worker
/// task. Runtime `.ma` commands only enqueue; they never run inline, so a long
/// publish cannot block input or incoming-message processing.
pub(crate) async fn run_ma_queue(state: AppState, config: RwSignal<OperatorConfig>) {
    loop {
        let op = state
            .ma_queue
            .update_untracked(std::collections::VecDeque::pop_front);
        let Some(op) = op else {
            gloo_timers::future::TimeoutFuture::new(50).await;
            continue;
        };
        process_ma_op(op, &state, config).await;
    }
}

async fn process_ma_op(op: MaOp, state: &AppState, config: RwSignal<OperatorConfig>) {
    match op {
        MaOp::Publish { trusted_ma } => {
            let timeout_secs = ma_timeout_secs(&config.get_untracked());
            state.push_system(tf("msg-trusted-ma-searching", &[("did", &trusted_ma)]));
            state.push_system(tf(
                "msg-trusted-ma-lookup-wait",
                &[("seconds", &timeout_secs.to_string())],
            ));
            state.push_system(format!(
                ".ma: {}",
                tf(
                    "msg-identity-first-publish",
                    &[("seconds", &timeout_secs.to_string())],
                )
            ));
            publish_with_trusted_ma(trusted_ma, config, state).await;
        }
        MaOp::Set { did } => set_trusted_runtime(&did, state, config),
        MaOp::Claim { port } => {
            let Some(session) = state.session.get_untracked() else {
                return;
            };
            let username = session.username;
            let our_did = session.sender_did;
            claim_and_discover_local_ma(
                state.clone(),
                config,
                username,
                our_did,
                format!("http://localhost:{port}"),
            )
            .await;
        }
    }
}

async fn publish_with_trusted_ma(
    trusted_ma: String,
    config: RwSignal<OperatorConfig>,
    state: &AppState,
) {
    let timeout_ms = ma_timeout_ms(&config.get_untracked());
    if let Err(error) = resolve_trusted_ma(&trusted_ma, timeout_ms).await {
        log::warn!("[ma] trusted MA discovery failed for {trusted_ma}: {error}");
        state.push_error(t("msg-trusted-ma-not-discovered"));
        return;
    }
    queue_profile_publish(trusted_ma, config, state, None, true, true, false).await;
}

pub(crate) fn ma_timeout_secs(cfg: &OperatorConfig) -> u32 {
    cfg.get(MA_TIMEOUT_CONFIG)
        .and_then(|value| value.parse::<u32>().ok())
        .filter(|seconds| *seconds > 0)
        .unwrap_or(DEFAULT_MA_TIMEOUT_SECS)
}

pub(crate) fn ma_timeout_ms(cfg: &OperatorConfig) -> u32 {
    ma_timeout_secs(cfg).saturating_mul(1_000)
}

fn set_trusted_runtime(did: &str, state: &AppState, config: RwSignal<OperatorConfig>) {
    config.update(|cfg| {
        cfg.set(MA_CTX_DID, did);
        cfg.set(".my.aliases.ma", did);
    });
    if let Some(username) = state
        .session
        .get_untracked()
        .map(|session| session.username)
    {
        let cfg = config.get_untracked();
        leptos::task::spawn_local(async move {
            let _ = crate::config::persist_config(&username, &cfg).await;
        });
    }
    state.push_system(format!("ma: {did}"));
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
    let body = format!(r#"{{"owner":"{our_did}"}}"#);
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
    matches!(result, ClaimResult::Claimed | ClaimResult::AlreadyOwned)
}

fn conflict_contains_owner(body: &str, our_did: &str) -> bool {
    serde_json::from_str::<serde_json::Value>(body)
        .ok()
        .and_then(|json| json.get("owners").and_then(|v| v.as_array()).cloned())
        .is_some_and(|owners| owners.iter().any(|owner| owner.as_str() == Some(our_did)))
}

pub(crate) async fn claim_and_discover_local_ma(
    state: AppState,
    config: RwSignal<OperatorConfig>,
    username: String,
    our_did: String,
    ma_base: String,
) -> ConnectMaOutcome {
    let status_url = format!("{}/status.json", ma_base.trim_end_matches('/'));
    state.push_system(tf("msg-ma-checking-url", &[("url", &status_url)]));
    let claim_result = claim_ma(&ma_base, &our_did).await;
    match &claim_result {
        ClaimResult::Claimed => state.push_system(t("msg-local-ma-claimed")),
        ClaimResult::AlreadyOwned => state.push_system(t("msg-local-ma-already-claimed")),
        ClaimResult::OwnedByOther | ClaimResult::UnexpectedStatus(_) | ClaimResult::Unavailable => {
            state.push_error(t("msg-local-ma-claim-failed"));
        }
    }
    if !should_continue_after_claim(&claim_result) {
        return ConnectMaOutcome::Unavailable { target: ma_base };
    }
    let did = if let Ok(did) = rediscover_ma(&ma_base, config).await {
        did
    } else {
        state.push_error(tf(
            "msg-local-ma-unreachable",
            &[
                ("url", &ma_base),
                ("seconds", &(LOCAL_MA_HTTP_TIMEOUT_MS / 1_000).to_string()),
            ],
        ));
        return ConnectMaOutcome::Unavailable { target: ma_base };
    };
    config.update(|cfg| {
        cfg.set(MA_CTX_DID, &did);
        cfg.delete(MA_CTX_URL);
        cfg.set(".my.aliases.ma", &did);
    });
    state.push_system(tf("discover-success", &[("url", &ma_base)]));
    state.push_system(tf("discover-did-line", &[("did", &did)]));
    let cfg = config.get_untracked();
    let _ = crate::config::persist_config(&username, &cfg).await;
    ConnectMaOutcome::Ready { did }
}

pub(crate) async fn connect_trusted_ma_on_startup(
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    username: &str,
    did: String,
    is_new: bool,
) -> ConnectMaOutcome {
    let timeout_ms = ma_timeout_ms(&config.get_untracked());
    state.push_system(tf("msg-trusted-ma-searching", &[("did", &did)]));
    state.push_system(tf(
        "msg-trusted-ma-lookup-wait",
        &[("seconds", &(timeout_ms / 1_000).to_string())],
    ));
    if let Err(error) = resolve_trusted_ma(&did, timeout_ms).await {
        log::warn!("[ma] trusted MA discovery failed for {did}: {error}");
        state.push_error(t("msg-trusted-ma-not-discovered"));
        return ConnectMaOutcome::Unavailable { target: did };
    }
    if is_new {
        state.push_system(tf(
            "msg-identity-first-publish",
            &[("seconds", &(timeout_ms / 1_000).to_string())],
        ));
        let cfg = config.get_untracked();
        let selected_z = cfg.get(".my.z").map(str::to_string);
        if let Err(e) =
            send_identity_publish_and_wait(&did, Some(did.clone()), selected_z, timeout_ms).await
        {
            log::error!("[ma] identity publication failed before runtime ping: {e}");
            return ConnectMaOutcome::Unavailable { target: did };
        }
    }
    if let Err(error) = ping_runtime(state, &did).await {
        state.push_error(error);
        return ConnectMaOutcome::PingTimedOut { did };
    }
    config.update(|cfg| {
        cfg.set(MA_CTX_DID, &did);
        cfg.set(".my.aliases.ma", &did);
    });
    let cfg = config.get_untracked();
    let _ = crate::config::persist_config(username, &cfg).await;
    ConnectMaOutcome::Ready { did }
}

/// Resolve a DID document, retrying transient failures within `timeout_ms`.
/// Shared by every startup resolution path so a cold IPNS lookup gets time to
/// warm up.
pub(crate) async fn resolve_did_with_retry(
    resolver: &dyn ma_core::DidDocumentResolver,
    did: &str,
    timeout_ms: u32,
) -> Result<ma_core::Document, String> {
    let deadline = Instant::now() + Duration::from_millis(u64::from(timeout_ms));
    let mut attempt = 0u32;
    loop {
        match ma_core::DidDocumentResolver::resolve(resolver, did).await {
            Ok(document) => return Ok(document),
            Err(error) if Instant::now() < deadline => {
                log::warn!("[ma] DID resolution for {did} failed, retrying: {error}");
                gloo_timers::future::TimeoutFuture::new(crate::http::retry_backoff_ms(attempt))
                    .await;
                attempt = attempt.saturating_add(1);
            }
            Err(error) => return Err(error.to_string()),
        }
    }
}

/// Look up the trusted MA's DID document, retrying within `timeout_ms` so a
/// cold IPNS lookup gets time to warm up. Uses the shared session resolver so a
/// successful lookup warms the cache the ping and identity-publish send paths
/// resolve from.
async fn resolve_trusted_ma(did: &str, timeout_ms: u32) -> Result<(), String> {
    let resolver = transport::ipns_resolver();
    let document = resolve_did_with_retry(resolver.as_ref(), did, timeout_ms).await?;
    published_self_matches(&document, did)
}

async fn ping_runtime(state: &AppState, did: &str) -> Result<(), String> {
    state.push_system(tf("msg-runtime-pinging", &[("did", did)]));
    let send_and_wait = async move {
        let mut rx = None;
        let mut registered_msg_id = None;
        let send_result = transport::send_actor_message_with_msg_id(did, "ping", &[], |msg_id| {
            registered_msg_id = Some(msg_id.clone());
            rx = Some(crate::state::AwaitingReply::register(msg_id));
        })
        .await;
        if let Err(e) = send_result {
            if let Some(msg_id) = registered_msg_id {
                crate::state::AwaitingReply::take(&msg_id);
            }
            return Err(e);
        }
        let rx = rx.ok_or_else(|| "runtime ping reply was not registered".to_string())?;
        rx.await
            .map_err(|_| "runtime ping reply was cancelled".to_string())?
            .map(|_| ())
    }
    .fuse();
    let timeout = gloo_timers::future::TimeoutFuture::new(RUNTIME_PING_TIMEOUT_MS).fuse();
    futures::pin_mut!(send_and_wait, timeout);
    futures::select! {
        result = send_and_wait => result,
        () = timeout => Err("runtime ping timed out".to_string()),
    }
}

pub(crate) async fn send_identity_publish_and_wait(
    publisher: &str,
    trusted_ma: Option<String>,
    selected_z: Option<String>,
    timeout_ms: u32,
) -> Result<(), String> {
    let mut rx = None;
    let mut registered_msg_id = None;
    let send_result = crate::transport::send_identity_publish_with_msg_id(
        publisher,
        trusted_ma.as_deref(),
        selected_z.as_deref(),
        |msg_id| {
            registered_msg_id = Some(msg_id.clone());
            rx = Some(crate::state::AwaitingReply::register(msg_id));
        },
    )
    .await;
    if let Err(e) = send_result {
        if let Some(msg_id) = registered_msg_id {
            crate::state::AwaitingReply::take(&msg_id);
        }
        return Err(e);
    }
    let rx = rx.ok_or_else(|| "identity publish reply was not registered".to_string())?;
    futures::select! {
        reply = rx.fuse() => reply
            .map_err(|_| "identity publish reply was cancelled".to_string())
            .and_then(|result| result.map(|_| ())),
        () = gloo_timers::future::TimeoutFuture::new(timeout_ms).fuse() => Err("identity publish timed out".to_string()),
    }
}

pub(crate) fn published_self_matches(doc: &ma_core::Document, own_did: &str) -> Result<(), String> {
    if doc.id != own_did {
        return Err(format!(
            "resolved DID document id {} does not match {}",
            doc.id, own_did
        ));
    }
    Ok(())
}

/// Optionally publish `.z`, build and upload the profile blob, then queue the
/// DID republish. The initial DID publish authenticates the store requests.
/// Pass `cmd_id = Some(id)` to track the operation as a terminal command.
pub(crate) async fn queue_profile_publish(
    publisher: String,
    config: RwSignal<OperatorConfig>,
    state: &AppState,
    cmd_id: Option<u64>,
    reenter_saved_ctx: bool,
    publish_z: bool,
    logout_after: bool,
) {
    let Some(username) = state.session.get_untracked().map(|s| s.username.clone()) else {
        fail_profile_publish(state, config, cmd_id, t("msg-not-logged-in"), logout_after);
        return;
    };
    // Step 1: Publish the DID document so the runtime can authenticate the
    // profile-store request and route its reply to our current endpoint.
    let cfg = config.get_untracked();
    let trusted_ma = active_ma_did(&cfg);
    let selected_z = cfg.get(".my.z").map(str::to_string);
    let timeout_ms = ma_timeout_ms(&cfg);
    if let Err(error) =
        send_identity_publish_and_wait(&publisher, trusted_ma, selected_z, timeout_ms).await
    {
        fail_profile_publish(state, config, cmd_id, error, logout_after);
        return;
    }
    if publish_z {
        let parts = crate::parser::verbs::doc::z_tree_parts(&config.get_untracked());
        if parts.is_empty() {
            fail_profile_publish(
                state,
                config,
                cmd_id,
                tf("doc-content-empty", &[("path", ".z")]),
                logout_after,
            );
            return;
        }
        if let Err(error) = crate::parser::verbs::doc::publish_z_tree_and_select(
            &publisher, parts, &username, config,
        )
        .await
        {
            fail_profile_publish(state, config, cmd_id, error, logout_after);
            return;
        }
    }
    let encrypted_profile = match build_encrypted_profile(&username, config).await {
        Ok(profile) => profile,
        Err(error) => {
            fail_profile_publish(state, config, cmd_id, error, logout_after);
            return;
        }
    };
    match crate::transport::send_ipfs_store(
        &publisher,
        encrypted_profile,
        "application/octet-stream",
    )
    .await
    {
        Ok(msg_id) => state.register_pending(
            msg_id,
            PendingKind::ProfilePublish {
                publisher_did: publisher,
                cmd_id,
                reenter_saved_ctx,
                timeout_ms,
                logout_after,
            },
            None,
        ),
        Err(error) => fail_profile_publish(state, config, cmd_id, error, logout_after),
    }
}

async fn build_encrypted_profile(
    username: &str,
    config: RwSignal<OperatorConfig>,
) -> Result<Vec<u8>, String> {
    let identity_json = load_identity(username)
        .await?
        .ok_or_else(|| tf("error-identity-not-found", &[("name", username)]))?
        .export_json;
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
    let profile_bytes = serde_ipld_dagcbor::to_vec(&profile_val).map_err(|e| e.to_string())?;
    let profile_key = crate::state::SESSION_PROFILE_KEY
        .with(|key| key.borrow().as_ref().copied())
        .ok_or_else(|| "missing profile encryption key for this session".to_string())?;
    crate::profile_crypto::encrypt_with_key(&profile_bytes, &profile_key)
}

fn fail_profile_publish(
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    cmd_id: Option<u64>,
    error: String,
    logout_after: bool,
) {
    if let Some(id) = cmd_id {
        state.resolve_command_by_id(id, crate::core::CommandStatus::Error(error.clone()));
    }
    if crate::state::apply_profile_rollback() {
        state.push_error(tf(
            "profile-publish-failed",
            &[("e", &format!("{error} — passphrase change rolled back"))],
        ));
    } else {
        state.push_error(tf("profile-publish-failed", &[("e", &error)]));
    }
    if logout_after {
        crate::eval::perform_logout(state, config);
    }
}

pub(crate) async fn rediscover_ma(
    ma_base: &str,
    config: leptos::prelude::RwSignal<crate::config::OperatorConfig>,
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
        .and_then(serde_json::Value::as_bool)
        .unwrap_or(false);
    let ipfs_requests = json
        .get("ipfs_requests")
        .and_then(serde_json::Value::as_u64)
        .unwrap_or(0);
    let started_at = json
        .get("started_at")
        .and_then(serde_json::Value::as_u64)
        .unwrap_or(0);
    let uptime_secs = json
        .get("uptime_secs")
        .and_then(serde_json::Value::as_u64)
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
        cfg.set(MA_CTX_URL, ma_base.trim_end_matches('/'));
        cfg.set(MA_CTX_DID, &did);
        if !endpoint_id.is_empty() {
            cfg.set(".ma.ctx.endpoint_id", &endpoint_id);
        }
        if !ipns.is_empty() {
            cfg.set(".ma.ctx.ipns", &ipns);
        }
        cfg.set(".ma.ctx.ipfs_publisher", ipfs_publisher.to_string());
        cfg.set(".ma.ctx.ipfs_requests", ipfs_requests.to_string());
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

fn handle_ma_live(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    if path != ".ma.live" {
        return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
    }
    match verb {
        "dial" => {
            let target = args
                .first()
                .ok_or_else(|| "usage: .ma.live!dial @peer [label]".to_string())?;
            let dial_target = resolve_live_target(target, &config.get_untracked())?;
            let body = if args.len() > 1 {
                args[1..].join(" ")
            } else {
                "dial".to_string()
            };
            let cmd_id = state.push_command(format!("{path}!{verb} {}", args.join(" ")));
            let state2 = state.clone();
            wasm_bindgen_futures::spawn_local(async move {
                match transport::send_live_dial(&dial_target, &body).await {
                    Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                    Err(e) => {
                        state2.resolve_command_by_id(
                            cmd_id,
                            crate::core::CommandStatus::Error(e.clone()),
                        );
                        state2.push_error(e);
                    }
                }
            });
            Ok(())
        }
        other => Err(tf("runtime-no-verb", &[("verb", other), ("path", path)])),
    }
}

fn resolve_live_target(arg: &str, cfg: &OperatorConfig) -> Result<String, String> {
    let raw = arg.trim_start_matches('@');
    if raw.starts_with("did:") {
        return if raw.contains('/') {
            Err(format!(
                "live target must be a bare DID or DID-URL with one fragment: {raw}"
            ))
        } else {
            Ok(raw.to_string())
        };
    }
    let resolved = cfg
        .resolve_alias(raw)
        .map(std::string::ToString::to_string)
        .ok_or_else(|| tf("err-unknown-alias", &[("name", raw)]))?;
    if resolved.contains('/') {
        return Err(format!("live target must not contain a path: {resolved}"));
    }
    Ok(resolved)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::state::SessionState;
    use ma_core::{Ipld, MaExtension, SecretBundle};

    #[test]
    fn published_runtime_takes_priority_over_invited_runtime() {
        assert_eq!(
            preferred_ma_prefill(
                Some("did:ma:published".to_string()),
                Some("did:ma:invited".to_string()),
            ),
            Some("did:ma:published".to_string())
        );
    }

    #[test]
    fn invited_runtime_is_used_without_published_runtime() {
        assert_eq!(
            preferred_ma_prefill(None, Some("did:ma:invited".to_string()),),
            Some("did:ma:invited".to_string())
        );
    }

    #[test]
    fn ma_timeout_defaults_to_two_minutes() {
        assert_eq!(ma_timeout_secs(&OperatorConfig::default()), 120);
    }

    #[test]
    fn ma_timeout_reads_positive_seconds_from_config() {
        let mut cfg = OperatorConfig::default();
        cfg.set(MA_TIMEOUT_CONFIG, "180");

        assert_eq!(ma_timeout_secs(&cfg), 180);
        assert_eq!(ma_timeout_ms(&cfg), 180_000);
    }

    #[test]
    fn ma_timeout_rejects_invalid_values() {
        let mut cfg = OperatorConfig::default();
        cfg.set(MA_TIMEOUT_CONFIG, "0");
        assert_eq!(ma_timeout_secs(&cfg), 120);

        cfg.set(MA_TIMEOUT_CONFIG, "not-a-number");
        assert_eq!(ma_timeout_secs(&cfg), 120);
    }

    #[test]
    fn ma_choices_include_distinct_published_and_invited_runtimes() {
        assert_eq!(
            ma_choices(
                Some("did:ma:published".to_string()),
                Some("did:ma:invited".to_string()),
            ),
            vec!["did:ma:published", "did:ma:invited"]
        );
    }

    fn document_with_environment(
        profile_cid: Option<&str>,
        z_cid: Option<&str>,
    ) -> ma_core::Document {
        let bundle = SecretBundle::generate();
        let mut ma = match profile_cid {
            Some(cid) => {
                let profile = cid::Cid::try_from(cid)
                    .map_or_else(|_| Ipld::String(cid.to_string()), Ipld::Link);
                MaExtension::new().kind("agent").extra("profile", profile)
            }
            None => MaExtension::new().kind("agent"),
        };
        if let Some(cid) = z_cid {
            let z =
                cid::Cid::try_from(cid).map_or_else(|_| Ipld::String(cid.to_string()), Ipld::Link);
            ma = ma.extra("z", z);
        }
        bundle.build_document(ma).expect("document")
    }

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
    fn claim_requires_ownership_before_discovery() {
        assert!(should_continue_after_claim(&ClaimResult::Claimed));
        assert!(should_continue_after_claim(&ClaimResult::AlreadyOwned));
        assert!(!should_continue_after_claim(&ClaimResult::OwnedByOther));
        assert!(!should_continue_after_claim(
            &ClaimResult::UnexpectedStatus(500)
        ));
        assert!(!should_continue_after_claim(&ClaimResult::Unavailable));
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
    fn resolve_live_target_accepts_alias_and_bare_did() {
        let mut cfg = OperatorConfig::default();
        cfg.set(".my.aliases.alice", "did:ma:alice");

        assert_eq!(resolve_live_target("@alice", &cfg).unwrap(), "did:ma:alice");
        assert_eq!(
            resolve_live_target("did:ma:bob", &cfg).unwrap(),
            "did:ma:bob"
        );
    }

    #[test]
    fn resolve_live_target_rejects_path_targets() {
        let cfg = OperatorConfig::default();

        assert!(resolve_live_target("did:ma:bob#room/path", &cfg).is_err());
        assert!(resolve_live_target("@missing", &cfg).is_err());
    }

    #[test]
    fn published_self_matches_own_did() {
        let doc = document_with_environment(Some("bafyprofile"), None);

        assert!(published_self_matches(&doc, &doc.id).is_ok());
    }

    #[test]
    fn published_self_rejects_wrong_did() {
        let doc = document_with_environment(Some("bafyprofile"), None);

        assert!(published_self_matches(&doc, "did:ma:other").is_err());
    }

    // ── `.ma` queue behaviour ──────────────────────────────────────────────

    fn logged_in_state() -> AppState {
        let state = AppState::new();
        state.session.set(Some(SessionState {
            username: "alice".to_string(),
            is_new: false,
            iroh_key: [1; 32],
            ipns_secret_key: [2; 32],
            did_signing_key: [3; 32],
            did_encryption_key: [4; 32],
            sender_did: "did:ma:alice".to_string(),
            created_at: "2026-08-08T12:00:00Z".to_string(),
        }));
        state
    }

    fn drain_ma_queue(state: &AppState) -> Vec<MaOp> {
        let drained: Vec<MaOp> = state.ma_queue.get_untracked().into_iter().collect();
        state
            .ma_queue
            .update_untracked(std::collections::VecDeque::clear);
        drained
    }

    #[test]
    fn handle_ma_set_enqueues_without_touching_config() {
        let state = logged_in_state();
        let config = RwSignal::new(OperatorConfig::default());
        let show_editor = RwSignal::new(None);
        let on_eval = Callback::new(|_: String| ());

        let result = handle_ma(
            ".ma",
            "set",
            &["did:ma:trusted".to_string()],
            &state,
            config,
            show_editor,
            on_eval,
        );

        assert!(result.is_ok());
        assert_eq!(
            drain_ma_queue(&state),
            vec![MaOp::Set {
                did: "did:ma:trusted".to_string()
            }]
        );
        assert_eq!(config.get_untracked().get(MA_CTX_DID), None);
    }

    #[test]
    fn handle_ma_publish_requires_trusted_runtime() {
        let state = logged_in_state();
        let config = RwSignal::new(OperatorConfig::default());
        let show_editor = RwSignal::new(None);
        let on_eval = Callback::new(|_: String| ());

        let result = handle_ma(".ma", "publish", &[], &state, config, show_editor, on_eval);

        assert!(result.is_err());
        assert!(drain_ma_queue(&state).is_empty());
    }

    #[test]
    fn handle_ma_publish_enqueues_trusted_runtime() {
        let state = logged_in_state();
        let config = RwSignal::new(OperatorConfig::default());
        config.update(|cfg| cfg.set(MA_CTX_DID, "did:ma:trusted"));
        let show_editor = RwSignal::new(None);
        let on_eval = Callback::new(|_: String| ());

        let result = handle_ma(".ma", "publish", &[], &state, config, show_editor, on_eval);

        assert!(result.is_ok());
        assert_eq!(
            drain_ma_queue(&state),
            vec![MaOp::Publish {
                trusted_ma: "did:ma:trusted".to_string()
            }]
        );
    }

    #[test]
    fn handle_ma_claim_enqueues_default_and_custom_port() {
        let state = logged_in_state();
        let config = RwSignal::new(OperatorConfig::default());
        let show_editor = RwSignal::new(None);
        let on_eval = Callback::new(|_: String| ());

        assert!(handle_ma(".ma", "claim", &[], &state, config, show_editor, on_eval).is_ok());
        assert_eq!(drain_ma_queue(&state), vec![MaOp::Claim { port: 5003 }]);

        assert!(handle_ma(
            ".ma",
            "claim",
            &["6003".to_string()],
            &state,
            config,
            show_editor,
            on_eval,
        )
        .is_ok());
        assert_eq!(drain_ma_queue(&state), vec![MaOp::Claim { port: 6003 }]);
    }

    #[test]
    fn handle_ma_claim_rejects_invalid_port() {
        let state = logged_in_state();
        let config = RwSignal::new(OperatorConfig::default());
        let show_editor = RwSignal::new(None);
        let on_eval = Callback::new(|_: String| ());

        assert!(handle_ma(
            ".ma",
            "claim",
            &["not-a-port".to_string()],
            &state,
            config,
            show_editor,
            on_eval,
        )
        .is_err());
        assert!(drain_ma_queue(&state).is_empty());
    }

    #[test]
    fn set_trusted_runtime_writes_config_and_alias() {
        let state = AppState::new();
        let config = RwSignal::new(OperatorConfig::default());

        set_trusted_runtime("did:ma:trusted", &state, config);

        let cfg = config.get_untracked();
        assert_eq!(cfg.get(MA_CTX_DID), Some("did:ma:trusted"));
        assert_eq!(cfg.get(".my.aliases.ma"), Some("did:ma:trusted"));
    }
}
