/// Helpers for creating and unlocking identities using ma-core types.
use ma_core::{BrowserIdentityExport, Config, SecretBundle};

/// Key material extracted from a decrypted [`SecretBundle`].
///
/// Contains everything the session needs: iroh transport key,
/// DID signing key, and the resolved DID string.
#[derive(Clone)]
pub struct UnlockedIdentity {
    pub iroh_key: [u8; 32],
    pub did_signing_key: [u8; 32],
    /// Full bare DID, e.g. `"did:ma:k51qzi5…"`
    pub sender_did: String,
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
pub fn unlock_identity(
    export_json: &str,
    passphrase: &str,
) -> Result<UnlockedIdentity, String> {
    let export =
        BrowserIdentityExport::from_json_str(export_json).map_err(|e| e.to_string())?;
    let encrypted = export
        .encrypted_secret_bundle_bytes()
        .map_err(|e| e.to_string())?;
    let bundle =
        SecretBundle::decrypt(&encrypted, passphrase).map_err(|e| e.to_string())?;
    bundle_to_unlocked(&bundle)
}

/// Convert a decrypted bundle into the session key material.
fn bundle_to_unlocked(bundle: &SecretBundle) -> Result<UnlockedIdentity, String> {
    let identity = bundle.generate_identity().map_err(|e| e.to_string())?;
    let sender_did = identity.subject_url.base_id();
    Ok(UnlockedIdentity {
        iroh_key: bundle.iroh_secret_key,
        did_signing_key: bundle.did_signing_key,
        sender_did,
    })
}

/// Wrap a raw export JSON for file download (the bundle is already encrypted).
pub fn export_for_download(export_json: &str) -> String {
    export_json.to_string()
}

/// Parse an imported file's bytes as a BrowserIdentityExport JSON.
/// Returns `(username, validated_json)`.
pub fn import_from_bytes(bytes: &[u8]) -> Result<(String, String), String> {
    let json = std::str::from_utf8(bytes).map_err(|e| e.to_string())?;
    let export =
        BrowserIdentityExport::from_json_str(json).map_err(|e| e.to_string())?;
    let config =
        Config::from_yaml_str(&export.config_yaml).map_err(|e| e.to_string())?;
    Ok((config.slug.clone(), json.to_string()))
}
