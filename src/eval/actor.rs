//! Actor message evaluator: routes `@target:verb` commands to transport,
//! with interceptors for `:kinds/`, `:path:edit`, and CID content operations.

use leptos::prelude::*;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::EgoConfig,
    core::CommandStatus,
    i18n::{t, tf},
    state::{AppState, CidOpCtx, EditOpenCtx},
    transport,
    views::editor::EditorMode,
};

// ── Public entry point ────────────────────────────────────────────────────

pub(crate) fn eval_actor(
    target: String,
    verb: Option<String>,
    body: String,
    raw: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    // Bare `@alias` with no verb and empty body → echo the resolved DID.
    if verb.is_none() && body.trim().is_empty() {
        state.push_output(target);
        return;
    }

    let focus_prefix = state
        .focus_actor
        .get_untracked()
        .map(|f| format!("{} ", f.prompt))
        .unwrap_or_default();
    let display = format!("{focus_prefix}{raw}");
    let cmd_id = state.push_command(display);
    let state2 = state.clone();

    spawn_local(async move {
        let result = match verb.as_deref() {
            Some("say")   => Some(transport::send_chat(&target, &body).await),
            Some("emote") => Some(transport::send_emote(&target, &body).await),
            Some(v) => dispatch_verb_to_transport(v, &target, &body, cmd_id, &state2, config).await,
            None          => Some(transport::send_text(&target, &body).await),
        };
        if let Some(r) = result {
            handle_send_result(r, verb.as_deref(), cmd_id, &state2);
        }
    });
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
        CrudOp::Get(path)        => transport::send_crud_get(target, &path).await,
        CrudOp::Set(path, value) => transport::send_crud_set(target, &path, ciborium::Value::Text(value)).await,
        CrudOp::Delete(path)     => transport::send_crud_delete(target, &path).await,
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
                    state.pending_edit_opens.update(|m| {
                        m.insert(
                            msg_id,
                            EditOpenCtx {
                                target: target.to_string(),
                                crud_path: ".kinds".to_string(),
                                editor_mode: EditorMode::KindEdit {
                                    target: target.to_string(),
                                    protocol_id: protocol_id.clone(),
                                },
                                cmd_id,
                            },
                        );
                    });
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
            state.pending_edit_opens.update(|m| {
                m.insert(
                    msg_id,
                    EditOpenCtx {
                        target: target.to_string(),
                        crud_path,
                        editor_mode,
                        cmd_id,
                    },
                );
            });
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
            state.pending_cid_ops.update(|m| {
                m.insert(
                    msg_id,
                    CidOpCtx {
                        op: op_name.to_string(),
                        args,
                        cmd_id,
                    },
                );
            });
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
