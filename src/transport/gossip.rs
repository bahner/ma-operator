//! Gossip broadcast transport — single channel implementation.
//!
//! One broadcast channel per session, configured via `.my.gossip.topic`.

use bytes::Bytes;
use futures::StreamExt;
use ma_core::{
    topic::topic_id, GossipEvent, GossipReceiver, GossipSender, Message, Topic,
    MESSAGE_TYPE_BROADCAST,
};
use wasm_bindgen_futures::spawn_local;

use crate::state::{
    GossipSession, ENDPOINT, SESSION_GOSSIP, SESSION_GOSSIP_QUEUE, SESSION_GOSSIP_SUBSCRIBING,
};

/// Default broadcast topic string.
pub const DEFAULT_BROADCAST_TOPIC: &str = "/ma/broadcast/0.0.1";
/// Content-type for emote messages.
pub const CONTENT_TYPE_EMOTE: &str = "text/x-ma-emote";
/// Content-type for plain-text say messages.
pub const CONTENT_TYPE_TEXT: &str = "text/plain";

// ── Subscribe ─────────────────────────────────────────────────────────────

/// Subscribe to the broadcast channel identified by `topic_string`.
///
/// No-op if already subscribed to the same topic. Guards against concurrent
/// calls racing across await points.
pub async fn subscribe(topic_string: &str) -> Result<(), String> {
    let already_same = SESSION_GOSSIP.with(|g| {
        g.borrow()
            .as_ref()
            .map(|s| s.topic_string == topic_string)
            .unwrap_or(false)
    });
    if already_same {
        return Ok(());
    }
    if SESSION_GOSSIP_SUBSCRIBING.with(|s| *s.borrow()) {
        return Ok(());
    }
    unsubscribe();
    SESSION_GOSSIP_SUBSCRIBING.with(|s| *s.borrow_mut() = true);

    let tid = topic_id(topic_string);
    let tid_hex: String = tid.iter().take(8).map(|b| format!("{b:02x}")).collect();
    web_sys::console::info_1(
        &format!("[gossip] joining '{topic_string}' (id: {tid_hex}...)").into(),
    );

    let (sender, receiver) = ENDPOINT
        .with(|ep| {
            let borrow = ep.borrow();
            let ep_ref = borrow.as_ref().ok_or_else(|| "not connected".to_string())?;
            Ok::<_, String>(ep_ref.clone())
        })?
        .gossip_subscribe(tid, vec![])
        .await
        .map_err(|e| {
            SESSION_GOSSIP_SUBSCRIBING.with(|s| *s.borrow_mut() = false);
            e.to_string()
        })?;

    let mut topic = Topic::new(topic_string);
    topic.subscribe();

    spawn_local(run_receiver(receiver));

    SESSION_GOSSIP.with(|g| {
        *g.borrow_mut() = Some(GossipSession {
            topic_string: topic_string.to_string(),
            topic_id: tid,
            sender,
            topic,
        });
    });
    SESSION_GOSSIP_SUBSCRIBING.with(|s| *s.borrow_mut() = false);

    web_sys::console::info_1(&format!("[gossip] '{topic_string}' ready").into());
    Ok(())
}

async fn run_receiver(receiver: GossipReceiver) {
    let mut rx = receiver;
    while let Some(event) = rx.next().await {
        match event {
            Ok(GossipEvent::Received(msg)) => {
                if let Ok(ma_msg) = Message::decode(&msg.content) {
                    SESSION_GOSSIP_QUEUE.with(|q| q.borrow_mut().push(ma_msg));
                }
            }
            Ok(_) => {}
            Err(_) => break,
        }
    }
}

// ── Unsubscribe ───────────────────────────────────────────────────────────

/// Drop the active subscription (session only — does not touch config).
pub fn unsubscribe() {
    SESSION_GOSSIP.with(|g| *g.borrow_mut() = None);
}

// ── Publish ───────────────────────────────────────────────────────────────

/// Broadcast a message on the active gossip channel.
pub async fn publish(body: &str, content_type: &str) -> Result<(), String> {
    let sender: GossipSender = SESSION_GOSSIP
        .with(|g| g.borrow().as_ref().map(|s| s.sender.clone()))
        .ok_or_else(|| "not subscribed to broadcast channel".to_string())?;

    let (sender_did, signing_key) =
        crate::transport::connection::get_session_info().map_err(|e| e.to_string())?;

    let msg = Message::new(
        sender_did,
        String::new(),
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

/// Drain and validate all queued gossip messages.
pub fn drain() -> Vec<Message> {
    let raw: Vec<Message> = SESSION_GOSSIP_QUEUE.with(|q| q.borrow_mut().drain(..).collect());
    let mut out = Vec::new();
    SESSION_GOSSIP.with(|g| {
        if let Some(session) = g.borrow_mut().as_mut() {
            for msg in raw {
                if session.topic.deliver(msg) {
                    out.extend(session.topic.drain());
                }
            }
        }
    });
    out
}

// ── Status ────────────────────────────────────────────────────────────────

/// Whether the broadcast channel is currently subscribed.
pub fn is_subscribed() -> bool {
    SESSION_GOSSIP.with(|g| g.borrow().is_some())
}

/// The topic string of the current subscription, if any.
pub fn current_topic() -> Option<String> {
    SESSION_GOSSIP.with(|g| g.borrow().as_ref().map(|s| s.topic_string.clone()))
}
