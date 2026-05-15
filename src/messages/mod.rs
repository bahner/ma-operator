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
    /// `Message.reply_to`, when present. Used to match against a previously
    /// dispatched command.
    pub reply_to: Option<String>,
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
            let rest: Vec<String> = items
                .iter()
                .skip(1)
                .map(format_cbor_value_short)
                .collect();
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
