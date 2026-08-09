//! Default `.my.z.scheme` seed for new users.
//!
//! Hardcoded, immutable, content-addressed — never a live/mutable pointer.
//! Deliberately empty until a real baseline is published (`zscheme/lib`'s
//! `make publish`) and this constant is wired to the resulting CID; empty
//! means "no seed yet", not "seed with nothing" (see call site in
//! `startup.rs`, which skips seeding entirely while this is empty).
pub const DEFAULT_ZSCHEME_SEED_CID: &str = "";
