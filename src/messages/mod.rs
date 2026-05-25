//! Message display and construction helpers.
//!
//! Pure functions over byte payloads / DID strings — no UI dependencies.

use ciborium::Value as CborValue;
use crate::i18n::{t, tf};

/// Convert a YAML string into a DAG-CBOR byte vector.
///
/// Flow: YAML → `serde_json::Value` (via serde_yaml) → DAG-CBOR bytes
/// (via serde_ipld_dagcbor).  The resulting bytes can be sent directly
/// to the runtime's `:entities.<name>:edit` RPC verb, which will
/// `dag_put` them and register the entity.
///
/// Returns an error if the YAML does not parse to an object/map — bare
/// scalars (plain prose, numbers, booleans) are rejected because they
/// produce structureless IPLD nodes with no traversable fields.
pub fn yaml_to_dag_cbor(yaml: &str) -> Result<Vec<u8>, String> {
    let val: serde_json::Value =
        serde_yaml::from_str(yaml).map_err(|e| tf("yaml-parse-error", &[("e", &e.to_string())]))?;
    if !val.is_object() {
        return Err(t("yaml-not-mapping"));
    }
    serde_ipld_dagcbor::to_vec(&val).map_err(|e| tf("dagcbor-encode-error", &[("e", &e.to_string())]))
}

/// Decode a CBOR byte slice and convert it to a YAML string.
///
/// Flow: raw CBOR bytes → `ciborium::Value` → `serde_json::Value` (via
/// ciborium's `Serialize` impl) → YAML string.
///
/// Used to display CRUD GET replies (entity data, config values) in the
/// editor before the user edits and re-publishes them.
pub fn cbor_bytes_to_yaml(bytes: &[u8]) -> Result<String, String> {
    let cbor_val: CborValue =
        ciborium::de::from_reader(bytes).map_err(|e| tf("cbor-decode-error", &[("e", &e.to_string())]))?;
    let json_val: serde_json::Value =
        serde_json::to_value(&cbor_val).map_err(|e| tf("cbor-json-error", &[("e", &e.to_string())]))?;
    serde_yaml::to_string(&json_val).map_err(|e| tf("yaml-serialize-error", &[("e", &e.to_string())]))
}

/// Extract the text payload from a `[":ok", text_string]` CBOR reply.
/// Used to retrieve CIDs from IPFS store replies (`[":ok", "/ipfs/bafy..."]`).
pub fn extract_ok_text(bytes: &[u8]) -> Result<String, String> {
    extract_ok_yaml(bytes)
}

/// Extract the YAML string payload from a `[":ok", yaml_text]` CBOR reply.
///
/// All CRUD edit replies arrive as `application/x-ma-term` with a
/// `[":ok", yaml_string]` CBOR array body. The YAML is already a plain
/// string — no further conversion is needed.
pub fn extract_ok_yaml(bytes: &[u8]) -> Result<String, String> {
    let val: CborValue =
        ciborium::de::from_reader(bytes).map_err(|e| tf("cbor-decode-error", &[("e", &e.to_string())]))?;
    match val {
        CborValue::Array(mut items) if items.len() == 2 => {
            let second = items.pop();
            let first = items.pop();
            match (first, second) {
                (Some(CborValue::Text(tag)), Some(CborValue::Text(yaml))) if tag == ":ok" => {
                    Ok(yaml)
                }
                _ => Err(t("edit-reply-invalid")),
            }
        }
        _ => Err(t("edit-reply-invalid")),
    }
}

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
                (t("rpc-error"), true)
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
                        t("rpc-error")
                    } else {
                        tf("rpc-error-detail", &[("detail", &rest.join(" "))])
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
