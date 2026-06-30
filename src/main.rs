mod acl;
mod app;
mod cid_ops;
mod config;
mod core;
mod dispatch;
mod eval;
mod help;
mod http;
mod i18n;
mod identity;
mod inbox_poll;
mod mailbox;
mod messages;
mod parser;
mod profile_crypto;
mod scheme;
mod startup;
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

/// Change the active log level at runtime.  Valid values (case-insensitive):
/// `trace`, `debug`, `info`, `warn`, `error`, `off`.
/// Unknown strings are silently ignored.
pub(crate) fn apply_log_level(level: &str) {
    let filter = match level.to_lowercase().as_str() {
        "trace" => log::LevelFilter::Trace,
        "debug" => log::LevelFilter::Debug,
        "info" => log::LevelFilter::Info,
        "warn" | "warning" => log::LevelFilter::Warn,
        "error" => log::LevelFilter::Error,
        "off" => log::LevelFilter::Off,
        _ => return,
    };
    log::set_max_level(filter);
}

fn main() {
    init_logging();
    console_error_panic_hook::set_once();
    wasm_bindgen_futures::spawn_local(async {
        i18n::init_from_browser().await;
        leptos::mount::mount_to_body(app::App);
    });
}
