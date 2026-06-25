//! Session startup helpers: config loading, history, iroh connect, DID sync.

use leptos::prelude::*;
use ma_core::DidDocumentResolver;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    http::{fetch_cid_bytes, fetch_url_text},
    i18n::{t, tf},
    identity::storage::load_history,
    state::{AppState, SessionState},
    transport,
};

pub(crate) async fn startup_profile_exists(
    doc: ma_core::Document,
    username: String,
    state: AppState,
    config: RwSignal<EgoConfig>,
) {
    let remote_cid = match crate::parser::verbs::doc_agent_cid(&doc) {
        Some(c) => c,
        None => return, // No ma.agent — nothing to merge.
    };
    let local_cid = config
        .get_untracked()
        .get(&format!(".profiles.{username}"))
        .map(|s| s.to_string());
    if local_cid.as_deref() == Some(remote_cid.as_str()) {
        return; // Already up to date — silent.
    }
    let cbor_bytes = match fetch_cid_bytes(&remote_cid).await {
        Ok(b) => b,
        Err(_) => return,
    };
    let json_bytes = match crate::transport::decrypt_profile(&cbor_bytes) {
        Ok(b) => b,
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
    let profile_key = format!(".profiles.{username}");
    config.update(|cfg| cfg.set(&profile_key, &remote_cid));
    let n = config
        .try_update(|cfg| cfg.merge_profile(&json_bytes))
        .and_then(|r| r.ok())
        .unwrap_or(0);
    state.push_system(tf("profile-fetch-done", &[("n", &n.to_string())]));
    let cfg = config.get_untracked();
    let _ = persist_config(&username, &cfg).await;
}

pub(crate) async fn startup_no_document(state: AppState, config: RwSignal<EgoConfig>) {
    let ma_url = {
        let cfg = config.get_untracked();
        cfg.get(".my.ma.url")
            .unwrap_or("http://localhost:5003")
            .trim_end_matches('/')
            .to_string()
    };
    let status_url = format!("{ma_url}/status.json");
    let json_str = match fetch_url_text(&status_url).await {
        Ok(s) => s,
        Err(_) => return, // No local ma — silent.
    };
    let json = match serde_json::from_str::<serde_json::Value>(&json_str) {
        Ok(v) => v,
        Err(_) => return,
    };
    let ma_did = match json
        .get("did")
        .and_then(|v| v.as_str())
        .filter(|s| s.starts_with("did:ma:"))
    {
        Some(d) => d.to_string(),
        None => return,
    };
    let endpoint_id = json
        .get("endpoint_id")
        .and_then(|v| v.as_str())
        .unwrap_or("")
        .to_string();
    config.update(|cfg| {
        cfg.set(".my.ma.did", &ma_did);
        if !endpoint_id.is_empty() {
            cfg.set(".my.ma.endpoint_id", &endpoint_id);
        }
        cfg.set(".my.aliases.ma", &ma_did);
    });
    if let Some(sess) = state.session.get_untracked() {
        let cfg = config.get_untracked();
        let _ = persist_config(&sess.username, &cfg).await;
    }
    if transport::send_ipfs_publish(&ma_did).await.is_ok() {
        state.push_system(tf("msg-auto-published", &[("url", &ma_url)]));
    }
}

pub(crate) async fn startup_did_sync(
    own_did: String,
    username: String,
    state: AppState,
    config: RwSignal<EgoConfig>,
) {
    let resolver = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone());
    let Some(resolver) = resolver else { return };
    match (*resolver).resolve(&own_did).await {
        Ok(doc) => startup_profile_exists(doc, username, state, config).await,
        Err(_) => {
            // Only publish if no CID is stored locally — meaning the document
            // was never published from this device. Any error when a CID exists
            // (504, timeout, etc.) is transient and should not trigger a publish.
            let has_local_cid = config
                .get_untracked()
                .get(&format!(".profiles.{username}"))
                .is_some();
            if !has_local_cid {
                startup_no_document(state, config).await;
            }
        }
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
            // One-time migration: move .my.profile.<username> → .profiles.<username>.
            let old_profile_key = format!(".my.profile.{username}");
            let new_profile_key = format!(".profiles.{username}");
            if cfg.get(&new_profile_key).is_none() {
                if let Some(cid) = cfg.get(&old_profile_key).map(|s| s.to_string()) {
                    cfg.set(&new_profile_key, &cid);
                    cfg.delete(&old_profile_key);
                }
            }
            // Seed SESSION_AGENT_CID from stored profile CID if present.
            if let Some(cid) = cfg.get(&new_profile_key).map(|s| s.to_string()) {
                crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(cid));
            }
            // Prune inbox entries that expired since last session.
            let now = js_sys::Date::now() / 1000.0;
            let pruned = crate::mailbox::prune_inbox_expired(&mut cfg, now);
            crate::eval::apply_config_to_dom(&cfg);
            // Apply log level from config if set.
            if let Some(level) = cfg.get(".config.log.level") {
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
    } else if let Some(lang) = config
        .get_untracked()
        .get(".my.config.ui.language")
        .map(|s| s.to_string())
    {
        crate::i18n::init(&lang).await;
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
            startup_did_sync(sender_did, username, state.clone(), config).await;
            // Auto-subscribe to gossip broadcast channel if enabled.
            let enabled = config
                .get_untracked()
                .get(".my.gossip.enable")
                .unwrap_or("true")
                != "false";
            if enabled {
                let topic = config
                    .get_untracked()
                    .get(".my.gossip.topic")
                    .unwrap_or(crate::transport::gossip::DEFAULT_BROADCAST_TOPIC)
                    .to_string();
                if let Err(e) = crate::transport::gossip::subscribe(&topic).await {
                    state.push_error(format!("gossip auto-subscribe: {e}"));
                }
            }
        }
        Err(e) => state.push_error(tf("msg-iroh-failed", &[("e", &e)])),
    }
}
