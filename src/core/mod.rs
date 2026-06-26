//! Pure core types and logic for the agent shell.
//!
//! Zero `leptos` or `web_sys` imports live in this module; the goal is that
//! anyone wishing to build their own UI on top of the same parser, command
//! model, and entry model only needs to depend on these types and write a
//! thin Leptos (or other) adapter on top.

pub mod commands;
pub mod entries;

pub use commands::{CommandRecord, CommandStatus};
pub use entries::{Entry, IncomingRecord, SystemKind, SystemRecord};
