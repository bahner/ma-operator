/// Helpers for creating and unlocking identities using ma-core types.
use ma_core::{BrowserIdentityExport, Config, SecretBundle};
use serde::{Deserialize, Serialize};
use time::{format_description::well_known::Rfc3339, OffsetDateTime, UtcOffset};

// ── ZionExport ─────────────────────────────────────────────────────────────

/// Versioned wrapper that bundles a `BrowserIdentityExport` JSON together with
/// an optional `EgoConfig` JSON snapshot for portable full-profile export.
///
/// - `version: 1` — the only currently supported format.
/// - `username` — the profile name (slug). Carried explicitly because
///   `Config::to_yaml_string` intentionally omits the slug field.
/// - `identity` — the raw `BrowserIdentityExport` JSON string (encrypted keys + username).
/// - `ego_config` — optional `EgoConfig` JSON (aliases, docs, settings, etc.).
///   Absent in old exports; ignored on import when missing.
#[derive(Serialize, Deserialize)]
pub struct ZionExport {
    pub version: u8,
    pub username: String,
    pub identity: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ego_config: Option<String>,
}

/// Key material extracted from a decrypted [`SecretBundle`].
///
/// Contains everything the session needs: iroh transport key, IPNS key,
/// DID signing key, DID encryption key, and the resolved DID string.
#[derive(Clone)]
pub struct UnlockedIdentity {
    pub iroh_key: [u8; 32],
    pub ipns_secret_key: [u8; 32],
    pub did_signing_key: [u8; 32],
    pub did_encryption_key: [u8; 32],
    /// Full bare DID, e.g. `"did:ma:k51qzi5…"`
    pub sender_did: String,
    /// ISO-8601 timestamp from when the bundle was first generated.
    pub created_at: String,
}

/// Create a brand-new identity: generate keys, encrypt with passphrase,
/// store the export JSON, and return the key material.  Only used in tests;
/// production code uses `create_identity_did_named`.
#[cfg(test)]
pub fn create_identity(
    username: &str,
    passphrase: &str,
) -> Result<(String, UnlockedIdentity), String> {
    let bundle = SecretBundle::generate();
    let unlocked = bundle_to_unlocked(&bundle)?;
    let encrypted = bundle.encrypt(passphrase).map_err(|e| e.to_string())?;
    let config = Config::new_for_storage(username);
    let config_yaml = config.to_yaml_string().map_err(|e| e.to_string())?;
    // BrowserIdentityExport::new takes &[u8], not a base64 string.
    let export = BrowserIdentityExport::new(config_yaml, &encrypted);
    let json = export.to_json_string().map_err(|e| e.to_string())?;
    Ok((json, unlocked))
}

/// Create a new identity whose username is derived from its own DID (the
/// IPNS portion after `did:ma:`).  Returns `(did, export_json, unlocked)`.
pub fn create_identity_did_named(
    passphrase: &str,
) -> Result<(String, String, UnlockedIdentity), String> {
    let bundle = SecretBundle::generate();
    let unlocked = bundle_to_unlocked(&bundle)?;
    let did = unlocked.sender_did.clone();
    let username = did.strip_prefix("did:ma:").unwrap_or(&did).to_string();
    let encrypted = bundle.encrypt(passphrase).map_err(|e| e.to_string())?;
    let config = Config::new_for_storage(&username);
    let config_yaml = config.to_yaml_string().map_err(|e| e.to_string())?;
    let export = BrowserIdentityExport::new(config_yaml, &encrypted);
    let json = export.to_json_string().map_err(|e| e.to_string())?;
    Ok((did, json, unlocked))
}

/// Unlock an existing identity: decrypt the bundle and return key material.
#[cfg(test)]
pub fn unlock_identity(export_json: &str, passphrase: &str) -> Result<UnlockedIdentity, String> {
    unlock_identity_migrating(export_json, passphrase).map(|(identity, _)| identity)
}

/// Unlock an identity and rewrite legacy creation timestamps when necessary.
///
/// The optional JSON contains the same identity export re-encrypted with a
/// canonical whole-second UTC timestamp and should replace the stored export.
pub fn unlock_identity_migrating(
    export_json: &str,
    passphrase: &str,
) -> Result<(UnlockedIdentity, Option<String>), String> {
    let export = BrowserIdentityExport::from_json_str(export_json).map_err(|e| e.to_string())?;
    let encrypted = export
        .encrypted_secret_bundle_bytes()
        .map_err(|e| e.to_string())?;
    let mut bundle = SecretBundle::decrypt(&encrypted, passphrase).map_err(|e| e.to_string())?;
    let canonical_created_at = canonicalise_created_at(&bundle.created_at)?;
    let migrated_export = if canonical_created_at == bundle.created_at {
        None
    } else {
        bundle.created_at = canonical_created_at;
        let encrypted = bundle.encrypt(passphrase).map_err(|e| e.to_string())?;
        let migrated = BrowserIdentityExport::new(export.config_yaml.clone(), &encrypted);
        Some(migrated.to_json_string().map_err(|e| e.to_string())?)
    };
    let identity = bundle_to_unlocked(&bundle)?;
    Ok((identity, migrated_export))
}

fn canonicalise_created_at(value: &str) -> Result<String, String> {
    OffsetDateTime::parse(value, &Rfc3339)
        .map_err(|e| format!("invalid identity created_at: {e}"))?
        .to_offset(UtcOffset::UTC)
        .replace_nanosecond(0)
        .map_err(|e| format!("invalid identity created_at: {e}"))?
        .format(&Rfc3339)
        .map_err(|e| format!("invalid identity created_at: {e}"))
}

/// Convert a decrypted bundle into the session key material.
fn bundle_to_unlocked(bundle: &SecretBundle) -> Result<UnlockedIdentity, String> {
    let identity = bundle.generate_identity().map_err(|e| e.to_string())?;
    let sender_did = identity.subject_url.base_id();
    Ok(UnlockedIdentity {
        iroh_key: bundle.iroh_secret_key,
        ipns_secret_key: bundle.ipns_secret_key,
        did_signing_key: bundle.did_signing_key,
        did_encryption_key: bundle.did_encryption_key,
        created_at: bundle.created_at.clone(),
        sender_did,
    })
}

/// Bundle an identity export and optional EgoConfig snapshot into a `ZionExport`
/// JSON string ready for file download.
///
/// `username` is stored explicitly since `Config::to_yaml_string` omits the slug.
/// `ego_config_json` should come from `EgoConfig::for_export().to_json()`.
/// Pass `None` to produce a keys-only export (backward-compatible with old importers).
pub fn export_for_download(
    identity_json: &str,
    username: &str,
    ego_config_json: Option<&str>,
) -> String {
    let export = ZionExport {
        version: 1,
        username: username.to_string(),
        identity: identity_json.to_string(),
        ego_config: ego_config_json.map(|s| s.to_string()),
    };
    serde_json::to_string(&export).unwrap_or_else(|_| identity_json.to_string())
}

/// Replace the iroh transport key in an existing encrypted bundle with a freshly
/// generated one, re-encrypt with the same passphrase, and return the new export
/// JSON together with the unlocked session key material ready for login.
#[cfg(test)]
pub fn rekey_iroh(
    export_json: &str,
    passphrase: &str,
) -> Result<(String, UnlockedIdentity), String> {
    let export = BrowserIdentityExport::from_json_str(export_json).map_err(|e| e.to_string())?;
    let encrypted = export
        .encrypted_secret_bundle_bytes()
        .map_err(|e| e.to_string())?;
    let mut bundle = SecretBundle::decrypt(&encrypted, passphrase).map_err(|e| e.to_string())?;
    bundle.iroh_secret_key = SecretBundle::generate().iroh_secret_key;
    let new_encrypted = bundle.encrypt(passphrase).map_err(|e| e.to_string())?;
    let new_export = BrowserIdentityExport::new(export.config_yaml.clone(), &new_encrypted);
    let new_json = new_export.to_json_string().map_err(|e| e.to_string())?;
    let unlocked = bundle_to_unlocked(&bundle)?;
    Ok((new_json, unlocked))
}

/// Parse an imported file's bytes as either a `ZionExport` (new format) or a
/// bare `BrowserIdentityExport` JSON (old format, backward-compatible).
///
/// Returns `(username, identity_json, Option<ego_config_json>)`.
pub fn import_from_bytes(bytes: &[u8]) -> Result<(String, String, Option<String>), String> {
    let json = std::str::from_utf8(bytes).map_err(|e| e.to_string())?;

    // Try new ZionExport format first.
    if let Ok(zion) = serde_json::from_str::<ZionExport>(json) {
        // Validate the embedded BrowserIdentityExport is well-formed.
        let _ = BrowserIdentityExport::from_json_str(&zion.identity).map_err(|e| e.to_string())?;
        return Ok((zion.username, zion.identity, zion.ego_config));
    }

    // Fallback: bare BrowserIdentityExport (old format).
    // Since ma-core 0.13.1 the config YAML carries the slug, so it is preserved.
    let export = BrowserIdentityExport::from_json_str(json).map_err(|e| e.to_string())?;
    let config = Config::from_yaml_str(&export.config_yaml).map_err(|e| e.to_string())?;
    Ok((config.slug.clone(), json.to_string(), None))
}

#[cfg(test)]
mod tests {
    use super::*;

    const PASS: &str = "test-passphrase";

    fn make_export() -> (String, UnlockedIdentity) {
        create_identity("testuser", PASS).expect("create_identity failed")
    }

    #[test]
    fn rekey_iroh_changes_iroh_key() {
        let (export_json, original) = make_export();
        let (_new_json, rekeyed) = rekey_iroh(&export_json, PASS).expect("rekey_iroh failed");
        assert_ne!(
            original.iroh_key, rekeyed.iroh_key,
            "iroh_key should change after rekey"
        );
    }

    #[test]
    fn rekey_iroh_preserves_identity_keys() {
        let (export_json, original) = make_export();
        let (_new_json, rekeyed) = rekey_iroh(&export_json, PASS).expect("rekey_iroh failed");
        assert_eq!(
            original.ipns_secret_key, rekeyed.ipns_secret_key,
            "ipns_secret_key must not change"
        );
        assert_eq!(
            original.did_signing_key, rekeyed.did_signing_key,
            "did_signing_key must not change"
        );
        assert_eq!(
            original.did_encryption_key, rekeyed.did_encryption_key,
            "did_encryption_key must not change"
        );
        assert_eq!(
            original.sender_did, rekeyed.sender_did,
            "sender_did (DID identity) must not change"
        );
        assert_eq!(
            original.created_at, rekeyed.created_at,
            "created_at must not change"
        );
    }

    #[test]
    fn rekey_iroh_new_export_is_valid() {
        let (export_json, _) = make_export();
        let (new_json, _) = rekey_iroh(&export_json, PASS).expect("rekey_iroh failed");
        // New export must be unlockable with the same passphrase.
        let unlocked = unlock_identity(&new_json, PASS).expect("unlock after rekey failed");
        assert!(!unlocked.sender_did.is_empty());
    }

    #[test]
    fn rekey_iroh_wrong_passphrase_fails() {
        let (export_json, _) = make_export();
        let result = rekey_iroh(&export_json, "wrong-passphrase");
        assert!(result.is_err(), "rekey with wrong passphrase should fail");
    }

    #[test]
    fn rekey_iroh_original_export_still_valid() {
        let (export_json, _) = make_export();
        let _ = rekey_iroh(&export_json, PASS).expect("rekey_iroh failed");
        // Original export must still be unlockable — rekey must not mutate the input.
        let unlocked =
            unlock_identity(&export_json, PASS).expect("original export should still be valid");
        assert!(!unlocked.sender_did.is_empty());
    }

    // ── create_identity ───────────────────────────────────────────────────

    #[test]
    fn create_identity_returns_valid_did() {
        let (_, id) = create_identity("alice", PASS).expect("create_identity failed");
        assert!(
            id.sender_did.starts_with("did:ma:"),
            "DID should start with did:ma:"
        );
    }

    #[test]
    fn create_identity_keys_are_nonzero() {
        let (_, id) = create_identity("alice", PASS).expect("create_identity failed");
        assert_ne!(id.iroh_key, [0u8; 32], "iroh_key must not be all-zero");
        assert_ne!(
            id.ipns_secret_key, [0u8; 32],
            "ipns_secret_key must not be all-zero"
        );
        assert_ne!(
            id.did_signing_key, [0u8; 32],
            "did_signing_key must not be all-zero"
        );
        assert_ne!(
            id.did_encryption_key, [0u8; 32],
            "did_encryption_key must not be all-zero"
        );
    }

    #[test]
    fn create_identity_export_json_is_valid() {
        let (json, _) = create_identity("alice", PASS).expect("create_identity failed");
        // Must be valid JSON and re-unlockable.
        let id = unlock_identity(&json, PASS).expect("unlock after create failed");
        assert!(id.sender_did.starts_with("did:ma:"));
    }

    #[test]
    fn create_two_identities_have_distinct_dids() {
        let (_, id1) = create_identity("alice", PASS).expect("first create failed");
        let (_, id2) = create_identity("bob", PASS).expect("second create failed");
        assert_ne!(
            id1.sender_did, id2.sender_did,
            "two fresh identities must have distinct DIDs"
        );
    }

    // ── unlock_identity ───────────────────────────────────────────────────

    #[test]
    fn unlock_identity_wrong_passphrase_fails() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let result = unlock_identity(&json, "wrong");
        assert!(result.is_err(), "unlock with wrong passphrase must fail");
    }

    #[test]
    fn unlock_identity_bad_json_fails() {
        let result = unlock_identity("not valid json", PASS);
        assert!(result.is_err());
    }

    #[test]
    fn unlock_identity_roundtrips_keys() {
        let (json, original) = create_identity("alice", PASS).expect("create failed");
        let unlocked = unlock_identity(&json, PASS).expect("unlock failed");
        assert_eq!(original.iroh_key, unlocked.iroh_key);
        assert_eq!(original.ipns_secret_key, unlocked.ipns_secret_key);
        assert_eq!(original.did_signing_key, unlocked.did_signing_key);
        assert_eq!(original.did_encryption_key, unlocked.did_encryption_key);
        assert_eq!(original.sender_did, unlocked.sender_did);
        assert_eq!(original.created_at, unlocked.created_at);
    }

    #[test]
    fn unlock_identity_migrates_fractional_created_at() {
        let bundle = SecretBundle::generate();
        let original_did = bundle_to_unlocked(&bundle)
            .expect("original identity")
            .sender_did;
        let mut legacy = bundle.clone();
        legacy.created_at = "2026-07-19T19:45:24.489Z".to_string();
        let encrypted = legacy.encrypt(PASS).expect("encrypt legacy bundle");
        let export = BrowserIdentityExport::new("slug: alice\n".to_string(), &encrypted)
            .to_json_string()
            .expect("legacy export");

        let (unlocked, migrated) =
            unlock_identity_migrating(&export, PASS).expect("migrate identity");

        assert_eq!(unlocked.sender_did, original_did);
        assert_eq!(unlocked.created_at, "2026-07-19T19:45:24Z");
        let migrated = migrated.expect("rewritten export");
        let (unlocked_again, second_migration) =
            unlock_identity_migrating(&migrated, PASS).expect("unlock migrated identity");
        assert_eq!(unlocked_again.created_at, "2026-07-19T19:45:24Z");
        assert!(second_migration.is_none());
    }

    #[test]
    fn unlock_identity_rejects_invalid_created_at() {
        let mut bundle = SecretBundle::generate();
        bundle.created_at = "not-a-timestamp".to_string();
        let encrypted = bundle.encrypt(PASS).expect("encrypt bundle");
        let export = BrowserIdentityExport::new("slug: alice\n".to_string(), &encrypted)
            .to_json_string()
            .expect("identity export");

        let error = match unlock_identity_migrating(&export, PASS) {
            Ok(_) => panic!("invalid timestamp was accepted"),
            Err(error) => error,
        };
        assert!(error.contains("invalid identity created_at"));
    }

    // ── import_from_bytes ─────────────────────────────────────────────────

    #[test]
    fn import_from_bytes_roundtrip() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let (_, identity_json, ego_config) =
            import_from_bytes(json.as_bytes()).expect("import failed");
        assert!(ego_config.is_none(), "bare identity has no ego_config");
        let _ = unlock_identity(&identity_json, PASS).expect("unlock after import failed");
    }

    #[test]
    fn import_from_bytes_invalid_utf8_fails() {
        let result = import_from_bytes(&[0xFF, 0xFE]);
        assert!(result.is_err());
    }

    #[test]
    fn import_from_bytes_invalid_json_fails() {
        let result = import_from_bytes(b"not json");
        assert!(result.is_err());
    }

    #[test]
    fn import_from_bytes_new_format_roundtrip() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let bundled = export_for_download(&json, "alice", Some(r#"{"tree":{"key":"val"}}"#));
        let (username, identity_json, ego_config) =
            import_from_bytes(bundled.as_bytes()).expect("import new format failed");
        assert_eq!(username, "alice");
        let _ = unlock_identity(&identity_json, PASS).expect("unlock failed");
        assert_eq!(ego_config.as_deref(), Some(r#"{"tree":{"key":"val"}}"#));
    }

    #[test]
    fn import_from_bytes_old_format_still_works() {
        // A bare BrowserIdentityExport (no ZionExport wrapper) must still import cleanly.
        // Since ma-core 0.13.1 the config YAML carries the slug, so the username survives.
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let (username, identity_json, ego_config) =
            import_from_bytes(json.as_bytes()).expect("import old format failed");
        assert_eq!(username, "alice", "slug from config YAML is preserved");
        let _ = unlock_identity(&identity_json, PASS).expect("unlock failed");
        assert!(ego_config.is_none());
    }

    // ── export_for_download ───────────────────────────────────────────────

    #[test]
    fn export_for_download_without_config() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let exported = export_for_download(&json, "alice", None);
        let zion: ZionExport = serde_json::from_str(&exported).expect("must parse as ZionExport");
        assert_eq!(zion.version, 1);
        assert_eq!(zion.username, "alice");
        assert_eq!(zion.identity, json);
        assert!(zion.ego_config.is_none());
    }

    #[test]
    fn export_for_download_with_config() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let cfg_json = r#"{"tree":{".my.i18n":"nb"}}"#;
        let exported = export_for_download(&json, "alice", Some(cfg_json));
        let zion: ZionExport = serde_json::from_str(&exported).expect("must parse as ZionExport");
        assert_eq!(zion.version, 1);
        assert_eq!(zion.username, "alice");
        assert_eq!(zion.ego_config.as_deref(), Some(cfg_json));
    }
}
