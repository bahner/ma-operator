use leptos::prelude::*;
use ma_core::{Inbox, IpfsGatewayResolver, Message};
use serde::{Deserialize, Serialize};
use std::cell::RefCell;
use std::collections::{HashMap, VecDeque};
use std::rc::Rc;

use crate::config::EgoConfig;
use crate::core::{CommandRecord, CommandStatus, Entry, IncomingRecord, SystemKind, SystemRecord};
use crate::views::editor::EditorMode;
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
}

// ── Pending CID content operations ──────────────────────────────────────────

/// Tracks in-flight CRUD GET requests whose reply (a CID) should be fetched
/// from IPFS and displayed inline using a text content operation.
#[derive(Clone, Debug)]
pub struct CidOpCtx {
    /// Name of the operation to apply (e.g. `"cat"`, `"wc"`).
    pub op: String,
    /// Arguments to the operation (e.g. `["-l"]` for `wc -l`).
    pub args: Vec<String>,
    /// `CommandRecord.id` of the originating command entry.
    pub cmd_id: u64,
}

// ── Pending remote edit opens ─────────────────────────────────────────────

/// Tracks in-flight CRUD GET requests that should open the editor on reply.
/// Key: the `Message.id` of the GET.  Value: enough context to open the
/// correct editor mode and populate it with the received content.
#[derive(Clone, Debug)]
pub struct EditOpenCtx {
    /// DID of the remote runtime the GET was sent to.
    pub target: String,
    /// CRUD path that was fetched, e.g. `":acl"` or `":entities.ping"`.
    pub crud_path: String,
    /// Which editor mode to open (determines available toolbar buttons).
    pub editor_mode: EditorMode,
    /// `CommandRecord.id` of the originating command entry so the poll loop
    /// can resolve it (success or error) once the editor is opened.
    pub cmd_id: u64,
}

// ── Pending IPFS-store / CRUD contexts ────────────────────────────────────

/// Context for an in-flight IPFS store request that should trigger a CRUD SET
/// on completion (the returned CID becomes the SET value).
#[derive(Clone, Debug)]
pub struct IpfsCrudPending {
    /// DID of the remote runtime to send the CRUD SET to.
    pub target_did: String,
    /// CRUD path for the SET, e.g. `":acl"` or `":entities.ping"`.
    pub crud_path: String,
    /// `CommandRecord.id` of the originating command entry, if any.
    pub cmd_id: Option<u64>,
}

/// Context for an in-flight IPFS store request that registers a new kind.
#[derive(Clone, Debug)]
pub struct IpfsKindUpsertPending {
    /// DID of the remote runtime that will receive the `:kinds` SET.
    pub target_did: String,
    /// Protocol ID string, e.g. `"/ma/my-kind/0.0.1"`.
    pub protocol_id: String,
    /// `CommandRecord.id` of the originating command entry, if any.
    pub cmd_id: Option<u64>,
}

/// Context for an in-flight IPFS store request that publishes a profile blob.
#[derive(Clone, Debug)]
pub struct ProfilePublishPending {
    /// DID of the publisher runtime that will receive the DID document.
    pub publisher_did: String,
    /// `CommandRecord.id` of the originating command entry, if any.
    pub cmd_id: Option<u64>,
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
    /// Maps `ma_core::Message.id` of an in-flight command to the
    /// `CommandRecord.id` so replies can locate the originating entry.
    pub pending_by_msg_id: RwSignal<HashMap<String, u64>>,
    /// Tracks in-flight IPFS store requests that should trigger a CRUD set on
    /// completion.  Key: ipfs_store `Message.id`.
    /// Value: `(crud_target_did, crud_path, ipfs_prefix, cmd_id)` where
    /// `ipfs_prefix` is `"/ipfs/"` for raw blobs or `"/ipld/"` for DAG-CBOR
    /// nodes, and `cmd_id` is the originating command entry id (if any).
    pub pending_ipfs_crud: RwSignal<HashMap<String, IpfsCrudPending>>,
    /// Tracks in-flight CRUD SET requests that are the second leg of a
    /// publish flow.  Key: CRUD SET `Message.id`.  Value: the originating
    /// command entry id whose status should be updated on reply.
    pub pending_crud_confirms: RwSignal<HashMap<String, u64>>,
    /// Tracks in-flight CRUD GET requests that should fetch CID content inline.
    /// Key: CRUD GET `Message.id`.  Value: content operation context.
    pub pending_cid_ops: RwSignal<HashMap<String, CidOpCtx>>,
    /// Tracks in-flight CRUD GET requests that should open the editor on reply.
    /// Key: CRUD GET `Message.id`.  Value: editor open context.
    pub pending_edit_opens: RwSignal<HashMap<String, EditOpenCtx>>,
    /// Tracks in-flight IPFS store requests for kind upserts.
    /// Key: ipfs_store `Message.id`.
    /// Value: `(crud_target_did, protocol_id, cmd_id)`.
    pub pending_ipfs_kind_upserts: RwSignal<HashMap<String, IpfsKindUpsertPending>>,
    /// Tracks in-flight IPFS store requests for profile encryption.
    /// Key: ipfs_store `Message.id`.
    /// Value: `(publisher_did, cmd_id_opt)`.
    pub pending_profile_publish: RwSignal<HashMap<String, ProfilePublishPending>>,
    /// Cache of resolved DID documents and fetched CID contents.
    /// Key: DID string or CID string.  Value: parsed JSON document.
    pub doc_cache: RwSignal<HashMap<String, serde_json::Value>>,
    entry_counter: RwSignal<u64>,
    pub lang: RwSignal<String>,
    /// Pre-filled input text from URL params (`?chat=` / `?say=`).
    /// Set at app startup, consumed once by InputBar after login.
    pub prefill_input: RwSignal<Option<String>>,
    /// Pending lines for a synchronous batch (`:eval-sync`).
    /// Each entry is a raw command line. The queue is drained one line at a
    /// time: the next line is dispatched only after the previous command's
    /// status leaves `Sent` (i.e. `resolve_command*` is called for it).
    /// `None` means no batch is active; `Some(queue)` means one is running.
    pub batch_queue: RwSignal<Option<VecDeque<String>>>,
    /// The `CommandRecord.id` of the currently-in-flight batch step.
    /// When `resolve_command_by_id` / `resolve_command` fires for this id,
    /// `advance_batch` is called to dispatch the next line.
    pub batch_waiting_for: RwSignal<Option<u64>>,
    /// Set to `Some(line)` when the batch is ready to dispatch the next line.
    /// A Leptos `Effect` in `terminal.rs` watches this and fires the dispatch.
    pub batch_next_line: RwSignal<Option<String>>,
}

impl AppState {
    pub fn new() -> Self {
        Self {
            session: RwSignal::new(None),
            entries: RwSignal::new(Vec::new()),
            history: RwSignal::new(Vec::new()),
            focus_actor: RwSignal::new(None),
            screensaver: RwSignal::new(false),
            pending_by_msg_id: RwSignal::new(HashMap::new()),
            pending_ipfs_crud: RwSignal::new(HashMap::new()),
            pending_crud_confirms: RwSignal::new(HashMap::new()),
            pending_cid_ops: RwSignal::new(HashMap::new()),
            pending_edit_opens: RwSignal::new(HashMap::new()),
            pending_ipfs_kind_upserts: RwSignal::new(HashMap::new()),
            pending_profile_publish: RwSignal::new(HashMap::new()),
            doc_cache: RwSignal::new(HashMap::new()),
            entry_counter: RwSignal::new(0),
            lang: RwSignal::new("en".to_string()),
            prefill_input: RwSignal::new(None),
            batch_queue: RwSignal::new(None),
            batch_waiting_for: RwSignal::new(None),
            batch_next_line: RwSignal::new(None),
        }
    }

    /// Start a synchronous batch: store the queue and dispatch the first line.
    /// `dispatch` is called with each line in turn; it must call
    /// `bind_batch_step` with the resulting `cmd_id` so the batch can advance.
    pub fn start_batch(&self, lines: VecDeque<String>) {
        self.batch_queue.set(Some(lines));
        self.batch_waiting_for.set(None);
    }

    /// Record which `cmd_id` the batch is currently waiting for.
    pub fn bind_batch_step(&self, cmd_id: u64) {
        self.batch_waiting_for.set(Some(cmd_id));
    }

    /// Pop and return the next batch line, or `None` if the batch is done.
    pub fn next_batch_line(&self) -> Option<String> {
        self.batch_queue
            .update_untracked(|q| q.as_mut().and_then(|vd| vd.pop_front()))
    }

    /// Called by `resolve_command_by_id` / `resolve_command` after a status
    /// change. If the resolved id matches the one the batch is waiting for,
    /// clears `batch_waiting_for` and returns the next line to dispatch
    /// (caller must dispatch it and then call `bind_batch_step`).
    pub fn advance_batch(&self, cmd_id: u64) -> Option<String> {
        let waiting = self.batch_waiting_for.get_untracked();
        if waiting != Some(cmd_id) {
            return None;
        }
        self.batch_waiting_for.set(None);
        let next = self.next_batch_line();
        if next.is_none() {
            // Batch finished — clear queue.
            self.batch_queue.set(None);
        }
        next
    }

    fn next_id(&self) -> u64 {
        let id = self.entry_counter.get_untracked();
        self.entry_counter.set(id + 1);
        id
    }

    /// Peek at the next entry id without consuming it.
    /// Used by the batch Effect in terminal.rs to detect newly-created entries.
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
                status: RwSignal::new(CommandStatus::Sent),
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
                status: RwSignal::new(CommandStatus::Done),
            }))
        });
    }

    /// Append a command already resolved as `Replied` (bright green; success).
    pub fn push_command_ok(&self, raw: impl Into<String>) {
        let id = self.next_id();
        self.entries.update(|v| {
            v.push(Entry::Command(CommandRecord {
                id,
                raw: raw.into(),
                message_id: None,
                status: RwSignal::new(CommandStatus::Replied(String::new())),
            }))
        });
    }

    /// Record the `Message.id` returned by a successful send.
    pub fn bind_message_id(&self, cmd_id: u64, msg_id: String) {
        self.pending_by_msg_id.update(|m| {
            m.insert(msg_id.clone(), cmd_id);
        });
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
                Entry::Command(c) if c.id == cmd_id => Some((c.status, c.message_id.clone())),
                _ => None,
            })
        });
        if let Some((status_sig, msg_id_opt)) = found {
            status_sig.set(status);
            if let Some(mid) = msg_id_opt {
                self.pending_by_msg_id.update(|m| {
                    m.remove(&mid);
                });
            }
        }
        // Advance a pending sync batch if this was the awaited step.
        if let Some(next_line) = self.advance_batch(cmd_id) {
            self.batch_next_line.set(Some(next_line));
        }
    }

    /// Resolve a command by its `Message.id`. Returns the command id if
    /// the mapping existed.
    pub fn resolve_command(&self, msg_id: &str, status: CommandStatus) -> Option<u64> {
        let cmd_id = self
            .pending_by_msg_id
            .update_untracked(|m| m.remove(msg_id));
        if let Some(cid) = cmd_id {
            let status_sig = self.entries.with_untracked(|v| {
                v.iter().find_map(|e| match e {
                    Entry::Command(c) if c.id == cid => Some(c.status),
                    _ => None,
                })
            });
            if let Some(sig) = status_sig {
                sig.set(status);
            }
            // Advance a pending sync batch if this was the awaited step.
            if let Some(next_line) = self.advance_batch(cid) {
                self.batch_next_line.set(Some(next_line));
            }
        }
        cmd_id
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
