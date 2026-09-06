//! View registry.
//!
//! Each user-selectable view lives in its own directory (`zion`, `topdown`,
//! …). `.my.config.view` holds an opaque view identifier — currently one of
//! the built-in ids below; unknown ids fall back to `zion`.

pub mod editor;
pub mod landing;
pub mod qr;
pub mod screensaver;
pub mod secret;
pub mod topdown;
pub mod zion;

/// The default view used when `.my.config.view` is absent or unknown.
pub const DEFAULT_VIEW: &str = "zion";

/// Normalise a raw view identifier to a known, renderable id.
///
/// Accepts the built-in ids and passes through unknown strings as `None` so
/// callers can fall back. Kept a plain function so dynamic (IPFS/IPNS-backed)
/// view resolution can slot in later without changing the call site.
pub fn resolve_view(id: &str) -> Option<&'static str> {
    match id.trim() {
        "" => Some(DEFAULT_VIEW),
        "zion" => Some("zion"),
        "topdown" => Some("topdown"),
        _ => None,
    }
}
