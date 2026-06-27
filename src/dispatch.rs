//! Input dispatch loop.
//!
//! `run_dispatch_loop` is spawned once at login.  It drains `input_queue`
//! every 50 ms, handles `.batch:sync`/`.batch:async`/`.batch` delimiters,
//! advances sync batches when their current step resolves, and finalises
//! completed async batches.

use leptos::prelude::*;

use crate::{
    config::EgoConfig,
    core::CommandStatus,
    eval::{actor_send::execute_outbox_task, eval},
    i18n::{t, tf},
    identity::storage::save_history,
    parser::command::parse,
    state::{ActiveBatch, AppState, BatchMode, OnError, DEFAULT_TIMEOUT_MS},
    views::editor::EditorContext,
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
            let next_task = state.outbox_queue.update_untracked(|q| q.pop_front());
            match next_task {
                None => break,
                Some(task) => {
                    let state2 = state.clone();
                    wasm_bindgen_futures::spawn_local(async move {
                        execute_outbox_task(task, &state2).await;
                    });
                }
            }
        }
    }
}

// ── TTL expiry ────────────────────────────────────────────────────────────

/// Expire all pending requests that have exceeded their TTL (all PendingKind variants).
/// Uses the owning batch's `timeout_ms` when available; falls back to
/// `DEFAULT_TIMEOUT_MS` for standalone (non-batch) requests.
/// Called every tick from the dispatch loop — no JS callbacks involved.
fn expire_pending_requests(state: &AppState) {
    let now = js_sys::Date::now();
    let batch_timeouts: std::collections::HashMap<u64, u32> = state
        .batches
        .with_untracked(|b| b.iter().map(|(id, ab)| (*id, ab.timeout_ms)).collect());
    let expired: Vec<(String, Option<u64>)> = state.pending_requests.with_untracked(|m| {
        m.iter()
            .filter_map(|(msg_id, tr)| {
                let timeout_ms = tr
                    .batch_id
                    .and_then(|bid| batch_timeouts.get(&bid).copied())
                    .unwrap_or(DEFAULT_TIMEOUT_MS) as f64;
                if now - tr.sent_at_ms > timeout_ms {
                    log::debug!(
                        "[pending] expire msg_id={} kind={:?} age={:.0}ms ttl={:.0}ms",
                        msg_id,
                        tr.kind,
                        now - tr.sent_at_ms,
                        timeout_ms
                    );
                    Some((msg_id.clone(), tr.kind.cmd_id()))
                } else {
                    None
                }
            })
            .collect()
    });
    for (msg_id, cmd_id_opt) in expired {
        // Remove first so inbox_poll can't also resolve it.
        state
            .pending_requests
            .update_untracked(|m| m.remove(&msg_id));
        if let Some(cmd_id) = cmd_id_opt {
            log::debug!("[pending] failing cmd_id={} due to TTL expiry", cmd_id);
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(t("msg-timeout")));
            state.push_error(t("msg-timeout"));
        } else {
            log::debug!(
                "[pending] silently dropped expired entry msg_id={} (no cmd_id)",
                msg_id
            );
        }
    }
}

// ── Per-line handler ───────────────────────────────────────────────────────

fn handle_input_line(
    line: String,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    // Are we inside a batch collector?
    let collecting_id = state.batches.with_untracked(|b| {
        b.iter()
            .find_map(|(id, ab)| if ab.collecting { Some(*id) } else { None })
    });

    // Update history for non-comment, non-batch-delimiter lines.
    // A comment is '# text' (hash + space) — bare '#foo' is a topic command.
    let is_comment = line.trim_start().starts_with("# ") || line.trim() == "#";
    let is_batch_delimiter = line.trim() == ".batch"
        || line.trim().starts_with(".batch:sync")
        || line.trim().starts_with(".batch:async");
    if !is_comment && !is_batch_delimiter {
        state.history.update(|h| {
            if h.last().map(|s| s.as_str()) != Some(line.as_str()) {
                h.push(line.clone());
            }
            if h.len() > 200 {
                h.drain(0..h.len() - 200);
            }
        });
        if let Some(sess) = state.session.get_untracked() {
            let username = sess.username;
            let hist = state.history.get_untracked();
            wasm_bindgen_futures::spawn_local(async move {
                if let Ok(json) = serde_json::to_string(&hist) {
                    let _ = save_history(&username, &json).await;
                }
            });
        }
    }

    if let Some(batch_id) = collecting_id {
        if line.trim() == ".batch" {
            close_batch(batch_id, state, config, show_editor, on_eval);
        } else if !line.trim_start().starts_with("# ")
            && line.trim() != "#"
            && !line.trim().is_empty()
        {
            state.batches.update(|b| {
                if let Some(ab) = b.get_mut(&batch_id) {
                    ab.lines.push_back(line);
                }
            });
        }
        return;
    }

    // Batch open?
    let trimmed = line.trim();
    if trimmed.starts_with(".batch:sync") || trimmed.starts_with(".batch:async") {
        open_batch(trimmed, state);
        return;
    }

    // Scheme expansion: pre-process `(…)` spans before normal dispatch.
    if crate::scheme::needs_expansion(trimmed) {
        let state2 = state.clone();
        let line_owned = trimmed.to_string();
        wasm_bindgen_futures::spawn_local(async move {
            match crate::scheme::expand(&line_owned, &state2, config).await {
                Ok(expanded) => {
                    state2.input_queue.update(|q| q.push_back(expanded));
                }
                Err(e) => {
                    state2.push_error(format!("scheme: {e}"));
                }
            }
        });
        return;
    }

    // Regular (non-batch) dispatch.
    dispatch_eval_line(trimmed, state, config, show_editor, on_eval, None);
}

// ── Batch open / close ────────────────────────────────────────────────────

fn parse_timeout(line: &str, default_ms: u32) -> u32 {
    line.split_whitespace()
        .find_map(|tok| {
            let v = tok.strip_prefix("timeout=")?;
            if let Some(s) = v.strip_suffix("ms") {
                s.parse::<u32>().ok()
            } else if let Some(s) = v.strip_suffix('s') {
                s.parse::<u32>().ok().map(|n| n * 1000)
            } else {
                v.parse::<u32>().ok()
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

    let mode = if line.starts_with(".batch:sync") {
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
                id: batch_id,
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
        b.get(&batch_id)
            .map(|ab| (ab.mode.clone(), ab.lines.is_empty()))
            .unwrap_or((BatchMode::Sync, true))
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
                .map(|ab| ab.had_error && ab.on_error == OnError::Break)
                .unwrap_or(false)
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
/// creating a pending cmd_id) so they don't stall for a full 50 ms tick.
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
                .map(|ab| ab.had_error && ab.on_error == OnError::Break)
                .unwrap_or(false)
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
                .with_untracked(|b| b.get(&batch_id).map(|ab| ab.had_error).unwrap_or(false));
            finish_batch(batch_id, state, had_error);
            return;
        };

        let new_cmd_id =
            dispatch_eval_line(&line, state, config, show_editor, on_eval, Some(batch_id));

        if let Some(cmd_id) = new_cmd_id {
            // @-command — wait for its reply.
            let timeout_ms = state.batches.with_untracked(|b| {
                b.get(&batch_id)
                    .map(|ab| ab.timeout_ms)
                    .unwrap_or(DEFAULT_TIMEOUT_MS)
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
                        .map(|ab| ab.sync_cmd_id == Some(cmd_id))
                        .unwrap_or(false)
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
        CommandStatus::Done
    };
    state.entries.with_untracked(|v| {
        for entry in v.iter() {
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
/// When `batch_id` is `Some`, registers the new cmd_id in `cmd_to_batch` so
/// `resolve_command_by_id` can advance the batch when the reply arrives.
fn dispatch_eval_line(
    line: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
    batch_id: Option<u64>,
) -> Option<u64> {
    let focus = state.focus_actor.get_untracked();
    let cfg = config.get_untracked();

    match parse(line, &cfg, focus.as_ref().map(|f| f.target.as_str())) {
        Ok(cmd) => {
            let is_actor = matches!(cmd, crate::parser::command::Command::ActorMessage { .. });
            let before = state.peek_next_entry_id();
            eval(cmd, line, state, config, show_editor, on_eval);
            let after = state.peek_next_entry_id();
            if is_actor {
                log::debug!(
                    "[dispatch] actor eval: before={before} after={after} queue_len={}",
                    state.outbox_queue.with_untracked(|q| q.len())
                );
            }
            if after > before {
                let new_cmd_id = after - 1;
                if let Some(bid) = batch_id {
                    state.cmd_to_batch.update(|m| {
                        m.insert(new_cmd_id, bid);
                    });
                }
                Some(new_cmd_id)
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
