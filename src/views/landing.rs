/// Landing page: create / login / import / export identities.
use leptos::prelude::*;
use std::rc::Rc;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::{FileReader, HtmlInputElement, KeyboardEvent, MouseEvent};

use crate::{
    config::restore_config,
    i18n::{t, tf},
    identity::{
        create_identity, export_for_download, import_from_bytes, list_usernames, load_identity,
        save_identity, unlock_identity,
    },
    state::{AppState, SessionState},
};

#[derive(Clone, PartialEq)]
enum Tab {
    Login,
    Create,
    Import,
}

#[component]
pub fn Landing() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let tab = RwSignal::new(Tab::Login);
    let status = RwSignal::new(String::new());
    let error = RwSignal::new(String::new());

    // Pre-clone so each Show closure can capture its own copy
    let state_login = state.clone();
    let state_create = state.clone();
    let state_import = state.clone();
    let lang = state.lang;

    view! {
        <div class="landing">
            <h1>"DON'T PANIC"</h1>
            <div class="landing-box">
                <div class="landing-tabs">
                    <button
                        class=move || if tab.get() == Tab::Login { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| tab.set(Tab::Login)
                    >{move || { let _ = lang.get(); t("tab-login") }}</button>
                    <button
                        class=move || if tab.get() == Tab::Create { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| tab.set(Tab::Create)
                    >{move || { let _ = lang.get(); t("tab-new-identity") }}</button>
                    <button
                        class=move || if tab.get() == Tab::Import { "landing-tab active" } else { "landing-tab" }
                        on:click=move |_| tab.set(Tab::Import)
                    >{move || { let _ = lang.get(); t("tab-import") }}</button>
                </div>

                <Show when=move || tab.get() == Tab::Login>
                    <LoginPanel state=state_login.clone() status=status error=error/>
                </Show>
                <Show when=move || tab.get() == Tab::Create>
                    <CreatePanel state=state_create.clone() status=status error=error/>
                </Show>
                <Show when=move || tab.get() == Tab::Import>
                    <ImportPanel state=state_import.clone() status=status error=error/>
                </Show>

                <Show when=move || !error.get().is_empty()>
                    <p class="landing-error">"error"</p>
                </Show>
                <Show when=move || !status.get().is_empty()>
                    <p class="landing-status">{move || status.get()}</p>
                </Show>
            </div>
        </div>
    }
}

// ── Login panel ────────────────────────────────────────────────────────────

#[component]
fn LoginPanel(state: AppState, status: RwSignal<String>, error: RwSignal<String>) -> impl IntoView {
    let usernames: RwSignal<Vec<String>> = RwSignal::new(vec![]);
    let selected = RwSignal::new(String::new());
    let password = RwSignal::new(String::new());

    // Load usernames on mount
    {
        let usernames = usernames.clone();
        spawn_local(async move {
            match list_usernames().await {
                Ok(names) => {
                    if let Some(first) = names.first() {
                        selected.set(first.clone());
                    }
                    usernames.set(names);
                }
                Err(e) => error.set(e),
            }
        });
    }

    let do_login: Rc<dyn Fn()> = Rc::new({
        let state = state.clone();
        move || {
            let uname = selected.get_untracked();
            let pass = password.get_untracked();
            error.set(String::new());
            status.set(t("status-unlocking"));
            let state = state.clone();
            spawn_local(async move {
                match load_identity(&uname).await {
                    Ok(Some(stored)) => {
                        match unlock_identity(&stored.export_json, &pass) {
                            Ok(id) => {
                                // Restore config
                                let _ = restore_config(&uname).await;
                                status.set(String::new());
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
                            Err(e) => {
                                status.set(String::new());
                                error.set(tf("error-wrong-passphrase", &[("e", &e)]));
                            }
                        }
                    }
                    Ok(None) => {
                        status.set(String::new());
                        error.set(tf("error-identity-not-found", &[("name", &uname)]));
                    }
                    Err(e) => {
                        status.set(String::new());
                        error.set(e);
                    }
                }
            });
        }
    });

    let on_login = {
        let do_login = Rc::clone(&do_login);
        move |_: MouseEvent| do_login()
    };
    let on_login_key = {
        let do_login = Rc::clone(&do_login);
        move |ev: KeyboardEvent| {
            if ev.key() == "Enter" {
                do_login();
            }
        }
    };

    // Export selected identity
    let lang = state.lang;
    let on_export = move |_| {
        let uname = selected.get_untracked();
        error.set(String::new());
        spawn_local(async move {
            match load_identity(&uname).await {
                Ok(Some(stored)) => {
                    let content = export_for_download(&stored.export_json);
                    trigger_download(&format!("{uname}.zion.json"), &content);
                }
                Ok(None) => error.set(tf("error-identity-not-found", &[("name", &uname)])),
                Err(e) => error.set(e),
            }
        });
    };

    view! {
        <ul class="identity-list">
            <For
                each=move || usernames.get()
                key=|u| u.clone()
                children=move |u| {
                    let u2 = u.clone();
                    let u3 = u.clone();
                    view! {
                        <li
                            class=move || if selected.get() == u2 { "selected" } else { "" }
                            on:click={
                                move |_| {
                                    let uname = u3.clone();
                                    selected.set(uname.clone());
                                    spawn_local(async move {
                                        if let Ok(cfg) = restore_config(&uname).await {
                                            let lang_code = cfg.get(".my.i18n")
                                                .or_else(|| cfg.get(".my.lang"))
                                                .map(|s| s.to_string());
                                            if let Some(lang_code) = lang_code {
                                                crate::i18n::init(&lang_code).await;
                                                lang.set(crate::i18n::lang());
                                            }
                                        }
                                    });
                                }
                            }
                        >{u.clone()}</li>
                    }
                }
            />
        </ul>
        <div class="form-row">
            <label>{move || { let _ = lang.get(); t("label-passphrase") }}</label>
            <input
                type="password"
                placeholder="\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}"
                on:input=move |ev| {
                    let target = ev.target().unwrap();
                    let input = target.unchecked_into::<HtmlInputElement>();
                    password.set(input.value());
                }
                on:keydown=on_login_key
            />
        </div>
        <div class="btn-row">
            <button class="btn" on:click=on_login>{move || { let _ = lang.get(); t("btn-login") }}</button>
            <button class="btn btn-sm" on:click=on_export>{move || { let _ = lang.get(); t("btn-export") }}</button>
        </div>
    }
}

// ── Create panel ───────────────────────────────────────────────────────────

#[component]
fn CreatePanel(
    state: AppState,
    status: RwSignal<String>,
    error: RwSignal<String>,
) -> impl IntoView {
    let username = RwSignal::new(String::new());
    let password = RwSignal::new(String::new());
    let password2 = RwSignal::new(String::new());
    let lang = state.lang;

    let on_create = move |_| {
        let uname = username.get_untracked();
        let pass = password.get_untracked();
        let pass2 = password2.get_untracked();
        error.set(String::new());

        if uname.is_empty() {
            error.set(t("error-username-required"));
            return;
        }
        if pass.is_empty() {
            error.set(t("error-passphrase-required"));
            return;
        }
        if pass != pass2 {
            error.set(t("error-passphrases-no-match"));
            return;
        }

        status.set(t("status-generating"));
        let state = state.clone();
        spawn_local(async move {
            match create_identity(&uname, &pass) {
                Ok((export_json, id)) => match save_identity(&uname, &export_json).await {
                    Ok(()) => {
                        status.set(String::new());
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
                    Err(e) => {
                        status.set(String::new());
                        error.set(e);
                    }
                },
                Err(e) => {
                    status.set(String::new());
                    error.set(e);
                }
            }
        });
    };

    view! {
        <div class="form-row">
            <label>{move || { let _ = lang.get(); t("label-username") }}</label>
            <input
                type="text"
                placeholder="alice"
                on:input=move |ev| {
                    let target = ev.target().unwrap();
                    let input = target.unchecked_into::<HtmlInputElement>();
                    username.set(input.value());
                }
            />
        </div>
        <div class="form-row">
            <label>{move || { let _ = lang.get(); t("label-passphrase") }}</label>
            <input
                type="password"
                placeholder="\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}"
                on:input=move |ev| {
                    let target = ev.target().unwrap();
                    let input = target.unchecked_into::<HtmlInputElement>();
                    password.set(input.value());
                }
            />
        </div>
        <div class="form-row">
            <label>{move || { let _ = lang.get(); t("label-confirm-passphrase") }}</label>
            <input
                type="password"
                placeholder="••••••••"
                on:input=move |ev| {
                    let target = ev.target().unwrap();
                    let input = target.unchecked_into::<HtmlInputElement>();
                    password2.set(input.value());
                }
            />
        </div>
        <p class="dimmed" style="font-size:0.8rem">
            {move || { let _ = lang.get(); t("passphrase-warning") }}
        </p>
        <div class="btn-row">
            <button class="btn" on:click=on_create>{move || { let _ = lang.get(); t("btn-generate") }}</button>
        </div>
    }
}

// ── Import panel ───────────────────────────────────────────────────────────

#[component]
fn ImportPanel(
    state: AppState,
    status: RwSignal<String>,
    error: RwSignal<String>,
) -> impl IntoView {
    let lang = state.lang;

    let on_file_change = move |ev: web_sys::Event| {
        let target = ev.target().unwrap();
        let input = target.unchecked_into::<HtmlInputElement>();
        if let Some(files) = input.files() {
            if let Some(file) = files.get(0) {
                status.set(t("status-reading-file"));
                error.set(String::new());
                let reader = FileReader::new().unwrap();
                let reader2 = reader.clone();
                let onload =
                    wasm_bindgen::closure::Closure::wrap(Box::new(move |_: web_sys::Event| {
                        let result = reader2.result().unwrap();
                        if let Some(text) = result.as_string() {
                            match import_from_bytes(text.as_bytes()) {
                                Ok((username, export_json)) => {
                                    let un = username.clone();
                                    let ej = export_json.clone();
                                    status.set(String::new());
                                    spawn_local(async move {
                                        match save_identity(&un, &ej).await {
                                            Ok(()) => {
                                                status.set(tf("status-imported", &[("name", &un)]))
                                            }
                                            Err(e) => error.set(e),
                                        }
                                    });
                                }
                                Err(e) => {
                                    status.set(String::new());
                                    error.set(e);
                                }
                            }
                        }
                    })
                        as Box<dyn FnMut(_)>);
                reader.set_onload(Some(onload.as_ref().unchecked_ref()));
                onload.forget();
                reader.read_as_text(&file).unwrap();
            }
        }
    };

    view! {
        <p class="dimmed" style="font-size:0.85rem;margin-bottom:1rem">
            {move || { let _ = lang.get(); t("import-help") }}
        </p>
        <input
            type="file"
            accept=".json,.zion.json"
            style="color:var(--colour-text);font-family:var(--font-family)"
            on:change=on_file_change
        />
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
