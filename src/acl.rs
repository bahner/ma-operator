pub use ma_core::CAP_INBOX;
/// Operator client-side transport ACL.
///
/// A single [`ma_core::AclMap`] is stored at [`ACL_KEY`] inside the identity
/// config (`OperatorConfig`) as a YAML string.  Before any incoming message is
/// delivered to the UI the poll loop checks one capability:
///
/// - [`CAP_INBOX`] — may deliver messages via `/ma/inbox/0.0.1`
///
/// Replies to outgoing messages are **never filtered** regardless of sender.
///
/// If `.my.acl` is absent or unparseable, the ACL defaults to fully open
/// (`"*": [inbox]`).
use ma_core::{check_cap, AclMap, CapabilityEntry};

use crate::config::OperatorConfig;

/// Config key where the ACL YAML blob is stored.
pub const ACL_KEY: &str = ".my.acl";

/// Parse the ACL stored at `.my.acl`.  Falls back to a fully-open ACL on
/// parse error or when the key is absent.
pub fn load_operator_acl(cfg: &OperatorConfig) -> AclMap {
    cfg.get(ACL_KEY)
        .and_then(|yaml| serde_yaml::from_str::<AclMap>(yaml).ok())
        .unwrap_or_else(open_acl)
}

/// A fully-open ACL: every caller may use inbox.
pub fn open_acl() -> AclMap {
    let caps = CapabilityEntry::Allow(
        [CAP_INBOX]
            .iter()
            .map(std::string::ToString::to_string)
            .collect(),
    );
    [("*".to_string(), caps)].into_iter().collect()
}

/// Returns `true` when `from` holds `cap` according to the stored ACL.
///
/// Uses only O(1) principal-entry lookups — no IPFS resolution. Operator has no
/// network access at ACL evaluation time.
pub fn check_operator_acl(cfg: &OperatorConfig, from: &str, cap: &str) -> bool {
    check_cap(&load_operator_acl(cfg), from, cap).is_ok()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg_with_acl(yaml: &str) -> OperatorConfig {
        let mut cfg = OperatorConfig::default();
        cfg.set(ACL_KEY, yaml);
        cfg
    }

    // ── open_acl / load_operator_acl defaults ─────────────────────────────────

    #[test]
    fn empty_cfg_defaults_to_open_acl() {
        let cfg = OperatorConfig::default();
        assert!(check_operator_acl(&cfg, "did:ma:stranger", CAP_INBOX));
    }

    #[test]
    fn open_acl_allows_inbox() {
        let acl = open_acl();
        assert!(check_cap(&acl, "did:ma:anyone", CAP_INBOX).is_ok());
    }

    // ── explicit YAML ACL ─────────────────────────────────────────────────

    #[test]
    fn explicit_allow_inbox_only() {
        let yaml = format!("\"did:ma:alice\": [{CAP_INBOX}]\n");
        let cfg = cfg_with_acl(&yaml);
        assert!(check_operator_acl(&cfg, "did:ma:alice", CAP_INBOX));
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
        assert!(check_operator_acl(&cfg, "did:ma:anyone", CAP_INBOX));
    }
}
