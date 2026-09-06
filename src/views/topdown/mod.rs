/// Topdown presentation view over the zscheme room snapshot and event stream.
///
/// Purely cosmetic: it derives its model from `look` (via `room-call`) and the
/// incoming message stream, and sends `say`/`emote`/`go`/`look` through the
/// ordinary dispatch queue. Nothing here is persisted or sent on the wire.
use std::collections::HashMap;

use gloo_timers::callback::Interval;
use gloo_timers::future::TimeoutFuture;
use leptos::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::spawn_local;
use web_sys::{HtmlInputElement, KeyboardEvent, MouseEvent};

use crate::config::OperatorConfig;
use crate::state::AppState;
use crate::topdown::{parse_room_look, TopdownEntity, TopdownEvent};

/// Static entity presentation info (positions live in a separate signal so
/// agent movement can re-render cheaply without recreating the DOM node).
#[derive(Clone)]
struct Placed {
    entity: TopdownEntity,
    is_self: bool,
}

/// Fetched visual assets for one actor, keyed by its bare DID.
#[derive(Clone, Default)]
struct SpriteAsset {
    /// 128x128 4x4 sprite-sheet data URL (animated avatar).
    sheet: Option<String>,
    /// Favicon data URL at the best-fitting size (static fallback).
    favicon: Option<String>,
}

/// What the on-screen input bubble commits on Enter.
#[derive(Clone)]
enum PendingCommand {
    Say,
    Emote,
    SayTo { actor: String },
    EmoteTo { actor: String },
}

fn command_for(command: &PendingCommand, text: &str) -> String {
    match command {
        PendingCommand::Say => format!("say {text}"),
        PendingCommand::Emote => format!("emote {text}"),
        PendingCommand::SayTo { actor } => format!("@{actor}:say {text}"),
        PendingCommand::EmoteTo { actor } => format!("@{actor}:emote {text}"),
    }
}

fn kind_emoji(entity: &TopdownEntity, is_self: bool) -> &'static str {
    if is_self {
        "🧍"
    } else {
        match entity.kind.as_str() {
            "exit" => "🚪",
            "agent" => "🦆",
            "h00man" => "🧑",
            "thing" => "📦",
            _ => "•",
        }
    }
}

/// `ma.sprites` format key for the animated 4x4 sprite sheet.
const SPRITE_SHEET_FORMAT: &str = "32x32";
/// `ma.sprites` format key for the multi-size `.ico` favicon.
const FAVICON_FORMAT: &str = "favicon";

/// Which way a wandering sprite faces; each variant maps to a 4x4 sheet row.
#[derive(Clone, Copy)]
enum Facing {
    Down,
    Left,
    Right,
    Up,
}

impl Facing {
    /// Derive the dominant facing from a movement delta so a diagonal nudge
    /// still picks the single axis that dominates.
    fn from_delta(dx: f64, dy: f64) -> Self {
        if dx.abs() > dy.abs() {
            if dx >= 0.0 {
                Self::Right
            } else {
                Self::Left
            }
        } else if dy >= 0.0 {
            Self::Down
        } else {
            Self::Up
        }
    }

    fn row(self) -> u8 {
        match self {
            Self::Down => 0,
            Self::Left => 1,
            Self::Right => 2,
            Self::Up => 3,
        }
    }
}

/// Pick the sprite-sheet column for the current animation phase. Columns 1 and
/// 3 are the two walk steps (the spec repeats the standing frame at columns 0
/// and 2), so walking alternates 1↔3 while idle holds 0.
fn sprite_column(walking: bool, tick: bool) -> u8 {
    if !walking {
        0
    } else if tick {
        1
    } else {
        3
    }
}

/// CSS `background-position` for a 4x4 sprite sheet, selecting `(row, col)`.
///
/// With `background-size: 400% 400%` the image is 4× the cell size, so frame
/// `n` of 4 sits at `n * 100% / (4 - 1)` — hence `100 / 3` per step, not `/4`.
fn sprite_position(row: u8, col: u8) -> String {
    let x = f64::from(col) * (100.0 / 3.0);
    let y = f64::from(row) * (100.0 / 3.0);
    format!("{x:.2}% {y:.2}%")
}

/// Fetch a sprite/favicon CID with a short bounded retry. A freshly published
/// block is cold on the public gateways; the first request warms it server-side,
/// so a couple of retries lands the bytes without stalling the room loop for the
/// full startup budget.
async fn fetch_sprite_bytes(cid: &str) -> Option<Vec<u8>> {
    let mut attempt = 0u32;
    loop {
        match crate::http::fetch_cid_bytes(cid).await {
            Ok(bytes) => return Some(bytes),
            Err(error) if attempt < 3 => {
                log::warn!("[topdown] sprite CID fetch failed, retrying: {error}");
                TimeoutFuture::new(crate::http::retry_backoff_ms(attempt)).await;
                attempt += 1;
            }
            Err(_) => return None,
        }
    }
}

fn data_url(bytes: &[u8], mime: &str) -> String {
    use base64::Engine as _;
    let encoded = base64::engine::general_purpose::STANDARD.encode(bytes);
    format!("data:{mime};base64,{encoded}")
}

const PNG_MAGIC: &[u8] = b"\x89PNG\r\n\x1a\n";
const ICO_MAGIC: &[u8] = &[0x00, 0x00, 0x01, 0x00];

/// The playfield renders favicons at 32x32 CSS pixels (`.topdown-favicon`), so
/// this is the target when picking a frame from a multi-size ICO.
const FAVICON_TARGET_SIZE: u32 = 32;

fn is_png(bytes: &[u8]) -> bool {
    bytes.starts_with(PNG_MAGIC)
}

/// ICO directory entries store a 256-px dimension as `0`.
fn ico_dimension(raw: u8) -> u32 {
    if raw == 0 {
        256
    } else {
        u32::from(raw)
    }
}

/// Extract the ICO frame whose longest edge is closest to `target`. Ties prefer
/// the larger frame so a too-small icon is never upscaled.
///
/// Returns `None` when `bytes` is not a well-formed ICO or the chosen frame
/// would read past the end of the buffer.
fn best_ico_frame(bytes: &[u8], target: u32) -> Option<Vec<u8>> {
    if bytes.len() < 6 || &bytes[..4] != ICO_MAGIC {
        return None;
    }
    let count = usize::from(u16::from_le_bytes([bytes[4], bytes[5]]));
    let mut frames: Vec<(u32, &[u8])> = Vec::with_capacity(count);
    for index in 0..count {
        let start = 6 + index * 16;
        if start + 16 > bytes.len() {
            break;
        }
        let dimension = ico_dimension(bytes[start]).max(ico_dimension(bytes[start + 1]));
        let byte_size = u32::from_le_bytes([
            bytes[start + 8],
            bytes[start + 9],
            bytes[start + 10],
            bytes[start + 11],
        ]);
        let offset = u32::from_le_bytes([
            bytes[start + 12],
            bytes[start + 13],
            bytes[start + 14],
            bytes[start + 15],
        ]);
        let start = usize::try_from(offset).ok()?;
        let end = start.checked_add(usize::try_from(byte_size).ok()?)?;
        frames.push((dimension, bytes.get(start..end)?));
    }
    frames.sort_by(|a, b| {
        a.0.abs_diff(target)
            .cmp(&b.0.abs_diff(target))
            .then_with(|| b.0.cmp(&a.0))
    });
    frames.into_iter().next().map(|(_, frame)| frame.to_vec())
}

/// Build the favicon data URL from a multi-size ICO.
///
/// Our favicons are ICO files whose frames are PNG-encoded, so the best-fitting
/// frame is embedded directly. Legacy BMP/DIB frames cannot be re-embedded
/// without decoding, so those fall back to the whole ICO and let the browser
/// choose the size.
fn favicon_data_url(bytes: &[u8]) -> Option<String> {
    let frame = best_ico_frame(bytes, FAVICON_TARGET_SIZE)?;
    if is_png(&frame) {
        Some(data_url(&frame, "image/png"))
    } else {
        Some(data_url(bytes, "image/x-icon"))
    }
}

/// Resolve an actor's `ma.sprites` links from its DID document.
///
/// Returns `None` only when the DID itself cannot be resolved (a transient
/// IPNS/gateway failure the caller should retry). A resolved actor without any
/// sprites yields an empty-but-present `SpriteAsset`, so sprite-less agents are
/// cached and not re-resolved every loop.
async fn resolve_sprite_asset(did: &str) -> Option<SpriteAsset> {
    let resolver = crate::transport::connection::ipns_resolver().ok()?;
    let doc = crate::parser::verbs::ma::resolve_did_with_retry(resolver.as_ref(), did, 8_000)
        .await
        .ok()?;
    let links = crate::parser::verbs::doc_sprite_links(&doc);
    let mut asset = SpriteAsset::default();
    if let Some(cid) = links.get(SPRITE_SHEET_FORMAT) {
        if let Some(bytes) = fetch_sprite_bytes(cid).await {
            if is_png(&bytes) {
                asset.sheet = Some(data_url(&bytes, "image/png"));
            }
        }
    }
    if let Some(cid) = links.get(FAVICON_FORMAT) {
        if let Some(bytes) = fetch_sprite_bytes(cid).await {
            asset.favicon = favicon_data_url(&bytes);
        }
    }
    Some(asset)
}

fn now_ms() -> f64 {
    js_sys::Date::now()
}

/// Place the `index`-th of `total` exits around the playfield perimeter.
fn edge_position(index: usize, total: usize) -> (f64, f64) {
    let n = total.max(1) as f64;
    let t = index as f64 / n;
    let m = 0.04;
    if t < 0.25 {
        (0.08 + 0.84 * (t / 0.25), m)
    } else if t < 0.5 {
        (1.0 - m, 0.08 + 0.84 * ((t - 0.25) / 0.25))
    } else if t < 0.75 {
        (0.92 - 0.84 * ((t - 0.5) / 0.25), 1.0 - m)
    } else {
        (m, 0.92 - 0.84 * ((t - 0.75) / 0.25))
    }
}

fn random_interior() -> (f64, f64) {
    (
        0.15 + js_sys::Math::random() * 0.7,
        0.18 + js_sys::Math::random() * 0.62,
    )
}

fn layout_positions(
    entities: &[TopdownEntity],
    existing: &HashMap<String, (f64, f64)>,
) -> HashMap<String, (f64, f64)> {
    let mut out = HashMap::new();
    let exits: Vec<&TopdownEntity> = entities.iter().filter(|e| e.is_exit()).collect();
    for (i, e) in exits.iter().enumerate() {
        out.insert(e.actor.clone(), edge_position(i, exits.len()));
    }
    for e in entities.iter().filter(|e| !e.is_exit()) {
        let pos = existing
            .get(&e.actor)
            .copied()
            .unwrap_or_else(random_interior);
        out.insert(e.actor.clone(), pos);
    }
    out
}

async fn fetch_room(
    state: &AppState,
    config: RwSignal<OperatorConfig>,
    placed: RwSignal<Vec<Placed>>,
    positions: RwSignal<HashMap<String, (f64, f64)>>,
    room_name: RwSignal<String>,
    room_description: RwSignal<String>,
) {
    let snapshot = match crate::scheme::call_shorthand(
        "room-call",
        vec![("look".to_string(), false)],
        state,
        config,
    )
    .await
    {
        Ok(value) => parse_room_look(&value),
        Err(_) => None,
    };
    let Some(snapshot) = snapshot else {
        return;
    };

    room_name.set(snapshot.name);
    room_description.set(snapshot.description);

    // The observer is not a child of the room: assemble the self sprite from
    // local identity + cached ctx, exactly as `my-node-ctx` does in zscheme.
    let self_did = state
        .session
        .get_untracked()
        .map(|s| s.sender_did.clone())
        .unwrap_or_default();
    let self_nick = config
        .get_untracked()
        .get(".my.ctx.nick")
        .map(str::to_string)
        .unwrap_or_default();
    let self_entity = TopdownEntity {
        actor: self_did.clone(),
        kind: "h00man".to_string(),
        name: self_did,
        nick: self_nick,
        description: String::new(),
        direction: None,
    };

    let existing = positions.get_untracked();
    let mut new_positions = layout_positions(&snapshot.entities, &existing);
    new_positions.insert(self_entity.actor.clone(), (0.5, 0.5));
    positions.set(new_positions);

    let mut new_placed: Vec<Placed> = snapshot
        .entities
        .into_iter()
        .map(|entity| Placed {
            entity,
            is_self: false,
        })
        .collect();
    new_placed.push(Placed {
        entity: self_entity,
        is_self: true,
    });
    placed.set(new_placed);
}

#[component]
pub fn TopdownView() -> impl IntoView {
    let state = use_context::<AppState>().expect("AppState missing");
    let config = use_context::<RwSignal<OperatorConfig>>().expect("OperatorConfig missing");

    let placed: RwSignal<Vec<Placed>> = RwSignal::new(Vec::new());
    let positions: RwSignal<HashMap<String, (f64, f64)>> = RwSignal::new(HashMap::new());
    let room_name: RwSignal<String> = RwSignal::new(String::new());
    let room_description: RwSignal<String> = RwSignal::new(String::new());

    // Speech/emote bubbles: (actor, text, expires_at_ms).
    let bubbles: RwSignal<Vec<(String, String, f64)>> = RwSignal::new(Vec::new());
    // Subtitles: (text, expires_at_ms).
    let subtitles: RwSignal<Vec<(String, f64)>> = RwSignal::new(Vec::new());

    // Right-click context menu: (entity, client x, client y).
    let menu: RwSignal<Option<(TopdownEntity, f64, f64)>> = RwSignal::new(None);
    // Input bubble: (command to commit, prompt label).
    let input_prompt: RwSignal<Option<(PendingCommand, String)>> = RwSignal::new(None);
    let input_value: RwSignal<String> = RwSignal::new(String::new());

    // Per-actor visual assets fetched from DID documents (`ma.sprites`).
    let sprite_assets: RwSignal<HashMap<String, SpriteAsset>> = RwSignal::new(HashMap::new());
    // Which way each wandering agent is facing (drives the sprite-sheet row).
    let facing: RwSignal<HashMap<String, Facing>> = RwSignal::new(HashMap::new());
    // Global walk-frame toggle: true → column 1, false → column 3.
    let walk_tick: RwSignal<bool> = RwSignal::new(false);

    // Send a command through the same dispatch path as the terminal.
    let send = {
        let state = state.clone();
        move |line: String| state.input_queue.update(|q| q.push_back(line))
    };

    // ── Room refresh loop ───────────────────────────────────────────────────
    {
        let state = state.clone();
        spawn_local(async move {
            loop {
                fetch_room(
                    &state,
                    config,
                    placed,
                    positions,
                    room_name,
                    room_description,
                )
                .await;
                TimeoutFuture::new(2000).await;
            }
        });
    }

    // ── Sprite/favicon fetch loop ──────────────────────────────────────────
    {
        spawn_local(async move {
            loop {
                let pending: Vec<String> = placed
                    .get_untracked()
                    .iter()
                    .map(|p| p.entity.actor.clone())
                    .filter(|actor| !sprite_assets.get_untracked().contains_key(actor))
                    .collect();
                for actor in pending {
                    let bare = actor.split('#').next().unwrap_or(&actor).to_string();
                    // Only cache a resolved document. A transient DID-resolution
                    // failure returns `None`, leaving the actor out of the cache so
                    // the next loop retries instead of pinning the generic emoji.
                    if let Some(asset) = resolve_sprite_asset(&bare).await {
                        sprite_assets.update(|m| {
                            m.insert(actor, asset);
                        });
                    }
                }
                TimeoutFuture::new(2_000).await;
            }
        });
    }

    // ── Consume incoming presentation events ────────────────────────────────
    // Drawn from a plain drain loop rather than a reactive `Effect`. The queue
    // is written from the inbox poll loop (`route_topdown_event`) and would, if
    // consumed inside an `Effect` that also clears it, re-trigger itself and
    // overflow the WASM stack. This matches how `input_queue`/`outbox_queue`
    // are consumed elsewhere.
    {
        spawn_local(async move {
            loop {
                let events: Vec<TopdownEvent> = state
                    .topdown_events
                    .update_untracked(|queue| queue.drain(..).collect());
                if !events.is_empty() {
                    let now = now_ms();
                    let mut new_bubbles = Vec::new();
                    let mut new_subtitles = Vec::new();
                    for event in events {
                        match event {
                            TopdownEvent::Say {
                                speaker,
                                name,
                                text,
                            } => {
                                new_bubbles.push((
                                    speaker,
                                    format!("{name}: {text}"),
                                    now + 5000.0,
                                ));
                            }
                            TopdownEvent::Emote {
                                speaker,
                                name,
                                text,
                            } => {
                                new_bubbles.push((speaker, format!("{name} {text}"), now + 5000.0));
                            }
                            TopdownEvent::Narrate { text } => {
                                new_subtitles.push((text, now + 5000.0));
                            }
                        }
                    }
                    bubbles.update(|b| b.extend(new_bubbles));
                    subtitles.update(|s| s.extend(new_subtitles));
                }
                TimeoutFuture::new(100).await;
            }
        });
    }

    // ── Agent wander + bubble/subtitle pruning ──────────────────────────────
    {
        let interval = Interval::new(400, move || {
            let agents: Vec<String> = placed
                .get_untracked()
                .iter()
                .filter(|p| p.entity.is_agent() && !p.is_self)
                .map(|p| p.entity.actor.clone())
                .collect();
            let mut moved: Vec<(String, Facing)> = Vec::new();
            positions.update(|pos| {
                for actor in &agents {
                    if let Some(p) = pos.get_mut(actor) {
                        let dx = (js_sys::Math::random() - 0.5) * 0.05;
                        let dy = (js_sys::Math::random() - 0.5) * 0.05;
                        p.0 = (p.0 + dx).clamp(0.06, 0.94);
                        p.1 = (p.1 + dy).clamp(0.10, 0.86);
                        moved.push((actor.clone(), Facing::from_delta(dx, dy)));
                    }
                }
            });
            facing.update(|f| {
                for (actor, dir) in moved {
                    f.insert(actor, dir);
                }
            });
            walk_tick.update(|t| *t = !*t);
            let now = now_ms();
            bubbles.update(|b| b.retain(|(_, _, exp)| *exp > now));
            subtitles.update(|s| s.retain(|(_, exp)| *exp > now));
        });
        interval.forget();
    }

    // ── Helpers ─────────────────────────────────────────────────────────────
    let show_bubble = {
        move |actor: String, text: String| {
            let now = now_ms();
            bubbles.update(|b| b.push((actor, text, now + 5000.0)));
        }
    };

    let open_input = {
        move |command: PendingCommand, label: String| {
            input_value.set(String::new());
            input_prompt.set(Some((command, label)));
        }
    };

    let commit_input = {
        move || {
            let Some((command, _)) = input_prompt.get_untracked() else {
                return;
            };
            let text = input_value.get_untracked();
            if !text.trim().is_empty() {
                send(command_for(&command, &text));
            }
            input_prompt.set(None);
            input_value.set(String::new());
        }
    };

    let close_menu = { move || menu.set(None) };

    // Switch back to the text view.
    let switch_to_zion = {
        let state = state.clone();
        move || {
            config.update(|c| c.set(".my.config.view", "zion"));
            if let Some(session) = state.session.get_untracked() {
                let username = session.username.clone();
                let snapshot = config.get_untracked();
                spawn_local(async move {
                    let _ = crate::config::persist_config(&username, &snapshot).await;
                });
            }
        }
    };

    view! {
        <div class="topdown-root">
            <header class="topdown-hud">
                <span class="topdown-room-name">{move || room_name.get()}</span>
                <button class="topdown-toggle" on:click=move |_| switch_to_zion()>
                    {crate::i18n::t("topdown-switch-to-terminal")}
                </button>
            </header>

            <div class="topdown-playfield">
                <For
                    each=move || placed.get()
                    key=|p| p.entity.actor.clone()
                    children=move |p| {
                        let entity = p.entity;
                        let is_self = p.is_self;
                        let actor = entity.actor.clone();
                        let label = entity.label().to_string();
                        let emoji = kind_emoji(&entity, is_self);


                        let on_click = {
                            let entity = entity.clone();
                            move |_: MouseEvent| {
                                if is_self {
                                    open_input(PendingCommand::Say, crate::i18n::t("topdown-say"));
                                } else if entity.is_exit() {
                                    show_bubble(entity.actor.clone(), entity.label().to_string());
                                } else {
                                    let text = if entity.description.is_empty() {
                                        entity.label().to_string()
                                    } else {
                                        format!("{}\n{}", entity.label(), entity.description)
                                    };
                                    show_bubble(entity.actor.clone(), text);
                                }
                            }
                        };

                        let on_dblclick = {
                            let entity = entity.clone();
                            move |_: MouseEvent| {
                                if entity.is_exit() {
                                    let direction = entity
                                        .direction
                                        .clone()
                                        .unwrap_or_else(|| entity.label().to_string());
                                    send(format!("go \"{direction}\""));
                                } else {
                                    open_input(PendingCommand::Emote, crate::i18n::t("topdown-emote"));
                                }
                            }
                        };

                        let on_contextmenu = {
                            let entity = entity.clone();
                            move |ev: MouseEvent| {
                                ev.prevent_default();
                                menu.set(Some((entity.clone(), f64::from(ev.client_x()), f64::from(ev.client_y()))));
                            }
                        };

                        let visual = {
                            let actor = actor.clone();
                            let entity = entity.clone();
                            move || {
                                let asset = sprite_assets
                                    .get()
                                    .get(&actor)
                                    .cloned()
                                    .unwrap_or_default();
                                if let Some(sheet) = asset.sheet {
                                    let row = facing
                                        .get()
                                        .get(&actor)
                                        .copied()
                                        .map_or(0, Facing::row);
                                    let walking = entity.is_agent() && !is_self;
                                    let col = sprite_column(walking, walk_tick.get());
                                    let position = sprite_position(row, col);
                                    view! {
                                        <span
                                            class="topdown-sprite"
                                            style=format!("background-image:url(\"{sheet}\");background-position:{position};")
                                        ></span>
                                    }
                                    .into_any()
                                } else if let Some(favicon) = asset.favicon {
                                    view! { <img class="topdown-sprite topdown-favicon" src=favicon alt=""/> }
                                        .into_any()
                                } else {
                                    view! { <span class="topdown-entity-emoji">{emoji}</span> }
                                        .into_any()
                                }
                            }
                        };

                        view! {
                            <div
                                class="topdown-entity"
                                class:topdown-self=is_self
                                style=move || {
                                    let pos = positions.get().get(&actor).copied().unwrap_or((0.5, 0.5));
                                    format!("left:{}%; top:{}%", pos.0 * 100.0, pos.1 * 100.0)
                                }
                                on:click=on_click
                                on:dblclick=on_dblclick
                                on:contextmenu=on_contextmenu
                            >
                                {visual}
                                <span class="topdown-entity-label">{label}</span>
                            </div>
                        }
                    }
                />

                // Speech / emote bubbles.
                {move || {
                    bubbles.get().into_iter().map(|(actor, text, _)| {
                        let a = actor;
                        view! {
                            <div
                                class="topdown-bubble"
                                style=move || {
                                    let pos = positions.get().get(&a).copied().unwrap_or((0.5, 0.5));
                                    format!("left:{}%; top:{}%", pos.0 * 100.0, pos.1 * 100.0)
                                }
                            >
                                {text}
                            </div>
                        }
                    }).collect_view()
                }}
            </div>

            <div class="topdown-subtitles">
                {move || {
                    subtitles.get().into_iter().map(|(text, _)| {
                        view! { <p class="topdown-subtitle">{text}</p> }
                    }).collect_view()
                }}
            </div>

            {move || {
                let Some((entity, x, y)) = menu.get() else {
                    return ().into_any();
                };
                let actor = entity.actor.clone();
                let label = entity.label().to_string();
                let description = entity.description.clone();
                let direction = entity.direction.clone();
                let is_exit = entity.is_exit();


                view! {
                    <div class="topdown-menu" style=format!("left:{x}px; top:{y}px")>
                        <button on:click={
                            let actor = actor.clone();
                            let label = label.clone();
                            move |_: MouseEvent| {
                                close_menu();
                                open_input(PendingCommand::SayTo { actor: actor.clone() }, format!("Say to {label}"));
                            }
                        }>{crate::i18n::t("topdown-menu-say")}</button>

                        <button on:click={
                            let actor = actor.clone();
                            let label = label.clone();
                            move |_: MouseEvent| {
                                close_menu();
                                open_input(PendingCommand::EmoteTo { actor: actor.clone() }, format!("Emote {label}"));
                            }
                        }>{crate::i18n::t("topdown-menu-emote")}</button>

                        <button on:click={
                            let actor = actor.clone();
                            let label = label.clone();
                            let description = description.clone();
                            move |_: MouseEvent| {
                                let text = if description.is_empty() { label.clone() } else { format!("{label}\n{description}") };
                                close_menu();
                                show_bubble(actor.clone(), text);
                            }
                        }>{crate::i18n::t("topdown-menu-look")}</button>

                        {if is_exit {
                            let direction = direction.clone().unwrap_or_else(|| label.clone());
                            view! {
                                <button on:click=move |_: MouseEvent| {
                                    close_menu();
                                    send(format!("go \"{direction}\""));
                                }>{crate::i18n::t("topdown-menu-go")}</button>
                            }.into_any()
                        } else {
                            ().into_any()
                        }}
                    </div>
                }.into_any()
            }}

            <Show when=move || input_prompt.get().is_some() fallback=|| ()>
                <div class="topdown-input-bubble">
                    <span class="topdown-input-label">
                        {move || input_prompt.get().map(|(_, label)| label).unwrap_or_default()}
                    </span>
                    <input
                        type="text"
                        class="topdown-input-field"
                        prop:value=move || input_value.get()
                        on:input=move |ev: web_sys::Event| {
                            if let Some(input) = ev.target().and_then(|t| t.dyn_into::<HtmlInputElement>().ok()) {
                                input_value.set(input.value());
                            }
                        }
                        on:keydown=move |ev: KeyboardEvent| {
                            let key = js_sys::Reflect::get(&ev, &wasm_bindgen::JsValue::from_str("key"))
                                .ok()
                                .and_then(|v| v.as_string())
                                .unwrap_or_default();
                            if key == "Enter" {
                                commit_input();
                            }
                        }
                    />
                </div>
            </Show>
        </div>
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Build a minimal ICO whose directory references the supplied frames.
    /// `(width, height, payload)`; a `0` width/height encodes 256 px.
    fn build_ico(entries: &[(u8, u8, &[u8])]) -> Vec<u8> {
        let count = entries.len() as u16;
        let dir_size = 6 + entries.len() * 16;
        let mut bytes = vec![0u8; dir_size];
        bytes[0..4].copy_from_slice(ICO_MAGIC);
        bytes[4..6].copy_from_slice(&count.to_le_bytes());

        let mut data = Vec::new();
        let mut offset = dir_size as u32;
        for (index, (width, height, payload)) in entries.iter().enumerate() {
            let entry = 6 + index * 16;
            bytes[entry] = *width;
            bytes[entry + 1] = *height;
            // planes = 1, bit count = 32 (values are irrelevant to frame selection).
            bytes[entry + 4..entry + 6].copy_from_slice(&1u16.to_le_bytes());
            bytes[entry + 6..entry + 8].copy_from_slice(&32u16.to_le_bytes());
            bytes[entry + 8..entry + 12].copy_from_slice(&(payload.len() as u32).to_le_bytes());
            bytes[entry + 12..entry + 16].copy_from_slice(&offset.to_le_bytes());
            data.extend_from_slice(payload);
            offset += payload.len() as u32;
        }
        bytes.extend_from_slice(&data);
        bytes
    }

    #[test]
    fn is_png_checks_magic_bytes() {
        assert!(is_png(b"\x89PNG\r\n\x1a\nrest"));
        assert!(!is_png(b"\x89PNG\r\n"));
        assert!(!is_png(b"GIF89a"));
    }

    #[test]
    fn best_ico_frame_picks_closest_size() {
        let ico = build_ico(&[(16, 16, b"16px"), (32, 32, b"32px"), (48, 48, b"48px")]);
        assert_eq!(best_ico_frame(&ico, 32).unwrap(), b"32px");
    }

    #[test]
    fn best_ico_frame_prefers_larger_on_tie() {
        let ico = build_ico(&[(16, 16, b"16px"), (48, 48, b"48px")]);
        assert_eq!(best_ico_frame(&ico, 32).unwrap(), b"48px");
    }

    #[test]
    fn best_ico_frame_treats_zero_as_256() {
        let ico = build_ico(&[(16, 16, b"16px"), (0, 0, b"256px")]);
        assert_eq!(best_ico_frame(&ico, 256).unwrap(), b"256px");
    }

    #[test]
    fn best_ico_frame_rejects_non_ico() {
        assert!(best_ico_frame(b"not an ico", 32).is_none());
    }

    #[test]
    fn favicon_embeds_png_frame_directly() {
        let ico = build_ico(&[
            (16, 16, b"\x89PNG\r\n\x1a\nsmall"),
            (32, 32, b"\x89PNG\r\n\x1a\nbest"),
            (48, 48, b"\x89PNG\r\n\x1a\nbig"),
        ]);
        let url = favicon_data_url(&ico).unwrap();
        let encoded = url.strip_prefix("data:image/png;base64,").unwrap();
        use base64::Engine as _;
        let decoded = base64::engine::general_purpose::STANDARD
            .decode(encoded)
            .unwrap();
        assert_eq!(decoded, b"\x89PNG\r\n\x1a\nbest");
    }

    #[test]
    fn favicon_falls_back_to_whole_ico_for_non_png_frames() {
        let ico = build_ico(&[(16, 16, b"bmp16"), (32, 32, b"bmp32")]);
        let url = favicon_data_url(&ico).unwrap();
        assert!(url.starts_with("data:image/x-icon;base64,"));
    }
}
