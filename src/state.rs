use leptos::prelude::*;
use ma_core::{Inbox, Message};
use serde::{Deserialize, Serialize};
use std::cell::RefCell;
use std::rc::Rc;

// ── Session ────────────────────────────────────────────────────────────────

#[derive(Clone, Debug, PartialEq)]
pub struct SessionState {
    pub username: String,
    /// iroh QUIC transport secret key bytes
    pub iroh_key: [u8; 32],
    /// IPNS signing key bytes
    pub ipns_secret_key: [u8; 32],
    /// DID signing key (Ed25519) bytes
    pub did_signing_key: [u8; 32],
    /// Sender's bare DID, e.g. "did:ma:k51qzi5…"
    pub sender_did: String,
}

// ── Terminal output ────────────────────────────────────────────────────────

#[derive(Clone, Debug, PartialEq)]
pub struct TerminalLine {
    pub id: u64,
    pub text: String,
    pub kind: LineKind,
}

#[derive(Clone, Debug, PartialEq)]
pub enum LineKind {
    Output,
    Input,
    Error,
    System,
}

#[derive(Clone, Debug, PartialEq)]
pub struct FocusMode {
    pub target: String,
    pub prompt: String,
}

// ── App state (reactive) ───────────────────────────────────────────────────

#[derive(Clone)]
pub struct AppState {
    pub session: RwSignal<Option<SessionState>>,
    pub lines: RwSignal<Vec<TerminalLine>>,
    pub history: RwSignal<Vec<String>>,
    /// Current .use actor target + prompt label.
    pub focus_actor: RwSignal<Option<FocusMode>>,
    pub screensaver: RwSignal<bool>,
    line_counter: RwSignal<u64>,
}

impl AppState {
    pub fn new() -> Self {
        Self {
            session: RwSignal::new(None),
            lines: RwSignal::new(Vec::new()),
            history: RwSignal::new(Vec::new()),
            focus_actor: RwSignal::new(None),
            screensaver: RwSignal::new(false),
            line_counter: RwSignal::new(0),
        }
    }

    pub fn push_line(&self, text: impl Into<String>, kind: LineKind) {
        let id = self.line_counter.get_untracked();
        self.line_counter.set(id + 1);
        self.lines.update(|v| {
            v.push(TerminalLine {
                id,
                text: text.into(),
                kind,
            })
        });
    }

    pub fn push_output(&self, text: impl Into<String>) {
        self.push_line(text, LineKind::Output);
    }

    pub fn push_error(&self, text: impl Into<String>) {
        self.push_line(text, LineKind::Error);
    }

    pub fn push_system(&self, text: impl Into<String>) {
        self.push_line(text, LineKind::System);
    }

    pub fn push_input(&self, text: impl Into<String>) {
        self.push_line(text, LineKind::Input);
    }
}

impl Default for AppState {
    fn default() -> Self {
        Self::new()
    }
}

// ── Stored bundle entry (in IndexedDB) ────────────────────────────────────

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct StoredIdentity {
    pub username: String,
    /// BrowserIdentityExport serialized as JSON
    pub export_json: String,
}

// ── Thread-local non-reactive globals ─────────────────────────────────────

thread_local! {
    /// The active iroh endpoint after login.
    pub static ENDPOINT: RefCell<Option<Rc<dyn ma_core::MaEndpoint>>> =
        RefCell::new(None);
    /// iroh transport secret key bytes for active session (used for lazy reconnect).
    pub static SESSION_IROH_KEY: RefCell<Option<[u8; 32]>> =
        RefCell::new(None);
    /// IPNS signing key bytes for the active session (used for IPFS publishing).
    pub static SESSION_IPNS_KEY: RefCell<Option<[u8; 32]>> =
        RefCell::new(None);
    /// The inbox registered on the endpoint for the default inbox protocol.
    pub static SESSION_INBOX: RefCell<Option<Inbox<Message>>> =
        RefCell::new(None);
    /// DID signing key bytes for the active session.
    pub static SESSION_SIGNING_KEY: RefCell<Option<[u8; 32]>> =
        RefCell::new(None);
    /// Sender DID string for the active session.
    pub static SESSION_SENDER_DID: RefCell<Option<String>> =
        RefCell::new(None);
}
