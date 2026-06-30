/// Landing page — single panel with mode-selector buttons.
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::{FileReader, HtmlInputElement, KeyboardEvent, MouseEvent};

use crate::{
    i18n::{t, tf},
    identity::{
        create_identity_did_named, export_for_download, import_from_bytes, load_identity,
        save_config, save_identity, storage::load_config, unlock_identity,
    },
    state::{AppState, SessionState},
    transport::connection::LOCAL_GATEWAY_URL,
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

/// Derive the IndexedDB storage key from a DID.
fn username_from_did(did: &str) -> String {
    did.strip_prefix("did:ma:").unwrap_or(did).to_string()
}

#[derive(Clone, Copy, PartialEq)]
enum Mode {
    Login,
    New,
    Import,
    Export,
}

#[component]
pub fn Landing() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let lang = state.lang;

    let mode = RwSignal::new(Mode::Login);
    let did_input = RwSignal::new(load_last_did().unwrap_or_default());
    let password = RwSignal::new(String::new());
    let confirm_password = RwSignal::new(String::new());
    let status = RwSignal::new(String::new());
    let error = RwSignal::new(String::new());
    // For Import mode: pre-parsed (username, identity_json, config_json).
    let parsed: RwSignal<Option<(String, String, Option<String>)>> = RwSignal::new(None);

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

    // ── Mode selector ─────────────────────────────────────────────────────
    let set_mode = move |m: Mode| {
        mode.set(m);
        password.set(String::new());
        confirm_password.set(String::new());
        error.set(String::new());
        status.set(String::new());
        parsed.set(None);
        if m == Mode::New {
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
        let profile_key = crate::profile_crypto::derive_key(&pass);
        crate::state::SESSION_PROFILE_KEY.with(|k| *k.borrow_mut() = Some(profile_key));
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
            let current_mode = mode.get_untracked();
            let did = did_input.get_untracked().trim().to_string();
            let pass = password.get_untracked();
            let confirm = confirm_password.get_untracked();
            error.set(String::new());

            // ── Ny ────────────────────────────────────────────────────────
            if current_mode == Mode::New {
                if pass.is_empty() {
                    error.set(t("error-passphrase-required"));
                    return;
                }
                if pass != confirm {
                    error.set(t("error-passphrases-no-match"));
                    return;
                }
                status.set(t("status-generating"));
                let state2 = state.clone();
                spawn_local(async move {
                    match create_identity_did_named(&pass) {
                        Ok((new_did, export_json, id)) => {
                            let uname = username_from_did(&new_did);
                            match save_identity(&uname, &export_json).await {
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
                            error.set(e);
                        }
                    }
                });
                return;
            }

            // ── Import ────────────────────────────────────────────────────
            if current_mode == Mode::Import {
                let p = match parsed.get_untracked() {
                    Some(p) => p,
                    None => {
                        error.set(t("error-profile-source-required"));
                        return;
                    }
                };
                if pass.is_empty() {
                    error.set(t("error-passphrase-required"));
                    return;
                }
                let (uname, id_json, cfg_opt) = p;
                let state2 = state.clone();
                spawn_local(async move {
                    match unlock_identity(&id_json, &pass) {
                        Ok(id) => match save_identity(&uname, &id_json).await {
                            Ok(()) => {
                                if let Some(cfg_json) = cfg_opt {
                                    let _ = save_config(&uname, &cfg_json).await;
                                }
                                finish_login(id, uname, pass, state2);
                            }
                            Err(e) => error.set(e),
                        },
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
                    Ok(Some(stored)) => match unlock_identity(&stored.export_json, &pass) {
                        Ok(id) => {
                            status.set(String::new());
                            finish_login(id, uname, pass, state2);
                        }
                        Err(e) => {
                            status.set(String::new());
                            error.set(tf("error-wrong-passphrase", &[("e", &e)]));
                        }
                    },
                    Ok(None) => {
                        // Not in IndexedDB — try resolving from IPFS.
                        status.set(t("status-fetching-profile"));
                        let ipns = uname.clone();
                        let url = format!(
                            "{}ipns/{}?format=dag-json",
                            LOCAL_GATEWAY_URL.trim_end_matches('/'),
                            ipns
                        );
                        match crate::http::fetch_url_text(&url).await {
                            Ok(doc_json) => {
                                let result = serde_json::from_str::<ma_core::Document>(&doc_json)
                                    .ok()
                                    .and_then(|doc| crate::parser::verbs::doc_profile_cid(&doc));
                                match result {
                                    Some(profile_cid) => {
                                        match crate::http::fetch_cid_bytes(&profile_cid).await {
                                            Ok(cbor) => {
                                                let parsed_opt = serde_ipld_dagcbor::from_slice::<
                                                    serde_json::Value,
                                                >(
                                                    &cbor
                                                )
                                                .ok()
                                                .and_then(|v| serde_json::to_string(&v).ok())
                                                .and_then(|s| import_from_bytes(s.as_bytes()).ok());
                                                match parsed_opt {
                                                    Some((pname, id_json, cfg_opt)) => {
                                                        match unlock_identity(&id_json, &pass) {
                                                            Ok(id) => {
                                                                let _ =
                                                                    save_identity(&pname, &id_json)
                                                                        .await;
                                                                if let Some(cfg) = cfg_opt {
                                                                    let _ =
                                                                        save_config(&pname, &cfg)
                                                                            .await;
                                                                }
                                                                status.set(String::new());
                                                                finish_login(
                                                                    id, pname, pass, state2,
                                                                );
                                                            }
                                                            Err(e) => {
                                                                status.set(String::new());
                                                                error.set(tf(
                                                                    "error-wrong-passphrase",
                                                                    &[("e", &e)],
                                                                ));
                                                            }
                                                        }
                                                    }
                                                    None => {
                                                        status.set(String::new());
                                                        error.set(t("profile-no-cid-in-doc"));
                                                    }
                                                }
                                            }
                                            Err(e) => {
                                                status.set(String::new());
                                                error.set(tf("error-profile-fetch", &[("e", &e)]));
                                            }
                                        }
                                    }
                                    None => {
                                        status.set(String::new());
                                        error.set(tf(
                                            "error-identity-not-found",
                                            &[("name", &uname)],
                                        ));
                                    }
                                }
                            }
                            Err(_) => {
                                // IPFS not reachable — guide user to Import.
                                status.set(String::new());
                                error.set(tf("error-identity-not-found", &[("name", &uname)]));
                            }
                        }
                    }
                    Err(e) => {
                        status.set(String::new());
                        error.set(e);
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
        let target = ev.target().unwrap();
        let input = target.unchecked_into::<HtmlInputElement>();
        if let Some(files) = input.files() {
            if let Some(file) = files.get(0) {
                let reader = FileReader::new().unwrap();
                let reader2 = reader.clone();
                let onload =
                    wasm_bindgen::closure::Closure::wrap(Box::new(move |_: web_sys::Event| {
                        let result = reader2.result().unwrap();
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

    // Enter key triggers the action.
    let do_login_key = do_login.clone();
    let on_keydown = move |ev: KeyboardEvent| {
        if ev.key() == "Enter" && mode.get_untracked() != Mode::Export {
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
                // ── Mode selector (top) ───────────────────────────────────
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
                </div>

                // ── DID field (always shown) ──────────────────────────────
                <div class="form-row">
                    <label>{move || { let _ = lang.get(); t("label-did") }}</label>
                    <input
                        type="text"
                        prop:value=move || did_input.get()
                        prop:readOnly=move || mode.get() == Mode::New
                        placeholder="did:ma:..."
                        on:input=move |ev| {
                            let target = ev.target().unwrap();
                            let input = target.unchecked_into::<HtmlInputElement>();
                            did_input.set(input.value());
                        }
                    />
                </div>

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
                    </div>
                </Show>

                // ── Password field: all modes except Export, and not Import-before-file
                <Show when=move || {
                    let m = mode.get();
                    m != Mode::Export && !(m == Mode::Import && parsed.get().is_none())
                }>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-passphrase") }}</label>
                        <input
                            type="password"
                            placeholder="••••••••"
                            on:input=move |ev| {
                                let target = ev.target().unwrap();
                                let input = target.unchecked_into::<HtmlInputElement>();
                                password.set(input.value());
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
                            placeholder="••••••••"
                            on:input=move |ev| {
                                let target = ev.target().unwrap();
                                let input = target.unchecked_into::<HtmlInputElement>();
                                confirm_password.set(input.value());
                            }
                        />
                    </div>
                </Show>

                // ── Action button ─────────────────────────────────────────
                <div class="btn-row">
                    <button class="btn" on:click=do_action>
                        {move || {
                            let _ = lang.get();
                            if mode.get() == Mode::Export { t("btn-export") } else { t("btn-login") }
                        }}
                    </button>
                </div>

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
    let blob = web_sys::Blob::new_with_str_sequence_and_options(
        &js_sys::Array::of1(&wasm_bindgen::JsValue::from_str(content)),
        &bag,
    )
    .unwrap();
    let url = web_sys::Url::create_object_url_with_blob(&blob).unwrap();
    let anchor: web_sys::HtmlAnchorElement = document.create_element("a").unwrap().unchecked_into();
    anchor.set_href(&url);
    anchor.set_download(filename);
    anchor.click();
    web_sys::Url::revoke_object_url(&url).unwrap();
}
