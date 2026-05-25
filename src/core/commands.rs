//! User-dispatched commands and their reply lifecycle.

use leptos::prelude::RwSignal;

/// A single user-issued command awaiting (or having received) a reply.
///
/// The record is the source of truth for one dispatched action. Visual
/// rendering is derived from this — never the other way around.
///
/// `status` is a `RwSignal<CommandStatus>` so that `render_entry` can react
/// to status changes without requiring Leptos `<For>` to re-render the
/// entire item (keyed `<For>` keeps existing DOM nodes for unchanged keys).
#[derive(Clone, Debug)]
pub struct CommandRecord {
    /// Global sequence id, shared with the terminal entry counter so that
    /// commands and other entries can be merged into a single render order.
    pub id: u64,
    /// Raw text the user typed (with any focus-mode prefix already applied).
    pub raw: String,
    /// The `ma_core::Message.id` once the send call returned successfully.
    /// `None` until the async dispatch completes.
    pub message_id: Option<String>,
    /// Current lifecycle state.  A signal so `render_entry` updates
    /// reactively when the status changes without a full `<For>` re-render.
    pub status: RwSignal<CommandStatus>,
}

#[derive(Clone, Debug, PartialEq)]
pub enum CommandStatus {
    /// Dispatched, awaiting a reply (or text send — no reply expected).
    Sent,
    /// Local command completed; nothing further expected. Shown dimmed.
    Done,
    /// A reply arrived. The string is unused for rendering (color change only).
    Replied(String),
    /// Publish is in flight (e.g. edit → IPFS store sent, waiting for CRUD SET confirm).
    Publishing,
    /// Send failed locally, or an error reply was returned.
    Error(String),
}
