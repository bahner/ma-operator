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
///   @alias[.path[:verb]] [body]   → ActorMessage  (alias names must not contain '.')
///   @did:ma:<id>[:verb] [body]    → ActorMessage
///   \@literal text                → plain text (escaped @)
///
/// Topic grammar:
///   #alias                → TopicMessage { verb: "status" }
///   #alias:say body       → TopicMessage { verb: "say" }
///   #alias:emote body     → TopicMessage { verb: "emote" }
///   #alias:subscribe      → TopicMessage { verb: "subscribe" }
///   #alias:unsubscribe    → TopicMessage { verb: "unsubscribe" }
///   #alias:               → TopicMessage { verb: "" }  (delete/noop)
///   ,body                 → TopicEmote  (topic from focus context)
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
#[allow(clippy::enum_variant_names)]
pub enum Command {
    /// `.foo.bar` with an op and any trailing args (whitespace-split).
    DotCommand {
        path: String,
        op: DotOp,
        args: Vec<String>,
    },
    /// @alias[.path[:verb]] [body]  – message to an actor
    ActorMessage {
        /// Fully resolved DID (or DID#fragment)
        target: String,
        /// Optional verb, e.g. "ping", "fortune"
        verb: Option<String>,
        /// Remaining arguments as a single string
        body: String,
    },
    /// #alias[:verb [body]]  – message to a gossip topic
    TopicMessage {
        /// Local alias name (looked up in .my.topics.*)
        topic: String,
        /// Verb: "say" | "emote" | "subscribe" | "unsubscribe" | "status" | ""
        verb: String,
        /// Message body
        body: String,
    },
    /// ,body  – emote to the current topic focus (only valid in .use #topic mode)
    TopicEmote { body: String },
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

    // Emote to current topic focus: ,body → TopicEmote
    if let Some(body) = input.strip_prefix(',') {
        let body = body.trim().to_string();
        return Ok(Command::TopicEmote { body });
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
        if actor.starts_with('#') {
            // Topic focus mode: expand bare text and : prefixes to topic commands.
            // Pass through . @ # (dot-commands, p2p, explicit other topics)
            // and , (TopicEmote, already returned above).
            if input.starts_with('.') || input.starts_with('@') || input.starts_with('#') {
                input.to_string()
            } else if input.starts_with(':') {
                // :verb body  →  #foo:verb body  |  :  →  #foo:
                format!("{actor}{input}")
            } else {
                // Bare text  →  #foo:say text
                format!("{actor}:say {input}")
            }
        } else {
            // Actor focus mode (existing behaviour)
            if input.starts_with(':') || !input.starts_with('@') {
                format!("{actor} {input}")
            } else {
                input.to_string()
            }
        }
    } else {
        input.to_string()
    };

    // Topic message: #alias[:verb [body]]
    if effective.starts_with('#') {
        return parse_topic_message(&effective);
    }

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

/// Very basic shell-like split on whitespace (no quoting support yet).
fn shell_split(s: &str) -> Vec<String> {
    s.split_whitespace().map(|s| s.to_string()).collect()
}

fn split_actor_head(head: &str) -> (&str, Option<String>) {
    if head.starts_with("did:") {
        // did:ma:<id> contains exactly two ':'. The 3rd colon is the verb
        // separator. Splitting at the 3rd colon preserves compound verbs
        // like "entities.rms:edit" intact, while simple verbs like "ping"
        // are also handled correctly.
        let mut colon_count = 0;
        for (i, ch) in head.char_indices() {
            if ch == ':' {
                colon_count += 1;
                if colon_count == 3 {
                    let verb = &head[i + 1..];
                    if !verb.is_empty() {
                        return (&head[..i], Some(verb.to_string()));
                    }
                    break;
                }
            }
        }
        return (head, None);
    }

    // Non-DID: last ':' is the verb separator.
    //   @💃:say            → alias="💃",       verb="say"
    //   @sky.acl:edit      → alias="sky",       verb="acl:edit"
    //   @sky.entities.rms:edit → alias="sky",   verb="entities.rms:edit"
    //   @sky.ping          → alias="sky",       verb="ping"   (no colon)
    //   @fjodor#fortune.ping → alias="fjodor#fortune", verb="ping"
    if let Some((before, verb_part)) = head.rsplit_once(':') {
        if !verb_part.is_empty() {
            if let Some(dot_pos) = before.find('.') {
                let alias = &before[..dot_pos];
                let path = &before[dot_pos + 1..];
                return (alias, Some(format!("{path}:{verb_part}")));
            }
            return (before, Some(verb_part.to_string()));
        }
    }
    // No colon — dot separates alias from bare path/verb.
    if let Some(dot_pos) = head.find('.') {
        let alias = &head[..dot_pos];
        let path_verb = &head[dot_pos + 1..];
        if !path_verb.is_empty() {
            return (alias, Some(path_verb.to_string()));
        }
    }
    (head, None)
}

/// Parse `#alias[:verb [body]]` into a [`Command::TopicMessage`].
///
/// The leading `#` must already be present in `input`.
fn parse_topic_message(input: &str) -> Result<Command, String> {
    // Strip leading '#'
    let s = &input[1..];

    // Split at first space to get head and body
    let (head, body) = match s.split_once(' ') {
        Some((h, b)) => (h, b.trim().to_string()),
        None => (s, String::new()),
    };

    // Split head at first ':' to get topic and verb
    let (topic, verb) = match head.split_once(':') {
        None => (head.to_string(), "status".to_string()),
        Some((t, v)) => (t.to_string(), v.to_string()),
    };

    if topic.is_empty() {
        return Err("topic alias cannot be empty".to_string());
    }

    // Validate verb
    match verb.as_str() {
        "say" | "emote" | "subscribe" | "unsubscribe" | "status" | "" => {}
        other => return Err(format!("unknown topic verb: {other}")),
    }

    Ok(Command::TopicMessage { topic, verb, body })
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
            None,
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
            None,
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
            None,
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

        let cmd = parse("@fjodor.ping", &cfg, None).expect("command should parse");

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
    fn parses_alias_target_with_fragment_and_verb() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.fjodor",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@fjodor#fortune.ping", &cfg, None).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#fortune"
                        .to_string(),
                verb: Some("ping".to_string()),
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

        let cmd = parse("@sky.acl:edit", &cfg, None).expect("command should parse");

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

        let cmd = parse("@sky.entities.rms:edit", &cfg, None).expect("command should parse");

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
