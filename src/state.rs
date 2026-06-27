use futures::channel::oneshot;
use leptos::prelude::*;
use ma_core::{Inbox, IpfsGatewayResolver, Message};
use serde::{Deserialize, Serialize};
use std::cell::RefCell;
use std::collections::{HashMap, VecDeque};
use std::rc::Rc;

/// (sender, sent_at_ms) for Scheme RPC reply channels.
type SchemeSender = (oneshot::Sender<Result<String, String>>, f64);

use crate::config::EgoConfig;
use crate::core::{CommandRecord, CommandStatus, Entry, IncomingRecord, SystemKind, SystemRecord};
use crate::views::editor::EditorMode;
use leptos::prelude::ArcRwSignal;

// ── Session ────────────────────────────────────────────────────────────────

#[derive(Clone, Debug, PartialEq)]
pub struct SessionState {
    pub username: String,
    pub iroh_key: [u8; 32],
    pub ipns_secret_key: [u8; 32],
    pub did_signing_key: [u8; 32],
    pub did_encryption_key: [u8; 32],
    pub sender_did: String,
    pub created_at: String,
}

// ── Focus mode ─────────────────────────────────────────────────────────────

#[derive(Clone, Debug, PartialEq)]
pub struct FocusMode {
    pub target: String,
    pub prompt: String,
    /// Optional sticky verb applied to bare-text input (e.g. "say").
    /// Set via `.use @sky#room:say` — every plain line becomes `:say line`.
    pub default_verb: Option<String>,
}

// ── Pending request kinds ─────────────────────────────────────────────────

/// Unified tag for every in-flight outgoing message.  Keyed by
/// `ma_core::Message.id`; stored in `AppState::pending_requests`.
#[derive(Clone, Debug)]
pub enum PendingKind {
    /// One-shot send: just resolve the command status when the reply arrives.
    Simple { cmd_id: u64 },
    /// IPFS-store reply should trigger a CRUD SET (returned CID becomes the value).
    IpfsCrud {
        target_did: String,
        crud_path: String,
        cmd_id: Option<u64>,
    },
    /// Second-leg CRUD SET confirmation (end of IPFS-store → CRUD-SET flow).
    CrudConfirm { cmd_id: u64 },
    /// CRUD GET reply should fetch the returned CID and apply a text op.
    CidOp {
        op: String,
        args: Vec<String>,
        cmd_id: u64,
    },
    /// CRUD GET reply should open the editor with the received content.
    EditOpen {
        target: String,
        crud_path: String,
        editor_mode: EditorMode,
        cmd_id: u64,
    },
    /// IPFS-store reply should register a new kind via CRUD SET on `.kinds`.
    IpfsKindUpsert {
        target_did: String,
        protocol_id: String,
        cmd_id: Option<u64>,
    },
    /// IPFS-store reply (profile blob) should trigger DID doc republish.
    ProfilePublish {
        publisher_did: String,
        cmd_id: Option<u64>,
    },
}

impl PendingKind {
    /// Return the `cmd_id` to fail when this pending request expires.
    /// Returns `None` for variants where no command is associated.
    pub fn cmd_id(&self) -> Option<u64> {
        match self {
            PendingKind::Simple { cmd_id } => Some(*cmd_id),
            PendingKind::CrudConfirm { cmd_id } => Some(*cmd_id),
            PendingKind::CidOp { cmd_id, .. } => Some(*cmd_id),
            PendingKind::EditOpen { cmd_id, .. } => Some(*cmd_id),
            PendingKind::IpfsCrud { cmd_id, .. } => *cmd_id,
            PendingKind::IpfsKindUpsert { cmd_id, .. } => *cmd_id,
            PendingKind::ProfilePublish { cmd_id, .. } => *cmd_id,
        }
    }
}

/// Default TTL for non-batch outgoing messages (milliseconds).
pub const DEFAULT_TIMEOUT_MS: u32 = 60_000;

// ── Tracked request ───────────────────────────────────────────────────

/// A `PendingKind` plus the id of the batch it belongs to (if any).
#[derive(Clone, Debug)]
pub struct TrackedRequest {
    pub kind: PendingKind,
    /// Batch this request belongs to, if any.
    #[allow(dead_code)]
    pub batch_id: Option<u64>,
    /// `js_sys::Date::now()` when the request was registered (ms since epoch).
    pub sent_at_ms: f64,
}

// ── Batch types ─────────────────────────────────────────────────────────

#[derive(Clone, Debug, PartialEq)]
pub enum BatchMode {
    Sync,
    Async,
}

#[derive(Clone, Debug, PartialEq)]
pub enum OnError {
    Break,
    Continue,
}

#[derive(Clone, Debug)]
pub struct ActiveBatch {
    #[allow(dead_code)]
    pub id: u64,
    pub mode: BatchMode,
    /// Timeout per step (Sync) or per command (Async), in milliseconds.
    pub timeout_ms: u32,
    pub on_error: OnError,
    /// `js_sys::Date::now()` when dispatch started (reset when `.batch` closes).
    pub started_at_ms: f64,
    /// Still accumulating lines (between `.batch:sync/async` and `.batch`).
    pub collecting: bool,
    /// Lines pending dispatch.
    pub lines: VecDeque<String>,
    /// Sync only: cmd_id currently being waited on; `None` = ready to advance.
    pub sync_cmd_id: Option<u64>,
    /// Whether any step has errored.
    pub had_error: bool,
    /// Terminal entry id for the `.batch:sync/async` header line.
    pub header_cmd_id: u64,
    /// Async only: number of still-unresolved steps.
    pub async_pending: u32,
    /// Total dispatched step count (for summary output).
    pub step_count: u32,
}

// ── Outbox task queue ─────────────────────────────────────────────────────

/// Every outgoing iroh send is wrapped in this enum and queued for
/// serial execution by the dispatch loop.  This avoids concurrent
/// `outbox()` calls on the WASM single-threaded runtime.
#[derive(Clone, Debug)]
pub enum OutboxTask {
    /// A user-typed actor message (primary send from eval_actor).
    Actor {
        target: String,
        verb: Option<String>,
        body: String,
        cmd_id: u64,
        config: leptos::prelude::RwSignal<crate::config::EgoConfig>,
    },
    /// CRUD SET triggered by an incoming IPFS-store reply.
    CrudSet {
        target_did: String,
        crud_path: String,
        value: ciborium::Value,
        /// `cmd_id` of the originating command, registered as `CrudConfirm` on success.
        cmd_id: Option<u64>,
    },
    /// DID-document republish triggered by a profile-publish reply.
    IpfsPublish {
        ma_did: String,
        cid_str: String,
        cid_key: String,
        own_username: String,
        cmd_id: Option<u64>,
        config: leptos::prelude::RwSignal<crate::config::EgoConfig>,
    },
    /// Auto-pong reply to an incoming `:ping`.
    RpcPong { target: String, reply_to_id: String },
}

// ── App state (reactive) ───────────────────────────────────────────────────

#[derive(Clone)]
pub struct AppState {
    pub session: RwSignal<Option<SessionState>>,
    /// Unified terminal buffer: commands, incoming messages and system lines.
    pub entries: RwSignal<Vec<Entry>>,
    pub history: RwSignal<Vec<String>>,
    pub focus_actor: RwSignal<Option<FocusMode>>,
    pub screensaver: RwSignal<bool>,
    /// All in-flight outgoing messages, keyed by `ma_core::Message.id`.
    /// Each entry describes what to do when the reply arrives.
    pub pending_requests: RwSignal<HashMap<String, TrackedRequest>>,
    /// Cache of resolved DID documents and fetched CID contents.
    /// Key: DID string or CID string.  Value: parsed JSON document.
    pub doc_cache: RwSignal<HashMap<String, serde_json::Value>>,
    entry_counter: RwSignal<u64>,
    pub lang: RwSignal<String>,
    /// Pre-filled input text from URL params (`?chat=` / `?say=`).
    /// Set at app startup, consumed once by InputBar after login.
    pub prefill_input: RwSignal<Option<String>>,
    /// Context target from `?ctx=` URL param — e.g. `did:ma:xyz#room`.
    /// Consumed once by `startup_load_config` to call `.use` after login.
    pub startup_ctx: RwSignal<Option<String>>,
    /// FIFO queue of raw input lines waiting to be dispatched.
    pub input_queue: RwSignal<VecDeque<String>>,
    /// All active batches, keyed by batch id.
    pub batches: RwSignal<HashMap<u64, ActiveBatch>>,
    /// Counter for generating unique batch ids.
    pub batch_id_counter: RwSignal<u64>,
    /// Maps cmd_id → batch_id for commands dispatched as batch steps.
    pub cmd_to_batch: RwSignal<HashMap<u64, u64>>,
    /// Queue of all outgoing iroh sends, drained each dispatch tick.
    pub outbox_queue: RwSignal<VecDeque<OutboxTask>>,
    /// Oneshot senders for in-flight Scheme RPC calls, keyed by `Message.id`.
    /// Registered by `scheme::eval_ma_actor`; resolved by `inbox_poll::dispatch_reply`.
    pub scheme_senders: RwSignal<HashMap<String, SchemeSender>>,
}

impl AppState {
    pub fn new() -> Self {
        Self {
            session: RwSignal::new(None),
            entries: RwSignal::new(Vec::new()),
            history: RwSignal::new(Vec::new()),
            focus_actor: RwSignal::new(None),
            screensaver: RwSignal::new(false),
            pending_requests: RwSignal::new(HashMap::new()),
            doc_cache: RwSignal::new(HashMap::new()),
            entry_counter: RwSignal::new(0),
            lang: RwSignal::new("en".to_string()),
            prefill_input: RwSignal::new(None),
            startup_ctx: RwSignal::new(None),
            input_queue: RwSignal::new(VecDeque::new()),
            batches: RwSignal::new(HashMap::new()),
            batch_id_counter: RwSignal::new(0),
            cmd_to_batch: RwSignal::new(HashMap::new()),
            outbox_queue: RwSignal::new(VecDeque::new()),
            scheme_senders: RwSignal::new(HashMap::new()),
        }
    }

    /// Allocate a fresh unique batch id.
    pub fn new_batch_id(&self) -> u64 {
        let id = self.batch_id_counter.get_untracked();
        self.batch_id_counter.set(id + 1);
        id
    }

    fn next_id(&self) -> u64 {
        let id = self.entry_counter.get_untracked();
        self.entry_counter.set(id + 1);
        id
    }

    /// Peek at the next entry id without consuming it.
    /// Used by the dispatch loop to detect cmd_ids created by eval.
    pub fn peek_next_entry_id(&self) -> u64 {
        self.entry_counter.get_untracked()
    }

    // ── System lines ──────────────────────────────────────────────────────

    pub fn push_system(&self, text: impl Into<String>) {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::System(SystemRecord {
                id,
                text: text.into(),
                kind: SystemKind::Info,
            }))
        });
    }

    pub fn push_error(&self, text: impl Into<String>) {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::System(SystemRecord {
                id,
                text: text.into(),
                kind: SystemKind::Error,
            }))
        });
    }

    /// Legacy alias kept for transition; behaves like `push_system`.
    pub fn push_output(&self, text: impl Into<String>) {
        self.push_system(text);
    }

    // ── Commands ──────────────────────────────────────────────────────────

    /// Append a dispatched command in `Sent` state and return its id.
    pub fn push_command(&self, raw: impl Into<String>) -> u64 {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::Command(CommandRecord {
                id,
                raw: raw.into(),
                message_id: None,
                status: ArcRwSignal::new(CommandStatus::Sent),
            }))
        });
        id
    }

    /// Append a command already resolved as `Done` (dimmed; no reply expected).
    pub fn push_command_done(&self, raw: impl Into<String>) {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::Command(CommandRecord {
                id,
                raw: raw.into(),
                message_id: None,
                status: ArcRwSignal::new(CommandStatus::Done),
            }))
        });
    }

    /// Append a command already resolved as `Done` and return its id.
    /// Use this when you need to track the entry (e.g. for `batch_sync_cmd_id`)
    /// but don't want the `Sent` pulsing state.
    pub fn push_command_done_id(&self, raw: impl Into<String>) -> u64 {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::Command(CommandRecord {
                id,
                raw: raw.into(),
                message_id: None,
                status: ArcRwSignal::new(CommandStatus::Done),
            }))
        });
        id
    }

    /// Append a command already resolved as `Replied` (bright green; success).
    pub fn push_command_ok(&self, raw: impl Into<String>) {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::Command(CommandRecord {
                id,
                raw: raw.into(),
                message_id: None,
                status: ArcRwSignal::new(CommandStatus::Replied(String::new())),
            }))
        });
    }

    /// Record the `Message.id` returned by a successful send.
    pub fn bind_message_id(&self, cmd_id: u64, msg_id: String) {
        let batch_id = self
            .cmd_to_batch
            .with_untracked(|m| m.get(&cmd_id).copied());
        self.register_pending(msg_id.clone(), PendingKind::Simple { cmd_id }, batch_id);
        self.entries.update(|v| {
            if let Some(Entry::Command(c)) = v.iter_mut().find(|e| e.id() == cmd_id) {
                c.message_id = Some(msg_id);
            }
        });
    }

    /// Resolve a command directly by entry id (e.g. on send failure).
    ///
    /// Calls `status.set()` on the command's `RwSignal<CommandStatus>` so
    /// that `render_entry`'s reactive closure picks up the change without
    /// requiring Leptos `<For>` to re-render the item.
    pub fn resolve_command_by_id(&self, cmd_id: u64, status: CommandStatus) {
        let found = self.entries.with_untracked(|v| {
            v.iter().find_map(|e| match e {
                Entry::Command(c) if c.id == cmd_id => {
                    Some((c.status.clone(), c.message_id.clone()))
                }
                _ => None,
            })
        });
        if let Some((status_sig, msg_id_opt)) = found {
            status_sig.set(status.clone());
            if let Some(mid) = msg_id_opt {
                self.pending_requests.update(|m| {
                    m.remove(&mid);
                });
            }
        }
        // Update batch state on terminal statuses (Done / Replied / Error).
        if matches!(
            status,
            CommandStatus::Done | CommandStatus::Replied(_) | CommandStatus::Error(_)
        ) {
            let batch_id = self.cmd_to_batch.update_untracked(|m| m.remove(&cmd_id));
            if let Some(bid) = batch_id {
                self.batches.update(|b| {
                    if let Some(ab) = b.get_mut(&bid) {
                        if matches!(status, CommandStatus::Error(_)) {
                            ab.had_error = true;
                        }
                        if ab.mode == BatchMode::Sync {
                            ab.sync_cmd_id = None; // signal dispatch loop to advance
                        }
                        if ab.mode == BatchMode::Async && ab.async_pending > 0 {
                            ab.async_pending -= 1;
                        }
                    }
                });
            }
        }
    }

    // ── Pending request helpers ──────────────────────────────────────────

    /// Register a pending request for the given outgoing message id.
    pub fn register_pending(&self, msg_id: String, kind: PendingKind, batch_id: Option<u64>) {
        let ttl_ms = batch_id
            .and_then(|bid| {
                self.batches
                    .with_untracked(|b| b.get(&bid).map(|ab| ab.timeout_ms))
            })
            .unwrap_or(DEFAULT_TIMEOUT_MS);
        log::debug!(
            "[pending] register msg_id={} kind={:?} batch={:?} ttl={}ms",
            msg_id,
            kind,
            batch_id,
            ttl_ms
        );
        self.pending_requests.update(|m| {
            m.insert(
                msg_id,
                TrackedRequest {
                    kind,
                    batch_id,
                    sent_at_ms: js_sys::Date::now(),
                },
            );
        });
    }

    /// Remove and return the pending kind for the given message id, if any.
    pub fn take_pending(&self, msg_id: &str) -> Option<PendingKind> {
        let result = self
            .pending_requests
            .update_untracked(|m| m.remove(msg_id))
            .map(|tr| tr.kind);
        if let Some(ref kind) = result {
            log::debug!("[pending] matched reply msg_id={} kind={:?}", msg_id, kind);
        } else {
            log::debug!(
                "[pending] no match for reply msg_id={} (already expired or unknown)",
                msg_id
            );
        }
        result
    }

    // ── Scheme RPC helpers ────────────────────────────────────────────────

    /// Register a oneshot sender for a Scheme-initiated RPC reply.
    pub fn register_scheme_sender(
        &self,
        msg_id: String,
        sender: oneshot::Sender<Result<String, String>>,
    ) {
        let now = js_sys::Date::now();
        self.scheme_senders.update(|m| {
            m.insert(msg_id, (sender, now));
        });
    }

    /// Remove and return the sender for `msg_id`, if any.
    pub fn take_scheme_sender(
        &self,
        msg_id: &str,
    ) -> Option<oneshot::Sender<Result<String, String>>> {
        self.scheme_senders
            .update_untracked(|m| m.remove(msg_id))
            .map(|(s, _)| s)
    }

    /// Expire scheme senders that have waited longer than `timeout_ms`.
    /// Dropping the sender causes the awaiting `receiver.await` to return `Err(_)`
    /// which the evaluator maps to `(:timeout)`.
    pub fn expire_scheme_senders(&self, timeout_ms: f64) {
        let now = js_sys::Date::now();
        let expired: Vec<String> = self.scheme_senders.with_untracked(|m| {
            m.iter()
                .filter(|(_, (_, sent_at))| now - sent_at > timeout_ms)
                .map(|(id, _)| id.clone())
                .collect()
        });
        for id in expired {
            // Dropping the sender unblocks the awaiting evaluator task.
            self.scheme_senders.update_untracked(|m| m.remove(&id));
        }
    }

    // ── Incoming messages ────────────────────────────────────────────────

    /// Append an incoming message. If `after_cmd_id` is `Some(_)`, the new
    /// entry is spliced into the buffer immediately after the matching
    /// command entry (and any prior replies already attached to it).
    pub fn push_incoming(
        &self,
        display: impl Into<String>,
        after_cmd_id: Option<u64>,
        is_error: bool,
    ) {
        let id = self.next_id();
        let rec = IncomingRecord {
            id,
            display: display.into(),
            is_error,
            after_cmd_id,
        };
        self.entries.update(|v| {
            if let Some(target) = after_cmd_id {
                let mut insert_at = v.len();
                let mut seen_command = false;
                for (i, e) in v.iter().enumerate() {
                    if !seen_command {
                        if e.id() == target {
                            seen_command = true;
                            insert_at = i + 1;
                        }
                    } else {
                        match e {
                            Entry::Incoming(ir) if ir.after_cmd_id == Some(target) => {
                                insert_at = i + 1;
                            }
                            _ => break,
                        }
                    }
                }
                v.insert(insert_at, Entry::Incoming(rec));
            } else {
                v.push(Entry::Incoming(rec));
            }
        });
    }

    // ── Mailbox ───────────────────────────────────────────────────────────

    /// Ingest a message into the EgoConfig inbox tree and return the new
    /// entry count.  The caller is responsible for persisting `config`.
    ///
    /// Only `application/x-ma-message` messages are stored; others are ignored.
    pub fn ingest_mailbox_message(
        &self,
        incoming: &crate::messages::IncomingMessage,
        config: RwSignal<EgoConfig>,
    ) -> usize {
        config.update(|cfg| {
            crate::mailbox::ingest_to_config(incoming, cfg);
        });
        crate::mailbox::inbox_count(&config.get_untracked())
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
    pub export_json: String,
}

// ── Thread-local non-reactive globals ─────────────────────────────────────

thread_local! {
    pub static ENDPOINT: RefCell<Option<Rc<dyn ma_core::MaEndpoint>>> =
        RefCell::new(None);
    pub static SESSION_IROH_KEY: RefCell<Option<[u8; 32]>> = const { RefCell::new(None) };
    pub static SESSION_IPNS_KEY: RefCell<Option<[u8; 32]>> = const { RefCell::new(None) };
    pub static SESSION_INBOX: RefCell<Option<Inbox<Message>>> = const { RefCell::new(None) };
    pub static SESSION_RPC_INBOX: RefCell<Option<Inbox<Message>>> = const { RefCell::new(None) };
    pub static SESSION_CRUD_INBOX: RefCell<Option<Inbox<Message>>> = const { RefCell::new(None) };
    pub static SESSION_SIGNING_KEY: RefCell<Option<[u8; 32]>> = const { RefCell::new(None) };
    pub static SESSION_ENCRYPTION_KEY: RefCell<Option<[u8; 32]>> = const { RefCell::new(None) };
    pub static SESSION_SENDER_DID: RefCell<Option<String>> = const { RefCell::new(None) };
    pub static SESSION_CREATED_AT: RefCell<Option<String>> = const { RefCell::new(None) };
    /// Language preference chain for this session, e.g. `"nb_NO:en_GB:en"`.
    /// Injected into the `ma["lang"]` field of the published DID document.
    pub static SESSION_LANG: RefCell<Option<String>> = const { RefCell::new(None) };
    /// Shared DID resolver — created once at connect() so its cache is
    /// reused across all concurrent sends instead of each call fetching
    /// the same DID document from scratch.
    pub static SESSION_RESOLVER: RefCell<Option<Rc<IpfsGatewayResolver>>> = const { RefCell::new(None) };
    /// CID of the most recently stored encrypted profile blob.
    /// Set when an ipfs-store reply arrives for a profile-publish request.
    /// Read by `send_ipfs_publish` to embed `ma.agent` in the DID document.
    pub static SESSION_AGENT_CID: RefCell<Option<String>> = const { RefCell::new(None) };
}
