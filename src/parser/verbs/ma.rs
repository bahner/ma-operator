use super::resolve_bare_did;
use crate::config::EgoConfig;
use crate::http::{fetch_url_text_timeout, post_json_text_timeout};
use crate::i18n::{t, tf};
use crate::identity::load_identity;
use crate::state::{AppState, PendingKind};
use crate::transport;
use crate::views::editor::EditorContext;
use futures::FutureExt as _;
use leptos::prelude::*;
use ma_core::DidDocumentResolver;

pub(crate) const LOCAL_MA_HTTP_TIMEOUT_MS: u32 = 2_000;
pub(crate) const RUNTIME_PING_TIMEOUT_MS: u32 = 5_000;
pub(crate) const IDENTITY_PUBLISH_TIMEOUT_MS: u32 = 60_000;
const SELF_PUBLISH_VERIFY_DELAYS_MS: &[u32] = &[500, 1_000, 2_000, 3_000, 5_000, 8_000];
const MA_CTX_DID: &str = ".ma.ctx.did";
const MA_CTX_URL: &str = ".ma.ctx.url";

pub(crate) fn active_ma_did(cfg: &EgoConfig) -> Option<String> {
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
    config: RwSignal<EgoConfig>,
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

    match verb {
        "set" => return set_trusted_runtime(args, state, config),
        "claim" => return claim_trusted_runtime(args, state, config),
        "publish" => {}
        _ => return Err(tf("runtime-no-verb", &[("verb", verb), ("path", path)])),
    }

    let cfg = config.get_untracked();
    let trusted_ma = active_ma_did(&cfg)
        .ok_or_else(|| "no trusted runtime; use .ma: did:ma:… or .ma: claim [port]".to_string())?;
    let state2 = state.clone();
    leptos::task::spawn_local(async move {
        publish_with_trusted_ma(trusted_ma, config, &state2).await;
    });
    Ok(())
}

async fn publish_with_trusted_ma(
    trusted_ma: String,
    config: RwSignal<EgoConfig>,
    state: &AppState,
) {
    queue_profile_publish(trusted_ma, config, state, None, true, true).await;
}

fn set_trusted_runtime(
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let did = args
        .first()
        .filter(|_| args.len() == 1)
        .ok_or_else(|| "usage: .ma: did:ma:trustedruntime".to_string())?;
    let did = resolve_bare_did(did, &config.get_untracked())?;
    config.update(|cfg| {
        cfg.set(MA_CTX_DID, &did);
        cfg.set(".my.aliases.ma", &did);
    });
    let username = state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?
        .username;
    let cfg = config.get_untracked();
    leptos::task::spawn_local(async move {
        let _ = crate::config::persist_config(&username, &cfg).await;
    });
    state.push_system(format!("ma: {did}"));
    Ok(())
}

fn claim_trusted_runtime(
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let port = match args {
        [] => 5003,
        [port] => port
            .parse::<u16>()
            .map_err(|_| "usage: .ma: claim [port]".to_string())?,
        _ => return Err("usage: .ma: claim [port]".to_string()),
    };
    let session = state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?;
    let username = session.username;
    let our_did = session.sender_did;
    let state2 = state.clone();
    leptos::task::spawn_local(async move {
        claim_and_discover_local_ma(
            state2,
            config,
            username,
            our_did,
            format!("http://localhost:{port}"),
        )
        .await;
    });
    Ok(())
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
    config: RwSignal<EgoConfig>,
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
    if let Err(error) = transport::reconnect().await {
        web_sys::console::warn_1(
            &format!("[transport] reconnect after ma discovery failed: {error}").into(),
        );
    }
    let cfg = config.get_untracked();
    let _ = crate::config::persist_config(&username, &cfg).await;
    ConnectMaOutcome::Ready { did }
}

pub(crate) async fn connect_trusted_ma_on_startup(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    username: &str,
    did: String,
    own_did: &str,
) -> ConnectMaOutcome {
    if verify_self_publication(own_did).await.is_err() {
        state.push_system(tf(
            "msg-identity-first-publish",
            &[(
                "seconds",
                &(IDENTITY_PUBLISH_TIMEOUT_MS / 1_000).to_string(),
            )],
        ));
        let selected_z = config.get_untracked().get(".my.z").map(str::to_string);
        if let Err(e) = send_identity_publish_and_wait(&did, Some(did.clone()), selected_z).await {
            log::warn!("[ma] fallback identity pre-publish failed before ping: {e}");
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

async fn ping_runtime(state: &AppState, did: &str) -> Result<(), String> {
    state.push_system(tf("msg-runtime-pinging", &[("did", did)]));
    let send_and_wait = async move {
        let mut rx = None;
        let mut registered_msg_id = None;
        let send_result = transport::send_rpc_with_msg_id(did, "ping", &[], |msg_id| {
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
        () = gloo_timers::future::TimeoutFuture::new(IDENTITY_PUBLISH_TIMEOUT_MS).fuse() => Err("identity publish timed out".to_string()),
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

pub(crate) fn published_environment_matches(
    doc: &ma_core::Document,
    own_did: &str,
    profile_cid: &str,
    z_cid: &str,
) -> Result<(), String> {
    published_self_matches(doc, own_did)?;
    let published_profile = crate::parser::verbs::doc_profile_cid(doc)
        .ok_or_else(|| "resolved DID document has no ma.profile link".to_string())?;
    if published_profile != profile_cid {
        return Err(format!(
            "resolved DID document profile {published_profile} does not match {profile_cid}"
        ));
    }
    let published_z = crate::parser::verbs::doc_z_cid(doc)
        .ok_or_else(|| "resolved DID document has no ma.z link".to_string())?;
    if published_z != z_cid {
        return Err(format!(
            "resolved DID document z manifest {published_z} does not match {z_cid}"
        ));
    }
    Ok(())
}

pub(crate) async fn verify_environment_publication(
    own_did: &str,
    profile_cid: &str,
    z_cid: &str,
) -> Result<(), String> {
    let resolver = crate::state::SESSION_RESOLVER
        .with(|r| r.borrow().clone())
        .ok_or_else(|| "DID resolver is not available".to_string())?;
    let mut last_error = "DID document was not resolved".to_string();
    for (attempt, delay_ms) in SELF_PUBLISH_VERIFY_DELAYS_MS.iter().enumerate() {
        match resolver.resolve(own_did).await {
            Ok(doc) => match published_environment_matches(&doc, own_did, profile_cid, z_cid) {
                Ok(()) => return Ok(()),
                Err(error) => last_error = error,
            },
            Err(error) => last_error = error.to_string(),
        }
        if attempt + 1 < SELF_PUBLISH_VERIFY_DELAYS_MS.len() {
            gloo_timers::future::TimeoutFuture::new(*delay_ms).await;
        }
    }
    Err(last_error)
}

pub(crate) async fn verify_self_publication(own_did: &str) -> Result<(), String> {
    let resolver = crate::state::SESSION_RESOLVER
        .with(|r| r.borrow().clone())
        .ok_or_else(|| "DID resolver is not available".to_string())?;
    let mut last_error = "DID document was not resolved".to_string();
    for (attempt, delay_ms) in SELF_PUBLISH_VERIFY_DELAYS_MS.iter().enumerate() {
        match resolver.resolve(own_did).await {
            Ok(doc) => match published_self_matches(&doc, own_did) {
                Ok(()) => return Ok(()),
                Err(e) => last_error = e,
            },
            Err(e) => last_error = e.to_string(),
        }
        if attempt + 1 < SELF_PUBLISH_VERIFY_DELAYS_MS.len() {
            gloo_timers::future::TimeoutFuture::new(*delay_ms).await;
        }
    }
    Err(last_error)
}

/// Optionally publish `.z`, build and upload the profile blob, then queue the
/// DID republish. The initial DID publish authenticates the store requests.
/// Pass `cmd_id = Some(id)` to track the operation as a terminal command.
pub(crate) async fn queue_profile_publish(
    publisher: String,
    config: RwSignal<EgoConfig>,
    state: &AppState,
    cmd_id: Option<u64>,
    reenter_saved_ctx: bool,
    publish_z: bool,
) {
    let Some(username) = state.session.get_untracked().map(|s| s.username.clone()) else {
        fail_profile_publish(state, cmd_id, t("msg-not-logged-in"));
        return;
    };
    // Step 1: Publish the DID document so the runtime can authenticate the
    // profile-store request and route its reply to our current endpoint.
    let trusted_ma = active_ma_did(&config.get_untracked());
    let selected_z = config.get_untracked().get(".my.z").map(str::to_string);
    if let Err(error) = send_identity_publish_and_wait(&publisher, trusted_ma, selected_z).await {
        fail_profile_publish(state, cmd_id, error);
        return;
    }
    if publish_z {
        let parts = crate::parser::verbs::doc::z_tree_parts(&config.get_untracked());
        if parts.is_empty() {
            fail_profile_publish(state, cmd_id, tf("doc-content-empty", &[("path", ".z")]));
            return;
        }
        if let Err(error) = crate::parser::verbs::doc::publish_z_tree_and_select(
            &publisher, parts, &username, config,
        )
        .await
        {
            fail_profile_publish(state, cmd_id, error);
            return;
        }
    }
    let encrypted_profile = match build_encrypted_profile(&username, config).await {
        Ok(profile) => profile,
        Err(error) => {
            fail_profile_publish(state, cmd_id, error);
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
                verify_environment: publish_z,
            },
            None,
        ),
        Err(error) => fail_profile_publish(state, cmd_id, error),
    }
}

async fn build_encrypted_profile(
    username: &str,
    config: RwSignal<EgoConfig>,
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

fn fail_profile_publish(state: &AppState, cmd_id: Option<u64>, error: String) {
    if let Some(id) = cmd_id {
        state.resolve_command_by_id(id, crate::core::CommandStatus::Error(error.clone()));
    }
    state.push_error(tf("profile-publish-failed", &[("e", &error)]));
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
        .and_then(serde_json::Value::as_bool)
        .unwrap_or(false);
    let ipfs_requests = json
        .get("ipfs_requests")
        .and_then(serde_json::Value::as_u64)
        .unwrap_or(0);
    let rpc_requests = json
        .get("rpc_requests")
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

fn handle_ma_live(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
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

fn resolve_live_target(arg: &str, cfg: &EgoConfig) -> Result<String, String> {
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
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.alice", "did:ma:alice");

        assert_eq!(resolve_live_target("@alice", &cfg).unwrap(), "did:ma:alice");
        assert_eq!(
            resolve_live_target("did:ma:bob", &cfg).unwrap(),
            "did:ma:bob"
        );
    }

    #[test]
    fn resolve_live_target_rejects_path_targets() {
        let cfg = EgoConfig::default();

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

    #[test]
    fn published_environment_requires_matching_profile_and_z_links() {
        let profile = "bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy";
        let z = "bafkreib6oa4x3sokuyh4lq4pnq2tw7qkf7nb5u4u6j7q7g3kqpw2rp5nmu";
        let doc = document_with_environment(Some(profile), Some(z));

        assert!(published_environment_matches(&doc, &doc.id, profile, z).is_ok());
        assert!(published_environment_matches(&doc, &doc.id, "bafymismatch", z).is_err());
        assert!(published_environment_matches(&doc, &doc.id, profile, "bafymismatch").is_err());
    }
}
