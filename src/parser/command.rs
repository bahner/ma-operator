/// Command parser for ego terminal input.
///
/// Local dot-path grammar:
///   .path                → DotOp::Get  (no args)
///   .path value          → DotOp::Get  (args carry the match query)
///   .path: value         → DotOp::Set  (space after `:` required)
///   .path:               → DotOp::Delete
///   .path:verb [args]    → DotOp::Verb
///
/// Actor grammar:
///   @target[:verb] [body]    → ActorMessage
///   \@literal text           → plain text (escaped @)
use super::alias::resolve_targets;
use crate::config::EgoConfig;

// ── Command enum ───────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq)]
pub enum DotOp {
    /// `.path` or `.path query…`  — get value (or match-filter subtree).
    Get,
    /// `.path: value`              — set leaf to value.
    Set(String),
    /// `.path:`                    — delete leaf or subtree.
    Delete,
    /// `.path:verb`                — invoke a registered verb on `path`.
    Verb(String),
}

#[derive(Debug, Clone, PartialEq)]
pub enum Command {
    /// `.foo.bar` with an op and any trailing args (whitespace-split).
    DotCommand {
        path: String,
        op: DotOp,
        args: Vec<String>,
    },
    /// @target[:verb] [args]  – message to an actor
    ActorMessage {
        /// Fully resolved DID (or DID#fragment)
        target: String,
        /// Optional verb, e.g. "ping", "fortune"
        verb: Option<String>,
        /// Remaining arguments as a single string
        body: String,
    },
    /// Raw text (escaped \@, or just plain text)
    PlainText(String),
}

// ── Parser ─────────────────────────────────────────────────────────────────

/// Parse a raw input line into a Command.
/// Alias resolution happens here; returns Err with a user-facing message
/// if an unknown alias is encountered.
pub fn parse(input: &str, cfg: &EgoConfig, focus: Option<&str>) -> Result<Command, String> {
    let input = input.trim();

    if input.is_empty() {
        return Ok(Command::PlainText(String::new()));
    }

    // Escaped \@ → literal text
    if input.starts_with("\\@") {
        return Ok(Command::PlainText(input[1..].to_string()));
    }

    // Dot-command
    if input.starts_with('.') {
        let mut parts = input.splitn(2, ' ');
        let head = parts.next().unwrap_or("").to_string();
        let rest = parts.next().unwrap_or("").trim().to_string();

        // Split head at the first ':' (keys never contain ':').
        let (path, op) = match head.split_once(':') {
            None => (head.clone(), {
                // No colon: Get (args may carry a match query).
                DotOp::Get
            }),
            Some((p, suffix)) => {
                let path = p.to_string();
                if suffix.is_empty() {
                    // `.path:` — Set if there is a value following, else Delete.
                    if rest.is_empty() {
                        (path, DotOp::Delete)
                    } else {
                        (path, DotOp::Set(rest.clone()))
                    }
                } else {
                    // `.path:verb` — verb invocation.
                    (path, DotOp::Verb(suffix.to_string()))
                }
            }
        };

        let args = match &op {
            // Set carries the whole value in its String; no separate args.
            DotOp::Set(_) => vec![],
            _ => {
                if rest.is_empty() {
                    vec![]
                } else {
                    shell_split(&rest)
                }
            }
        };

        return Ok(Command::DotCommand { path, op, args });
    }

    // Actor message  @target[:verb] [body]
    // If we are in focus mode, prepend the focus actor so the user
    // just types ":verb args" or "body"
    let effective = if let Some(actor) = focus {
        if input.starts_with(':') || !input.starts_with('@') {
            format!("{actor} {input}")
        } else {
            input.to_string()
        }
    } else {
        input.to_string()
    };

    if effective.starts_with('@') {
        let mut parts = effective.splitn(2, ' ');
        let head = parts.next().unwrap_or("").trim_start_matches('@');
        let body = parts.next().unwrap_or("").trim().to_string();

        // head is either "target" or "target:verb"
        let (raw_target, verb) = split_actor_head(head);

        // Resolve alias or validate DID
        let target = resolve_target(raw_target, cfg)?;

        // Resolve @alias references inside body
        let body = resolve_targets(&body, cfg)?;

        return Ok(Command::ActorMessage { target, verb, body });
    }

    // Anything else: plain text (could be a body continuation)
    Ok(Command::PlainText(resolve_targets(input, cfg)?))
}

/// Resolve a single target (alias name or bare DID) to a full DID string.
pub fn resolve_target(raw: &str, cfg: &EgoConfig) -> Result<String, String> {
    if raw.starts_with("did:") {
        return Ok(raw.to_string());
    }
    cfg.resolve_alias(raw)
        .map(|s| s.to_string())
        .ok_or_else(|| format!("unknown alias: @{raw}"))
}

/// Very basic shell-like split on whitespace (no quoting support yet).
fn shell_split(s: &str) -> Vec<String> {
    s.split_whitespace().map(|s| s.to_string()).collect()
}

fn split_actor_head(head: &str) -> (&str, Option<String>) {
    if head.starts_with("did:") {
        // did:ma:<id> contains two ':' in the DID itself. A verb adds one more
        // (e.g. did:ma:<id>:ping), so only split when we have more than two.
        let colon_count = head.bytes().filter(|&b| b == b':').count();
        if colon_count > 2 {
            if let Some((target, verb)) = head.rsplit_once(':') {
                if !verb.is_empty() {
                    return (target, Some(verb.to_string()));
                }
            }
        }
        return (head, None);
    }

    if let Some((target, verb)) = head.split_once(':') {
        if !verb.is_empty() {
            return (target, Some(verb.to_string()));
        }
    }
    (head, None)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_did_target_without_verb() {
        let cfg = EgoConfig::new();
        let cmd = parse("@did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3", &cfg, None)
            .expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3".to_string(),
                verb: None,
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_did_target_with_verb() {
        let cfg = EgoConfig::new();
        let cmd = parse("@did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3:ping", &cfg, None)
            .expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3".to_string(),
                verb: Some("ping".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_alias_target_with_verb() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.fjodor",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@fjodor:ping", &cfg, None).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3".to_string(),
                verb: Some("ping".to_string()),
                body: String::new(),
            }
        );
    }
}
