/// CID content operations for inline file viewing.
///
/// These are applied client-side after a CRUD GET returns a CID:
///   `@sky:alice.fil:cat`   — display full text content
///   `@sky:alice.fil:wc`    — line / word / char count
///   `@sky:alice.fil:wc -l` — line count only
///
/// Adding a new operation: append one `CidOp` entry to `OPS`.
/// No other code needs to change.
use crate::i18n::{t, tf};

/// Maximum lines printed by `:cat` to avoid flooding the terminal.
const MAX_CAT_LINES: usize = 200;

// ── Op table ──────────────────────────────────────────────────────────────

type OpFn = fn(&str, &[&str]) -> Vec<String>;

pub struct CidOp {
    pub name: &'static str,
    pub handler: OpFn,
}

pub static OPS: &[CidOp] = &[
    CidOp {
        name: "cat",
        handler: op_cat,
    },
    CidOp {
        name: "head",
        handler: op_head,
    },
    CidOp {
        name: "tail",
        handler: op_tail,
    },
    CidOp {
        name: "wc",
        handler: op_wc,
    },
];

// ── Public API ────────────────────────────────────────────────────────────

/// If `verb` ends with `":<op_name>"` for a known op, return
/// `(base_verb, op_name)`.  Returns `None` if no op suffix matches.
///
/// Example: `find_op("alice.fil:cat")` → `Some(("alice.fil", "cat"))`.
pub fn find_op(verb: &str) -> Option<(String, &'static str)> {
    for op in OPS {
        let suffix = format!(":{}", op.name);
        if let Some(base) = verb.strip_suffix(suffix.as_str()) {
            if !base.is_empty() {
                return Some((base.to_string(), op.name));
            }
        }
    }
    None
}

/// Apply a named operation to `content` and return the output lines.
pub fn apply(op_name: &str, content: &str, args: &[&str]) -> Vec<String> {
    OPS.iter()
        .find(|op| op.name == op_name)
        .map(|op| (op.handler)(content, args))
        .unwrap_or_else(|| vec![tf("cid-op-unknown", &[("op", op_name)])])
}

// ── Handlers ──────────────────────────────────────────────────────────────

fn op_cat(content: &str, _args: &[&str]) -> Vec<String> {
    if content.contains('\0') {
        return vec![t("cid-op-binary")];
    }
    let mut lines: Vec<String> = content
        .lines()
        .take(MAX_CAT_LINES)
        .map(str::to_string)
        .collect();
    if content.lines().count() > MAX_CAT_LINES {
        lines.push(tf(
            "cid-op-cat-truncated",
            &[("n", &MAX_CAT_LINES.to_string())],
        ));
    }
    lines
}

fn op_head(content: &str, args: &[&str]) -> Vec<String> {
    if content.contains('\0') {
        return vec![t("cid-op-binary")];
    }
    let n = args
        .first()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(10);
    content.lines().take(n).map(str::to_string).collect()
}

fn op_tail(content: &str, args: &[&str]) -> Vec<String> {
    if content.contains('\0') {
        return vec![t("cid-op-binary")];
    }
    let n = args
        .first()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(10);
    let all: Vec<&str> = content.lines().collect();
    let start = all.len().saturating_sub(n);
    all[start..].iter().map(|s| s.to_string()).collect()
}

fn op_wc(content: &str, args: &[&str]) -> Vec<String> {
    let line_count = content.lines().count();
    if args.contains(&"-l") {
        return vec![line_count.to_string()];
    }
    let word_count = content.split_whitespace().count();
    let char_count = content.chars().count();
    vec![tf(
        "cid-op-wc",
        &[
            ("lines", &line_count.to_string()),
            ("words", &word_count.to_string()),
            ("chars", &char_count.to_string()),
        ],
    )]
}
