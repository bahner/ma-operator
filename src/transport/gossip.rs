//! Gossip pub/sub transport helpers.
//!
//! Provides subscribe/unsubscribe/publish primitives that sit on top of the
//! [`ma_core::MaEndpoint::gossip_subscribe`] API.  All state is kept in the
//! thread-local [`SESSION_TOPICS`] and [`SESSION_GOSSIP_QUEUE`] tables so
//! the poll loop can drain them without holding a borrow across await points.

use bytes::Bytes;
use futures::StreamExt;
use ma_core::{topic::topic_id, GossipEvent, Message, Topic, MESSAGE_TYPE_BROADCAST};
use wasm_bindgen_futures::spawn_local;

use crate::i18n::t;
use crate::state::{TopicSession, ENDPOINT, SESSION_GOSSIP_QUEUE, SESSION_TOPICS};

/// Content-type used for emote messages on gossip topics.
pub const CONTENT_TYPE_EMOTE: &str = "text/x-ma-emote";
/// Content-type used for plain-text say messages.
pub const CONTENT_TYPE_TEXT: &str = "text/plain";

// ── Subscribe ─────────────────────────────────────────────────────────────

/// Subscribe to a gossip topic identified by `alias`.
///
/// `topic_string` is the raw topic name (e.g. `"/ma/broadcast/0.0.1"` or
/// `"general"`).  The BLAKE3 hash of that string becomes the iroh-gossip
/// `TopicId`.
///
/// If the alias is already subscribed this is a no-op.
/// Returns `Err` if the endpoint is not connected.
pub async fn subscribe_topic(alias: &str, topic_string: &str) -> Result<(), String> {
    let already = SESSION_TOPICS.with(|t| t.borrow().contains_key(alias));
    if already {
        return Ok(());
    }

    let tid = topic_id(topic_string);

    let (sender, receiver) = ENDPOINT
        .with(|ep| {
            let borrow = ep.borrow();
            let ep_ref = borrow.as_ref().ok_or_else(|| t("error-not-connected"))?;
            // Safety: gossip_subscribe is async but we need to call it here.
            // We return a Future and await it outside the borrow.
            Ok::<_, String>(ep_ref.clone())
        })?
        .gossip_subscribe(tid, vec![])
        .await
        .map_err(|e| e.to_string())?;

    let mut topic = Topic::new(topic_string);
    topic.subscribe();

    let alias_owned = alias.to_string();

    // Spawn the receiver loop: convert raw gossip events → SESSION_GOSSIP_QUEUE.
    spawn_local(async move {
        let mut rx = receiver;
        while let Some(event) = rx.next().await {
            match event {
                Ok(GossipEvent::Received(msg)) => {
                    if let Ok(ma_msg) = Message::decode(&msg.content) {
                        SESSION_GOSSIP_QUEUE
                            .with(|q| q.borrow_mut().push((alias_owned.clone(), ma_msg)));
                    }
                }
                Ok(_) => {} // NeighborUp / NeighborDown — ignore
                Err(_) => break,
            }
        }
    });

    SESSION_TOPICS.with(|t| {
        t.borrow_mut().insert(
            alias.to_string(),
            TopicSession {
                alias: alias.to_string(),
                topic_string: topic_string.to_string(),
                topic_id: tid,
                sender,
                topic,
                receiver: None, // already consumed by spawn_local above
            },
        )
    });

    Ok(())
}

// ── Unsubscribe ───────────────────────────────────────────────────────────

/// Remove the session subscription for `alias` (does not modify EgoConfig).
pub fn unsubscribe_topic(alias: &str) {
    SESSION_TOPICS.with(|t| t.borrow_mut().remove(alias));
}

// ── Publish ───────────────────────────────────────────────────────────────

/// Publish a message to the gossip topic identified by `alias`.
///
/// Returns `Err` if the alias is not subscribed or signing fails.
pub async fn publish_to_topic(alias: &str, body: &str, content_type: &str) -> Result<(), String> {
    let sender = SESSION_TOPICS
        .with(|t| t.borrow().get(alias).map(|s| s.sender.clone()))
        .ok_or_else(|| t("topic-send-not-subscribed"))?;

    let (sender_did, signing_key) =
        crate::transport::connection::get_session_info().map_err(|e| e.to_string())?;

    let msg = Message::new(
        sender_did,
        String::new(), // no recipient — broadcast
        MESSAGE_TYPE_BROADCAST,
        content_type,
        body.as_bytes(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;

    let cbor = msg.encode().map_err(|e| e.to_string())?;

    sender
        .broadcast(Bytes::from(cbor))
        .await
        .map_err(|e| e.to_string())
}

// ── Poll-loop drain ───────────────────────────────────────────────────────

/// Take all pending gossip messages from the queue, validate them via
/// `Topic::deliver`, and return the validated `(alias, Message)` pairs.
pub fn drain_gossip_queue() -> Vec<(String, Message)> {
    // Drain the raw queue first (no borrow overlap with SESSION_TOPICS).
    let raw: Vec<(String, Message)> =
        SESSION_GOSSIP_QUEUE.with(|q| q.borrow_mut().drain(..).collect());

    let mut out = Vec::new();
    for (alias, msg) in raw {
        SESSION_TOPICS.with(|t| {
            if let Some(session) = t.borrow_mut().get_mut(&alias) {
                if session.topic.deliver(msg) {
                    out.extend(
                        session
                            .topic
                            .drain()
                            .into_iter()
                            .map(|m| (alias.clone(), m)),
                    );
                }
            }
        });
    }
    out
}

// ── Status / list ──────────────────────────────────────────────────────────

/// Returns `(is_subscribed, pending_count)` for `alias`.
pub fn topic_status(alias: &str) -> (bool, usize) {
    SESSION_TOPICS.with(|t| {
        let borrow = t.borrow();
        if let Some(session) = borrow.get(alias) {
            (session.topic.is_subscribed(), 0)
        } else {
            (false, 0)
        }
    })
}

/// List all currently subscribed alias names.
#[allow(dead_code)]
pub fn list_subscribed() -> Vec<String> {
    SESSION_TOPICS.with(|t| t.borrow().keys().cloned().collect())
}
