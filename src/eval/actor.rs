//! Actor message and remote CRUD evaluators.

use crate::{
    config::EgoConfig,
    core::CommandStatus,
    i18n::{t, tf},
    parser::command::RemoteCrudOp,
    state::{AppState, OutboxTask, PendingKind},
    transport,
    views::editor::EditorMode,
};
use leptos::prelude::*;

// ── Public entry point ────────────────────────────────────────────────────

pub(crate) fn eval_actor(
    target: String,
    verb: Option<String>,
    meta: Option<String>,
    body: String,
    raw: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
) {
    let cmd_id = state.push_command(raw);
    if let Some(meta) = meta {
        fail_cmd(
            format!("unsupported local actor meta: !{meta}"),
            cmd_id,
            state,
        );
        return;
    }
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

pub(crate) fn eval_actor_local(
    target: String,
    command: String,
    body: String,
    raw: &str,
    state: &AppState,
) {
    let cmd_id = state.push_command(raw);
    state.outbox_queue.update(|q| {
        q.push_back(OutboxTask::ActorLocal {
            target,
            command,
            body,
            cmd_id,
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

        OutboxTask::ActorArgs {
            target,
            verb,
            args,
            cmd_id,
        } => {
            let arg_refs: Vec<&str> = args.iter().map(String::as_str).collect();
            let result = transport::send_rpc(&target, &verb, &arg_refs).await;
            handle_send_result(result, Some(&verb), cmd_id, state);
        }

        OutboxTask::ActorLocal {
            target,
            command,
            body,
            cmd_id,
        } => {
            let result = match command.as_str() {
                "msg" | "message" | "text" => Some(transport::send_text(&target, &body).await),
                "say" | "chat" => Some(transport::send_chat(&target, &body).await),
                "emote" => Some(transport::send_emote(&target, &body).await),
                other => match crate::parser::command::shell_split(&body) {
                    Ok(args) => {
                        let arg_refs: Vec<&str> = args.iter().map(String::as_str).collect();
                        Some(transport::send_rpc(&target, other, &arg_refs).await)
                    }
                    Err(e) => Some(Err(e)),
                },
            };
            if let Some(r) = result {
                let reply_verb = match command.as_str() {
                    "msg" | "message" | "text" | "say" | "chat" | "emote" => None,
                    other => Some(other),
                };
                handle_send_result(r, reply_verb, cmd_id, state);
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

// ── Remote CRUD ───────────────────────────────────────────────────────────

/// Evaluate a `@alias/path` remote CRUD command.
///
/// | op | action |
/// |---|---|
/// | `Get` | Send CRUD GET, display reply |
/// | `Edit` | Send CRUD GET, open editor on reply |
/// | `Set(value)` | Send CRUD SET |
/// | `Delete` | Send CRUD DELETE |
pub(crate) fn eval_remote_crud(
    target: String,
    path: String,
    op: RemoteCrudOp,
    raw: &str,
    state: &AppState,
    _show_editor: RwSignal<Option<crate::views::editor::EditorContext>>,
    config: RwSignal<EgoConfig>,
) {
    let cmd_id = state.push_command(raw);
    let state2 = state.clone();
    leptos::task::spawn_local(async move {
        match op {
            RemoteCrudOp::Get => match transport::send_crud_get(&target, &path).await {
                Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                Err(e) => fail_cmd(e, cmd_id, &state2),
            },
            RemoteCrudOp::Edit => {
                let editor_mode = editor_mode_for_path(&path, &target);
                match transport::send_crud_get(&target, &path).await {
                    Ok(msg_id) => state2.register_pending(
                        msg_id,
                        PendingKind::EditOpen {
                            target,
                            crud_path: path,
                            editor_mode,
                            cmd_id,
                        },
                        None,
                    ),
                    Err(e) => fail_cmd(e, cmd_id, &state2),
                }
            }
            RemoteCrudOp::Set(value) => {
                let value =
                    match normalize_remote_crud_set_value(&path, &value, &config.get_untracked()) {
                        Ok(value) => value,
                        Err(e) => {
                            fail_cmd(e, cmd_id, &state2);
                            return;
                        }
                    };
                match transport::send_crud_set(&target, &path, ciborium::Value::Text(value)).await {
                    Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                    Err(e) => fail_cmd(e, cmd_id, &state2),
                }
            }
            RemoteCrudOp::Delete => match transport::send_crud_delete(&target, &path).await {
                Ok(msg_id) => state2.bind_message_id(cmd_id, msg_id),
                Err(e) => fail_cmd(e, cmd_id, &state2),
            },
        }
    });
}

/// Determine which `EditorMode` to use for a given CRUD `/path`.
pub(crate) fn editor_mode_for_path(path: &str, target: &str) -> EditorMode {
    if path == "/acl" {
        return EditorMode::RuntimeAclEdit {
            target: target.to_string(),
        };
    }
    if let Some(rest) = path.strip_prefix("/entities/") {
        return if let Some((name, field)) = rest.split_once('/') {
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
        };
    }
    if let Some(proto_rest) = path.strip_prefix("/kinds/") {
        return EditorMode::KindEdit {
            target: target.to_string(),
            protocol_id: format!("/{proto_rest}"),
        };
    }
    EditorMode::CrudEdit {
        target: target.to_string(),
        crud_path: path.to_string(),
        creatable: is_creatable_crud_path(path),
        is_link: false,
    }
}

fn is_creatable_crud_path(path: &str) -> bool {
    matches!(path, "/config/root")
}

// ── Internal dispatcher ───────────────────────────────────────────────────

/// Route a verb to the right transport call.
///
/// Only handles pure RPC (fragment-addressed targets or bare-atom verbs).
/// Remote CRUD is handled by `eval_remote_crud` via `Command::RemoteCrud`.
async fn dispatch_verb_to_transport(
    v: &str,
    target: &str,
    body: &str,
    _cmd_id: u64,
    _state: &AppState,
    _config: RwSignal<EgoConfig>,
) -> Option<Result<String, String>> {
    match crate::parser::command::shell_split(body) {
        Ok(args) => {
            let arg_refs: Vec<&str> = args.iter().map(String::as_str).collect();
            Some(transport::send_rpc(target, v, &arg_refs).await)
        }
        Err(e) => Some(Err(e)),
    }
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

fn normalize_remote_crud_set_value(
    path: &str,
    value: &str,
    config: &EgoConfig,
) -> Result<String, String> {
    if path != "/config/root" {
        return Ok(value.to_string());
    }
    let value = if let Some(did) = value.strip_prefix("@did:") {
        format!("did:{did}")
    } else {
        crate::parser::alias::resolve_targets(value, config)?
    };
    let value = value.trim().to_string();
    if value.starts_with("did:ma:") && value.contains('#') {
        Ok(value)
    } else {
        Err("/config/root must be a full actor DID-URL like @runtime#root".to_string())
    }
}

#[cfg(test)]
mod tests {
    use super::{editor_mode_for_path, normalize_remote_crud_set_value};
    use crate::config::EgoConfig;
    use crate::views::editor::EditorMode;

    #[test]
    fn config_root_set_expands_alias_fragment() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.sky", "did:ma:k51sky");
        let value = normalize_remote_crud_set_value("/config/root", "@sky#root", &cfg).unwrap();
        assert_eq!(value, "did:ma:k51sky#root");
    }

    #[test]
    fn config_root_set_rejects_non_actor_value() {
        let cfg = EgoConfig::default();
        assert!(normalize_remote_crud_set_value("/config/root", "@sky", &cfg).is_err());
        assert!(normalize_remote_crud_set_value("/config/root", "did:ma:k51sky", &cfg).is_err());
    }

    #[test]
    fn other_remote_crud_set_values_are_not_expanded() {
        let mut cfg = EgoConfig::default();
        cfg.set(".my.aliases.sky", "did:ma:k51sky");
        let value = normalize_remote_crud_set_value("/config/name", "@sky#root", &cfg).unwrap();
        assert_eq!(value, "@sky#root");
    }

    #[test]
    fn config_root_crud_edit_is_creatable() {
        match editor_mode_for_path("/config/root", "did:ma:test-runtime") {
            EditorMode::CrudEdit { creatable, .. } => assert!(creatable),
            other => panic!("unexpected mode: {other:?}"),
        }
    }

    #[test]
    fn unrelated_crud_edit_is_not_creatable() {
        match editor_mode_for_path("/config/name", "did:ma:test-runtime") {
            EditorMode::CrudEdit { creatable, .. } => assert!(!creatable),
            other => panic!("unexpected mode: {other:?}"),
        }
    }
}
