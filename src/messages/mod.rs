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
            if is_err {
                ("error".to_string(), true)
            } else {
                (atom, false)
            }
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
            
            // If head is :ok, strip it and display the payload
            if head == ":ok" {
                let display = if rest.is_empty() {
                    "ok".to_string()
                } else if rest.len() == 1 {
                    rest[0].clone()
                } else {
                    rest.join(" ")
                };
                (display, false)
            } else {
                let is_err = head == ":error";
                let display = if is_err {
                    if rest.is_empty() {
                        "error".to_string()
                    } else {
                        format!("error: {}", rest.join(" "))
                    }
                } else if rest.is_empty() {
                    head
                } else {
                    format!("{head} {}", rest.join(" "))
                };
                (display, is_err)
            }
        }
        Ok(other) => (format_cbor_value_short(&other), false),
        Err(_) => (format!("<undecodable {} bytes>", body.len()), false),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn formats_error_tuple_compactly() {
        let mut body = Vec::new();
        ciborium::ser::into_writer(
            &CborValue::Array(vec![
                CborValue::Text(":error".to_string()),
                CborValue::Text("unknown entity fragment: fortune".to_string()),
            ]),
            &mut body,
        )
        .expect("encode cbor");

        let (display, is_error) = format_rpc_reply(&body);
        assert!(is_error);
        assert_eq!(display, "error: unknown entity fragment: fortune");
    }

    #[test]
    fn formats_error_atom_compactly() {
        let mut body = Vec::new();
        ciborium::ser::into_writer(&CborValue::Text(":error".to_string()), &mut body)
            .expect("encode cbor");

        let (display, is_error) = format_rpc_reply(&body);
        assert!(is_error);
        assert_eq!(display, "error");
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
