//! Handlers for `.profiles.*` dot-path CRUD operations.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, EgoConfig},
    http::fetch_cid_bytes,
    i18n::{t, tf},
    state::AppState,
};

// ── Shared helper ─────────────────────────────────────────────────────────

/// Resolve a CID (or DID document containing `ma.agent`) to decrypted profile
/// bytes. Returns `(canonical_blob_cid, decrypted_bytes)`.
async fn fetch_profile_blob(cid: &str) -> Result<(String, Vec<u8>), String> {
    let bytes = fetch_cid_bytes(cid)
        .await
        .map_err(|e| tf("profile-fetch-failed", &[("e", &e)]))?;
    if let Ok(doc) = serde_json::from_slice::<ma_core::Document>(&bytes) {
        // DID document — pull the ma.agent blob CID and fetch that.
        let blob_cid =
            crate::parser::verbs::doc_agent_cid(&doc).ok_or_else(|| t("profile-no-cid-in-doc"))?;
        let blob_bytes = fetch_cid_bytes(&blob_cid)
            .await
            .map_err(|e| tf("profile-fetch-failed", &[("e", &e)]))?;
        let profile_bytes = crate::transport::decrypt_profile(&blob_bytes)
            .map_err(|e| tf("profile-fetch-failed", &[("e", &e)]))?;
        Ok((blob_cid, profile_bytes))
    } else {
        // Raw blob — decrypt directly.
        let profile_bytes = crate::transport::decrypt_profile(&bytes)
            .map_err(|e| tf("profile-fetch-failed", &[("e", &e)]))?;
        Ok((cid.to_string(), profile_bytes))
    }
}

// ── Public handlers ───────────────────────────────────────────────────────

/// `.profiles.<name>: <cid>` — fetch, decrypt and merge profile from CID.
pub(crate) fn handle_profile_set(
    path: String,
    cid: String,
    uname: String,
    config: RwSignal<EgoConfig>,
    state: AppState,
) {
    spawn_local(async move {
        match fetch_profile_blob(&cid).await {
            Err(e) => state.push_error(e),
            Ok((blob_cid, profile_bytes)) => {
                crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(blob_cid.clone()));
                config.update(|c| c.set(&path, &blob_cid));
                let n = config
                    .try_update(|cfg| cfg.merge_profile(&profile_bytes))
                    .and_then(|r| r.ok())
                    .unwrap_or(0);
                let cfg = config.get_untracked();
                if let Err(e) = persist_config(&uname, &cfg).await {
                    state.push_error(e);
                } else {
                    state.push_system(tf("profile-update-done", &[("n", &n.to_string())]));
                }
            }
        }
    });
}

/// `.profiles.<name>:` — delete a named profile (disconnect if it is self).
pub(crate) fn handle_profile_delete(
    target_name: String,
    current_username: String,
    state: AppState,
) {
    spawn_local(async move {
        use crate::identity::storage::{
            delete_config, delete_history, delete_identity, list_usernames,
        };
        match list_usernames().await {
            Err(e) => {
                state.push_error(e);
                return;
            }
            Ok(names) if !names.iter().any(|n| n == &target_name) => {
                state.push_error(tf("profiles-not-found", &[("name", &target_name)]));
                return;
            }
            _ => {}
        }
        let mut errors: Vec<String> = Vec::new();
        if let Err(e) = delete_identity(&target_name).await {
            errors.push(e);
        }
        if let Err(e) = delete_config(&target_name).await {
            errors.push(e);
        }
        if let Err(e) = delete_history(&target_name).await {
            errors.push(e);
        }
        if errors.is_empty() {
            if target_name == current_username {
                crate::transport::disconnect();
                crate::scheme::reset_session_env();
                state.session.set(None);
            } else {
                state.push_system(tf("profiles-deleted", &[("name", &target_name)]));
            }
        } else {
            state.push_error(tf("profile-delete-error", &[("e", &errors.join("; "))]));
        }
    });
}

/// `.profiles` — list all profiles with their published CIDs.
pub(crate) fn handle_profile_list(config: RwSignal<EgoConfig>, state: AppState) {
    let cfg = config.get_untracked();
    spawn_local(async move {
        use crate::identity::storage::list_usernames;
        match list_usernames().await {
            Err(e) => state.push_error(e),
            Ok(names) => {
                state.push_output(".profiles:".to_string());
                if names.is_empty() {
                    state.push_output(format!("  {}", t("profiles-empty")));
                } else {
                    for name in &names {
                        let cid_key = format!(".profiles.{name}");
                        if let Some(cid) = cfg.get(&cid_key) {
                            state.push_output(format!("  {name}  {cid}"));
                        } else {
                            state.push_output(format!("  {name}"));
                        }
                    }
                }
            }
        }
    });
}

/// `.profiles.<name>` — show stored CID for a specific profile.
pub(crate) fn handle_profile_get(
    profile_name: String,
    path: String,
    config: RwSignal<EgoConfig>,
    state: AppState,
) {
    let cfg = config.get_untracked();
    spawn_local(async move {
        use crate::identity::storage::list_usernames;
        match list_usernames().await {
            Err(e) => state.push_error(e),
            Ok(names) => {
                if !names.iter().any(|n| n == &profile_name) {
                    state.push_error(tf("profiles-not-found", &[("name", &profile_name)]));
                    return;
                }
                if let Some(cid) = cfg.get(&path) {
                    state.push_output(format!("{path}: {cid}"));
                } else {
                    state.push_output(format!(
                        "{path}: (no CID — use :{name}:publish)",
                        name = profile_name
                    ));
                }
            }
        }
    });
}
