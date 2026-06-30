use super::ma::rediscover_ma;
use super::{resolve_bare_did, MA_URL};
use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::{t, tf};
use crate::identity::{export_for_download, load_identity};
use crate::state::{AppState, PendingKind};
use leptos::prelude::*;

/// Dispatch `.my.profile!verb` commands.
pub(super) fn handle_my_profile(
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let own_username = state
        .session
        .get_untracked()
        .map(|s| s.username.clone())
        .unwrap_or_default();
    let publisher = if let Some(arg) = args.first() {
        resolve_bare_did(arg, &config.get_untracked())?
    } else {
        resolve_bare_did("@ma", &config.get_untracked()).or_else(|_| {
            config
                .get_untracked()
                .get(".ctx.ma.did")
                .map(|s| s.to_string())
                .ok_or_else(|| t("profile-no-ma"))
        })?
    };
    match verb {
        "publish" => profile_publish(publisher, own_username, state, config),
        other => Err(tf("err-unknown-verb", &[("verb", other)])),
    }
}

// ── Verb handlers ──────────────────────────────────────────────────────────

/// `publish` — export full .zion.json profile (identity + config) and store
/// it on IPFS as IPLD (DAG-CBOR).  The secret bundle inside the identity
/// field is already encrypted with the user's passphrase.
fn profile_publish(
    publisher: String,
    username: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    let now_iso = js_sys::Date::new_0()
        .to_iso_string()
        .as_string()
        .unwrap_or_default();
    config.update(|cfg| cfg.set(EgoConfig::PROFILE_PUBLISHED_AT_KEY, now_iso));
    let cfg = config.get_untracked();
    let cmd_id = state.push_command(".my.profile!publish".to_string());
    let state2 = state.clone();
    let ma_base = config
        .get_untracked()
        .get(".ctx.ma.url")
        .unwrap_or(MA_URL)
        .trim_end_matches('/')
        .to_string();
    leptos::task::spawn_local(async move {
        // Load identity bundle from IndexedDB.
        let identity_json = match load_identity(&username).await {
            Ok(Some(stored)) => stored.export_json,
            Ok(None) => {
                let e = tf("error-identity-not-found", &[("name", &username)]);
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(e);
                return;
            }
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(e);
                return;
            }
        };
        // Build the .zion.json export, then CBOR-encode for dag_put.
        let cfg_json = match cfg.to_json() {
            Ok(j) => j,
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                return;
            }
        };
        let profile_json = export_for_download(&identity_json, &username, Some(&cfg_json));
        let json_val: serde_json::Value = match serde_json::from_str(&profile_json) {
            Ok(v) => v,
            Err(e) => {
                let e = e.to_string();
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                return;
            }
        };
        let profile_bytes = match serde_ipld_dagcbor::to_vec(&json_val) {
            Ok(b) => b,
            Err(e) => {
                let e = e.to_string();
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(tf("profile-publish-failed", &[("e", &e)]));
                return;
            }
        };
        // On transport timeout, re-discover and retry once.
        let result = crate::transport::send_ipfs_store(
            &publisher,
            profile_bytes.clone(),
            "application/vnd.ipld.dag-cbor",
        )
        .await;
        let result = match result {
            Err(ref e) if e.contains("timed out") || e.contains("connect failed") => {
                if let Ok(new_publisher) = rediscover_ma(&ma_base, config).await {
                    crate::transport::send_ipfs_store(
                        &new_publisher,
                        profile_bytes,
                        "application/vnd.ipld.dag-cbor",
                    )
                    .await
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
