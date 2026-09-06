//! Ephemeral topdown presentation model.
//!
//! Pure projection of the zscheme room snapshot (`look`) and the incoming
//! event stream. Cosmetic only: never persisted, never sent on the wire.

use std::collections::BTreeMap;

use leptos::prelude::Update;
use ma_zscheme::SchemeVal;

use crate::messages::IncomingMessage;
use crate::state::AppState;

/// The room broadcast content type carrying `:say`/`:emote` display events.
const ROOM_EVENT_CONTENT_TYPE: &str = "application/vnd.ma.room.event";

/// A renderable entity in the current room.
#[derive(Clone, Debug, PartialEq)]
pub struct TopdownEntity {
    /// Stable actor address (`did:ma:…` or `@ma#fragment`) used as the render key.
    pub actor: String,
    pub kind: String,
    pub name: String,
    pub nick: String,
    pub description: String,
    /// Exit-specific direction keyword used by the `go` verb.
    pub direction: Option<String>,
}

impl TopdownEntity {
    /// Preferred display label: nick → name → actor.
    pub fn label(&self) -> &str {
        if !self.nick.is_empty() {
            &self.nick
        } else if !self.name.is_empty() {
            &self.name
        } else {
            &self.actor
        }
    }

    pub fn is_exit(&self) -> bool {
        self.kind == "exit"
    }

    pub fn is_agent(&self) -> bool {
        self.kind == "agent"
    }
}

/// A parsed `look` snapshot.
#[derive(Clone, Debug, PartialEq)]
pub struct RoomSnapshot {
    pub name: String,
    pub description: String,
    pub entities: Vec<TopdownEntity>,
}

/// Transient presentation events consumed by the topdown view.
#[derive(Clone, Debug, PartialEq)]
pub enum TopdownEvent {
    Say {
        speaker: String,
        name: String,
        text: String,
    },
    Emote {
        speaker: String,
        name: String,
        text: String,
    },
    Narrate {
        text: String,
    },
}

fn scheme_str(value: &SchemeVal) -> Option<&str> {
    match value {
        SchemeVal::Str(s) => Some(s.as_str()),
        _ => None,
    }
}

fn map_str(map: &BTreeMap<String, SchemeVal>, key: &str) -> String {
    map.get(key)
        .and_then(scheme_str)
        .unwrap_or_default()
        .to_string()
}

/// Parse a `:look` reply (`SchemeVal::Map`) into a room snapshot.
pub fn parse_room_look(value: &SchemeVal) -> Option<RoomSnapshot> {
    let SchemeVal::Map(room) = value else {
        return None;
    };
    let name = map_str(room, "name");
    let description = map_str(room, "description");
    let mut entities = Vec::new();
    if let Some(SchemeVal::Map(children)) = room.get("children") {
        for (key, child) in children {
            let SchemeVal::Map(entry) = child else {
                continue;
            };
            let actor = map_str(entry, "actor");
            let actor = if actor.is_empty() { key.clone() } else { actor };
            entities.push(TopdownEntity {
                actor,
                kind: map_str(entry, "kind"),
                name: map_str(entry, "name"),
                nick: map_str(entry, "nick"),
                description: map_str(entry, "description"),
                direction: entry
                    .get("direction")
                    .and_then(scheme_str)
                    .map(str::to_string),
            });
        }
    }
    Some(RoomSnapshot {
        name,
        description,
        entities,
    })
}

/// Additive presentation tap: inspect an incoming message and, when it carries
/// a speak/emote/narrate term, append a `TopdownEvent`. Never filters or consumes.
pub fn route_topdown_event(incoming: &IncomingMessage, state: &AppState) {
    let event = if incoming.content_type == ROOM_EVENT_CONTENT_TYPE {
        parse_room_event(&incoming.content)
    } else if incoming.content_type == ma_core::CONTENT_TYPE_TERM && incoming.reply_to.is_none() {
        parse_term_event(&incoming.content)
    } else {
        None
    };
    if let Some(event) = event {
        state.topdown_events.update(|queue| {
            queue.push_back(event);
            while queue.len() > 200 {
                queue.pop_front();
            }
        });
    }
}

/// `application/vnd.ma.room.event` → `[:verb, avatar_id, name_or_null, ...args]`.
fn parse_room_event(content: &[u8]) -> Option<TopdownEvent> {
    use ciborium::Value as V;
    let V::Array(items) = ciborium::de::from_reader::<V, _>(content).ok()? else {
        return None;
    };
    let text_at = |i: usize| -> String {
        items
            .get(i)
            .and_then(|v| match v {
                V::Text(s) => Some(s.clone()),
                _ => None,
            })
            .unwrap_or_default()
    };
    let verb = text_at(0);
    let speaker = text_at(1);
    let name = {
        let raw = text_at(2);
        if raw.is_empty() {
            speaker.clone()
        } else {
            raw
        }
    };
    match verb.as_str() {
        ":say" => Some(TopdownEvent::Say {
            speaker,
            name,
            text: text_at(3),
        }),
        ":emote" => Some(TopdownEvent::Emote {
            speaker,
            name,
            text: text_at(3),
        }),
        _ => None,
    }
}

/// `CONTENT_TYPE_TERM` → `[:event, :say, ctx, text]`,
/// `[:event, :emote, ctx, text]`, or `[:event, :narrate, text]`. Legacy
/// unwrapped terms (`[:say, ctx, text]`, `[:narrate, text]`) are still accepted
/// for runtimes that predate the `:event` envelope.
fn parse_term_event(content: &[u8]) -> Option<TopdownEvent> {
    use ciborium::Value as V;
    let V::Array(items) = ciborium::de::from_reader::<V, _>(content).ok()? else {
        return None;
    };
    let text = |i: usize| -> String {
        items
            .get(i)
            .and_then(|v| match v {
                V::Text(s) => Some(s.clone()),
                _ => None,
            })
            .unwrap_or_default()
    };
    // Room broadcasts travel in a single :event envelope; the inner name is the
    // second element and every following argument shifts one position right.
    let offset = usize::from(text(0) == ":event");
    let verb = text(offset);
    match verb.as_str() {
        ":narrate" => Some(TopdownEvent::Narrate {
            text: text(1 + offset),
        }),
        ":say" | ":emote" => {
            let speaker = items.get(1 + offset).map(ctx_actor).unwrap_or_default();
            let name = items
                .get(1 + offset)
                .and_then(ctx_name)
                .unwrap_or_else(|| speaker.clone());
            if verb == ":say" {
                Some(TopdownEvent::Say {
                    speaker,
                    name,
                    text: text(2 + offset),
                })
            } else {
                Some(TopdownEvent::Emote {
                    speaker,
                    name,
                    text: text(2 + offset),
                })
            }
        }
        _ => None,
    }
}

fn ctx_actor(value: &ciborium::Value) -> String {
    ctx_text(value, &["actor", "did"])
}

fn ctx_name(value: &ciborium::Value) -> Option<String> {
    let found = ctx_text(value, &["nick", "name"]);
    (!found.is_empty()).then_some(found)
}

fn ctx_text(value: &ciborium::Value, keys: &[&str]) -> String {
    use ciborium::Value as V;
    let V::Map(entries) = value else {
        return String::new();
    };
    for key in keys {
        for (k, v) in entries {
            if let V::Text(k) = k {
                if k == *key {
                    if let V::Text(s) = v {
                        return s.clone();
                    }
                }
            }
        }
    }
    String::new()
}
