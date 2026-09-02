//! Session startup helpers: config loading, history, iroh connect, DID sync.

use leptos::prelude::*;
use std::collections::BTreeMap;

use crate::{
    config::{persist_config, EgoConfig},
    i18n::{t, tf},
    identity::storage::load_history,
    parser::verbs::ma::ConnectMaOutcome,
    state::{AppState, SessionState},
    transport,
};

pub(crate) async fn startup_local_ma(
    state: AppState,
    config: RwSignal<EgoConfig>,
    username: String,
    is_new: bool,
    startup_ma: Option<String>,
    startup_enter: Option<String>,
) -> ConnectMaOutcome {
    let selected_did = select_startup_ma(startup_ma);
    let fallback_did =
        selected_did.or_else(|| startup_enter_publish_did(config, startup_enter.as_deref()));
    if fallback_did.is_none() {
        return ConnectMaOutcome::Unavailable {
            target: "ma".to_string(),
        };
    }
    let selected_did = fallback_did.expect("checked above");
    crate::parser::verbs::ma::connect_trusted_ma_on_startup(
        &state,
        config,
        &username,
        selected_did,
        is_new,
    )
    .await
}

fn select_startup_ma(field: Option<String>) -> Option<String> {
    field.filter(|did| crate::parser::verbs::is_bare_ma_did(did))
}

pub(crate) async fn startup_load_config(
    state: AppState,
    config: RwSignal<EgoConfig>,
    username: String,
    sender_did: String,
) {
    // The config signal is populated by the login path (fetched from IPFS,
    // or restored from the local cache when IPFS was unavailable). Finalise
    // it here: session-derived fields, defaults, pruning, DOM.
    let mut cfg = config.get_untracked();
    cfg.set_defaults();
    // Read-only session-derived field; never persisted
    // intentionally, but harmless if it leaks: it is
    // re-injected on every login.
    cfg.set(".my.identity.did", &sender_did);
    // Seed auto-publish with default "true" if not already set.
    if cfg.get(".my.identity.auto-publish").is_none() {
        cfg.set(".my.identity.auto-publish", "true");
    }
    // Prune inbox entries that expired since last session.
    let now = js_sys::Date::now() / 1000.0;
    let pruned = crate::mailbox::prune_inbox_expired(&mut cfg, now);
    crate::eval::apply_config_to_dom(&cfg);
    // Persisted ctx is an enter intent, not confirmed focus. Root will
    // repair and return the authoritative ctx after startup connect.
    state.focus_actor.set(None);
    // Apply log level from config if set.
    if let Some(level) = cfg.get(".my.config.log.level") {
        crate::apply_log_level(level);
    }
    if pruned > 0 {
        if let Err(e) = persist_config(&username, &cfg).await {
            state.push_error(tf("err-inbox-prune-persist", &[("e", &e)]));
        }
    }
    config.set(cfg);
    if let Some(profile_cid) = config
        .get_untracked()
        .get(EgoConfig::PROFILE_CID_KEY)
        .filter(|cid| !cid.is_empty())
        .map(std::string::ToString::to_string)
    {
        crate::state::SESSION_AGENT_CID.with(|c| *c.borrow_mut() = Some(profile_cid));
    }
    // Re-apply language preference from config if set.
    if let Some(lang) = config
        .get_untracked()
        .get(".my.i18n")
        .map(std::string::ToString::to_string)
    {
        let first = lang.split(':').next().unwrap_or(&lang).to_string();
        crate::i18n::init(&first).await;
        state.lang.set(crate::i18n::lang());
        crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(lang));
    } else {
        // No preference stored yet — seed .my.i18n from the browser-detected language.
        let browser_lang = crate::i18n::lang();
        state.lang.set(browser_lang.clone());
        crate::state::SESSION_LANG.with(|l| *l.borrow_mut() = Some(browser_lang.clone()));
        let mut cfg = config.get_untracked();
        cfg.set(".my.i18n", &browser_lang);
        if let Err(e) = persist_config(&username, &cfg).await {
            state.push_error(tf("err-lang-persist", &[("e", &e)]));
        }
        config.set(cfg);
    }
    state.push_system(tf(
        "msg-logged-in",
        &[
            ("version", env!("CARGO_PKG_VERSION")),
            ("username", &username),
        ],
    ));
    state.push_system(t("msg-type-help"));
    state.push_system(t("msg-getting-started"));
}

fn validate_z_manifest(
    manifest: BTreeMap<String, String>,
) -> Result<Vec<(String, cid::Cid)>, String> {
    if !manifest.contains_key("scheme") {
        return Err("manifest is missing required 'scheme' entry".to_string());
    }
    manifest
        .into_iter()
        .map(|(name, value)| {
            if name.is_empty() || name.contains('.') {
                return Err(format!("invalid z manifest entry name '{name}'"));
            }
            let cid = crate::doc_link::parse_link_cid(&value)
                .ok_or_else(|| format!("z manifest entry '{name}' is not a CID"))?;
            Ok((format!(".z.{name}"), cid))
        })
        .collect()
}

fn validate_z_source(path: &str, source: String) -> Result<String, String> {
    if path == ".z.scheme" {
        if source.trim().is_empty() {
            return Err("z scheme source is empty".to_string());
        }
        if !source.ends_with('\n') {
            return Err("z scheme source must end with a newline".to_string());
        }
    }
    Ok(source)
}

fn single_z_scheme_source(source: String) -> Result<Vec<(String, String)>, String> {
    Ok(vec![(
        ".z.scheme".to_string(),
        validate_z_source(".z.scheme", source)?,
    )])
}

async fn load_z_tree(seed: &str) -> Result<Vec<(String, String)>, String> {
    if crate::doc_link::parse_link_cid(seed).is_none() {
        return Err("z URL parameter is not a CID".to_string());
    }
    let manifest = match crate::doc_link::resolve_doc_link(seed).await? {
        crate::doc_link::ResolvedDocContent::Manifest(manifest) => manifest,
        crate::doc_link::ResolvedDocContent::Text(source) => {
            return single_z_scheme_source(source);
        }
    };
    let entries = validate_z_manifest(manifest)?;
    let mut sources = Vec::with_capacity(entries.len());
    for (path, cid) in entries {
        match crate::doc_link::resolve_doc_link(&cid.to_string()).await? {
            crate::doc_link::ResolvedDocContent::Text(source) => {
                let source = validate_z_source(&path, source)?;
                sources.push((path, source));
            }
            crate::doc_link::ResolvedDocContent::Manifest(_) => {
                return Err(format!("{path} points to a nested manifest"));
            }
        }
    }
    Ok(sources)
}

fn normalise_z_reference(value: &str) -> Option<String> {
    crate::doc_link::parse_link_cid(value).map(|cid| format!("/ipfs/{cid}"))
}

/// Resolve our own published DID `ma.z` manifest CID, if present. This is the
/// last saved z selection; the live `.my.z` profile value always wins over it.
async fn resolve_did_z(sender_did: &str) -> Option<String> {
    let resolver = transport::session_resolver().ok()?;
    let document = ma_core::DidDocumentResolver::resolve(resolver.as_ref(), sender_did)
        .await
        .ok()?;
    crate::parser::verbs::doc_z_cid(&document)
}

async fn load_selected_z(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    username: &str,
    sender_did: &str,
    startup_z: Option<String>,
) {
    let mut current = config.get_untracked();
    if current.get(".my.z").is_none() {
        // No live selection yet: fall back to the last published DID `ma.z`,
        // then to the one-time `?z=` onboarding seed.
        let seed = match resolve_did_z(sender_did).await {
            Some(seed) => Some(seed),
            None => startup_z,
        };
        if let Some(seed) = seed {
            let Some(seed) = normalise_z_reference(&seed) else {
                let detail = "z seed: value is not a CID";
                state.push_error(tf("error-profile-fetch", &[("e", detail)]));
                return;
            };
            current.set(".my.z", seed);
            if let Err(error) = persist_config(username, &current).await {
                state.push_error(tf("err-persist", &[("e", &error)]));
                return;
            }
            config.set(current.clone());
        }
    }
    let Some(selected) = current
        .get(".my.z")
        .filter(|value| !value.trim().is_empty())
        .map(str::to_string)
    else {
        return;
    };
    let sources = match load_z_tree(&selected).await {
        Ok(sources) => sources,
        Err(error) => {
            let detail = format!("z seed: {error}");
            state.push_error(tf("error-profile-fetch", &[("e", &detail)]));
            return;
        }
    };
    let latest = config.get_untracked();
    if latest.get(".my.z") != Some(selected.as_str()) {
        return;
    }
    let mut candidate = latest;
    candidate.delete_subtree(".z");
    for (path, source) in sources {
        candidate.set(path, source);
    }
    if let Err(error) = persist_config(username, &candidate).await {
        state.push_error(tf("err-persist", &[("e", &error)]));
        return;
    }
    config.set(candidate);
}

fn normalize_startup_enter(runtime: String) -> String {
    if runtime.starts_with('@') || runtime.contains('@') {
        runtime
    } else {
        format!("@{runtime}")
    }
}

fn startup_ctx_enter(cfg: &EgoConfig) -> Option<String> {
    // Auto-enter saved ctx if runtime is present — no .my.ctx.use flag needed.
    let runtime = cfg.get(".my.ctx.runtime")?.trim();
    if !runtime.starts_with("did:ma:") {
        return None;
    }
    let room = cfg.get(".my.ctx.room")?.trim();
    let (room_runtime, fragment) = room.split_once('#')?;
    if room_runtime != runtime
        || fragment.is_empty()
        || fragment.contains('#')
        || room.chars().any(char::is_whitespace)
    {
        return None;
    }
    let nick = cfg.get(".my.ctx.nick").map(str::trim).filter(|nick| {
        !nick.is_empty() && !nick.contains('@') && !nick.chars().any(char::is_whitespace)
    });
    let target = room.to_string();
    Some(match nick {
        Some(nick) => format!("{nick}@{target}"),
        None => normalize_startup_enter(target),
    })
}

fn valid_enter_nick(nick: &str) -> bool {
    !nick.is_empty() && !nick.contains('@') && !nick.chars().any(char::is_whitespace)
}

fn standard_runtime_enter(cfg: &EgoConfig) -> Option<String> {
    let nick = cfg.get(".my.ctx.nick")?.trim();
    if !valid_enter_nick(nick) || cfg.resolve_alias("ma").is_none() {
        return None;
    }
    Some(format!("{nick}@ma"))
}

fn apply_standard_runtime_alias(cfg: &mut EgoConfig, runtime_did: &str) -> bool {
    if cfg.get(".my.aliases.ma") != Some(runtime_did) {
        cfg.set(".my.aliases.ma", runtime_did);
        return true;
    }
    false
}

async fn ensure_standard_runtime_alias(
    username: &str,
    config: RwSignal<EgoConfig>,
    runtime_did: &str,
) {
    let changed = config
        .try_update(|cfg| apply_standard_runtime_alias(cfg, runtime_did))
        .unwrap_or(false);
    if changed {
        let cfg = config.get_untracked();
        if let Err(e) = persist_config(username, &cfg).await {
            log::warn!("[startup] failed to persist standard runtime alias: {e}");
        }
    }
}

fn startup_enter_publish_did(
    config: RwSignal<EgoConfig>,
    startup_enter: Option<&str>,
) -> Option<String> {
    let raw = normalize_startup_enter(startup_enter?.to_string());
    let target = if let Some(stripped) = raw.strip_prefix('@') {
        stripped
    } else {
        raw.split_once('@')?.1
    };
    let runtime = target.split_once('#').map_or(target, |(did, _)| did).trim();
    if runtime.starts_with("did:ma:") {
        return Some(runtime.to_string());
    }
    let cfg = config.get_untracked();
    let resolved = cfg.resolve_alias(runtime)?;
    let did = resolved
        .split_once('#')
        .map_or(resolved, |(did, _)| did)
        .trim();
    did.starts_with("did:ma:").then(|| did.to_string())
}

fn queue_startup_context(
    state: &AppState,
    config: RwSignal<EgoConfig>,
    discovered_runtime_did: Option<&str>,
) {
    let explicit = state
        .startup_enter
        .update_untracked(std::option::Option::take)
        .map(normalize_startup_enter);
    if let Some(runtime) = explicit {
        state
            .input_queue
            .update(|q| q.push_back(format!(".enter {runtime}")));
        return;
    }
    let cfg = config.get_untracked();
    // If a saved ctx exists, attempt to re-enter it; if invalid, don't fall
    // through to the generic fallback — the user has an explicit context.
    let has_saved_ctx = cfg
        .get(".my.ctx.runtime")
        .is_some_and(|r| !r.trim().is_empty());
    if has_saved_ctx {
        if let Some(room) = startup_ctx_enter(&cfg) {
            state
                .input_queue
                .update(|q| q.push_back(format!(".enter {room}")));
        }
        return;
    }
    let fallback_enter = discovered_runtime_did
        .and_then(|_| standard_runtime_enter(&cfg))
        .or_else(|| discovered_runtime_did.map(|did| normalize_startup_enter(did.to_string())));
    if let Some(runtime) = fallback_enter {
        state
            .input_queue
            .update(|q| q.push_back(format!(".enter {runtime}")));
    }
}

pub(crate) fn queue_saved_context_reentry(state: &AppState, config: RwSignal<EgoConfig>) -> bool {
    let cfg = config.get_untracked();
    let Some(runtime) = startup_ctx_enter(&cfg) else {
        return false;
    };
    state
        .input_queue
        .update(|q| q.push_back(format!(".enter {runtime}")));
    true
}

fn should_queue_startup_enter(outcome: &ConnectMaOutcome) -> bool {
    outcome.allows_startup_enter()
}

fn skip_startup_enter_message(outcome: &ConnectMaOutcome) -> String {
    tf("msg-startup-enter-skipped", &[("target", outcome.target())])
}

pub(crate) async fn startup_load_history(state: AppState, username: String) {
    match load_history(&username).await {
        Ok(Some(json)) => match serde_json::from_str::<Vec<String>>(&json) {
            Ok(hist) => state.history.set(hist),
            Err(e) => state.push_error(tf("err-history-parse", &[("e", &e.to_string())])),
        },
        Ok(None) => {}
        Err(e) => state.push_error(tf("err-history-load", &[("e", &e)])),
    }
}

pub(crate) async fn startup_connect(
    state: AppState,
    config: RwSignal<EgoConfig>,
    sess: SessionState,
    startup_ma: Option<String>,
    startup_z: Option<String>,
) {
    let iroh_key = sess.iroh_key;
    let ipns_secret_key = sess.ipns_secret_key;
    let did_signing_key = sess.did_signing_key;
    let did_encryption_key = sess.did_encryption_key;
    let sender_did = sess.sender_did.clone();
    let created_at = sess.created_at.clone();
    let username = sess.username.clone();
    state.push_system(t("msg-connecting"));
    match transport::connect(
        iroh_key,
        ipns_secret_key,
        did_signing_key,
        did_encryption_key,
        sender_did.clone(),
        created_at,
    )
    .await
    {
        Ok(()) => {
            let endpoint_id = transport::get_endpoint_id().unwrap_or_default();
            state.push_system(format!("{} — {}", t("msg-iroh-ready"), endpoint_id));
            let startup_enter = state.startup_enter.get_untracked();
            let ma_outcome = startup_local_ma(
                state.clone(),
                config,
                username.clone(),
                sess.is_new,
                startup_ma,
                startup_enter,
            )
            .await;
            if should_queue_startup_enter(&ma_outcome) {
                load_selected_z(&state, config, &username, &sender_did, startup_z).await;
                queue_startup_zscheme(&state, config);
            }
            if should_queue_startup_enter(&ma_outcome) {
                let discovered_runtime_did = match &ma_outcome {
                    ConnectMaOutcome::Ready { did } => Some(did.as_str()),
                    _ => None,
                };
                if let Some(did) = discovered_runtime_did {
                    ensure_standard_runtime_alias(&username, config, did).await;
                }
                queue_startup_context(&state, config, discovered_runtime_did);
            } else {
                state.startup_enter.update_untracked(|v| {
                    let _ = v.take();
                });
                state.push_system(skip_startup_enter_message(&ma_outcome));
            }
        }
        Err(e) => state.push_error(tf("msg-iroh-failed", &[("e", &e)])),
    }
}

pub(crate) fn queue_startup_zscheme(state: &AppState, config: RwSignal<EgoConfig>) {
    let has_zscheme_source = config
        .get_untracked()
        .get(".z.scheme")
        .is_some_and(|source| !source.trim().is_empty());
    if has_zscheme_source {
        state.input_queue.update(|queue| {
            queue.push_back(".batch!sync".to_string());
            queue.push_back(".z.scheme!eval".to_string());
        });
    }
    if has_zscheme_source {
        state
            .input_queue
            .update(|queue| queue.push_back(".batch".to_string()));
    }
}

#[cfg(test)]
mod tests {
    use super::{
        apply_standard_runtime_alias, normalise_z_reference, normalize_startup_enter,
        queue_startup_context, queue_startup_zscheme, select_startup_ma,
        should_queue_startup_enter, single_z_scheme_source, standard_runtime_enter,
        startup_ctx_enter, validate_z_manifest, validate_z_source,
    };
    use crate::parser::verbs::ma::ConnectMaOutcome;
    use crate::{config::EgoConfig, state::AppState};
    use leptos::prelude::{GetUntracked, UpdateUntracked};
    use std::collections::BTreeMap;

    const RAW_CID: &str = "bafkreigh2akiscaildcqabsyg3dfr6chu3fgpregiymsck7e7aqa4s52zy";

    #[test]
    fn z_reference_is_validated_and_canonicalised() {
        assert_eq!(
            normalise_z_reference(RAW_CID),
            Some(format!("/ipfs/{RAW_CID}"))
        );
        assert_eq!(
            normalise_z_reference(&format!("/ipfs/{RAW_CID}")),
            Some(format!("/ipfs/{RAW_CID}"))
        );
        assert_eq!(normalise_z_reference("not-a-cid"), None);
    }

    #[test]
    fn z_manifest_requires_scheme_and_builds_local_paths() {
        let manifest = BTreeMap::from([
            ("avatar".to_string(), RAW_CID.to_string()),
            ("scheme".to_string(), format!("/ipfs/{RAW_CID}")),
        ]);

        let entries = validate_z_manifest(manifest).expect("valid z manifest");

        assert_eq!(
            entries
                .iter()
                .map(|(path, _)| path.as_str())
                .collect::<Vec<_>>(),
            [".z.avatar", ".z.scheme"]
        );
    }

    #[test]
    fn z_manifest_rejects_missing_scheme() {
        let manifest = BTreeMap::from([("avatar".to_string(), RAW_CID.to_string())]);

        assert_eq!(
            validate_z_manifest(manifest).unwrap_err(),
            "manifest is missing required 'scheme' entry"
        );
    }

    #[test]
    fn z_manifest_rejects_invalid_entry_before_import() {
        let manifest = BTreeMap::from([
            ("scheme".to_string(), RAW_CID.to_string()),
            ("runtime.debug".to_string(), RAW_CID.to_string()),
        ]);
        assert!(validate_z_manifest(manifest).is_err());

        let manifest = BTreeMap::from([("scheme".to_string(), "not-a-cid".to_string())]);
        assert!(validate_z_manifest(manifest).is_err());
    }

    #[test]
    fn z_manifest_scheme_source_must_be_non_empty_and_line_complete() {
        assert!(validate_z_source(".z.scheme", String::new()).is_err());
        assert!(validate_z_source(".z.scheme", "(define x 1)".to_string()).is_err());
        assert_eq!(
            validate_z_source(".z.scheme", "(define x 1)\n".to_string()).unwrap(),
            "(define x 1)\n"
        );
        assert_eq!(
            validate_z_source(".z.example", "notes".to_string()).unwrap(),
            "notes"
        );
    }

    #[test]
    fn direct_z_source_seed_imports_as_scheme_source() {
        assert_eq!(
            single_z_scheme_source("(define x 1)\n".to_string()).unwrap(),
            vec![(".z.scheme".to_string(), "(define x 1)\n".to_string())]
        );
        assert!(single_z_scheme_source("(define x 1)".to_string()).is_err());
    }

    #[test]
    fn landing_field_runtime_is_selected() {
        assert_eq!(
            select_startup_ma(Some("did:ma:new".to_string())),
            Some("did:ma:new".to_string())
        );
    }

    #[test]
    fn empty_landing_field_selects_no_runtime() {
        assert_eq!(select_startup_ma(Some(String::new())), None);
    }

    #[test]
    fn normalize_startup_enter_accepts_url_did_and_alias_forms() {
        assert_eq!(
            normalize_startup_enter("did:ma:k51example".to_string()),
            "@did:ma:k51example"
        );
        assert_eq!(normalize_startup_enter("sky".to_string()), "@sky");
        assert_eq!(normalize_startup_enter("@sky".to_string()), "@sky");
        assert_eq!(
            normalize_startup_enter("Armageddon@sky".to_string()),
            "Armageddon@sky"
        );
    }

    #[test]
    fn startup_ctx_enter_reestablishes_nick_runtime_room_intent() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51runtime#concourse");
        cfg.set(".my.ctx.nick", "klaim");
        cfg.set(".my.aliases.ma", "did:ma:k51runtime");
        assert_eq!(
            startup_ctx_enter(&cfg),
            Some("klaim@did:ma:k51runtime#concourse".to_string())
        );
    }

    #[test]
    fn startup_ctx_enter_reestablishes_unaliased_room_without_double_at() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51runtime#concourse");
        cfg.set(".my.ctx.nick", "klaim");
        assert_eq!(
            startup_ctx_enter(&cfg),
            Some("klaim@did:ma:k51runtime#concourse".to_string())
        );
    }

    #[test]
    fn startup_ctx_enter_requires_a_room_in_the_saved_runtime() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
        cfg.set(".my.ctx.room", "did:ma:k51other#concourse");
        cfg.set(".my.ctx.nick", "bad nick");
        assert_eq!(startup_ctx_enter(&cfg), None);
    }

    #[test]
    fn active_invalid_saved_context_does_not_queue_runtime_entry() {
        let _owner = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = leptos::prelude::RwSignal::new(EgoConfig::new());
        config.update_untracked(|cfg| {
            cfg.set(".my.ctx.runtime", "did:ma:k51runtime");
            cfg.set(".my.ctx.room", "did:ma:k51other#concourse");
        });

        queue_startup_context(&state, config, Some("did:ma:k51runtime"));

        assert!(state.input_queue.get_untracked().is_empty());
    }

    #[test]
    fn standard_runtime_alias_sets_ma_alias_only() {
        let mut cfg = EgoConfig::new();

        assert!(apply_standard_runtime_alias(&mut cfg, "did:ma:k51runtime"));

        assert_eq!(cfg.get(".my.aliases.ma"), Some("did:ma:k51runtime"));
        assert_eq!(cfg.get(".my.ctx.nick"), None);
        assert_eq!(standard_runtime_enter(&cfg), None);
    }

    #[test]
    fn standard_runtime_alias_preserves_existing_nick() {
        let mut cfg = EgoConfig::new();
        cfg.set(".my.ctx.nick", "klaim");

        assert!(apply_standard_runtime_alias(&mut cfg, "did:ma:k51runtime"));

        assert_eq!(cfg.get(".my.aliases.ma"), Some("did:ma:k51runtime"));
        assert_eq!(cfg.get(".my.ctx.nick"), Some("klaim"));
        assert_eq!(standard_runtime_enter(&cfg), Some("klaim@ma".to_string()));
    }

    #[test]
    fn startup_zscheme_eval_precedes_startup_context() {
        let _owner = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = leptos::prelude::RwSignal::new(EgoConfig::new());
        config.update_untracked(|cfg| {
            cfg.set(".z.scheme", "(define x 1)");
            cfg.set(".my.ctx.nick", "klaim");
        });

        queue_startup_zscheme(&state, config);
        queue_startup_context(&state, config, Some("did:ma:k51runtime"));

        assert_eq!(
            state
                .input_queue
                .get_untracked()
                .into_iter()
                .collect::<Vec<_>>(),
            [
                ".batch!sync",
                ".z.scheme!eval",
                ".batch",
                ".enter @did:ma:k51runtime"
            ]
        );
    }

    #[test]
    fn empty_zscheme_source_does_not_enter_the_startup_batch() {
        let _owner = leptos::prelude::Owner::new();
        let state = AppState::new();
        let config = leptos::prelude::RwSignal::new(EgoConfig::new());
        config.update_untracked(|cfg| {
            cfg.set(".z.scheme", "   ");
        });

        queue_startup_zscheme(&state, config);
        queue_startup_context(&state, config, Some("did:ma:k51runtime"));

        assert_eq!(
            state
                .input_queue
                .get_untracked()
                .into_iter()
                .collect::<Vec<_>>(),
            [".enter @did:ma:k51runtime"]
        );
    }

    #[test]
    fn startup_enter_requires_ready_ma_outcome() {
        assert!(should_queue_startup_enter(&ConnectMaOutcome::Ready {
            did: "did:ma:k51runtime".to_string(),
        }));
        assert!(!should_queue_startup_enter(
            &ConnectMaOutcome::PingTimedOut {
                did: "did:ma:k51runtime".to_string(),
            }
        ));
        assert!(!should_queue_startup_enter(
            &ConnectMaOutcome::Unavailable {
                target: "http://localhost:5003".to_string(),
            }
        ));
    }
}
