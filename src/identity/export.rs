/// Helpers for creating and unlocking identities using ma-core types.
use ma_core::{BrowserIdentityExport, Config, SecretBundle};

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
/// store the export JSON, and return the key material.
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

/// Unlock an existing identity: decrypt the bundle and return key material.
pub fn unlock_identity(export_json: &str, passphrase: &str) -> Result<UnlockedIdentity, String> {
    let export = BrowserIdentityExport::from_json_str(export_json).map_err(|e| e.to_string())?;
    let encrypted = export
        .encrypted_secret_bundle_bytes()
        .map_err(|e| e.to_string())?;
    let bundle = SecretBundle::decrypt(&encrypted, passphrase).map_err(|e| e.to_string())?;
    bundle_to_unlocked(&bundle)
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

/// Wrap a raw export JSON for file download (the bundle is already encrypted).
pub fn export_for_download(export_json: &str) -> String {
    export_json.to_string()
}

/// Replace the iroh transport key in an existing encrypted bundle with a freshly
/// generated one, re-encrypt with the same passphrase, and return the new export
/// JSON together with the unlocked session key material ready for login.
pub fn rekey_iroh(
    export_json: &str,
    passphrase: &str,
) -> Result<(String, UnlockedIdentity), String> {
    let export =
        BrowserIdentityExport::from_json_str(export_json).map_err(|e| e.to_string())?;
    let encrypted = export
        .encrypted_secret_bundle_bytes()
        .map_err(|e| e.to_string())?;
    let mut bundle =
        SecretBundle::decrypt(&encrypted, passphrase).map_err(|e| e.to_string())?;
    bundle.iroh_secret_key = SecretBundle::generate().iroh_secret_key;
    let new_encrypted = bundle.encrypt(passphrase).map_err(|e| e.to_string())?;
    let new_export = BrowserIdentityExport::new(export.config_yaml.clone(), &new_encrypted);
    let new_json = new_export.to_json_string().map_err(|e| e.to_string())?;
    let unlocked = bundle_to_unlocked(&bundle)?;
    Ok((new_json, unlocked))
}

/// Parse an imported file's bytes as a BrowserIdentityExport JSON.
/// Returns `(username, validated_json)`.
pub fn import_from_bytes(bytes: &[u8]) -> Result<(String, String), String> {
    let json = std::str::from_utf8(bytes).map_err(|e| e.to_string())?;
    let export = BrowserIdentityExport::from_json_str(json).map_err(|e| e.to_string())?;
    let config = Config::from_yaml_str(&export.config_yaml).map_err(|e| e.to_string())?;
    Ok((config.slug.clone(), json.to_string()))
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
        assert_eq!(original.ipns_secret_key, rekeyed.ipns_secret_key, "ipns_secret_key must not change");
        assert_eq!(original.did_signing_key, rekeyed.did_signing_key, "did_signing_key must not change");
        assert_eq!(original.did_encryption_key, rekeyed.did_encryption_key, "did_encryption_key must not change");
        assert_eq!(original.sender_did, rekeyed.sender_did, "sender_did (DID identity) must not change");
        assert_eq!(original.created_at, rekeyed.created_at, "created_at must not change");
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
        let unlocked = unlock_identity(&export_json, PASS).expect("original export should still be valid");
        assert!(!unlocked.sender_did.is_empty());
    }

    // ── create_identity ───────────────────────────────────────────────────

    #[test]
    fn create_identity_returns_valid_did() {
        let (_, id) = create_identity("alice", PASS).expect("create_identity failed");
        assert!(id.sender_did.starts_with("did:ma:"), "DID should start with did:ma:");
    }

    #[test]
    fn create_identity_keys_are_nonzero() {
        let (_, id) = create_identity("alice", PASS).expect("create_identity failed");
        assert_ne!(id.iroh_key, [0u8; 32], "iroh_key must not be all-zero");
        assert_ne!(id.ipns_secret_key, [0u8; 32], "ipns_secret_key must not be all-zero");
        assert_ne!(id.did_signing_key, [0u8; 32], "did_signing_key must not be all-zero");
        assert_ne!(id.did_encryption_key, [0u8; 32], "did_encryption_key must not be all-zero");
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
        assert_ne!(id1.sender_did, id2.sender_did, "two fresh identities must have distinct DIDs");
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

    // ── import_from_bytes ─────────────────────────────────────────────────

    #[test]
    fn import_from_bytes_roundtrip() {
        let (json, _) = create_identity("alice", PASS).expect("create failed");
        let (_, validated) = import_from_bytes(json.as_bytes()).expect("import failed");
        // Validated JSON must still be unlockable regardless of slug.
        let _ = unlock_identity(&validated, PASS).expect("unlock after import failed");
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

    // ── export_for_download ───────────────────────────────────────────────

    #[test]
    fn export_for_download_is_identity() {
        let json = r#"{"x":1}"#;
        assert_eq!(export_for_download(json), json);
    }
}
