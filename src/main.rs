mod app;
mod config;
mod identity;
mod messages;
mod parser;
mod state;
mod transport;
mod views;

fn main() {
    console_error_panic_hook::set_once();
    leptos::mount::mount_to_body(app::App);
}
