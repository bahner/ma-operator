# art-x-lyaric — Dread Talk / Iyaric (Rasta)
# Rastafarian Iyaric dialect, also known as Dread Talk or Lyaric.
# BCP-47 private-use tag: art-x-lyaric
lang-name = Iyaric

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = enter Zion
tab-new-identity = new identity
tab-import-profile = bring in I-profile
label-passphrase = pass phrase
label-username = I-name
label-confirm-passphrase = confirm pass phrase
label-did = DID
label-profile-cid = I-profile CID
label-or-file = or file
btn-login = enter
btn-export = carry out
btn-generate = manifest
btn-new-endpoint = new overstanding
btn-import-profile = bring in I-profile
passphrase-warning = Lose pass phrase = lose identity. There is no recovery in Babylon.
import-profile-help = Bring in I-profile by CID or file. Same pass phrase used when publishing needed, seen?
import-profile-detected-user = I-profile belong to: { $name }
status-unlocking = opening...
status-generating = manifesting identity...
status-reading-file = reading file...
status-fetching-profile = fetchin I-profile from IPFS...
status-imported = brought in '{ $name }' — switch to Enter tab
status-importing-profile = bringing in I-profile...
profile-import-done = I-profile brought in for '{ $name }' — { $n } keys loaded, irie
error-wrong-passphrase = wrong pass phrase: { $e }
error-identity-not-found = I-dentity '{ $name }' nuh find
error-username-required = I-name required
error-passphrase-required = pass phrase required
error-passphrases-no-match = pass phrases nuh match
error-profile-source-required = give CID or upload file, seen?
error-did-required = give InI DID, seen?
error-profile-fetch = could not fetch I-profile: { $e }
error-profile-no-username = I-profile nuh have InI-name
error-profile-no-identity = I-dentity '{ $name }' nuh find — bring in I-dentity first

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — entered as { $username }
msg-type-help = Type .help fi a list of livity commands.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint irie
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID published through I-an-I local ma ({ $url })
msg-identity-not-published = Ites not inna di web — if ma install inna di machine, run '.ma [port]' den '/my/identity!publish @ma'. Write '.help/publish' fi di details.
msg-blocked = ⊗ blocked by Zion [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = removed { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch: nuh connected
msg-link-fetch-error = link fetch: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias I-name cyan be empty
err-alias-has-dot = alias I-name cyan contain '.'
err-alias-has-fragment = alias I-name cyan contain '#'
err-alias-value-fragment = alias value must be bare did:ma:<ipns> (no fragment)
err-alias-value-path = alias value must be bare did:ma:<ipns> (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Keep
btn-eval = Livity
btn-cancel = Cancel
btn-close = Close
btn-reply = Answer
btn-publish = Manifest
btn-publish-ipld = Manifest IPLD
msg-reply-sent = answer forward
msg-reply-failed = answer fall: { $e }
msg-entity-publish-sent = entity { $name }: manifest forward
msg-entity-publish-failed = entity manifest fall: { $e }
msg-kind-publish-failed = Kind publish bun up: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: manifest forward
msg-field-publish-failed = field manifest fall: { $e }
msg-acl-publish-sent = runtime ACL: manifest forward
msg-crud-edit-publish-sent = { $path }: manifest forward
msg-acl-publish-failed = runtime ACL manifest fall: { $e }
msg-yaml-error = YAML trouble: { $e }
msg-editor-saved = { $path }:kept
msg-fetch-review = brought { $cid } — overstand it before livity
msg-fetch-failed = bringing { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nuh find
inbox-no-message-id = inbox entry { $n } nuh have message_id
inbox-no-verb = no verb `{ $verb }` fi inbox entry { $n }
inbox-filter-no-arg = filter need DID or alias argument
inbox-filter-empty = no message from { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = seeking fall at { $url }: { $e }
discover-json-error = seeking fall: no irie JSON from { $url }: { $e }
discover-missing-did = seeking fall: status.json missing required field `did`
discover-invalid-did = seeking fall: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = seeking notice: `endpoint_id` missing in status.json; kept DID only
discover-success = ma found at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma create — run '/my/identity!publish @ma' fi publish di ites.
claim-success = Runtime claim for { $did } in Iration
claim-conflict = Runtime already claim by another I-dentity
claim-http-failed = claim fall: HTTP { $status }
claim-error = claim fall: { $e }
claim-no-session = nuh entered; enter first fi claim di runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = /my/acl reset (fully irie and open)
acl-persist-error = keeping trouble: { $e }
acl-no-verb = no verb `{ $verb }` for /my/acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = livity: /my/identity!publish <did-or-alias>
identity-exported = Bundle downpressed as { $filename }
identity-export-failed = Export nah work: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }/content empty
doc-save-first = { $path }/content empty — keep it first
doc-missing-name = document I-name missing
doc-publish-usage = livity: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = livity: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = manifest { $path }: { $e }
doc-publish-ipld-failed = manifest-ipld { $path }: { $e }
doc-store-sent = store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-ipld-store-sent = IPLD store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-fetch-done = brought { $cid } → { $path }/content (not livity)
doc-fetch-failed = bringing { $cid }: { $e }
doc-fetch-usage = livity: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Irie languages in Zion (set with /my/i18n: <code>):

err-lang-not-found = I-language nuh find: { $lang }

help-header-zion = ── zion commands — Irie ───────────────────────────────────────────────────
help-header-messaging = ── I-messages ─────────────────────────────────────────────────────────────
help-header-focus = ── focus inna I-sight ─────────────────────────────────────────────────────
help-header-config = ── I-config grammar ───────────────────────────────────────────────────────
help-header-common = ── I-paths ────────────────────────────────────────────────────────────────
help-header-inbox = ── I-box ──────────────────────────────────────────────────────────────────
help-header-documents = ── I-writings (/my/doc.*) ─────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis I-text
help-cmd-clear =   .clear                       clear di terminal
help-cmd-panic =   .panic                       last resort — use if I-self find trouble in Babylon
help-cmd-history =   .history                     I-command history (consecutive repeats mash inna one)
help-cmd-logout =   .logout                      depart from Zion
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)
help-msg-echo =   @alias                       echo di I-dentity DID (no message sent)
help-msg-send =   @alias[:verb] body           send message / RPC to I-dren
help-msg-fragment =   @alias#fragment[:verb] body  send to I-name wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (no I-name search)
help-focus-set =   .use @alias [as @name]       focus pon I-dren (changes I-prompt)
help-focus-clear =   .use                         clear I-focus
help-config-get =   .path                        sight leaf value or list subtree
help-config-filter =   .path value                  match query (filter by value)
help-config-set =   .path: value                 set leaf
help-config-delete =   .path:                       remove leaf or subtree
help-config-verb =   .path!verb [args]            invoke I-local verb
help-my =   /my                          sight all personal I-config
help-aliases =   /my/aliases                  list I-names
help-aliases-set =   /my/aliases/<name>: <did>    add/overwrite I-name (bare DID, nuh #fragment)
help-aliases-del =   /my/aliases/<name>:          remove I-name
help-runtime-discover =   .ma [port]          discover local runtime and manifest @ma I-name
help-runtime-claim =   .ma [port]             claim runtime ownership with I and I DID
help-identity =   /my/identity                 sight I and I identity config
help-identity-did =   /my/identity/did             sight I and I DID (I-sight only)
help-identity-publish =   /my/identity!publish @pub    publish I and I DID via publisher
help-identity-export =   /my/identity!export          download I-and-I identity bundle
help-config-path =   .config                      sight all .config.* entries
help-inbox =   /my/inbox                    sight I-box (subtree view)
help-inbox-n =   /my/inbox/N                  sight entry N fields
help-inbox-from =   /my/inbox/N/from             sender DID of entry N
help-inbox-reply =   /my/inbox/N!reply [body]     send reply (opens editor if nuh body)
help-inbox-open =   /my/inbox/N!open             open entry in I-sight only in editor
help-inbox-del =   /my/inbox/N:                 remove entry N
help-inbox-delall =   /my/inbox:                   remove all I-box entries
help-inbox-flush =   /my/inbox!flush              manifest all entries to terminal
help-inbox-filter =   /my/inbox!filter @who        sight only I-box from @who
help-inbox-traverse =   /my/inbox/N/sender/<field>   traverse sender DID document in I-time
help-doc-edit =   /my/doc/<name>!edit           open editor with saved I-writing
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     fetch CID, open for I-sight only
help-doc-eval =   /my/doc/<name>!eval           execute saved I-writing line by line
help-doc-publish =   /my/doc/<name>!publish @pub   store as raw blob (any type)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   /my/doc/<name>!fetch <cid>    bring in CID content (no execution)
help-doc-cid =   /my/doc/<name>!cid            sight stored CID
help-doc-del =   /my/doc/<name>:              remove I-writing from Zion

msg-send-failed = send nuh forward: { $e }
msg-not-logged-in = I an I nuh log in, seen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML must be a mapping (key: value pairs); plain text and bare scalars cannot be stored as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode error: { $e }
cbor-decode-error = CBOR decode error: { $e }
cbor-json-error = CBOR to JSON error: { $e }
yaml-serialize-error = YAML serialize error: { $e }
edit-reply-invalid = invalid edit reply
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox prune persist: { $e }
err-config-load = config load error: { $e }
err-lang-persist = lang persist: { $e }
err-history-parse = history parse error: { $e }
err-history-load = history load error: { $e }
err-ipfs-reply-decode = IPFS reply decode failed: { $e }
err-edit-cbor = edit CBOR error: { $e }
err-popup-blocked = popup block by di browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = iration failin
rpc-error-detail = iration failin: { $detail }
msg-new-message = ← [{ $from }] new word come — { $count } inna di box
msg-chat = { $sender } seh { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } seh { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } enter di room.
room-leave = * { $name } lef di room.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit decode fail: { $e }
err-edit-fetch-failed = edit fetch fail: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no livity session — caan delete profile
profile-delete-error = profile deletion fail up: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (none)
profiles-deleted = profile { $name } gone
profiles-not-found = profile nuh deh: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help/url                    open Zion tru a URL link
help-header-url = ── URL I-parameters ─────────────────────────────────────────────────────────────
help-url-intro =   Share a link fi open Zion wid a I-recipient ready fill:
help-url-msg =   ?msg=<did>                   fill up: @<did> (I-message)
help-url-say =   ?say=<did>                   fill up: @<did>:say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>:emote (emote verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Di I-input fill up but not send — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish di ites pon di network
help-header-publish = ── publish di ites ──────────────────────────────────────────────────────────
help-publish-intro = Publishing mek di ites findable pon di network. Odda ones can search di DID fi reach.
help-publish-ma = Fi publish, InI need ma (local runtime) install. It bridge ego to IPFS/IPNS pon di behalf.
help-publish-steps = Steps: run '.ma [port]' fi find di local ma, den '/my/identity!publish @ma'.
help-publish-without = Without publishing, odda ones cannot reach — even knowing di DID, dem cannot resolve di endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
batch-step-timeout = batch step timed out

batch-done = batch-done
batch-done-error = batch-done-error
msg-timeout = msg-timeout
help-cmd-batch-async = help-cmd-batch-async


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } cyaan fetch: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No real CID dis: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Watchout: Yuh IPNS private key ago sen to dis runtime fi publish yuh livity. Only use a runtime yuh fully trust, Iyah.
