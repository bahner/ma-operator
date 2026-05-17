# ma-agent — AI Agent Reference

`ego` is a browser-based actor workstation compiled to WASM.
Each tab is one `did:ma:` identity. There is no backend — all state
lives in IndexedDB and all networking goes over iroh QUIC transport
provided by `ma-core`.

---

## Stack

| Layer | Technology |
|-------|-----------|
| UI framework | Leptos 0.8 (CSR, signals) |
| Language | Rust → `wasm32-unknown-unknown` |
| Build tool | Trunk |
| Persistent store | IndexedDB via `web-sys` (through `EgoConfig`) |
| Editor | CodeMirror 6 via CDN shim (`www/editor.js`) |
| Transport | iroh QUIC (`ma-core` feature `iroh`) |
| Identity | `did:ma:` — IPNS-rooted DIDs via `ma-core` |
| Crypto | Ed25519 signing, X25519 encryption (inside `SecretBundle`) |

---

## Codebase map

```
src/
  main.rs               — WASM entry, panic hook, Leptos mount
  app.rs                — top-level component; routes Landing ↔ Terminal
  state.rs              — AppState (RwSignal tree), ingest_mailbox_message
  config/
    mod.rs              — EgoConfig: flat HashMap<String,String>, IndexedDB CRUD
  identity/
    mod.rs              — IdentityState, SessionState
    export.rs           — bundle export / import helpers
    storage.rs          — SecretBundle ↔ IndexedDB helpers
  mailbox/
    mod.rs              — inbox helpers: next_inbox_index, ingest_to_config,
                          prune_inbox_expired, is_link_value, extract_links
  messages/
    mod.rs              — IncomingMessage, build_message helpers
  parser/
    mod.rs              — top-level parse: DotOp | Send | Rpc | Escape
    alias.rs            — alias expansion + \@ escape
    command.rs          — DotOp parser (get / set / delete / verb)
    verbs.rs            — dispatch_verb: all .path:verb implementations
  transport/
    mod.rs              — re-exports
    connection.rs       — connect/disconnect, inbox poll loop,
                          send_message, send_rpc, send_text_reply
  views/
    mod.rs
    landing.rs          — identity creation, bundle import/export, login
    terminal.rs         — main REPL: input, output, DotOp dispatch,
                          lazy DID/CID traversal, HELP_TEXT
    input.rs            — readline input component
    editor.rs           — CodeMirror 6 modal (Standard / View / Reply modes)
    screensaver.rs      — idle screensaver
  core/
    commands.rs         — command constants
    entries.rs          — terminal entry types (System, Error, Sent, Received…)
    mod.rs
www/
  editor.js             — CodeMirror 6 shim; exposes window.maEditor
style/
  ego.css
index.html
Trunk.toml
Makefile
```

---

## Implemented features

- [x] Identity creation — generates `SecretBundle` (4 × 32-byte keys),
      encrypted with user passphrase, stored in IndexedDB under `username`
- [x] Bundle export / import (encrypted, username travels with it)
- [x] Multi-identity support — different users in different browser tabs
- [x] Terminal REPL — readline input, scrolling output, history
- [x] Dot-command grammar (see below)
- [x] `.my.identity.*` — read-only DID + public keys
- [x] `.my.aliases.*` — full CRUD via dot grammar
- [x] `.my.inbox.*` — persistent inbox, prune expired on login
- [x] `.my.documents.*` — edit / eval / publish / fetch / cid verbs
- [x] `.config.*` — full CRUD configuration tree
- [x] Editor — CodeMirror 6, modes: Standard / View / Reply
- [x] Transport — iroh QUIC connect, inbox + RPC poll loop (500 ms)
- [x] Send text message (`@target body`)
- [x] Send RPC verb (`@target:verb [args]`)
- [x] Send reply (`.my.inbox.N:reply [body]`)
- [x] Lazy DID / CID traversal (`.my.inbox.N.sender.created_at`)
- [x] `doc_cache` — in-memory JSON cache for traversal results
- [x] `.my.間:discover` — probes localhost:5003, creates `@間` alias, persists config

## Pending / not yet implemented

- [ ] `.use @actor [as @alias]` focus mode — pre-fills prompt
- [ ] Alias colour rendering in input field
- [ ] Function-call syntax `@actor:verb()` — async RPC with value substitution
- [ ] `.my.documents.<name>:publish` — `application/x-ma-ipfs-store` protocol
- [ ] `.my.home` — default actor context

---

## Dot-command grammar

| Syntax | Meaning |
|--------|---------|
| `.path` | get — print leaf value or subtree listing |
| `.path query` | filter — subtree listing matching `query` |
| `.path: value` | set leaf |
| `.path:` | delete subtree (or leaf) |
| `.path:verb [args]` | local verb dispatch |

**Rules:**
- Read-only keys enforced in `EgoConfig::is_read_only()`.
  Currently: anything under `.my.identity.*`.
- A key cannot be both a leaf and a parent node simultaneously.
- Verbs dispatch to `parser/verbs.rs::dispatch_verb`.

---

## Alias rules

- Stored at `.my.aliases.<name>` — bare DID only, no fragment.
- CRUD via generic dot grammar (`.my.aliases.fjodor: did:ma:…` / `.my.aliases.fjodor:`).
- `@name` in a command expands to the stored DID.
  Fragment can be appended: `@name#fragment` → `did:ma:…#fragment`.
- `\@name` escapes expansion — literal `@name` text in output.
- Unknown `@name` that is not itself a DID is a hard error.
- Only leaf aliases expand; subtree-only paths are an error.

---

## Identity & session keys

Four 32-byte keys per identity, stored in `SecretBundle`:

| Thread-local | Purpose |
|--------------|---------|
| `SESSION_IROH_KEY` | iroh QUIC transport keypair |
| `SESSION_IPNS_KEY` | IPNS root → `did:ma:<base58>` |
| `SESSION_SIGNING_KEY` | Ed25519 `#sign` verification method |
| `SESSION_ENCRYPTION_KEY` | X25519 `#enc` key agreement |

`did_encryption_key` must always be included in `SessionState` —
it is needed to decrypt incoming messages.

---

## `.my.間` — local ma runtime

`.my.間` is the config subtree for the user's local 間 runtime (`ma` daemon).
It is set once via `:discover` and then used as the publish target.

Leaves written by `:discover`:
```
.my.間.did          DID of the local ma runtime
.my.間.endpoint_id  iroh endpoint ID (from status.json)
```
The alias `.my.aliases.間` is also created, pointing to `.my.間.did`.

Verb:
- `.my.間:discover` — hits `http://localhost:5003/status.json`, reads `did`
  and `endpoint_id`, writes the above leaves, creates alias `@間`, persists config.
  Reports an actionable error if `ma` is not running.

After discovery:
```
.my.identity:publish @間
```

Prerequisites for publish to work:
1. [IPFS Desktop](https://docs.ipfs.tech/install/ipfs-desktop/) — provides Kubo
2. `ma` runtime running — bridges ego → Kubo

---

## Inbox — `.my.inbox.*`

Leaves per message (index `N` = next available integer, gaps are OK):

```
.my.inbox.N.from          sender DID
.my.inbox.N.sender        same DID (link-leaf for traversal)
.my.inbox.N.content_type
.my.inbox.N.content       UTF-8 payload
.my.inbox.N.message_id
.my.inbox.N.received_at   unix seconds as string
.my.inbox.N.reply_to      optional
.my.inbox.N.expires_at    optional; pruned on login if past
```

Key helpers in `mailbox/mod.rs`:
- `next_inbox_index(cfg)` — max numeric index + 1
- `inbox_count(cfg)` — distinct subtree count
- `ingest_to_config(incoming, cfg)` — writes all leaves
- `prune_inbox_expired(cfg, now_secs)` — removes expired entries
- `is_link_value(value)` — true for `did:ma:…`, `bafy…`, `Qm…`

Verbs dispatched in `parser/verbs.rs`:
- `.my.inbox` — list all entries
- `.my.inbox.N` — show all leaves of entry N
- `.my.inbox.N:reply [body]` — immediate send (no args → editor in Reply mode)
- `.my.inbox.N:open` — open content read-only in editor (View mode)
- `.my.inbox.N:` — delete entry
- `.my.inbox:` — delete all entries
- `.my.inbox:flush` — print all entries to terminal

---

## Documents — `.my.documents.*`

Stored in `EgoConfig`:

```
.my.documents.<name>.content       text body
.my.documents.<name>.content_type  text/plain | text/markdown | text/yaml
.my.documents.<name>.cid           IPFS CID (set after :publish)
```

Verbs:
- `.my.documents.<name>:edit` — open editor with saved content (Standard mode)
- `.my.documents.<name>:edit <cid>` — fetch CID, open for review (NOT auto-executed)
- `.my.documents.<name>:eval` — execute saved `.content` line-by-line
- `.my.documents.<name>:publish <publisher>` — send `application/x-ma-ipfs-store`
- `.my.documents.<name>:cid` — print stored CID
- `.my.documents.<name>:fetch <cid>` — import CID content (no editor, no execution)
- `.my.documents.<name>:` — delete entire document subtree

---

## Editor — `views/editor.rs`

CodeMirror 6 loaded from CDN via `www/editor.js`.
JS API on `window.maEditor`: `create(id, value, lang)`, `getValue(id)`,
`setLanguage(id, lang)`, `destroy(id)`.
Called from Rust via `js_sys::eval` wrappers.

`EditorContext` fields: `doc_path: String`, `initial: String`, `language: String`,
`mode: EditorMode`.

```rust
pub enum EditorMode {
    Standard,          // Save + Eval + Cancel
    View,              // Close only  (read-only)
    Reply { to: String, reply_to_id: String },  // Reply only
}
```

Toolbar buttons are always in the DOM; show/hide via `style=display:none`
driven by mode-test closures (pattern required to satisfy Leptos `Fn` bounds
on nested reactive closures).

---

## Transport — `transport/connection.rs`

- `connect(endpoint_id)` — dials peer, registers `INBOX_PROTOCOL_ID` +
  `RPC_PROTOCOL_ID`, starts 500 ms poll loop via `gloo_timers`.
- Poll loop drains both `SESSION_INBOX` and `SESSION_RPC_INBOX`.
- Incoming messages call `state.ingest_mailbox_message(msg, config)`.
- `send_message(target_did, content_type, body)` — encrypts + sends on
  `INBOX_PROTOCOL_ID`.
- `send_rpc(target_did, verb, args)` — sends on `RPC_PROTOCOL_ID`.
- `send_text_reply(target_did, body, reply_to_id)` — sends text reply with
  `reply_to` field set.
- `publish_did_document(bundle, endpoint)` — uses
  `bundle.build_document(ep.ma_extension())` to include all registered services.

---

## Lazy DID / CID traversal

In `terminal.rs`, when a `.path` lookup misses a key, the code walks
ancestor paths backward. If any ancestor leaf `is_link_value`, it calls
`spawn_local(resolve_and_traverse(link, subpath, state, cache))`.

`resolve_and_traverse`:
1. Checks `doc_cache` (RwSignal<HashMap<String, serde_json::Value>>).
2. If miss, fetches: DID → IPFS gateway `/ipfs/<did-doc-cid>`; CID → gateway `/ipfs/<cid>`.
3. Parses JSON, traverses sub-path, pushes result as terminal entry.
4. Stores parsed JSON in `doc_cache` for subsequent lookups.

---

## Security rules

**NEVER execute content fetched from a CID automatically.**
`:edit <cid>` MUST open the editor for human review first.
Only `:eval` (on saved `.content`) and the **Eval** editor button
may trigger execution. This must never be bypassed.

All secret key material lives in `SecretBundle`, encrypted with the
user's passphrase. Keys are decrypted into thread-locals at login and
never written out again.

---

## Config tree conventions

`.config.*` is free-form. Known sub-trees used by the UI:

```
.config.colour.alias        hex colour for alias tokens in input
.config.colour.background   terminal background
.config.poll_interval_ms    inbox poll interval (default 500)
```

---

## Build & deploy

```sh
make dev          # trunk serve --port 8088 (hot reload)
make dist         # trunk build --release → dist/
make serve        # dist + python3 http.server on :8000
make publish      # dist + ipfs add -r dist, writes .cid
make cid          # print last published CID
make check        # cargo check --target wasm32-unknown-unknown
```

---

## Key constraints

- **`ma-core` must come from `crates.io`** in production.
  `[patch.crates-io] ma-core = { path = "../rust-ma-core" }` is active
  during development when new features are needed before a release.
  Remove the patch before publishing.
- No backend. Everything is static files + IndexedDB + iroh P2P.
- Do not duplicate logic already in `ma-core` or `ma-did`.
- Keep modules small and single-purpose. No giant files.

