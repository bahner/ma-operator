//! Session startup helpers: config loading, history, iroh connect, DID sync.

use leptos::prelude::*;
use ma_core::DidDocumentResolver;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    http::fetch_cid_bytes,
    i18n::{t, tf},
    identity::storage::load_history,
    parser::verbs::ma::ConnectMaOutcome,
    state::{AppState, SessionState},
    transport,
};

pub(crate) async fn startup_profile_exists(
    doc: ma_core::Document,
    username: String,
    state: AppState,
    config: RwSignal<EgoConfig>,
) {
    let remote_cid = match crate::parser::verbs::doc_profile_cid(&doc) {
        Some(c) => c,
        None => return, // No ma.agent — nothing to merge.
    };
    let local_cid = crate::state::SESSION_AGENT_CID.with(|c| c.borrow().clone());
    if local_cid.as_deref() == Some(remote_cid.as_str()) {
        return; // Already up to date — silent.
    }
    let cbor_bytes = match fetch_cid_bytes(&remote_cid).await {
        Ok(b) => b,
        Err(_) => return,
    };
    let profile_val: serde_json::Value = match serde_ipld_dagcbor::from_slice(&cbor_bytes) {
        Ok(v) => v,
        Err(_) => return,
    };
    // Guard: only merge if the DID document is strictly newer than the last time
    // this device published. This prevents IPNS propagation lag from overwriting
    // freshly-published local state — after a publish the DID can still resolve
    // to the previous document for some time, causing a spurious merge that
    // restores deleted aliases.
    // If `.my.profile.published_at` is absent (old install, first publish) we
    // fall through and merge to stay backward-compatible.
    let doc_updated_at = doc.updated_at.as_str();
    let local_published_at = config
        .get_untracked()
        .get(EgoConfig::PROFILE_PUBLISHED_AT_KEY)
        .map(|s| s.to_string());
    if let Some(ref local) = local_published_at {
        if doc_updated_at <= local.as_str() {
            // DID doc is same age or older — remote blob is stale (IPNS lag).
            return;
        }
    }
    crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(remote_cid.clone()));
    let n = config
        .try_update(|cfg| {
            let merged = cfg.merge_from_nested_profile(&profile_val);
            if merged.is_ok() {
                cfg.set(EgoConfig::PROFILE_CID_KEY, &remote_cid);
            }
            merged
        })
        .and_then(|r| r.ok())
        .map(|(count, _)| count)
        .unwrap_or(0);
    state.push_system(tf("profile-fetch-done", &[("n", &n.to_string())]));
    let cfg = config.get_untracked();
    let _ = persist_config(&username, &cfg).await;
}

fn startup_ma_url(config: RwSignal<EgoConfig>, startup_ma: Option<&str>) -> String {
    if let Some(url) = startup_ma.filter(|v| v.starts_with("http")) {
        return url.trim_end_matches('/').to_string();
    }
    config
        .get_untracked()
        .get(".ma.ctx.url")
        .unwrap_or("http://localhost:5003")
        .trim_end_matches('/')
        .to_string()
}

pub(crate) async fn startup_local_ma(
    state: AppState,
    config: RwSignal<EgoConfig>,
    username: String,
    sender_did: String,
    startup_ma: Option<String>,
    startup_enter: Option<String>,
) -> ConnectMaOutcome {
    let ma_url = startup_ma_url(config, startup_ma.as_deref());
    let fallback_did = startup_ma
        .as_deref()
        .filter(|did| did.starts_with("did:ma:"))
        .map(ToString::to_string);
    let fallback_did =
        fallback_did.or_else(|| startup_enter_publish_did(config, startup_enter.as_deref()));
    crate::parser::verbs::ma::connect_ma_runtime(
        state,
        config,
        username,
        sender_did,
        ma_url,
        fallback_did,
        crate::parser::verbs::ma::ConnectMaOptions {
            publish: false,
            full_profile_publish: false,
        },
    )
    .await
}

pub(crate) async fn startup_did_sync(
    own_did: String,
    username: String,
    state: AppState,
    config: RwSignal<EgoConfig>,
) {
    let resolver = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone());
    let Some(resolver) = resolver else { return };
    if let Ok(doc) = (*resolver).resolve(&own_did).await {
        startup_profile_exists(doc, username, state, config).await;
    }
}

pub(crate) async fn startup_load_config(
    state: AppState,
    config: RwSignal<EgoConfig>,
    username: String,
    sender_did: String,
) {
    match restore_config(&username).await {
        Ok(mut cfg) => {
            // Read-only session-derived field; never persisted
            // intentionally, but harmless if it leaks: it is
            // re-injected on every login.
            cfg.set(".my.identity.did", &sender_did);
            // Seed auto-publish with default "true" if not already set.
            if cfg.get(".my.identity.auto-publish").is_none() {
                cfg.set(".my.identity.auto-publish", "true");
            }
            // Prune inbox entries that expired since last session.
            let now = js_sys::Date::now() / 1000.0;
            let pruned = crate::mailbox::prune_inbox_expired(&mut cfg, now);
            crate::eval::apply_config_to_dom(&cfg);
            // Persisted ctx is an enter intent, not confirmed focus. Root will
            // repair and return the authoritative ctx after startup connect.
            state.focus_actor.set(None);
            // Apply log level from config if set.
            if let Some(level) = cfg.get(".my.config.log.level") {
                crate::apply_log_level(level);
            }
            if pruned > 0 {
                if let Err(e) = persist_config(&username, &cfg).await {
                    state.push_error(tf("err-inbox-prune-persist", &[("e", &e)]));
                }
            }
            config.set(cfg);
        }
        Err(e) => state.push_error(tf("err-config-load", &[("e", &e)])),
    }
    if let Some(profile_cid) = config
        .get_untracked()
        .get(EgoConfig::PROFILE_CID_KEY)
        .filter(|cid| !cid.is_empty())
        .map(|cid| cid.to_string())
    {
        crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(profile_cid));
    }
    // Re-apply language preference from config if set.
    if let Some(lang) = config
        .get_untracked()
        .get(".my.i18n")
        .map(|s| s.to_string())
    {
        let first = lang.split(':').next().unwrap_or(&lang).to_string();
        crate::i18n::init(&first).await;
        state.lang.set(crate::i18n::lang());
        crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(lang));
    } else {
        // No preference stored yet — seed .my.i18n from the browser-detected language.
        let browser_lang = crate::i18n::lang();
        state.lang.set(browser_lang.clone());
        crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(browser_lang.clone()));
        let mut cfg = config.get_untracked();
        cfg.set(".my.i18n", &browser_lang);
        if let Err(e) = persist_config(&username, &cfg).await {
            state.push_error(tf("err-lang-persist", &[("e", &e)]));
        }
        config.set(cfg);
    }
    state.push_system(tf(
        "msg-logged-in",
        &[
            ("version", env!("CARGO_PKG_VERSION")),
            ("username", &username),
        ],
    ));
    state.push_system(t("msg-type-help"));
}

fn normalize_startup_enter(runtime: String) -> String {
    if runtime.starts_with('@') || runtime.contains('@') {
        runtime
    } else {
        format!("@{runtime}")
    }
}

fn startup_ctx_enter(cfg: &EgoConfig) -> Option<String> {
    if cfg.get(".my.ctx.use") != Some("true") {
        return None;
    }
    let runtime = cfg.get(".my.ctx.runtime")?.trim();
    if runtime.is_empty() {
        return None;
    }
    let room = cfg
        .get(".my.ctx.room")
        .map(str::trim)
        .filter(|room| room.starts_with(&format!("{runtime}#")))
        .unwrap_or(runtime);
    let nick = cfg.get(".my.ctx.nick").map(str::trim).filter(|nick| {
        !nick.is_empty() && !nick.contains('@') && !nick.chars().any(char::is_whitespace)
    });
    Some(match nick {
        Some(nick) => format!("{nick}@{room}"),
        None => normalize_startup_enter(room.to_string()),
    })
}

fn startup_enter_publish_did(
    config: RwSignal<EgoConfig>,
    startup_enter: Option<&str>,
) -> Option<String> {
    let raw = normalize_startup_enter(startup_enter?.to_string());
    let target = if let Some(stripped) = raw.strip_prefix('@') {
        stripped
    } else {
        raw.split_once('@')?.1
    };
    let runtime = target
        .split_once('#')
        .map(|(did, _)| did)
        .unwrap_or(target)
        .trim();
    if runtime.starts_with("did:ma:") {
        return Some(runtime.to_string());
    }
    let cfg = config.get_untracked();
    let resolved = cfg.resolve_alias(runtime)?;
    let did = resolved
        .split_once('#')
        .map(|(did, _)| did)
        .unwrap_or(resolved)
        .trim();
    did.starts_with("did:ma:").then(|| did.to_string())
}

fn queue_startup_context(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    discovered_runtime_did: Option<&str>,
) {
    let explicit = state
        .startup_enter
        .update_untracked(|v| v.take())
        .map(normalize_startup_enter);
    if let Some(runtime) = explicit {
        state
            .input_queue
            .update(|q| q.push_back(format!(".enter {runtime}")));
        return;
    }
    let cfg = config.get_untracked();
    let fallback_enter = startup_ctx_enter(&cfg)
        .or_else(|| discovered_runtime_did.map(|did| normalize_startup_enter(did.to_string())));
    if let Some(runtime) = fallback_enter {
        state
            .input_queue
            .update(|q| q.push_back(format!(".enter {runtime}")));
    }
}

fn should_queue_startup_enter(outcome: &ConnectMaOutcome) -> bool {
    outcome.allows_startup_enter()
}

fn skip_startup_enter_message(outcome: &ConnectMaOutcome) -> String {
    tf("msg-startup-enter-skipped", &[("target", outcome.target())])
}

#[cfg(test)]
mod tests {
    use super::{normalize_startup_enter, should_queue_startup_enter, startup_ctx_enter};
    use crate::config::EgoConfig;
    use crate::parser::verbs::ma::ConnectMaOutcome;

    #[test]
    fn normalize_startup_enter_accepts_url_did_and_alias_forms() {
        assert_eq!(
            normalize_startup_enter("did:ma:k51example".to_string()),
            "@did:ma:k51example"
        );
        assert_eq!(normalize_startup_enter("sky".to_string()), "@sky");
        assert_eq!(normalize_startup_enter("@sky".to_string()), "@sky");
        assert_eq!(
            normalize_startup_enter("Armageddon@sky".to_string()),
            "Armageddon@sky"
        );
    }

    #[test]
    fn startup_ctx_enter_reestablishes_nick_runtime_room_intent() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.use", "true");
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51runtime#construct");
        cfg.set(".my.ctx.nick", "klaim");
        assert_eq!(
            startup_ctx_enter(&cfg),
            Some("klaim@did:ma:k51runtime#construct".to_string())
        );
    }

    #[test]
    fn startup_ctx_enter_falls_back_to_runtime_without_safe_nick_or_room() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.use", "true");
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51other#construct");
        cfg.set(".my.ctx.nick", "bad nick");
        assert_eq!(
            startup_ctx_enter(&cfg),
            Some("@did:ma:k51runtime".to_string())
        );
    }

    #[test]
    fn startup_enter_requires_ready_ma_outcome() {
        assert!(should_queue_startup_enter(&ConnectMaOutcome::Ready {
            did: "did:ma:k51runtime".to_string(),
        }));
        assert!(!should_queue_startup_enter(
            &ConnectMaOutcome::PingTimedOut {
                did: "did:ma:k51runtime".to_string(),
            }
        ));
        assert!(!should_queue_startup_enter(
            &ConnectMaOutcome::Unavailable {
                target: "http://localhost:5003".to_string(),
            }
        ));
    }
}

pub(crate) async fn startup_load_history(state: AppState, username: String) {
    match load_history(&username).await {
        Ok(Some(json)) => match serde_json::from_str::<Vec<String>>(&json) {
            Ok(hist) => state.history.set(hist),
            Err(e) => state.push_error(tf("err-history-parse", &[("e", &e.to_string())])),
        },
        Ok(None) => {}
        Err(e) => state.push_error(tf("err-history-load", &[("e", &e)])),
    }
}

pub(crate) async fn startup_connect(
    state: AppState,
    config: RwSignal<EgoConfig>,
    sess: SessionState,
    startup_ma: Option<String>,
) {
    let iroh_key = sess.iroh_key;
    let ipns_secret_key = sess.ipns_secret_key;
    let did_signing_key = sess.did_signing_key;
    let did_encryption_key = sess.did_encryption_key;
    let sender_did = sess.sender_did.clone();
    let created_at = sess.created_at.clone();
    let username = sess.username.clone();
    state.push_system(t("msg-connecting"));
    match transport::connect(
        iroh_key,
        ipns_secret_key,
        did_signing_key,
        did_encryption_key,
        sender_did.clone(),
        created_at,
    )
    .await
    {
        Ok(()) => {
            let endpoint_id = transport::get_endpoint_id().unwrap_or_default();
            state.push_system(format!("{} — {}", t("msg-iroh-ready"), endpoint_id));
            startup_did_sync(sender_did.clone(), username.clone(), state.clone(), config).await;
            let startup_enter = state.startup_enter.get_untracked();
            let ma_outcome = startup_local_ma(
                state.clone(),
                config,
                username,
                sender_did,
                startup_ma,
                startup_enter,
            )
            .await;
            if should_queue_startup_enter(&ma_outcome) {
                let discovered_runtime_did = match &ma_outcome {
                    ConnectMaOutcome::Ready { did } => Some(did.as_str()),
                    _ => None,
                };
                queue_startup_context(&state, config, discovered_runtime_did);
            } else {
                state.startup_enter.update_untracked(|v| {
                    let _ = v.take();
                });
                state.push_system(skip_startup_enter_message(&ma_outcome));
            }
        }
        Err(e) => state.push_error(tf("msg-iroh-failed", &[("e", &e)])),
    }
}
