/// Landing page — single panel with mode-selector buttons.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::{FileReader, HtmlInputElement, KeyboardEvent, MouseEvent};

use crate::{
    config::EgoConfig,
    i18n::{t, tf},
    identity::{
        create_identity_did_named, export_for_download, import_from_bytes, load_identity,
        save_config, save_identity, storage::load_config, unlock_identity_migrating,
    },
    profile_crypto,
    state::{AppState, SessionState, SESSION_LOCAL_IPFS, SESSION_PROFILE_KEY},
};

const LAST_DID_KEY: &str = "zion_last_did";
const LAST_RUNTIME_KEY: &str = "zion_last_runtime";
const IPFS_GATEWAY_PREF_KEY: &str = "zion_ipfs_gateway";

fn validate_new_passphrase(pass: &str, confirm: &str) -> Result<(), &'static str> {
    if pass.is_empty() {
        Err("error-passphrase-required")
    } else if pass.chars().count() < 20 {
        Err("error-passphrase-too-short")
    } else if pass != confirm {
        Err("error-passphrases-no-match")
    } else {
        Ok(())
    }
}

fn load_ipfs_gateway_pref() -> String {
    web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .and_then(|s| s.get_item(IPFS_GATEWAY_PREF_KEY).ok().flatten())
        .filter(|s| !s.is_empty())
        .unwrap_or_else(|| crate::transport::connection::LOCAL_GATEWAY_URL.to_string())
}

fn save_ipfs_gateway_pref(url: &str) {
    let _ = web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .map(|s| s.set_item(IPFS_GATEWAY_PREF_KEY, url));
}

fn is_local_gateway(url: &str) -> bool {
    url.contains("localhost") || url.contains("127.0.0.1")
}

/// Persist the last successfully connected runtime (DID or URL) to localStorage.
/// Called by `src/parser/verbs/ma.rs` after a successful `.ma!connect`.
pub(crate) fn save_last_runtime(runtime: &str) {
    let _ = web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .map(|s| s.set_item(LAST_RUNTIME_KEY, runtime));
}

fn load_last_runtime() -> String {
    web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .and_then(|s| s.get_item(LAST_RUNTIME_KEY).ok().flatten())
        .filter(|s| !s.is_empty())
        .unwrap_or_else(|| "http://localhost:5003".to_string())
}

fn save_last_did(did: &str) {
    let _ = web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .map(|s| s.set_item(LAST_DID_KEY, did));
}

fn load_last_did() -> Option<String> {
    web_sys::window()
        .and_then(|w| w.local_storage().ok().flatten())
        .and_then(|s| s.get_item(LAST_DID_KEY).ok().flatten())
        .filter(|s| !s.is_empty())
}

/// Derive the `IndexedDB` storage key from a DID.
fn username_from_did(did: &str) -> String {
    did.strip_prefix("did:ma:").unwrap_or(did).to_string()
}

fn keyboard_event_key(ev: &KeyboardEvent) -> Option<String> {
    js_sys::Reflect::get(ev.as_ref(), &wasm_bindgen::JsValue::from_str("key"))
        .ok()
        .and_then(|value| value.as_string())
}

#[derive(Clone, Copy, PartialEq)]
enum Mode {
    Login,
    New,
    Import,
    Export,
    Config,
}

#[component]
pub fn Landing() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let lang = state.lang;

    let mode = RwSignal::new(Mode::Login);
    let did_input = RwSignal::new(load_last_did().unwrap_or_default());
    let nick = RwSignal::new(String::new());
    let password = RwSignal::new(String::new());
    let confirm_password = RwSignal::new(String::new());
    let status = RwSignal::new(String::new());
    let error = RwSignal::new(String::new());
    let initial_gateway = load_ipfs_gateway_pref();
    let gateway_input = RwSignal::new(initial_gateway.clone());
    SESSION_LOCAL_IPFS.with(|f| *f.borrow_mut() = is_local_gateway(&initial_gateway));
    // For Import mode: pre-parsed (username, identity_json, config_json).
    let parsed: RwSignal<Option<(String, String, Option<String>)>> = RwSignal::new(None);
    // Export mode: rendered QR SVG of the encrypted profile.
    let qr_svg: RwSignal<Option<String>> = RwSignal::new(None);
    // Import mode: camera scan in progress.
    let scanning = RwSignal::new(false);
    let scan_feedback = RwSignal::new("searching");
    let scan_frames = RwSignal::new(0_u32);
    let video_ref = NodeRef::<leptos::html::Video>::new();

    // Runtime field: DID or HTTP URL to connect to after login.
    // Seeded from `?ma=` URL param (already in state.startup_ma) or localStorage.
    let startup_ma = state.startup_ma.get_untracked();
    let prev_runtime = load_last_runtime();

    // Suggestions: URL param, prev saved, default — deduplicated, max 3.
    let ma_options: Vec<String> = {
        let mut seen = std::collections::HashSet::new();
        let mut opts = Vec::new();
        for val in [
            startup_ma.as_deref().unwrap_or(""),
            prev_runtime.as_str(),
            "http://localhost:5003",
        ] {
            if !val.is_empty() && seen.insert(val.to_string()) {
                opts.push(val.to_string());
            }
        }
        opts
    };

    let ma_input = RwSignal::new(
        startup_ma
            .filter(|v| v.starts_with("did:ma:") || v.starts_with("http"))
            .unwrap_or_else(|| prev_runtime.clone()),
    );

    // Background music.
    Effect::new(move |_| {
        let _ = js_sys::eval(
            "if(!window._bgMusic){\
                window._bgMusic=new Audio('/hh.ogg');\
                window._bgMusic.loop=true;\
                window._bgMusic.volume=0.4;\
            }\
            window._bgMusic.play().catch(function(){});",
        );
    });
    on_cleanup(|| {
        let _ = js_sys::eval(
            "if(window._bgMusic){window._bgMusic.pause();window._bgMusic.currentTime=0;}",
        );
    });

    // When the DID field has a value, try to load the user's language
    // preference from IndexedDB so the landing page is shown in their language.
    let state_lang = state.clone();
    Effect::new(move |_| {
        let did = did_input.get();
        if did.trim().is_empty() {
            return;
        }
        let uname = username_from_did(did.trim());
        let state2 = state_lang.clone();
        spawn_local(async move {
            if let Ok(Some(cfg_json)) = crate::identity::storage::load_config(&uname).await {
                if let Ok(cfg) = crate::config::EgoConfig::from_json(&cfg_json) {
                    if let Some(lang_tag) = cfg.get(".my.i18n") {
                        if crate::i18n::init(lang_tag).await {
                            state2.lang.set(crate::i18n::lang());
                        }
                    }
                }
            }
        });
    });

    // ── Mode selector — clicking an active button toggles back to Login ───
    let set_mode = move |m: Mode| {
        let next = if mode.get_untracked() == m {
            Mode::Login
        } else {
            m
        };
        mode.set(next);
        nick.set(String::new());
        password.set(String::new());
        confirm_password.set(String::new());
        error.set(String::new());
        status.set(String::new());
        parsed.set(None);
        qr_svg.set(None);
        scanning.set(false);
        if next == Mode::New {
            did_input.set(String::new());
        }
    };

    // ── Finalise login: derive profile key, save DID, set session ─────────
    // Free function so it can be called from multiple spawn_local blocks.
    fn finish_login(
        id: crate::identity::UnlockedIdentity,
        uname: String,
        pass: String,
        state: AppState,
    ) {
        let profile_key = profile_crypto::derive_key(&pass);
        SESSION_PROFILE_KEY.with(|k| *k.borrow_mut() = Some(profile_key));
        save_last_did(&id.sender_did);
        state.session.set(Some(SessionState {
            username: uname,
            iroh_key: id.iroh_key,
            ipns_secret_key: id.ipns_secret_key,
            did_signing_key: id.did_signing_key,
            did_encryption_key: id.did_encryption_key,
            sender_did: id.sender_did,
            created_at: id.created_at,
        }));
    }

    // ── Login / Ny / Import action ────────────────────────────────────────
    let do_login = {
        let state = state.clone();
        move || {
            let state = state.clone(); // fresh clone each call → Fn not FnOnce
                                       // Capture runtime choice before any branching.
            let ma_val = ma_input.get_untracked();
            if !ma_val.is_empty() {
                state.startup_ma.set(Some(ma_val));
            }
            let current_mode = mode.get_untracked();
            let did = did_input.get_untracked().trim().to_string();
            let chosen_nick = nick.get_untracked().trim().to_string();
            let pass = password.get_untracked();
            let confirm = confirm_password.get_untracked();
            error.set(String::new());

            // ── Ny ────────────────────────────────────────────────────────
            if current_mode == Mode::New {
                if chosen_nick.is_empty() {
                    error.set(t("error-nick-required"));
                    return;
                }
                if chosen_nick.contains('@') || chosen_nick.chars().any(char::is_whitespace) {
                    error.set(t("error-nick-invalid"));
                    return;
                }
                match validate_new_passphrase(&pass, &confirm) {
                    Ok(()) => {}
                    Err(key) => {
                        error.set(t(key));
                        return;
                    }
                }
                status.set(t("status-generating"));
                let state2 = state.clone();
                spawn_local(async move {
                    match create_identity_did_named(&pass) {
                        Ok((new_did, export_json, id)) => {
                            let uname = username_from_did(&new_did);
                            match save_identity(&uname, &export_json).await {
                                Ok(()) => {
                                    let mut cfg = EgoConfig::new();
                                    cfg.set(".my.ctx.nick", &chosen_nick);
                                    match cfg.to_json() {
                                        Ok(cfg_json) => {
                                            match save_config(&uname, &cfg_json).await {
                                                Ok(()) => {
                                                    status.set(String::new());
                                                    did_input.set(new_did);
                                                    finish_login(id, uname, pass, state2);
                                                }
                                                Err(e) => {
                                                    status.set(String::new());
                                                    error.set(e);
                                                }
                                            }
                                        }
                                        Err(e) => {
                                            status.set(String::new());
                                            error.set(e.clone());
                                        }
                                    }
                                }
                                Err(e) => {
                                    status.set(String::new());
                                    error.set(e);
                                }
                            }
                        }
                        Err(e) => {
                            status.set(String::new());
                            error.set(e);
                        }
                    }
                });
                return;
            }

            // ── Import ────────────────────────────────────────────────────
            if current_mode == Mode::Import {
                let p = if let Some(p) = parsed.get_untracked() {
                    p
                } else {
                    error.set(t("error-profile-source-required"));
                    return;
                };
                if pass.is_empty() {
                    error.set(t("error-passphrase-required"));
                    return;
                }
                let (uname, id_json, cfg_opt) = p;
                let state2 = state.clone();
                spawn_local(async move {
                    match unlock_identity_migrating(&id_json, &pass) {
                        Ok((id, migrated)) => {
                            match save_identity(&uname, migrated.as_deref().unwrap_or(&id_json))
                                .await
                            {
                                Ok(()) => {
                                    if let Some(cfg_json) = cfg_opt {
                                        let _ = save_config(&uname, &cfg_json).await;
                                    }
                                    finish_login(id, uname, pass, state2);
                                }
                                Err(e) => error.set(e),
                            }
                        }
                        Err(e) => error.set(tf("error-wrong-passphrase", &[("e", &e)])),
                    }
                });
                return;
            }

            // ── Login ─────────────────────────────────────────────────────
            if did.is_empty() {
                error.set(t("error-did-required"));
                return;
            }
            if pass.is_empty() {
                error.set(t("error-passphrase-required"));
                return;
            }
            let uname = username_from_did(&did);
            status.set(t("status-unlocking"));
            let state2 = state.clone();
            spawn_local(async move {
                match load_identity(&uname).await {
                    Ok(Some(stored)) => {
                        match unlock_identity_migrating(&stored.export_json, &pass) {
                            Ok((id, migrated)) => {
                                if let Some(migrated) = migrated {
                                    if let Err(e) = save_identity(&uname, &migrated).await {
                                        status.set(String::new());
                                        error.set(e);
                                        return;
                                    }
                                }
                                status.set(String::new());
                                finish_login(id, uname, pass, state2);
                            }
                            Err(e) => {
                                status.set(String::new());
                                error.set(tf("error-wrong-passphrase", &[("e", &e)]));
                            }
                        }
                    }
                    local_result => {
                        if let Err(e) = local_result {
                            log::warn!("[login] local identity cache unavailable: {e}");
                        }
                        // Not available from IndexedDB — resolve the published
                        // profile and repopulate the local cache.
                        status.set(t("status-fetching-profile"));
                        use ma_core::DidDocumentResolver;
                        let resolver = ma_core::IpfsGatewayResolver::default();
                        let full_did = format!("did:ma:{uname}");
                        match resolver.resolve(&full_did).await {
                            Ok(doc) => {
                                // Apply language from DID document if present.
                                if let Some(ma_core::Ipld::Map(ref ma)) = doc.ma {
                                    if let Some(ma_core::Ipld::String(lang)) = ma.get("lang") {
                                        if crate::i18n::init(lang).await {
                                            state2.lang.set(crate::i18n::lang());
                                        }
                                    }
                                }
                                if let Some(profile_cid) =
                                    crate::parser::verbs::doc_profile_cid(&doc)
                                {
                                    match crate::http::fetch_cid_bytes(&profile_cid).await {
                                        Ok(cbor) => {
                                            let profile_key = profile_crypto::derive_key(&pass);
                                            // Temporary backward compatibility: during migration
                                            // we still accept legacy plaintext DAG-CBOR profile
                                            // blobs if decryption fails.
                                            // Remove after 2026-08-20.
                                            let decoded = match profile_crypto::decrypt_with_key(
                                                &cbor,
                                                &profile_key,
                                            ) {
                                                Ok(plain) => plain,
                                                Err(_) => cbor.clone(),
                                            };
                                            // Decode DAG-CBOR → nested profile.
                                            let parsed_opt = serde_ipld_dagcbor::from_slice::<
                                                serde_json::Value,
                                            >(
                                                &decoded
                                            )
                                            .ok()
                                            .and_then(|profile_val| {
                                                let username = profile_val
                                                    .get("username")?
                                                    .as_str()?
                                                    .to_string();
                                                let id_json = match profile_val.get("identity")? {
                                                    serde_json::Value::String(s) => s.clone(),
                                                    other => serde_json::to_string(other).ok()?,
                                                };
                                                let cfg_json = {
                                                    let mut tmp = EgoConfig::new();
                                                    tmp.merge_from_nested_profile(&profile_val)
                                                        .ok()?;
                                                    tmp.to_json().ok()
                                                };
                                                Some((username, id_json, cfg_json))
                                            });
                                            if let Some((pname, id_json, cfg_opt)) = parsed_opt {
                                                match unlock_identity_migrating(&id_json, &pass) {
                                                    Ok((id, migrated)) => {
                                                        if let Err(e) = save_identity(
                                                            &pname,
                                                            migrated.as_deref().unwrap_or(&id_json),
                                                        )
                                                        .await
                                                        {
                                                            status.set(String::new());
                                                            error.set(e);
                                                            return;
                                                        }
                                                        if let Some(cfg) = cfg_opt {
                                                            let _ = save_config(&pname, &cfg).await;
                                                        }
                                                        status.set(String::new());
                                                        finish_login(id, pname, pass, state2);
                                                    }
                                                    Err(e) => {
                                                        status.set(String::new());
                                                        error.set(tf(
                                                            "error-wrong-passphrase",
                                                            &[("e", &e)],
                                                        ));
                                                    }
                                                }
                                            } else {
                                                status.set(String::new());
                                                error.set(t("profile-no-cid-in-doc"));
                                            }
                                        }
                                        Err(e) => {
                                            status.set(String::new());
                                            error.set(tf("error-profile-fetch", &[("e", &e)]));
                                        }
                                    }
                                } else {
                                    status.set(String::new());
                                    error.set(t("profile-no-cid-in-doc"));
                                }
                            }
                            Err(e) => {
                                status.set(String::new());
                                error.set(tf("error-profile-fetch", &[("e", &e.to_string())]));
                            }
                        }
                    }
                }
            });
        }
    };

    // ── Export action ─────────────────────────────────────────────────────
    let do_export = move |_: MouseEvent| {
        let did = did_input.get_untracked().trim().to_string();
        if did.is_empty() {
            error.set(t("error-did-required"));
            return;
        }
        let uname = username_from_did(&did);
        spawn_local(async move {
            match load_identity(&uname).await {
                Ok(Some(stored)) => {
                    let cfg_json = load_config(&uname).await.ok().flatten();
                    let json =
                        export_for_download(&stored.export_json, &uname, cfg_json.as_deref());
                    trigger_download(&format!("{uname}.zion.json"), &json);
                }
                Ok(None) => error.set(tf("error-identity-not-found", &[("name", &uname)])),
                Err(e) => error.set(e),
            }
        });
    };

    // ── File selection (Import mode) ──────────────────────────────────────
    let on_file_change = move |ev: web_sys::Event| {
        let Some(input) = ev
            .target()
            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
        else {
            return;
        };
        if let Some(files) = input.files() {
            if let Some(file) = files.get(0) {
                let reader = FileReader::new().unwrap();
                let reader2 = reader.clone();
                let onload =
                    wasm_bindgen::closure::Closure::wrap(Box::new(move |_: web_sys::Event| {
                        let Ok(result) = reader2.result() else {
                            return;
                        };
                        if let Some(text) = result.as_string() {
                            let raw = text.into_bytes();
                            spawn_local(async move {
                                match import_from_bytes(&raw) {
                                    Ok((uname, id_json, cfg_opt)) => {
                                        did_input.set(format!("did:ma:{uname}"));
                                        parsed.set(Some((uname, id_json, cfg_opt)));
                                        error.set(String::new());
                                    }
                                    Err(e) => error.set(e),
                                }
                            });
                        }
                    })
                        as Box<dyn FnMut(_)>);
                reader.set_onload(Some(onload.as_ref().unchecked_ref()));
                onload.forget();
                reader.read_as_text(&file).unwrap();
            }
        }
    };

    // ── Export as QR: keys-only profile (no EgoConfig), same encryption ──
    let do_show_qr = move |_: MouseEvent| {
        let did = did_input.get_untracked().trim().to_string();
        if did.is_empty() {
            error.set(t("error-did-required"));
            return;
        }
        let uname = username_from_did(&did);
        spawn_local(async move {
            match load_identity(&uname).await {
                Ok(Some(_)) => match crate::views::qr::generate_qr_svg(&did) {
                    Ok(svg) => {
                        error.set(String::new());
                        qr_svg.set(Some(svg));
                    }
                    Err(crate::views::qr::QrGenError::TooLarge) => {
                        error.set(t("qr-error-too-large"));
                    }
                    Err(crate::views::qr::QrGenError::Encode(e)) => error.set(e),
                },
                Ok(None) => error.set(tf("error-identity-not-found", &[("name", &uname)])),
                Err(e) => error.set(e),
            }
        });
    };

    // ── QR scan (Import mode) ─────────────────────────────────────────────
    let start_scan = move |_: MouseEvent| {
        if scanning.get_untracked() {
            return;
        }
        scanning.set(true);
        scan_feedback.set("searching");
        scan_frames.set(0);
        error.set(String::new());
        spawn_local(async move {
            // Wait for the <video> element to mount.
            let video = loop {
                if !scanning.try_get_untracked().unwrap_or(false) {
                    return;
                }
                if let Some(v) = video_ref.get_untracked() {
                    break v;
                }
                gloo_timers::future::TimeoutFuture::new(50).await;
            };
            let stream = match crate::views::qr::open_camera(&video).await {
                Ok(s) => s,
                Err(e) => {
                    scanning.set(false);
                    error.set(tf("qr-error-camera", &[("e", &e)]));
                    return;
                }
            };
            let mut native_detector = crate::views::qr::NativeQrDetector::new();
            loop {
                if !scanning.try_get_untracked().unwrap_or(false) {
                    break;
                }
                let scan_result = if let Some(detector) = native_detector.as_ref() {
                    if let Ok(result) = detector.decode(&video).await {
                        result
                    } else {
                        native_detector = None;
                        crate::views::qr::try_decode_frame(&video)
                    }
                } else {
                    crate::views::qr::try_decode_frame(&video)
                };
                match scan_result {
                    crate::views::qr::QrScanResult::WaitingForVideo => {
                        scan_feedback.set("waiting");
                    }
                    crate::views::qr::QrScanResult::CaptureError => {
                        scan_feedback.set("capture-error");
                    }
                    crate::views::qr::QrScanResult::NoCode => {
                        let frame = scan_frames.get_untracked().wrapping_add(1);
                        scan_frames.set(frame);
                        scan_feedback.set(if frame.is_multiple_of(2) {
                            "searching phase-a"
                        } else {
                            "searching phase-b"
                        });
                    }
                    crate::views::qr::QrScanResult::Unreadable => {
                        scan_frames.update(|frame| *frame = frame.wrapping_add(1));
                        scan_feedback.set("unreadable");
                    }
                    crate::views::qr::QrScanResult::Decoded(bytes) => {
                        scan_frames.update(|frame| *frame = frame.wrapping_add(1));
                        scan_feedback.set("decoded");
                        if let Some(scanned_did) = crate::views::qr::did_payload(&bytes) {
                            gloo_timers::future::TimeoutFuture::new(250).await;
                            did_input.set(scanned_did);
                            parsed.set(None);
                            error.set(String::new());
                            status.set(String::new());
                            scanning.set(false);
                            mode.set(Mode::Login);
                            break;
                        }
                        if let Ok((uname, id_json, cfg_opt)) = import_from_bytes(&bytes) {
                            gloo_timers::future::TimeoutFuture::new(250).await;
                            did_input.set(format!("did:ma:{uname}"));
                            parsed.set(Some((uname, id_json, cfg_opt)));
                            error.set(String::new());
                            scanning.set(false);
                            break;
                        }
                        scan_feedback.set("unreadable");
                    }
                }
                gloo_timers::future::TimeoutFuture::new(300).await;
            }
            crate::views::qr::close_camera(&stream);
            video.set_src_object(None);
        });
    };

    // Enter key triggers the action.
    let do_login_key = do_login.clone();
    let on_keydown = move |ev: KeyboardEvent| {
        if keyboard_event_key(&ev).as_deref() == Some("Enter")
            && mode.get_untracked() != Mode::Export
            && mode.get_untracked() != Mode::Config
        {
            do_login_key();
        }
    };
    // Single action button — branches on mode at runtime.
    let do_login_click_rc = std::rc::Rc::new(do_login);
    let do_login_click2 = do_login_click_rc.clone();
    let do_action = move |ev: MouseEvent| {
        if mode.get_untracked() == Mode::Export {
            do_export(ev);
        } else {
            do_login_click_rc();
        }
    };
    let _ = do_login_click2; // keep for keydown

    view! {
        <div
            class="landing"
            on:click=move |_| {
                let _ = js_sys::eval(
                    "if(window._bgMusic)window._bgMusic.play().catch(function(){});",
                );
            }
            on:keydown=on_keydown
        >
            <div class="landing-box">
                // ── Mode selector (tabs) ──────────────────────────────────
                <div class="landing-tabs">
                    <button
                        class=move || if mode.get() == Mode::New { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| set_mode(Mode::New)
                    >{move || { let _ = lang.get(); t("tab-new-identity") }}</button>
                    <button
                        class=move || if mode.get() == Mode::Export { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| set_mode(Mode::Export)
                    >{move || { let _ = lang.get(); t("btn-export") }}</button>
                    <button
                        class=move || if mode.get() == Mode::Import { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| set_mode(Mode::Import)
                    >{move || { let _ = lang.get(); t("tab-import-profile") }}</button>
                    <button
                        class=move || if mode.get() == Mode::Config { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| set_mode(Mode::Config)
                    >{move || { let _ = lang.get(); t("tab-config") }}</button>
                </div>

                // ── Settings / Config mode ────────────────────────────────
                <Show when=move || mode.get() == Mode::Config>
                    <Show when=move || ma_input.get().starts_with("did:ma:")>
                        <p class="landing-warning">{move || { let _ = lang.get(); t("warning-remote-runtime") }}</p>
                    </Show>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-runtime") }}</label>
                        <input
                            type="text"
                            list="ma-opts"
                            prop:value=move || ma_input.get()
                            placeholder=move || { let _ = lang.get(); t("label-runtime-placeholder") }
                            on:focus=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|t| t.dyn_into::<HtmlInputElement>().ok())
                                { input.set_value(""); }
                            }
                            on:blur=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|t| t.dyn_into::<HtmlInputElement>().ok())
                                {
                                    if input.value().is_empty() {
                                        input.set_value(&ma_input.get_untracked());
                                    }
                                }
                            }
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    let v = input.value();
                                    save_last_runtime(&v);
                                    ma_input.set(v.clone());
                                    // Probe immediately so the browser shows mixed-content exception dialog.
                                    if v.starts_with("http://") {
                                        let url = format!("{}/status.json", v.trim_end_matches('/'));
                                        spawn_local(async move {
                                            let _ = crate::http::fetch_url_text(&url).await;
                                        });
                                    }
                                }
                            }
                        />
                    </div>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-gateway") }}</label>
                        <input
                            type="text"
                            list="gw-opts"
                            prop:value=move || gateway_input.get()
                            on:focus=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|t| t.dyn_into::<HtmlInputElement>().ok())
                                { input.set_value(""); }
                            }
                            on:blur=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|t| t.dyn_into::<HtmlInputElement>().ok())
                                {
                                    if input.value().is_empty() {
                                        input.set_value(&gateway_input.get_untracked());
                                    }
                                }
                            }
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    let v = input.value();
                                    SESSION_LOCAL_IPFS.with(|f| *f.borrow_mut() = is_local_gateway(&v));
                                    save_ipfs_gateway_pref(&v);
                                    gateway_input.set(v);
                                }
                            }
                        />
                    </div>
                </Show>

                // ── Always-present datalists (must be in DOM for list= attr) ──
                <datalist id="ma-opts">
                    {ma_options.into_iter().map(|v| view! { <option value=v /> }).collect::<Vec<_>>()}
                </datalist>
                <datalist id="gw-opts">
                    <option value="http://127.0.0.1:8080/" />
                    <option value="https://dweb.link/" />
                    <option value="https://ipfs.io/" />
                </datalist>

                // ── DID field ─────────────────────────────────────────────
                <Show when=move || mode.get() != Mode::Config && (mode.get() != Mode::New || !did_input.get().trim().is_empty())>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-did") }}</label>
                        <input
                            type="text"
                            prop:value=move || did_input.get()
                            prop:readOnly=move || mode.get() == Mode::New
                            placeholder="did:ma:..."
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    did_input.set(input.value());
                                }
                            }
                        />
                    </div>
                </Show>

                // ── Nick: New mode only ──────────────────────────────────
                <Show when=move || mode.get() == Mode::New>
                    <p class="landing-help">{move || { let _ = lang.get(); t("new-identity-nick-help") }}</p>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-nick") }}</label>
                        <input
                            type="text"
                            prop:value=move || nick.get()
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    nick.set(input.value());
                                }
                            }
                        />
                    </div>
                </Show>

                // ── Import: file picker until file is loaded ──────────────
                <Show when=move || mode.get() == Mode::Import && parsed.get().is_none()>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-or-file") }}</label>
                        <input
                            type="file"
                            accept=".json,.zion.json"
                            style="color:var(--colour-text);font-family:var(--font-family)"
                            on:change=on_file_change
                        />
                    </div>                    <Show when=move || !scanning.get()>
                        <div class="btn-row">
                            <button class="btn" on:click=start_scan>
                                {move || { let _ = lang.get(); t("btn-scan-qr") }}
                            </button>
                        </div>
                    </Show>
                    <Show when=move || scanning.get()>
                        <div class="qr-panel">
                            <div class=move || format!("qr-video-frame {}", scan_feedback.get())>
                                <video
                                    node_ref=video_ref
                                    class="qr-video"
                                    autoplay=""
                                    muted=""
                                    playsinline=""
                                ></video>
                                <span class="qr-scan-marker" aria-hidden="true"></span>
                            </div>
                            <p class=move || format!("qr-scan-status {}", scan_feedback.get())>
                                {move || {
                                    let _ = lang.get();
                                    match scan_feedback.get() {
                                        "decoded" => t("status-importing-profile"),
                                        _ => t("qr-scan-hint"),
                                    }
                                }}
                                <span class="qr-scan-stats">
                                    {move || format!(
                                        "{}×{} · {}",
                                        video_ref.get().map_or(0, |video| video.video_width()),
                                        video_ref.get().map_or(0, |video| video.video_height()),
                                        scan_frames.get(),
                                    )}
                                </span>
                            </p>
                            <div class="btn-row">
                                <button class="btn" on:click=move |_| scanning.set(false)>
                                    {move || { let _ = lang.get(); t("btn-cancel") }}
                                </button>
                            </div>
                        </div>
                    </Show>                </Show>

                // ── Password field: all modes except Export, and not Import-before-file
                <Show when=move || {
                    let m = mode.get();
                    m != Mode::Export && m != Mode::Config && !(m == Mode::Import && parsed.get().is_none())
                }>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-passphrase") }}</label>
                        <input
                            type="password"
                            placeholder=move || { let _ = lang.get(); t("passphrase-placeholder") }
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    password.set(input.value());
                                }
                            }
                        />
                    </div>
                </Show>

                // ── Confirm passphrase: Ny mode only ──────────────────────
                <Show when=move || mode.get() == Mode::New>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-confirm-passphrase") }}</label>
                        <input
                            type="password"
                            placeholder=move || { let _ = lang.get(); t("passphrase-placeholder") }
                            on:input=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    confirm_password.set(input.value());
                                }
                            }
                        />
                    </div>
                </Show>

                // ── Action button ─────────────────────────────────────────
                <div
                    class="btn-row"
                    style=move || if mode.get() == Mode::Config { "display:none" } else { "" }
                >
                    <button class="btn" on:click=do_action>
                        {move || {
                            let _ = lang.get();
                            if mode.get() == Mode::Export { t("btn-export") } else { t("btn-login") }
                        }}
                    </button>
                    <Show when=move || mode.get() == Mode::Export>
                        <button class="btn" on:click=do_show_qr>
                            {move || { let _ = lang.get(); t("btn-show-qr") }}
                        </button>
                    </Show>
                </div>

                // ── Export: QR display ─────────────────────────────────
                <Show when=move || mode.get() == Mode::Export && qr_svg.get().is_some()>
                    <div class="qr-export-overlay" role="dialog" aria-modal="true">
                        <div class="qr-export-content">
                            <div class="qr-code" inner_html=move || qr_svg.get().unwrap_or_default()></div>
                            <p class="qr-export-did">{move || did_input.get()}</p>
                            <div class="btn-row">
                                <button class="btn" on:click=move |_| qr_svg.set(None)>
                                    {move || { let _ = lang.get(); t("btn-close") }}
                                </button>
                            </div>
                        </div>
                    </div>
                </Show>

                // ── Status / Error ────────────────────────────────────────
                <Show when=move || !error.get().is_empty()>
                    <p class="landing-error">{move || error.get()}</p>
                </Show>
                <Show when=move || !status.get().is_empty()>
                    <p class="landing-status">{move || status.get()}</p>
                </Show>
            </div>
        </div>
    }
}

#[cfg(test)]
mod tests {
    use super::validate_new_passphrase;

    #[test]
    fn short_passphrase_is_rejected() {
        assert_eq!(
            validate_new_passphrase("shortpass", "shortpass"),
            Err("error-passphrase-too-short")
        );
    }

    #[test]
    fn matching_long_passphrase_is_accepted() {
        assert_eq!(
            validate_new_passphrase("this-is-a-strong-passphrase", "this-is-a-strong-passphrase"),
            Ok(())
        );
    }

    #[test]
    fn mismatched_passphrase_is_rejected() {
        assert_eq!(
            validate_new_passphrase("this-is-a-strong-passphrase", "different-passphrase"),
            Err("error-passphrases-no-match")
        );
    }
}

// ── Download helper ────────────────────────────────────────────────────────

fn trigger_download(filename: &str, content: &str) {
    use web_sys::window;
    let window = match window() {
        Some(w) => w,
        None => return,
    };
    let document = match window.document() {
        Some(d) => d,
        None => return,
    };
    let bag = web_sys::BlobPropertyBag::new();
    bag.set_type("application/json");
    let Ok(blob) = web_sys::Blob::new_with_str_sequence_and_options(
        &js_sys::Array::of1(&wasm_bindgen::JsValue::from_str(content)),
        &bag,
    ) else {
        return;
    };
    let Ok(url) = web_sys::Url::create_object_url_with_blob(&blob) else {
        return;
    };
    let Some(anchor) = document
        .create_element("a")
        .ok()
        .and_then(|element| element.dyn_into::<web_sys::HtmlAnchorElement>().ok())
    else {
        let _ = web_sys::Url::revoke_object_url(&url);
        return;
    };
    anchor.set_href(&url);
    anchor.set_download(filename);
    anchor.click();
    let _ = web_sys::Url::revoke_object_url(&url);
}
