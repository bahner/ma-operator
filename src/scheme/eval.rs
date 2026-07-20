/// ma-agent scheme evaluation context.
///
/// `EvalCtx` wraps Leptos signals and `AppState`, implementing the
/// `ma_zscheme::SchemeCtx` host trait so the ma-zscheme evaluator can
/// access config, transport, and UI in a platform-specific way.
///
/// All evaluator logic (parser, TCO eval loop, builtins) lives in
/// `ma-zscheme`.  This file only contains the host-side glue.
use futures::{channel::oneshot, future::LocalBoxFuture};
use leptos::prelude::{GetUntracked, RwSignal, Update};
use ma_zscheme::{SchemeCtx, SchemeErr, SchemeVal};

use crate::{config::EgoConfig, parser::command, state::AppState};

// Re-exports used by scheme/mod.rs and callers outside this module.
pub use ma_zscheme::host::Ctx;

// ── Evaluation context ─────────────────────────────────────────────────────

/// Host context threaded through every recursive eval call.
pub struct EvalCtx {
    pub state: AppState,
    pub config: RwSignal<EgoConfig>,
}

// ── SchemeCtx implementation ───────────────────────────────────────────────

impl SchemeCtx for EvalCtx {
    // ── Sync ─────────────────────────────────────────────────────────────

    fn eval_dot(&self, cmd: &str) -> Result<SchemeVal, SchemeErr> {
        use crate::parser::command::{parse, Command, DotOp};
        let cfg = self.config.get_untracked();
        match parse(cmd, &cfg) {
            Err(e) => Err(SchemeErr::MaError(e)),
            Ok(Command::LocalCrud { path, op, .. }) => match op {
                DotOp::Get => {
                    if let Some(val) = cfg.get(&path) {
                        Ok(SchemeVal::Str(val.to_string()))
                    } else {
                        let pairs = cfg.list(&path);
                        if pairs.is_empty() {
                            Err(SchemeErr::MaError(format!("no value at {path}")))
                        } else {
                            Ok(SchemeVal::List(
                                pairs
                                    .into_iter()
                                    .map(|(k, _)| SchemeVal::Str(k.to_string()))
                                    .collect(),
                            ))
                        }
                    }
                }
                DotOp::Set(val) => {
                    self.config.update(|c| c.set(&path, &val));
                    Ok(SchemeVal::Nil)
                }
                DotOp::Delete => {
                    self.config.update(|c| {
                        c.delete_subtree(&path);
                    });
                    Ok(SchemeVal::Nil)
                }
                // Side-effect verbs are queued back to the terminal input.
                DotOp::Meta(_) => {
                    self.state
                        .input_queue
                        .update(|q| q.push_back(cmd.to_string()));
                    Ok(SchemeVal::Nil)
                }
            },
            Ok(_) => Err(SchemeErr::MaError(format!(
                "expected a local .my or .ma.ctx path, got: {cmd}"
            ))),
        }
    }

    fn display_output(&self, text: &str) {
        self.state.push_system(text);
    }

    fn resolve_target(&self, raw: &str) -> Result<String, String> {
        command::resolve_target(raw, &self.config.get_untracked())
    }

    fn register_reply_sender(
        &self,
        msg_id: String,
        sender: oneshot::Sender<Result<SchemeVal, String>>,
    ) {
        self.state.register_scheme_sender(msg_id, sender);
    }

    // ── Async ─────────────────────────────────────────────────────────────

    fn fetch_path<'a>(&'a self, path: &'a str) -> LocalBoxFuture<'a, Result<String, String>> {
        let path = path.to_string();
        Box::pin(async move { crate::http::fetch_path_text(&path).await })
    }

    fn eval_actor<'a>(
        &'a self,
        command: &'a str,
    ) -> LocalBoxFuture<'a, Result<SchemeVal, SchemeErr>> {
        Box::pin(async move {
            use crate::parser::command::{parse, Command};
            let effective = if command.starts_with('@') || command.starts_with("did:") {
                command.to_string()
            } else {
                format!("@{command}")
            };
            let cfg = self.config.get_untracked();
            let parsed = parse(&effective, &cfg).map_err(SchemeErr::MaError)?;
            let (target, verb, body) = match parsed {
                Command::ActorMessage {
                    target,
                    verb,
                    meta: None,
                    body,
                } => (target, verb, body),
                Command::ActorMessage {
                    meta: Some(meta), ..
                } => {
                    return Err(SchemeErr::MaError(format!(
                        "unsupported local actor meta: !{meta}"
                    )))
                }
                _ => {
                    return Err(SchemeErr::MaError(format!(
                        "expected an actor message, got: {effective}"
                    )))
                }
            };
            let verb_str = verb.unwrap_or_default();
            let scheme_args: Vec<SchemeVal> = body
                .split_whitespace()
                .map(|s| SchemeVal::Str(s.to_string()))
                .collect();
            let msg_id = crate::transport::send_rpc_vals(&target, &verb_str, &scheme_args)
                .await
                .map_err(SchemeErr::MaError)?;
            let (sender, receiver) =
                futures::channel::oneshot::channel::<Result<SchemeVal, String>>();
            self.state.register_scheme_sender(msg_id, sender);
            match receiver.await {
                Ok(Ok(val)) => Ok(val),
                Ok(Err(e)) => Err(SchemeErr::MaError(e)),
                Err(_) => Err(SchemeErr::MaError(
                    "RPC reply channel cancelled".to_string(),
                )),
            }
        })
    }

    fn eval_actor_with_vals<'a>(
        &'a self,
        actor: &'a str,
        args: &'a [SchemeVal],
    ) -> LocalBoxFuture<'a, Result<SchemeVal, SchemeErr>> {
        Box::pin(async move {
            use crate::parser::command::{parse, Command};
            let effective = if actor.starts_with('@') || actor.starts_with("did:") {
                actor.to_string()
            } else {
                format!("@{actor}")
            };
            let cfg = self.config.get_untracked();
            let parsed = parse(&effective, &cfg).map_err(SchemeErr::MaError)?;
            let (target, verb) = match parsed {
                Command::ActorMessage { target, verb, .. } => (target, verb),
                _ => return Err(SchemeErr::MaError(format!("expected actor: {effective}"))),
            };
            let verb_str = verb.unwrap_or_default();
            let msg_id = crate::transport::send_rpc_vals(&target, &verb_str, args)
                .await
                .map_err(SchemeErr::MaError)?;
            let (sender, receiver) =
                futures::channel::oneshot::channel::<Result<SchemeVal, String>>();
            self.state.register_scheme_sender(msg_id, sender);
            match receiver.await {
                Ok(Ok(val)) => Ok(val),
                Ok(Err(e)) => Err(SchemeErr::MaError(e)),
                Err(_) => Err(SchemeErr::MaError(
                    "RPC reply channel cancelled".to_string(),
                )),
            }
        })
    }

    fn send_rpc<'a>(
        &'a self,
        target: &'a str,
        verb: &'a str,
        args: &'a [SchemeVal],
    ) -> LocalBoxFuture<'a, Result<String, String>> {
        let target = target.to_string();
        let verb = verb.to_string();
        let args: Vec<SchemeVal> = args.to_vec();
        Box::pin(async move { crate::transport::send_rpc_vals(&target, &verb, &args).await })
    }

    fn send_text<'a>(
        &'a self,
        target: &'a str,
        body: &'a str,
    ) -> LocalBoxFuture<'a, Result<String, String>> {
        let target = target.to_string();
        let body = body.to_string();
        Box::pin(async move { crate::transport::send_text(&target, &body).await })
    }
}
