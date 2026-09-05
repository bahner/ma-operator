# LIVE in operator

This document explains the current live model in operator and how to use it safely.

The short version:
- MA messaging is used for invitation and control.
- `/ma/live/0.0.1` is the live signalling service surface.
- Browser media (camera, microphone, rendering) stays in operator host code, not in zscheme.
- User-friendly workflow functions live in `live.szcheme` and are imported by you.

## TL;DR quickstart (laptop + phone self-call)

Use this when you want to test your next step quickly.

1. Open operator on both devices.
- Laptop: one tab/session.
- Phone: one tab/session.

2. Log in with two identities.
- Use two different local identities (for example `me-laptop` and `me-phone`).

3. Ensure both are connected and published.
- Run `.ma` on each side.
- Publish identity if needed with `.my.identity!publish @ma`.

4. Exchange DIDs and create aliases.
- On laptop, store phone DID as alias:

```text
.my.aliases.phone: did:ma:...
```

- On phone, store laptop DID as alias:

```text
.my.aliases.laptop: did:ma:...
```

5. Dial over the live signalling service.
- From laptop:

```text
.ma.live!dial @phone self-test
```

- You should see live-tagged output (`[live]`) when signalling messages arrive.

6. Optional: exercise your imported `live.szcheme` sugar.
- Example shape (assuming your profile pack defines these):

```scheme
(define s (ok-val (live-open "did:ma:...")))
(define v (ok-val (stream-open s "video")))
(define a (ok-val (stream-open s "audio")))
```

7. Close what you opened.

```scheme
(stream-close v)
(stream-close a)
(live-close s)
```

Important for this phase:
- This validates signalling and control flow.
- It does not yet validate full camera/microphone media transport end-to-end.

## Design boundaries

Live has two layers:

1. Native primitives (Rust, operator host)
- These are the parts that cannot be implemented from inside zscheme.
- Transport registration for `/ma/live/0.0.1`.
- Sending a live dial message to a target DID.
- Draining and displaying incoming live service messages.

2. User workflow (zscheme profile pack)
- Session and stream handles.
- Convenience sugar such as `live-call`, `live-enable`, and `live-disable`.
- Project-specific UX helpers.

This split is intentional. zscheme should orchestrate flow, not own browser devices.

## What is native today

The current native live baseline in operator is:
- `LIVE_PROTOCOL_ID = "/ma/live/0.0.1"`
- `.ma.live!dial @peer [label]` sends a live dial message
- incoming live-service messages are tagged as `[live]` in output

These are foundational primitives for signalling only.

## What `live.szcheme` is for

`live.szcheme` is the profile pack where you define and evolve the user-facing API.

You can keep adding sugar there without changing Rust code, for example:
- session helpers (`live-open`, `live-close`)
- stream helpers (`stream-open`, `stream-close`)
- higher-level call flows (`live-call`)

This keeps native responsibilities minimal and stable.

## Recommended mental model

Think in terms of:
- Session handle: one call context with a peer
- Stream handle: one channel in that session (`video`, `audio`, `text`, `image`, `data`)

A session may own multiple streams.
Streams can be opened/closed independently.

That gives you composability:
- start session once
- toggle video on/off
- keep text channel alive
- add more channels later without redesigning the call model

## Example flow

Signalling first:

```text
.ma.live!dial @alice hello
```

Then user-level flow from your imported `live.szcheme` functions:

```scheme
(define s (ok-val (live-open "did:ma:alice")))
(define v (ok-val (stream-open s "video")))
(define a (ok-val (stream-open s "audio")))
(define t (ok-val (stream-open s "text")))

(stream-close t)
(live-close s)
```

## Current non-goals

At this stage, live does not yet provide:
- direct camera/microphone capture controls in zscheme
- media encoding/decoding controls in zscheme
- built-in conference policy

Those belong in host/UI/media integration layers.

## Practical guidance

- Keep Rust/native additions limited to true host primitives.
- Keep workflow sugar in `live.szcheme`.
- Prefer opaque handles over exposing transport internals.
- Use `(:ok ...)`, `(:error ...)`, and `(:timeout)` tuples consistently in your zscheme wrappers.

## Status

This is experimental and intentionally minimal.
The goal is a stable primitive base in operator plus fast iteration in `live.szcheme`.
