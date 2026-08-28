/// Landing page — single panel with mode-selector buttons.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::{FileReader, HtmlInputElement, KeyboardEvent, MouseEvent};

use crate::{
    config::{restore_config, EgoConfig},
    i18n::{t, tf},
    identity::{
        create_identity_did_named, export_for_download, import_from_bytes, load_identity,
        save_config, save_identity, storage::load_config, unlock_identity_migrating,
    },
    profile_crypto,
    state::{AppState, SessionState, SESSION_PROFILE_KEY},
    transport::connection::{
        load_gateway_preferences, save_gateway_preferences, GatewayPreferences, LOCAL_GATEWAY_URL,
        PUBLIC_GATEWAY_URLS,
    },
};

const LAST_DID_KEY: &str = "zion_last_did";

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

async fn verify_existing_identity(did: &str) -> Result<(), String> {
    use ma_core::DidDocumentResolver;

    let resolver = crate::transport::connection::session_resolver()?;
    let document = resolver
        .resolve(did)
        .await
        .map_err(|error| error.to_string())?;
    crate::parser::verbs::ma::published_self_matches(&document, did)
}

// ── Profile sources: IPFS (authoritative) + local cache (fallback) ────────

/// A profile obtained from IPFS (authoritative) or the local cache (fallback).
struct FetchedProfile {
    id: crate::identity::UnlockedIdentity,
    /// The encrypted identity export JSON to cache locally.
    id_json: String,
    /// Re-encrypted export with a canonical timestamp, if migration was needed.
    migrated: Option<String>,
    /// Merged profile config.
    cfg: EgoConfig,
    /// `ma.lang` from the resolved DID document, if present.
    lang: Option<String>,
}

enum ProfileFetchError {
    /// IPFS could not supply the profile (resolve/fetch failure or no `ma.profile`).
    Unavailable(String),
    /// The passphrase or profile was rejected — never fall back to the cache.
    Rejected(String),
}

/// Resolve the DID document, fetch the encrypted profile blob and decrypt it
/// with the passphrase. This is the authoritative source; the local cache is
/// only overwritten from its result.
async fn fetch_profile_from_ipfs(
    full_did: &str,
    pass: &str,
) -> Result<FetchedProfile, ProfileFetchError> {
    use ma_core::DidDocumentResolver;

    let resolver =
        crate::transport::connection::session_resolver().map_err(ProfileFetchError::Rejected)?;

    let doc = resolver
        .resolve(full_did)
        .await
        .map_err(|error| ProfileFetchError::Unavailable(error.to_string()))?;

    crate::parser::verbs::ma::published_self_matches(&doc, full_did)
        .map_err(ProfileFetchError::Rejected)?;

    let lang = match &doc.ma {
        Some(ma_core::Ipld::Map(map)) => match map.get("lang") {
            Some(ma_core::Ipld::String(lang)) => Some(lang.clone()),
            _ => None,
        },
        _ => None,
    };

    let profile_cid = crate::parser::verbs::doc_profile_cid(&doc)
        .ok_or_else(|| ProfileFetchError::Unavailable(t("profile-no-cid-in-doc")))?;

    let cbor = crate::http::fetch_cid_bytes(&profile_cid)
        .await
        .map_err(ProfileFetchError::Unavailable)?;

    let profile_key = profile_crypto::derive_key(pass);
    let plain = profile_crypto::decrypt_with_key(&cbor, &profile_key).map_err(|error| {
        ProfileFetchError::Rejected(tf("error-wrong-passphrase", &[("e", &error)]))
    })?;

    let profile_val: serde_json::Value =
        serde_ipld_dagcbor::from_slice(&plain).map_err(|error| {
            ProfileFetchError::Rejected(tf("error-profile-fetch", &[("e", &error.to_string())]))
        })?;

    let id_json = match profile_val.get("identity") {
        Some(serde_json::Value::String(value)) => value.clone(),
        Some(other) => serde_json::to_string(other).map_err(|error| {
            ProfileFetchError::Rejected(tf("error-profile-fetch", &[("e", &error.to_string())]))
        })?,
        None => {
            return Err(ProfileFetchError::Rejected(tf(
                "error-profile-fetch",
                &[("e", "profile missing 'identity' field")],
            )))
        }
    };

    let mut cfg = EgoConfig::new();
    cfg.merge_from_nested_profile(&profile_val)
        .map_err(ProfileFetchError::Rejected)?;

    let (id, migrated) = unlock_identity_migrating(&id_json, pass).map_err(|error| {
        ProfileFetchError::Rejected(tf("error-wrong-passphrase", &[("e", &error)]))
    })?;

    Ok(FetchedProfile {
        id,
        id_json,
        migrated,
        cfg,
        lang,
    })
}

/// Fallback when IPFS cannot supply the profile: unlock the locally cached
/// identity and restore the cached config. Coherent with the online copy
/// because passphrase changes republish atomically (see `.keymaker`).
async fn restore_profile_from_local(uname: &str, pass: &str) -> Result<FetchedProfile, String> {
    let stored = load_identity(uname)
        .await?
        .ok_or_else(|| "no local identity cache".to_string())?;
    let (id, migrated) = unlock_identity_migrating(&stored.export_json, pass)?;
    if let Some(migrated) = migrated.as_deref() {
        save_identity(uname, migrated).await?;
    }
    let cfg = restore_config(uname).await?;
    Ok(FetchedProfile {
        id,
        id_json: stored.export_json,
        migrated,
        cfg,
        lang: None,
    })
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
    let config = use_context::<RwSignal<EgoConfig>>().expect("EgoConfig missing");
    let lang = state.lang;

    let mode = RwSignal::new(Mode::Login);
    let did_input = RwSignal::new(load_last_did().unwrap_or_default());
    let nick = RwSignal::new(String::new());
    let password = RwSignal::new(String::new());
    let confirm_password = RwSignal::new(String::new());
    let status = RwSignal::new(String::new());
    let error = RwSignal::new(String::new());
    let initial_gateway_prefs = load_gateway_preferences();
    save_gateway_preferences(&initial_gateway_prefs);
    let gateway_dweb_link = RwSignal::new(initial_gateway_prefs.dweb_link);
    let gateway_four_everland = RwSignal::new(initial_gateway_prefs.four_everland);
    let gateway_localhost = RwSignal::new(initial_gateway_prefs.localhost);
    let gateway_custom_enabled = RwSignal::new(initial_gateway_prefs.custom_enabled);
    let gateway_custom_url = RwSignal::new(initial_gateway_prefs.custom_url.clone());
    // For Import mode: pre-parsed (username, identity_json, config_json).
    let parsed: RwSignal<Option<(String, String, Option<String>)>> = RwSignal::new(None);
    // Export mode: rendered QR SVG of the encrypted profile.
    let qr_svg: RwSignal<Option<String>> = RwSignal::new(None);
    // Import mode: camera scan in progress.
    let scanning = RwSignal::new(false);
    let scan_feedback = RwSignal::new("searching");
    let scan_frames = RwSignal::new(0_u32);
    let video_ref = NodeRef::<leptos::html::Video>::new();

    let invited_ma = state
        .startup_ma
        .get_untracked()
        .filter(|did| crate::parser::verbs::is_bare_ma_did(did));
    let ma_input = RwSignal::new(invited_ma.clone().unwrap_or_default());
    let ma_choices = RwSignal::new(crate::parser::verbs::ma::ma_choices(
        None,
        invited_ma.clone(),
    ));
    let ma_input_edited = RwSignal::new(false);

    Effect::new(move |_| {
        let prefs = GatewayPreferences {
            dweb_link: gateway_dweb_link.get(),
            four_everland: gateway_four_everland.get(),
            localhost: gateway_localhost.get(),
            custom_enabled: gateway_custom_enabled.get(),
            custom_url: gateway_custom_url.get(),
        };
        save_gateway_preferences(&prefs);
    });

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

    // Load identity-specific preferences before login.
    let state_lang = state.clone();
    let invited_ma_for_lookup = invited_ma.clone();
    Effect::new(move |_| {
        let did = did_input.get().trim().to_string();
        ma_input_edited.set(false);
        ma_choices.set(crate::parser::verbs::ma::ma_choices(
            None,
            invited_ma_for_lookup.clone(),
        ));
        if !crate::parser::verbs::is_bare_ma_did(&did) {
            ma_input.set(invited_ma_for_lookup.clone().unwrap_or_default());
            return;
        }
        let uname = username_from_did(&did);
        let state2 = state_lang.clone();
        let invited_ma = invited_ma_for_lookup.clone();
        spawn_local(async move {
            gloo_timers::future::TimeoutFuture::new(250).await;
            if did_input.get_untracked().trim() != did {
                return;
            }
            let mut selected_ma = invited_ma.clone();
            if let Ok(Some(cfg_json)) = crate::identity::storage::load_config(&uname).await {
                if let Ok(cfg) = crate::config::EgoConfig::from_json(&cfg_json) {
                    if let Some(lang_tag) = cfg.get(".my.i18n") {
                        if crate::i18n::init(lang_tag).await {
                            state2.lang.set(crate::i18n::lang());
                        }
                    }
                }
            }
            use ma_core::DidDocumentResolver;
            let Ok(resolver) = crate::transport::connection::session_resolver() else {
                return;
            };
            if let Ok(doc) = resolver.resolve(&did).await {
                if did_input.get_untracked().trim() != did {
                    return;
                }
                let published_ma = crate::parser::verbs::doc_trusted_ma(&doc);
                ma_choices.set(crate::parser::verbs::ma::ma_choices(
                    published_ma.clone(),
                    invited_ma,
                ));
                selected_ma =
                    crate::parser::verbs::ma::preferred_ma_prefill(published_ma, selected_ma);
                if !ma_input_edited.get_untracked() {
                    ma_input.set(selected_ma.unwrap_or_default());
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
        is_new: bool,
        state: AppState,
    ) {
        let profile_key = profile_crypto::derive_key(&pass);
        SESSION_PROFILE_KEY.with(|k| *k.borrow_mut() = Some(profile_key));
        save_last_did(&id.sender_did);
        state.session.set(Some(SessionState {
            username: uname,
            is_new,
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
            let ma_val = ma_input.get_untracked().trim().to_string();
            state.startup_ma.set(Some(ma_val));
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
                match crate::identity::validate_new_passphrase(&pass, &confirm) {
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
                                                    config.set(cfg);
                                                    finish_login(id, uname, pass, true, state2);
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
                                    if let Some(cfg_json) = cfg_opt.as_ref() {
                                        let _ = save_config(&uname, cfg_json).await;
                                    }
                                    if let Err(e) = verify_existing_identity(&id.sender_did).await {
                                        error.set(tf("error-profile-fetch", &[("e", &e)]));
                                        return;
                                    }
                                    let cfg = match cfg_opt {
                                        Some(json) => EgoConfig::from_json(&json)
                                            .unwrap_or_else(|_| EgoConfig::new()),
                                        None => EgoConfig::new(),
                                    };
                                    config.set(cfg);
                                    finish_login(id, uname, pass, false, state2);
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
            let full_did = format!("did:ma:{uname}");
            status.set(t("status-fetching-profile"));
            let state2 = state.clone();
            spawn_local(async move {
                match fetch_profile_from_ipfs(&full_did, &pass).await {
                    Ok(fetched) => {
                        // Apply language from DID document if present.
                        if let Some(lang) = fetched.lang {
                            if crate::i18n::init(&lang).await {
                                state2.lang.set(crate::i18n::lang());
                            }
                        }
                        // Overwrite the local cache with the authoritative copy.
                        let export = fetched.migrated.as_deref().unwrap_or(&fetched.id_json);
                        if let Err(e) = save_identity(&uname, export).await {
                            status.set(String::new());
                            error.set(e);
                            return;
                        }
                        match fetched.cfg.to_json() {
                            Ok(json) => {
                                if let Err(e) = save_config(&uname, &json).await {
                                    status.set(String::new());
                                    error.set(e);
                                    return;
                                }
                            }
                            Err(e) => {
                                status.set(String::new());
                                error.set(e);
                                return;
                            }
                        }
                        config.set(fetched.cfg);
                        status.set(String::new());
                        finish_login(fetched.id, uname, pass, false, state2);
                    }
                    Err(ProfileFetchError::Unavailable(cause)) => {
                        // IPFS could not supply the profile — restore the local cache.
                        match restore_profile_from_local(&uname, &pass).await {
                            Ok(fetched) => {
                                config.set(fetched.cfg);
                                status.set(String::new());
                                state2
                                    .push_system(tf("login-restored-from-cache", &[("e", &cause)]));
                                finish_login(fetched.id, uname, pass, false, state2);
                            }
                            Err(local_err) => {
                                status.set(String::new());
                                error.set(tf(
                                    "error-profile-fetch",
                                    &[(
                                        "e",
                                        &format!(
                                            "{cause} — and no usable local copy ({local_err})"
                                        ),
                                    )],
                                ));
                            }
                        }
                    }
                    Err(ProfileFetchError::Rejected(cause)) => {
                        status.set(String::new());
                        error.set(cause);
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
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-gateway") }}</label>
                        <div class="gateway-list">
                            <label class="gateway-option">
                                <input
                                    type="checkbox"
                                    prop:checked=move || gateway_dweb_link.get()
                                    on:change=move |ev| {
                                        if let Some(input) = ev.target()
                                            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                        {
                                            gateway_dweb_link.set(input.checked());
                                        }
                                    }
                                />
                                <span>{PUBLIC_GATEWAY_URLS[0]}</span>
                            </label>
                            <label class="gateway-option">
                                <input
                                    type="checkbox"
                                    prop:checked=move || gateway_four_everland.get()
                                    on:change=move |ev| {
                                        if let Some(input) = ev.target()
                                            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                        {
                                            gateway_four_everland.set(input.checked());
                                        }
                                    }
                                />
                                <span>{PUBLIC_GATEWAY_URLS[1]}</span>
                            </label>
                            <label class="gateway-option">
                                <input
                                    type="checkbox"
                                    prop:checked=move || gateway_localhost.get()
                                    on:change=move |ev| {
                                        if let Some(input) = ev.target()
                                            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                        {
                                            gateway_localhost.set(input.checked());
                                        }
                                    }
                                />
                                <span>{LOCAL_GATEWAY_URL}</span>
                            </label>
                            <div class="gateway-option gateway-custom">
                                <label>
                                    <input
                                        type="checkbox"
                                        prop:checked=move || gateway_custom_enabled.get()
                                        on:change=move |ev| {
                                            if let Some(input) = ev.target()
                                                .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                            {
                                                gateway_custom_enabled.set(input.checked());
                                            }
                                        }
                                    />
                                    <span>{move || { let _ = lang.get(); t("label-gateway") }}</span>
                                </label>
                                <input
                                    type="text"
                                    prop:value=move || gateway_custom_url.get()
                                    placeholder="http://localhost:8881/"
                                    on:input=move |ev| {
                                        if let Some(input) = ev.target()
                                            .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                        {
                                            gateway_custom_url.set(input.value());
                                        }
                                    }
                                />
                            </div>
                        </div>
                    </div>
                </Show>

                // ── Always-present datalist (must be in DOM for list= attr) ──
                <datalist id="ma-opts">
                    {move || ma_choices.get().into_iter().map(|v| view! { <option value=v /> }).collect_view()}
                </datalist>

                // ── DID field ─────────────────────────────────────────────
                <Show when=move || mode.get() != Mode::Config && (mode.get() != Mode::New || !did_input.get().trim().is_empty())>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); format!("{}:", t("label-did")) }}</label>
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
                    <div class="form-row">
                        <label>"ma:"</label>
                        <input
                            type="text"
                            list="ma-opts"
                            prop:value=move || ma_input.get()
                            placeholder="did:ma:..."
                            on:focus=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                {
                                    input.set_value("");
                                }
                            }
                            on:blur=move |ev| {
                                if let Some(input) = ev.target()
                                    .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
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
                                    ma_input_edited.set(true);
                                    ma_input.set(input.value());
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

#[cfg(test)]
mod tests {
    use crate::identity::validate_new_passphrase;

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
