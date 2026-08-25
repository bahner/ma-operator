# zion — English
lang-name = English
label-nick = nick
new-identity-nick-help = Choose a nick for 間-space. It is only a nickname, and you can change it whenever you want.
error-nick-required = nick required
error-nick-invalid = nick must not contain spaces or @

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = new identity
tab-import-profile = import profile
label-passphrase = passphrase
label-username = username
label-confirm-passphrase = confirm passphrase
passphrase-placeholder = This password is your only defense against the Dark Arts!
label-did = did
label-runtime = 間
label-runtime-placeholder = did:ma:...
label-profile-cid = profile CID
label-or-file = or file
btn-login = login
btn-export = export
btn-generate = generate
btn-new-endpoint = new endpoint
btn-import-profile = import profile
btn-show-qr = show QR
btn-scan-qr = scan QR
qr-scan-hint = Point the camera at a zion profile QR code.
qr-error-camera = camera unavailable: { $e }
qr-error-too-large = profile too large for a QR code
passphrase-warning = Lost passphrase = lost identity. There is no recovery.
warning-remote-runtime = Warning: Your IPNS private key will be sent to this runtime for identity publishing. Only use a runtime you fully trust.
import-profile-help = Import a .zion.json profile by CID or file. No passphrase needed for a fresh import. Passphrase only required to overwrite an existing identity.
import-profile-detected-user = Profile belongs to: { $name }
status-unlocking = unlocking...
status-generating = generating identity...
status-reading-file = reading file...
status-fetching-profile = fetching profile from IPFS...
status-importing-profile = importing profile...
status-imported = imported '{ $name }' — switch to Login tab
profile-import-done = profile imported for '{ $name }' — { $n } keys loaded
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' not found
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrases do not match
error-profile-source-required = provide a CID or upload a file
error-did-required = enter your DID
error-profile-fetch = could not fetch profile: { $e }
error-profile-no-username = profile does not contain a username
error-profile-no-identity = identity '{ $name }' not found — import identity first

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help for a list of commands.
msg-getting-started = Try: say Hello world, look, .help, or help.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID published via trusted 間 ({ $url })
msg-identity-publication-propagating = Identity publication is still propagating; entry delayed: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Publishing identity. This can take up to { $seconds } seconds.
msg-ma-connecting-matrix = trying to connect you to the 間trix
msg-ma-checking-url = checking local 間 at { $url }
msg-local-ma-unreachable = local 間 not reachable at { $url } after { $seconds }s; start 間 or retry with '.ma: claim [port]'
msg-runtime-pinging = pinging runtime { $did }
msg-runtime-ping-timeout = runtime { $did } did not answer within { $seconds }s; skipping automatic entry
msg-startup-enter-skipped = not entering saved runtime because { $target } did not answer
msg-local-ma-claimed = claimed local 間
msg-local-ma-already-claimed = local 間 already claimed
msg-local-ma-claim-failed = failed to claim local 間
msg-identity-not-published = Identity not found online — select a trusted runtime with '.ma: did:ma:…' or discover a local one with '.ma: claim [port]', then run '.ma'.
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-left = left
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing to set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing to shadow
err-unknown-command = unknown command: { $path }
err-read-only-path = { $path } is read-only
msg-key-not-found = key not found: { $path }
msg-link-not-connected = link fetch error: not connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` not found in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name cannot be empty
err-alias-has-dot = alias names cannot contain '.'
err-alias-has-fragment = alias names cannot contain '#'
err-alias-value-fragment = alias value may contain at most one non-empty DID-URL fragment
err-alias-value-path = alias value must be a did:ma:<ipns> DID or DID-URL (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }
err-lang-not-found = language not found: { $lang }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Save
btn-eval = Eval
btn-cancel = Cancel
msg-jobs-cancelled = jobs cancelled
btn-close = Close
btn-reply = Reply
btn-publish = Publish
btn-publish-ipld = Publish IPLD
msg-reply-sent = reply sent
msg-reply-failed = reply failed: { $e }
msg-entity-publish-sent = entity { $name }: publish sent
msg-entity-publish-failed = entity publish failed: { $e }
msg-kind-publish-failed = kind publish failed: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish sent
msg-field-publish-failed = field publish failed: { $e }
msg-acl-publish-sent = runtime ACL: publish sent
msg-acl-publish-failed = runtime ACL publish failed: { $e }
msg-crud-edit-publish-sent = { $path }: publish sent
msg-yaml-error = YAML error: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review before eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox is empty
inbox-entry-not-found = inbox entry { $n } not found
inbox-no-message-id = inbox entry { $n } has no message_id
inbox-no-verb = no verb `{ $verb }` for inbox entry { $n }
inbox-filter-no-arg = filter requires a DID or alias argument
inbox-filter-empty = no messages from { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover failed at { $url }: { $e }
discover-json-error = discover failed: invalid JSON from { $url }: { $e }
discover-missing-did = discover failed: status.json missing required field `did`
discover-invalid-did = discover failed: expected `did` to start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` missing in status.json; stored DID only
discover-hint-endpoint-not-found = Hint: endpoint not found. Check that 間 is running and exposes /status.json on port 5003.
discover-hint-server-error = Hint: runtime answered with server error. Check 間 logs and retry.
discover-hint-network = Hint: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 discovered at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma created — run '.my.identity!publish @ma' to publish your identity.
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-already-owned = Runtime already claimed by this identity
claim-http-failed = claim failed: HTTP { $status }
claim-error = claim failed: { $e }
claim-no-session = not logged in; log in first to claim the runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
err-persist = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Available languages (set with .my.i18n: <code>):

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = usage: .my.identity!publish <did-or-alias>
identity-exported = Bundle downloaded as { $filename }
identity-export-failed = export failed: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path } is empty
doc-save-first = { $path } is empty — save first
doc-missing-name = missing document name
doc-publish-usage = usage: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = usage: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = publish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish failed [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-ipld-store-sent = IPLD store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path } (not executed)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = usage: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid is not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Help text — headers ───────────────────────────────────────────────────
help-header-zion = ── zion commands ─────────────────────────────────────────────────────────
help-header-messaging = ── messaging ────────────────────────────────────────────────────────────
help-header-config = ── local config grammar ─────────────────────────────────────────────────
help-header-common = ── common paths ─────────────────────────────────────────────────────────
help-header-inbox = ── inbox ────────────────────────────────────────────────────────────────
help-header-documents = ── documents (.my.doc.*) ──────────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Help text — zion commands ─────────────────────────────────────────────
help-cmd-help =   .help                        this text
help-cmd-clear =   .clear                       clear terminal
help-cmd-history =   .history [n]                 command history (consecutive duplicates merged); optional n shows only the last n lines
help-cmd-panic =   .panic                       last resort — use if you find yourself in trouble
help-cmd-logout =   .logout                      log out
help-cmd-batch =   .batch                       eval scratch document (parallel, fire-and-forget)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         run commands sequentially, one per line

# ── Help text — topics index ──────────────────────────────────────────────
help-header-topics = ── topics — type .help/<topic> for details ────────────────────────────────
help-topic-msg =   .help/msg                    messaging — @actor, send, RPC
help-topic-ma =   .help/ma                     間-space, publishing, and entry
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config — .my.*, aliases, identity
help-topic-inbox =   .help/inbox                  inbox — .my.inbox.*
help-topic-doc =   .help/doc                    content verbs — !edit, !eval, !publish, !fetch, !cid
help-topic-actor =   .help/actor                  remote actor — CRUD, entities, CID ops
help-topic-z =   .help/z                      public and private Scheme content
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-topic-url =   .help/url                    opening zion via a URL link
help-topic-i18n =   .help/i18n                   language preference for your identity
help-unknown-topic =   .help/{ $topic }: unknown topic — try .help for a list

# ── Help text — messaging ─────────────────────────────────────────────────
help-msg-echo =   @alias                       show resolved DID/DID-URL (no message sent)
help-msg-send =   @alias!msg body / @alias:verb args           send message / RPC to actor
help-msg-fragment =   @alias#fragment:verb body  send to alias with explicit DID fragment
help-msg-escape =   \@name                       literal @name (no alias lookup)


# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = The 間 room is the space between 間 identities. 間 lets those identities find each other and communicate; once your identity is published, you can take part.
help-ma-command =   .ma: did:ma:… / .ma: claim [port] / .ma   select, discover, or publish via your trusted runtime
help-ma-publish =   .ma                           publish your profile and DID document through the selected runtime
help-ma-security = Your trusted runtime receives your IPNS private key for identity publishing. Its DID is stored as ma.ma in your DID document.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how to enter the 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = After your identity is known, .enter @ma lets you step into 間. Find a world, enter it, and take part from there.
help-ma-entry-steps = Start IPFS Desktop and 間, then run .ma. Publish with .my.identity!publish @ma, find a world, and enter with .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through the @ma runtime
help-ma-entry-toggle =   .enter                       toggle room focus on or off; your identity stays active
help-ma-entry-url =   ?enter=<runtime>             enter after login from a shared URL

# ── Help text — config grammar ────────────────────────────────────────────
help-config-get =   .path                        get leaf value or list child names
help-config-filter =   .path [name]                 list child names containing name
help-config-full =   .path. [name]                list full subtree values containing name
help-config-set =   .path: value                 set leaf
help-config-delete =   .path:                       delete leaf or subtree
help-config-verb =   .path!verb [args]            invoke local verb

# ── Help text — common paths ──────────────────────────────────────────────
help-my =   .my                          show all personal config
help-aliases =   .my.aliases                  list aliases
help-aliases-set =   .my.aliases.<name>: <did-url> add/update alias (DID or DID-URL)
help-aliases-del =   .my.aliases.<name>:          remove alias
help-runtime-discover =   .ma: claim [port]              discover and select a local runtime (default port 5003)
help-runtime-claim =   .ma: did:ma:… / .ma             select a runtime / publish and synchronise
help-identity =   .my.identity                 show identity config
help-identity-did =   .my.identity.did             show own DID (read-only)
help-identity-publish =   .my.identity!publish @pub    publish own DID via publisher service
help-identity-export =   .my.identity!export          download own identity bundle
help-config-path =   .ma.ctx                      local 間 runtime context

# ── Help text — inbox ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    list inbox (subtree view)
help-inbox-n =   .my.inbox.N                  show entry N fields
help-inbox-from =   .my.inbox.N.from             sender DID of entry N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (opens editor if no body)
help-inbox-open =   .my.inbox.N!open             open entry content read-only in editor
help-inbox-del =   .my.inbox.N:                 delete entry N
help-inbox-delall =   .my.inbox:                   delete all inbox entries
help-inbox-flush =   .my.inbox!flush              print all entries to terminal
help-inbox-filter =   .my.inbox!filter @who        show only entries from @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse sender DID document lazily

# ── Help text — documents ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           open editor with saved content
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>  fetch CID, open for review only
help-doc-eval =   .my.doc.<name>!eval           execute saved content line-by-line
help-doc-publish =   .my.doc.<name>!publish @pub   store as raw blob (any type)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>  import CID content (no execution)
help-doc-cid =   .my.doc.<name>!cid            show stored CID
help-doc-del =   .my.doc.<name>:              delete document

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n stores the language preference tied to your identity.
help-i18n-set =   .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list =   .my.i18n!list               list available language codes

# ── Help text — zscheme ──────────────────────────────────────────────────
help-header-z = ── .z and .my ───────────────────────────────────────────────────────────────
help-z-public =   .z.*                       public or publishable content; do not store secrets here
help-z-scheme =   .z.scheme                  the Scheme script loaded and evaluated at startup
help-z-control =   .z.scheme                 you control the contents of the startup script yourself
help-z-private =   .my.*                     private local configuration; Scheme can be stored here too
help-z-choice =   .z.* / .my.*               use .z.* for public Scheme and .my.* for private Scheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme

# ── Help text — URL parameters ──────────────────────────────────────────────
help-header-url = ── URL parameters ─────────────────────────────────────────────────────────
help-url-intro =   Share a link to open zion with a pre-filled recipient:
help-url-msg =   ?msg=<did>                   pre-fill: @<did>!msg (plain message)
help-url-say =   ?say=<did>                   pre-fill: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 pre-fill: @<did>!emote (emote verb)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   The input is pre-filled but not sent — press Enter to send.

# ── Error messages ────────────────────────────────────────────────────────
msg-send-failed = send failed: { $e }
msg-not-logged-in = not logged in
msg-new-message = ← [{ $from }] new message — { $count } in inbox
msg-chat = { $sender } says { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } says { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } enters the room.
room-leave = * { $name } leaves the room.
room-drop  = * { $name } drops { $thing }.
room-take  = * { $name } picks up { $thing }.

# ── RPC reply display ─────────────────────────────────────────────────────
rpc-error = error
rpc-error-detail = error: { $detail }

# ── Edit errors ───────────────────────────────────────────────────────────
err-edit-decode-failed = edit decode failed: { $e }
err-edit-fetch-failed = edit fetch failed: { $e }

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML must be a mapping (key: value pairs); plain text and bare scalars cannot be stored as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode error: { $e }
cbor-decode-error = CBOR decode error: { $e }
cbor-json-error = CBOR to JSON error: { $e }
yaml-serialise-error = YAML serialise error: { $e }
edit-reply-invalid = invalid edit reply
doc-publish-ipld-error = cannot publish-ipld: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox prune persist: { $e }
err-config-load = config load error: { $e }
err-lang-persist = lang persist: { $e }
err-history-parse = history parse error: { $e }
err-history-load = history load error: { $e }
err-history-count-invalid = history count must be a positive integer
err-ipfs-reply-decode = IPFS reply decode failed: { $e }
err-edit-cbor = edit CBOR error: { $e }
err-popup-blocked = popup blocked by browser
status-publishing = publishing

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no active session — cannot delete profile
profile-delete-needs-name = specify a profile name: .profiles.<name>:
profile-delete-error = profile deletion failed: { $e }
profiles-empty = (none)
profiles-deleted = profile { $name } deleted
profiles-not-found = profile not found: { $name }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# ── CID content operations ────────────────────────────────────────────────
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = … (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars

# ── Help text — actor / remote CRUD ──────────────────────────────────────
help-header-actor = ── remote actors ─────────────────────────────────────────────────────────
help-actor-echo =   @actor                       echo resolved DID (no message sent)
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list all entities
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity in editor
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get runtime config value
help-actor-config-set =   @actor/config/<key>: val     set runtime config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL in editor
help-actor-fragment =   @actor#entity                send to entity plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to entity plugin verb
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head =   (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail =   (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc =   (define x (@actor:verb arg))  keep RPC replies in the session environment
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publishing your identity to the network
help-header-publish = ── publishing your identity ─────────────────────────────────────────────────
help-publish-intro = Publishing makes your identity findable on the network. Others can look up your DID to reach you.
help-publish-ma = To publish, you need 間 (local runtime) installed. It bridges ego to IPFS/IPNS on your behalf.
help-publish-steps = Steps: run '.ma' (or '.ma <port>') to connect your local runtime, then '.my.identity!publish @ma'.
help-publish-without = Without publishing, others cannot reach you — even if they know your DID, they cannot resolve your endpoint.

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch…
batch-step-timeout = batch step timed out
batch-done = Batch done in { $secs }s — { $steps } steps
batch-done-error = Batch finished with errors in { $secs }s — { $steps } steps
msg-timeout = Message timed out (no reply in 60s)
msg-outbox-open-timeout = actor { $target } is unreachable — connection timed out after { $ms }ms
msg-outbox-send-timeout = sending to { $target } timed out after { $ms }ms — the connection may have dropped
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        run commands in parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Failed to fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Not a valid CID: { $value }

label-local-ipfs = Local IPFS gateway (requires browser exception)

tab-config = settings
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value
error-passphrase-too-short = passphrase must be at least 20 characters
