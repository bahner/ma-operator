/// Scheme values and environments for the ma embedded evaluator.
use std::{cell::RefCell, collections::HashMap, fmt, rc::Rc};

// Import SchemeExpr for Lambda body storage.
use crate::scheme::parser::SchemeExpr;

// ── Environment ────────────────────────────────────────────────────────────

struct EnvInner {
    vars: HashMap<String, SchemeVal>,
    parent: Option<Env>,
}

/// A lexically-scoped environment frame.
/// `Rc<RefCell<…>>` gives cheap clone + interior mutability; safe in WASM
/// (single-threaded).
#[derive(Clone)]
pub struct Env(Rc<RefCell<EnvInner>>);

impl fmt::Debug for Env {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "#<env>")
    }
}

impl Env {
    /// New top-level (root) environment.
    pub fn new_root() -> Self {
        Env(Rc::new(RefCell::new(EnvInner {
            vars: HashMap::new(),
            parent: None,
        })))
    }

    /// New child environment extending `parent`.
    pub fn extend(parent: &Env) -> Self {
        Env(Rc::new(RefCell::new(EnvInner {
            vars: HashMap::new(),
            parent: Some(parent.clone()),
        })))
    }

    /// Look up a name, walking the parent chain.
    pub fn get(&self, name: &str) -> Option<SchemeVal> {
        let inner = self.0.borrow();
        if let Some(v) = inner.vars.get(name) {
            return Some(v.clone());
        }
        inner.parent.as_ref().and_then(|p| p.get(name))
    }

    /// Bind a name in this frame (creates or overwrites).
    pub fn define(&self, name: impl Into<String>, val: SchemeVal) {
        self.0.borrow_mut().vars.insert(name.into(), val);
    }

    /// Collect all bindings in this frame (not parent frames).
    pub fn own_bindings(&self) -> Vec<(String, SchemeVal)> {
        self.0
            .borrow()
            .vars
            .iter()
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect()
    }

    /// Mutate an existing binding anywhere in the chain (Scheme `set!`).
    /// Returns `Some(())` if found; `None` if the name is not bound.
    pub fn set_existing(&self, name: &str, val: SchemeVal) -> Option<()> {
        let has_locally = self.0.borrow().vars.contains_key(name);
        if has_locally {
            self.0.borrow_mut().vars.insert(name.to_string(), val);
            return Some(());
        }
        let parent = self.0.borrow().parent.clone();
        parent?.set_existing(name, val)
    }
}

// ── Value ──────────────────────────────────────────────────────────────────

#[derive(Clone, Debug)]
pub enum SchemeVal {
    /// UTF-8 string.
    Str(String),
    /// 64-bit signed integer.
    Int(i64),
    /// 64-bit float.
    Float(f64),
    /// Boolean.
    Bool(bool),
    /// Empty list / null.
    Nil,
    /// A proper list.
    List(Vec<SchemeVal>),
    /// A ma dot-path reference: `.my.aliases.sky`, `.my.doc.poem!publish`, etc.
    MaPath(String),
    /// A ma actor target: `@ma#house:enter`, `did:ma:abc#room:enter`, etc.
    MaActor(String),
    /// A named builtin function.
    Builtin(String),
    /// A user-defined lambda closure.
    Lambda {
        params: Vec<String>,
        /// Optional variadic rest parameter (collects extra args as a list).
        rest: Option<String>,
        body: Vec<SchemeExpr>,
        env: Env,
    },
}

impl SchemeVal {
    /// Human-readable representation (for `display`, error messages).
    pub fn display(&self) -> String {
        match self {
            SchemeVal::Str(s) => s.clone(),
            SchemeVal::Int(n) => n.to_string(),
            SchemeVal::Float(f) => f.to_string(),
            SchemeVal::Bool(true) => "#t".to_string(),
            SchemeVal::Bool(false) => "#f".to_string(),
            SchemeVal::Nil => "()".to_string(),
            SchemeVal::List(v) => {
                let inner: Vec<_> = v.iter().map(|x| x.repr()).collect();
                format!("({})", inner.join(" "))
            }
            SchemeVal::MaPath(p) => p.clone(),
            SchemeVal::MaActor(a) => a.clone(),
            SchemeVal::Builtin(n) => format!("#<procedure:{n}>"),
            SchemeVal::Lambda { .. } => "#<lambda>".to_string(),
        }
    }

    /// `write`-style representation (strings are quoted).
    pub fn repr(&self) -> String {
        match self {
            SchemeVal::Str(s) => format!("{s:?}"),
            other => other.display(),
        }
    }

    /// For command-string substitution: returns the raw string value.
    /// Lambdas and builtins are not spliceable — call `to_splice()` for
    /// proper error handling.
    pub fn to_splice_lossy(&self) -> String {
        match self {
            SchemeVal::Str(s) => s.clone(),
            SchemeVal::Nil => String::new(),
            SchemeVal::List(v) => v
                .iter()
                .map(|x| x.to_splice_lossy())
                .collect::<Vec<_>>()
                .join(" "),
            other => other.display(),
        }
    }

    /// For command-string substitution: errors on non-spliceable values
    /// (lambdas, builtins).
    pub fn to_splice(&self) -> Result<String, String> {
        match self {
            SchemeVal::Lambda { .. } => {
                Err("cannot splice a lambda into a command string".to_string())
            }
            SchemeVal::Builtin(n) => {
                Err(format!("cannot splice builtin '{n}' into a command string"))
            }
            other => Ok(other.to_splice_lossy()),
        }
    }

    /// Scheme truthiness: everything is truthy except `#f` and `()`.
    pub fn is_truthy(&self) -> bool {
        !matches!(self, SchemeVal::Bool(false) | SchemeVal::Nil)
    }
}
