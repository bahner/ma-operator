/// Main terminal/dashboard view — shown after login.
use leptos::prelude::*;
use ma_core::DidDocumentResolver;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;

use crate::{
    config::{persist_config, restore_config, EgoConfig},
    core::{CommandStatus, Entry, SystemKind},
    i18n::{t, tf},
    identity::storage::{load_history, save_history},
    parser::command::{parse, Command, DotOp},
    parser::verbs::dispatch_verb,
    state::{AppState, CidOpCtx, EditOpenCtx, FocusMode},
    transport,
    views::editor::{EditorContext, EditorModal, EditorMode},
};

fn validate_alias_set(path: &str, value: &str) -> Result<(), String> {
    const PREFIX: &str = ".my.aliases.";
    if !path.starts_with(PREFIX) {
        return Ok(());
    }

    let name = &path[PREFIX.len()..];
    if name.is_empty() {
        return Err(t("err-alias-name-empty"));
    }
    if name.contains('#') {
        return Err(t("err-alias-has-fragment"));
    }
    if value.contains('#') {
        return Err(t("err-alias-value-fragment"));
    }
    if value.contains('/') {
        return Err(t("err-alias-value-path"));
    }
    if !value.starts_with("did:ma:") {
        return Err(t("err-alias-not-did"));
    }
    Ok(())
}

#[component]
pub fn Terminal() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");

    // Per-session reactive config
    let config: RwSignal<EgoConfig> = RwSignal::new(EgoConfig::new());

    // Editor modal signal — Some(EditorContext) opens the overlay
    let show_editor: RwSignal<Option<EditorContext>> = RwSignal::new(None);

    // When .config.editor.persistent is "true", keep the editor panel open
    // at all times using a scratch document.
    {
        let config = config.clone();
        Effect::new(move |_| {
            let is_persistent = config
                .get()
                .get(".config.editor.persistent")
                .unwrap_or("false")
                == "true";
            if is_persistent && show_editor.get().is_none() {
                let cfg = config.get_untracked();
                let initial = cfg
                    .get(".my.doc.scratch.content")
                    .unwrap_or_default()
                    .to_string();
                show_editor.set(Some(EditorContext::new(".my.doc.scratch", initial)));
            }
        });
    }

    // Load config from IndexedDB on mount
    {
        let state2 = state.clone();
        let config = config.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let username = sess.username.clone();
            let sender_did = sess.sender_did.clone();
            let created_at = sess.created_at.clone();
            spawn_local(async move {
                match restore_config(&username).await {
                    Ok(mut cfg) => {
                        // Read-only session-derived field; never persisted
                        // intentionally, but harmless if it leaks: it is
                        // re-injected on every login.
                        cfg.set(".my.identity.did", &sender_did);
                        cfg.set(".my.profile.handle", &username);
                        cfg.set(".my.profile.did", &sender_did);
                        cfg.set(".my.profile.created_at", &created_at);
                        // Prune inbox entries that expired since last session.
                        let now = js_sys::Date::now() / 1000.0;
                        let pruned = crate::mailbox::prune_inbox_expired(&mut cfg, now);
                        apply_config_to_dom(&cfg);
                        // Apply log level from config if set.
                        if let Some(level) = cfg.get(".config.log.level") {
                            crate::apply_log_level(level);
                        }
                        if pruned > 0 {
                            if let Err(e) = persist_config(&username, &cfg).await {
                                state2.push_error(tf("err-inbox-prune-persist", &[("e", &e)]));
                            }
                        }
                        config.set(cfg);
                    }
                    Err(e) => state2.push_error(tf("err-config-load", &[("e", &e)])),
                }
                // Re-apply language preference from config if set.
                if let Some(lang) = config
                    .get_untracked()
                    .get(".my.i18n")
                    .map(|s| s.to_string())
                {
                    let first = lang.split(':').next().unwrap_or(&lang).to_string();
                    crate::i18n::init(&first).await;
                    state2.lang.set(crate::i18n::lang());
                    crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(lang));
                } else if let Some(lang) = config
                    .get_untracked()
                    .get(".config.ui.language")
                    .map(|s| s.to_string())
                {
                    crate::i18n::init(&lang).await;
                    state2.lang.set(crate::i18n::lang());
                } else {
                    // No preference stored yet — seed .my.i18n from the browser-detected language.
                    let browser_lang = crate::i18n::lang();
                    state2.lang.set(browser_lang.clone());
                    let mut cfg = config.get_untracked();
                    cfg.set(".my.i18n", &browser_lang);
                    if let Err(e) = persist_config(&username, &cfg).await {
                        state2.push_error(tf("err-lang-persist", &[("e", &e)]));
                    }
                    config.set(cfg);
                }
                state2.push_system(tf(
                    "msg-logged-in",
                    &[
                        ("version", env!("CARGO_PKG_VERSION")),
                        ("username", &username),
                    ],
                ));
                state2.push_system(t("msg-type-help"));
            });
        }
    }

    // Restore command history from IndexedDB
    {
        let state2 = state.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let username = sess.username.clone();
            spawn_local(async move {
                match load_history(&username).await {
                    Ok(Some(json)) => match serde_json::from_str::<Vec<String>>(&json) {
                        Ok(hist) => state2.history.set(hist),
                        Err(e) => {
                            state2.push_error(tf("err-history-parse", &[("e", &e.to_string())]))
                        }
                    },
                    Ok(None) => {}
                    Err(e) => state2.push_error(tf("err-history-load", &[("e", &e)])),
                }
            });
        }
    }

    // Start iroh endpoint
    {
        let state2 = state.clone();
        let session = state.session.get_untracked();
        if let Some(sess) = session {
            let iroh_key = sess.iroh_key;
            let ipns_secret_key = sess.ipns_secret_key;
            let did_signing_key = sess.did_signing_key;
            let did_encryption_key = sess.did_encryption_key;
            let sender_did = sess.sender_did.clone();
            let created_at = sess.created_at.clone();
            let username = sess.username.clone();
            spawn_local(async move {
                state2.push_system(t("msg-connecting"));
                match transport::connect(
                    iroh_key,
                    ipns_secret_key,
                    did_signing_key,
                    did_encryption_key,
                    sender_did,
                    created_at,
                )
                .await
                {
                    Ok(()) => state2.push_system(t("msg-iroh-ready")),
                    Err(e) => state2.push_error(tf("msg-iroh-failed", &[("e", &e)])),
                }
                let _ = username;
            });
        }
    }

    // Inbox polling loop
    {
        let state2 = state.clone();
        spawn_local(async move {
            loop {
                gloo_timers::future::TimeoutFuture::new(500).await;
                if !transport::is_connected() {
                    continue;
                }
                for incoming in transport::drain_inbox()
                    .into_iter()
                    .chain(transport::drain_rpc_inbox())
                    .chain(transport::drain_crud_inbox())
                {
                    // ACL gate — never filter replies (those are responses to
                    // our own outgoing messages, matched by reply_to message ID).
                    if incoming.reply_to.is_none() {
                        let cap = if incoming.message_type == ma_core::MESSAGE_TYPE_MESSAGE {
                            crate::acl::CAP_INBOX
                        } else {
                            crate::acl::CAP_RPC
                        };
                        let cfg = config.get_untracked();
                        if !crate::acl::check_ego_acl(&cfg, &incoming.from, cap) {
                            let (base, frag) = incoming.from.split_once('#').unwrap_or((&incoming.from, ""));
                            let from_disp = match cfg.reverse_alias(base) {
                                Some(a) if frag.is_empty() => format!("@{a}"),
                                Some(a) => format!("@{a}#{frag}"),
                                None => incoming.from.clone(),
                            };
                            state2.push_system(tf(
                                "msg-blocked",
                                &[("cap", cap), ("from", &from_disp)],
                            ));
                            continue;
                        }
                    }
                    if incoming.message_type == ma_core::MESSAGE_TYPE_MESSAGE {
                        let from_display = {
                            let cfg = config.get_untracked();
                            let (base, frag) = incoming.from.split_once('#').unwrap_or((&incoming.from, ""));
                            match cfg.reverse_alias(base) {
                                Some(a) if frag.is_empty() => format!("@{a}"),
                                Some(a) => format!("@{a}#{frag}"),
                                None => incoming.from.clone(),
                            }
                        };
                        let count = state2.ingest_mailbox_message(&incoming, config);
                        // Persist asynchronously.
                        if let Some(sess) = state2.session.get_untracked() {
                            let uname = sess.username.clone();
                            let cfg_snap = config.get_untracked();
                            spawn_local(async move {
                                if let Err(e) = persist_config(&uname, &cfg_snap).await {
                                    web_sys::console::error_1(
                                        &format!("inbox persist: {e}").into(),
                                    );
                                }
                            });
                        }
                        state2.push_incoming(
                            tf(
                                "msg-new-message",
                                &[
                                    ("from", from_display.as_str()),
                                    ("count", &count.to_string()),
                                ],
                            ),
                            None,
                            false,
                        );
                        continue;
                    }
                    let display = {
                        let cfg = config.get_untracked();
                        let (base, frag) = incoming.from.split_once('#').unwrap_or((&incoming.from, ""));
                        if let Some(alias) = cfg.reverse_alias(base) {
                            let replacement = if frag.is_empty() {
                                format!("@{alias}")
                            } else {
                                format!("@{alias}#{frag}")
                            };
                            incoming.display.replace(&incoming.from, &replacement)
                        } else {
                            incoming.display.clone()
                        }
                    };
                    match &incoming.reply_to {
                        Some(msg_id) => {
                            // Check if this is a pending IPFS-store reply that
                            // should trigger a CRUD set with the returned CID.
                            let pending_crud = state2
                                .pending_ipfs_crud
                                .get_untracked()
                                .get(msg_id)
                                .cloned();
                            if let Some((crud_target, crud_path, cmd_id_opt)) = pending_crud {
                                state2.pending_ipfs_crud.update(|m| {
                                    m.remove(msg_id);
                                });
                                if incoming.is_error {
                                    if let Some(cid) = cmd_id_opt {
                                        state2.resolve_command_by_id(
                                            cid,
                                            CommandStatus::Error(incoming.display.clone()),
                                        );
                                    }
                                    state2.push_error(incoming.display.clone());
                                    continue;
                                }
                                match crate::messages::extract_ok_text(&incoming.content) {
                                    Ok(cid) => {
                                        let state3 = state2.clone();
                                        spawn_local(async move {
                                            match crate::transport::send_crud_set(
                                                &crud_target,
                                                &crud_path,
                                                ciborium::Value::Text(cid),
                                            )
                                            .await
                                            {
                                                Ok(set_msg_id) => {
                                                    if let Some(original_cmd_id) = cmd_id_opt {
                                                        state3.pending_crud_confirms.update(|m| {
                                                            m.insert(set_msg_id, original_cmd_id);
                                                        });
                                                    }
                                                }
                                                Err(e) => {
                                                    if let Some(cid) = cmd_id_opt {
                                                        state3.resolve_command_by_id(
                                                            cid,
                                                            CommandStatus::Error(e.clone()),
                                                        );
                                                    }
                                                    state3.push_error(e);
                                                }
                                            }
                                        });
                                    }
                                    Err(e) => {
                                        if let Some(cid) = cmd_id_opt {
                                            state2.resolve_command_by_id(
                                                cid,
                                                CommandStatus::Error(e.clone()),
                                            );
                                        }
                                        state2
                                            .push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
                                    }
                                }
                                continue;
                            }
                            // Check if this is a pending IPFS-store reply for a kind upsert.
                            let pending_kind = state2
                                .pending_ipfs_kind_upserts
                                .get_untracked()
                                .get(msg_id)
                                .cloned();
                            if let Some((kind_target, protocol_id, cmd_id_opt)) = pending_kind {
                                state2.pending_ipfs_kind_upserts.update(|m| {
                                    m.remove(msg_id);
                                });
                                if incoming.is_error {
                                    if let Some(cid) = cmd_id_opt {
                                        state2.resolve_command_by_id(
                                            cid,
                                            CommandStatus::Error(incoming.display.clone()),
                                        );
                                    }
                                    state2.push_error(incoming.display.clone());
                                    continue;
                                }
                                match crate::messages::extract_ok_text(&incoming.content) {
                                    Ok(cid) => {
                                        let state3 = state2.clone();
                                        spawn_local(async move {
                                            match crate::transport::send_crud_set(
                                                &kind_target,
                                                ":kinds",
                                                ciborium::Value::Array(vec![
                                                    ciborium::Value::Text(protocol_id.clone()),
                                                    ciborium::Value::Text(cid),
                                                ]),
                                            )
                                            .await
                                            {
                                                Ok(set_msg_id) => {
                                                    if let Some(original_cmd_id) = cmd_id_opt {
                                                        state3.pending_crud_confirms.update(|m| {
                                                            m.insert(set_msg_id, original_cmd_id);
                                                        });
                                                    }
                                                }
                                                Err(e) => {
                                                    if let Some(cid) = cmd_id_opt {
                                                        state3.resolve_command_by_id(
                                                            cid,
                                                            CommandStatus::Error(e.clone()),
                                                        );
                                                    }
                                                    state3.push_error(e);
                                                }
                                            }
                                        });
                                    }
                                    Err(e) => {
                                        if let Some(cid) = cmd_id_opt {
                                            state2.resolve_command_by_id(
                                                cid,
                                                CommandStatus::Error(e.clone()),
                                            );
                                        }
                                        state2
                                            .push_error(tf("err-ipfs-reply-decode", &[("e", &e)]));
                                    }
                                }
                                continue;
                            }
                            // Check if this is a pending edit-open reply that
                            // should populate and open the editor.
                            let pending_edit = state2
                                .pending_edit_opens
                                .get_untracked()
                                .get(msg_id)
                                .cloned();
                            if let Some(ctx) = pending_edit {
                                state2.pending_edit_opens.update(|m| {
                                    m.remove(msg_id);
                                });
                                if incoming.is_error {
                                    state2.resolve_command_by_id(
                                        ctx.cmd_id,
                                        CommandStatus::Error(incoming.display.clone()),
                                    );
                                    state2.push_error(incoming.display.clone());
                                    continue;
                                }
                                // Decode the CBOR reply and open the editor.
                                // ACL replies are a CBOR Text string ("/ipfs/<cid>" or "").
                                // Entity replies are raw ciborium CBOR bytes of the struct.
                                let content_bytes = incoming.content.clone();
                                let doc_path = format!("@{}{}", ctx.target, ctx.crud_path);
                                let editor_mode = ctx.editor_mode.clone();
                                let state3 = state2.clone();
                                let resolved_cmd = ctx.cmd_id;
                                match ciborium::de::from_reader::<ciborium::Value, _>(
                                    &mut &content_bytes[..],
                                ) {
                                    Ok(ciborium::Value::Text(s))
                                        if s.starts_with('b') && s.len() > 10 =>
                                    {
                                        // Bare CIDv1 — infer dag-cbor vs raw from codec prefix.
                                        let is_dag_cbor = cid_is_dag_cbor(&s);
                                        let cid = s.clone();
                                        let url = format!(
                                            "{}ipfs/{cid}",
                                            crate::transport::connection::LOCAL_GATEWAY_URL
                                        );
                                        // Update editor_mode to record blob vs IPLD.
                                        let editor_mode = match editor_mode {
                                            EditorMode::CrudEdit {
                                                target, crud_path, ..
                                            } => EditorMode::CrudEdit {
                                                target,
                                                crud_path,
                                                is_blob: Some(!is_dag_cbor),
                                            },
                                            other => other,
                                        };
                                        spawn_local(async move {
                                            if is_dag_cbor {
                                                match fetch_url_bytes(&url).await {
                                                    Ok(bytes) => {
                                                        match crate::messages::cbor_bytes_to_yaml(
                                                            &bytes,
                                                        ) {
                                                            Ok(yaml) => {
                                                                show_editor.set(Some(
                                                                    EditorContext::new(
                                                                        doc_path, yaml,
                                                                    )
                                                                    .with_language("yaml")
                                                                    .with_mode(editor_mode)
                                                                    .with_cmd_id(resolved_cmd),
                                                                ));
                                                            }
                                                            Err(e) => {
                                                                state3.resolve_command_by_id(
                                                                    resolved_cmd,
                                                                    CommandStatus::Error(e.clone()),
                                                                );
                                                                state3.push_error(tf(
                                                                    "err-edit-decode-failed",
                                                                    &[("e", &e)],
                                                                ));
                                                            }
                                                        }
                                                    }
                                                    Err(e) => {
                                                        state3.resolve_command_by_id(
                                                            resolved_cmd,
                                                            CommandStatus::Error(e.clone()),
                                                        );
                                                        state3.push_error(tf(
                                                            "err-edit-fetch-failed",
                                                            &[("e", &e)],
                                                        ));
                                                    }
                                                }
                                            } else {
                                                match fetch_url_text(&url).await {
                                                    Ok(text) => {
                                                        show_editor.set(Some(
                                                            EditorContext::new(doc_path, text)
                                                                .with_language("plain")
                                                                .with_mode(editor_mode)
                                                                .with_cmd_id(resolved_cmd),
                                                        ));
                                                    }
                                                    Err(e) => {
                                                        state3.resolve_command_by_id(
                                                            resolved_cmd,
                                                            CommandStatus::Error(e.clone()),
                                                        );
                                                        state3.push_error(tf(
                                                            "err-edit-fetch-failed",
                                                            &[("e", &e)],
                                                        ));
                                                    }
                                                }
                                            }
                                        });
                                    }
                                    Ok(ciborium::Value::Text(s)) if s.is_empty() => {
                                        // No existing content — open editor blank.
                                        show_editor.set(Some(
                                            EditorContext::new(doc_path, String::new())
                                                .with_language("yaml")
                                                .with_mode(editor_mode)
                                                .with_cmd_id(ctx.cmd_id),
                                        ));
                                    }
                                    Ok(_) => {
                                        // Raw CBOR struct — decode to YAML for editing.
                                        match crate::messages::cbor_bytes_to_yaml(&content_bytes) {
                                            Ok(yaml) => {
                                                show_editor.set(Some(
                                                    EditorContext::new(doc_path, yaml)
                                                        .with_language("yaml")
                                                        .with_mode(editor_mode)
                                                        .with_cmd_id(ctx.cmd_id),
                                                ));
                                            }
                                            Err(e) => {
                                                state2.resolve_command_by_id(
                                                    ctx.cmd_id,
                                                    CommandStatus::Error(e.clone()),
                                                );
                                                state2.push_error(tf(
                                                    "err-edit-decode-failed",
                                                    &[("e", &e)],
                                                ));
                                            }
                                        }
                                    }
                                    Err(e) => {
                                        state2.resolve_command_by_id(
                                            ctx.cmd_id,
                                            CommandStatus::Error(e.to_string()),
                                        );
                                        state2.push_error(tf(
                                            "err-edit-cbor",
                                            &[("e", &e.to_string())],
                                        ));
                                    }
                                }
                                continue;
                            }
                            // Check if this is a pending CID content-op reply
                            // (e.g. from @sky:alice.fil:cat).  The reply should
                            // contain a bare CIDv1; fetch and display inline.
                            let pending_op = state2
                                .pending_cid_ops
                                .update_untracked(|m| m.remove(msg_id));
                            if let Some(ctx) = pending_op {
                                if incoming.is_error {
                                    state2.resolve_command_by_id(
                                        ctx.cmd_id,
                                        CommandStatus::Error(incoming.display.clone()),
                                    );
                                    state2.push_error(incoming.display.clone());
                                    continue;
                                }
                                let content_bytes = incoming.content.clone();
                                let state3 = state2.clone();
                                spawn_local(async move {
                                    match ciborium::de::from_reader::<ciborium::Value, _>(
                                        &mut &content_bytes[..],
                                    ) {
                                        Ok(ciborium::Value::Text(cid))
                                            if (cid.starts_with('b') || cid.starts_with('Q'))
                                                && cid.len() > 10 =>
                                        {
                                            let url = format!(
                                                "{}ipfs/{cid}",
                                                crate::transport::connection::LOCAL_GATEWAY_URL
                                            );
                                            match fetch_url_text(&url).await {
                                                Ok(text) => {
                                                    let args_ref: Vec<&str> = ctx
                                                        .args
                                                        .iter()
                                                        .map(|s| s.as_str())
                                                        .collect();
                                                    for line in crate::cid_ops::apply(
                                                        &ctx.op, &text, &args_ref,
                                                    ) {
                                                        state3.push_output(line);
                                                    }
                                                    state3.resolve_command_by_id(
                                                        ctx.cmd_id,
                                                        CommandStatus::Done,
                                                    );
                                                }
                                                Err(e) => {
                                                    state3.resolve_command_by_id(
                                                        ctx.cmd_id,
                                                        CommandStatus::Error(e.clone()),
                                                    );
                                                    state3.push_error(tf(
                                                        "cid-op-fetch-failed",
                                                        &[("e", &e)],
                                                    ));
                                                }
                                            }
                                        }
                                        _ => {
                                            // Reply is not a CID — display as plain text.
                                            let disp = incoming.display.clone();
                                            state3.push_output(disp);
                                            state3.resolve_command_by_id(
                                                ctx.cmd_id,
                                                CommandStatus::Done,
                                            );
                                        }
                                    }
                                });
                                continue;
                            }
                            // Check if this is a CRUD SET confirmation (publish flow).
                            let crud_confirm = state2
                                .pending_crud_confirms
                                .update_untracked(|m| m.remove(msg_id));
                            if let Some(original_cmd_id) = crud_confirm {
                                let (status, push_opt) =
                                    classify_reply(&incoming.content, incoming.is_error, &display);
                                state2.resolve_command_by_id(original_cmd_id, status);
                                if let Some(text) = push_opt {
                                    state2.push_incoming(
                                        text,
                                        Some(original_cmd_id),
                                        incoming.is_error,
                                    );
                                }
                                continue;
                            }
                            let (status, push_opt) =
                                classify_reply(&incoming.content, incoming.is_error, &display);
                            let cmd_id = state2.resolve_command(msg_id, status);
                            if let Some(text) = push_opt {
                                state2.push_incoming(text, cmd_id, incoming.is_error);
                            }
                        }
                        None => {
                            state2.push_incoming(display, None, incoming.is_error);
                        }
                    }
                }
            }
        });
    }

    // Signal for programmatic eval — InputBar watches this and processes each
    // line exactly like a paste, going through the same on_submit path.
    let eval_input: RwSignal<Option<String>> = RwSignal::new(None);

    // Eval callback — hands the document text to InputBar's paste mechanism.
    let eval_lines = Callback::new(move |text: String| {
        eval_input.set(Some(text));
    });

    // Core input handler.
    let handle_input_fn: std::sync::Arc<dyn Fn(String) + Send + Sync> = {
        let state = state.clone();
        let config = config.clone();
        let eval_lines = eval_lines.clone();
        std::sync::Arc::new(move |line: String| {
            let line = line.trim().to_string();
            if line.is_empty() {
                return;
            }

            // History
            state.history.update(|h| {
                if h.last().map(|s| s.as_str()) != Some(&line) {
                    h.push(line.clone());
                }
                if h.len() > 200 {
                    h.drain(0..h.len() - 200);
                }
            });

            // Persist history (per-user) to IndexedDB.
            if let Some(sess) = state.session.get_untracked() {
                let username = sess.username;
                let hist = state.history.get_untracked();
                spawn_local(async move {
                    if let Ok(json) = serde_json::to_string(&hist) {
                        let _ = save_history(&username, &json).await;
                    }
                });
            }

            let focus = state.focus_actor.get_untracked();
            let cfg = config.get_untracked();

            match parse(&line, &cfg, focus.as_ref().map(|item| item.target.as_str())) {
                Ok(cmd) => eval(
                    cmd,
                    &line,
                    &state,
                    config.clone(),
                    show_editor,
                    eval_lines.clone(),
                ),
                Err(e) => state.push_error(format!("'{line}': {e}")),
            }
        })
    };

    // Thin wrapper satisfying InputBar's `impl Fn(String) + 'static` bound.
    let handle_input = {
        let f = handle_input_fn;
        move |line: String| f(line)
    };

    view! {
        <div class="terminal"
             class:placement-left=move || config.get().get(".config.editor.placement").unwrap_or("bottom") == "left"
             class:placement-right=move || config.get().get(".config.editor.placement").unwrap_or("bottom") == "right"
        >
            <OutputPane state=state.clone()/>
            <EditorModal show=show_editor config=config on_eval=eval_lines/>
            <crate::views::input::InputBar
                on_submit=handle_input
                focus_actor=state.focus_actor
                history=state.history
                eval_input=eval_input
            />
        </div>
    }
}

// ── Output pane ────────────────────────────────────────────────────────────

#[component]
fn OutputPane(state: AppState) -> impl IntoView {
    let entries = state.entries;

    // Auto-scroll to bottom whenever entries change
    Effect::new(move |_| {
        let _ = entries.get(); // track signal
        if let Some(window) = web_sys::window() {
            let closure = wasm_bindgen::closure::Closure::<dyn FnMut()>::new(|| {
                if let Some(win) = web_sys::window() {
                    if let Some(doc) = win.document() {
                        if let Some(el) = doc.get_element_by_id("terminal-output") {
                            el.set_scroll_top(el.scroll_height());
                        }
                    }
                }
            });
            let _ = window.request_animation_frame(closure.as_ref().unchecked_ref());
            closure.forget();
        }
    });

    view! {
        <div
            class="terminal-output"
            id="terminal-output"
        >
            <For
                each=move || entries.get()
                key=|e| e.id()
                children=|entry| render_entry(entry)
            />
        </div>
    }
}

/// Classify an incoming reply into a `CommandStatus` transition and optional
/// display text to print below the command line.
///
/// Rules:
/// - Text atom (`:ok`, `:pong`, etc.) → bright-green, no output.
/// - `[:ok]` → bright-green, no output.
/// - `[:ok, text]` → bright-green, print `text` below.
/// - `[:error, reason]` or `is_error` → red, print reason below.
/// - Anything else → bright-green, print fallback display below.
fn classify_reply(
    content: &[u8],
    is_error: bool,
    fallback: &str,
) -> (CommandStatus, Option<String>) {
    use ciborium::Value as V;
    if is_error {
        // Try to extract a human-readable reason from [:error, reason].
        let reason = match ciborium::de::from_reader::<V, _>(&mut &content[..]) {
            Ok(V::Array(items)) => items
                .get(1)
                .and_then(|v| {
                    if let V::Text(s) = v {
                        Some(s.clone())
                    } else {
                        None
                    }
                })
                .unwrap_or_else(|| fallback.to_string()),
            _ => fallback.to_string(),
        };
        return (CommandStatus::Error(String::new()), Some(reason));
    }
    match ciborium::de::from_reader::<V, _>(&mut &content[..]) {
        Ok(V::Text(s)) => {
            // Only `:ok` is silenced (color-change only, no output text).
            // All other text atoms (`:pong`, `:error`, etc.) print their text.
            if s == ":ok" {
                (CommandStatus::Replied(String::new()), None)
            } else {
                (CommandStatus::Replied(String::new()), Some(s))
            }
        }
        Ok(V::Array(items)) => match (items.first(), items.get(1)) {
            (Some(V::Text(verb)), value) if verb == ":ok" => match value {
                Some(V::Text(s)) => (CommandStatus::Replied(String::new()), Some(s.clone())),
                Some(_) => (CommandStatus::Replied(String::new()), None),
                None => (CommandStatus::Replied(String::new()), None),
            },
            (Some(V::Text(verb)), value) if verb == ":error" => {
                let reason = value
                    .and_then(|v| {
                        if let V::Text(s) = v {
                            Some(s.clone())
                        } else {
                            None
                        }
                    })
                    .unwrap_or_else(|| fallback.to_string());
                (CommandStatus::Error(String::new()), Some(reason))
            }
            _ => (
                CommandStatus::Replied(String::new()),
                Some(fallback.to_string()),
            ),
        },
        _ => (
            CommandStatus::Replied(String::new()),
            Some(fallback.to_string()),
        ),
    }
}

fn render_entry(entry: Entry) -> impl IntoView {
    match entry {
        Entry::Command(c) => {
            // `status` is `RwSignal<CommandStatus>` — Copy, so capture by value.
            // The reactive closures below re-run whenever `status.set()` is
            // called, updating the DOM without requiring `<For>` to re-render
            // the entire item (keyed `<For>` keeps existing nodes for unchanged keys).
            let status = c.status;
            let raw = c.raw.clone();
            let cls = move || match status.get() {
                CommandStatus::Sent => "terminal-line line-pending",
                CommandStatus::Done => "terminal-line line-dimmed",
                CommandStatus::Replied(_) => "terminal-line line-replied",
                CommandStatus::Publishing => "terminal-line line-publishing",
                CommandStatus::Error(_) => "terminal-line line-error",
            };
            let text = move || match status.get() {
                CommandStatus::Publishing => {
                    format!("→ {}  {}…", raw, crate::i18n::t("status-publishing"))
                }
                _ => format!("→ {}", raw),
            };
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::Incoming(i) => {
            let cls = if i.is_error {
                "terminal-line line-error"
            } else if i.after_cmd_id.is_some() {
                "terminal-line line-reply"
            } else {
                "terminal-line line-output"
            };
            let text = i.display;
            view! { <div class=cls>{text}</div> }.into_any()
        }
        Entry::System(s) => {
            let cls = match s.kind {
                SystemKind::Info => "terminal-line line-system",
                SystemKind::Error => "terminal-line line-error",
            };
            let text = s.text;
            view! { <div class=cls>{text}</div> }.into_any()
        }
    }
}

// ── Command evaluator ──────────────────────────────────────────────────────

fn eval(
    cmd: Command,
    raw: &str,
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    match cmd {
        Command::PlainText(_) => {}

        Command::DotCommand { path, op, args } => {
            eval_dot(&path, op, &args, state, config, show_editor, on_eval);
        }

        Command::ActorMessage { target, verb, body } => {
            // Bare `@alias` with no verb and empty body → just echo the
            // resolved DID. No message dispatch.
            if verb.is_none() && body.trim().is_empty() {
                state.push_output(target);
                return;
            }

            // Capture the prompt-prefixed raw line as the visual record.
            let focus_prefix = state
                .focus_actor
                .get_untracked()
                .map(|f| format!("{} ", f.prompt))
                .unwrap_or_default();
            let display = format!("{focus_prefix}{raw}");
            let cmd_id = state.push_command(display);

            let state_async = state.clone();
            spawn_local(async move {
                let result = match verb.as_deref() {
                    Some("say") => transport::send_chat(&target, &body).await,
                    Some("emote") => transport::send_emote(&target, &body).await,
                    Some(v) => {
                        // Fragment-addressed target → plugin RPC.
                        // :ping on the bare runtime DID is the one RPC exception.
                        // Everything else without a fragment goes to CRUD.
                        if target.contains('#') || v == "ping" {
                            transport::send_rpc(
                                &target,
                                v,
                                &body.split_whitespace().collect::<Vec<_>>(),
                            )
                            .await
                        } else {
                            let v_inner = v.strip_prefix(':').unwrap_or(v);
                            // ── :kinds/<protocol> interceptor ─────────────────────────────────────
                            // Protocol IDs contain slashes which cannot be encoded as dot-path
                            // CRUD segments.  We convert them to CBOR value arguments on :kinds.
                            //   kinds/<proto>        → GET kind (CBOR reply displayed)
                            //   kinds/<proto>:edit   → GET kind then open editor
                            //   kinds/<proto>:       → DELETE kind
                            if let Some(proto_path) = v_inner.strip_prefix("kinds/") {
                                let (bare_proto, op) =
                                    if let Some(p) = proto_path.strip_suffix(":edit") {
                                        (p, "edit")
                                    } else if let Some(p) = proto_path.strip_suffix(':') {
                                        (p, "delete")
                                    } else {
                                        (proto_path, "get")
                                    };
                                let protocol_id = format!("/{bare_proto}");
                                match op {
                                    "get" | "edit" => {
                                        // GET: send CRUD SET :kinds with Text(protocol_id)
                                        // The runtime recognises Text-arg as a GET-by-ID request.
                                        let result = transport::send_crud_set(
                                            &target,
                                            ":kinds",
                                            ciborium::Value::Text(protocol_id.clone()),
                                        )
                                        .await;
                                        match result {
                                            Ok(msg_id) if op == "edit" => {
                                                state_async.pending_edit_opens.update(|m| {
                                                    m.insert(
                                                        msg_id,
                                                        EditOpenCtx {
                                                            target: target.clone(),
                                                            crud_path: ":kinds".to_string(),
                                                            editor_mode: EditorMode::KindEdit {
                                                                target: target.clone(),
                                                                protocol_id: protocol_id.clone(),
                                                            },
                                                            cmd_id,
                                                        },
                                                    );
                                                });
                                            }
                                            Ok(_) => {}
                                            Err(e) => {
                                                state_async.resolve_command_by_id(
                                                    cmd_id,
                                                    CommandStatus::Error(e.clone()),
                                                );
                                                let disp = e.replace(
                                                    "not logged in",
                                                    &t("msg-not-logged-in"),
                                                );
                                                state_async.push_error(tf(
                                                    "msg-send-failed",
                                                    &[("e", &disp)],
                                                ));
                                            }
                                        }
                                    }
                                    _ => {
                                        // DELETE: send CRUD SET :kinds with Array([Text(protocol_id)])
                                        match transport::send_crud_set(
                                            &target,
                                            ":kinds",
                                            ciborium::Value::Array(vec![ciborium::Value::Text(
                                                protocol_id.clone(),
                                            )]),
                                        )
                                        .await
                                        {
                                            Ok(_) => {}
                                            Err(e) => {
                                                state_async.resolve_command_by_id(
                                                    cmd_id,
                                                    CommandStatus::Error(e.clone()),
                                                );
                                                let disp = e.replace(
                                                    "not logged in",
                                                    &t("msg-not-logged-in"),
                                                );
                                                state_async.push_error(tf(
                                                    "msg-send-failed",
                                                    &[("e", &disp)],
                                                ));
                                            }
                                        }
                                    }
                                }
                                return;
                            }
                            // ── :path:edit interceptor ───────────────────────────────────
                            // Detected before parse_crud_op so the `:edit` suffix is never
                            // sent on the wire.  The handler sends a plain CRUD GET, then
                            // the poll loop opens the editor when the reply arrives.
                            if let Some(path_part) = v_inner.strip_suffix(":edit") {
                                let crud_path = format!(":{path_part}");
                                let editor_mode = match path_part {
                                    "acl" => EditorMode::RuntimeAclEdit {
                                        target: target.clone(),
                                    },
                                    s if s.starts_with("entities.") => {
                                        let rest = &s["entities.".len()..];
                                        if let Some((name, field)) = rest.split_once('.') {
                                            EditorMode::EntityFieldEdit {
                                                target: target.clone(),
                                                entity_name: name.to_string(),
                                                field: field.to_string(),
                                            }
                                        } else {
                                            EditorMode::EntityEdit {
                                                target: target.clone(),
                                                entity_name: rest.to_string(),
                                            }
                                        }
                                    }
                                    _ => EditorMode::CrudEdit {
                                        target: target.clone(),
                                        crud_path: crud_path.clone(),
                                        is_blob: None,
                                    },
                                };
                                match transport::send_crud_get(&target, &crud_path).await {
                                    Ok(msg_id) => {
                                        state_async.pending_edit_opens.update(|m| {
                                            m.insert(
                                                msg_id,
                                                EditOpenCtx {
                                                    target,
                                                    crud_path,
                                                    editor_mode,
                                                    cmd_id,
                                                },
                                            );
                                        });
                                    }
                                    Err(e) => {
                                        state_async.resolve_command_by_id(
                                            cmd_id,
                                            CommandStatus::Error(e.clone()),
                                        );
                                        let disp =
                                            e.replace("not logged in", &t("msg-not-logged-in"));
                                        state_async
                                            .push_error(tf("msg-send-failed", &[("e", &disp)]));
                                    }
                                }
                                return;
                            }
                            // ── CID content operation interceptor ─────────────────────────────
                            // Detected before parse_crud_op so the content-op
                            // suffix is never sent on the wire. The handler sends
                            // a plain CRUD GET then the poll loop fetches the
                            // returned CID and applies the content operation.
                            if let Some((base_verb, op_name)) = crate::cid_ops::find_op(v_inner) {
                                let crud_path = format!(":{base_verb}");
                                let args: Vec<String> =
                                    body.split_whitespace().map(String::from).collect();
                                match transport::send_crud_get(&target, &crud_path).await {
                                    Ok(msg_id) => {
                                        state_async.pending_cid_ops.update(|m| {
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
                                    Err(e) => {
                                        state_async.resolve_command_by_id(
                                            cmd_id,
                                            CommandStatus::Error(e.clone()),
                                        );
                                        let disp =
                                            e.replace("not logged in", &t("msg-not-logged-in"));
                                        state_async
                                            .push_error(tf("msg-send-failed", &[("e", &disp)]));
                                    }
                                }
                                return;
                            }
                            // ── Standard CRUD dispatch ───────────────────────────────────
                            match parse_crud_op(v, &body) {
                                CrudOp::Get(path) => transport::send_crud_get(&target, &path).await,
                                CrudOp::Set(path, value) => {
                                    transport::send_crud_set(
                                        &target,
                                        &path,
                                        ciborium::Value::Text(value),
                                    )
                                    .await
                                }
                                CrudOp::Delete(path) => {
                                    transport::send_crud_delete(&target, &path).await
                                }
                            }
                        }
                    }
                    None => transport::send_text(&target, &body).await,
                };
                match result {
                    Ok(msg_id) => state_async.bind_message_id(cmd_id, msg_id),
                    Err(e) => {
                        state_async.resolve_command_by_id(cmd_id, CommandStatus::Error(e.clone()));
                        let display = e.replace("not logged in", &t("msg-not-logged-in"));
                        state_async.push_error(tf("msg-send-failed", &[("e", &display)]));
                    }
                }
            });
        }
    }
}

fn eval_dot(
    path: &str,
    op: DotOp,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
    show_editor: RwSignal<Option<EditorContext>>,
    on_eval: Callback<String>,
) {
    let session = state.session.get_untracked();
    let username = session.map(|s| s.username).unwrap_or_default();

    // ── .help / .help.* ──────────────────────────────────────────────────
    if path == ".help" || path.starts_with(".help.") {
        let subtopic = path.strip_prefix(".help.").unwrap_or("");
        for line in dispatch_help(subtopic) {
            state.push_system(line);
        }
        return;
    }

    // ── Control commands (not config access) ─────────────────────────────
    match path {
        ".logout" => {
            transport::disconnect();
            state.session.set(None);
            return;
        }
        ".clear" => {
            state.entries.set(vec![]);
            return;
        }
        ".panic" => {
            state.screensaver.set(true);
            return;
        }
        ".history" => {
            let hist = state.history.get_untracked();
            // uniq-style filter: suppress consecutive identical entries.
            let mut n = 0usize;
            let mut last: Option<&str> = None;
            for entry in &hist {
                if last != Some(entry.as_str()) {
                    n += 1;
                    state.push_system(format!("{n:>4}  {entry}"));
                    last = Some(entry.as_str());
                }
            }
            return;
        }
        ".ma" => {
            state.push_output("間");
            return;
        }
        ".use" => {
            eval_use(args, state, config);
            return;
        }
        // Shorthand: `.edit [cid]` → `.my.doc.scratch:edit [cid]`
        ".edit" => {
            if let Err(e) = dispatch_verb(
                ".my.doc.scratch",
                "edit",
                args,
                state,
                config,
                show_editor,
                on_eval,
            ) {
                state.push_error(e);
            }
            return;
        }
        _ => {}
    }

    // ── Verb dispatch ────────────────────────────────────────────────────
    if let DotOp::Verb(verb) = &op {
        if let Err(e) = dispatch_verb(path, verb, args, state, config, show_editor, on_eval) {
            state.push_error(e);
        }
        return;
    }

    // ── Generic CRUD on the dot tree ─────────────────────────────────────
    match op {
        DotOp::Set(value) => {
            if EgoConfig::is_read_only(path) {
                state.push_error(tf("msg-read-only", &[("path", path)]));
                return;
            }
            if let Err(e) = validate_alias_set(path, &value) {
                state.push_error(e);
                return;
            }
            let (has_children, has_ancestor) = {
                let cfg = config.get_untracked();
                (cfg.has_children(path), cfg.has_leaf_ancestor(path))
            };
            if has_children {
                state.push_error(tf("msg-subtree-set", &[("path", path)]));
                return;
            }
            if has_ancestor {
                state.push_error(tf("msg-ancestor-leaf", &[("path", path)]));
                return;
            }
            config.update(|c| c.set(path, &value));
            let cfg = config.get_untracked();
            let uname = username.clone();
            let state2 = state.clone();
            let path_owned = path.to_string();
            spawn_local(async move {
                if let Err(e) = persist_config(&uname, &cfg).await {
                    state2.push_error(e);
                } else {
                    apply_config_to_dom(&cfg);
                    if path_owned == ".config.log.level" {
                        crate::apply_log_level(&value);
                    }
                    if path_owned == ".config.ui.language" {
                        let _ = crate::i18n::init(&value).await;
                        state2.lang.set(crate::i18n::lang());
                    }
                    if path_owned == ".my.i18n" {
                        let first = value.split(':').next().unwrap_or(&value).to_string();
                        if !crate::i18n::init(&first).await {
                            state2.push_error(tf("err-lang-not-found", &[("lang", &first)]));
                        }
                        state2.lang.set(crate::i18n::lang());
                        crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(value.clone()));
                    }
                    state2.push_system(tf("msg-set", &[("path", &path_owned), ("value", &value)]));
                }
            });
        }

        DotOp::Delete => {
            if EgoConfig::is_read_only(path) {
                state.push_error(tf("msg-read-only", &[("path", path)]));
                return;
            }

            // ── .my.profiles.<name>: — delete a named profile ────────────
            if let Some(target_name) = path.strip_prefix(".my.profiles.") {
                if target_name.is_empty() || target_name.contains('.') {
                    state.push_error(tf("profiles-not-found", &[("name", target_name)]));
                    return;
                }
                let target_name = target_name.to_string();
                let current_username = username.clone();
                let state2 = state.clone();
                spawn_local(async move {
                    use crate::identity::storage::{
                        delete_config, delete_history, delete_identity, list_usernames,
                    };
                    match list_usernames().await {
                        Err(e) => {
                            state2.push_error(e);
                            return;
                        }
                        Ok(names) if !names.iter().any(|n| n == &target_name) => {
                            state2.push_error(tf("profiles-not-found", &[("name", &target_name)]));
                            return;
                        }
                        _ => {}
                    }
                    let mut errors: Vec<String> = Vec::new();
                    if let Err(e) = delete_identity(&target_name).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_config(&target_name).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_history(&target_name).await {
                        errors.push(e);
                    }
                    if errors.is_empty() {
                        if target_name == current_username {
                            crate::transport::disconnect();
                            state2.session.set(None);
                        } else {
                            state2.push_system(tf("profiles-deleted", &[("name", &target_name)]));
                        }
                    } else {
                        state2.push_error(tf("profile-delete-error", &[("e", &errors.join("; "))]));
                    }
                });
                return;
            }

            // ── .my.profile: — delete current (logged-in) profile ─────────
            if path == ".my.profile" {
                if username.is_empty() {
                    state.push_error(t("profile-delete-no-session"));
                    return;
                }
                let uname = username.clone();
                let state2 = state.clone();
                spawn_local(async move {
                    use crate::identity::{delete_config, delete_history, delete_identity};
                    let mut errors: Vec<String> = Vec::new();
                    if let Err(e) = delete_identity(&uname).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_config(&uname).await {
                        errors.push(e);
                    }
                    if let Err(e) = delete_history(&uname).await {
                        errors.push(e);
                    }
                    if errors.is_empty() {
                        crate::transport::disconnect();
                        state2.session.set(None);
                    } else {
                        state2.push_error(tf("profile-delete-error", &[("e", &errors.join("; "))]));
                    }
                });
                return;
            }

            let removed = config.try_update(|c| c.delete_subtree(path)).unwrap_or(0);
            if removed == 0 {
                state.push_error(tf("msg-key-not-found", &[("path", path)]));
                return;
            }
            let cfg = config.get_untracked();
            let uname = username.clone();
            let state2 = state.clone();
            let path_owned = path.to_string();
            spawn_local(async move {
                if let Err(e) = persist_config(&uname, &cfg).await {
                    state2.push_error(e);
                } else {
                    state2.push_system(tf(
                        "msg-deleted",
                        &[("path", &path_owned), ("count", &removed.to_string())],
                    ));
                }
            });
        }

        DotOp::Get => {
            // ── .my.profiles[.<name>] — virtual: reads IndexedDB ─────────
            if path == ".my.profiles" || path.starts_with(".my.profiles.") {
                let state2 = state.clone();
                let path_owned = path.to_string();
                spawn_local(async move {
                    use crate::identity::storage::{list_usernames, load_identity};
                    if path_owned == ".my.profiles" {
                        match list_usernames().await {
                            Err(e) => state2.push_error(e),
                            Ok(names) => {
                                state2.push_output(format!("{path_owned}:"));
                                if names.is_empty() {
                                    state2.push_output(format!("  {}", t("profiles-empty")));
                                } else {
                                    for name in &names {
                                        state2.push_output(format!("  {name}"));
                                    }
                                }
                            }
                        }
                    } else {
                        let profile_name = &path_owned[".my.profiles.".len()..];
                        match load_identity(profile_name).await {
                            Ok(Some(_)) => {
                                state2.push_output(format!("{path_owned}: {profile_name}"))
                            }
                            Ok(None) => state2
                                .push_error(tf("profiles-not-found", &[("name", profile_name)])),
                            Err(e) => state2.push_error(e),
                        }
                    }
                });
                return;
            }

            let cfg = config.get_untracked();
            let query = if args.is_empty() {
                None
            } else {
                Some(args.join(" "))
            };

            if cfg.is_leaf(path) {
                let value = cfg.get(path).unwrap_or("");
                match &query {
                    None => state.push_output(format!("{path}: {value}")),
                    Some(q) if value == q.as_str() => state.push_output(format!("{path}: {value}")),
                    Some(_) => state.push_error(t("msg-no-match")),
                }
            } else if cfg.has_children(path) {
                let prefix = format!("{path}.");
                let prefix_len = prefix.len();
                // Collect immediate child names (deduplicated, sorted).
                let mut children: std::collections::BTreeSet<String> =
                    std::collections::BTreeSet::new();
                for (k, _) in cfg.list(&prefix) {
                    let tail = &k[prefix_len..];
                    let immediate = tail.split('.').next().unwrap_or(tail);
                    children.insert(immediate.to_string());
                }
                state.push_output(format!("{path}:"));
                let mut shown = 0usize;
                for child in &children {
                    let child_path = format!("{path}.{child}");
                    if let Some(v) = cfg.get(&child_path) {
                        // Immediate leaf — show `name: value`.
                        if let Some(q) = &query {
                            if v != q.as_str() {
                                continue;
                            }
                        }
                        state.push_output(format!("  {child}: {v}"));
                        shown += 1;
                    } else {
                        // Sub-subtree — show relative child name, skip when value-querying.
                        if query.is_some() {
                            continue;
                        }
                        state.push_output(format!("  {child}"));
                        shown += 1;
                    }
                }
                if shown == 0 && query.is_some() {
                    state.push_error(t("msg-no-match"));
                }
            } else {
                // ── Lazy link traversal ───────────────────────────────────
                // Check if any ancestor leaf holds a DID or CID link value.
                // If so, resolve it and traverse the remaining sub-path.
                let path_owned = path.to_string();
                let mut found_link = false;
                let mut split_pos = path_owned.len();
                while let Some(dot) = path_owned[..split_pos].rfind('.') {
                    split_pos = dot;
                    let ancestor = &path_owned[..split_pos];
                    if let Some(link_val) = cfg.get(ancestor) {
                        if crate::mailbox::is_link_value(link_val) {
                            let link = link_val.to_string();
                            let subpath = path_owned[split_pos + 1..].to_string();
                            let state2 = state.clone();
                            let cache = state.doc_cache;
                            spawn_local(async move {
                                resolve_and_traverse(&link, &subpath, &state2, cache).await;
                            });
                            found_link = true;
                            break;
                        }
                    }
                    if split_pos == 0 {
                        break;
                    }
                }
                if !found_link {
                    state.push_error(tf("msg-key-not-found", &[("path", path)]));
                }
            }
        }

        DotOp::Verb(_) => unreachable!("handled above"),
    }
}

fn eval_use(args: &[String], state: &AppState, config: RwSignal<EgoConfig>) {
    if args.is_empty() {
        state.focus_actor.set(None);
        state.push_system(t("msg-focus-cleared"));
        return;
    }
    let target = args[0].trim_start_matches('@').to_string();
    let cfg = config.get_untracked();
    let resolved = if target.starts_with("did:") {
        target.clone()
    } else {
        match cfg.resolve_alias(&target) {
            Some(did) => did.to_string(),
            None => {
                state.push_error(tf("err-unknown-alias", &[("name", &target)]));
                return;
            }
        }
    };

    let prompt = if args.len() >= 3 && args[1] == "as" {
        let alias = args[2].trim().to_string();
        if alias.starts_with('@') {
            alias
        } else {
            format!("@{alias}")
        }
    } else if args[0].starts_with('@') {
        args[0].clone()
    } else {
        format!("@{target}")
    };

    state.focus_actor.set(Some(FocusMode {
        target: resolved.clone(),
        prompt: prompt.clone(),
    }));
    state.push_system(tf(
        "msg-focusing",
        &[("did", &resolved), ("prompt", &prompt)],
    ));
}

fn apply_config_to_dom(cfg: &EgoConfig) {
    let Some(window) = web_sys::window() else {
        return;
    };
    let Some(document) = window.document() else {
        return;
    };
    let Some(root) = document.document_element() else {
        return;
    };

    let style = format!(
        "--colour-text:{};--colour-dimmed:{};--colour-pending:{};--colour-replied:{};--colour-alias:{};--colour-error:{};--colour-system:{};--colour-bg:{};--colour-input-bg:{};--colour-border:{};--colour-cursor:{};--colour-highlight:{};",
        cfg.get(".config.colour.text").unwrap_or("#00ff41"),
        cfg.get(".config.colour.dimmed").unwrap_or("#008f11"),
        cfg.get(".config.colour.pending").unwrap_or("#004d00"),
        cfg.get(".config.colour.replied").unwrap_or("#00ff41"),
        cfg.get(".config.colour.alias").unwrap_or("#ffd700"),
        cfg.get(".config.colour.error").unwrap_or("#ff3333"),
        cfg.get(".config.colour.system").unwrap_or("#888888"),
        cfg.get(".config.colour.bg").unwrap_or("#0d0d0d"),
        cfg.get(".config.colour.input_bg").unwrap_or("#0a0a0a"),
        cfg.get(".config.colour.border").unwrap_or("#003300"),
        cfg.get(".config.colour.cursor").unwrap_or("#00ff41"),
        cfg.get(".config.colour.highlight").unwrap_or("#003300"),
    );

    let _ = root.set_attribute("style", &style);
}

// ── Lazy DID / CID link traversal ─────────────────────────────────────────

/// Resolve a link value (`did:ma:…` or CID) and traverse `subpath` within
/// the fetched document, pushing the result to the terminal.
///
/// Documents are cached in `AppState::doc_cache` keyed by the link string.
async fn resolve_and_traverse(
    link: &str,
    subpath: &str,
    state: &AppState,
    cache: RwSignal<std::collections::HashMap<String, serde_json::Value>>,
) {
    // Check cache first.
    let cached = cache.with_untracked(|m| m.get(link).cloned());
    let doc = match cached {
        Some(v) => v,
        None => {
            let val: Result<serde_json::Value, String> = if link.starts_with("did:ma:") {
                // Use the session resolver — it owns the gateway URL, has a
                // positive cache, and falls back to public gateways automatically.
                let Some(resolver) = crate::state::SESSION_RESOLVER.with(|r| r.borrow().clone())
                else {
                    state.push_error(t("msg-link-not-connected"));
                    return;
                };
                resolver
                    .resolve(link)
                    .await
                    .map_err(|e| e.to_string())
                    .and_then(|doc| serde_json::to_value(&doc).map_err(|e| e.to_string()))
            } else {
                // Bare CID — fetch from local gateway.
                let url = format!(
                    "{}ipfs/{link}",
                    crate::transport::connection::LOCAL_GATEWAY_URL
                );
                match fetch_url_text(&url).await {
                    Ok(t) => {
                        serde_json::from_str::<serde_json::Value>(&t).map_err(|e| e.to_string())
                    }
                    Err(e) => Err(e),
                }
            };
            match val {
                Ok(v) => {
                    cache.update(|m| {
                        m.insert(link.to_string(), v.clone());
                    });
                    v
                }
                Err(e) => {
                    state.push_error(tf("msg-link-fetch-error", &[("e", &e)]));
                    return;
                }
            }
        }
    };

    // Traverse subpath keys into the JSON document.
    let mut cur = &doc;
    for key in subpath.split('.') {
        match cur.get(key) {
            Some(v) => cur = v,
            None => {
                state.push_error(tf("msg-link-key-not-found", &[("key", key)]));
                return;
            }
        }
    }
    let display = match cur {
        serde_json::Value::String(s) => s.clone(),
        other => other.to_string(),
    };
    state.push_output(format!("{link}.{subpath}: {display}"));
}

/// Minimal HTTP GET → text, reusing the same gateway as the transport layer.
async fn fetch_url_text(url: &str) -> Result<String, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;
    let window = web_sys::window().ok_or("no window")?;
    let promise = window.fetch_with_str(url);
    let resp_val = JsFuture::from(promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    if !resp.ok() {
        return Err(format!("HTTP {}", resp.status()));
    }
    let text_promise = resp.text().map_err(|e| format!("{e:?}"))?;
    let text_val = JsFuture::from(text_promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    text_val
        .as_string()
        .ok_or_else(|| "response is not a string".to_string())
}

/// Minimal HTTP GET → raw bytes, for fetching DAG-CBOR CIDs from the gateway.
async fn fetch_url_bytes(url: &str) -> Result<Vec<u8>, String> {
    use wasm_bindgen::JsCast;
    use wasm_bindgen_futures::JsFuture;
    let window = web_sys::window().ok_or("no window")?;
    let promise = window.fetch_with_str(url);
    let resp_val = JsFuture::from(promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    let resp: web_sys::Response = resp_val.dyn_into().map_err(|_| "not a Response")?;
    if !resp.ok() {
        return Err(format!("HTTP {}", resp.status()));
    }
    let buf_promise = resp.array_buffer().map_err(|e| format!("{e:?}"))?;
    let buf_val = JsFuture::from(buf_promise)
        .await
        .map_err(|e| format!("{e:?}"))?;
    Ok(js_sys::Uint8Array::new(&buf_val).to_vec())
}

/// Returns `true` if the bare CIDv1 string encodes DAG-CBOR (codec 0x71).
/// Base32-lower CIDv1 DAG-CBOR CIDs start with `"bafyrei"`.
fn cid_is_dag_cbor(cid: &str) -> bool {
    cid.starts_with("bafyrei")
}

// ── CRUD routing ──────────────────────────────────────────────────────────

enum CrudOp {
    Get(String),
    Set(String, String),
    Delete(String),
}

/// Map a verb+body to a `CrudOp`.
///
/// Called only when the target has no fragment and is not `:ping`.
/// Every verb is a CRUD operation — the protocol (`/ma/crud/0.0.1`) is
/// unambiguous; there is no need for a namespace whitelist.
fn parse_crud_op(verb: &str, body: &str) -> CrudOp {
    let v = verb.strip_prefix(':').unwrap_or(verb);

    // :create <name> — set with name as body
    if v == "create" {
        return CrudOp::Set(":create".to_string(), body.trim().to_string());
    }
    // verb ends with `:` — set or delete
    if let Some(path) = v.strip_suffix(':') {
        let atom = format!(":{path}");
        return if body.trim().is_empty() {
            CrudOp::Delete(atom)
        } else {
            CrudOp::Set(atom, body.trim().to_string())
        };
    }
    // everything else is a get
    CrudOp::Get(format!(":{v}"))
}

fn dispatch_help(subtopic: &str) -> Vec<String> {
    match subtopic {
        "" => help_overview(),
        "msg" => help_messaging(),
        "focus" => help_focus(),
        "path" => help_path(),
        "my" => help_my(),
        "inbox" => help_inbox(),
        "doc" => help_doc(),
        "actor" => help_actor(),
        other => vec![tf("help-unknown-topic", &[("topic", other)])],
    }
}

fn help_overview() -> Vec<String> {
    vec![
        t("help-header-zion"),
        t("help-cmd-help"),
        t("help-cmd-clear"),
        t("help-cmd-history"),
        t("help-cmd-panic"),
        t("help-cmd-logout"),
        String::new(),
        t("help-header-topics"),
        t("help-topic-msg"),
        t("help-topic-focus"),
        t("help-topic-path"),
        t("help-topic-my"),
        t("help-topic-inbox"),
        t("help-topic-doc"),
        t("help-topic-actor"),
        t("help-footer"),
    ]
}

fn help_messaging() -> Vec<String> {
    vec![
        t("help-header-messaging"),
        t("help-msg-echo"),
        t("help-msg-send"),
        t("help-msg-fragment"),
        t("help-msg-escape"),
        t("help-footer"),
    ]
}

fn help_focus() -> Vec<String> {
    vec![
        t("help-header-focus"),
        t("help-focus-set"),
        t("help-focus-clear"),
        t("help-footer"),
    ]
}

fn help_path() -> Vec<String> {
    vec![
        t("help-header-config"),
        t("help-config-get"),
        t("help-config-filter"),
        t("help-config-set"),
        t("help-config-delete"),
        t("help-config-verb"),
        t("help-footer"),
    ]
}

fn help_my() -> Vec<String> {
    vec![
        t("help-header-common"),
        t("help-my"),
        t("help-aliases"),
        t("help-aliases-set"),
        t("help-aliases-del"),
        String::new(),
        t("help-runtime-discover"),
        t("help-runtime-claim"),
        String::new(),
        t("help-identity"),
        t("help-identity-did"),
        t("help-identity-publish"),
        String::new(),
        t("help-config-path"),
        t("help-footer"),
    ]
}

fn help_inbox() -> Vec<String> {
    vec![
        t("help-header-inbox"),
        t("help-inbox"),
        t("help-inbox-n"),
        t("help-inbox-from"),
        t("help-inbox-reply"),
        t("help-inbox-open"),
        t("help-inbox-del"),
        t("help-inbox-delall"),
        t("help-inbox-flush"),
        t("help-inbox-traverse"),
        t("help-footer"),
    ]
}

fn help_doc() -> Vec<String> {
    vec![
        t("help-header-documents"),
        t("help-doc-edit"),
        t("help-doc-edit-cid"),
        t("help-doc-eval"),
        t("help-doc-publish"),
        t("help-doc-publish-ipld"),
        t("help-doc-fetch"),
        t("help-doc-cid"),
        t("help-doc-del"),
        t("help-footer"),
    ]
}

fn help_actor() -> Vec<String> {
    vec![
        t("help-header-actor"),
        t("help-actor-echo"),
        t("help-actor-text"),
        t("help-actor-ping"),
        String::new(),
        t("help-actor-entities"),
        t("help-actor-entities-get"),
        t("help-actor-entities-set"),
        t("help-actor-entities-edit"),
        t("help-actor-entities-del"),
        String::new(),
        t("help-actor-config-get"),
        t("help-actor-config-set"),
        String::new(),
        t("help-actor-acl"),
        t("help-actor-acl-edit"),
        String::new(),
        t("help-actor-fragment"),
        t("help-actor-fragment-verb"),
        String::new(),
        t("help-header-cid-ops"),
        t("help-actor-cat"),
        t("help-actor-head"),
        t("help-actor-tail"),
        t("help-actor-wc"),
        t("help-actor-wc-l"),
        t("help-footer"),
    ]
}
