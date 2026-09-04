/// Screensaver: idle timeout → ATC-style animation.
///
/// did:ma: actor widgets wander around with trajectory trails.
/// #entity fragments group together around actors, move as a formation,
/// then split apart and scatter.
///
/// Any keypress or click dismisses it.
use leptos::prelude::*;
use std::cell::RefCell;
use std::rc::Rc;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::{CanvasRenderingContext2d, HtmlCanvasElement};

use crate::state::AppState;

const HUD_COLOURS: &[&str] = &[
    "#00ff9f", // cyan-green
    "#00d4ff", // azure
    "#40ffb0", // seafoam
    "#ff9f40", // amber
    "#c080ff", // violet
    "#ff6060", // coral
];

const ENTITY_FRAGMENTS: &[&str] = &[
    "#fortune", "#ping", "#root", "#sign", "#enc", "#chat", "#ipfs", "#store", "#fetch",
    "#publish", "#inbox", "#key", "#doc", "#node", "#emit", "#recv", "#auth", "#hash", "#seed",
];

const ACTOR_DIDS: &[&str] = &[
    "did:ma:k51qzi5uqu5dga3f",
    "did:ma:k51qzi5uqu5dhf72a",
    "did:ma:k51qzi5uqu5dib2c9",
    "did:ma:k51qzi5uqu5djc9e1",
];

const TRAIL_LEN: usize = 45;
const ORBIT_SPEED: f64 = 0.022; // radians/frame
const GROUP_DURATION: f64 = 160.0; // frames a group stays together
const SPLIT_SPEED: f64 = 2.6;
const ACTOR_SPEED: f64 = 0.65;
const FREE_SPEED: f64 = 0.35;

#[derive(Clone)]
enum EntityMode {
    Free,
    /// Orbiting `actor_idx`, with jitter - not a clean circle.
    Grouped {
        actor_idx: usize,
        angle: f64,
        orbit_r: f64,
    },
    /// In transit from one actor to another along a bezier arc
    Hopping {
        to_idx: usize,
        t: f64,
        sx: f64,
        sy: f64,
        cx: f64,
        cy: f64,
    },
    /// Flying outward after group disbands
    Splitting,
}

#[derive(Clone)]
struct Entity {
    fragment: &'static str,
    x: f64,
    y: f64,
    vx: f64,
    vy: f64,
    mode: EntityMode,
    colour_idx: usize,
    /// Frames remaining in current mode
    timer: f64,
    /// Per-entity phase for orbit jitter (advances each frame)
    jitter_phase: f64,
    /// Amplitude of position jitter in pixels
    jitter_amp: f64,
}

impl Entity {
    fn is_free(&self) -> bool {
        matches!(self.mode, EntityMode::Free | EntityMode::Splitting)
    }
}

#[derive(Clone)]
struct Actor {
    did: &'static str,
    x: f64,
    y: f64,
    vx: f64,
    vy: f64,
    trail: Vec<(f64, f64)>,
    colour_idx: usize,
    /// Frames until this actor tries to attract entities
    attract_timer: f64,
}

#[component]
pub fn Screensaver() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let config = use_context::<RwSignal<crate::config::EgoConfig>>().expect("EgoConfig missing");
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
            let timeout = u32::try_from(
                config.with_untracked(crate::config::EgoConfig::screensaver_timeout_secs),
            )
            .unwrap_or(u32::MAX);
            let now = now_secs();
            let elapsed = now - *la.borrow();
            if elapsed > f64::from(timeout) {
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

    // Start ATC animation when canvas mounts
    Effect::new({
        let state = state.clone();
        move |_| {
            if !state.screensaver.get() {
                return;
            }
            if let Some(canvas) = canvas_ref.get() {
                start_atc_animation(&canvas);
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

        </div>
    }
}

// ── ATC-style animation ────────────────────────────────────────────────────────────

#[allow(clippy::many_single_char_names, clippy::too_many_lines)]
fn start_atc_animation(canvas: &HtmlCanvasElement) {
    let Some(window) = web_sys::window() else {
        return;
    };

    let w = window
        .inner_width()
        .ok()
        .and_then(|v| v.as_f64())
        .map_or(1280_u32, f64_to_canvas_px);
    let h = window
        .inner_height()
        .ok()
        .and_then(|v| v.as_f64())
        .map_or(720_u32, f64_to_canvas_px);
    canvas.set_width(w);
    canvas.set_height(h);

    let ctx: CanvasRenderingContext2d = canvas
        .get_context("2d")
        .unwrap()
        .unwrap()
        .dyn_into()
        .unwrap();

    let wf = f64::from(w);
    let hf = f64::from(h);

    // Initialise actors spread around the canvas
    let actors_init: Vec<Actor> = ACTOR_DIDS
        .iter()
        .enumerate()
        .map(|(i, did)| {
            let angle = (usize_to_f64(i) / usize_to_f64(ACTOR_DIDS.len())) * std::f64::consts::TAU;
            let r = wf.min(hf) * 0.28;
            Actor {
                did,
                x: wf / 2.0 + angle.cos() * r,
                y: hf / 2.0 + angle.sin() * r,
                vx: (js_sys::Math::random() - 0.5) * ACTOR_SPEED * 2.0,
                vy: (js_sys::Math::random() - 0.5) * ACTOR_SPEED * 2.0,
                trail: Vec::new(),
                colour_idx: i % HUD_COLOURS.len(),
                attract_timer: js_sys::Math::random() * 120.0,
            }
        })
        .collect();

    // Initialise entity fragments scattered randomly
    let entities_init: Vec<Entity> = ENTITY_FRAGMENTS
        .iter()
        .enumerate()
        .map(|(i, frag)| {
            let margin = 40.0;
            Entity {
                fragment: frag,
                x: margin + js_sys::Math::random() * (wf - 2.0 * margin),
                y: margin + js_sys::Math::random() * (hf - 2.0 * margin),
                vx: (js_sys::Math::random() - 0.5) * FREE_SPEED * 2.0,
                vy: (js_sys::Math::random() - 0.5) * FREE_SPEED * 2.0,
                mode: EntityMode::Free,
                colour_idx: i % HUD_COLOURS.len(),
                timer: 0.0,
                jitter_phase: js_sys::Math::random() * std::f64::consts::TAU,
                jitter_amp: 7.0 + js_sys::Math::random() * 12.0,
            }
        })
        .collect();

    let actors: Rc<RefCell<Vec<Actor>>> = Rc::new(RefCell::new(actors_init));
    let entities: Rc<RefCell<Vec<Entity>>> = Rc::new(RefCell::new(entities_init));
    let frame: Rc<RefCell<f64>> = Rc::new(RefCell::new(0.0_f64));

    #[allow(clippy::type_complexity)]
    let f: Rc<RefCell<Option<Closure<dyn FnMut()>>>> = Rc::new(RefCell::new(None));
    let f_clone = f.clone();
    // Skip every other RAF call → ~30 fps, halves CPU usage
    let skip_frame: Rc<RefCell<bool>> = Rc::new(RefCell::new(false));

    // Font size for the DID widget label row (px)
    let did_font_size = 11.0_f64;
    // Half-height of the DID widget box
    let widget_h = 22.0_f64;

    *f.borrow_mut() = Some(Closure::new(move || {
        // Throttle to ~30 fps
        {
            let mut skip = skip_frame.borrow_mut();
            *skip = !*skip;
            if *skip {
                web_sys::window()
                    .unwrap()
                    .request_animation_frame(
                        f_clone.borrow().as_ref().unwrap().as_ref().unchecked_ref(),
                    )
                    .unwrap();
                return;
            }
        }

        let t = {
            let mut n = frame.borrow_mut();
            *n += 1.0;
            *n
        };

        // ── 1. Background: near-black, slow fade so trails persist
        ctx.set_fill_style_str("rgba(4, 6, 18, 0.80)");
        ctx.fill_rect(0.0, 0.0, wf, hf);

        // ── 2. DON'T PANIC watermark — large, centred, softly pulsing
        {
            let pulse = 0.09 + 0.05 * (t / 90.0).sin();
            let font_px = (wf / 7.0).max(60.0).round();
            ctx.save();
            ctx.set_global_alpha(pulse);
            ctx.set_fill_style_str("#ffffff");
            ctx.set_font(&format!("bold {font_px:.0}px sans-serif"));
            ctx.set_text_align("center");
            ctx.set_text_baseline("middle");
            ctx.fill_text("DON'T PANIC", wf / 2.0, hf / 2.0)
                .unwrap_or(());
            ctx.restore();
        }

        // ── 3. Faint grid
        ctx.save();
        ctx.set_stroke_style_str("rgba(0, 180, 120, 0.045)");
        ctx.set_line_width(0.5);
        ctx.begin_path();
        let grid = 50.0_f64;
        let mut gx = 0.0_f64;
        while gx <= wf {
            ctx.move_to(gx, 0.0);
            ctx.line_to(gx, hf);
            gx += grid;
        }
        let mut gy = 0.0_f64;
        while gy <= hf {
            ctx.move_to(0.0, gy);
            ctx.line_to(wf, gy);
            gy += grid;
        }
        ctx.stroke();
        ctx.restore();

        // ── 4. Physics update
        {
            let mut av = actors.borrow_mut();
            let mut ev = entities.borrow_mut();

            // Update actor positions
            for (ai, actor) in av.iter_mut().enumerate() {
                actor.trail.push((actor.x, actor.y));
                if actor.trail.len() > TRAIL_LEN {
                    actor.trail.remove(0);
                }
                actor.x += actor.vx;
                actor.y += actor.vy;
                let m = 60.0;
                if actor.x < m || actor.x > wf - m {
                    actor.vx = -actor.vx;
                    actor.x = actor.x.clamp(m, wf - m);
                }
                if actor.y < m || actor.y > hf - m {
                    actor.vy = -actor.vy;
                    actor.y = actor.y.clamp(m, hf - m);
                }

                // Attract nearby free fragments
                actor.attract_timer -= 1.0;
                if actor.attract_timer <= 0.0 {
                    actor.attract_timer = 120.0 + js_sys::Math::random() * 180.0;
                    let attract_r = wf.min(hf) * 0.45;
                    // Space fragments evenly around the actor
                    let free_nearby: Vec<usize> = ev
                        .iter()
                        .enumerate()
                        .filter(|(_, e)| {
                            if !e.is_free() {
                                return false;
                            }
                            let dx = e.x - actor.x;
                            let dy = e.y - actor.y;
                            dx * dx + dy * dy < attract_r * attract_r
                        })
                        .map(|(i, _)| i)
                        .collect();
                    let n = free_nearby.len();
                    for (slot, &ei) in free_nearby.iter().enumerate() {
                        let base_angle = if n > 0 {
                            (usize_to_f64(slot) / usize_to_f64(n)) * std::f64::consts::TAU
                        } else {
                            0.0
                        };
                        let orbit_r = 55.0 + js_sys::Math::random() * 30.0;
                        ev[ei].mode = EntityMode::Grouped {
                            actor_idx: ai,
                            angle: base_angle,
                            orbit_r,
                        };
                        ev[ei].timer = GROUP_DURATION * (0.8 + js_sys::Math::random() * 0.4);
                        ev[ei].colour_idx = actor.colour_idx; // inherit actor colour
                    }
                }
            }

            // Update entity positions
            for ent in ev.iter_mut() {
                enum Transition {
                    None,
                    StartSplitting { vx: f64, vy: f64 },
                    BackToFree,
                    Hop { to_idx: usize, cx: f64, cy: f64 },
                    ArriveAt { actor_idx: usize },
                }
                let transition;

                match &mut ent.mode {
                    EntityMode::Free => {
                        // Occasional random nudge — erratic drift, not straight lines
                        if js_sys::Math::random() < 0.03 {
                            ent.vx += (js_sys::Math::random() - 0.5) * 0.4;
                            ent.vy += (js_sys::Math::random() - 0.5) * 0.4;
                            let spd = (ent.vx * ent.vx + ent.vy * ent.vy).sqrt();
                            if spd > FREE_SPEED * 2.2 {
                                ent.vx = ent.vx / spd * FREE_SPEED * 2.2;
                                ent.vy = ent.vy / spd * FREE_SPEED * 2.2;
                            }
                        }
                        ent.x += ent.vx;
                        ent.y += ent.vy;
                        let m = 8.0;
                        if ent.x < m || ent.x > wf - m {
                            ent.vx = -ent.vx;
                            ent.x = ent.x.clamp(m, wf - m);
                        }
                        if ent.y < m || ent.y > hf - m {
                            ent.vy = -ent.vy;
                            ent.y = ent.y.clamp(m, hf - m);
                        }
                        transition = Transition::None;
                    }
                    EntityMode::Grouped {
                        actor_idx,
                        angle,
                        orbit_r,
                    } => {
                        let ai = *actor_idx;
                        let a = *angle;
                        let r = *orbit_r;
                        // Variable angular speed driven by jitter — not a smooth circle
                        *angle += ORBIT_SPEED * (0.4 + 1.2 * (ent.jitter_phase * 0.17).sin().abs());
                        ent.jitter_phase += 0.05;
                        if let Some(actor) = av.get(ai) {
                            let jx = ent.jitter_amp * (ent.jitter_phase * 0.9).sin();
                            let jy = ent.jitter_amp * (ent.jitter_phase * 1.1 + 1.0).cos();
                            ent.x = actor.x + a.cos() * r + jx;
                            ent.y = actor.y + a.sin() * r + jy;
                        }
                        ent.timer -= 1.0;
                        if ent.timer <= 0.0 {
                            // 55% chance: hop to another actor; 45%: split free
                            if js_sys::Math::random() < 0.55 && av.len() > 1 {
                                let nearest = av
                                    .iter()
                                    .enumerate()
                                    .filter(|(i, _)| *i != ai)
                                    .map(|(i, a)| {
                                        let dx = a.x - ent.x;
                                        let dy = a.y - ent.y;
                                        (i, dx * dx + dy * dy)
                                    })
                                    .min_by(|a, b| {
                                        a.1.partial_cmp(&b.1).unwrap_or(std::cmp::Ordering::Equal)
                                    });
                                if let Some((to_idx, _)) = nearest {
                                    let mx = f64::midpoint(ent.x, av[to_idx].x);
                                    let my = f64::midpoint(ent.y, av[to_idx].y);
                                    let perp = (js_sys::Math::random() - 0.5) * 140.0;
                                    transition = Transition::Hop {
                                        to_idx,
                                        cx: mx + perp,
                                        cy: my + perp,
                                    };
                                } else {
                                    let (ox, oy) =
                                        av.get(ai).map_or((wf / 2.0, hf / 2.0), |a| (a.x, a.y));
                                    let dx = ent.x - ox;
                                    let dy = ent.y - oy;
                                    let len = (dx * dx + dy * dy).sqrt().max(1.0);
                                    ent.timer = 45.0 + js_sys::Math::random() * 30.0;
                                    transition = Transition::StartSplitting {
                                        vx: (dx / len) * SPLIT_SPEED,
                                        vy: (dy / len) * SPLIT_SPEED,
                                    };
                                }
                            } else {
                                let (ox, oy) =
                                    av.get(ai).map_or((wf / 2.0, hf / 2.0), |a| (a.x, a.y));
                                let dx = ent.x - ox;
                                let dy = ent.y - oy;
                                let len = (dx * dx + dy * dy).sqrt().max(1.0);
                                ent.timer = 45.0 + js_sys::Math::random() * 30.0;
                                transition = Transition::StartSplitting {
                                    vx: (dx / len) * SPLIT_SPEED,
                                    vy: (dy / len) * SPLIT_SPEED,
                                };
                            }
                        } else {
                            transition = Transition::None;
                        }
                    }
                    EntityMode::Hopping {
                        to_idx,
                        t,
                        sx,
                        sy,
                        cx,
                        cy,
                    } => {
                        *t += 0.020 + js_sys::Math::random() * 0.012;
                        let prog = (*t).min(1.0);
                        let ti = *to_idx;
                        if let Some(target) = av.get(ti) {
                            // Quadratic bezier: (1-t)²·S + 2(1-t)t·C + t²·T
                            let q = 1.0 - prog;
                            ent.x = q * q * *sx + 2.0 * q * prog * *cx + prog * prog * target.x;
                            ent.y = q * q * *sy + 2.0 * q * prog * *cy + prog * prog * target.y;
                        }
                        transition = if *t >= 1.0 {
                            Transition::ArriveAt { actor_idx: ti }
                        } else {
                            Transition::None
                        };
                    }
                    EntityMode::Splitting => {
                        ent.x += ent.vx;
                        ent.y += ent.vy;
                        ent.vx *= 0.96;
                        ent.vy *= 0.96;
                        let m = 8.0;
                        if ent.x < m || ent.x > wf - m {
                            ent.vx = -ent.vx;
                            ent.x = ent.x.clamp(m, wf - m);
                        }
                        if ent.y < m || ent.y > hf - m {
                            ent.vy = -ent.vy;
                            ent.y = ent.y.clamp(m, hf - m);
                        }
                        ent.timer -= 1.0;
                        transition = if ent.timer <= 0.0 {
                            Transition::BackToFree
                        } else {
                            Transition::None
                        };
                    }
                }
                match transition {
                    Transition::None => {}
                    Transition::StartSplitting { vx, vy } => {
                        ent.vx = vx;
                        ent.vy = vy;
                        ent.mode = EntityMode::Splitting;
                    }
                    Transition::BackToFree => {
                        ent.vx = (js_sys::Math::random() - 0.5) * FREE_SPEED * 2.0;
                        ent.vy = (js_sys::Math::random() - 0.5) * FREE_SPEED * 2.0;
                        ent.mode = EntityMode::Free;
                    }
                    Transition::Hop { to_idx, cx, cy } => {
                        let (sx, sy) = (ent.x, ent.y);
                        ent.mode = EntityMode::Hopping {
                            to_idx,
                            t: 0.0,
                            sx,
                            sy,
                            cx,
                            cy,
                        };
                    }
                    Transition::ArriveAt { actor_idx } => {
                        let angle = js_sys::Math::random() * std::f64::consts::TAU;
                        let orbit_r = 45.0 + js_sys::Math::random() * 35.0;
                        ent.colour_idx = av.get(actor_idx).map_or(ent.colour_idx, |a| a.colour_idx);
                        ent.timer = GROUP_DURATION * (0.5 + js_sys::Math::random() * 0.6);
                        ent.mode = EntityMode::Grouped {
                            actor_idx,
                            angle,
                            orbit_r,
                        };
                    }
                }
            }

            // ── 5. Draw: connection lines first (behind everything)
            // Proximity web — faint lines from any nearby actor to any entity
            for ent in ev.iter() {
                let (ex, ey) = (ent.x, ent.y);
                for actor in av.iter() {
                    let dx = actor.x - ex;
                    let dy = actor.y - ey;
                    let dist = (dx * dx + dy * dy).sqrt();
                    let max_prox = 190.0_f64;
                    if dist < max_prox && dist > 22.0 {
                        let alpha = (1.0 - dist / max_prox) * 0.07;
                        ctx.save();
                        ctx.set_global_alpha(alpha);
                        ctx.set_stroke_style_str(HUD_COLOURS[actor.colour_idx]);
                        ctx.set_line_width(0.4);
                        ctx.begin_path();
                        ctx.move_to(ex, ey);
                        ctx.line_to(actor.x, actor.y);
                        ctx.stroke();
                        ctx.restore();
                    }
                }
            }
            // Primary tether and hop-transit lines
            for ent in ev.iter() {
                match &ent.mode {
                    EntityMode::Grouped { actor_idx, .. } => {
                        if let Some(actor) = av.get(*actor_idx) {
                            ctx.save();
                            ctx.set_global_alpha(0.30);
                            ctx.set_stroke_style_str(HUD_COLOURS[actor.colour_idx]);
                            ctx.set_line_width(0.9);
                            ctx.begin_path();
                            ctx.move_to(actor.x, actor.y);
                            ctx.line_to(ent.x, ent.y);
                            ctx.stroke();
                            ctx.restore();
                        }
                    }
                    EntityMode::Hopping { to_idx, .. } => {
                        if let Some(actor) = av.get(*to_idx) {
                            let dash = js_sys::Array::of2(
                                &JsValue::from(5.0_f64),
                                &JsValue::from(5.0_f64),
                            );
                            ctx.save();
                            ctx.set_global_alpha(0.22);
                            ctx.set_stroke_style_str(HUD_COLOURS[ent.colour_idx]);
                            ctx.set_line_width(0.7);
                            ctx.set_line_dash(&dash).unwrap_or(());
                            ctx.begin_path();
                            ctx.move_to(ent.x, ent.y);
                            ctx.line_to(actor.x, actor.y);
                            ctx.stroke();
                            ctx.set_line_dash(&js_sys::Array::new()).unwrap_or(());
                            ctx.restore();
                        }
                    }
                    _ => {}
                }
            }

            // ── 6. Draw actors: trail → widget box → DID label
            for actor in av.iter() {
                let colour = HUD_COLOURS[actor.colour_idx];
                let trail_len = actor.trail.len();

                // Trajectory trail (fading dots)
                for (ti, (tx, ty)) in actor.trail.iter().enumerate() {
                    let alpha = (usize_to_f64(ti) / usize_to_f64(trail_len)) * 0.35;
                    ctx.save();
                    ctx.set_global_alpha(alpha);
                    ctx.set_fill_style_str(colour);
                    ctx.begin_path();
                    ctx.arc(*tx, *ty, 1.5, 0.0, std::f64::consts::TAU)
                        .unwrap_or(());
                    ctx.fill();
                    ctx.restore();
                }

                // Widget box: rounded rect containing the DID
                let label = if actor.did.len() > 24 {
                    &actor.did[..24]
                } else {
                    actor.did
                };
                let box_w = usize_to_f64(label.len()) * did_font_size * 0.62 + 16.0;
                let bx = actor.x - box_w / 2.0;
                let by = actor.y - widget_h;

                ctx.save();
                ctx.set_global_alpha(0.85);
                // Box fill
                ctx.set_fill_style_str("rgba(4, 10, 28, 0.88)");
                rounded_rect(&ctx, bx, by, box_w, widget_h * 2.0, 5.0);
                ctx.fill();
                // Box border
                ctx.set_stroke_style_str(colour);
                ctx.set_line_width(1.2);
                rounded_rect(&ctx, bx, by, box_w, widget_h * 2.0, 5.0);
                ctx.stroke();
                // DID text
                ctx.set_fill_style_str(colour);
                ctx.set_font(&format!("{did_font_size:.0}px monospace"));
                ctx.set_text_align("center");
                ctx.set_text_baseline("middle");
                ctx.fill_text(label, actor.x, actor.y).unwrap_or(());
                // Centre blip
                ctx.set_fill_style_str("#ffffff");
                ctx.set_global_alpha(0.9);
                ctx.begin_path();
                ctx.arc(
                    actor.x,
                    actor.y - widget_h + 3.0,
                    2.0,
                    0.0,
                    std::f64::consts::TAU,
                )
                .unwrap_or(());
                ctx.fill();
                ctx.restore();
            }

            // ── 7. Draw fragment labels
            for ent in ev.iter() {
                let colour = HUD_COLOURS[ent.colour_idx];
                let (alpha, dot_r) = match &ent.mode {
                    EntityMode::Grouped { .. } => (0.90, 2.5),
                    EntityMode::Hopping { .. } => (0.75, 2.0),
                    EntityMode::Splitting => (0.65, 1.8),
                    EntityMode::Free => (0.35, 1.4),
                };
                ctx.save();
                ctx.set_global_alpha(alpha);
                ctx.set_fill_style_str(colour);
                // Anchor dot
                ctx.begin_path();
                ctx.arc(ent.x, ent.y, dot_r, 0.0, std::f64::consts::TAU)
                    .unwrap_or(());
                ctx.fill();
                // Fragment text
                ctx.set_font("10px monospace");
                ctx.set_text_align("left");
                ctx.set_text_baseline("middle");
                ctx.fill_text(ent.fragment, ent.x + 6.0, ent.y)
                    .unwrap_or(());
                ctx.restore();
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

#[allow(clippy::many_single_char_names)]
/// Draw a rounded rectangle path (does not fill or stroke — caller does that).
fn rounded_rect(ctx: &CanvasRenderingContext2d, x: f64, y: f64, w: f64, h: f64, r: f64) {
    let r = r.min(w / 2.0).min(h / 2.0);
    ctx.begin_path();
    ctx.move_to(x + r, y);
    ctx.line_to(x + w - r, y);
    ctx.arc(x + w - r, y + r, r, -std::f64::consts::FRAC_PI_2, 0.0)
        .unwrap_or(());
    ctx.line_to(x + w, y + h - r);
    ctx.arc(x + w - r, y + h - r, r, 0.0, std::f64::consts::FRAC_PI_2)
        .unwrap_or(());
    ctx.line_to(x + r, y + h);
    ctx.arc(
        x + r,
        y + h - r,
        r,
        std::f64::consts::FRAC_PI_2,
        std::f64::consts::PI,
    )
    .unwrap_or(());
    ctx.line_to(x, y + r);
    ctx.arc(
        x + r,
        y + r,
        r,
        std::f64::consts::PI,
        3.0 * std::f64::consts::FRAC_PI_2,
    )
    .unwrap_or(());
    ctx.close_path();
}

fn now_secs() -> f64 {
    web_sys::window()
        .and_then(|w| w.performance())
        .map_or(0.0, |p| p.now() / 1000.0)
}

fn usize_to_f64(value: usize) -> f64 {
    u32::try_from(value).map_or(f64::from(u32::MAX), f64::from)
}

#[allow(clippy::cast_possible_truncation, clippy::cast_sign_loss)]
fn f64_to_canvas_px(value: f64) -> u32 {
    if !value.is_finite() {
        return 1;
    }
    let clamped = value.round().clamp(1.0, f64::from(u32::MAX));
    clamped as u32
}
