//! Password-based profile blob encryption.
//!
//! Key derivation: PBKDF2-HMAC-SHA256 with a fixed salt.
//! Encryption:     XChaCha20-Poly1305.
//! Format:         nonce(24 bytes) || ciphertext+tag

use chacha20poly1305::{
    aead::{Aead, Payload},
    KeyInit, XChaCha20Poly1305, XNonce,
};
use pbkdf2::pbkdf2_hmac;
use sha2::Sha256;

/// Fixed KDF salt — version-tagged to allow future migration.
const SALT: &[u8] = b"zion-profile-v1";
/// AEAD additional data for domain separation.
const AAD: &[u8] = b"zion-profile-v1";
/// PBKDF2 iteration count.
const ROUNDS: u32 = 50_000;

/// Derive a 32-byte key from a passphrase (PBKDF2-HMAC-SHA256).
/// Called once at login; the key is kept in SESSION_PROFILE_KEY.
pub fn derive_key(passphrase: &str) -> [u8; 32] {
    let mut key = [0u8; 32];
    pbkdf2_hmac::<Sha256>(passphrase.as_bytes(), SALT, ROUNDS, &mut key);
    key
}

/// Decrypt with an already-derived key (used during active session).
pub fn decrypt_with_key(blob: &[u8], key: &[u8; 32]) -> Result<Vec<u8>, String> {
    if blob.len() < 25 {
        return Err("profile blob too short".to_string());
    }
    let nonce = XNonce::from_slice(&blob[..24]);
    let cipher = XChaCha20Poly1305::new_from_slice(key).map_err(|e| format!("{e}"))?;
    cipher
        .decrypt(
            nonce,
            Payload {
                msg: &blob[24..],
                aad: AAD,
            },
        )
        .map_err(|_| "wrong passphrase or corrupted profile".to_string())
}
