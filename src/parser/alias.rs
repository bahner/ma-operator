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
            // Collect the alias/DID token (alphanumeric, :, -, _, #, .)
            let mut token = String::new();
            while let Some(&nc) = chars.peek() {
                if nc.is_alphanumeric() || matches!(nc, ':' | '-' | '_' | '#' | '.') {
                    token.push(nc);
                    chars.next();
                } else {
                    break;
                }
            }

            if token.is_empty() {
                result.push('@');
                continue;
            }

            // Pass-through full DIDs
            if token.starts_with("did:") {
                result.push('@');
                result.push_str(&token);
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

/// Format a DID for display: if there is an alias for it, show the alias
/// in the configured alias colour.  Returns a plain string (CSS colouring
/// is applied in the view layer).
#[allow(dead_code)]
pub fn display_did<'a>(did: &'a str, cfg: &EgoConfig) -> &'a str {
    // Walk aliases and find a reverse match
    for (key, val) in cfg.list_aliases() {
        if val == did {
            // strip the ".my.aliases." prefix from the key
            let name = key.trim_start_matches(".my.aliases.");
            let _ = name; // caller gets the raw did; view formats it
        }
    }
    did
}

/// Reverse-lookup: DID → alias name (if one exists).
#[allow(dead_code)]
pub fn did_to_alias<'a>(did: &str, cfg: &'a EgoConfig) -> Option<&'a str> {
    for (key, val) in cfg.list_aliases() {
        if val == did {
            return Some(key.trim_start_matches(".my.aliases."));
        }
    }
    None
}
