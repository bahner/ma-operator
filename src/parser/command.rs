/// Command parser for ego terminal input.
///
/// Grammar:
///   .cmd                 → DotCommand      (control command: .ma, .enter, .help, …)
///   .cmd!verb [args]     → DotCommand::Meta
///   .my.path             → LocalCrud::Get  (local profile config)
///   .ma.ctx.path         → LocalCrud::Get  (local ma runtime context)
///   .my.path: value      → LocalCrud::Set
///   .my.path:            → LocalCrud::Delete
///   .my.path!verb [args] → LocalCrud::Meta
///   /ipfs/<cid>          → LocalCrud::Get  (remote fetch, read-only)
///   /ipns/<key>          → LocalCrud::Get  (remote fetch, read-only)
///   @alias/path          → RemoteCrud::Get
///   @alias/path: value   → RemoteCrud::Set(value)
///   @alias/path:         → RemoteCrud::Delete
///   @alias/path!edit     → RemoteCrud::Edit
///   @alias!msg [body]    → ActorLocalCommand (local zion text message command)
///   @alias#entity!edit   → ActorMessage `:behaviour!edit` meta workflow
///   @alias[:verb] [body] → ActorMessage  (remote method / RPC)
///   @did:ma:<id>[:verb]  → ActorMessage
///   did:ma:<id>[:verb]   → ActorMessage  (bare DID from expansion)
///   \@literal text       → PlainText
///   \.literal text       → PlainText  (escape a leading control-command dot)
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

/// Operation for a remote CRUD command (`@alias/path`).
#[derive(Debug, Clone, PartialEq)]
pub enum RemoteCrudOp {
    /// Fetch the value at path and display it.
    Get,
    /// Fetch the value at path and open it in the editor.
    Edit,
    /// Set the value at path to the given string (text or `<cid>`).
    Set(String),
    /// Delete the value at path.
    Delete,
}

#[derive(Debug, Clone, PartialEq)]
#[allow(clippy::enum_variant_names)]
pub enum Command {
    /// A closed-set hidden control command (`.ma`, `.enter`, `.help`, …).
    /// Never a data path — those live under `LocalCrud`.
    DotCommand {
        path: String,
        op: DotOp,
        args: Vec<String>,
    },
    /// Local CRUD on a `.my`, `.ma.ctx` config path, or a read-only remote
    /// fetch on `/ipfs`, `/ipns`, `/ipld`. Mirrors the remote `@alias/path`
    /// grammar.
    LocalCrud {
        path: String,
        op: DotOp,
        args: Vec<String>,
    },
    /// Remote CRUD on a `@alias/path` target — mirrors local `/path` grammar.
    RemoteCrud {
        target: String,
        path: String,
        op: RemoteCrudOp,
    },
    ActorMessage {
        target: String,
        verb: Option<String>,
        meta: Option<String>,
        body: String,
    },
    ActorLocalCommand {
        target: String,
        command: String,
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
        s if s.starts_with("\\.") => Ok(Command::PlainText(s[1..].to_string())),
        s if is_local_dot_root(s) => parse_local(s),
        s if s.starts_with('.') => parse_dot(s),
        s if s.starts_with('/') => parse_local(s),
        s if s.starts_with('@') || s.starts_with("did:") => parse_actor(s, cfg),
        s => Ok(Command::PlainText(resolve_targets(s, cfg)?)),
    }
}

// ── Path + op parsing (shared by control-command and local-path grammars) ──

/// Parse a `path[!verb args]` / `path[: value]` / `path:` command body into
/// `(path, DotOp, args)`. Shared between the `.` control-command grammar and
/// the `/` local-path grammar — the two differ only in which prefix
/// character dispatches here and in what the resulting `path` means.
fn parse_path_op(input: &str) -> Result<(String, DotOp, Vec<String>), String> {
    let (head, rest) = split_head_rest(input);
    // `!verb` — meta/side-effect operation; check before `:` split.
    if let Some(bang) = head.find('!') {
        let path = head[..bang].to_string();
        let meta_verb = head[bang + 1..].to_string();
        return Ok((path, DotOp::Meta(meta_verb), shell_split(&rest)?));
    }
    let (path, op) = dot_path_and_op(&head, &rest)?;
    let args = match &op {
        DotOp::Set(_) => vec![],
        _ => shell_split(&rest)?,
    };
    Ok((path, op, args))
}

// ── Dot control-command ─────────────────────────────────────────────────────

fn parse_dot(input: &str) -> Result<Command, String> {
    let (path, op, args) = parse_path_op(input)?;
    Ok(Command::DotCommand { path, op, args })
}

// ── Local path CRUD (`.my`, `.ma.ctx`, `/ipfs`, `/ipns`, `/ipld`) ────────────

fn is_local_dot_root(input: &str) -> bool {
    input == ".my"
        || input.starts_with(".my.")
        || input == ".ma.ctx"
        || input.starts_with(".ma.ctx.")
}

fn parse_local(input: &str) -> Result<Command, String> {
    let (path, op, args) = parse_path_op(input)?;
    Ok(Command::LocalCrud { path, op, args })
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

/// Handles both `@alias[!verb] [body]` and `did:ma:…[!verb] [body]`.
/// Also handles `@alias/path` for remote CRUD (mirrors local `/path` grammar).
fn parse_actor(input: &str, cfg: &EgoConfig) -> Result<Command, String> {
    let (head, body_raw) = split_head_rest(input);
    let head_stripped = head.trim_start_matches('@');

    // Remote CRUD: `@alias/path` — `/` after the alias (not a DID).
    // DIDs never contain `/`, so `did:ma:...` falls through to ActorMessage.
    if !head_stripped.starts_with("did:") {
        if let Some(slash) = head_stripped.find('/') {
            let alias_raw = &head_stripped[..slash];
            let path_raw = &head_stripped[slash..];
            let target = resolve_target(alias_raw, cfg)?;
            let (path, op) = parse_remote_crud_op(path_raw, &body_raw);
            return Ok(Command::RemoteCrud { target, path, op });
        }
    }

    if let Some(raw_target) = actor_fragment_edit_target(head_stripped) {
        let target = resolve_target(raw_target, cfg)?;
        let body = resolve_targets(&body_raw, cfg)?;
        return Ok(Command::ActorMessage {
            target,
            verb: Some("behaviour".to_string()),
            meta: Some("edit".to_string()),
            body,
        });
    }

    // Local actor command: `@actor!msg text` chooses a zion-side workflow.
    // It is not a remote method call; `:` remains remote RPC.
    if let Some((raw_target, command)) = split_local_actor_command(head_stripped) {
        if raw_target.is_empty() || command.is_empty() {
            return Err(format!("invalid actor command: @{head_stripped}"));
        }
        let target = resolve_target(raw_target, cfg)?;
        let body = resolve_targets(&body_raw, cfg)?;
        return Ok(Command::ActorLocalCommand {
            target,
            command: command.to_string(),
            body,
        });
    }

    if let Some(bang) = head_stripped.find('!') {
        if !has_actor_rpc_delimiter_before_bang(head_stripped, bang) {
            return Err(format!(
                "unknown actor command: !{}",
                &head_stripped[bang + 1..]
            ));
        }
    }

    let (raw_target, verb) = split_actor_head(head_stripped);
    let (verb, meta) = split_actor_verb_meta(verb)?;
    let target = resolve_target(raw_target, cfg)?;
    let body = resolve_targets(&body_raw, cfg)?;
    Ok(Command::ActorMessage {
        target,
        verb,
        meta,
        body,
    })
}

fn actor_fragment_edit_target(head: &str) -> Option<&str> {
    let raw_target = head.strip_suffix("!edit")?;
    let bang = raw_target.len();
    if raw_target.contains('#')
        && !raw_target.ends_with('#')
        && !has_actor_rpc_delimiter_before_bang(head, bang)
    {
        Some(raw_target)
    } else {
        None
    }
}

fn split_local_actor_command(head: &str) -> Option<(&str, &str)> {
    let bang = head.find('!')?;
    if has_actor_rpc_delimiter_before_bang(head, bang) {
        return None;
    }
    let command = &head[bang + 1..];
    matches!(command, "msg" | "message" | "text").then_some((&head[..bang], command))
}

fn has_actor_rpc_delimiter_before_bang(head: &str, bang: usize) -> bool {
    if head.starts_with("did:") {
        head[..bang].chars().filter(|ch| *ch == ':').count() >= 3
    } else {
        head[..bang].contains(':')
    }
}

fn split_actor_verb_meta(verb: Option<String>) -> Result<(Option<String>, Option<String>), String> {
    let Some(verb) = verb else {
        return Ok((None, None));
    };
    let Some((verb, meta)) = verb.split_once('!') else {
        return Ok((Some(verb), None));
    };
    if verb.is_empty() || meta.is_empty() {
        return Err(format!("invalid actor RPC meta syntax: {verb}!{meta}"));
    }
    Ok((Some(verb.to_string()), Some(meta.to_string())))
}

/// Parse the path+op from the `/path` portion of a remote CRUD command.
///
/// | Input | path | op |
/// |---|---|---|
/// | `/entities/room` | `/entities/room` | `Get` |
/// | `/entities/room!edit` | `/entities/room` | `Edit` |
/// | `/entities/room:` (empty body) | `/entities/room` | `Delete` |
/// | `/entities/room:` (non-empty body) | `/entities/room` | `Set(body)` |
fn parse_remote_crud_op(path_raw: &str, body: &str) -> (String, RemoteCrudOp) {
    // `!edit` suffix → Edit op
    if let Some(path) = path_raw.strip_suffix("!edit") {
        return (path.to_string(), RemoteCrudOp::Edit);
    }
    // trailing `:` → Delete (empty body) or Set (non-empty body)
    if let Some(path) = path_raw.strip_suffix(':') {
        let op = if body.trim().is_empty() {
            RemoteCrudOp::Delete
        } else {
            RemoteCrudOp::Set(body.trim().to_string())
        };
        return (path.to_string(), op);
    }
    // bare path → Get
    (path_raw.to_string(), RemoteCrudOp::Get)
}

// ── Shared helpers ─────────────────────────────────────────────────────────

fn split_head_rest(input: &str) -> (String, String) {
    let mut parts = input.splitn(2, ' ');
    let head = parts.next().unwrap_or("").to_string();
    let rest = parts.next().unwrap_or("").trim().to_string();
    (head, rest)
}

pub(crate) fn shell_split(s: &str) -> Result<Vec<String>, String> {
    let mut words = Vec::new();
    let mut current = String::new();
    let mut quote: Option<char> = None;
    let mut escaped = false;
    for ch in s.chars() {
        if escaped {
            current.push(ch);
            escaped = false;
            continue;
        }
        if ch == '\\' {
            escaped = true;
            continue;
        }
        if let Some(q) = quote {
            if ch == q {
                quote = None;
            } else {
                current.push(ch);
            }
            continue;
        }
        if ch == '"' || ch == '\'' {
            quote = Some(ch);
            continue;
        }
        if ch.is_whitespace() {
            if !current.is_empty() {
                words.push(std::mem::take(&mut current));
            }
            continue;
        }
        current.push(ch);
    }
    if let Some(q) = quote {
        return Err(format!("unclosed quote {q}"));
    }
    if escaped {
        current.push('\\');
    }
    if !current.is_empty() {
        words.push(current);
    }
    Ok(words)
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
    fn parses_dot_my_as_local_crud() {
        let cfg = EgoConfig::new();
        let cmd = parse(".my.aliases.fjodor", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::LocalCrud {
                path: ".my.aliases.fjodor".to_string(),
                op: DotOp::Get,
                args: vec![],
            }
        );
    }

    #[test]
    fn parses_dot_ma_ctx_as_local_crud() {
        let cfg = EgoConfig::new();
        let cmd = parse(".ma.ctx.url: http://localhost:5003", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::LocalCrud {
                path: ".ma.ctx.url".to_string(),
                op: DotOp::Set("http://localhost:5003".to_string()),
                args: vec![],
            }
        );
    }

    #[test]
    fn dot_ctx_is_not_local_crud_root() {
        let cfg = EgoConfig::new();
        let cmd = parse(".ctx.ma.url: http://localhost:5003", &cfg).expect("command should parse");

        assert!(matches!(cmd, Command::DotCommand { .. }));
    }

    #[test]
    fn shell_split_preserves_quoted_words() {
        assert_eq!(
            shell_split(r#"dig north to "the garden" 'with roses'"#).unwrap(),
            vec!["dig", "north", "to", "the garden", "with roses"]
        );
    }

    #[test]
    fn shell_split_accepts_posix_single_quote_escape() {
        assert_eq!(
            shell_split(r#"make thing 'Lars'\'' lamp'"#).unwrap(),
            vec!["make", "thing", "Lars' lamp"]
        );
    }

    #[test]
    fn shell_split_rejects_unclosed_quote() {
        assert!(shell_split(r#"dig north "the garden"#).is_err());
    }

    #[test]
    fn keeps_dot_ma_as_control_command() {
        let cfg = EgoConfig::new();
        let cmd = parse(".ma", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::DotCommand {
                path: ".ma".to_string(),
                op: DotOp::Get,
                args: vec![],
            }
        );
    }

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
                meta: None,
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
                meta: None,
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
                meta: None,
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
                meta: None,
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
                meta: None,
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
                meta: None,
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
                meta: None,
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_alias_target_with_text_actor_command() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky!msg hello there", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorLocalCommand {
                target: "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3"
                    .to_string(),
                command: "msg".to_string(),
                body: "hello there".to_string(),
            }
        );
    }

    #[test]
    fn rejects_fragment_target_emote_bang_command() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        assert!(parse("@sky#room!emote danser", &cfg).is_err());
    }

    #[test]
    fn keeps_colon_as_remote_actor_method() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky#room:emote danser", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#room"
                        .to_string(),
                verb: Some("emote".to_string()),
                meta: None,
                body: "danser".to_string(),
            }
        );
    }

    #[test]
    fn parses_fragment_target_with_actor_rpc_meta() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky#room:behaviour!edit", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#room"
                        .to_string(),
                verb: Some("behaviour".to_string()),
                meta: Some("edit".to_string()),
                body: String::new(),
            }
        );
    }

    #[test]
    fn parses_fragment_target_edit_as_behaviour_meta() {
        let mut cfg = EgoConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky#construct!edit", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#construct"
                        .to_string(),
                verb: Some("behaviour".to_string()),
                meta: Some("edit".to_string()),
                body: String::new(),
            }
        );
    }
}
