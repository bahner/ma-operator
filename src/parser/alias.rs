/// Alias expansion utilities.
///
/// Rules:
///   \@name  → literal "@name"  (no lookup)
///   @name   → looked up in .my.aliases, error if not found and not a DID
///   @did:ma:...  → passed through as-is (valid DID)
use crate::config::EgoConfig;

/// Scan `text` for @references and resolve them.
/// Returns the text with all @aliases replaced by their DID strings,
/// or an error if an alias is not found.
///
/// Escaped \@ sequences are converted to literal @.
pub fn resolve_targets(text: &str, cfg: &EgoConfig) -> Result<String, String> {
    let mut result = String::with_capacity(text.len());
    let mut chars = text.chars().peekable();

    while let Some(ch) = chars.next() {
        if ch == '\\' && chars.peek() == Some(&'@') {
            // Escaped: consume the backslash, emit @ literally
            chars.next();
            result.push('@');
            continue;
        }

        if ch == '@' {
            // Collect the alias/DID token — any non-whitespace char except \\ and @
            let mut token = String::new();
            while let Some(&nc) = chars.peek() {
                if nc.is_whitespace() || nc == '\\' || nc == '@' {
                    break;
                }
                token.push(nc);
                chars.next();
            }

            if token.is_empty() {
                result.push('@');
                continue;
            }

            // Pass-through full DIDs and DID-URLs.
            if token.starts_with("did:") {
                result.push('@');
                result.push_str(&token);
                continue;
            }

            // Alias with explicit fragment, e.g. @alice#chat
            if let Some((alias, fragment)) = token.split_once('#') {
                if alias.is_empty() || fragment.is_empty() {
                    return Err(format!("invalid target: @{token}"));
                }
                match cfg.resolve_alias(alias) {
                    Some(did) => {
                        if did.contains('#') {
                            return Err(format!("alias already has fragment: @{alias}"));
                        }
                        result.push_str(did);
                        result.push('#');
                        result.push_str(fragment);
                    }
                    None => return Err(format!("unknown alias: @{alias}")),
                }
                continue;
            }

            // Lookup alias
            match cfg.resolve_alias(&token) {
                Some(did) => result.push_str(did),
                None => {
                    return Err(format!("unknown alias: @{token}"));
                }
            }
            continue;
        }

        result.push(ch);
    }

    Ok(result)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::config::EgoConfig;

    fn cfg_with_alias(name: &str, did: &str) -> EgoConfig {
        let mut cfg = EgoConfig::default();
        cfg.set(format!(".my.aliases.{name}"), did);
        cfg
    }

    // ── resolve_targets ───────────────────────────────────────────────────

    #[test]
    fn resolve_known_alias() {
        let cfg = cfg_with_alias("alice", "did:ma:alice123");
        let result = resolve_targets("@alice hello", &cfg).unwrap();
        assert_eq!(result, "did:ma:alice123 hello");
    }

    #[test]
    fn resolve_unknown_alias_fails() {
        let cfg = EgoConfig::default();
        let result = resolve_targets("@nobody hello", &cfg);
        assert!(result.is_err());
    }

    #[test]
    fn escaped_at_becomes_literal() {
        let cfg = EgoConfig::default();
        let result = resolve_targets("\\@alice hello", &cfg).unwrap();
        assert_eq!(result, "@alice hello");
    }

    #[test]
    fn bare_did_passes_through() {
        let cfg = EgoConfig::default();
        let result = resolve_targets("@did:ma:abc123 hello", &cfg).unwrap();
        assert_eq!(result, "@did:ma:abc123 hello");
    }

    #[test]
    fn alias_with_fragment() {
        let cfg = cfg_with_alias("alice", "did:ma:alice123");
        let result = resolve_targets("@alice#sign", &cfg).unwrap();
        assert_eq!(result, "did:ma:alice123#sign");
    }

    #[test]
    fn alias_can_resolve_to_did_url() {
        let cfg = cfg_with_alias("home", "did:ma:alice123#room");
        let result = resolve_targets("@home", &cfg).unwrap();
        assert_eq!(result, "did:ma:alice123#room");
    }

    #[test]
    fn alias_with_stored_fragment_rejects_extra_fragment() {
        let cfg = cfg_with_alias("home", "did:ma:alice123#room");
        let result = resolve_targets("@home#other", &cfg);
        assert!(result.is_err());
    }

    #[test]
    fn no_at_sign_returns_input_unchanged() {
        let cfg = EgoConfig::default();
        let result = resolve_targets("just plain text", &cfg).unwrap();
        assert_eq!(result, "just plain text");
    }

    #[test]
    fn lone_at_sign_is_preserved() {
        // A bare @ not followed by a token is kept as-is.
        let cfg = EgoConfig::default();
        let result = resolve_targets("@ alone", &cfg).unwrap();
        assert_eq!(result, "@ alone");
    }
}
