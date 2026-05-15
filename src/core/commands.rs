//! User-dispatched commands and their reply lifecycle.

/// A single user-issued command awaiting (or having received) a reply.
///
/// The record is the source of truth for one dispatched action. Visual
/// rendering is derived from this — never the other way around.
#[derive(Clone, Debug, PartialEq)]
pub struct CommandRecord {
    /// Global sequence id, shared with the terminal entry counter so that
    /// commands and other entries can be merged into a single render order.
    pub id: u64,
    /// Raw text the user typed (with any focus-mode prefix already applied).
    pub raw: String,
    /// The `ma_core::Message.id` once the send call returned successfully.
    /// `None` until the async dispatch completes.
    pub message_id: Option<String>,
    /// Current lifecycle state.
    pub status: CommandStatus,
}

#[derive(Clone, Debug, PartialEq)]
pub enum CommandStatus {
    /// Dispatched, awaiting a reply (or text send — no reply expected).
    Sent,
    /// A reply arrived. Holds a short display form of the reply body.
    Replied(String),
    /// Send failed locally, or an error reply was returned.
    Error(String),
}
