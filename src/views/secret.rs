use leptos::ev::SubmitEvent;
use leptos::prelude::*;

use crate::{
    config::EgoConfig,
    i18n::{t, tf},
    identity::{change_passphrase, load_identity, save_identity, validate_new_passphrase},
    profile_crypto,
    state::{AppState, SESSION_PROFILE_KEY},
};

#[component]
pub fn SecretModal(state: AppState) -> impl IntoView {
    let config = use_context::<RwSignal<EgoConfig>>().expect("EgoConfig missing");
    let current = RwSignal::new(String::new());
    let new_passphrase = RwSignal::new(String::new());
    let confirmation = RwSignal::new(String::new());
    let error = RwSignal::new(String::new());
    let busy = RwSignal::new(false);
    let show = state.secret_dialog;
    let lang = state.lang;

    let clear = move || {
        current.set(String::new());
        new_passphrase.set(String::new());
        confirmation.set(String::new());
        error.set(String::new());
        busy.set(false);
    };

    let on_cancel = move |_| {
        clear();
        show.set(false);
    };

    let on_submit = {
        let state = state.clone();
        move |event: SubmitEvent| {
            event.prevent_default();
            if busy.get_untracked() {
                return;
            }

            let old_passphrase = current.get_untracked();
            let next_passphrase = new_passphrase.get_untracked();
            let confirm = confirmation.get_untracked();
            if old_passphrase.is_empty() {
                error.set(t("error-passphrase-required"));
                return;
            }
            if let Err(key) = validate_new_passphrase(&next_passphrase, &confirm) {
                error.set(t(key));
                return;
            }
            let Some(session) = state.session.get_untracked() else {
                error.set(t("profile-delete-no-session"));
                return;
            };

            busy.set(true);
            error.set(String::new());
            let state = state.clone();
            leptos::task::spawn_local(async move {
                let result = match load_identity(&session.username).await {
                    Ok(Some(stored)) => {
                        match change_passphrase(
                            &stored.export_json,
                            &old_passphrase,
                            &next_passphrase,
                        ) {
                            Ok(changed) => save_identity(&session.username, &changed).await,
                            Err(cause) => Err(tf("error-wrong-passphrase", &[("e", &cause)])),
                        }
                    }
                    Ok(None) => Err(tf(
                        "error-identity-not-found",
                        &[("name", &session.username)],
                    )),
                    Err(cause) => Err(cause),
                };

                clear();
                match result {
                    Ok(()) => {
                        SESSION_PROFILE_KEY.with(|key| {
                            *key.borrow_mut() = Some(profile_crypto::derive_key(&next_passphrase));
                        });
                        show.set(false);
                        state.push_command_ok(".keymaker");
                        if let Some(publisher) =
                            crate::parser::verbs::ma::active_ma_did(&config.get_untracked())
                        {
                            let state = state.clone();
                            leptos::task::spawn_local(async move {
                                crate::parser::verbs::ma::queue_profile_publish(
                                    publisher, config, &state, None, false, false,
                                )
                                .await;
                            });
                        }
                    }
                    Err(cause) => error.set(cause),
                }
            });
        }
    };

    view! {
        <div
            class="secret-overlay"
            style:display=move || if show.get() { "grid" } else { "none" }
        >
            <form class="secret-dialog" on:submit=on_submit>
                    <header>.keymaker</header>
                    <p class="secret-warning">
                        {move || { let _ = lang.get(); t("passphrase-warning") }}
                    </p>
                    <label>
                        {move || format!("1. {}", t("label-passphrase"))}
                        <input
                            type="password"
                            autocomplete="current-password"
                            prop:value=move || current.get()
                            on:input=move |event| current.set(event_target_value(&event))
                        />
                    </label>
                    <label>
                        {move || format!("2. {}", t("label-passphrase"))}
                        <input
                            type="password"
                            autocomplete="new-password"
                            prop:value=move || new_passphrase.get()
                            on:input=move |event| new_passphrase.set(event_target_value(&event))
                        />
                    </label>
                    <label>
                        {move || format!("3. {}", t("label-confirm-passphrase"))}
                        <input
                            type="password"
                            autocomplete="new-password"
                            prop:value=move || confirmation.get()
                            on:input=move |event| confirmation.set(event_target_value(&event))
                        />
                    </label>
                    <p class="secret-error">{move || error.get()}</p>
                    <footer>
                        <button type="button" class="editor-btn btn-cancel" on:click=on_cancel>
                            {move || { let _ = lang.get(); t("btn-cancel") }}
                        </button>
                        <button type="submit" class="editor-btn btn-eval" disabled=move || busy.get()>
                            {move || { let _ = lang.get(); t("btn-save") }}
                        </button>
                    </footer>
            </form>
        </div>
    }
}
