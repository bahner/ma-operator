# LIVEPLAN

This file is the current working plan for live support in zion.
It is written to be moved to another machine without needing conversation context.

## Goal

The next practical goal is simple:
- run zion on a laptop and a phone
- log in as two identities
- dial yourself over the live signalling service
- verify signalling and control flow before full media transport

This phase is about proving the control plane, not shipping camera/microphone transport yet.

## Core decision

Live in zion is split into two layers.

1. Native primitives in Rust
- These are the parts that cannot be implemented from inside zscheme.
- They live in zion host/transport code.
- They cover transport registration, sending live signalling messages, and receiving them.

2. User workflow in `live.szcheme`
- This is where user-friendly session/stream sugar belongs.
- It is imported by the user into profile scripts such as `.my.z.live`.
- It should not be hard-coded into Rust.

This split is intentional.
Scheme should orchestrate flow.
The browser host should own media devices, transport plumbing, and rendering integration.

## What belongs in Rust

Rust-side live support should stay minimal and foundational.

Current native primitives:
- register `/ma/live/0.0.1` on the local iroh endpoint
- store and drain a dedicated live inbox
- send a live signalling message to a peer DID
- expose a direct terminal path for signalling: `.ma.live!dial @peer [label]`
- mark inbound live service messages as `[live]` in terminal output

Rust should add more only when the feature cannot be built from zscheme alone.
Examples of acceptable future Rust additions:
- explicit live reply/accept/reject primitive on the live service
- host-managed session IDs for real media sessions
- camera/microphone/screen handles
- media publish/subscribe bindings to browser APIs and MoQ transport

## What does not belong in Rust

These should stay in `live.szcheme` or user profile code unless proven impossible:
- `live-call`
- `live-open`
- `stream-open`
- `live-enable`
- `live-disable`
- session/stream sugar helpers
- per-user workflow wrappers

The rule is simple:
if it can be expressed as ordinary zscheme over existing primitives, it should not be hard-coded into Rust.

## Current code status

The current live baseline in zion is signalling-only.

Implemented in Rust:
- `LIVE_PROTOCOL_ID = "/ma/live/0.0.1"`
- dedicated live inbox registration during connect
- dedicated live inbox cleanup during disconnect
- `send_live_dial(target_did, body)`
- `.ma.live!dial @peer [label]`
- `[live]` display prefix for incoming live messages

Not implemented yet:
- live accept/reject handshake model
- real session identity on the wire
- stream open/close protocol
- media publish/subscribe transport
- camera/microphone integration
- UI binding for remote/local tracks

## Mental model going forward

The system should be built around:
- one live session handle per call
- multiple stream handles under that session

A session may contain streams such as:
- video
- audio
- text
- image
- data
- control

This means:
- start a session once
- open or close channels independently
- keep the architecture extensible for multiple simultaneous tracks

## Immediate testing goal

Use two devices to test signalling.

### Device setup

1. Start zion on laptop.
2. Start zion on phone.
3. Log in as two different local identities.
4. Run `.ma` on both sides.
5. Publish identities if needed with `.my.identity!publish @ma`.
6. Exchange DIDs and create aliases.

### Dial test

On laptop:

```text
.ma.live!dial @phone self-test
```

Expected outcome:
- the dial command sends on `/ma/live/0.0.1`
- the phone receives a `[live]` message in terminal output
- alias substitution still works in display

This is enough to validate the current primitive base.

## Role of `live.szcheme`

`live.szcheme` is the user-owned profile pack.
It should define the higher-level vocabulary that feels pleasant to use.

Examples of functions that belong there:
- `live-call`
- `live-open`
- `live-close`
- `stream-open`
- `stream-close`
- `stream-state`
- `live-enable`
- `live-disable`

Those functions may keep local session/stream maps in Scheme until a real host-backed session layer exists.

## Next implementation steps

### Step 1: confirm self-call signalling
- test laptop -> phone with `.ma.live!dial`
- confirm the phone sees `[live]` messages
- confirm both identities are reachable and published

### Step 2: define the live reply model
Add a minimal signalling contract for:
- invite
- accept
- reject
- hangup

This can still be plain live-service messages, but the message shapes need to be fixed.

### Step 3: define session identity
Introduce a real session token or session ID so both peers refer to the same call.
This is needed before real stream management becomes meaningful.

### Step 4: define stream identity
Add explicit stream IDs and kinds under a session:
- session id
- stream id
- kind
- state

### Step 5: connect browser media to sessions
Host-side only:
- camera source
- microphone source
- screen source
- remote render target binding

### Step 6: integrate actual media transport
Keep MA out of the media plane.
Use live signalling only for setup and control.
Actual media should run below MA, likely via iroh/MoQ-style transport.

## Non-goals for this phase

Do not do these yet:
- move the live transport into `rust-ma-core`
- hard-code workflow sugar into Rust
- expose raw browser media APIs directly in zscheme
- design conference policy before 1:1 signalling is solid

## Summary

The current direction is:
- zion-only live implementation
- MA messaging only for signalling/control
- `/ma/live/0.0.1` as the local control surface
- user sugar in `live.szcheme`
- native Rust only for the primitives zscheme cannot provide

The next real milestone is a successful self-call signalling test between laptop and phone.
