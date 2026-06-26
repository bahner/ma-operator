//! Unified terminal entry model.
//!
//! The terminal buffer is a `Vec<Entry>` rather than a stream of lines. Each
//! variant represents a distinct kind of event in the user's session.

use crate::core::commands::CommandRecord;

/// A message received from the network.
#[derive(Clone, Debug, PartialEq)]
pub struct IncomingRecord {
    pub id: u64,
    /// Pre-formatted display text.
    pub display: String,
    /// True when payload is an error reply (e.g. `[:error, reason]`).
    pub is_error: bool,
    /// If the incoming message is a reply, this is the id of the
    /// `CommandRecord` it replies to. Used to splice the reply directly
    /// after the originating command in the rendered list.
    pub after_cmd_id: Option<u64>,
}

#[derive(Clone, Debug, PartialEq)]
pub enum SystemKind {
    Info,
    Error,
}

/// Local diagnostic / informational line produced by the shell itself
/// (help text, parse errors, config feedback, dot-command results).
#[derive(Clone, Debug, PartialEq)]
pub struct SystemRecord {
    pub id: u64,
    pub text: String,
    pub kind: SystemKind,
}

/// A single entry in the terminal buffer.
#[derive(Clone, Debug)]
pub enum Entry {
    Command(CommandRecord),
    Incoming(IncomingRecord),
    System(SystemRecord),
}

impl Entry {
    pub fn id(&self) -> u64 {
        match self {
            Entry::Command(c) => c.id,
            Entry::Incoming(i) => i.id,
            Entry::System(s) => s.id,
        }
    }
}
