//! Actor message evaluator: routes `@target:verb` commands to transport,
//! with interceptors for `:kinds/`, `:path:edit`, and CID content operations.

use crate::{
    config::EgoConfig,
    core::CommandStatus,
    i18n::{t, tf},
    state::{AppState, OutboxTask, PendingKind},
    transport,
    views::editor::EditorMode,
};
use leptos::prelude::*;

// ── Public entry point ────────────────────────────────────────────────────

pub(crate) fn eval_actor(
    target: String,
    verb: Option<String>,
    body: String,
    raw: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    let cmd_id = state.push_command(raw);
    state.outbox_queue.update(|q| {
        q.push_back(OutboxTask::Actor {
            target,
            verb,
            body,
            cmd_id,
            config,
        })
    });
}

/// Execute one queued outbox task. Called serially from the dispatch loop.
pub(crate) async fn execute_outbox_task(task: OutboxTask, state: &AppState) {
    match task {
        OutboxTask::Actor {
            target,
            verb,
            body,
            cmd_id,
            config,
        } => {
            log::debug!("[outbox] execute Actor cmd_id={cmd_id} target={target:?} verb={verb:?}");
            let result = match verb.as_deref() {
                // :say and :emote to a #fragment target are RPC to a room entity,
                // not direct inbox messages. Fall through to dispatch_verb_to_transport.
                Some("say") if !target.contains('#') => {
                    Some(transport::send_chat(&target, &body).await)
                }
                Some("emote") if !target.contains('#') => {
                    Some(transport::send_emote(&target, &body).await)
                }
                Some(v) => {
                    dispatch_verb_to_transport(v, &target, &body, cmd_id, state, config).await
                }
                None => Some(transport::send_text(&target, &body).await),
            };
            log::debug!(
                "[outbox] Actor done cmd_id={cmd_id} result={:?}",
                result.as_ref().map(|r| r.is_ok())
            );
            if let Some(r) = result {
                // For :say/:emote to a #fragment target, these are RPCs that get a reply.
                // Bind the message_id so the :ok reply is matched and silently resolved.
                let effective_verb = if matches!(verb.as_deref(), Some("say") | Some("emote"))
                    && target.contains('#')
                {
                    None // treat like a normal RPC (bind message_id)
                } else {
                    verb.as_deref()
                };
                handle_send_result(r, effective_verb, cmd_id, state);
            }
        }

        OutboxTask::CrudSet {
            target_did,
            crud_path,
            value,
            cmd_id,
        } => match transport::send_crud_set(&target_did, &crud_path, value).await {
            Ok(set_msg_id) => {
                if let Some(original_cmd_id) = cmd_id {
                    state.register_pending(
                        set_msg_id,
                        PendingKind::CrudConfirm {
                            cmd_id: original_cmd_id,
                        },
                        None,
                    );
                }
            }
            Err(e) => {
                if let Some(cid) = cmd_id {
                    state.resolve_command_by_id(cid, crate::core::CommandStatus::Error(e.clone()));
                }
                state.push_error(e);
            }
        },

        OutboxTask::RpcPong {
            target,
            reply_to_id,
        } => {
            let _ = transport::send_rpc_pong(&target, &reply_to_id).await;
        }
    }
}

// ── Internal dispatcher ───────────────────────────────────────────────────

/// Route a verb to the right transport call.
///
/// Returns `Some(result)` when the call should go through normal reply
/// tracking, or `None` when an interceptor already handled success/failure.
async fn dispatch_verb_to_transport(
    v: &str,
    target: &str,
    body: &str,
    cmd_id: u64,
    state: &AppState,
    _config: RwSignal<EgoConfig>,
) -> Option<Result<String, String>> {
    // Fragment-addressed targets and bare-atom verbs always use RPC.
    if target.contains('#') || (!v.contains('.') && !v.contains(':')) {
        return Some(
            transport::send_rpc(target, v, &body.split_whitespace().collect::<Vec<_>>()).await,
        );
    }
    let v_inner = v.strip_prefix(':').unwrap_or(v);

    if intercept_kinds(v_inner, target, body, cmd_id, state).await {
        return None;
    }
    if intercept_edit(v_inner, target, cmd_id, state).await {
        return None;
    }
    if intercept_cid_op(v_inner, target, body, cmd_id, state).await {
        return None;
    }

    Some(match parse_crud_op(v, body) {
        CrudOp::Get(path) => transport::send_crud_get(target, &path).await,
        CrudOp::Set(path, value) => {
            transport::send_crud_set(target, &path, ciborium::Value::Text(value)).await
        }
        CrudOp::Delete(path) => transport::send_crud_delete(target, &path).await,
    })
}

// ── Interceptors ──────────────────────────────────────────────────────────

/// `:kinds/<protocol>` interceptor — converts protocol-path verbs to CBOR
/// arguments and dispatches via CRUD SET on `.kinds`.
///
/// Returns `true` when the request was handled (regardless of success).
async fn intercept_kinds(
    v_inner: &str,
    target: &str,
    _body: &str,
    cmd_id: u64,
    state: &AppState,
) -> bool {
    let Some(proto_path) = v_inner.strip_prefix("kinds/") else {
        return false;
    };
    let (bare_proto, op) = if let Some(p) = proto_path.strip_suffix(":edit") {
        (p, "edit")
    } else if let Some(p) = proto_path.strip_suffix(':') {
        (p, "delete")
    } else {
        (proto_path, "get")
    };
    let protocol_id = format!("/{bare_proto}");

    match op {
        "get" | "edit" => {
            let result = transport::send_crud_set(
                target,
                ".kinds",
                ciborium::Value::Text(protocol_id.clone()),
            )
            .await;
            match result {
                Ok(msg_id) if op == "edit" => {
                    state.register_pending(
                        msg_id,
                        PendingKind::EditOpen {
                            target: target.to_string(),
                            crud_path: ".kinds".to_string(),
                            editor_mode: EditorMode::KindEdit {
                                target: target.to_string(),
                                protocol_id: protocol_id.clone(),
                            },
                            cmd_id,
                        },
                        None,
                    );
                }
                Ok(_) => {}
                Err(e) => fail_cmd(e, cmd_id, state),
            }
        }
        _ => {
            // DELETE
            if let Err(e) = transport::send_crud_set(
                target,
                ".kinds",
                ciborium::Value::Array(vec![ciborium::Value::Text(protocol_id.clone())]),
            )
            .await
            {
                fail_cmd(e, cmd_id, state);
            }
        }
    }
    true
}

/// `:path:edit` interceptor — sends a CRUD GET so the poll loop can open the
/// editor with the response.
///
/// Returns `true` when the request was handled.
async fn intercept_edit(v_inner: &str, target: &str, cmd_id: u64, state: &AppState) -> bool {
    let Some(path_part) = v_inner.strip_suffix(":edit") else {
        return false;
    };
    let crud_path = format!(".{path_part}");
    let editor_mode = match path_part {
        "acl" => EditorMode::RuntimeAclEdit {
            target: target.to_string(),
        },
        s if s.starts_with("entities.") => {
            let rest = &s["entities.".len()..];
            if let Some((name, field)) = rest.split_once('.') {
                EditorMode::EntityFieldEdit {
                    target: target.to_string(),
                    entity_name: name.to_string(),
                    field: field.to_string(),
                }
            } else {
                EditorMode::EntityEdit {
                    target: target.to_string(),
                    entity_name: rest.to_string(),
                }
            }
        }
        _ => EditorMode::CrudEdit {
            target: target.to_string(),
            crud_path: crud_path.clone(),
            content_type: String::new(),
        },
    };
    match transport::send_crud_get(target, &crud_path).await {
        Ok(msg_id) => {
            state.register_pending(
                msg_id,
                PendingKind::EditOpen {
                    target: target.to_string(),
                    crud_path,
                    editor_mode,
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => fail_cmd(e, cmd_id, state),
    }
    true
}

/// CID content-operation interceptor — sends a CRUD GET so the poll loop can
/// fetch the returned CID and apply the operation (cat / head / tail / wc).
///
/// Returns `true` when the request was handled.
async fn intercept_cid_op(
    v_inner: &str,
    target: &str,
    body: &str,
    cmd_id: u64,
    state: &AppState,
) -> bool {
    let Some((base_verb, op_name)) = crate::cid_ops::find_op(v_inner) else {
        return false;
    };
    let crud_path = format!(".{base_verb}");
    let args: Vec<String> = body.split_whitespace().map(String::from).collect();
    match transport::send_crud_get(target, &crud_path).await {
        Ok(msg_id) => {
            state.register_pending(
                msg_id,
                PendingKind::CidOp {
                    op: op_name.to_string(),
                    args,
                    cmd_id,
                },
                None,
            );
        }
        Err(e) => fail_cmd(e, cmd_id, state),
    }
    true
}

// ── Helpers ───────────────────────────────────────────────────────────────

/// Handle the result of a transport call: bind reply tracking or push error.
fn handle_send_result(
    result: Result<String, String>,
    verb: Option<&str>,
    cmd_id: u64,
    state: &AppState,
) {
    match result {
        Ok(msg_id) => {
            if matches!(verb, None | Some("say") | Some("emote")) {
                state.resolve_command_by_id(cmd_id, CommandStatus::Done);
            } else {
                state.bind_message_id(cmd_id, msg_id);
            }
        }
        Err(e) => {
            state.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
            let display = e.replace("not logged in", &t("msg-not-logged-in"));
            state.push_error(tf("msg-send-failed", &[("e", &display)]));
        }
    }
}

/// Resolve command as error and push a send-failed message.
fn fail_cmd(e: String, cmd_id: u64, state: &AppState) {
    state.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
    let disp = e.replace("not logged in", &t("msg-not-logged-in"));
    state.push_error(tf("msg-send-failed", &[("e", &disp)]));
}

// ── CRUD routing ──────────────────────────────────────────────────────────

enum CrudOp {
    Get(String),
    Set(String, String),
    Delete(String),
}

fn parse_crud_op(verb: &str, body: &str) -> CrudOp {
    let v = verb.strip_prefix(':').unwrap_or(verb);
    let v = v.strip_prefix('.').unwrap_or(v);
    if v == "create" {
        return CrudOp::Set(".create".to_string(), body.trim().to_string());
    }
    if let Some(path) = v.strip_suffix(':') {
        let atom = format!(".{path}");
        return if body.trim().is_empty() {
            CrudOp::Delete(atom)
        } else {
            CrudOp::Set(atom, body.trim().to_string())
        };
    }
    CrudOp::Get(format!(".{v}"))
}
