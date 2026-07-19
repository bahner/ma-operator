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
        save_config, save_identity, storage::load_config, unlock_identity,
    },
    state::{AppState, SessionState},
};

const LAST_DID_KEY: &str = "zion_last_did";
const LAST_RUNTIME_KEY: &str = "zion_last_runtime";

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

    // Runtime field: DID or HTTP URL to connect to after login.
    // Seeded from `?ma=` URL param (already in state.startup_ma) or localStorage.
    let startup_ma = state.startup_ma.get_untracked();
    let url_ma_did: Option<String> = startup_ma.clone().filter(|v| v.starts_with("did:ma:"));
    let prev_runtime = load_last_runtime();
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
        password.set(String::new());
        confirm_password.set(String::new());
        error.set(String::new());
        status.set(String::new());
        parsed.set(None);
        if next == Mode::New {
            did_input.set(String::new());
        }
    };

    // ── Finalise login: derive profile key, save DID, set session ─────────
    // Free function so it can be called from multiple spawn_local blocks.
    fn finish_login(
        id: crate::identity::UnlockedIdentity,
        uname: String,
        _pass: String,
        state: AppState,
    ) {
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
                        // Not in IndexedDB — resolve DID document via
                        // IpfsGatewayResolver (has built-in gateway fallbacks).
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
                                match crate::parser::verbs::doc_profile_cid(&doc) {
                                    Some(profile_cid) => {
                                        match crate::http::fetch_cid_bytes(&profile_cid).await {
                                            Ok(cbor) => {
                                                // Decode DAG-CBOR → nested profile.
                                                let parsed_opt = serde_ipld_dagcbor::from_slice::<
                                                    serde_json::Value,
                                                >(
                                                    &cbor
                                                )
                                                .ok()
                                                .and_then(|profile_val| {
                                                    let username = profile_val
                                                        .get("username")?
                                                        .as_str()?
                                                        .to_string();
                                                    let id_json = match profile_val
                                                        .get("identity")?
                                                    {
                                                        serde_json::Value::String(s) => s.clone(),
                                                        other => {
                                                            serde_json::to_string(other).ok()?
                                                        }
                                                    };
                                                    let cfg_json = {
                                                        let mut tmp = EgoConfig::new();
                                                        tmp.merge_from_nested_profile(&profile_val)
                                                            .ok()?;
                                                        tmp.to_json().ok()
                                                    };
                                                    Some((username, id_json, cfg_json))
                                                });
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
                                        error.set(t("profile-no-cid-in-doc"));
                                    }
                                }
                            }
                            Err(e) => {
                                status.set(String::new());
                                error.set(tf("error-profile-fetch", &[("e", &e.to_string())]));
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
                // ── ma field + warning: above tabs, hidden in Export mode ──
                <Show when=move || mode.get() != Mode::Export>
                    // Privacy warning at very top when a remote DID is selected.
                    <Show when=move || ma_input.get().starts_with("did:ma:")>
                        <p class="landing-warning">{move || { let _ = lang.get(); t("warning-remote-runtime") }}</p>
                    </Show>
                    <div class="form-row">
                        <label>{move || { let _ = lang.get(); t("label-runtime") }}</label>
                        {
                            let has_url_did = url_ma_did.is_some();
                            if has_url_did {
                                let url_did = url_ma_did.clone().unwrap_or_default();
                                let prev = prev_runtime.clone();
                                view! {
                                    <select
                                        class="runtime-select"
                                        prop:value=move || ma_input.get()
                                        on:change=move |ev| {
                                            if let Some(sel) = ev.target()
                                                .and_then(|target| target.dyn_into::<web_sys::HtmlSelectElement>().ok())
                                            {
                                                ma_input.set(sel.value());
                                            }
                                        }
                                    >
                                        <option value={prev.clone()}>{prev.clone()}</option>
                                        <option value={url_did.clone()}>{url_did.clone()}</option>
                                    </select>
                                }.into_any()
                            } else {
                                view! {
                                    <input
                                        type="text"
                                        prop:value=move || ma_input.get()
                                        placeholder=move || { let _ = lang.get(); t("label-runtime-placeholder") }
                                        on:input=move |ev| {
                                            if let Some(input) = ev.target()
                                                .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                                            {
                                                ma_input.set(input.value());
                                            }
                                        }
                                    />
                                }.into_any()
                            }
                        }
                    </div>
                </Show>

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
                            if let Some(input) = ev.target()
                                .and_then(|target| target.dyn_into::<HtmlInputElement>().ok())
                            {
                                did_input.set(input.value());
                            }
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
                            placeholder="••••••••"
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
