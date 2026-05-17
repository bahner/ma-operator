//! Message display and construction helpers.
//!
//! Pure functions over byte payloads / DID strings — no UI dependencies.

use ciborium::Value as CborValue;

/// Format an unsolicited (non-reply) incoming message for display.
pub fn format_incoming(sender: &str, content_type: &str, body: &str) -> String {
    format!("← [{sender}] ({content_type})\n  {body}")
}

/// Decoded incoming message returned by the transport layer.
#[derive(Clone, Debug, PartialEq)]
pub struct IncomingMessage {
    /// `Message.id` of the incoming message.
    pub message_id: String,
    /// `Message.type` of the incoming message.
    pub message_type: String,
    /// Sender DID/DID URL.
    pub from: String,
    /// Recipient DID/DID URL.
    pub to: String,
    /// `Message.reply_to`, when present. Used to match against a previously
    /// dispatched command.
    pub reply_to: Option<String>,
    /// Semantic content type of payload.
    pub content_type: String,
    /// Raw payload bytes (multicodec-prefixed; peel varint to get codec + data).
    pub content: Vec<u8>,
    /// Creation timestamp (seconds).
    pub created_at: f64,
    /// Expiry as nanosecond epoch (0 = never).
    pub exp: u64,
    /// Pre-formatted display text suitable for direct rendering.
    pub display: String,
    /// `true` if the reply represents an error (`:error` atom or
    /// `[:error, ...]` tuple). Drives status colour.
    pub is_error: bool,
}

/// Format an RPC reply payload (CBOR) for compact display.
///
/// Returns `(display, is_error)`.
pub fn format_rpc_reply(body: &[u8]) -> (String, bool) {
    match ciborium::de::from_reader::<CborValue, _>(body) {
        Ok(CborValue::Text(atom)) => {
            let is_err = atom == ":error";
            (atom, is_err)
        }
        Ok(CborValue::Array(items)) => {
            let head = items
                .first()
                .and_then(|v| match v {
                    CborValue::Text(s) => Some(s.clone()),
                    _ => None,
                })
                .unwrap_or_else(|| "<?>".to_string());
            let rest: Vec<String> = items.iter().skip(1).map(format_cbor_value_short).collect();
            let is_err = head == ":error";
            let display = if rest.is_empty() {
                head
            } else {
                format!("{head} {}", rest.join(" "))
            };
            (display, is_err)
        }
        Ok(other) => (format_cbor_value_short(&other), false),
        Err(_) => (format!("<undecodable {} bytes>", body.len()), false),
    }
}

fn format_cbor_value_short(v: &CborValue) -> String {
    match v {
        CborValue::Text(s) => s.clone(),
        CborValue::Bool(b) => b.to_string(),
        CborValue::Integer(i) => format!("{i:?}"),
        CborValue::Bytes(b) => format!("<{} bytes>", b.len()),
        CborValue::Null => "null".to_string(),
        other => format!("{other:?}"),
    }
}
