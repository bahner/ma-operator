/// Command parser for operator terminal input.
///
/// Grammar:
///   .cmd                 → `DotCommand`      (control command: .ma, .enter, .help, …)
///   .cmd!verb [args]     → `DotCommand::Meta`
///   .my.path             → `LocalCrud::Get`  (local profile config)
///   .z.path              → `LocalCrud::Get`  (publishable local scripts)
///   .ma.ctx.path         → `LocalCrud::Get`  (local ma runtime context)
///   .my.path: value      → `LocalCrud::Set`
///   .z.path: value       → `LocalCrud::Set`
///   .my.path:            → `LocalCrud::Delete`
///   .my.path!verb [args] → `LocalCrud::Meta`
///   @alias/path          → `RemoteCrud::Get`
///   @alias/path: value   → `RemoteCrud::Set(value)`
///   @alias/path:         → `RemoteCrud::Delete`
///   @alias/path!edit     → `RemoteCrud::Edit`
///   @alias!msg [body]    → `ActorLocalCommand` (local operator text message command)
///   @alias#entity!edit   → `ActorMessage` `:behaviour!edit` meta workflow
///   @alias[:verb] [body] → `ActorMessage`  (remote method)
///   @did:ma:<id>[:verb]  → `ActorMessage`
///   did:ma:<id>[:verb]   → `ActorMessage`  (bare DID from expansion)
///   \@literal text       → `PlainText`
///   \.literal text       → `PlainText`  (escape a leading control-command dot)
use super::alias::resolve_targets;
use crate::config::OperatorConfig;

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
    /// Local CRUD on a `.my`, `.z`, or `.ma.ctx` config path.
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

pub fn parse(input: &str, cfg: &OperatorConfig) -> Result<Command, String> {
    let input = input.trim();
    match input {
        "" => Ok(Command::PlainText(String::new())),
        s if s.starts_with("\\@") => Ok(Command::PlainText(s[1..].to_string())),
        s if s.starts_with("\\.") => Ok(Command::PlainText(s[1..].to_string())),
        s if is_local_dot_root(s) => parse_local(s, cfg),
        s if s.starts_with('.') => parse_dot(s, cfg),
        s if s.starts_with('@') || s.starts_with("did:") => parse_actor(s, cfg),
        s => Ok(Command::PlainText(resolve_targets(s, cfg)?)),
    }
}

// ── Path + op parsing (shared by control-command and local-path grammars) ──

/// Parse a `path[!verb args]` / `path[: value]` / `path:` command body into
/// `(path, DotOp, args)`. Shared between the `.` control-command grammar and
/// the `/` local-path grammar — the two differ only in which prefix
/// character dispatches here and in what the resulting `path` means.
fn parse_path_op(
    input: &str,
    cfg: &OperatorConfig,
) -> Result<(String, DotOp, Vec<String>), String> {
    let (head, rest) = split_head_rest(input);
    // `!verb` — meta/side-effect operation; check before `:` split.
    if let Some(bang) = head.find('!') {
        let path = head[..bang].to_string();
        let meta_verb = head[bang + 1..].to_string();
        return Ok((
            path,
            DotOp::Meta(meta_verb),
            shell_split_with_config(&rest, cfg)?,
        ));
    }
    let (path, op) = dot_path_and_op(&head, &rest)?;
    let args = match &op {
        DotOp::Set(_) => vec![],
        DotOp::Get if path == ".enter" => shell_split(&rest)?,
        _ => shell_split_with_config(&rest, cfg)?,
    };
    Ok((path, op, args))
}

// ── Dot control-command ─────────────────────────────────────────────────────

fn parse_dot(input: &str, cfg: &OperatorConfig) -> Result<Command, String> {
    let (path, op, args) = parse_path_op(input, cfg)?;
    Ok(Command::DotCommand { path, op, args })
}

// ── Local path CRUD (`.my`, `.z`, `.ma.ctx`) ─────────────────────────────────

fn is_local_dot_root(input: &str) -> bool {
    has_local_root(input, ".my") || has_local_root(input, ".z") || has_local_root(input, ".ma.ctx")
}

fn has_local_root(input: &str, root: &str) -> bool {
    input == root
        || input
            .strip_prefix(root)
            .and_then(|suffix| suffix.chars().next())
            .is_some_and(|delimiter| matches!(delimiter, '.' | '!' | ':'))
}

fn parse_local(input: &str, cfg: &OperatorConfig) -> Result<Command, String> {
    let (path, op, args) = parse_path_op(input, cfg)?;
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
fn parse_actor(input: &str, cfg: &OperatorConfig) -> Result<Command, String> {
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

    // Local actor command: `@actor!msg text` chooses a operator-side workflow.
    // It is not a remote method call; `:` remains a remote method.
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
        if !has_actor_delimiter_before_bang(head_stripped, bang) {
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
        && !has_actor_delimiter_before_bang(head, bang)
    {
        Some(raw_target)
    } else {
        None
    }
}

fn split_local_actor_command(head: &str) -> Option<(&str, &str)> {
    let bang = head.find('!')?;
    if has_actor_delimiter_before_bang(head, bang) {
        return None;
    }
    let command = &head[bang + 1..];
    matches!(command, "msg" | "message" | "text").then_some((&head[..bang], command))
}

fn has_actor_delimiter_before_bang(head: &str, bang: usize) -> bool {
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
        return Err(format!("invalid actor meta syntax: {verb}!{meta}"));
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
    shell_split_inner(s, None)
}

pub(crate) fn shell_split_with_config(
    s: &str,
    cfg: &OperatorConfig,
) -> Result<Vec<String>, String> {
    shell_split_inner(s, Some(cfg))
}

fn shell_split_inner(s: &str, cfg: Option<&OperatorConfig>) -> Result<Vec<String>, String> {
    let mut words = Vec::new();
    let mut current = String::new();
    let mut current_is_literal = false;
    let mut quote: Option<char> = None;
    let mut escaped = false;
    for ch in s.chars() {
        if escaped {
            current.push(ch);
            current_is_literal = true;
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
                current_is_literal = true;
            }
            continue;
        }
        if ch == '"' || ch == '\'' {
            quote = Some(ch);
            current_is_literal = true;
            continue;
        }
        if ch.is_whitespace() {
            if !current.is_empty() {
                push_shell_word(
                    &mut words,
                    std::mem::take(&mut current),
                    current_is_literal,
                    cfg,
                )?;
                current_is_literal = false;
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
        current_is_literal = true;
    }
    if !current.is_empty() {
        push_shell_word(&mut words, current, current_is_literal, cfg)?;
    }
    Ok(words)
}

fn push_shell_word(
    words: &mut Vec<String>,
    word: String,
    is_literal: bool,
    cfg: Option<&OperatorConfig>,
) -> Result<(), String> {
    if !is_literal && word.starts_with("<.") {
        let path = &word[1..];
        let cfg = cfg.ok_or_else(|| format!("cannot resolve {word} in this context"))?;
        if let Some(value) = cfg.get(path) {
            words.push(value.to_string());
            return Ok(());
        }
        if cfg.has_children(path) {
            return Err(format!("{path} is a subtree, not a leaf"));
        }
        return Err(format!("no value at {path}"));
    }
    if !is_literal && word.contains('@') {
        if let Some(cfg) = cfg {
            words.push(resolve_targets(&word, cfg)?);
        } else {
            words.push(word);
        }
        return Ok(());
    }
    words.push(word);
    Ok(())
}

pub fn resolve_target(raw: &str, cfg: &OperatorConfig) -> Result<String, String> {
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
        .map(std::string::ToString::to_string)
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
            let alias = before.find('.').map_or(before, |p| &before[..p]);
            let path = before.find('.').map_or("", |p| &before[p + 1..]);
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
        let cfg = OperatorConfig::new();
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
        let cfg = OperatorConfig::new();
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
    fn parses_z_document_verbs_as_local_crud() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".my.aliases.ma", "did:ma:runtime");

        assert_eq!(
            parse(".z.scheme!fetch /ipfs/bafy-source", &cfg),
            Ok(Command::LocalCrud {
                path: ".z.scheme".to_string(),
                op: DotOp::Meta("fetch".to_string()),
                args: vec!["/ipfs/bafy-source".to_string()],
            })
        );
        assert_eq!(
            parse(".z.scheme!eval", &cfg),
            Ok(Command::LocalCrud {
                path: ".z.scheme".to_string(),
                op: DotOp::Meta("eval".to_string()),
                args: vec![],
            })
        );
        assert_eq!(
            parse(".z.scheme!eval /ipfs/bafy-source", &cfg),
            Ok(Command::LocalCrud {
                path: ".z.scheme".to_string(),
                op: DotOp::Meta("eval".to_string()),
                args: vec!["/ipfs/bafy-source".to_string()],
            })
        );
        assert_eq!(
            parse(".z.scheme: (display \"ready\")", &cfg),
            Ok(Command::LocalCrud {
                path: ".z.scheme".to_string(),
                op: DotOp::Set("(display \"ready\")".to_string()),
                args: vec![],
            })
        );
        assert_eq!(
            parse(".z!publish @ma", &cfg),
            Ok(Command::LocalCrud {
                path: ".z".to_string(),
                op: DotOp::Meta("publish".to_string()),
                args: vec!["did:ma:runtime".to_string()],
            })
        );
    }

    #[test]
    fn dot_ctx_is_not_local_crud_root() {
        let cfg = OperatorConfig::new();
        let cmd = parse(".ctx.ma.url: http://localhost:5003", &cfg).expect("command should parse");

        assert!(matches!(cmd, Command::DotCommand { .. }));
    }

    #[test]
    fn bare_ipfs_path_is_plain_text() {
        let cfg = OperatorConfig::new();
        let input = "/ipfs/bafybeigdyrzt";

        assert_eq!(
            parse(input, &cfg),
            Ok(Command::PlainText(input.to_string()))
        );
    }

    #[test]
    fn local_crud_set_keeps_bare_ipfs_path_literal() {
        let cfg = OperatorConfig::new();

        assert_eq!(
            parse(".my.notes: /ipfs/bafybeigdyrzt", &cfg),
            Ok(Command::LocalCrud {
                path: ".my.notes".to_string(),
                op: DotOp::Set("/ipfs/bafybeigdyrzt".to_string()),
                args: vec![],
            })
        );
    }

    #[test]
    fn hash_ipfs_path_is_plain_text_outside_scheme() {
        let cfg = OperatorConfig::new();
        let input = "#/ipfs/bafybeigdyrzt";

        assert_eq!(
            parse(input, &cfg),
            Ok(Command::PlainText(input.to_string()))
        );
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
            shell_split(r"make thing 'Lars'\'' lamp'").unwrap(),
            vec!["make", "thing", "Lars' lamp"]
        );
    }

    #[test]
    fn shell_split_inserts_local_leaf_as_one_argument() {
        let mut cfg = OperatorConfig::new();
        let init = "(begin\n  (set-prop! \"name\" \"Lamp\")\n  (ma-save-state!))";
        cfg.set(".my.things.lamp", init);

        assert_eq!(
            shell_split_with_config("make thing <.my.things.lamp", &cfg).unwrap(),
            vec!["make", "thing", init]
        );
    }

    #[test]
    fn shell_split_expands_unquoted_alias_arguments() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".my.aliases.ma", "did:ma:runtime");

        assert_eq!(
            shell_split_with_config("drop @ma#duckie", &cfg).unwrap(),
            vec!["drop", "did:ma:runtime#duckie"]
        );
    }

    #[test]
    fn enter_command_preserves_nick_at_target_syntax() {
        let cfg = OperatorConfig::new();

        assert_eq!(
            parse(".enter Pondus@did:ma:runtime#concourse", &cfg),
            Ok(Command::DotCommand {
                path: ".enter".to_string(),
                op: DotOp::Get,
                args: vec!["Pondus@did:ma:runtime#concourse".to_string()],
            })
        );
    }

    #[test]
    fn shell_split_keeps_escaped_alias_arguments_literal() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".my.aliases.ma", "did:ma:runtime");

        assert_eq!(
            shell_split_with_config(r"drop \@ma#duckie", &cfg).unwrap(),
            vec!["drop", "@ma#duckie"]
        );
    }

    #[test]
    fn shell_split_without_config_leaves_at_words_alone() {
        assert_eq!(
            shell_split("say @ma#duckie").unwrap(),
            vec!["say", "@ma#duckie"]
        );
    }

    #[test]
    fn shell_split_does_not_insert_quoted_local_leaf_token() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".my.things.lamp", "lamp init");

        assert_eq!(
            shell_split_with_config("say '<.my.things.lamp'", &cfg).unwrap(),
            vec!["say", "<.my.things.lamp"]
        );
    }

    #[test]
    fn shell_split_rejects_missing_or_subtree_insert() {
        let mut cfg = OperatorConfig::new();
        cfg.set(".my.things.lamp.name", "Lamp");

        assert!(shell_split_with_config("make thing <.my.things.lamp", &cfg)
            .unwrap_err()
            .contains("subtree"));
        assert!(
            shell_split_with_config("make thing <.my.things.missing", &cfg)
                .unwrap_err()
                .contains("no value")
        );
    }

    #[test]
    fn shell_split_rejects_unclosed_quote() {
        assert!(shell_split(r#"dig north "the garden"#).is_err());
    }

    #[test]
    fn keeps_dot_ma_as_control_command() {
        let cfg = OperatorConfig::new();
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
    fn parses_dot_ma_trusted_runtime_setter() {
        let cfg = OperatorConfig::new();

        assert_eq!(
            parse(".ma: did:ma:trustedruntime", &cfg),
            Ok(Command::DotCommand {
                path: ".ma".to_string(),
                op: DotOp::Set("did:ma:trustedruntime".to_string()),
                args: vec![],
            })
        );
    }

    #[test]
    fn parses_dot_ma_claim_with_optional_port() {
        let cfg = OperatorConfig::new();

        assert_eq!(
            parse(".ma: claim", &cfg),
            Ok(Command::DotCommand {
                path: ".ma".to_string(),
                op: DotOp::Set("claim".to_string()),
                args: vec![],
            })
        );
        assert_eq!(
            parse(".ma: claim 5009", &cfg),
            Ok(Command::DotCommand {
                path: ".ma".to_string(),
                op: DotOp::Set("claim 5009".to_string()),
                args: vec![],
            })
        );
    }

    #[test]
    fn parses_did_target_without_verb() {
        let cfg = OperatorConfig::new();
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
        let cfg = OperatorConfig::new();
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
        let cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        assert!(parse("@sky#room!emote danser", &cfg).is_err());
    }

    #[test]
    fn keeps_colon_as_remote_actor_method() {
        let mut cfg = OperatorConfig::new();
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
    fn parses_fragment_target_with_actor_meta() {
        let mut cfg = OperatorConfig::new();
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
        let mut cfg = OperatorConfig::new();
        cfg.set(
            ".my.aliases.sky",
            "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3",
        );

        let cmd = parse("@sky#concourse!edit", &cfg).expect("command should parse");

        assert_eq!(
            cmd,
            Command::ActorMessage {
                target:
                    "did:ma:k51qzi5uqu5dgauzpw8f1ecgsnt6gm6fpxxu3vkqaj9bcm6h8vmjttajijged3#concourse"
                        .to_string(),
                verb: Some("behaviour".to_string()),
                meta: Some("edit".to_string()),
                body: String::new(),
            }
        );
    }
}
