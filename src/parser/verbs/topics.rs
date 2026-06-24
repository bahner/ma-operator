//! Verb handler for `.my.topics.*` dot-path commands.
//!
//! `.my.topics`                      → list defined topic aliases
//! `.my.topics.foo` (Get)            → print blake3 hash of configured topic string
//! `.my.topics.foo: string` (Set)    → handled by generic EgoConfig Set — no special logic
//! `.my.topics.foo:` (Delete)        → remove config entry and unsubscribe from session
//! `.my.topics.foo:subscribe`        → subscribe to the configured topic string
//! `.my.topics.foo:unsubscribe`      → session-only unsubscribe (keeps config entry)

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::config::EgoConfig;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport::gossip;

/// Dispatch verb calls on `.my.topics.*` paths.
pub fn handle_topics(
    path: &str,
    verb: &str,
    _args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    // `.my.topics` — list all defined aliases
    if path == ".my.topics" {
        let cfg = config.get_untracked();
        let entries = cfg.list(".my.topics.");
        if entries.is_empty() {
            state.push_system(t("topic-list-empty"));
        } else {
            state.push_system(t("topic-list-header"));
            for (key, val) in entries {
                let alias = key.strip_prefix(".my.topics.").unwrap_or(key);
                let (subscribed, _) = gossip::topic_status(alias);
                let marker = if subscribed { "●" } else { "○" };
                state.push_system(format!("  {marker} {alias} → {val}"));
            }
        }
        return Ok(());
    }

    // Extract alias from `.my.topics.<alias>`
    let alias = path
        .strip_prefix(".my.topics.")
        .ok_or_else(|| t("topic-unknown-verb"))?;

    match verb {
        // Get: print blake3 hash
        "status" | "" => {
            let cfg = config.get_untracked();
            let config_key = format!(".my.topics.{alias}");
            if let Some(topic_string) = cfg.get(&config_key) {
                let hash = blake3_hex(topic_string);
                let (subscribed, _) = gossip::topic_status(alias);
                let sub_text = if subscribed {
                    t("topic-status-subscribed")
                } else {
                    t("topic-status-not-subscribed")
                };
                state.push_system(hash);
                state.push_system(tf("topic-status-topic", &[("topic", alias)]));
                state.push_system(sub_text);
            } else {
                state.push_system(tf("topic-not-defined", &[("topic", alias)]));
            }
        }

        "subscribe" => {
            let topic_string = {
                let cfg = config.get_untracked();
                cfg.get(&format!(".my.topics.{alias}"))
                    .map(|s| s.to_string())
                    .ok_or_else(|| tf("topic-not-defined", &[("topic", alias)]))?
            };
            let alias_owned = alias.to_string();
            let state = state.clone();
            let msg_ok = tf("topic-subscribed", &[("topic", alias)]);
            let msg_err_prefix = format!("{alias}: ");
            spawn_local(async move {
                match gossip::subscribe_topic(&alias_owned, &topic_string).await {
                    Ok(()) => state.push_system(msg_ok),
                    Err(e) => state.push_error(format!("{msg_err_prefix}{e}")),
                }
            });
        }

        "unsubscribe" => {
            gossip::unsubscribe_topic(alias);
            state.push_system(tf("topic-unsubscribed", &[("topic", alias)]));
        }

        other => {
            return Err(tf("topic-unknown-verb", &[("verb", other)]));
        }
    }

    Ok(())
}

/// Handle the Delete op (`.my.topics.foo:`) — remove config entry and unsubscribe.
pub fn handle_topics_delete(alias: &str, state: &AppState, config: RwSignal<EgoConfig>) {
    gossip::unsubscribe_topic(alias);
    config.update(|cfg| {
        cfg.delete(&format!(".my.topics.{alias}"));
    });
    let cfg_snap = config.get_untracked();
    let state_clone = state.clone();
    let alias_owned = alias.to_string();
    spawn_local(async move {
        let username =
            crate::state::SESSION_SENDER_DID.with(|d| d.borrow().clone().unwrap_or_default());
        let _ = crate::config::persist_config(&username, &cfg_snap).await;
        state_clone.push_system(tf("topic-deleted", &[("topic", &alias_owned)]));
    });
}

/// Compute hex-encoded BLAKE3 hash of a topic string using ma-core's topic_id.
fn blake3_hex(s: &str) -> String {
    let hash = ma_core::topic::topic_id(s);
    hash.iter().map(|b| format!("{b:02x}")).collect()
}
