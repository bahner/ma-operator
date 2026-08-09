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
use ma_core::DidDocumentResolver;

pub(crate) const LOCAL_MA_HTTP_TIMEOUT_MS: u32 = 2_000;
pub(crate) const RUNTIME_PING_TIMEOUT_MS: u32 = 5_000;
pub(crate) const IDENTITY_PUBLISH_TIMEOUT_MS: u32 = 60_000;
const SELF_PUBLISH_VERIFY_DELAYS_MS: &[u32] = &[500, 1_000, 2_000, 3_000, 5_000, 8_000];
const MA_CTX_DID: &str = ".ma.ctx.did";
const MA_CTX_MODE: &str = ".ma.ctx.mode";
const MA_CTX_URL: &str = ".ma.ctx.url";

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum MaRuntimeMode {
    Local,
    Public,
}

impl MaRuntimeMode {
    fn as_str(self) -> &'static str {
        match self {
            Self::Local => "local",
            Self::Public => "public",
        }
    }
}

pub(crate) fn ma_runtime_mode(cfg: &EgoConfig) -> Option<MaRuntimeMode> {
    match cfg.get(MA_CTX_MODE) {
        Some("local") => Some(MaRuntimeMode::Local),
        Some("public") => Some(MaRuntimeMode::Public),
        _ => None,
    }
}

pub(crate) fn stored_ma_did(cfg: &EgoConfig) -> Option<String> {
    cfg.get(MA_CTX_DID)
        .filter(|did| did.starts_with("did:ma:"))
        .map(ToString::to_string)
}

pub(crate) fn stored_public_ma_did(cfg: &EgoConfig) -> Option<String> {
    matches!(ma_runtime_mode(cfg), Some(MaRuntimeMode::Public))
        .then(|| stored_ma_did(cfg))
        .flatten()
}

pub(crate) fn stored_local_ma_url(cfg: &EgoConfig) -> Option<String> {
    matches!(ma_runtime_mode(cfg), Some(MaRuntimeMode::Local)).then(|| {
        cfg.get(MA_CTX_URL)
            .unwrap_or(MA_URL)
            .trim_end_matches('/')
            .to_string()
    })
}

fn set_ma_runtime_mode(cfg: &mut EgoConfig, mode: MaRuntimeMode) {
    cfg.set(MA_CTX_MODE, mode.as_str());
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
    if verb != "connect" {
        return Err(tf("runtime-no-verb", &[("verb", verb), ("path", path)]));
    }
    state
        .session
        .get_untracked()
        .ok_or_else(|| t("msg-not-logged-in"))?;

    let raw = args.first().map_or("", std::string::String::as_str);
    let cfg = config.get_untracked();
    let ma_base = ma_base_from_arg(raw, &cfg);
    let fallback_did = fallback_did_from_arg(raw, &cfg)?;
    let local_probe = fallback_did.is_none();
    let prefer_fallback_did = fallback_did.is_some();
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
                reenter_saved_ctx: true,
                quiet_local_probe: false,
                publish_identity_before_ping: false,
                prefer_fallback_did,
                local_probe,
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
    cfg.get(MA_CTX_URL)
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
    pub reenter_saved_ctx: bool,
    pub quiet_local_probe: bool,
    pub publish_identity_before_ping: bool,
    pub prefer_fallback_did: bool,
    pub local_probe: bool,
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
    if options.prefer_fallback_did {
        let outcome = ping_and_publish_fallback(
            &state,
            config,
            fallback_did.clone(),
            &ma_base,
            &our_did,
            options,
        )
        .await;
        if matches!(outcome, ConnectMaOutcome::Ready { .. }) {
            let cfg = config.get_untracked();
            let _ = crate::config::persist_config(&username, &cfg).await;
            return outcome;
        }
    }

    if options.local_probe {
        let status_url = format!("{}/status.json", ma_base.trim_end_matches('/'));
        if !options.quiet_local_probe {
            state.push_system(tf("msg-ma-checking-url", &[("url", &status_url)]));
        }
        let claim_result = claim_ma(&ma_base, &our_did).await;
        if !options.quiet_local_probe {
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
        }
        if !should_continue_after_claim(&claim_result) {
            let outcome = ping_and_publish_fallback(
                &state,
                config,
                fallback_did,
                &ma_base,
                &our_did,
                options,
            )
            .await;
            if matches!(outcome, ConnectMaOutcome::Ready { .. }) {
                let cfg = config.get_untracked();
                let _ = crate::config::persist_config(&username, &cfg).await;
            }
            return outcome;
        }

        let did = if let Ok(did) = rediscover_ma(&ma_base, config).await {
            did
        } else {
            if !options.quiet_local_probe {
                state.push_error(tf(
                    "msg-local-ma-unreachable",
                    &[
                        ("url", &ma_base),
                        ("seconds", &(LOCAL_MA_HTTP_TIMEOUT_MS / 1_000).to_string()),
                    ],
                ));
            }
            let outcome = ping_and_publish_fallback(
                &state,
                config,
                fallback_did,
                &ma_base,
                &our_did,
                options,
            )
            .await;
            if matches!(outcome, ConnectMaOutcome::Ready { .. }) {
                let cfg = config.get_untracked();
                let _ = crate::config::persist_config(&username, &cfg).await;
            }
            return outcome;
        };
        state.push_system(tf("discover-success", &[("url", &ma_base)]));
        state.push_system(tf("discover-did-line", &[("did", &did)]));
        if let Err(e) = transport::reconnect().await {
            web_sys::console::warn_1(
                &format!("[transport] reconnect after ma discovery failed: {e}").into(),
            );
        }
        crate::views::landing::save_last_runtime(&ma_base);
        let cfg = config.get_untracked();
        let _ = crate::config::persist_config(&username, &cfg).await;
        if !options.publish {
            return ConnectMaOutcome::Ready { did };
        }
        if !options.full_profile_publish {
            send_identity_publish_background(did.clone(), state.clone(), ma_base.clone());
            return ConnectMaOutcome::Ready { did };
        }

        let published =
            do_publish(did.clone(), config, &state, None, options.reenter_saved_ctx).await;
        if !published {
            let outcome = ping_and_publish_fallback(
                &state,
                config,
                fallback_did,
                &ma_base,
                &our_did,
                options,
            )
            .await;
            if matches!(outcome, ConnectMaOutcome::Ready { .. }) {
                let cfg = config.get_untracked();
                let _ = crate::config::persist_config(&username, &cfg).await;
            }
            return outcome;
        }
        return ConnectMaOutcome::Ready { did };
    }

    let outcome =
        ping_and_publish_fallback(&state, config, fallback_did, &ma_base, &our_did, options).await;
    if matches!(outcome, ConnectMaOutcome::Ready { .. }) {
        let cfg = config.get_untracked();
        let _ = crate::config::persist_config(&username, &cfg).await;
    }
    outcome
}

fn send_identity_publish_background(publisher: String, state: AppState, label: String) {
    leptos::task::spawn_local(async move {
        match send_identity_publish_and_wait(&publisher).await {
            Ok(()) => {
                state.push_system(tf("msg-auto-published", &[("url", &label)]));
            }
            Err(e) => {
                log::warn!("[ma] background identity publish failed: {e}");
            }
        }
    });
}

fn fallback_did_candidate(
    config: RwSignal<EgoConfig>,
    fallback_did: Option<String>,
) -> Option<String> {
    fallback_did.or_else(|| stored_public_ma_did(&config.get_untracked()))
}

async fn ping_and_publish_fallback(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    fallback_did: Option<String>,
    unavailable_target: &str,
    own_did: &str,
    options: ConnectMaOptions,
) -> ConnectMaOutcome {
    let Some(did) = fallback_did_candidate(config, fallback_did) else {
        return ConnectMaOutcome::Unavailable {
            target: unavailable_target.to_string(),
        };
    };
    if options.publish_identity_before_ping && verify_self_publication(own_did).await.is_err() {
        state.push_system(tf(
            "msg-identity-first-publish",
            &[(
                "seconds",
                &(IDENTITY_PUBLISH_TIMEOUT_MS / 1_000).to_string(),
            )],
        ));
        if let Err(e) = send_identity_publish_and_wait(&did).await {
            log::warn!("[ma] fallback identity pre-publish failed before ping: {e}");
        }
    }
    if let Ok(()) = ping_runtime(state, &did).await {
    } else {
        state.push_error(tf(
            "msg-runtime-ping-timeout",
            &[
                ("did", &did),
                ("seconds", &(RUNTIME_PING_TIMEOUT_MS / 1_000).to_string()),
            ],
        ));
        return ConnectMaOutcome::PingTimedOut { did };
    }
    config.update(|cfg| {
        cfg.set(MA_CTX_DID, &did);
        set_ma_runtime_mode(cfg, MaRuntimeMode::Public);
        cfg.set(".my.aliases.ma", &did);
    });
    crate::views::landing::save_last_runtime(&did);
    if !options.publish {
        return ConnectMaOutcome::Ready { did };
    }
    let published = if options.full_profile_publish {
        do_publish(did.clone(), config, state, None, options.reenter_saved_ctx).await
    } else {
        send_identity_publish_and_wait(&did).await.is_ok()
    };
    if published {
        state.push_system(tf("msg-auto-published", &[("url", &did)]));
    }
    ConnectMaOutcome::Ready { did }
}

async fn ping_runtime(state: &AppState, did: &str) -> Result<(), String> {
    state.push_system(tf("msg-runtime-pinging", &[("did", did)]));
    let root = crate::transport::actor_url(did, "root")?;
    let send_and_wait = async move {
        let mut rx = None;
        let mut registered_msg_id = None;
        let send_result = transport::send_rpc_with_msg_id(&root, "ping", &[], |msg_id| {
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
            .map(|_| ())
            .map_err(|_| "runtime ping reply was cancelled".to_string())
    }
    .fuse();
    let timeout = gloo_timers::future::TimeoutFuture::new(RUNTIME_PING_TIMEOUT_MS).fuse();
    futures::pin_mut!(send_and_wait, timeout);
    futures::select! {
        result = send_and_wait => result,
        () = timeout => Err("runtime ping timed out".to_string()),
    }
}

pub(crate) async fn send_identity_publish_and_wait(publisher: &str) -> Result<(), String> {
    let mut rx = None;
    let mut registered_msg_id = None;
    let send_result = crate::transport::send_identity_publish_with_msg_id(publisher, |msg_id| {
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
    let rx = rx.ok_or_else(|| "identity publish reply was not registered".to_string())?;
    futures::select! {
        reply = rx.fuse() => reply.map(|_| ()).map_err(|_| "identity publish reply was cancelled".to_string()),
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

/// Build and upload the profile blob to IPFS, then queue the DID republish.
/// Returns `true` if the request was sent, `false` if an error was pushed.
/// Pass `cmd_id = Some(id)` to track the operation as a terminal command.
pub(crate) async fn do_publish(
    publisher: String,
    config: RwSignal<EgoConfig>,
    state: &AppState,
    cmd_id: Option<u64>,
    reenter_saved_ctx: bool,
) -> bool {
    let username = if let Some(u) = state.session.get_untracked().map(|s| s.username.clone()) {
        u
    } else {
        state.push_error(t("msg-not-logged-in"));
        return false;
    };
    // Step 1: Publish the DID document so the runtime can authenticate the
    // profile-store request and route its reply to our current endpoint.
    if let Err(error) = send_identity_publish_and_wait(&publisher).await {
        if let Some(id) = cmd_id {
            state.resolve_command_by_id(id, crate::core::CommandStatus::Error(error.clone()));
        }
        state.push_error(tf("profile-publish-failed", &[("e", &error)]));
        return false;
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
    let profile_key = if let Some(key) =
        crate::state::SESSION_PROFILE_KEY.with(|k| k.borrow().as_ref().copied())
    {
        key
    } else {
        state.push_error(tf(
            "profile-publish-failed",
            &[("e", "missing profile encryption key for this session")],
        ));
        return false;
    };
    let encrypted_profile =
        match crate::profile_crypto::encrypt_with_key(&profile_bytes, &profile_key) {
            Ok(bytes) => bytes,
            Err(e) => {
                state.push_error(tf("profile-publish-failed", &[("e", &e)]));
                return false;
            }
        };
    match crate::transport::send_ipfs_store(
        &publisher,
        encrypted_profile,
        "application/octet-stream",
    )
    .await
    {
        Ok(msg_id) => {
            state.register_pending(
                msg_id,
                PendingKind::ProfilePublish {
                    publisher_did: publisher,
                    cmd_id,
                    reenter_saved_ctx,
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
        set_ma_runtime_mode(cfg, MaRuntimeMode::Local);
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

    fn document_with_profile(profile_cid: Option<&str>) -> ma_core::Document {
        let bundle = SecretBundle::generate();
        let ma = match profile_cid {
            Some(cid) => {
                let profile = cid::Cid::try_from(cid)
                    .map_or_else(|_| Ipld::String(cid.to_string()), Ipld::Link);
                MaExtension::new().kind("agent").extra("profile", profile)
            }
            None => MaExtension::new().kind("agent"),
        };
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

    #[test]
    fn stored_public_ma_did_requires_public_mode() {
        let mut cfg = EgoConfig::default();
        cfg.set(".ma.ctx.did", "did:ma:stored");
        assert_eq!(stored_public_ma_did(&cfg), None);

        cfg.set(".ma.ctx.mode", "local");
        assert_eq!(stored_public_ma_did(&cfg), None);

        cfg.set(".ma.ctx.mode", "public");
        assert_eq!(
            stored_public_ma_did(&cfg),
            Some("did:ma:stored".to_string())
        );
    }

    #[test]
    fn stored_local_ma_url_requires_local_mode() {
        let mut cfg = EgoConfig::default();
        cfg.set(".ma.ctx.url", "http://localhost:5999");
        assert_eq!(stored_local_ma_url(&cfg), None);

        cfg.set(".ma.ctx.mode", "public");
        assert_eq!(stored_local_ma_url(&cfg), None);

        cfg.set(".ma.ctx.mode", "local");
        assert_eq!(
            stored_local_ma_url(&cfg),
            Some("http://localhost:5999".to_string())
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
        let doc = document_with_profile(Some("bafyprofile"));

        assert!(published_self_matches(&doc, &doc.id).is_ok());
    }

    #[test]
    fn published_self_rejects_wrong_did() {
        let doc = document_with_profile(Some("bafyprofile"));

        assert!(published_self_matches(&doc, "did:ma:other").is_err());
    }
}
