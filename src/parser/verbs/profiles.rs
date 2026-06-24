use super::ma::rediscover_ma;
use super::{doc_agent_cid, resolve_bare_did, MA_URL};
use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::http::fetch_cid_bytes;
use crate::i18n::{t, tf};
use crate::state::{AppState, PendingKind};
use crate::views::editor::EditorContext;
use leptos::prelude::*;
use ma_core::DidDocumentResolver;

pub(super) fn handle_profiles(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    _show_editor: RwSignal<Option<EditorContext>>,
    _on_eval: Callback<String>,
) -> Result<(), String> {
    let Some(profile_name) = path.strip_prefix(".profiles.") else {
        return Err(tf("path-no-verb", &[("verb", verb), ("path", path)]));
    };
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

    match verb {
        "publish" => profile_publish(path.to_string(), publisher, state, config),
        "fetch" => {
            let own_did = crate::state::SESSION_SENDER_DID
                .with(|d| d.borrow().clone())
                .ok_or_else(|| t("msg-not-logged-in"))?;
            profile_fetch(path.to_string(), own_username, own_did, state, config)
        }
        other => Err(tf("err-unknown-verb", &[("verb", other)])),
    }
}

// ── Verb handlers ─────────────────────────────────────────────────────────

/// `publish` — serialize config subtrees, upload encrypted blob, republish DID doc.
fn profile_publish(
    path_owned: String,
    publisher: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let now_iso = js_sys::Date::new_0()
        .to_iso_string()
        .as_string()
        .unwrap_or_default();
    config.update(|cfg| cfg.set(EgoConfig::PROFILE_PUBLISHED_AT_KEY, now_iso));
    let cfg = config.get_untracked();
    let cmd_id = state.push_command(format!("{path_owned}:publish"));
    let state2 = state.clone();
    let ma_base = config
        .get_untracked()
        .get(".my.ma.url")
        .unwrap_or(MA_URL)
        .trim_end_matches('/')
        .to_string();
    leptos::task::spawn_local(async move {
        let profile_bytes = match cfg.serialize_profile_subtrees() {
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                return;
            }
            Ok(b) => b,
        };
        // Publish DID doc first so @ma can open an outbox back to us for the reply.
        let _ = crate::transport::send_ipfs_publish(&publisher).await;
        gloo_timers::future::TimeoutFuture::new(600).await;
        // On transport timeout, re-discover and retry once.
        let result = crate::transport::send_profile_store(&publisher, profile_bytes.clone()).await;
        let result = match result {
            Err(ref e) if e.contains("timed out") || e.contains("connect failed") => {
                if let Ok(new_publisher) = rediscover_ma(&ma_base, config).await {
                    crate::transport::send_profile_store(&new_publisher, profile_bytes).await
                } else {
                    result
                }
            }
            other => other,
        };
        match result {
            Ok(msg_id) => {
                state2.register_pending(
                    msg_id,
                    PendingKind::ProfilePublish {
                        publisher_did: publisher,
                        cmd_id: Some(cmd_id),
                    },
                    None,
                );
            }
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
            }
        }
    });
    Ok(())
}

/// `fetch` — resolve DID doc, download encrypted blob, decrypt and merge into config.
fn profile_fetch(
    path_owned: String,
    own_username: String,
    own_did: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let cmd_id = state.push_command(format!("{path_owned}:fetch"));
    let state2 = state.clone();
    leptos::task::spawn_local(async move {
        // Step 1: resolve DID document.
        let resolver = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone());
        let doc = match resolver {
            Some(r) => match (*r).resolve(&own_did).await {
                Ok(d) => d,
                Err(e) => {
                    state2.resolve_command_by_id(cmd_id, CommandStatus::Error(format!("{e}")));
                    state2.push_error(t("profile-fetch-did-resolve-failed"));
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
            Some(c) => c,
            None => {
                state2.resolve_command_by_id(
                    cmd_id,
                    CommandStatus::Error(t("profile-no-cid-in-doc")),
                );
                state2.push_error(t("profile-no-cid-in-doc"));
                return;
            }
        };
        // Step 2: download encrypted blob.
        let cbor_bytes = match fetch_cid_bytes(&cid).await {
            Ok(b) => b,
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-fetch-failed", &[("e", &e)]));
                return;
            }
        };
        // Step 3: decrypt and merge.
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
                leptos::task::spawn_local(async move {
                    if let Err(e) = crate::config::persist_config(&own_username, &cfg2).await {
                        state3.push_error(e);
                    }
                });
                state2.resolve_command_by_id(cmd_id, CommandStatus::Replied(cid));
                state2.push_system(tf("profile-fetch-done", &[("n", &n.to_string())]));
            }
            Some(Err(e)) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-fetch-failed", &[("e", &e)]));
            }
            None => {}
        }
    });
    Ok(())
}
