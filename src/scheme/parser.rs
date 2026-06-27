/// S-expression lexer and parser for the ma Scheme evaluator.

// ── AST ────────────────────────────────────────────────────────────────────

#[derive(Clone, Debug)]
pub enum SchemeExpr {
    /// `()` / `nil` — the empty list.
    #[allow(dead_code)]
    Nil,
    /// A quoted string literal: `"hello"`.
    Str(String),
    /// Any other token: symbol, number, keyword, path, actor target, …
    Atom(String),
    /// A parenthesised form: `(f a b …)`.
    List(Vec<SchemeExpr>),
}

// ── Errors ─────────────────────────────────────────────────────────────────

#[derive(Debug)]
pub struct LexError(pub String);

impl std::fmt::Display for LexError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
}

// ── Lexer ──────────────────────────────────────────────────────────────────

/// Tokenise a Scheme source string.
///
/// Tokens are plain `String`s:
/// - `"("` and `")"` — parentheses
/// - `"\"…\""` — quoted string literal (outer quotes preserved as markers)
/// - `"'QUOTE"` — quote shorthand sentinel (`'expr` → `(quote expr)`)
/// - anything else — atom
///
/// Comments (`;` to end of line) are stripped.
pub fn tokenize(input: &str) -> Result<Vec<String>, LexError> {
    let mut tokens = Vec::new();
    let mut chars = input.chars().peekable();

    while let Some(&ch) = chars.peek() {
        match ch {
            // Whitespace
            ' ' | '\t' | '\n' | '\r' => {
                chars.next();
            }
            // Parentheses
            '(' => {
                chars.next();
                tokens.push("(".to_string());
            }
            ')' => {
                chars.next();
                tokens.push(")".to_string());
            }
            // Quoted string
            '"' => {
                chars.next(); // consume opening `"`
                let mut s = String::new();
                let mut escaped = false;
                loop {
                    match chars.next() {
                        None => return Err(LexError("unterminated string literal".to_string())),
                        Some('\\') if !escaped => {
                            escaped = true;
                        }
                        Some('"') if !escaped => break,
                        Some(c) => {
                            if escaped {
                                match c {
                                    'n' => s.push('\n'),
                                    't' => s.push('\t'),
                                    'r' => s.push('\r'),
                                    '\\' => s.push('\\'),
                                    '"' => s.push('"'),
                                    other => {
                                        s.push('\\');
                                        s.push(other);
                                    }
                                }
                                escaped = false;
                            } else {
                                s.push(c);
                            }
                        }
                    }
                }
                // Wrap in quotes so the parser can identify string tokens.
                tokens.push(format!("\"{s}\""));
            }
            // Line comment
            ';' => while chars.next().map(|c| c != '\n').unwrap_or(false) {},
            // Quote shorthand: 'expr → (quote expr)
            // Emits a sentinel token; parse_expr wraps the next expression.
            '\'' => {
                chars.next();
                tokens.push("'QUOTE".to_string());
            }
            // Atom
            _ => {
                let mut atom = String::new();
                while let Some(&c) = chars.peek() {
                    if c == ' '
                        || c == '\t'
                        || c == '\n'
                        || c == '\r'
                        || c == '('
                        || c == ')'
                        || c == ';'
                    {
                        break;
                    }
                    atom.push(c);
                    chars.next();
                }
                if !atom.is_empty() {
                    tokens.push(atom);
                }
            }
        }
    }

    Ok(tokens)
}

// ── Parser ─────────────────────────────────────────────────────────────────

/// Parse one S-expression from `tokens` starting at `pos`.
///
/// Returns `(expr, next_pos)` on success.
pub fn parse_expr(tokens: &[String], pos: usize) -> Result<(SchemeExpr, usize), LexError> {
    if pos >= tokens.len() {
        return Err(LexError("unexpected end of input".to_string()));
    }

    let token = &tokens[pos];

    if token == "(" {
        // Parse a list.
        let mut forms = Vec::new();
        let mut i = pos + 1;
        loop {
            if i >= tokens.len() {
                return Err(LexError("missing closing ')'".to_string()));
            }
            if tokens[i] == ")" {
                return Ok((SchemeExpr::List(forms), i + 1));
            }
            let (expr, next) = parse_expr(tokens, i)?;
            forms.push(expr);
            i = next;
        }
    } else if token == "'QUOTE" {
        // 'expr → (quote expr): parse the next expression and wrap it.
        let (inner, next_pos) = parse_expr(tokens, pos + 1)?;
        Ok((
            SchemeExpr::List(vec![SchemeExpr::Atom("quote".to_string()), inner]),
            next_pos,
        ))
    } else if token == ")" {
        Err(LexError("unexpected ')'".to_string()))
    } else if token.starts_with('"') && token.ends_with('"') && token.len() >= 2 {
        // String literal (the wrapping quotes are our markers, not content).
        let inner = token[1..token.len() - 1].to_string();
        Ok((SchemeExpr::Str(inner), pos + 1))
    } else {
        Ok((SchemeExpr::Atom(token.clone()), pos + 1))
    }
}
