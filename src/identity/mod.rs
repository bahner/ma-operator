pub mod export;
pub mod storage;

pub use export::*;
pub use storage::*;

pub fn validate_new_passphrase(passphrase: &str, confirmation: &str) -> Result<(), &'static str> {
    if passphrase.is_empty() {
        Err("error-passphrase-required")
    } else if passphrase.chars().count() < 20 {
        Err("error-passphrase-too-short")
    } else if passphrase != confirmation {
        Err("error-passphrases-no-match")
    } else {
        Ok(())
    }
}
