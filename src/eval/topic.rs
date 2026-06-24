//! Evaluator for `Command::TopicMessage` and `Command::TopicEmote`.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::config::EgoConfig;
use crate::i18n::{t, tf};
use crate::state::AppState;
use crate::transport::gossip;
use crate::transport::gossip::{CONTENT_TYPE_EMOTE, CONTENT_TYPE_TEXT};

/// Dispatch a `Command::TopicMessage`.
pub(crate) fn eval_topic(
    topic: String,
    verb: String,
    body: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    match verb.as_str() {
        // ── Status ────────────────────────────────────────────────────────
        "status" => {
            let cfg = config.get_untracked();
            let config_key = format!(".my.topics.{topic}");
            if let Some(topic_string) = cfg.get(&config_key) {
                let (subscribed, _) = gossip::topic_status(&topic);
                let sub_text = if subscribed {
                    t("topic-status-subscribed")
                } else {
                    t("topic-status-not-subscribed")
                };
                state.push_system(format!("{topic} → {topic_string}"));
                state.push_system(sub_text);
            } else {
                state.push_system(tf("topic-not-defined", &[("topic", &topic)]));
            }
        }

        // ── Subscribe ─────────────────────────────────────────────────────
        "subscribe" => {
            let topic_string = {
                let cfg = config.get_untracked();
                match cfg.get(&format!(".my.topics.{topic}")) {
                    Some(s) => s.to_string(),
                    None => {
                        state.push_error(tf("topic-not-defined", &[("topic", &topic)]));
                        return;
                    }
                }
            };
            let state = state.clone();
            let alias = topic.clone();
            let msg_ok = tf("topic-subscribed", &[("topic", &topic)]);
            spawn_local(async move {
                match gossip::subscribe_topic(&alias, &topic_string).await {
                    Ok(()) => state.push_system(msg_ok),
                    Err(e) => state.push_error(format!("{alias}: {e}")),
                }
            });
        }

        // ── Unsubscribe (session-only) ─────────────────────────────────────
        "unsubscribe" => {
            gossip::unsubscribe_topic(&topic);
            state.push_system(tf("topic-unsubscribed", &[("topic", &topic)]));
        }

        // ── Delete + unsubscribe (permanent) ──────────────────────────────
        "" => {
            gossip::unsubscribe_topic(&topic);
            config.update(|cfg| {
                cfg.delete(&format!(".my.topics.{topic}"));
            });
            let cfg_snap = config.get_untracked();
            let _state_clone = state.clone();
            spawn_local(async move {
                let username = crate::state::SESSION_SENDER_DID
                    .with(|d| d.borrow().clone().unwrap_or_default());
                let _ = crate::config::persist_config(&username, &cfg_snap).await;
            });
            state.push_system(tf("topic-deleted", &[("topic", &topic)]));
            // Exit focus mode if we just deleted the focused topic.
            let focus = state.focus_actor.get_untracked();
            if focus
                .as_ref()
                .map(|f| f.target == format!("#{topic}"))
                .unwrap_or(false)
            {
                state.focus_actor.set(None);
            }
        }

        // ── Say ───────────────────────────────────────────────────────────
        "say" => {
            if body.is_empty() {
                return;
            }
            let (subscribed, _) = gossip::topic_status(&topic);
            if !subscribed {
                state.push_error(tf("topic-send-not-subscribed", &[("topic", &topic)]));
                return;
            }
            // Echo own message immediately (gossip does not loop back to sender).
            let own_display = own_alias(state, config);
            state.push_broadcast(topic.clone(), own_display, body.clone(), false);
            let state = state.clone();
            let alias = topic.clone();
            spawn_local(async move {
                if let Err(e) = gossip::publish_to_topic(&alias, &body, CONTENT_TYPE_TEXT).await {
                    state.push_error(e);
                }
            });
        }

        // ── Emote ─────────────────────────────────────────────────────────
        "emote" => {
            if body.is_empty() {
                return;
            }
            let (subscribed, _) = gossip::topic_status(&topic);
            if !subscribed {
                state.push_error(tf("topic-send-not-subscribed", &[("topic", &topic)]));
                return;
            }
            let own_display = own_alias(state, config);
            state.push_broadcast(topic.clone(), own_display, body.clone(), true);
            let state = state.clone();
            let alias = topic.clone();
            spawn_local(async move {
                if let Err(e) = gossip::publish_to_topic(&alias, &body, CONTENT_TYPE_EMOTE).await {
                    state.push_error(e);
                }
            });
        }

        other => {
            state.push_error(tf("topic-unknown-verb", &[("verb", other)]));
        }
    }
}

/// Dispatch a `Command::TopicEmote` — emote to the current topic focus.
pub(crate) fn eval_topic_emote(body: String, state: &AppState, config: RwSignal<EgoConfig>) {
    let focus = state.focus_actor.get_untracked();
    let alias = match focus.as_ref().and_then(|f| f.target.strip_prefix('#')) {
        Some(a) => a.to_string(),
        None => {
            state.push_error(t("topic-emote-no-focus"));
            return;
        }
    };

    let (subscribed, _) = gossip::topic_status(&alias);
    if !subscribed {
        state.push_error(tf("topic-send-not-subscribed", &[("topic", &alias)]));
        return;
    }

    let own_display = own_alias(state, config);
    state.push_broadcast(alias.clone(), own_display, body.clone(), true);

    let state = state.clone();
    spawn_local(async move {
        if let Err(e) = gossip::publish_to_topic(&alias, &body, CONTENT_TYPE_EMOTE).await {
            state.push_error(e);
        }
    });
}

/// Resolve the current user's display name for outgoing topic messages.
/// Uses their alias if one maps back to their own DID, otherwise their username.
fn own_alias(state: &AppState, config: RwSignal<EgoConfig>) -> String {
    let sess = state.session.get_untracked();
    let Some(sess) = sess else {
        return String::new();
    };
    let cfg = config.get_untracked();
    cfg.reverse_alias(&sess.sender_did)
        .map(|a| a.to_string())
        .unwrap_or(sess.username)
}
