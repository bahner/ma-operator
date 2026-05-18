/// Screensaver: idle timeout → Matrix digital rain + DON'T PANIC overlay.
///
/// Phases:
///   1. Matrix canvas (requestAnimationFrame loop)
///   2. DON'T PANIC text floats over the rain (always visible after activation)
///
/// Any keypress or click dismisses it.
use leptos::prelude::*;
use std::cell::RefCell;
use std::rc::Rc;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::{CanvasRenderingContext2d, HtmlCanvasElement};

use crate::state::AppState;

// Festive character set — emojis and symbols for the drunk screensaver
const MATRIX_CHARS: &str = "✨🎉🎊💫⭐🌟🎈🎁🎪🎨🎭🎬🎤🎧🎸🎹🎺🎷☀️🌈🌸🌺🍀🎀💝💖💗💓💕💞💘🦋🐝🐞🦗0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%^&*";

#[component]
pub fn Screensaver() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let canvas_ref = NodeRef::<leptos::html::Canvas>::new();

    // Idle tracking
    let last_activity: Rc<RefCell<f64>> = Rc::new(RefCell::new(0.0));

    {
        let state2 = state.clone();
        let la = last_activity.clone();

        // Tick every second via gloo_timers::callback::Interval
        let interval = gloo_timers::callback::Interval::new(1_000, move || {
            if state2.screensaver.get_untracked() {
                return;
            }
            let timeout = state2
                .session
                .get_untracked()
                .map(|_| 300u32) // default 300s; TODO use config
                .unwrap_or(300);
            let now = now_secs();
            let elapsed = now - *la.borrow();
            if elapsed > timeout as f64 {
                state2.screensaver.set(true);
            }
        });
        interval.forget();
    }

    // Dismiss screensaver on interaction
    let dismiss = {
        let state = state.clone();
        let la = last_activity.clone();
        move || {
            *la.borrow_mut() = now_secs();
            state.screensaver.set(false);
        }
    };

    // Reset idle timer on any window event
    {
        let la = last_activity.clone();
        let window = web_sys::window().unwrap();
        let closure = Closure::<dyn FnMut()>::new(move || {
            *la.borrow_mut() = now_secs();
        });
        window
            .add_event_listener_with_callback("keydown", closure.as_ref().unchecked_ref())
            .unwrap();
        window
            .add_event_listener_with_callback("mousemove", closure.as_ref().unchecked_ref())
            .unwrap();
        closure.forget();
    }

    // Start Matrix rain when canvas mounts
    Effect::new({
        let state = state.clone();
        move |_| {
            if !state.screensaver.get() {
                return;
            }
            if let Some(canvas) = canvas_ref.get() {
                start_matrix_rain(&canvas);
            }
        }
    });

    let dismiss2 = dismiss.clone();
    let dismiss3 = dismiss.clone();

    view! {
        <div
            class="screensaver"
            style=move || if state.screensaver.get() { "" } else { "display:none" }
            on:click=move |_| dismiss2()
            on:keydown=move |_| dismiss3()
        >
            <canvas node_ref=canvas_ref/>
            <div class="screensaver-overlay">
                <div class="dont-panic">"DON'T PANIC"</div>
            </div>
        </div>
    }
}

// ── Matrix rain ────────────────────────────────────────────────────────────

fn start_matrix_rain(canvas: &HtmlCanvasElement) {
    let window = match web_sys::window() {
        Some(w) => w,
        None => return,
    };

    let w = window.inner_width().unwrap().as_f64().unwrap_or(800.0) as u32;
    let h = window.inner_height().unwrap().as_f64().unwrap_or(600.0) as u32;
    canvas.set_width(w);
    canvas.set_height(h);

    let ctx: CanvasRenderingContext2d = canvas
        .get_context("2d")
        .unwrap()
        .unwrap()
        .dyn_into()
        .unwrap();

    let font_size = 14u32;
    let cols = (w / font_size).max(1) as usize;

    // Each column tracks its Y position (in rows)
    let drops: Rc<RefCell<Vec<f64>>> = Rc::new(RefCell::new(vec![1.0; cols]));
    let chars: Vec<char> = MATRIX_CHARS.chars().collect();
    let chars = Rc::new(chars);

    // Ghost babel fish swimming in the background
    #[derive(Clone)]
    struct BabelFish {
        x: f64,
        y: f64,
        speed: f64,
        dir: f64, // 1.0 = right, -1.0 = left
        opacity: f64,
        size: f64,
    }
    let fish_count = 5usize;
    let fish_init: Vec<BabelFish> = (0..fish_count)
        .map(|i| BabelFish {
            x: js_sys::Math::random() * w as f64,
            y: (i as f64 + 1.0) * (h as f64 / (fish_count as f64 + 1.0)),
            speed: 0.4 + js_sys::Math::random() * 0.6,
            dir: if js_sys::Math::random() > 0.5 {
                1.0
            } else {
                -1.0
            },
            opacity: 0.10 + js_sys::Math::random() * 0.12,
            size: 18.0 + js_sys::Math::random() * 14.0,
        })
        .collect();
    // Give each fish a slightly different vertical drift
    let fish: Rc<RefCell<Vec<BabelFish>>> = Rc::new(RefCell::new(fish_init));

    let f: Rc<RefCell<Option<Closure<dyn FnMut()>>>> = Rc::new(RefCell::new(None));
    let f_clone = f.clone();

    *f.borrow_mut() = Some(Closure::new(move || {
        // Light festive background with pastel glow effect
        ctx.set_fill_style_str("rgba(255,250,240,0.08)");
        ctx.fill_rect(0.0, 0.0, w as f64, h as f64);

        ctx.set_font(&format!("{font_size}px monospace"));

        let mut drops = drops.borrow_mut();
        for (i, drop) in drops.iter_mut().enumerate() {
            // Random character
            let idx = (js_sys::Math::random() * chars.len() as f64) as usize;
            let ch = chars[idx % chars.len()].to_string();

            let x = i as f64 * font_size as f64;
            let y = *drop * font_size as f64;

            // Head char: bright pastel neon colors
            let colors = ["#FF1493", "#00FFFF", "#FFD700", "#FF69B4", "#00FF7F", "#FFA500"];
            let color_idx = i % colors.len();
            ctx.set_fill_style_str(colors[color_idx]);
            ctx.fill_text(&ch, x, y).unwrap_or(());

            // Trail: lighter glow effect
            ctx.set_fill_style_str("rgba(255,105,180,0.4)");
            let _ = ctx.fill_text(&ch, x, y); // already drawn white; next tick fades

            // Reset to top randomly or when past bottom
            if y > h as f64 && js_sys::Math::random() > 0.975 {
                *drop = 0.0;
            }
            *drop += 0.5;
        }

        // Draw ghost babel fish
        {
            let mut fish_list = fish.borrow_mut();
            for bfish in fish_list.iter_mut() {
                ctx.save();
                ctx.set_global_alpha(bfish.opacity);
                ctx.set_font(&format!("{}px serif", bfish.size as u32));
                ctx.set_fill_style_str("#aef");
                let glyph = if bfish.dir > 0.0 { "🐟" } else { "🐡" };
                let _ = ctx.fill_text(glyph, bfish.x, bfish.y);
                ctx.restore();
                // Move
                bfish.x += bfish.dir * bfish.speed;
                // Gentle vertical sine drift
                bfish.y += (bfish.x * 0.01).sin() * 0.3;
                // Wrap around edges
                if bfish.x > w as f64 + 30.0 {
                    bfish.x = -30.0;
                }
                if bfish.x < -30.0 {
                    bfish.x = w as f64 + 30.0;
                }
                // Keep within vertical bounds
                if bfish.y < 10.0 {
                    bfish.y = 10.0;
                }
                if bfish.y > h as f64 - 10.0 {
                    bfish.y = h as f64 - 10.0;
                }
            }
        }

        // Schedule next frame
        web_sys::window()
            .unwrap()
            .request_animation_frame(f_clone.borrow().as_ref().unwrap().as_ref().unchecked_ref())
            .unwrap();
    }));

    window
        .request_animation_frame(f.borrow().as_ref().unwrap().as_ref().unchecked_ref())
        .unwrap();
}

fn now_secs() -> f64 {
    web_sys::window()
        .and_then(|w| w.performance())
        .map(|p| p.now() / 1000.0)
        .unwrap_or(0.0)
}
