mod acl;
mod app;
mod config;
mod core;
mod i18n;
mod identity;
mod mailbox;
mod messages;
mod parser;
mod state;
mod transport;
mod views;

fn init_logging() {
    #[cfg(target_arch = "wasm32")]
    {
        let _ = console_log::init_with_level(log::Level::Info);
    }

    #[cfg(not(target_arch = "wasm32"))]
    {
        let _ = env_logger::try_init();
    }
}

fn main() {
    init_logging();
    console_error_panic_hook::set_once();
    wasm_bindgen_futures::spawn_local(async {
        i18n::init_from_browser().await;
        leptos::mount::mount_to_body(app::App);
    });
}
