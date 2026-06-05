use leptos::prelude::*;
use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::http::fetch_cid_bytes;
use crate::i18n::{t, tf};
use crate::state::{AppState, ProfilePublishPending};
use crate::views::editor::EditorContext;
use ma_core::DidDocumentResolver;
use super::ma::rediscover_ma;
use super::{MA_URL, resolve_bare_did, doc_agent_cid};

pub(super) fn handle_profiles(path: &str, verb: &str, args: &[String], state: &AppState,
    config: RwSignal<EgoConfig>, _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>) -> Result<(), String> {
// ── .profiles.<name>:<verb> ───────────────────────────────────────────
if let Some(profile_name) = path.strip_prefix(".profiles.") {
    if profile_name.is_empty() || profile_name.contains('.') {
        return Err(t("profile-wrong-user"));
    }
    let own_username = state
        .session
        .get_untracked()
        .map(|s| s.username.clone())
        .unwrap_or_default();
    if profile_name != own_username.as_str() {
        return Err(tf("profile-wrong-user-name", &[("name", profile_name)]));
    }
    let publisher = if let Some(arg) = args.first() {
        resolve_bare_did(arg, &config.get_untracked())?
    } else {
        resolve_bare_did("@ma", &config.get_untracked()).or_else(|_| {
            config
                .get_untracked()
                .get(".my.ma.did")
                .map(|s| s.to_string())
                .ok_or_else(|| t("profile-no-ma"))
        })?
    };
    let path_owned = path.to_string();
    match verb {
        "publish" => {
            // Record the publish time as an RFC3339 UTC string. On startup,
            // startup_profile_exists compares this against doc.updated_at to
            // detect IPNS propagation lag and skip merging when the resolved
            // DID document is older than our last local publish.
            let now_iso = js_sys::Date::new_0()
                .to_iso_string()
                .as_string()
                .unwrap_or_default();
            config.update(|cfg| cfg.set(EgoConfig::PROFILE_PUBLISHED_AT_KEY, now_iso));
            let cfg = config.get_untracked();
            let cmd_id = state.push_command(format!("{path_owned}:publish"));
            let state2 = state.clone();
            let ma_base = {
                let c = config.get_untracked();
                c.get(".my.ma.url")
                    .unwrap_or(MA_URL)
                    .trim_end_matches('/')
                    .to_string()
            };
            leptos::task::spawn_local(async move {
                let profile_bytes = match cfg.serialize_profile_subtrees() {
                    Err(e) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                        return;
                    }
                    Ok(b) => b,
                };
                // Step 1: publish DID doc so @ma caches our current ma.services.
                // Without this @ma cannot open an outbox back to us to deliver
                // the profile CID reply (connect_outbox needs the doc).
                // We must wait long enough for @ma's poll loop (default 100 ms)
                // to drain and process the DidDocumentPublish message before the
                // Store arrives — otherwise the cache miss causes the old
                // IPNS-lookup path which times out.
                let _ = crate::transport::send_ipfs_publish(&publisher).await;
                gloo_timers::future::TimeoutFuture::new(600).await;
                // Try publish; on transport timeout, re-discover and retry once.
                let result =
                    crate::transport::send_profile_store(&publisher, profile_bytes.clone())
                        .await;
                let result = match result {
                    Err(ref e) if e.contains("timed out") || e.contains("connect failed") => {
                        // Stale iroh connection — refresh endpoint_id and retry.
                        if let Ok(new_publisher) = rediscover_ma(&ma_base, config).await {
                            crate::transport::send_profile_store(&new_publisher, profile_bytes)
                                .await
                        } else {
                            result
                        }
                    }
                    other => other,
                };
                match result {
                    Ok(msg_id) => {
                        state2.pending_profile_publish.update(|m| {
                            m.insert(
                                msg_id,
                                ProfilePublishPending {
                                    publisher_did: publisher,
                                    cmd_id: Some(cmd_id),
                                },
                            );
                        });
                    }
                    Err(e) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                    }
                }
            });
            return Ok(());
        }
        // :fetch — read CID from DID document and store it locally.
        // Does NOT decrypt or merge profile data.
        "fetch" => {
            let cmd_id = state.push_command(format!("{path_owned}:fetch"));
            let state2 = state.clone();
            let username2 = own_username.clone();
            let own_did = crate::state::SESSION_SENDER_DID
                .with(|d| d.borrow().clone())
                .ok_or_else(|| t("msg-not-logged-in"))?;
            leptos::task::spawn_local(async move {
                // Step 1: resolve DID document via SESSION_RESOLVER
                // (handles CBOR, local gateway with cooldown, dweb.link + w3s.link fallback).
                let resolver = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone());
                let doc = match resolver {
                    Some(r) => match (*r).resolve(&own_did).await {
                        Ok(d) => d,
                        Err(e) => {
                            let display = t("profile-fetch-did-resolve-failed");
                            state2.resolve_command_by_id(
                                cmd_id,
                                CommandStatus::Error(format!("{e}")),
                            );
                            state2.push_error(display);
                            return;
                        }
                    },
                    None => {
                        let e = t("msg-not-logged-in");
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(e);
                        return;
                    }
                };
                let cid = match doc_agent_cid(&doc) {
                    None => {
                        state2.resolve_command_by_id(
                            cmd_id,
                            CommandStatus::Error(t("profile-no-cid-in-doc")),
                        );
                        state2.push_error(t("profile-no-cid-in-doc"));
                        return;
                    }
                    Some(c) => c,
                };
                // Step 2: download encrypted blob from IPFS gateway.
                let cbor_bytes = match fetch_cid_bytes(&cid).await {
                    Ok(b) => b,
                    Err(e) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("profile-fetch-failed", &[("e", &e)]));
                        return;
                    }
                };
                // Step 3: decrypt and merge into config.
                let json_bytes = match crate::transport::decrypt_profile(&cbor_bytes) {
                    Ok(b) => b,
                    Err(e) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("profile-fetch-failed", &[("e", &e)]));
                        return;
                    }
                };
                crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(cid.clone()));
                config.update(|cfg| cfg.set(&path_owned, &cid));
                match config.try_update(|cfg| cfg.merge_profile(&json_bytes)) {
                    Some(Ok(n)) => {
                        let cfg2 = config.get_untracked();
                        let state3 = state2.clone();
                        let username3 = username2.clone();
                        leptos::task::spawn_local(async move {
                            if let Err(e) =
                                crate::config::persist_config(&username3, &cfg2).await
                            {
                                state3.push_error(e);
                            }
                        });
                        state2
                            .resolve_command_by_id(cmd_id, CommandStatus::Replied(cid.clone()));
                        state2.push_system(tf("profile-fetch-done", &[("n", &n.to_string())]));
                    }
                    Some(Err(e)) => {
                        state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        state2.push_error(tf("profile-fetch-failed", &[("e", &e)]));
                    }
                    None => {}
                }
            });
            return Ok(());
        }
        other => return Err(tf("err-unknown-verb", &[("verb", other)])),
    }
}

    Err(tf("path-no-verb", &[("verb", verb), ("path", path)]))
}
