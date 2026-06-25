//! Verb handler for `.my.gossip.*` dot-path commands.

use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::eval::gossip as eval_gossip;
use crate::state::AppState;
use crate::transport::gossip;
use crate::transport::gossip::DEFAULT_BROADCAST_TOPIC;

pub fn handle_gossip(
    path: &str,
    verb: &str,
    _args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    match verb {
        "subscribe" => {
            eval_gossip::eval_gossip_subscribe(state, config);
            Ok(())
        }
        "unsubscribe" => {
            eval_gossip::eval_gossip_unsubscribe(state);
            Ok(())
        }
        other if !other.is_empty() => {
            Err(crate::i18n::tf("gossip-unknown-verb", &[("verb", other)]))
        }
        _ => {
            // Bare .my.gossip: — treat as status
            let _ = path;
            eval_gossip::eval_broadcast_status(state, config);
            Ok(())
        }
    }
}

/// Show gossip config with defaults (used by handle_dot_get virtual path).
pub fn show_gossip_config(state: &AppState, config: RwSignal<EgoConfig>) {
    let cfg = config.get_untracked();
    let enabled = cfg.get(".my.gossip.enable").unwrap_or("true");
    let topic = cfg
        .get(".my.gossip.topic")
        .unwrap_or(DEFAULT_BROADCAST_TOPIC);
    let timeout = cfg.get(".my.gossip.timeout").unwrap_or("10");
    let subscribed = if gossip::is_subscribed() { "yes" } else { "no" };
    state.push_output(".my.gossip:");
    state.push_output(format!("  enable: {enabled}"));
    state.push_output(format!("  topic: {topic}"));
    state.push_output(format!("  timeout: {timeout}"));
    state.push_output(format!("  subscribed: {subscribed}"));
}
