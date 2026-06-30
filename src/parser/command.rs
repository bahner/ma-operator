/// Command parser for ego terminal input.
///
/// Grammar:
///   .path                → DotOp::Get
///   .path value          → DotOp::Get  (args carry match query)
///   .path: value         → DotOp::Set
///   .path:               → DotOp::Delete
///   .path!verb [args]    → DotOp::Meta  (side-effect / system operation)
///   @alias[!verb] [body] → ActorMessage
///   @did:ma:<id>[!verb]  → ActorMessage
///   did:ma:<id>[!verb]   → ActorMessage  (bare DID from expansion)
///   \@literal text       → PlainText
use super::alias::resolve_targets;
use crate::config::EgoConfig;

// ── Command types ──────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq)]
pub enum DotOp {
    Get,
    Set(String),
    Delete,
    /// `!verb` — side-effect / system operation (edit, eval, publish, fetch, …)
    Meta(String),
}

#[derive(Debug, Clone, PartialEq)]
#[allow(clippy::enum_variant_names)]
pub enum Command {
    DotCommand {
        path: String,
        op: DotOp,
        args: Vec<String>,
    },
    ActorMessage {
        target: String,
        verb: Option<String>,
        body: String,
    },
    PlainText(String),
}

// ── Public entry point ─────────────────────────────────────────────────────

pub fn parse(input: &str, cfg: &EgoConfig) -> Result<Command, String> {
    let input = input.trim();
    match input {
        "" => Ok(Command::PlainText(String::new())),
        s if s.starts_with("\\@") => Ok(Command::PlainText(s[1..].to_string())),
        s if s.starts_with('.') => parse_dot(s),
        s if s.starts_with('@') || s.starts_with("did:") => parse_actor(s, cfg),
        s => Ok(Command::PlainText(resolve_targets(s, cfg)?)),
    }
}

// ── Dot-path command ───────────────────────────────────────────────────────

fn parse_dot(input: &str) -> Result<Command, String> {
    let (head, rest) = split_head_rest(input);
    // `!verb` — meta/side-effect operation; check before `:` split.
    if let Some(bang) = head.find('!') {
        let path = head[..bang].to_string();
        let meta_verb = head[bang + 1..].to_string();
        return Ok(Command::DotCommand {
            path,
            op: DotOp::Meta(meta_verb),
            args: shell_split(&rest),
        });
    }
    let (path, op) = dot_path_and_op(&head, &rest)?;
    let args = match &op {
        DotOp::Set(_) => vec![],
        _ => shell_split(&rest),
    };
    Ok(Command::DotCommand { path, op, args })
}

fn dot_path_and_op(head: &str, rest: &str) -> Result<(String, DotOp), String> {
    let result = match head.split_once(':') {
        None => (head.to_string(), DotOp::Get),
        Some((path, "")) if rest.is_empty() => (path.to_string(), DotOp::Delete),
        Some((path, "")) => (path.to_string(), DotOp::Set(rest.to_string())),
        Some((path, verb)) => {
            return Err(format!(
                "unknown syntax ‘{path}:{verb}’ — use ‘{path}!{verb}’ for commands"
            ));
        }
    };
    Ok(result)
}

// ── Actor message ──────────────────────────────────────────────────────────

/// Handles both `@alias[:verb] [body]` and `did:ma:…[:verb] [body]`.
fn parse_actor(input: &str, cfg: &EgoConfig) -> Result<Command, String> {
    let (head, body_raw) = split_head_rest(input);
    let head = head.trim_start_matches('@');
    let (raw_target, verb) = split_actor_head(head);
    let target = resolve_target(raw_target, cfg)?;
    let body = resolve_targets(&body_raw, cfg)?;
    Ok(Command::ActorMessage { target, verb, body })
}

// ── Shared helpers ─────────────────────────────────────────────────────────

fn split_head_rest(input: &str) -> (String, String) {
    let mut parts = input.splitn(2, ' ');
    let head = parts.next().unwrap_or("").to_string();
    let rest = parts.next().unwrap_or("").trim().to_string();
    (head, rest)
}

fn shell_split(s: &str) -> Vec<String> {
    if s.is_empty() {
        vec![]
    } else {
        s.split_whitespace().map(|s| s.to_string()).collect()
    }
}

pub fn resolve_target(raw: &str, cfg: &EgoConfig) -> Result<String, String> {
    let raw = raw.trim_start_matches('@');
    if raw.starts_with("did:") {
        return Ok(raw.to_string());
    }
    if let Some((alias, fragment)) = raw.split_once('#') {
        if alias.is_empty() || fragment.is_empty() {
            return Err(format!("invalid target: @{raw}"));
        }
        let did = cfg
            .resolve_alias(alias)
            .ok_or_else(|| format!("unknown alias: @{alias}"))?;
        return Ok(format!("{did}#{fragment}"));
    }
    cfg.resolve_alias(raw)
        .map(|s| s.to_string())
        .ok_or_else(|| format!("unknown alias: @{raw}"))
}

pub(crate) fn split_actor_head(head: &str) -> (&str, Option<String>) {
    if head.starts_with("did:") {
        let mut n = 0;
        for (i, ch) in head.char_indices() {
            if ch == ':' {
                n += 1;
                if n == 3 {
                    let verb = &head[i + 1..];
                    return if verb.is_empty() {
                        (head, None)
                    } else {
                        (&head[..i], Some(verb.to_string()))
                    };
                }
            }
        }
        return (head, None);
    }

    // NEW: Handle remote dot-path GET operations like `@sky.entities`
    if !head.contains(':') {
        if let Some(dot_pos) = head.find('.') {
            let target = &head[..dot_pos];
            let path = &head[dot_pos..]; // Keep the leading dot
            return (target, Some(path.to_string()));
        }
    }

    if let Some((before, verb)) = head.rsplit_once(':') {
        if !verb.is_empty() {
            let alias = before.find('.').map(|p| &before[..p]).unwrap_or(before);
            let path = before.find('.').map(|p| &before[p + 1..]).unwrap_or("");
            return (
                alias,
                Some(if path.is_empty() {
                    verb.to_string()
                } else {
                    format!("{path}:{verb}")
                }),
            );
        }
    }
    if let Some(dot) = head.find('.') {
        let path_verb = &head[dot + 1..];
        if !path_verb.is_empty() {
            return (&head[..dot], Some(path_verb.to_string()));
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
        let cmd = parse(
            "@did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
            &cfg,
        )
        .expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: None,
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_did_target_with_verb() {
        let cfg = EgoConfig::new();
        let cmd = parse(
            "@did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3:ping",
            &cfg,
        )
        .expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: Some("ping".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_did_target_with_compound_verb() {
        let cfg = EgoConfig::new();
        let cmd = parse(
            "@did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3:entities.rms:edit",
            &cfg,

        )
        .expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: Some("entities.rms:edit".to_string()),
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

        let cmd = parse("@fjodor.ping", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: Some(".ping".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_alias_target_with_fragment_and_verb() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.fjodor",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@fjodor#fortune.ping", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#fortune"
                        .to_string(),
                verb: Some(".ping".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_alias_target_with_compound_verb() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky.acl:edit", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: Some("acl:edit".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_alias_target_with_nested_path_verb() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky.entities.rms:edit", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                verb: Some("entities.rms:edit".to_string()),
                body: String::new(),
            }
        );
    }
}
