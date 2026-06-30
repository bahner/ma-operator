# ma-agent — AI Agent Reference

## Agent rules

- **Never modify files outside the current workspace without explicit user approval.** Always ask first.

---

`zion` is a browser-based actor workstation compiled to WASM.
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
    command.rs          — DotOp parser (get / set / delete / meta-verb); bare DID actor support
    verbs/              — dispatch_meta: all .path!verb implementations
  scheme/
    mod.rs              — public API: needs_expansion(), expand(), init/reset_session_env()
    parser.rs           — S-expression lexer + parser → SchemeExpr AST
    eval.rs             — async evaluator: special forms, builtins, ma primitives
    value.rs            — SchemeVal enum, Env (lexically-scoped environment)
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
  i18n.rs              — async FTL fetch, BCP-47 normalise, t()/tf() helpers
  core/
    commands.rs         — command constants
    entries.rs          — terminal entry types (System, Error, Sent, Received…)
    mod.rs
www/
  editor.js             — CodeMirror 6 shim; exposes window.maEditor
style/
  zion.css
lang/                   — Fluent (FTL) translation files; one per BCP-47 tag
  en.ftl                — canonical source; defines all keys
  lang/*.ftl            — all other supported locales
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
- [x] `.my.doc.*` — edit / eval / publish / fetch / cid verbs
- [x] `.config.*` — full CRUD configuration tree
- [x] Editor — CodeMirror 6, modes: Standard / View / Reply
- [x] Transport — iroh QUIC connect, inbox + RPC poll loop (500 ms)
- [x] Send text message (`@target body`)
- [x] Send RPC verb (`@target!verb [args]`)
- [x] Send reply (`.my.inbox.N!reply [body]`)
- [x] Lazy DID / CID traversal (`.my.inbox.N.sender.created_at`)
- [x] `doc_cache` — in-memory JSON cache for traversal results
- [x] `.ma!discover` — probes localhost:5003, creates `@ma` alias, persists config
- [x] i18n — async FTL translation, BCP-47 language detection, per-profile `.my.i18n`
- [x] Reactive UI language — landing page rerenders on profile switch / `.my.i18n` change
- [x] `ma.type = "agent"` and `ma.lang` in published DID documents
- [x] Embedded Scheme evaluator — `(…)` expressions in any command line

## Pending / not yet implemented

- [ ] `.use @actor [as @alias]` focus mode — pre-fills prompt
- [ ] Alias colour rendering in input field
- [ ] `.my.doc.<name>!publish` — `application/x-ma-ipfs-store` protocol
- [ ] `.my.home` — default actor context
- [ ] Scheme expressions inside sync batches (currently fire-and-forget)

---

## Scheme evaluator — `src/scheme/`

Any command line containing `(…)` is pre-processed before normal parsing.
Each top-level `(…)` span is evaluated as a Scheme expression and the result
is spliced back into the line as a plain string.  The final expanded line is
then dispatched through the normal parser.

### ma primitives (no new function names)

| Form | What it does |
|---|---|
| `(.my.aliases.sky)` | dot-path get — returns the config value |
| `(.my.config.k: "v")` | dot-path set — writes config, returns nil |
| `(.my.path!verb …)` | side-effect verb — queued to input_queue, returns nil |
| `(@ma#house:enter #room)` | actor RPC — sends, awaits reply string |
| `(did:ma:abc#room:enter ticket)` | same, DID directly in function position |

The head character determines dispatch:
- starts with `.` → ma dot-command (synchronous)
- starts with `@` or evaluates to a `did:` string → ma actor message (async RPC)
- anything else → standard Scheme form or lambda call

### Example

```
@(.my.aliases.sky)#room:enter ((.my.aliases.ms)#house:enter #room)
```

Evaluation:
1. `(.my.aliases.ms)` → `did:ma:abc` (sync config lookup)
2. `(did:ma:abc#house:enter #room)` → RPC, awaits reply `"ticket-xyz"` (async)
3. `(.my.aliases.sky)` → `did:ma:def` (sync)
4. Expanded line: `@did:ma:def#room:enter ticket-xyz`
5. Dispatched as a normal actor message

### Scheme features

Special forms: `define`, `lambda`, `let`, `let*`, `letrec`, `if`, `cond`,
`begin`, `and`, `or`, `when`, `unless`, `set!`, `quote`.

Builtins: arithmetic (`+` `-` `*` `/` `mod`), comparison (`=` `<` `>` …),
list ops (`cons` `car` `cdr` `map` `filter` `fold` `append` `reverse` …),
string ops (`string-append` `substring` `string-contains` …), predicates,
`display` (writes to terminal), `error`, `assert`.

### Session environment

`(define …)` bindings persist for the login session.  The environment is
created on login (`init_session_env()`) and cleared on logout
(`reset_session_env()`).

### Integration points

- `src/scheme/mod.rs` — `needs_expansion(line)`, `expand(line, state, config)`
- `src/dispatch.rs` — `handle_input_line` calls `expand` when `(` is detected
- `src/inbox_poll.rs` — `dispatch_reply` routes replies to scheme senders
- `src/state.rs` — `AppState.scheme_senders` (oneshot channels keyed by msg_id)

### Limitation

Scheme expressions inside **sync batches** are evaluated asynchronously and
do not block the batch step counter.  They re-queue the expanded line into
`input_queue`, which may arrive after the batch has already advanced.

---

## Dot-command grammar

| Syntax | Meaning |
|--------|----------|
| `.path` | get — print leaf value or subtree listing |
| `.path query` | filter — subtree listing matching `query` |
| `.path: value` | set leaf |
| `.path:` | delete subtree (or leaf) |
| `.path!verb [args]` | side-effect / system operation |

**Rules:**
- Read-only keys enforced in `EgoConfig::is_read_only()`.
  Currently: anything under `.my.identity.*`.
- A key cannot be both a leaf and a parent node simultaneously.
- `:` is **only** a setter. Verbs always use `!`.
- Verbs dispatch to `parser/verbs/mod.rs::dispatch_meta`.

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

## `.my.ma` — local ma runtime

`.my.ma` is the config subtree for the user's local `ma` daemon.
It is set once via `:discover` and then used as the publish target.

Leaves written by `:discover`:
```
.ma.did          DID of the local ma runtime
.ma.endpoint_id  iroh endpoint ID (from status.json)
```
The alias `.my.aliases.ma` is also created, pointing to `.ma.did`.

Configurable leaf:
```
.ma.url          base URL of the ma daemon (default: http://localhost:5003)
```
Set this if `ma` runs on a non-default port: `.ma.url: http://localhost:1234`

Verb:
- `.ma!discover` — fetches `<.ma.url>/status.json`, reads `did`
  and `endpoint_id`, writes the above leaves, creates alias `@ma`, persists config.
  Reports an actionable error if `ma` is not running.

After discovery:
```
.my.identity!publish @ma
```

Prerequisites for publish to work:
1. [IPFS Desktop](https://docs.ipfs.tech/install/ipfs-desktop/) — provides Kubo
2. `ma` runtime running — bridges zion → Kubo

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

Verbs dispatched in `parser/verbs/mod.rs`:
- `.my.inbox` — list all entries
- `.my.inbox.N` — show all leaves of entry N
- `.my.inbox.N!reply [body]` — immediate send (no args → editor in Reply mode)
- `.my.inbox.N!open` — open content read-only in editor (View mode)
- `.my.inbox.N:` — delete entry
- `.my.inbox:` — delete all entries
- `.my.inbox!flush` — print all entries to terminal

---

## Documents — `.my.doc.*`

Stored in `EgoConfig`:

```
.my.doc.<name>.content       text body
.my.doc.<name>.content_type  text/plain | text/markdown | text/yaml
.my.doc.<name>.cid           IPFS CID (set after :publish)
```

Verbs:
- `.my.doc.<name>!edit` — open editor with saved content (Standard mode)
- `.my.doc.<name>!edit <cid>` — fetch CID, open for review (NOT auto-executed)
- `.my.doc.<name>!eval` — execute saved `.content` line-by-line
- `.my.doc.<name>!publish <publisher>` — send `application/x-ma-ipfs-store`
- `.my.doc.<name>!cid` — print stored CID
- `.my.doc.<name>!fetch <cid>` — import CID content (no editor, no execution)
- `.my.doc.<name>:` — delete entire document subtree

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
- `send_ipfs_publish(publisher_did)` — builds and signs the DID document via
  `bundle.build_document(ma_ext)`, then sends it to the publisher.
  The `ma:` extension always includes:
  - `ma.type = "agent"` (via `MaExtension::kind("agent")`)
  - `ma.lang = <lang>` — from `SESSION_LANG`, only if set
  - `ma.services` — iroh transport strings for inbox + RPC

---

## Internationalisation — `src/i18n.rs` + `lang/`

Translation strings use a lightweight subset of Fluent (FTL): `key = value`
lines, `{ $var }` substitutions, `#`-prefixed comments. No attributes or
selectors.

### Runtime API

```rust
pub async fn init(lang: &str)          // fetch + parse FTL for a BCP-47 tag
pub async fn init_from_browser()       // detect navigator.language and call init()
pub fn t(key: &str) -> String          // look up key; returns key name on miss
pub fn tf(key: &str, vars: &[(&str, &str)]) -> String  // look up with substitutions
pub fn lang() -> String                // current active language code
```

### BCP-47 normalisation

`normalize(lang)` splits on `-` / `_` and classifies each part by
capitalisation:

| Part form | Classification |
|-----------|---------------|
| all-lowercase | language subtag (e.g. `zh`, `nb`) |
| Title-case 4 letters | script subtag (e.g. `Hans`, `Latn`) |
| ALL-CAPS | region subtag (e.g. `TW`, `NO`) |

Special case: `no` → `nb`.

Returns a fallback candidate list from most- to least-specific, e.g.
`zh-Hans-TW` → `["zh-Hans-TW", "zh-Hans", "zh"]`.
The loader tries each candidate in order; falls back to `en` if none resolve.

### Language preference

- `SESSION_LANG` thread-local holds the active code for the current session.
- `.my.i18n` in `EgoConfig` persists the preference per profile.
- On login: reads `.my.i18n`; if absent, seeds it from `navigator.language`
  and persists the config.
- Profile click on landing page: reads `.my.i18n` from the profile's config
  and calls `i18n::init()` immediately, then updates `AppState.lang` signal.
- Setting `.my.i18n: <tag>` in the terminal takes effect immediately.

### Reactivity in Leptos views

`t()` returns a plain `String` evaluated once — it is **not** reactive by
itself. To make UI text update when the language changes, read the
`AppState.lang: RwSignal<String>` signal inside a closure:

```rust
let lang = state.lang;
// In view!:
{move || { let _ = lang.get(); t("some-key") }}
```

`AppState.lang` is updated after every `i18n::init()` call via
`state.lang.set(crate::i18n::lang())`.

### FTL file conventions

- `lang/en.ftl` is the **canonical source** — it defines every key.
- All other `lang/*.ftl` files mirror the same key set with translated values.
- **When adding or changing any `t()` / `tf()` call**, update `en.ftl` first,
  then add/update the same key in every other `lang/*.ftl` that exists.
  Missing keys silently fall back to the key name string — never leave gaps.
- Do not add attributes or selectors — the parser only handles `key = value`.
- Variable placeholders use Fluent syntax: `{ $varname }`.

### `lang-name` key

Every `lang/*.ftl` file **must** contain a `lang-name` key whose value is the
language's own name for itself (autonym), e.g. `lang-name = Norsk bokmål`.
This is displayed by `.my.i18n:list` and by `t("lang-name")` in the UI.

### Adding a new language

1. Create `lang/<code>.ftl` with all keys from `lang/en.ftl` translated,
   including `lang-name = <autonym>` and `lang-list-header = <translated>`.
2. Rebuild (`trunk build` / `cargo check`). `build.rs` scans `lang/*.ftl`,
   reads the `lang-name` key from each file, and regenerates `SUPPORTED_LANGS`
   automatically — no manual code change required.

`SUPPORTED_LANGS` is written to `$OUT_DIR/supported_langs.rs` and
`include!`-ed into `src/i18n.rs`. The list is kept sorted alphabetically
by language code.

### `.my.i18n!list`

Dispatch lives in `src/parser/verbs/mod.rs` at path `.my.i18n`, verb `list`.
It iterates `crate::i18n::SUPPORTED_LANGS` (auto-generated at build time)
and prints each entry as `  <code padded to 20>  <autonym>`.
The header line comes from `t("lang-list-header")`.

### BCP-47 private-use tags

Tags containing `-x-` (e.g. `art-x-lyaric`) are passed through verbatim by
`normalize()` in `src/i18n.rs` instead of being split part-by-part.
When adding such a language, use the full tag as both the filename stem
and the entry in `SUPPORTED_LANGS`.

### Notable constructed / special languages

| Code | Language | Notes |
|------|----------|---------|
| `art-x-lyaric` | Dread Talk (Rasta) | BCP-47 private-use tag for Lyaric / Rastafarian Iyaric dialect |
| `qbc` | Belter Creole | The conlang from *The Expanse* (Belter lang); ISO 639-3 code `qbc` |

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
`!edit <cid>` MUST open the editor for human review first.
Only `!eval` (on saved `.content`) and the **Eval** editor button
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

`.my.i18n` — BCP-47 language tag for this profile (e.g. `nb`, `zh-Hans`).
Auto-seeded from `navigator.language` on first login if absent.
Changing it (`.my.i18n: sv`) takes effect immediately and persists.
Also included in the published DID document as `ma.lang`.

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
- **When adding or changing any user-visible string** (any `t()` / `tf()` call),
  update `lang/en.ftl` first (canonical source), then propagate the key with a
  translated value to **every** `lang/*.ftl` file that exists at that time.
  Never leave a key missing from any locale file — missing keys fall back to
  the key name, not to English.

---

## Inbound ACL — `.my.acl`

zion enforces a client-side inbound ACL stored at `.my.acl` in `EgoConfig`
(a plain YAML string). It is evaluated on every poll tick before a message
is delivered to the terminal.

### ma-core integration

```rust
use ma_core::{check_cap, AclMap, CAP_INBOX, CAP_RPC};
```

Load and check:

```rust
// src/acl.rs
pub fn load_ego_acl(cfg: &EgoConfig) -> AclMap {
    cfg.get(ACL_KEY)
        .and_then(|s| serde_yaml::from_str(&s).ok())
        .unwrap_or_else(open_acl)
}

pub fn check_ego_acl(cfg: &EgoConfig, from: &str, cap: &str) -> bool {
    check_cap(&load_ego_acl(cfg), from, cap)
}
```

`open_acl()` returns `{"*": [inbox, rpc]}` (fully open).

### Poll-loop gate

In `views/terminal.rs`, before delivering an incoming message:

```rust
if incoming.reply_to.is_none() {
    let cap = if incoming.message_type == MESSAGE_TYPE_MESSAGE {
        CAP_INBOX
    } else {
        CAP_RPC
    };
    if !check_ego_acl(&cfg, &incoming.from, cap) {
        // push a "blocked" system entry and continue
        continue;
    }
}
```

Replies (`reply_to.is_some()`) bypass the ACL entirely — they are matched
by message ID, not filtered by sender.

### Editing

`.my.acl!edit` opens `EditorMode::ConfigEdit { key: ACL_KEY.to_string() }`
in YAML mode. On save the value is written directly to `EgoConfig` (not via
the document `.content` path). Takes effect on the next poll tick.

