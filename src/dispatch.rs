//! Input dispatch loop.
//!
//! `run_dispatch_loop` is spawned once at login.  It drains `input_queue`
//! every 50 ms, handles `.batch!sync`/`.batch!async`/`.batch` delimiters,
//! advances sync batches when their current step resolves, and finalises
//! completed async batches.

use leptos::prelude::*;

use crate::{
    config::EgoConfig,
    core::CommandStatus,
    eval::{actor_send::execute_outbox_task, eval},
    http::fetch_path_bytes,
    i18n::{t, tf},
    identity::storage::save_history,
    parser::command::{parse, Command},
    state::{
        ActiveBatch, AppState, AwaitingReply, BatchMode, OnError, PendingKind, DEFAULT_TIMEOUT_MS,
    },
    transport,
    views::editor::{EditorContext, EditorMode},
};

const TICK_MS: u32 = 50;

// ── Public entry point ─────────────────────────────────────────────────────

pub async fn run_dispatch_loop(
    state: AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    loop {
        gloo_timers::future::TimeoutFuture::new(TICK_MS).await;

        // 1. TTL check: expire pending requests that have been waiting too long.
        expire_pending_requests(&state);

        // 2. Advance ready sync batches (reply may have arrived during last tick).
        advance_sync_batches(&state, config, show_editor, on_eval);

        // 3. Finalise completed async batches.
        finish_completed_async_batches(&state);

        // 4. Drain input queue.
        let lines: Vec<String> = state
            .input_queue
            .update_untracked(|q| q.drain(..).collect());
        for line in lines {
            handle_input_line(line, &state, config, show_editor, on_eval);
        }

        // 5. Drain and spawn all queued outbox tasks concurrently.
        //    ma-core serialises connects per (endpoint_id, protocol) key so
        //    sends to different targets run in parallel while sends to the
        //    same target queue up inside ma-core without blocking others.
        loop {
            let next_task = state
                .outbox_queue
                .update_untracked(std::collections::VecDeque::pop_front);
            match next_task {
                None => break,
                Some(task) => {
                    let state2 = state.clone();
                    wasm_bindgen_futures::spawn_local(async move {
                        execute_outbox_task(task, &state2, config).await;
                    });
                }
            }
        }
    }
}

// ── TTL expiry ────────────────────────────────────────────────────────────

/// Expire all pending requests that have exceeded their TTL (all `PendingKind` variants).
/// Uses the owning batch's `timeout_ms` when available; falls back to
/// `DEFAULT_TIMEOUT_MS` for standalone (non-batch) requests.
/// Called every tick from the dispatch loop — no JS callbacks involved.
fn expire_pending_requests(state: &AppState) {
    let now = js_sys::Date::now();
    expire_pending_enter(state, now);
    let batch_timeouts: std::collections::HashMap<u64, u32> = state
        .batches
        .with_untracked(|b| b.iter().map(|(id, ab)| (*id, ab.timeout_ms)).collect());
    let expired: Vec<(String, PendingKind)> = state.pending_requests.with_untracked(|m| {
        m.iter()
            .filter_map(|(msg_id, tr)| {
                let timeout_ms = f64::from(
                    if let PendingKind::ProfilePublish { timeout_ms, .. } = &tr.kind {
                        *timeout_ms
                    } else {
                        tr.batch_id
                            .and_then(|bid| batch_timeouts.get(&bid).copied())
                            .unwrap_or(DEFAULT_TIMEOUT_MS)
                    },
                );
                if now - tr.sent_at_ms > timeout_ms {
                    log::debug!(
                        "[pending] expire msg_id={} kind={:?} age={:.0}ms ttl={:.0}ms",
                        msg_id,
                        tr.kind,
                        now - tr.sent_at_ms,
                        timeout_ms
                    );
                    Some((msg_id.clone(), tr.kind.clone()))
                } else {
                    None
                }
            })
            .collect()
    });
    let should_reconnect = !expired.is_empty();
    for (msg_id, kind) in expired {
        // Remove first so inbox_poll can't also resolve it.
        state
            .pending_requests
            .update_untracked(|m| m.remove(&msg_id));
        let cmd_id_opt = kind.cmd_id();
        if let Some(cmd_id) = cmd_id_opt {
            log::debug!("[pending] failing cmd_id={cmd_id} due to TTL expiry");
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(t("msg-timeout")));
            state.push_error(t("msg-timeout"));
        } else {
            log::debug!("[pending] silently dropped expired entry msg_id={msg_id} (no cmd_id)");
        }
    }
    if should_reconnect {
        leptos::task::spawn_local(async move {
            if let Err(e) = transport::reconnect().await {
                log::warn!("[transport] reconnect after pending timeout failed: {e}");
            }
        });
    }
    // Also expire stuck Scheme call senders so awaiting evaluator tasks can
    // return (:timeout) rather than blocking forever.
    state.expire_scheme_senders(f64::from(DEFAULT_TIMEOUT_MS));
}

fn expire_pending_enter(state: &AppState, now: f64) {
    let expired = state.pending_enter.with_untracked(|pending| {
        pending
            .as_ref()
            .filter(|pending| now - pending.issued_at_ms > f64::from(DEFAULT_TIMEOUT_MS))
            .cloned()
    });
    let Some(pending) = expired else {
        return;
    };

    state.clear_pending_enter();
    if pending.visible {
        if let Some(cmd_id) = pending.cmd_id {
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(t("msg-timeout")));
            state.push_error(t("msg-timeout"));
        }
    }
    leptos::task::spawn_local(async move {
        if let Err(e) = transport::reconnect().await {
            log::warn!("[transport] reconnect after pending enter timeout failed: {e}");
        }
    });
}

// ── Per-line handler ───────────────────────────────────────────────────────

fn handle_input_line(
    line: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    let collecting_id = collecting_batch_id(state);
    let continues_scheme = !state.multiline_input.get_untracked().is_empty();
    let is_note = !continues_scheme && is_note_line(&line);
    let is_batch_delimiter = is_batch_delimiter_line(&line);

    if !is_batch_delimiter {
        save_line_to_history(&line, state);
    }
    if is_note {
        return;
    }

    if let Some(batch_id) = collecting_id {
        if line.trim() == ".batch" {
            close_batch(batch_id, state, config, show_editor, on_eval);
        } else if !line.trim().is_empty() {
            state.batches.update(|b| {
                if let Some(ab) = b.get_mut(&batch_id) {
                    ab.lines.push_back(line);
                }
            });
        }
        return;
    }

    let trimmed = line.trim();
    if trimmed.starts_with(".batch!sync") || trimmed.starts_with(".batch!async") {
        open_batch(trimmed, state);
        return;
    }

    let Some(input) = state
        .multiline_input
        .update_untracked(|pending| complete_scheme_input(pending, &line))
    else {
        return;
    };
    let trimmed = input.trim();
    if trimmed.is_empty() {
        return;
    }

    // Focus shorthand: unqualified words become a direct word-list call.
    if state.focus_actor.get_untracked().is_some() && is_focus_shorthand_command(trimmed) {
        let line = trimmed.to_string();
        let state2 = state.clone();
        let cancel_epoch = state.cancel_epoch();
        wasm_bindgen_futures::spawn_local(async move {
            handle_focus_shorthand(line, &state2, config, cancel_epoch).await;
        });
        return;
    }

    if crate::scheme::needs_expansion(trimmed) {
        let line = trimmed.to_string();
        let state2 = state.clone();
        let cancel_epoch = state.cancel_epoch();
        wasm_bindgen_futures::spawn_local(async move {
            handle_scheme_expansion(line, &state2, config, show_editor, on_eval, cancel_epoch)
                .await;
        });
        return;
    }

    dispatch_eval_line(trimmed, state, config, show_editor, on_eval, None);
}

fn collecting_batch_id(state: &AppState) -> Option<u64> {
    state.batches.with_untracked(|b| {
        b.iter()
            .find_map(|(id, ab)| if ab.collecting { Some(*id) } else { None })
    })
}

fn is_batch_delimiter_line(line: &str) -> bool {
    let t = line.trim();
    t == ".batch" || t.starts_with(".batch!sync") || t.starts_with(".batch!async")
}

fn save_line_to_history(line: &str, state: &AppState) {
    state.history.update(|h| {
        if h.last().map(std::string::String::as_str) != Some(line) {
            h.push(line.to_string());
        }
        if h.len() > 200 {
            h.drain(0..h.len() - 200);
        }
    });
    if let Some(sess) = state.session.get_untracked() {
        let hist = state.history.get_untracked();
        wasm_bindgen_futures::spawn_local(async move {
            if let Ok(json) = serde_json::to_string(&hist) {
                let _ = save_history(&sess.username, &json).await;
            }
        });
    }
}

async fn handle_scheme_expansion(
    line: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
    cancel_epoch: u64,
) {
    match crate::scheme::eval_standalone(&line, state, config).await {
        Ok(Some(value)) => {
            if should_display_scheme_value(&value) && !state.was_cancelled_since(cancel_epoch) {
                state.push_output(value.display());
            }
            return;
        }
        Ok(None) => {}
        Err(error) => {
            if !state.was_cancelled_since(cancel_epoch) {
                state.push_error(scheme_error_message(&error));
            }
            return;
        }
    }
    match crate::scheme::expand(&line, state, config).await {
        Ok(expanded) => {
            let t = expanded.trim().to_string();
            if !t.is_empty() && !state.was_cancelled_since(cancel_epoch) {
                dispatch_eval_line(&t, state, config, show_editor, on_eval, None);
            }
        }
        Err(e) => {
            if !state.was_cancelled_since(cancel_epoch) {
                state.push_error(scheme_error_message(&e));
            }
        }
    }
}

/// Expand embedded `(...)`, unalias `@targets`, split into words, and call
/// the first word as a Scheme function with the rest as literal arguments —
/// never re-parsed as Scheme source, so no word needs quoting.
async fn handle_focus_shorthand(
    line: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    cancel_epoch: u64,
) {
    let expanded = match crate::scheme::expand(&line, state, config).await {
        Ok(expanded) => expanded,
        Err(e) => {
            if !state.was_cancelled_since(cancel_epoch) {
                state.push_error(scheme_error_message(&e));
            }
            return;
        }
    };
    let cfg = config.get_untracked();
    let resolved = match crate::parser::alias::resolve_targets(&expanded, &cfg) {
        Ok(resolved) => resolved,
        Err(e) => {
            if !state.was_cancelled_since(cancel_epoch) {
                state.push_error(format!("'{line}': {e}"));
            }
            return;
        }
    };
    let mut words = crate::scheme::split_words(&resolved);
    if words.is_empty() {
        return;
    }
    let (head, _) = words.remove(0);
    match crate::scheme::call_shorthand(&head, words, state, config).await {
        Ok(value) => {
            if should_display_scheme_value(&value) && !state.was_cancelled_since(cancel_epoch) {
                state.push_output(value.display());
            }
        }
        Err(error) => {
            if !state.was_cancelled_since(cancel_epoch) {
                state.push_error(scheme_error_message(&error));
            }
        }
    }
}

fn scheme_error_message(error: &str) -> String {
    format!("scheme: {error}")
}

fn complete_scheme_input(pending: &mut String, line: &str) -> Option<String> {
    if pending.is_empty() {
        if crate::scheme::has_incomplete_expression(line) {
            pending.push_str(line);
            None
        } else {
            Some(line.to_string())
        }
    } else {
        pending.push('\n');
        pending.push_str(line);
        if crate::scheme::has_incomplete_expression(pending) {
            None
        } else {
            Some(std::mem::take(pending))
        }
    }
}

fn is_note_line(line: &str) -> bool {
    line.trim_start().starts_with(';')
}

fn should_display_scheme_value(value: &crate::scheme::SchemeVal) -> bool {
    !matches!(value, crate::scheme::SchemeVal::Nil)
}

fn parse_timeout(line: &str, default_ms: u32) -> u32 {
    line.split_whitespace()
        .find_map(|token| {
            let value = token.strip_prefix("timeout=")?;
            if let Some(milliseconds) = value.strip_suffix("ms") {
                milliseconds.parse::<u32>().ok()
            } else if let Some(seconds) = value.strip_suffix('s') {
                seconds.parse::<u32>().ok().map(|seconds| seconds * 1_000)
            } else {
                value.parse::<u32>().ok()
            }
        })
        .unwrap_or(default_ms)
}

fn parse_on_error(line: &str) -> OnError {
    if line.contains("on-error=continue") {
        OnError::Continue
    } else {
        OnError::Break
    }
}

fn open_batch(line: &str, state: &AppState) {
    // Guard: only one collecting batch at a time.
    let already = state
        .batches
        .with_untracked(|b| b.values().any(|ab| ab.collecting));
    if already {
        state.push_error(t("batch-already-collecting"));
        return;
    }

    let mode = if line.starts_with(".batch!sync") {
        BatchMode::Sync
    } else {
        BatchMode::Async
    };
    let timeout_ms = parse_timeout(line, DEFAULT_TIMEOUT_MS);
    let on_error = parse_on_error(line);
    let batch_id = state.new_batch_id();
    let header_cmd_id = state.push_command_done_id(line.to_string());

    state.batches.update(|b| {
        b.insert(
            batch_id,
            ActiveBatch {
                mode,
                timeout_ms,
                on_error,
                started_at_ms: 0.0, // reset when dispatch starts
                collecting: true,
                lines: std::collections::VecDeque::new(),
                sync_cmd_id: None,
                had_error: false,
                header_cmd_id,
                async_pending: 0,
                step_count: 0,
            },
        );
    });
}

fn close_batch(
    batch_id: u64,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    let (mode, is_empty) = state.batches.with_untracked(|b| {
        b.get(&batch_id).map_or((BatchMode::Sync, true), |ab| {
            (ab.mode.clone(), ab.lines.is_empty())
        })
    });

    if is_empty {
        state.push_system(t("batch-empty"));
        state.batches.update(|b| {
            b.remove(&batch_id);
        });
        return;
    }

    // Stop collecting; stamp start time and record step count.
    let now = js_sys::Date::now();
    state.batches.update(|b| {
        if let Some(ab) = b.get_mut(&batch_id) {
            ab.collecting = false;
            ab.step_count = ab.lines.len() as u32;
            ab.started_at_ms = now;
        }
    });

    match mode {
        BatchMode::Async => {
            let lines: Vec<String> = state.batches.update_untracked(|b| {
                b.get_mut(&batch_id)
                    .map(|ab| ab.lines.drain(..).collect())
                    .unwrap_or_default()
            });
            let count = lines.len() as u32;
            state.batches.update(|b| {
                if let Some(ab) = b.get_mut(&batch_id) {
                    ab.async_pending = count;
                }
            });
            for line in lines {
                dispatch_eval_line(&line, state, config, show_editor, on_eval, Some(batch_id));
            }
        }
        BatchMode::Sync => {
            // Dispatch first step; rest follow via advance_sync_batches.
            advance_sync_batch_step(batch_id, state, config, show_editor, on_eval);
        }
    }
}

// ── Sync batch advancement ────────────────────────────────────────────────

fn advance_sync_batches(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    // Collect ids that are ready to advance (not collecting, no pending step, have lines).
    let ready: Vec<u64> = state.batches.with_untracked(|b| {
        b.iter()
            .filter(|(_, ab)| {
                ab.mode == BatchMode::Sync
                    && !ab.collecting
                    && ab.sync_cmd_id.is_none()
                    && !ab.lines.is_empty()
            })
            .map(|(id, _)| *id)
            .collect()
    });
    for batch_id in ready {
        let should_break = state.batches.with_untracked(|b| {
            b.get(&batch_id)
                .is_some_and(|ab| ab.had_error && ab.on_error == OnError::Break)
        });
        if should_break {
            let had_error = true;
            finish_batch(batch_id, state, had_error);
        } else {
            advance_sync_batch_step(batch_id, state, config, show_editor, on_eval);
        }
    }

    // Also finalise sync batches that are done (no pending step AND no lines left).
    let done: Vec<(u64, bool)> = state.batches.with_untracked(|b| {
        b.iter()
            .filter(|(_, ab)| {
                ab.mode == BatchMode::Sync
                    && !ab.collecting
                    && ab.sync_cmd_id.is_none()
                    && ab.lines.is_empty()
                    && ab.step_count > 0 // has actually run at least one step
            })
            .map(|(id, ab)| (*id, ab.had_error))
            .collect()
    });
    for (batch_id, had_error) in done {
        finish_batch(batch_id, state, had_error);
    }
}

/// Dispatch the next pending line of a sync batch.
///
/// Loops for consecutive dot commands (which complete synchronously without
/// creating a pending `cmd_id`) so they don't stall for a full 50 ms tick.
fn advance_sync_batch_step(
    batch_id: u64,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    loop {
        // Break on error if configured.
        let should_break = state.batches.with_untracked(|b| {
            b.get(&batch_id)
                .is_some_and(|ab| ab.had_error && ab.on_error == OnError::Break)
        });
        if should_break {
            finish_batch(batch_id, state, true);
            return;
        }

        let line = state
            .batches
            .update_untracked(|b| b.get_mut(&batch_id)?.lines.pop_front());
        let Some(line) = line else {
            // All lines dispatched — finalise.
            let had_error = state
                .batches
                .with_untracked(|b| b.get(&batch_id).is_some_and(|ab| ab.had_error));
            finish_batch(batch_id, state, had_error);
            return;
        };

        let new_cmd_id =
            dispatch_eval_line(&line, state, config, show_editor, on_eval, Some(batch_id));

        if let Some(cmd_id) = new_cmd_id {
            // @-command — wait for its reply.
            let timeout_ms = state.batches.with_untracked(|b| {
                b.get(&batch_id)
                    .map_or(DEFAULT_TIMEOUT_MS, |ab| ab.timeout_ms)
            });
            state.batches.update(|b| {
                if let Some(ab) = b.get_mut(&batch_id) {
                    ab.sync_cmd_id = Some(cmd_id);
                }
            });
            // Per-step timeout watchdog.
            let state2 = state.clone();
            gloo_timers::callback::Timeout::new(timeout_ms, move || {
                let still_waiting = state2.batches.with_untracked(|b| {
                    b.get(&batch_id)
                        .is_some_and(|ab| ab.sync_cmd_id == Some(cmd_id))
                });
                if still_waiting {
                    state2.push_error(t("batch-step-timeout"));
                    state2.resolve_command_by_id(
                        cmd_id,
                        CommandStatus::Error(t("batch-step-timeout")),
                    );
                }
            })
            .forget();
            return; // Wait for reply.
        }
        // else: dot command completed synchronously — loop to dispatch next line.
    }
}

// ── Async batch finalisation ──────────────────────────────────────────────

fn finish_completed_async_batches(state: &AppState) {
    let done: Vec<(u64, bool)> = state.batches.with_untracked(|b| {
        b.iter()
            .filter(|(_, ab)| {
                ab.mode == BatchMode::Async
                    && !ab.collecting
                    && ab.async_pending == 0
                    && ab.step_count > 0
            })
            .map(|(id, ab)| (*id, ab.had_error))
            .collect()
    });
    for (batch_id, had_error) in done {
        finish_batch(batch_id, state, had_error);
    }
}

// ── Batch finalisation ────────────────────────────────────────────────────

fn finish_batch(batch_id: u64, state: &AppState, had_error: bool) {
    let ab = state.batches.update_untracked(|b| b.remove(&batch_id));
    let Some(ab) = ab else { return };

    let elapsed_secs = (js_sys::Date::now() - ab.started_at_ms) / 1000.0;
    let secs_str = format!("{elapsed_secs:.1}");
    let steps_str = ab.step_count.to_string();

    let summary = if had_error {
        tf(
            "batch-done-error",
            &[("secs", &secs_str), ("steps", &steps_str)],
        )
    } else {
        tf("batch-done", &[("secs", &secs_str), ("steps", &steps_str)])
    };

    // Resolve header entry.
    let status = if had_error {
        CommandStatus::Error(String::new())
    } else {
        CommandStatus::Replied(String::new())
    };
    state.entries.with_untracked(|v| {
        for entry in v {
            if let crate::core::Entry::Command(c) = entry {
                if c.id == ab.header_cmd_id {
                    c.status.set(status);
                    break;
                }
            }
        }
    });
    state.push_system(summary);
}

// ── Eval dispatch ─────────────────────────────────────────────────────────

/// Parse and eval a single line.
///
/// Returns `Some(cmd_id)` if the eval created a new pending-reply command
/// entry (i.e. an @-message), or `None` for dot commands and local-only
/// operations.
///
/// When `batch_id` is `Some`, registers the new `cmd_id` in `cmd_to_batch` so
/// `resolve_command_by_id` can advance the batch when the reply arrives.
fn dispatch_eval_line(
    line: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
    batch_id: Option<u64>,
) -> Option<u64> {
    let cfg = config.get_untracked();

    match parse(line, &cfg) {
        Ok(cmd) => {
            if let ActorMetaDispatch::Handled(result) =
                dispatch_actor_meta(&cmd, line, state, show_editor, batch_id)
            {
                return result;
            }
            let is_actor = matches!(cmd, Command::ActorMessage { .. });
            let before = state.peek_next_entry_id();
            eval(cmd, line, state, config, show_editor, on_eval);
            let after = state.peek_next_entry_id();
            if is_actor {
                log::debug!(
                    "[dispatch] actor eval: before={before} after={after} queue_len={}",
                    state
                        .outbox_queue
                        .with_untracked(std::collections::VecDeque::len)
                );
            }
            if after > before {
                let new_cmd_id = after - 1;
                let waits_for_reply = state.entries.with_untracked(|entries| {
                    entries.iter().find_map(|entry| match entry {
                        crate::core::Entry::Command(command) if command.id == new_cmd_id => {
                            Some(matches!(
                                command.status.get_untracked(),
                                CommandStatus::Sent | CommandStatus::Publishing
                            ))
                        }
                        _ => None,
                    })
                });
                if waits_for_reply.unwrap_or(false) {
                    if let Some(bid) = batch_id {
                        state.cmd_to_batch.update(|m| {
                            m.insert(new_cmd_id, bid);
                        });
                    }
                    Some(new_cmd_id)
                } else {
                    None
                }
            } else {
                None
            }
        }
        Err(e) => {
            state.push_error(format!("'{line}': {e}"));
            None
        }
    }
}

fn dispatch_actor_meta(
    cmd: &Command,
    line: &str,
    state: &AppState,
    show_editor: RwSignal<Option<EditorContext>>,
    batch_id: Option<u64>,
) -> ActorMetaDispatch {
    match actor_meta_action(cmd) {
        Some(ActorMetaAction::BehaviourEdit { target }) => {
            let cmd_id = open_actor_behaviour_editor(target, line, state, show_editor);
            attach_command_to_batch(state, cmd_id, batch_id);
            ActorMetaDispatch::Handled(Some(cmd_id))
        }
        Some(ActorMetaAction::Unsupported { meta }) => {
            state.push_error(format!("'{line}': unsupported local actor meta: !{meta}"));
            ActorMetaDispatch::Handled(None)
        }
        Some(ActorMetaAction::Rejected { reason }) => {
            state.push_error(format!("'{line}': {reason}"));
            ActorMetaDispatch::Handled(None)
        }
        None => ActorMetaDispatch::NotMeta,
    }
}

enum ActorMetaDispatch {
    NotMeta,
    Handled(Option<u64>),
}

enum ActorMetaAction<'a> {
    BehaviourEdit { target: &'a str },
    Unsupported { meta: &'a str },
    Rejected { reason: &'static str },
}

fn actor_meta_action(cmd: &Command) -> Option<ActorMetaAction<'_>> {
    let Command::ActorMessage {
        target,
        verb: Some(verb),
        meta: Some(meta),
        body,
    } = cmd
    else {
        return None;
    };

    if verb == "behaviour" && meta == "edit" {
        if !body.trim().is_empty() {
            return Some(ActorMetaAction::Rejected {
                reason: "behaviour editor does not accept arguments",
            });
        }
        if !target.contains('#') {
            return Some(ActorMetaAction::Rejected {
                reason: "behaviour editor requires an actor target",
            });
        }
        return Some(ActorMetaAction::BehaviourEdit { target });
    }

    Some(ActorMetaAction::Unsupported { meta })
}

fn attach_command_to_batch(state: &AppState, cmd_id: u64, batch_id: Option<u64>) {
    if let Some(bid) = batch_id {
        state.cmd_to_batch.update(|m| {
            m.insert(cmd_id, bid);
        });
    }
}

fn is_focus_shorthand_command(line: &str) -> bool {
    !line.starts_with('@')
        && !line.starts_with('.')
        && !line.starts_with('/')
        && !line.starts_with('(')
        && !line.trim().is_empty()
}

fn open_actor_behaviour_editor(
    target: &str,
    line: &str,
    state: &AppState,
    show_editor: RwSignal<Option<EditorContext>>,
) -> u64 {
    let cmd_id = state.push_command(line);
    let target = target.to_string();
    let state2 = state.clone();
    wasm_bindgen_futures::spawn_local(async move {
        match fetch_actor_behaviour_source(&target).await {
            Ok(initial) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Done);
                show_editor.set(Some(
                    EditorContext::new(":behaviour", initial)
                        .with_save_to(format!("{target}:behaviour"))
                        .with_language("scheme")
                        .with_mode(EditorMode::ActorBehaviourEdit { target })
                        .with_cmd_id(cmd_id),
                ));
            }
            Err(e) => {
                state2.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                state2.push_error(e);
            }
        }
    });
    cmd_id
}

async fn fetch_actor_behaviour_source(target: &str) -> Result<String, String> {
    let mut rx = None;
    transport::send_actor_message_with_msg_id(target, "behaviour", &[], |msg_id| {
        rx = Some(AwaitingReply::register(msg_id));
    })
    .await?;
    let Some(rx) = rx else {
        return Err("behaviour reply channel was not registered".to_string());
    };
    let reply = rx
        .await
        .map_err(|_| "behaviour reply channel closed".to_string())??;
    let reference = actor_behaviour_reference(&reply);
    let Some(reference) = reference else {
        return Ok(String::new());
    };
    let bytes = fetch_path_bytes(&reference).await?;
    String::from_utf8(bytes).map_err(|e| format!("behaviour source is not valid UTF-8: {e}"))
}

fn actor_behaviour_reference(reply: &str) -> Option<String> {
    let value = reply.trim();
    value
        .split(|c: char| c.is_whitespace() || matches!(c, '"' | '\'' | '`' | '<' | '>' | ','))
        .find_map(normalize_ipfs_reference_token)
}

fn normalize_ipfs_reference_token(token: &str) -> Option<String> {
    let value = token
        .trim()
        .trim_matches(|c: char| matches!(c, '.' | ';' | ':' | '(' | ')' | '[' | ']' | '{' | '}'));
    if let Some(path) = value.strip_prefix("/ipfs/") {
        let cid = path.split('/').next().unwrap_or_default();
        return cid::Cid::try_from(cid)
            .is_ok()
            .then(|| format!("/ipfs/{path}"));
    }
    cid::Cid::try_from(value)
        .is_ok()
        .then(|| format!("/ipfs/{value}"))
}

#[cfg(test)]
mod tests {
    use super::{
        attach_command_to_batch, complete_scheme_input, is_batch_delimiter_line,
        is_focus_shorthand_command, is_note_line, scheme_error_message,
        should_display_scheme_value,
    };
    use crate::core::CommandStatus;
    use crate::scheme::{split_words, SchemeVal};
    use crate::state::{AppState, OnError, DEFAULT_TIMEOUT_MS};
    use leptos::prelude::*;

    #[test]
    fn semicolon_led_lines_are_terminal_notes() {
        assert!(is_note_line("; This is a (.my.ctx.room) note"));
        assert!(is_note_line("  ;;also-a-note"));
        assert!(!is_note_line("say ;not-a-note"));
    }

    #[test]
    fn batch_delimiters_use_bang_verbs() {
        assert!(is_batch_delimiter_line(".batch!sync"));
        assert!(is_batch_delimiter_line(".batch!async timeout=5s"));
        assert!(is_batch_delimiter_line(".batch"));
        assert!(!is_batch_delimiter_line(".batch:sync"));
        assert!(!is_batch_delimiter_line(".batch:async"));
    }

    #[test]
    fn standalone_scheme_nil_is_not_displayed() {
        assert!(!should_display_scheme_value(&SchemeVal::Nil));
        assert!(should_display_scheme_value(&SchemeVal::Int(3)));
    }

    #[test]
    fn multiline_scheme_input_waits_for_a_balanced_form() {
        let mut pending = String::new();

        assert_eq!(complete_scheme_input(&mut pending, "(define (look)"), None);
        assert_eq!(pending, "(define (look)");
        assert_eq!(
            complete_scheme_input(&mut pending, "  (@(avatar):look))"),
            Some("(define (look)\n  (@(avatar):look))".to_string())
        );
        assert!(pending.is_empty());
    }

    #[test]
    fn multiline_scheme_input_ignores_parentheses_in_strings() {
        let mut pending = String::new();

        assert_eq!(
            complete_scheme_input(&mut pending, "say \"an (unclosed parenthesis\""),
            Some("say \"an (unclosed parenthesis\"".to_string())
        );
        assert!(pending.is_empty());
    }

    #[test]
    fn focus_shorthand_gate_accepts_bare_words_only() {
        assert!(is_focus_shorthand_command("look"));
        assert!(is_focus_shorthand_command("look north"));
        assert!(!is_focus_shorthand_command("@ma#room:look"));
        assert!(!is_focus_shorthand_command(".z.avatar"));
        assert!(!is_focus_shorthand_command("/local/path"));
        assert!(!is_focus_shorthand_command("(look)"));
        assert!(!is_focus_shorthand_command(""));
        assert!(!is_focus_shorthand_command("   "));
    }

    #[test]
    fn split_words_splits_on_whitespace() {
        assert_eq!(
            split_words("put lamp in kiste"),
            vec![
                ("put".to_string(), false),
                ("lamp".to_string(), false),
                ("in".to_string(), false),
                ("kiste".to_string(), false),
            ]
        );
    }

    #[test]
    fn split_words_collapses_a_quoted_phrase_into_one_token() {
        assert_eq!(
            split_words("say \"hello there\""),
            vec![
                ("say".to_string(), false),
                ("hello there".to_string(), true)
            ]
        );
    }

    #[test]
    fn split_words_does_not_treat_apostrophes_as_quotes() {
        assert_eq!(
            split_words("say don't stop"),
            vec![
                ("say".to_string(), false),
                ("don't".to_string(), false),
                ("stop".to_string(), false),
            ]
        );
    }

    #[test]
    fn split_words_handles_emoji_as_plain_words() {
        assert_eq!(
            split_words("give 🎂 to 💃"),
            vec![
                ("give".to_string(), false),
                ("🎂".to_string(), false),
                ("to".to_string(), false),
                ("💃".to_string(), false),
            ]
        );
    }

    #[test]
    fn split_words_handles_ordinary_multibyte_utf8() {
        assert_eq!(
            split_words("gå til Bjørn på øya"),
            vec![
                ("gå".to_string(), false),
                ("til".to_string(), false),
                ("Bjørn".to_string(), false),
                ("på".to_string(), false),
                ("øya".to_string(), false),
            ]
        );
    }

    #[test]
    fn behaviour_reference_is_extracted_from_plain_or_decorated_reply() {
        let cid = "bafkreihdwdcefgh4dqkjv67uzcmw7ojee6xedzdetojuzjevtenxquvyku";
        let expected = format!("/ipfs/{cid}");

        assert_eq!(
            super::actor_behaviour_reference(cid).as_deref(),
            Some(expected.as_str())
        );
        assert_eq!(
            super::actor_behaviour_reference(&format!("/ipfs/{cid}")).as_deref(),
            Some(expected.as_str())
        );
        assert_eq!(
            super::actor_behaviour_reference(&format!("Current custom behaviour: /ipfs/{cid}."))
                .as_deref(),
            Some(expected.as_str())
        );
        assert_eq!(
            super::actor_behaviour_reference("No custom behaviour is set for this room."),
            None
        );
    }

    #[test]
    fn scheme_error_message_is_prefixed_plainly() {
        assert_eq!(
            scheme_error_message("undefined: mirror"),
            "scheme: undefined: mirror"
        );
        assert_eq!(
            scheme_error_message("quote: expected exactly one argument"),
            "scheme: quote: expected exactly one argument"
        );
    }

    #[test]
    fn pending_doc_eval_releases_sync_batch_on_completion() {
        let state = AppState::new();
        state.batches.update(|batches| {
            batches.insert(
                42,
                crate::state::ActiveBatch {
                    mode: crate::state::BatchMode::Sync,
                    timeout_ms: DEFAULT_TIMEOUT_MS,
                    on_error: OnError::Break,
                    started_at_ms: 0.0,
                    collecting: false,
                    lines: std::collections::VecDeque::new(),
                    sync_cmd_id: None,
                    had_error: false,
                    header_cmd_id: 0,
                    async_pending: 0,
                    step_count: 1,
                },
            );
        });

        let cmd_id = state.push_command(".z.scheme!eval");
        attach_command_to_batch(&state, cmd_id, Some(42));
        state.batches.update(|batches| {
            batches
                .get_mut(&42)
                .expect("batch should exist")
                .sync_cmd_id = Some(cmd_id);
        });

        state.resolve_command_by_id(cmd_id, CommandStatus::Done);

        let batch = state
            .batches
            .get_untracked()
            .remove(&42)
            .expect("batch should exist");
        assert_eq!(batch.sync_cmd_id, None);
        assert!(!batch.had_error);
    }
}
