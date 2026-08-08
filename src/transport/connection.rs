/// iroh transport layer — wraps ma_core::MaEndpoint for use in WASM.
use ma_core::{
    generate_identity_publish_request, generate_ipfs_store_request, new_ma_endpoint,
    resolve_endpoint_for_protocol, Did, DidDocumentResolver, EncryptionKey, IpfsGatewayResolver,
    Ipld, Message, SecretBundle, SigningKey, CONTENT_TYPE_TERM, CRUD_PROTOCOL_ID,
    INBOX_PROTOCOL_ID, IPFS_PROTOCOL_ID, MESSAGE_TYPE_CHAT, MESSAGE_TYPE_EMOTE,
    MESSAGE_TYPE_IDENTITY_PUBLISH_REQUEST, MESSAGE_TYPE_MESSAGE, MESSAGE_TYPE_RPC,
    MESSAGE_TYPE_RPC_REPLY, RPC_PROTOCOL_ID,
};
use ma_zscheme::SchemeVal;

use crate::i18n::tf;
use crate::messages::{format_crud_reply, format_incoming, format_rpc_reply, IncomingMessage};
use crate::state::{
    ENDPOINT, SESSION_AGENT_CID, SESSION_CREATED_AT, SESSION_CRUD_INBOX, SESSION_ENCRYPTION_KEY,
    SESSION_INBOX, SESSION_IPNS_KEY, SESSION_IROH_KEY, SESSION_LANG, SESSION_LOCAL_IPFS,
    SESSION_RESOLVER, SESSION_RPC_INBOX, SESSION_SENDER_DID, SESSION_SIGNING_KEY,
};
use futures::FutureExt as _;
use std::rc::Rc;
use std::sync::Arc;
use web_time::Duration;

const CONTENT_TYPE_TEXT: &str = "text/plain";
const SEND_TIMEOUT_MS: u32 = 10_000;

use log::info;

pub const LOCAL_GATEWAY_URL: &str = "http://127.0.0.1:8080/";

fn is_local_web_origin(origin: &str) -> bool {
    origin.starts_with("http://localhost:")
        || origin.starts_with("http://127.0.0.1:")
        || origin.starts_with("http://[::1]:")
}

pub(crate) fn should_use_public_gateway() -> bool {
    let Some(window) = web_sys::window() else {
        return false;
    };
    let origin = window.location().origin().unwrap_or_default();
    !origin.is_empty() && origin.starts_with("https://") && !is_local_web_origin(&origin)
}

/// Returns the IPFS gateway pool honouring zion's gateway policy.
/// On HTTPS pages the local gateway is included only when the user has opted in.
pub fn session_gateway_pool() -> ma_core::GatewayPool {
    let use_local = !should_use_public_gateway() || SESSION_LOCAL_IPFS.with(|f| *f.borrow());
    if use_local {
        ma_core::GatewayPool::default()
    } else {
        ma_core::GatewayPool::public_default()
    }
}

fn session_resolver() -> IpfsGatewayResolver {
    // Always try local gateway first (browsers allow localhost from HTTPS pages).
    IpfsGatewayResolver::default()
}

// ── WASM iroh send serialiser ────────────────────────────────────────────────

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
    let resolver = Arc::new(
        session_resolver()
            .with_base_cooldown(Duration::ZERO)
            .with_cache_ttls(Duration::ZERO, Duration::from_secs(2)),
    );
    let encryption_did = Did::try_from(sender_did.as_str())
        .and_then(|did| did.with_fragment("enc"))
        .map_err(|error| error.to_string())?;
    let encryption_key = EncryptionKey::from_private_key_bytes(encryption_did, did_encryption_key)
        .map_err(|error| error.to_string())?;
    let mut endpoint = new_ma_endpoint(iroh_key, encryption_key, resolver.clone(), false)
        .await
        .map_err(|e| e.to_string())?;
    let inbox = endpoint.service(INBOX_PROTOCOL_ID);
    let rpc_inbox = endpoint.service(RPC_PROTOCOL_ID);
    let crud_inbox = endpoint.service(CRUD_PROTOCOL_ID);
    let ep: Rc<dyn ma_core::MaEndpoint> = Rc::from(endpoint);
    let endpoint_id = ep.id();
    web_sys::console::info_1(
        &format!("[iroh] endpoint up — id={endpoint_id} did={sender_did}").into(),
    );
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
    // Keep one resolver for configuration, but do not positive-cache DID docs:
    // remote runtimes may restart with a new iroh endpoint after OOM/redeploy.
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
    SESSION_AGENT_CID.with(|c| *c.borrow_mut() = None);
}

pub fn is_connected() -> bool {
    ENDPOINT.with(|e| e.borrow().is_some())
}

pub fn get_endpoint_id() -> Option<String> {
    ENDPOINT.with(|e| e.borrow().as_ref().map(|ep| ep.id()))
}

// ── Session helpers ────────────────────────────────────────────────────────

/// Return the current session's own DID, or `None` if not logged in.
pub fn get_sender_did() -> Option<String> {
    SESSION_SENDER_DID.with(|d| d.borrow().clone())
}

pub(crate) fn actor_url(identity_did: &str, fragment: &str) -> Result<String, String> {
    let did = Did::try_from(identity_did).map_err(|e| e.to_string())?;
    match did.fragment.as_deref() {
        Some(existing) if existing == fragment => Ok(identity_did.to_string()),
        Some(existing) => Err(format!(
            "expected #{fragment} actor address, found #{existing}"
        )),
        None => did
            .with_fragment(fragment)
            .map(|url| url.id())
            .map_err(|e| e.to_string()),
    }
}

pub(crate) fn get_session_info() -> Result<(String, SigningKey), String> {
    let signing_key_bytes = SESSION_SIGNING_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let sender_did_str = SESSION_SENDER_DID
        .with(|d| d.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let did = Did::try_from(sender_did_str.as_str()).map_err(|e| e.to_string())?;
    if !did.is_bare() {
        return Err("session sender must be a bare DID".to_string());
    }
    let signing_key =
        SigningKey::from_private_key_bytes(did, signing_key_bytes).map_err(|e| e.to_string())?;
    Ok((sender_did_str, signing_key))
}

// ── Messaging ──────────────────────────────────────────────────────────────

/// Send a plain-text message. Returns the dispatched `Message.id` on success.
pub async fn send_text(target_did: &str, text: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session_info()?;
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

/// Send an RPC message. Returns the dispatched `Message.id` on success.
pub async fn send_rpc(target_did: &str, verb: &str, args: &[&str]) -> Result<String, String> {
    send_rpc_with_msg_id(target_did, verb, args, |_| {}).await
}

/// Send an RPC message and expose its `Message.id` before network dispatch.
pub async fn send_rpc_with_msg_id(
    target_did: &str,
    verb: &str,
    args: &[&str],
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session_info()?;

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
    on_msg_id(msg_id.clone());
    send_message_on(target_did, RPC_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send an RPC message with `SchemeVal` arguments, preserving list/map
/// structure in the CBOR encoding. Returns the dispatched `Message.id`.
pub async fn send_rpc_vals(
    target_did: &str,
    verb: &str,
    args: &[SchemeVal],
) -> Result<String, String> {
    send_rpc_vals_with_msg_id(target_did, verb, args, |_| {}).await
}

/// Send an RPC message with `SchemeVal` arguments and expose its `Message.id`
/// before network dispatch.
pub async fn send_rpc_vals_with_msg_id(
    target_did: &str,
    verb: &str,
    args: &[SchemeVal],
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session_info()?;

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
            items.push(scheme_val_to_cbor(arg));
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
    on_msg_id(msg_id.clone());
    send_message_on(target_did, RPC_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

fn scheme_val_to_cbor(v: &SchemeVal) -> ciborium::Value {
    use ciborium::Value as V;
    match v {
        SchemeVal::Str(s) => V::Text(s.clone()),
        SchemeVal::Bytes(bytes) => V::Bytes(bytes.clone()),
        SchemeVal::Int(n) => V::Integer(ciborium::value::Integer::from(*n)),
        SchemeVal::Float(f) => V::Float(*f),
        SchemeVal::Bool(b) => V::Bool(*b),
        SchemeVal::Nil => V::Null,
        SchemeVal::List(items) => V::Array(items.iter().map(scheme_val_to_cbor).collect()),
        SchemeVal::Map(map) => V::Map(
            map.iter()
                .map(|(key, value)| (V::Text(key.clone()), scheme_val_to_cbor(value)))
                .collect(),
        ),
        other => V::Text(other.display()),
    }
}

/// Send an identity-publish request and expose its `Message.id` before dispatch.
pub async fn send_identity_publish_with_msg_id(
    publisher_did: &str,
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    let (sender_did, signing_key) = get_session_info()?;

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
        .unwrap_or_default()
        .kind("agent");
    // Inject language preference hint if set.
    let ma_ext = match SESSION_LANG.with(|l| l.borrow().clone()) {
        Some(lang) if !lang.is_empty() => ma_ext.extra("lang", Ipld::String(lang)),
        _ => ma_ext,
    };
    // Inject profile CID as a canonical IPLD link when the value is a valid
    // CID; otherwise keep the raw string to preserve backwards compatibility
    // with any previously stored non-CID values.
    let ma_ext = match SESSION_AGENT_CID.with(|c| c.borrow().clone()) {
        Some(cid) if !cid.is_empty() => {
            let link = match cid::Cid::try_from(cid.as_str()) {
                Ok(parsed) => Ipld::Link(parsed),
                Err(_) => Ipld::String(cid),
            };
            ma_ext.extra("profile", link)
        }
        _ => ma_ext,
    };
    let document = bundle
        .build_document(ma_ext)
        .map_err(|e| format!("build document failed: {e}"))?;
    document
        .validate()
        .map_err(|e| format!("build document invalid: {e}"))?;
    document
        .verify()
        .map_err(|e| format!("build document signature invalid: {e}"))?;

    let payload = generate_identity_publish_request(&document, &ipns_key)
        .map_err(|e| format!("build ipfs request: {e}"))?;
    let publisher_url = actor_url(publisher_did, "ipfs")?;

    let msg = Message::new(
        &sender_did,
        &publisher_url,
        MESSAGE_TYPE_IDENTITY_PUBLISH_REQUEST,
        "application/cbor",
        &payload,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    on_msg_id(msg_id.clone());
    send_message_on(&publisher_url, IPFS_PROTOCOL_ID, msg).await?;
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
    let (sender_did, signing_key) = get_session_info()?;
    let publisher_url = actor_url(publisher_did, "ipfs")?;
    let msg = generate_ipfs_store_request(
        &sender_did,
        &publisher_url,
        content,
        content_type,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(&publisher_url, IPFS_PROTOCOL_ID, msg).await?;
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
    let (sender_did, signing_key) = get_session_info()?;
    let msg = Message::new_reply(
        &sender_did,
        target_did,
        MESSAGE_TYPE_MESSAGE,
        CONTENT_TYPE_TEXT,
        body.as_bytes(),
        reply_to_id,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
    let msg_id = msg.id.clone();
    send_message_on(target_did, INBOX_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Send a `:pong` reply to a peer that sent `:ping`.
/// `reply_to_id` is the `Message.id` of the incoming `:ping`.
pub async fn send_rpc_pong(target_did: &str, reply_to_id: &str) -> Result<String, String> {
    let (sender_did, signing_key) = get_session_info()?;
    let mut pong = Vec::new();
    ciborium::ser::into_writer(&ciborium::Value::Text(":pong".to_string()), &mut pong)
        .map_err(|e| e.to_string())?;
    let msg = Message::new_reply(
        &sender_did,
        target_did,
        MESSAGE_TYPE_RPC_REPLY,
        CONTENT_TYPE_TERM,
        &pong,
        reply_to_id,
        &signing_key,
    )
    .map_err(|e| e.to_string())?;
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
            .map(|inbox| {
                inbox
                    .drain(now)
                    .into_iter()
                    .map(|msg| {
                        log::debug!(
                            "[rpc-inbox] drain id={} reply_to={:?} from={} type={}",
                            msg.id,
                            msg.reply_to,
                            msg.from,
                            msg.message_type
                        );
                        decode_incoming(msg, RPC_PROTOCOL_ID)
                    })
                    .collect()
            })
            .unwrap_or_default()
    })
}

/// Drain pending CRUD-inbox reply messages.
pub fn drain_crud_inbox() -> Vec<IncomingMessage> {
    let now = (js_sys::Date::now() / 1000.0) as u64;
    SESSION_CRUD_INBOX.with(|i| {
        i.borrow_mut()
            .as_mut()
            .map(|inbox| {
                inbox
                    .drain(now)
                    .into_iter()
                    .map(|msg| {
                        log::debug!(
                            "[crud-inbox] drain id={} reply_to={:?} from={} type={}",
                            msg.id,
                            msg.reply_to,
                            msg.from,
                            msg.message_type
                        );
                        decode_incoming(msg, CRUD_PROTOCOL_ID)
                    })
                    .collect()
            })
            .unwrap_or_default()
    })
}

/// CRUD get and expose its `Message.id` before network dispatch.
pub async fn send_crud_get_with_msg_id(
    target_did: &str,
    path: &str,
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session_info()?;
    let atom = if path.starts_with('/') {
        path.to_string()
    } else {
        format!("/{path}")
    };
    let cbor_val = ciborium::Value::Array(vec![ciborium::Value::Text(atom)]);
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
    on_msg_id(msg_id.clone());
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
    send_crud_set_with_msg_id(target_did, path, value, |_| {}).await
}

/// CRUD set and expose its `Message.id` before network dispatch.
pub async fn send_crud_set_with_msg_id(
    target_did: &str,
    path: &str,
    value: ciborium::Value,
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session_info()?;
    let atom = if path.starts_with('/') {
        path.to_string()
    } else {
        format!("/{path}")
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
    on_msg_id(msg_id.clone());
    send_message_on(target_did, CRUD_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// CRUD delete and expose its `Message.id` before network dispatch.
pub async fn send_crud_delete_with_msg_id(
    target_did: &str,
    path: &str,
    on_msg_id: impl FnOnce(String),
) -> Result<String, String> {
    use ma_core::MESSAGE_TYPE_CRUD;
    let (sender_did, signing_key) = get_session_info()?;
    let atom = if path.starts_with('/') {
        path.to_string()
    } else {
        format!("/{path}")
    };
    let cbor_val = ciborium::Value::Array(vec![
        ciborium::Value::Text(atom),
        ciborium::Value::Text(String::new()),
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
    on_msg_id(msg_id.clone());
    send_message_on(target_did, CRUD_PROTOCOL_ID, msg).await?;
    Ok(msg_id)
}

/// Re-establish the iroh endpoint using the current session keys.
/// Clears any cached iroh connections that may have gone stale or black-holed.
pub async fn reconnect() -> Result<(), String> {
    let iroh_key = SESSION_IROH_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let ipns_key = SESSION_IPNS_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let signing_key = SESSION_SIGNING_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let enc_key = SESSION_ENCRYPTION_KEY
        .with(|k| *k.borrow())
        .ok_or_else(|| "not logged in".to_string())?;
    let sender_did = SESSION_SENDER_DID
        .with(|d| d.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let created_at = SESSION_CREATED_AT
        .with(|c| c.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;

    log::warn!("[transport] stale connection — reconnecting iroh endpoint");
    connect(
        iroh_key,
        ipns_key,
        signing_key,
        enc_key,
        sender_did,
        created_at,
    )
    .await
}

fn is_transport_error(e: &str) -> bool {
    e.contains("connect failed")
        || e.contains("timed out")
        || e.contains("transport error")
        || e.contains("open_bi failed")
        || e.contains("ConnectionClosed")
}

async fn with_send_timeout<T>(
    label: &str,
    future: impl std::future::Future<Output = Result<T, String>>,
) -> Result<T, String> {
    let op = future.fuse();
    let timeout = gloo_timers::future::TimeoutFuture::new(SEND_TIMEOUT_MS).fuse();
    futures::pin_mut!(op, timeout);
    futures::select! {
        result = op => result,
        _ = timeout => Err(format!("{label} timed out after {SEND_TIMEOUT_MS}ms")),
    }
}

async fn try_send_once(target_did: &str, protocol: &str, msg: &Message) -> Result<(), String> {
    let ep = ENDPOINT
        .with(|e| e.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;
    let resolver = SESSION_RESOLVER
        .with(|r| r.borrow().clone())
        .ok_or_else(|| "not logged in".to_string())?;

    web_sys::console::info_1(
        &format!(
            "[send] start msg_id={} target={target_did} protocol={protocol}",
            msg.id
        )
        .into(),
    );
    log::debug!("[send] → {target_did} [{protocol}]");
    match resolver.resolve(target_did).await {
        Ok(doc) => {
            let services = doc
                .ma
                .as_ref()
                .and_then(|ma| ma.get("services").ok().flatten())
                .and_then(|services| serde_json::to_value(services).ok());
            let endpoint = resolve_endpoint_for_protocol(services.as_ref(), protocol);
            web_sys::console::info_1(
                &format!(
                    "[send] resolved msg_id={} endpoint={endpoint:?} target={target_did} protocol={protocol}",
                    msg.id
                )
                .into(),
            );
            log::debug!(
                "[send] resolved target={target_did} protocol={protocol} endpoint={endpoint:?} services={services:?}"
            );
        }
        Err(e) => log::warn!("[send] resolve failed for {target_did}: {e}"),
    }
    let mut outbox = with_send_timeout("outbox open", async {
        ep.outbox(resolver.as_ref(), target_did, protocol)
            .await
            .map_err(|e| {
                log::warn!("try_send_once: outbox failed for {target_did}: {e}");
                e.to_string()
            })
    })
    .await?;

    log::debug!("try_send_once: outbox ready, sending msg id={}", msg.id);
    let result = with_send_timeout("outbox send", async {
        outbox.send(msg).await.map_err(|e| {
            log::warn!("try_send_once: send failed for {target_did}: {e}");
            e.to_string()
        })
    })
    .await;
    web_sys::console::info_1(
        &format!(
            "[send] done msg_id={} ok={} target={target_did} protocol={protocol}",
            msg.id,
            result.is_ok()
        )
        .into(),
    );
    log::debug!("[send] done ok={}", result.is_ok());
    result
}

async fn send_message_on(target_did: &str, protocol: &str, msg: Message) -> Result<(), String> {
    match try_send_once(target_did, protocol, &msg).await {
        Ok(()) => return Ok(()),
        Err(e) if is_transport_error(&e) => {
            log::warn!("[transport] send failed ({e}), reconnecting and retrying");
            reconnect()
                .await
                .map_err(|re| format!("reconnect failed: {re}"))?;
        }
        Err(e) => return Err(e),
    }
    try_send_once(target_did, protocol, &msg).await
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
                    .map(|msg| decode_incoming(msg, INBOX_PROTOCOL_ID))
                    .collect()
            })
            .unwrap_or_default()
    })
}

/// Decode an `application/vnd.ma.room.event` CBOR payload into a display string.
/// Format: [:verb, avatar_id, name_or_null, ...args]
fn decode_room_event(payload: Vec<u8>) -> String {
    let val = match ciborium::de::from_reader::<ciborium::Value, _>(payload.as_slice()) {
        Ok(v) => v,
        Err(_) => return "[room event: parse error]".to_string(),
    };
    let items = match val {
        ciborium::Value::Array(a) => a,
        _ => return "[room event: expected array]".to_string(),
    };
    let text_at = |i: usize| -> &str {
        items
            .get(i)
            .and_then(|v| {
                if let ciborium::Value::Text(s) = v {
                    Some(s.as_str())
                } else {
                    None
                }
            })
            .unwrap_or("")
    };
    let verb = text_at(0);
    let aid = text_at(1);
    let raw_name = items.get(2).and_then(|v| {
        if let ciborium::Value::Text(s) = v {
            Some(s.as_str())
        } else {
            None
        }
    });
    let name = raw_name.unwrap_or(aid);
    match verb {
        ":say" => tf("room-say", &[("name", name), ("text", text_at(3))]),
        ":emote" => tf("room-emote", &[("name", name), ("text", text_at(3))]),
        ":enter" => tf("room-enter", &[("name", name)]),
        ":leave" => tf("room-leave", &[("name", name)]),
        ":drop" => tf("room-drop", &[("name", name), ("thing", text_at(4))]),
        ":take" => tf("room-take", &[("name", name), ("thing", text_at(4))]),
        other => format!("* {name} [{other}]"),
    }
}

fn decode_incoming(msg: Message, service: &str) -> IncomingMessage {
    let (display, is_error) = if msg.content_type == "application/vnd.ma.room.event" {
        (decode_room_event(msg.payload()), false)
    } else {
        match service {
            RPC_PROTOCOL_ID => {
                let (term, err) = format_rpc_reply(&msg.payload());
                (format!("\u{2190} {} {}", msg.from, term), err)
            }
            CRUD_PROTOCOL_ID => {
                let (term, err) = format_crud_reply(&msg.content_type, &msg.payload());
                (format!("\u{2190} {} {}", msg.from, term), err)
            }
            _ => match msg.message_type.as_str() {
                MESSAGE_TYPE_CHAT => {
                    let bytes = msg.payload();
                    let body = String::from_utf8_lossy(&bytes);
                    (
                        tf("msg-chat", &[("sender", &msg.from), ("body", &body)]),
                        false,
                    )
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
            },
        }
    };
    let payload = msg.payload();
    IncomingMessage {
        service: service.to_string(),
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

#[cfg(test)]
mod tests {
    use super::*;
    use ciborium::Value as V;

    #[test]
    fn build_document_with_legacy_timestamp_fails_validation() {
        let mut bundle = SecretBundle::generate();
        bundle.created_at = "2026-08-08T12:34:56.789Z".to_string();
        let document = bundle
            .build_document(ma_core::MaExtension::new().kind("agent"))
            .expect("document");
        assert!(document.validate().is_err());
    }

    #[test]
    fn actor_url_constructs_and_preserves_absolute_actor_addresses() {
        let did = format!("did:ma:{}", ma_core::ipns_from_secret([9; 32]).unwrap());
        assert_eq!(actor_url(&did, "rpc").unwrap(), format!("{did}#rpc"));
        let rpc_url = format!("{did}#rpc");
        assert_eq!(actor_url(&rpc_url, "rpc").unwrap(), rpc_url);
    }

    #[test]
    fn actor_url_rejects_a_conflicting_actor_fragment() {
        let did = format!("did:ma:{}", ma_core::ipns_from_secret([9; 32]).unwrap());
        assert!(actor_url(&format!("{did}#room"), "root").is_err());
    }

    #[test]
    fn session_info_uses_bare_identity_did_as_sender() {
        let did = format!("did:ma:{}", ma_core::ipns_from_secret([9; 32]).unwrap());
        SESSION_SENDER_DID.with(|sender| *sender.borrow_mut() = Some(did.clone()));
        SESSION_SIGNING_KEY.with(|key| *key.borrow_mut() = Some([7; 32]));

        let (sender, _) = get_session_info().expect("session info");

        assert_eq!(sender, did);
        SESSION_SENDER_DID.with(|sender| *sender.borrow_mut() = None);
        SESSION_SIGNING_KEY.with(|key| *key.borrow_mut() = None);
    }

    #[test]
    fn scheme_map_encodes_as_cbor_map() {
        let mut map = std::collections::BTreeMap::new();
        map.insert(
            "north".to_string(),
            SchemeVal::Str("did:ma:test#north".to_string()),
        );
        map.insert("score".to_string(), SchemeVal::Int(7));

        let V::Map(pairs) = scheme_val_to_cbor(&SchemeVal::Map(map)) else {
            panic!("expected CBOR map");
        };

        assert_eq!(pairs.len(), 2);
        assert!(pairs.iter().any(|(key, value)| {
            matches!(key, V::Text(key) if key == "north")
                && matches!(value, V::Text(value) if value == "did:ma:test#north")
        }));
        assert!(pairs.iter().any(|(key, value)| {
            matches!(key, V::Text(key) if key == "score")
                && matches!(value, V::Integer(value) if i128::from(*value) == 7)
        }));
    }

    #[test]
    fn scheme_bytes_encode_as_cbor_bytes() {
        assert_eq!(
            scheme_val_to_cbor(&SchemeVal::Bytes(vec![0x89, b'P', b'N', b'G'])),
            V::Bytes(vec![0x89, b'P', b'N', b'G'])
        );
    }
}
