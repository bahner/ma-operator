/// Message display and construction helpers.
///
/// Formats incoming ma-core Messages for the terminal output buffer.

/// Format an incoming message for display in the terminal.
pub fn format_incoming(sender: &str, content_type: &str, body: &str) -> String {
    format!("← [{sender}] ({content_type})\n  {body}")
}

/// Format a sent message confirmation.
pub fn format_sent(target: &str, verb: Option<&str>, body: &str) -> String {
    match verb {
        Some(v) => format!("→ {target}:{v} {body}"),
        None => format!("→ {target} {body}"),
    }
}
