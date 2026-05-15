/// iroh transport layer — wraps ma_core::MaEndpoint for use in WASM.
use ma_core::{
    generate_ipfs_publish_request, new_ma_endpoint, Did, IpfsGatewayResolver, MaExtension,
    Message, SecretBundle, SigningKey, INBOX_PROTOCOL_ID, IPFS_PROTOCOL_ID, RPC_PROTOCOL_ID,
};

use crate::messages::{format_incoming, format_rpc_reply, IncomingMessage};
use crate::state::{
    ENDPOINT, SESSION_ENCRYPTION_KEY, SESSION_INBOX, SESSION_IPNS_KEY, SESSION_IROH_KEY,
    SESSION_RPC_INBOX, SESSION_SENDER_DID, SESSION_SIGNING_KEY,
};
use std::rc::Rc;

const CONTENT_TYPE_RPC: &str = "application/x-ma-rpc";
const CONTENT_TYPE_RPC_REPLY: &str = "application/x-ma-rpc-reply";
const CONTENT_TYPE_TEXT: &str = "text/plain";
const CONTENT_TYPE_IPFS_REQUEST: &str = "application/x-ma-ipfs-request";

use log::info;

// ── Endpoint lifecycle ─────────────────────────────────────────────────────

pub async fn connect(
    iroh_key: [u8; 32],
    ipns_secret_key: [u8; 32],
    did_signing_key: [u8; 32],
    did_encryption_key: [u8; 32],
    sender_did: String,
) -> Result<(), String> {
    info!("Connecting with sender DID: {}", sender_did);
    let mut endpoint = new_ma_endpoint(iroh_key)
        .await
        .map_err(|e| e.to_string())?;
    let inbox = endpoint.service(INBOX_PROTOCOL_ID);
    let rpc_inbox = endpoint.service(RPC_PROTOCOL_ID);
    let ep = Rc::from(endpoint);
    ENDPOINT.with(|e| *e.borrow_mut() = Some(ep));
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = Some(iroh_key));
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = Some(ipns_secret_key));
    SESSION_INBOX.with(|i| *i.borrow_mut() = Some(inbox));
    SESSION_RPC_INBOX.with(|i| *i.borrow_mut() = Some(rpc_inbox));
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = Some(did_signing_key));
    SESSION_ENCRYPTION_KEY.with(|k| *k.borrow_mut() = Some(did_encryption_key));
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = Some(sender_did));
    info!("Connection established.");
    Ok(())
}

pub fn disconnect() {
    ENDPOINT.with(|e| *e.borrow_mut() = None);
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_RPC_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_ENCRYPTION_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = None);
}

pub fn is_connected() -> bool {
    ENDPOINT.with(|e| e.borrow().is_some())
}

// ── Session helpers ────────────────────────────────────────────────────────

fn get_session() -> Result<(String, SigningKey), String> {
    let signing_key_bytes = SESSION_SIGNING_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let sender_did_str = SESSION_SENDER_DID
        .with(|d| d.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let did = Did::try_from(sender_did_str.as_str()).map_err(|e| e.to_string())?;
    let signing_key = SigningKey::from_private_key_bytes(did, signing_key_bytes)
        .map_err(|e| e.to_string())?;
    Ok((sender_did_str, signing_key))
}

// ── Messaging ──────────────────────────────────────────────────────────────

/// Send a plain-text message. Returns the dispatched `Message.id` on success.
pub async fn send_text(target_did: &str, text: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session()?;
    let msg = Message::new(
        &sender_did,
        target_did,
        CONTENT_TYPE_TEXT,
        text.as_bytes().to_vec(),
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
        CONTENT_TYPE_RPC,
        body,
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
    let mut bundle = SecretBundle::generate();
    bundle.iroh_secret_key = [0u8; 32]; // unused for document building
    bundle.ipns_secret_key = ipns_key;
    bundle.did_signing_key = sign_key_bytes;
    bundle.did_encryption_key = enc_key;

    // Build document with endpoint services so the DID doc advertises
    // INBOX_PROTOCOL_ID and RPC_PROTOCOL_ID for reply delivery.
    let ma_ext = ENDPOINT
        .with(|e| e.borrow().as_ref().map(|ep| ep.ma_extension()))
        .unwrap_or_else(MaExtension::new);
    let document = bundle
        .build_document(ma_ext)
        .map_err(|e| format!("build document failed: {e}"))?;

    let payload =
        generate_ipfs_publish_request(&document, &ipns_key)
            .map_err(|e| format!("build ipfs request: {e}"))?;

    let msg = Message::new(
        &sender_did,
        publisher_did,
        CONTENT_TYPE_IPFS_REQUEST,
        payload,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(publisher_did, IPFS_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Drain pending RPC-inbox messages (`:pong` replies etc.), same decoding as inbox.
pub fn drain_rpc_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_RPC_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| {
                inbox
                    .drain(now)
                    .into_iter()
                    .map(decode_incoming)
                    .collect()
            })
            .unwrap_or_default()
    })
}

async fn send_message_on(
    target_did: &str,
    protocol: &str,
    msg: Message,
) -> Result<(), String> {
    let ep = ENDPOINT
        .with(|e| e.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let resolver = IpfsGatewayResolver::new("https://dweb.link/");
    let mut outbox = ep
        .outbox(&resolver, target_did, protocol)
        .await
        .map_err(|e| e.to_string())?;
    outbox.send(&msg).await.map_err(|e| e.to_string())
}

/// Drain pending inbox messages, decoding each into an `IncomingMessage`.
pub fn drain_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| {
                inbox
                    .drain(now)
                    .into_iter()
                    .map(decode_incoming)
                    .collect()
            })
            .unwrap_or_default()
    })
}

fn decode_incoming(msg: Message) -> IncomingMessage {
    let (display, is_error) = match msg.content_type.as_str() {
        CONTENT_TYPE_RPC_REPLY | CONTENT_TYPE_RPC => {
            let (term, err) = format_rpc_reply(&msg.content);
            (format!("← [{}] {}", msg.from, term), err)
        }
        _ => (
            format_incoming(
                &msg.from,
                &msg.content_type,
                &String::from_utf8_lossy(&msg.content),
            ),
            false,
        ),
    };
    IncomingMessage {
        reply_to: msg.reply_to,
        display,
        is_error,
    }
}
