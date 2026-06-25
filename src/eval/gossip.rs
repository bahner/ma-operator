//! Evaluator for broadcast gossip commands.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::config::EgoConfig;
use crate::core::CommandStatus;
use crate::i18n::t;
use crate::state::AppState;
use crate::transport::gossip;
use crate::transport::gossip::{CONTENT_TYPE_EMOTE, CONTENT_TYPE_TEXT, DEFAULT_BROADCAST_TOPIC};

// ── BroadcastStatus ───────────────────────────────────────────────────────

pub(crate) fn eval_broadcast_status(state: &AppState, config: RwSignal<EgoConfig>) {
    let cfg = config.get_untracked();
    let enabled = cfg.get(".my.gossip.enable").unwrap_or("true");
    let topic = cfg
        .get(".my.gossip.topic")
        .unwrap_or(DEFAULT_BROADCAST_TOPIC)
        .to_string();
    let subscribed = gossip::is_subscribed();
    let current = gossip::current_topic();

    state.push_output(t("gossip-status-header"));
    state.push_output(format!("  enable: {enabled}"));
    state.push_output(format!("  topic: {topic}"));
    if subscribed {
        state.push_output(format!(
            "  subscribed: {} ({})",
            t("gossip-status-subscribed"),
            current.unwrap_or_default()
        ));
    } else {
        state.push_output(format!(
            "  subscribed: {}",
            t("gossip-status-not-subscribed")
        ));
    }
}

// ── BroadcastSay ──────────────────────────────────────────────────────────

pub(crate) fn eval_broadcast_say(body: String, state: &AppState, config: RwSignal<EgoConfig>) {
    if body.is_empty() {
        return;
    }
    if !gossip_enabled(state, config) {
        return;
    }
    if !gossip::is_subscribed() {
        state.push_error(t("gossip-send-not-subscribed"));
        return;
    }
    let own = own_alias(state, config);
    state.push_broadcast(own, body.clone(), false);
    let state2 = state.clone();
    spawn_local(async move {
        if let Err(e) = gossip::publish(&body, CONTENT_TYPE_TEXT).await {
            state2.push_error(e);
        }
    });
}

// ── BroadcastEmote ────────────────────────────────────────────────────────

pub(crate) fn eval_broadcast_emote(body: String, state: &AppState, config: RwSignal<EgoConfig>) {
    if body.is_empty() {
        return;
    }
    if !gossip_enabled(state, config) {
        return;
    }
    if !gossip::is_subscribed() {
        state.push_error(t("gossip-send-not-subscribed"));
        return;
    }
    let own = own_alias(state, config);
    state.push_broadcast(own, body.clone(), true);
    let state2 = state.clone();
    spawn_local(async move {
        if let Err(e) = gossip::publish(&body, CONTENT_TYPE_EMOTE).await {
            state2.push_error(e);
        }
    });
}

// ── .my.gossip:subscribe ──────────────────────────────────────────────────

pub(crate) fn eval_gossip_subscribe(state: &AppState, config: RwSignal<EgoConfig>) {
    if !gossip_enabled(state, config) {
        return;
    }
    let topic_string = config
        .get_untracked()
        .get(".my.gossip.topic")
        .unwrap_or(DEFAULT_BROADCAST_TOPIC)
        .to_string();
    let cmd_id = state.push_command(".my.gossip:subscribe".to_string());
    let state2 = state.clone();
    spawn_local(async move {
        match gossip::subscribe(&topic_string).await {
            Ok(()) => state2.resolve_command_by_id(cmd_id, CommandStatus::Replied(String::new())),
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(e);
            }
        }
    });
}

// ── .my.gossip:unsubscribe ─────────────────────────────────────────────────

pub(crate) fn eval_gossip_unsubscribe(state: &AppState) {
    gossip::unsubscribe();
    state.push_command_done(".my.gossip:unsubscribe".to_string());
}

// ── Helpers ───────────────────────────────────────────────────────────────

/// Returns true if .my.gossip.enable is not "false".
fn gossip_enabled(state: &AppState, config: RwSignal<EgoConfig>) -> bool {
    if config
        .get_untracked()
        .get(".my.gossip.enable")
        .unwrap_or("true")
        == "false"
    {
        state.push_error(t("gossip-disabled"));
        return false;
    }
    true
}

/// Resolve the current user's display name for outgoing broadcast messages.
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
