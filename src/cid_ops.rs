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

#[cfg(test)]
mod tests {
    use super::*;

    // ── find_op ───────────────────────────────────────────────────────────

    #[test]
    fn find_op_cat_suffix() {
        let result = find_op("alice.fil:cat");
        assert!(result.is_some());
        let (base, op) = result.unwrap();
        assert_eq!(base, "alice.fil");
        assert_eq!(op, "cat");
    }

    #[test]
    fn find_op_wc_suffix() {
        let (base, op) = find_op("readme.txt:wc").unwrap();
        assert_eq!(base, "readme.txt");
        assert_eq!(op, "wc");
    }

    #[test]
    fn find_op_head_suffix() {
        let (base, op) = find_op("log:head").unwrap();
        assert_eq!(base, "log");
        assert_eq!(op, "head");
    }

    #[test]
    fn find_op_tail_suffix() {
        let (base, op) = find_op("log:tail").unwrap();
        assert_eq!(base, "log");
        assert_eq!(op, "tail");
    }

    #[test]
    fn find_op_no_match() {
        assert!(find_op("alice.fil:ping").is_none());
        assert!(find_op("alice.fil").is_none());
        assert!(find_op(":cat").is_none()); // empty base
    }

    #[test]
    fn find_op_nested_path() {
        let (base, op) = find_op("my.doc.readme:cat").unwrap();
        assert_eq!(base, "my.doc.readme");
        assert_eq!(op, "cat");
    }

    // ── op_cat ────────────────────────────────────────────────────────────

    #[test]
    fn cat_returns_lines() {
        let content = "hello\nworld\nfoo";
        let out = apply("cat", content, &[]);
        assert_eq!(out, vec!["hello", "world", "foo"]);
    }

    #[test]
    fn cat_empty_content() {
        let out = apply("cat", "", &[]);
        assert!(out.is_empty());
    }

    #[test]
    fn cat_truncates_at_200_lines() {
        let content: String = (0..250).map(|i| format!("line {i}\n")).collect();
        let out = apply("cat", &content, &[]);
        // 200 content lines + 1 truncation notice
        assert_eq!(out.len(), 201);
        // The truncation notice is either a translated string or the i18n key fallback
        assert!(!out[200].is_empty());
    }

    #[test]
    fn cat_binary_content_returns_notice() {
        let out = apply("cat", "hello\0world", &[]);
        assert_eq!(out.len(), 1);
        // Falls back to key name since i18n not initialised in tests
        assert!(out[0].contains("binary") || out[0] == "cid-op-binary");
    }

    // ── op_head ───────────────────────────────────────────────────────────

    #[test]
    fn head_default_10_lines() {
        let content: String = (1..=20).map(|i| format!("line {i}\n")).collect();
        let out = apply("head", &content, &[]);
        assert_eq!(out.len(), 10);
        assert_eq!(out[0], "line 1");
        assert_eq!(out[9], "line 10");
    }

    #[test]
    fn head_custom_n() {
        let content = "a\nb\nc\nd\ne";
        let out = apply("head", content, &["3"]);
        assert_eq!(out, vec!["a", "b", "c"]);
    }

    #[test]
    fn head_more_than_available() {
        let content = "a\nb";
        let out = apply("head", content, &["100"]);
        assert_eq!(out, vec!["a", "b"]);
    }

    #[test]
    fn head_binary_returns_notice() {
        let out = apply("head", "a\0b", &[]);
        assert_eq!(out.len(), 1);
        assert!(out[0].contains("binary") || out[0] == "cid-op-binary");
    }

    // ── op_tail ───────────────────────────────────────────────────────────

    #[test]
    fn tail_default_10_lines() {
        let content: String = (1..=20).map(|i| format!("line {i}\n")).collect();
        let out = apply("tail", &content, &[]);
        assert_eq!(out.len(), 10);
        assert_eq!(out[0], "line 11");
        assert_eq!(out[9], "line 20");
    }

    #[test]
    fn tail_custom_n() {
        let content = "a\nb\nc\nd\ne";
        let out = apply("tail", content, &["2"]);
        assert_eq!(out, vec!["d", "e"]);
    }

    #[test]
    fn tail_more_than_available() {
        let content = "a\nb";
        let out = apply("tail", content, &["100"]);
        assert_eq!(out, vec!["a", "b"]);
    }

    // ── op_wc ─────────────────────────────────────────────────────────────

    #[test]
    fn wc_lines_flag() {
        let content = "one\ntwo\nthree";
        let out = apply("wc", content, &["-l"]);
        assert_eq!(out, vec!["3"]);
    }

    #[test]
    fn wc_no_flag_returns_one_line() {
        let content = "hello world\nfoo bar baz";
        let out = apply("wc", content, &[]);
        assert_eq!(out.len(), 1);
        // Contains the counts — key name fallback or real translation
        assert!(out[0].contains("2") || out[0].contains("5") || out[0].contains("wc"));
    }

    #[test]
    fn wc_empty() {
        let out = apply("wc", "", &["-l"]);
        assert_eq!(out, vec!["0"]);
    }

    // ── unknown op ────────────────────────────────────────────────────────

    #[test]
    fn apply_unknown_op_returns_message() {
        let out = apply("nonexistent", "content", &[]);
        assert_eq!(out.len(), 1);
    }
}
