/// Embedded Scheme evaluator for the ma terminal.
///
/// # Usage
///
/// Any command line containing `(…)` is pre-processed by `expand()` before
/// normal parsing.  Each `(…)` span is evaluated as a Scheme expression and
/// the result is spliced back into the line as a string.
///
/// ## ma primitives
///
/// Inside a Scheme expression the *existing* ma grammar is available as
/// first-class primitives — no new function names:
///
/// | Scheme form | What it does |
/// |---|---|
/// | `(.my.aliases.sky)` | dot-path get (sync, returns string) |
/// | `(.my.config.k: "v")` | dot-path set (sync, returns nil) |
/// | `(@ma#house:enter #room)` | actor RPC (async, returns reply string) |
/// | `(did:ma:abc#room:enter ticket)` | same, DID in function position |
///
/// ## Scheme features
///
/// `define`, `lambda`, `let`, `let*`, `letrec`, `if`, `cond`, `begin`,
/// `and`, `or`, `when`, `unless`, `set!`, `quote`.
///
/// Builtins: arithmetic (`+` `-` `*` `/` `mod`), comparison (`=` `<` …),
/// list operations (`cons`, `car`, `cdr`, `map`, `filter`, `fold`, …),
/// string operations (`string-append`, `substring`, …), predicates,
/// `display`, `error`, `assert`.
///
/// ## Session environment
///
/// Definitions made with `(define …)` persist in the session environment
/// for the lifetime of the login session.  Call `reset_session_env()` on
/// logout to clear it.
pub mod eval;
pub mod parser;
pub mod value;

pub use eval::{Ctx, EvalCtx};
pub use value::{Env, SchemeVal};

use std::cell::RefCell;
use std::rc::Rc;

use leptos::prelude::RwSignal;

use crate::{config::EgoConfig, state::AppState};

// ── Session environment ────────────────────────────────────────────────────

thread_local! {
    static SESSION_ENV: RefCell<Option<Env>> = const { RefCell::new(None) };
}

/// Initialise a fresh session environment. Called at login.
pub fn init_session_env() {
    SESSION_ENV.with(|e| *e.borrow_mut() = Some(Env::new_root()));
}

/// Clear the session environment. Called at logout.
pub fn reset_session_env() {
    SESSION_ENV.with(|e| *e.borrow_mut() = None);
}

/// Return the current session environment, creating one if needed.
fn get_env() -> Env {
    SESSION_ENV.with(|e| {
        let mut inner = e.borrow_mut();
        if inner.is_none() {
            *inner = Some(Env::new_root());
        }
        inner.as_ref().unwrap().clone()
    })
}

// ── Public API ─────────────────────────────────────────────────────────────

/// Returns `true` when `line` contains at least one unescaped `(` that
/// could be a Scheme expression requiring expansion.
pub fn needs_expansion(line: &str) -> bool {
    let mut in_string = false;
    let mut escaped = false;
    for ch in line.chars() {
        if escaped {
            escaped = false;
            continue;
        }
        if ch == '\\' && in_string {
            escaped = true;
            continue;
        }
        if ch == '"' {
            in_string = !in_string;
            continue;
        }
        if in_string {
            continue;
        }
        if ch == '(' {
            return true;
        }
    }
    false
}

/// Expand all top-level `(…)` spans in `line`.
///
/// Each span is evaluated as a Scheme expression (with nested spans evaluated
/// inside-out by the Scheme evaluator) and the string result is spliced back
/// at the span's position.  The returned string is a normal ma command line
/// ready for `dispatch_eval_line`.
pub async fn expand(
    line: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<String, String> {
    let ctx = Rc::new(EvalCtx {
        state: state.clone(),
        config,
    });
    let env = get_env();

    let chars: Vec<char> = line.chars().collect();
    let mut result = String::new();
    let mut pos = 0;

    while pos < chars.len() {
        if chars[pos] == '(' {
            let (end, span) = find_balanced_paren(&chars, pos)
                .ok_or_else(|| format!("unmatched '(' at column {}", pos + 1))?;
            let val = eval_span(&span, env.clone(), ctx.clone()).await?;
            result.push_str(&val.to_splice()?);
            pos = end + 1;
        } else {
            result.push(chars[pos]);
            pos += 1;
        }
    }

    Ok(result)
}

// ── Internal helpers ───────────────────────────────────────────────────────

/// Find the closing paren matching the `(` at `chars[start]`.
///
/// Correctly handles:
/// - nested parentheses
/// - string literals (parens inside strings are ignored)
/// - `\"` escape sequences inside strings
///
/// Returns `(end_index, full_span_string)` on success.
fn find_balanced_paren(chars: &[char], start: usize) -> Option<(usize, String)> {
    debug_assert_eq!(chars[start], '(');
    let mut depth: usize = 0;
    let mut in_string = false;
    let mut escaped = false;

    for (i, &ch) in chars.iter().enumerate().skip(start) {
        if escaped {
            escaped = false;
            continue;
        }
        if ch == '\\' && in_string {
            escaped = true;
            continue;
        }
        if ch == '"' {
            in_string = !in_string;
            continue;
        }
        if in_string {
            continue;
        }
        if ch == '(' {
            depth += 1;
        } else if ch == ')' {
            depth -= 1;
            if depth == 0 {
                let s: String = chars[start..=i].iter().collect();
                return Some((i, s));
            }
        }
    }
    None
}

/// Parse and evaluate one `(…)` span string.
async fn eval_span(span: &str, env: Env, ctx: Ctx) -> Result<SchemeVal, String> {
    use parser::{parse_expr, tokenize};
    let tokens = tokenize(span).map_err(|e| e.to_string())?;
    let (expr, _) = parse_expr(&tokens, 0).map_err(|e| e.to_string())?;
    eval::eval(expr, env, ctx).await.map_err(|e| e.to_string())
}
