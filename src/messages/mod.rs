//! Message display and construction helpers.
//!
//! Pure functions over byte payloads / DID strings — no UI dependencies.

use crate::i18n::{t, tf};
use ciborium::Value as CborValue;
use ma_core::{
    CODEC_CBOR, CODEC_DAG_CBOR, CODEC_DAG_JSON, CODEC_JSON, CODEC_RAW, CONTENT_TYPE_TERM_YAML,
};

/// Convert a YAML string into a DAG-CBOR byte vector.
///
/// Flow: YAML → `serde_json::Value` (via `serde_yaml`) → DAG-CBOR bytes
/// (via `serde_ipld_dagcbor`).  The resulting bytes can be sent directly
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
    serde_ipld_dagcbor::to_vec(&val)
        .map_err(|e| tf("dagcbor-encode-error", &[("e", &e.to_string())]))
}

/// Convert any valid YAML document into DAG-CBOR bytes.
///
/// Use this for generic CRUD values whose schema is owned by the remote
/// runtime path (for example `/grp/<name>` lists), not for entity/kind
/// definitions that must remain mappings.
pub fn yaml_any_to_dag_cbor(yaml: &str) -> Result<Vec<u8>, String> {
    let val: serde_json::Value =
        serde_yaml::from_str(yaml).map_err(|e| tf("yaml-parse-error", &[("e", &e.to_string())]))?;
    serde_ipld_dagcbor::to_vec(&val)
        .map_err(|e| tf("dagcbor-encode-error", &[("e", &e.to_string())]))
}

/// Convert a YAML string into a `ciborium::Value`.
///
/// Flow: YAML → `serde_json::Value` (via `serde_yaml`) → `ciborium::Value`.
/// Handles scalars, sequences, and mappings — unlike [`yaml_to_dag_cbor`]
/// this accepts any valid YAML, not only objects/maps.
///
/// Used when saving inline CRUD values (e.g. config sequences like
/// `owners`) that should be sent directly via `send_crud_set` rather
/// than going through the IPFS publish flow.
pub fn yaml_to_cbor_value(yaml: &str) -> Result<ciborium::Value, String> {
    let json_val: serde_json::Value =
        serde_yaml::from_str(yaml).map_err(|e| tf("yaml-parse-error", &[("e", &e.to_string())]))?;
    serde_json::from_value(json_val).map_err(|e| tf("cbor-json-error", &[("e", &e.to_string())]))
}

/// Decode a CBOR byte slice and convert it to a YAML string.
///
/// Flow: raw CBOR bytes → `ciborium::Value` → `serde_json::Value` (via
/// ciborium's `Serialize` impl) → YAML string.
///
/// Used to display CRUD GET replies (entity data, config values) in the
/// editor before the user edits and re-publishes them.
pub fn cbor_bytes_to_yaml(bytes: &[u8]) -> Result<String, String> {
    let cbor_val: CborValue = ciborium::de::from_reader(bytes)
        .map_err(|e| tf("cbor-decode-error", &[("e", &e.to_string())]))?;
    let json_val: serde_json::Value = serde_json::to_value(&cbor_val)
        .map_err(|e| tf("cbor-json-error", &[("e", &e.to_string())]))?;
    serde_yaml::to_string(&json_val)
        .map_err(|e| tf("yaml-serialise-error", &[("e", &e.to_string())]))
}

/// Decode a successful CRUD data reply according to its declared content type.
pub fn decode_crud_content(content_type: &str, bytes: &[u8]) -> Result<String, String> {
    if content_type == CONTENT_TYPE_TERM_YAML {
        String::from_utf8(bytes.to_vec()).map_err(|e| e.to_string())
    } else {
        cbor_bytes_to_yaml(bytes)
    }
}

/// Format a message received on the CRUD service.
pub fn format_crud_reply(content_type: &str, body: &[u8]) -> (String, bool) {
    let (error_display, is_error) = format_rpc_reply(body);
    if is_error {
        return (error_display, true);
    }
    match decode_crud_content(content_type, body) {
        Ok(text) => (text.trim_end().to_string(), false),
        Err(_) => (error_display, false),
    }
}

/// Decode bytes fetched for a root CID into editor text using the CID's codec.
///
/// Public gateways should be treated as byte transport. The CID tells zion how
/// to interpret those bytes: DAG-CBOR/CBOR become YAML, JSON codecs become YAML,
/// and raw blocks are displayed as UTF-8 text.
pub fn cid_bytes_to_editor_text(cid: &str, bytes: &[u8]) -> Result<String, String> {
    let cid = cid::Cid::try_from(cid).map_err(|e| format!("invalid CID {cid}: {e}"))?;
    match cid.codec() {
        CODEC_DAG_CBOR | CODEC_CBOR => cbor_bytes_to_yaml(bytes),
        CODEC_DAG_JSON | CODEC_JSON => json_bytes_to_yaml(bytes),
        CODEC_RAW => String::from_utf8(bytes.to_vec())
            .map_err(|e| format!("raw block is not UTF-8 text: {e}")),
        other => cbor_bytes_to_yaml(bytes).or_else(|_| {
            String::from_utf8(bytes.to_vec()).map_err(|e| {
                format!("unsupported CID codec 0x{other:x}; raw bytes are not UTF-8: {e}")
            })
        }),
    }
}

fn json_bytes_to_yaml(bytes: &[u8]) -> Result<String, String> {
    let json_val: serde_json::Value = serde_json::from_slice(bytes)
        .map_err(|e| tf("json-parse-error", &[("e", &e.to_string())]))?;
    serde_yaml::to_string(&json_val)
        .map_err(|e| tf("yaml-serialise-error", &[("e", &e.to_string())]))
}

/// Extract the text payload from a `[":ok", text_string]` CBOR reply.
/// Used to retrieve CIDs from IPFS store replies (`[":ok", "/ipfs/bafy..."]`).
pub fn extract_ok_text(bytes: &[u8]) -> Result<String, String> {
    extract_ok_yaml(bytes)
}

/// Extract the YAML string payload from a `[":ok", yaml_text]` CBOR reply.
///
/// All CRUD edit replies arrive as `application/vnd.ma.term` with a
/// `[":ok", yaml_string]` CBOR array body. The YAML is already a plain
/// string — no further conversion is needed.
pub fn extract_ok_yaml(bytes: &[u8]) -> Result<String, String> {
    let val: CborValue = ciborium::de::from_reader(bytes)
        .map_err(|e| tf("cbor-decode-error", &[("e", &e.to_string())]))?;
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
    /// Protocol service on which the message arrived.
    pub service: String,
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
    /// Creation timestamp (epoch seconds).
    pub created_at: u64,
    /// Expiry as epoch seconds (0 = never).
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

fn format_cbor_value_short(v: &CborValue) -> String {
    match v {
        CborValue::Text(s) => s.clone(),
        CborValue::Bool(b) => b.to_string(),
        CborValue::Integer(i) => format!("{i:?}"),
        CborValue::Bytes(b) => format!("<{} bytes>", b.len()),
        CborValue::Null => "null".to_string(),
        CborValue::Array(items) => items
            .iter()
            .map(format_cbor_value_short)
            .collect::<Vec<_>>()
            .join(" "),
        other => format!("{other:?}"),
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
        // t() returns the key name in test context (no translations loaded).
        assert_eq!(display, "rpc-error-detail");
    }

    #[test]
    fn formats_error_atom_compactly() {
        let mut body = Vec::new();
        ciborium::ser::into_writer(&CborValue::Text(":error".to_string()), &mut body)
            .expect("encode cbor");

        let (display, is_error) = format_rpc_reply(&body);
        assert!(is_error);
        // t() returns the key name in test context (no translations loaded).
        assert_eq!(display, "rpc-error");
    }

    #[test]
    fn formats_ok_array_payload_compactly() {
        let mut body = Vec::new();
        ciborium::ser::into_writer(
            &CborValue::Array(vec![
                CborValue::Text(":ok".to_string()),
                CborValue::Array(vec![CborValue::Text("owners".to_string())]),
            ]),
            &mut body,
        )
        .expect("encode cbor");

        let (display, is_error) = format_rpc_reply(&body);
        assert!(!is_error);
        assert_eq!(display, "owners");
    }

    #[test]
    fn formats_raw_crud_list_without_rpc_head() {
        let mut body = Vec::new();
        ciborium::ser::into_writer(
            &CborValue::Array(vec![
                CborValue::Text("duckie".to_string()),
                CborValue::Text("house".to_string()),
            ]),
            &mut body,
        )
        .expect("encode cbor");

        let (display, is_error) = format_crud_reply(ma_core::CONTENT_TYPE_TERM_CBOR, &body);

        assert!(!is_error);
        assert!(display.contains("duckie"));
        assert!(display.contains("house"));
        assert!(!display.contains("<?>"));
    }

    fn test_cid(codec: u64) -> String {
        cid::Cid::new_v1(
            codec,
            cid::multihash::Multihash::wrap(0x12, &[42; 32]).unwrap(),
        )
        .to_string()
    }

    #[test]
    fn cid_bytes_to_editor_text_decodes_dag_cbor_as_yaml() {
        let mut bytes = Vec::new();
        ciborium::ser::into_writer(
            &CborValue::Map(vec![
                (
                    CborValue::Text("name".to_string()),
                    CborValue::Text("scheduler".to_string()),
                ),
                (
                    CborValue::Text("enabled".to_string()),
                    CborValue::Bool(true),
                ),
            ]),
            &mut bytes,
        )
        .expect("encode cbor");

        let text =
            cid_bytes_to_editor_text(&test_cid(CODEC_DAG_CBOR), &bytes).expect("decode dag-cbor");

        assert!(text.contains("name: scheduler"));
        assert!(text.contains("enabled: true"));
    }

    #[test]
    fn cid_bytes_to_editor_text_decodes_json_as_yaml() {
        let text = cid_bytes_to_editor_text(
            &test_cid(CODEC_JSON),
            br#"{"name":"scheduler","enabled":true}"#,
        )
        .expect("decode json");

        assert!(text.contains("name: scheduler"));
        assert!(text.contains("enabled: true"));
    }

    #[test]
    fn cid_bytes_to_editor_text_decodes_raw_as_utf8() {
        let text =
            cid_bytes_to_editor_text(&test_cid(CODEC_RAW), b"plain behaviour").expect("decode raw");

        assert_eq!(text, "plain behaviour");
    }
}
