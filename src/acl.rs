/// Ego client-side transport ACL.
///
/// A single [`ma_core::AclMap`] is stored at [`ACL_KEY`] inside the identity
/// config (`EgoConfig`) as a YAML string.  Before any incoming message is
/// delivered to the UI the poll loop checks two capabilities:
///
/// - [`CAP_INBOX`] — may deliver messages via `/ma/inbox/0.0.1`
/// - [`CAP_RPC`]   — may send unsolicited RPC calls via `/ma/rpc/0.0.1`
///
/// Replies to outgoing RPCs are **never filtered** regardless of sender.
///
/// If `.my.acl` is absent or unparseable, the ACL defaults to fully open
/// (`"*": [inbox, rpc]`).
use ma_core::{check_cap, AclMap, CapabilityEntry};
pub use ma_core::{CAP_INBOX, CAP_RPC};

use crate::config::EgoConfig;

/// Config key where the ACL YAML blob is stored.
pub const ACL_KEY: &str = ".my.acl";

/// Parse the ACL stored at `.my.acl`.  Falls back to a fully-open ACL on
/// parse error or when the key is absent.
pub fn load_ego_acl(cfg: &EgoConfig) -> AclMap {
    cfg.get(ACL_KEY)
        .and_then(|yaml| serde_yaml::from_str::<AclMap>(yaml).ok())
        .unwrap_or_else(open_acl)
}

/// A fully-open ACL: every caller may use inbox **and** rpc.
pub fn open_acl() -> AclMap {
    let caps = CapabilityEntry::Allow([CAP_INBOX, CAP_RPC].iter().map(std::string::ToString::to_string).collect());
    [("*".to_string(), caps)].into_iter().collect()
}

/// Returns `true` when `from` holds `cap` according to the stored ACL.
///
/// Uses only O(1) principal-entry lookups — no IPFS resolution. Ego has no
/// network access at ACL evaluation time.
pub fn check_ego_acl(cfg: &EgoConfig, from: &str, cap: &str) -> bool {
    check_cap(&load_ego_acl(cfg), from, cap).is_ok()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg_with_acl(yaml: &str) -> EgoConfig {
        let mut cfg = EgoConfig::default();
        cfg.set(ACL_KEY, yaml);
        cfg
    }

    // ── open_acl / load_ego_acl defaults ─────────────────────────────────

    #[test]
    fn empty_cfg_defaults_to_open_acl() {
        let cfg = EgoConfig::default();
        assert!(check_ego_acl(&cfg, "did:ma:stranger", CAP_INBOX));
        assert!(check_ego_acl(&cfg, "did:ma:stranger", CAP_RPC));
    }

    #[test]
    fn open_acl_allows_inbox_and_rpc() {
        let acl = open_acl();
        assert!(check_cap(&acl, "did:ma:anyone", CAP_INBOX).is_ok());
        assert!(check_cap(&acl, "did:ma:anyone", CAP_RPC).is_ok());
    }

    // ── explicit YAML ACL ─────────────────────────────────────────────────

    #[test]
    fn explicit_allow_inbox_only() {
        let yaml = format!("\"did:ma:alice\": [{CAP_INBOX}]\n");
        let cfg = cfg_with_acl(&yaml);
        assert!(check_ego_acl(&cfg, "did:ma:alice", CAP_INBOX));
        assert!(!check_ego_acl(&cfg, "did:ma:alice", CAP_RPC));
    }

    #[test]
    fn explicit_deny_overrides_wildcard() {
        // Build AclMap directly: wildcard allows, eve is explicit Deny.
        let mut acl: AclMap = open_acl();
        acl.insert("did:ma:eve".to_string(), CapabilityEntry::Deny);
        // Eve is denied despite the wildcard allow.
        assert!(check_cap(&acl, "did:ma:eve", CAP_INBOX).is_err());
        // Others are still allowed via the wildcard.
        assert!(check_cap(&acl, "did:ma:alice", CAP_INBOX).is_ok());
    }

    #[test]
    fn unparseable_acl_falls_back_to_open() {
        let cfg = cfg_with_acl("this is not valid yaml acl !!!");
        // Falls back to open_acl.
        assert!(check_ego_acl(&cfg, "did:ma:anyone", CAP_INBOX));
    }
}
