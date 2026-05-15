/// iroh transport layer — wraps ma_core::MaEndpoint for use in WASM.
///
/// The endpoint is stored as a thread-local after login.
/// All async operations use wasm_bindgen_futures::spawn_local.
use ma_core::{
    new_ma_endpoint, Did, IpfsGatewayResolver, Message, SigningKey,
    INBOX_PROTOCOL_ID, RPC_PROTOCOL_ID,
};

use crate::state::{
    ENDPOINT, SESSION_INBOX, SESSION_IPNS_KEY, SESSION_IROH_KEY,
    SESSION_SENDER_DID, SESSION_SIGNING_KEY,
};
use std::rc::Rc;

const CONTENT_TYPE_RPC: &str = "application/x-ma-rpc";
const CONTENT_TYPE_TEXT: &str = "text/plain";

use log::info;

// ── Endpoint lifecycle ─────────────────────────────────────────────────────

/// Initialise the iroh endpoint, register inbox service, store all session state.
pub async fn connect(
    iroh_key: [u8; 32],
    ipns_secret_key: [u8; 32],
    did_signing_key: [u8; 32],
    sender_did: String,
) -> Result<(), String> {
    info!("Connecting with sender DID: {}", sender_did); // Log connection attempt
    let mut endpoint = new_ma_endpoint(iroh_key)
        .await
        .map_err(|e| e.to_string())?;
    let inbox = endpoint.service(INBOX_PROTOCOL_ID);
    let ep = Rc::from(endpoint);
    ENDPOINT.with(|e| *e.borrow_mut() = Some(ep));
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = Some(iroh_key));
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = Some(ipns_secret_key));
    SESSION_INBOX.with(|i| *i.borrow_mut() = Some(inbox));
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = Some(did_signing_key));
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = Some(sender_did));
    info!("Connection established."); // Log success
    Ok(())
}

/// Drop the current endpoint (on logout).
pub fn disconnect() {
    ENDPOINT.with(|e| *e.borrow_mut() = None);
    SESSION_IROH_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_IPNS_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_INBOX.with(|i| *i.borrow_mut() = None);
    SESSION_SIGNING_KEY.with(|k| *k.borrow_mut() = None);
    SESSION_SENDER_DID.with(|d| *d.borrow_mut() = None);
}

/// Returns true if we have a live endpoint.
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

/// Send a plain-text message to a DID (content-type: text/plain).
pub async fn send_text(target_did: &str, text: &str) -> Result<(), String> {
    info!("Sending text message to DID: {}", target_did); // Log message sending
    let (sender_did, signing_key) = get_session()?;
    let msg = Message::new(
        &sender_did,
        target_did,
        CONTENT_TYPE_TEXT,
        text.as_bytes().to_vec(),
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let result = send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await;
    match &result {
        Ok(()) => info!("Message sent successfully to DID: {}", target_did),
        Err(err) => info!("Failed to send message to DID: {}: {}", target_did, err),
    }
    result
}

/// Send an RPC message (content-type: application/x-ma-rpc) on /ma/rpc/0.0.1.
/// Body is a CBOR-encoded term: atom `:verb` or tuple `[":verb", arg1, ...]`.
/// Atoms MUST be prefixed with `:` per spec §3.1.
pub async fn send_rpc(target_did: &str, verb: &str, args: &[&str]) -> Result<(), String> {
    info!("Sending RPC message to DID: {} with verb: {}", target_did, verb); // Log RPC sending
    let (sender_did, signing_key) = get_session()?;

    // Ensure the verb is an atom: prefix with `:` if not already present.
    let atom = if verb.starts_with(':') {
        verb.to_string()
    } else {
        format!(":{verb}")
    };

    // Single atom when no args; tuple when args are present.
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
    let result = send_message_on(target_did, RPC_PROTOCOL_ID, msg).await;
    match &result {
        Ok(()) => info!("RPC message sent successfully to DID: {}", target_did),
        Err(err) => info!("Failed to send RPC message to DID: {}: {}", target_did, err),
    }
    result
}

/// Internal: deliver a Message to a remote DID via outbox on the given protocol.
async fn send_message_on(target_did: &str, protocol: &str, msg: Message) -> Result<(), String> {
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

/// Drain all pending inbox messages and format them for display.
pub fn drain_inbox() -> Vec<String> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| {
                inbox
                    .drain(now)
                    .into_iter()
                    .map(|msg| {
                        crate::messages::format_incoming(
                            &msg.from,
                            &msg.content_type,
                            &String::from_utf8_lossy(&msg.content),
                        )
                    })
                    .collect()
            })
            .unwrap_or_default()
    })
}
