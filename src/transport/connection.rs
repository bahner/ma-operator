/// iroh transport layer — wraps ma_core::MaEndpoint for use in WASM.
use ma_core::{
    generate_ipfs_publish_request, generate_ipfs_store_request, new_ma_endpoint, Did,
    IpfsGatewayResolver, Ipld, MaExtension, Message, SecretBundle, SigningKey, CONTENT_TYPE_TERM,
    CRUD_PROTOCOL_ID, INBOX_PROTOCOL_ID, IPFS_PROTOCOL_ID, MESSAGE_TYPE_CHAT,
    MESSAGE_TYPE_CRUD_REPLY, MESSAGE_TYPE_EMOTE, MESSAGE_TYPE_IPFS_REQUEST, MESSAGE_TYPE_MESSAGE,
    MESSAGE_TYPE_RPC, MESSAGE_TYPE_RPC_REPLY, RPC_PROTOCOL_ID,
};

use crate::messages::{format_incoming, format_rpc_reply, IncomingMessage};
use crate::state::{
    ENDPOINT, SESSION_CREATED_AT, SESSION_CRUD_INBOX, SESSION_ENCRYPTION_KEY, SESSION_INBOX,
    SESSION_IPNS_KEY, SESSION_IROH_KEY, SESSION_LANG, SESSION_RESOLVER, SESSION_RPC_INBOX,
    SESSION_SENDER_DID, SESSION_SIGNING_KEY,
};
use std::rc::Rc;

const CONTENT_TYPE_TEXT: &str = "text/plain";

use log::info;

pub const LOCAL_GATEWAY_URL: &str = "http://127.0.0.1:8080/";

// ── Endpoint lifecycle ─────────────────────────────────────────────────────

pub async fn connect(
    iroh_key: [u8; 32],
    ipns_secret_key: [u8; 32],
    did_signing_key: [u8; 32],
    did_encryption_key: [u8; 32],
    sender_did: String,
    created_at: String,
) -> Result<(), String> {
    info!("Connecting with sender DID: {}", sender_did);
    let mut endpoint = new_ma_endpoint(iroh_key, false)
        .await
        .map_err(|e| e.to_string())?;
    let inbox = endpoint.service(INBOX_PROTOCOL_ID);
    let rpc_inbox = endpoint.service(RPC_PROTOCOL_ID);
    let crud_inbox = endpoint.service(CRUD_PROTOCOL_ID);
    let ep = Rc::from(endpoint);
    ENDPOINT.with(|e| *e.borrow_mut() = Some(ep));
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = Some(iroh_key));
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = Some(ipns_secret_key));
    SESSION_INBOX.with(|i| *i.borrow_mut() = Some(inbox));
    SESSION_RPC_INBOX.with(|i| *i.borrow_mut() = Some(rpc_inbox));
    SESSION_CRUD_INBOX.with(|i| *i.borrow_mut() = Some(crud_inbox));
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = Some(did_signing_key));
    SESSION_ENCRYPTION_KEY.with(|k| *k.borrow_mut() = Some(did_encryption_key));
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = Some(sender_did));
    SESSION_CREATED_AT.with(|c| *c.borrow_mut() = Some(created_at));
    // Create a single shared resolver so its positive-cache is reused across
    // all concurrent sends — the DID document is fetched from the gateway
    // exactly once and then served from cache for subsequent sends.
    // Prefer local Kubo gateway for fresh IPNS updates; fall back to dweb.link
    // at send-time when local resolution is unavailable.
    let resolver = Rc::new(IpfsGatewayResolver::default());
    SESSION_RESOLVER.with(|r| *r.borrow_mut() = Some(resolver));
    info!("Connection established.");
    Ok(())
}

pub fn disconnect() {
    ENDPOINT.with(|e| *e.borrow_mut() = None);
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_RPC_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_CRUD_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_ENCRYPTION_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = None);
    SESSION_CREATED_AT.with(|c| *c.borrow_mut() = None);
    SESSION_RESOLVER.with(|r| *r.borrow_mut() = None);
}

pub fn is_connected() -> bool {
    ENDPOINT.with(|e| e.borrow().is_some())
}

// ── Session helpers ────────────────────────────────────────────────────────

/// Return the current session's own DID, or `None` if not logged in.
pub fn get_sender_did() -> Option<String> {
    SESSION_SENDER_DID.with(|d| d.borrow().clone())
}

fn get_session() -> Result<(String, SigningKey), String> {
    let signing_key_bytes = SESSION_SIGNING_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let sender_did_str = SESSION_SENDER_DID
        .with(|d| d.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let did = Did::try_from(sender_did_str.as_str()).map_err(|e| e.to_string())?;
    let signing_key =
        SigningKey::from_private_key_bytes(did, signing_key_bytes).map_err(|e| e.to_string())?;
    Ok((sender_did_str, signing_key))
}

// ── Messaging ──────────────────────────────────────────────────────────────

/// Send a plain-text message. Returns the dispatched `Message.id` on success.
pub async fn send_text(target_did: &str, text: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_MESSAGE,
        CONTENT_TYPE_TEXT,
        text.as_bytes(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send an ephemeral chat message (`application/x-ma-chat`).
/// Returns the dispatched `Message.id` on success.
pub async fn send_chat(target_did: &str, text: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_CHAT,
        CONTENT_TYPE_TEXT,
        text.as_bytes(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send an emote (`application/x-ma-emote`).
/// Returns the dispatched `Message.id` on success.
pub async fn send_emote(target_did: &str, text: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_EMOTE,
        CONTENT_TYPE_TEXT,
        text.as_bytes(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send an RPC message. Returns the dispatched `Message.id` on success.
pub async fn send_rpc(target_did: &str, verb: &str, args: &[&str]) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;

    let atom = if verb.starts_with(':') {
        verb.to_string()
    } else {
        format!(":{verb}")
    };

    let cbor_val = if args.is_empty() {
        ciborium::Value::Text(atom)
    } else {
        let mut items: Vec<ciborium::Value> = Vec::with_capacity(1 + args.len());
        items.push(ciborium::Value::Text(atom));
        for arg in args {
            items.push(ciborium::Value::Text(arg.to_string()));
        }
        ciborium::Value::Array(items)
    };

    let mut body = Vec::new();
    ciborium::ser::into_writer(&cbor_val, &mut body).map_err(|e| e.to_string())?;

    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_RPC,
        CONTENT_TYPE_TERM,
        &body,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, RPC_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send an RPC message whose single argument is a raw byte blob (DAG-CBOR).
/// The verb is sent as a CBOR text atom; the bytes are a CBOR bytes value.
/// Returns the dispatched `Message.id` on success.
#[allow(dead_code)]
pub async fn send_rpc_bytes(
    target_did: &str,
    verb: &str,
    payload: Vec<u8>,
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;

    let atom = if verb.starts_with(':') {
        verb.to_string()
    } else {
        format!(":{verb}")
    };

    let cbor_val = ciborium::Value::Array(vec![
        ciborium::Value::Text(atom),
        ciborium::Value::Bytes(payload),
    ]);

    let mut body = Vec::new();
    ciborium::ser::into_writer(&cbor_val, &mut body).map_err(|e| e.to_string())?;

    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_RPC,
        CONTENT_TYPE_TERM,
        &body,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, RPC_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send our own signed DID document to a publisher's `/ma/ipfs/0.0.1` endpoint.
///
/// Uses `SecretBundle::generate_identity()` (via `ma_core`) to rebuild the
/// deterministic signed `Document` from the session keys, then packages it
/// with `generate_ipfs_publish_request()` into an `application/x-ma-ipfs-request`
/// CBOR envelope addressed to `publisher_did`.
pub async fn send_ipfs_publish(publisher_did: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;

    let ipns_key = SESSION_IPNS_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let enc_key = SESSION_ENCRYPTION_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let sign_key_bytes = SESSION_SIGNING_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;

    // Reconstruct bundle from raw key bytes so we can call generate_identity().
    // SecretBundle::generate() fills random bytes; we immediately overwrite
    // all four public fields with the actual session keys.
    let created_at = SESSION_CREATED_AT
        .with(|c| c.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let mut bundle = SecretBundle::generate();
    bundle.iroh_secret_key = [0u8; 32]; // unused for document building
    bundle.ipns_secret_key = ipns_key;
    bundle.did_signing_key = sign_key_bytes;
    bundle.did_encryption_key = enc_key;
    bundle.created_at = created_at;

    // Build document with endpoint services so the DID doc advertises
    // INBOX_PROTOCOL_ID and RPC_PROTOCOL_ID for reply delivery.
    let ma_ext = ENDPOINT
        .with(|e| e.borrow().as_ref().map(|ep| ep.ma_extension()))
        .unwrap_or_else(MaExtension::new)
        .kind("agent");
    // Inject language preference hint if set.
    let ma_ext = match SESSION_LANG.with(|l| l.borrow().clone()) {
        Some(lang) if !lang.is_empty() => ma_ext.extra("lang", Ipld::String(lang)),
        _ => ma_ext,
    };
    let document = bundle
        .build_document(ma_ext)
        .map_err(|e| format!("build document failed: {e}"))?;

    let payload = generate_ipfs_publish_request(&document, &ipns_key)
        .map_err(|e| format!("build ipfs request: {e}"))?;

    let msg = Message::new(
        &sender_did,
        publisher_did,
        MESSAGE_TYPE_IPFS_REQUEST,
        "application/cbor",
        &payload,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(publisher_did, IPFS_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send arbitrary content to an IPFS publisher's `/ma/ipfs/0.0.1` endpoint for
/// storage. Returns the dispatched `Message.id` on success; the CID arrives
/// later via an RPC reply keyed on that id.
pub async fn send_ipfs_store(
    publisher_did: &str,
    content: Vec<u8>,
    content_type: &str,
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let msg = generate_ipfs_store_request(
        &sender_did,
        publisher_did,
        content,
        content_type,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(publisher_did, IPFS_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send a plain-text reply to a message.
/// `reply_to_id` is the `Message.id` of the message being replied to.
/// Returns the dispatched `Message.id` on success.
pub async fn send_text_reply(
    target_did: &str,
    body: &str,
    reply_to_id: &str,
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let mut msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_MESSAGE,
        CONTENT_TYPE_TEXT,
        body.as_bytes(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    msg.reply_to = Some(reply_to_id.to_string());
    let msg_id = msg.id.clone();
    send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send a `:pong` reply to a peer that sent `:ping`.
/// `reply_to_id` is the `Message.id` of the incoming `:ping`.
pub async fn send_rpc_pong(target_did: &str, reply_to_id: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let mut pong = Vec::new();
    ciborium::ser::into_writer(&ciborium::Value::Text(":pong".to_string()), &mut pong)
        .map_err(|e| e.to_string())?;
    let mut msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_RPC_REPLY,
        CONTENT_TYPE_TERM,
        &pong,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    msg.reply_to = Some(reply_to_id.to_string());
    let msg_id = msg.id.clone();
    send_message_on(target_did, RPC_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Drain pending RPC-inbox messages (`:pong` replies etc.), same decoding as inbox.
pub fn drain_rpc_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_RPC_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| inbox.drain(now).into_iter().map(decode_incoming).collect())
            .unwrap_or_default()
    })
}

/// Drain pending CRUD-inbox reply messages.
pub fn drain_crud_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_CRUD_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| inbox.drain(now).into_iter().map(decode_incoming).collect())
            .unwrap_or_default()
    })
}

/// CRUD get — read a value at `path` (e.g. `.config.i18n`).
/// Payload: CBOR `[":get", ".path"]`
pub async fn send_crud_get(target_did: &str, path: &str) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session()?;
    let atom = if path.starts_with('.') {
        path.to_string()
    } else {
        format!(".{path}")
    };
    let cbor_val = ciborium::Value::Array(vec![
        ciborium::Value::Text(":get".to_string()),
        ciborium::Value::Text(atom),
    ]);
    let mut body = Vec::new();
    ciborium::ser::into_writer(&cbor_val, &mut body).map_err(|e| e.to_string())?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_CRUD,
        CONTENT_TYPE_TERM,
        &body,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, CRUD_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// CRUD set — write `value` at `path`.
/// Payload: CBOR `[".path", value]`
pub async fn send_crud_set(
    target_did: &str,
    path: &str,
    value: ciborium::Value,
) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session()?;
    let atom = if path.starts_with('.') {
        path.to_string()
    } else {
        format!(".{path}")
    };
    let cbor_val = ciborium::Value::Array(vec![ciborium::Value::Text(atom), value]);
    let mut body = Vec::new();
    ciborium::ser::into_writer(&cbor_val, &mut body).map_err(|e| e.to_string())?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_CRUD,
        CONTENT_TYPE_TERM,
        &body,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, CRUD_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// CRUD delete — remove the subtree at `path`.
/// Payload: CBOR `[":delete", ".path"]`
pub async fn send_crud_delete(target_did: &str, path: &str) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session()?;
    let atom = if path.starts_with('.') {
        path.to_string()
    } else {
        format!(".{path}")
    };
    let cbor_val = ciborium::Value::Array(vec![
        ciborium::Value::Text(":delete".to_string()),
        ciborium::Value::Text(atom),
    ]);
    let mut body = Vec::new();
    ciborium::ser::into_writer(&cbor_val, &mut body).map_err(|e| e.to_string())?;
    let msg = Message::new(
        &sender_did,
        target_did,
        MESSAGE_TYPE_CRUD,
        CONTENT_TYPE_TERM,
        &body,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, CRUD_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

async fn send_message_on(target_did: &str, protocol: &str, msg: Message) -> Result<(), String> {
    let ep = ENDPOINT
        .with(|e| e.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let resolver = SESSION_RESOLVER
        .with(|r| r.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;

    log::debug!("send_message_on: resolving DID={target_did} protocol={protocol}");
    // IpfsGatewayResolver::default() tries localhost:8080 first, then
    // falls back to public gateways (dweb.link, w3s.link) automatically.
    let mut outbox = ep
        .outbox(resolver.as_ref(), target_did, protocol)
        .await
        .map_err(|e| {
            log::warn!("send_message_on: outbox failed for {target_did}: {e}");
            e.to_string()
        })?;
    log::debug!("send_message_on: outbox ready, sending msg id={}", msg.id);
    outbox.send(&msg).await.map_err(|e| {
        log::warn!("send_message_on: send failed for {target_did}: {e}");
        e.to_string()
    })
}

/// Drain pending inbox messages, decoding each into an `IncomingMessage`.
pub fn drain_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| inbox.drain(now).into_iter().map(decode_incoming).collect())
            .unwrap_or_default()
    })
}

fn decode_incoming(msg: Message) -> IncomingMessage {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (display, is_error) = match msg.message_type.as_str() {
        MESSAGE_TYPE_RPC_REPLY | MESSAGE_TYPE_RPC | MESSAGE_TYPE_CRUD | MESSAGE_TYPE_CRUD_REPLY => {
            let (term, err) = format_rpc_reply(&msg.payload());
            (format!("\u{2190} {} {}", msg.from, term), err)
        }
        MESSAGE_TYPE_CHAT => {
            let bytes = msg.payload();
            let body = String::from_utf8_lossy(&bytes);
            (format!("\u{2190} {} {}", msg.from, body), false)
        }
        MESSAGE_TYPE_EMOTE => {
            let bytes = msg.payload();
            let body = String::from_utf8_lossy(&bytes);
            (format!("* {} {}", msg.from, body), false)
        }
        _ => {
            let bytes = msg.payload();
            (
                format_incoming(
                    &msg.from,
                    &msg.content_type,
                    &String::from_utf8_lossy(&bytes),
                ),
                false,
            )
        }
    };
    let payload = msg.payload();
    IncomingMessage {
        message_id: msg.id,
        message_type: msg.message_type,
        from: msg.from,
        to: msg.to,
        reply_to: msg.reply_to,
        content_type: msg.content_type,
        content: payload,
        created_at: msg.created_at,
        exp: msg.exp,
        display,
        is_error,
    }
}
