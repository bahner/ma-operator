# ego — your actor workstation

You are browsing the web right now with an identity that belongs to someone else.
Your browser vendor, your platform, your search engine — they all know who you are,
and you have no key to any of it.

**ego** gives you your own cryptographic identity, right in your browser tab,
with no account, no server, and no one in the middle.
Think of it as owning a small piece of the internet — one that is *yours*,
that you can pack up and take with you, and that no one can take away.

---

## What is it, really?

ego is a messaging workstation — a bit like those old text-based MUD games,
but instead of slaying dragons, you are talking to other identities on the
[間 (ma) network](https://docs.rs/ma-core).

You type commands into a prompt at the bottom of the screen.
Replies appear above. Your identity, your messages, and your documents
are stored locally in your browser (IndexedDB), encrypted with your passphrase.
Nothing leaves your machine without your permission.

---

## Getting started

You will need [Rust](https://rustup.rs), [Trunk](https://trunkrs.dev),
and the WASM target:

```sh
rustup target add wasm32-unknown-unknown
cargo install trunk
```

Then:

```sh
git clone <this repo>
cd ma-agent
make dev          # opens on http://localhost:8088
```

Or just open [https://zion.bahner.com/](https://zion.bahner.com/) — a live build is hosted there.
You can also open the latest IPFS build directly in a compatible browser (Brave works out of the box).

---

## Your first identity

When you open ego for the first time you will see a landing page.
Pick a username — this is just a local label, not a handle visible to anyone else.
Choose a strong passphrase. Click **Create**.

Four cryptographic keys are generated in your browser and locked with your passphrase.
Together they form your *secret bundle*. Lose the passphrase, lose the identity —
there is no recovery. Export the bundle to a file somewhere safe.

You can import that file on any other device or browser to restore your identity.
Different browser tabs can hold different identities — useful for testing.

---

## The terminal

Once you are logged in you are looking at the terminal.
There is a text field at the bottom and a scrolling output area above.
Type `.help` and press Enter to see what is available.

Everything revolves around three ideas:

| Syntax | What it does |
|--------|-------------|
| `.path` | Read a value or list a subtree |
| `.path: value` | Set a value |
| `.path:verb [args]` | Run an action |

Your data lives under `.my.*`:

```
.my.identity.did          your public DID — share this freely
.my.aliases               short names for long DIDs
.my.inbox                 incoming messages
.my.documents             your notes and drafts
.config                   appearance and behaviour settings
```

---

## Sending a message

You need someone to talk to. Give them your DID (`.my.identity.did`),
get their inbox actor DID-URL, and save it as an alias:

```
.my.aliases.alice: did:ma:k51...#inbox
```

Actor messages require a DID-URL with a fragment. Aliases may still store a
bare DID for commands that select a standard actor explicitly:

```
.my.aliases.runtime: did:ma:k51...
```

Now sending is simple:

```
@alice Hello!
```

That sends an encrypted message directly to Alice over a peer-to-peer connection —
no email server, no platform.

To send an RPC (a verb, not just text):

```
@runtime#root:ping
```

To target a specific entity fragment while still using an alias:

```
@alice#fortune:fortune
```

Appending a fragment is only valid when the alias stores a DID. If an alias
already stores a DID-URL, use the alias directly.

---

## Your inbox

When messages arrive a counter appears in the output.
Browse them:

```
.my.inbox              list all messages
.my.inbox.3            read message 3
.my.inbox.3:reply      open the editor to write a reply
.my.inbox.3:reply Hi!  reply immediately, no editor
.my.inbox.3:           delete message 3
```

Messages from known identities support lazy traversal — if message 3 came from
someone whose DID document is published on IPFS, you can look up fields from it:

```
.my.inbox.3.sender.service
```

---

## Documents and notes

ego has a built-in text editor (CodeMirror 6) for writing and storing notes.
Documents are stored in your local config tree and survive browser restarts:

```
.my.documents.notes:edit          open the editor
.my.documents.notes:eval          run the document as terminal commands
.my.documents.notes:fetch <cid>   import a document from IPFS by CID
```

---

## Privacy and keys

Your passphrase never leaves your device. Your secret bundle is encrypted
at rest in IndexedDB. The private keys are decrypted only for the duration
of your session and are never written back to storage in plaintext.

All messages are end-to-end encrypted using X25519 key agreement.
The ego app itself is static HTML + WebAssembly — there is no server that
could log your traffic even if it wanted to.

---

## Publishing your identity

Your DID (`did:ma:…`) is a key, not a URL. For anyone to send you a message
they need to resolve it — fetch your public keys and your iroh endpoint from
IPFS. That means your *DID document* must be published to IPFS at least once,
and refreshed whenever your endpoint changes.

You need two things running on your machine:

1. **IPFS Desktop** — installs a local [Kubo](https://docs.ipfs.tech/install/ipfs-desktop/)
   node that stores and serves content on IPFS.
   Download from [https://docs.ipfs.tech/install/ipfs-desktop/](https://docs.ipfs.tech/install/ipfs-desktop/).
   *(Brave no longer bundles Kubo, so this is the easiest path.)*

2. **`ma`** — the 間 runtime daemon, a small bridge between ego and Kubo.
   It runs on your machine, speaks the ma protocol over iroh QUIC, and handles
   publish requests on your behalf.
   Source and releases: [github.com/bahner/ma-runtime](https://github.com/bahner/ma-runtime).

Once `ma` is running, open [http://localhost:5003](http://localhost:5003) to confirm.

### ma-space

Then run one command in zion:

```
.ma
```

This probes `http://localhost:5003/status.json` with a short timeout, reads
`ma`'s DID and endpoint, stores them under `.ma.ctx.*`, and creates the alias
`@ma` for you automatically. If local `ma` is not running, zion reports that
quickly instead of waiting for the normal message timeout.

After that, publishing your identity is just:

```
.my.identity!publish @ma
```

You only need to re-run this whenever your iroh endpoint changes (e.g. after
a new install). The DID itself is permanent.

### What is ma-space?

ma-space is where your zion identity becomes reachable. The local `ma` daemon
is the bridge between your browser identity and the wider ma network. The name
is the kanji for the project itself (間, *ma*, meaning interval or space).

Once your identity is published, you can enter the room through your runtime:

```
.enter @ma
```

Running `.enter` again toggles room focus off without logging you out or
changing your identity. Run `.enter` once more to return to the saved context.

---

## Status

ego is early-stage but usable. These things work today:

- Create, export, and import identities
- Send and receive encrypted messages and RPC verbs
- Full inbox with reply, open, and delete
- Local documents with a code editor
- Peer-to-peer transport via [iroh QUIC](https://github.com/n0-computer/iroh)
- Focus mode for runtime worlds via `.enter @runtime` / `.enter`
- Everything persists across browser restarts

Coming soon: alias colour rendering in the input field and a publish workflow
for pushing documents to IPFS.

---

## Building and publishing

```sh
make dev        # hot-reload dev server on :8088
make dist       # production build → dist/
make serve      # serve dist/ with Python on :8000
make publish    # publish to IPFS, prints CID
make cid        # print the last published CID
```

---

## Inbound ACL

You can gate who is allowed to deliver messages to your ego session.
The ACL lives at `.my.acl` and is a standard `AclMap` YAML string
(same format used everywhere in the ma protocol — see
[ma-runtime-v1 §15](../ma-spec/runtime/ma-runtime-v1.md)).

Edit it in the built-in YAML editor:

```
.my.acl:edit
```

The ACL is evaluated for every incoming message before it is delivered
to the terminal. Two capabilities apply:

| Capability | Guards |
|------------|--------|
| `inbox` | Messages via `/ma/inbox/0.0.1` |
| `rpc` | Unsolicited RPC calls via `/ma/rpc/0.0.1` |

Replies to your own outgoing messages bypass the ACL — they are matched
by `reply_to` message ID, not by sender.

If `.my.acl` is absent, access is fully open (`"*": [inbox, rpc]`).

Examples:

```yaml
# Block a specific sender, allow everyone else
"*":           [inbox, rpc]
"did:ma:spam": null
```

```yaml
# Allow only known contacts
"did:ma:alice": [inbox, rpc]
"did:ma:bob":   [inbox]
```

---

## Philosophy

ego is deliberately small. It does not try to be a platform.
It is a tool for people who want to own their own digital identity and
communicate without asking anyone's permission.

The underlying protocol ([ma-core](https://docs.rs/ma-core),
[ma-spec](../ma-spec)) is open and extensible.
ego is just one workstation on top of it.
