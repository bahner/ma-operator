# zion — Naijá
lang-name = Naijá

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login fɔ login
tab-new-identity = new identity
tab-import-profile = bring profil komot
label-passphrase = passphrase
label-username = username
label-confirm-passphrase = confirm passphrase
label-did = DID
label-profile-cid = profil CID
label-or-file = or file
btn-login = login fɔ login
btn-export = export
btn-generate = generate
btn-new-endpoint = new endpoint
btn-import-profile = bring profil komot
passphrase-warning = Lose passphrase = lose identity. E no get recovery.
import-profile-help = Bring profil komot by CID or file. Yu go need di same pasfrez wey yu yus wen yu publish.
import-profile-detected-user = Di profil na for: { $name }
status-unlocking = e dey unlock...
status-generating = e dey generate identity...
status-reading-file = e dey read file...
status-fetching-profile = dey bring profil komot for IPFS...
status-imported = imported '{ $name }' — switch go Login tab
status-importing-profile = dey bring profil komot...
profile-import-done = profil don come for '{ $name }' — { $n } key load
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' nor dey
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrase dem nor match
error-profile-source-required = give CID or upload file
error-did-required = put your DID
error-profile-fetch = e no fit get profil: { $e }
error-profile-no-username = di profil no get username
error-profile-no-identity = identity '{ $name }' no dey — first bring identity komot

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help fi see list of commands.
msg-connecting = e dey connect to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID don publish through local ma ({ $url })
msg-ma-connecting-matrix = e dey try connect you to di 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 don claim
msg-local-ma-already-claimed = local 間 don already claim
msg-local-ma-claim-failed = e no fit claim local 間
msg-identity-not-published = Identity no dey online — if ma don install for your side, run '.ma [port]' den '.my.identity!publish @ma'. Type '.help/publish' for details.
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } na read-only
msg-subtree-set = { $path } na subtree; refusing fi set
msg-ancestor-leaf = one ancestor of { $path } na leaf; refusing fi shadow
msg-key-not-found = key nor find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch error: e nor connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` nor find inside linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name nor fit be empty
err-alias-has-dot = alias name nor fit get '.'
err-alias-has-fragment = alias name nor fit get '#'
err-alias-value-fragment = alias value fit get only one DID-URL fragment we no empty
err-alias-value-path = alias value must be did:ma:<ipns> DID or DID-URL (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Save
btn-eval = Eval
btn-cancel = Cancel
btn-close = Close
btn-reply = Reply
btn-publish = Publish
btn-publish-ipld = Publish IPLD
msg-reply-sent = reply don send
msg-reply-failed = reply fail: { $e }
msg-entity-publish-sent = entity { $name }: publish don send
msg-entity-publish-failed = entity publish fail: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish don send
msg-field-publish-failed = field publish fail: { $e }
msg-acl-publish-sent = runtime ACL: publish don send
msg-crud-edit-publish-sent = { $path }: publish don send
msg-acl-publish-failed = runtime ACL publish fail: { $e }
msg-yaml-error = YAML error: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review am before eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nor find
inbox-no-message-id = inbox entry { $n } nor get message_id
inbox-no-verb = no verb `{ $verb }` for inbox entry { $n }
inbox-filter-no-arg = filter nid DID abi alias argument
inbox-filter-empty = no message dey from { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover fail for { $url }: { $e }
discover-json-error = discover fail: invalid JSON from { $url }: { $e }
discover-missing-did = discover fail: status.json dey miss required field `did`
discover-invalid-did = discover fail: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` nor dey status.json; stored DID only
discover-hint-endpoint-not-found = Hint: endpoint no dey. Check say `ma` dey show /status.json for port 5003.
discover-hint-server-error = Hint: runtime return server error. Check `ma` logs and try again.
discover-hint-network = Hint: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma discovered for { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma don create — run '.my.identity!publish @ma' make you publish your identity.
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-already-owned = Runtime don already claim by dis identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor logged in; log in first fi claim di runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = usage: .my.identity!publish <did-or-alias>
identity-exported = Bundle don download as { $filename }
identity-export-failed = Export fail: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content dey empty
doc-save-first = { $path }.content dey empty — save am first
doc-missing-name = document name dey missing
doc-publish-usage = usage: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = usage: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = publish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-ipld-store-sent = IPLD store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path }.content (no execute)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = usage: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Languages wey dey (set am with .my.i18n: <code>):

err-lang-not-found = language nor dey: { $lang }

help-header-zion = ── zion komand dem ────────────────────────────────────────────────────────
help-header-messaging = ── mesej dem ──────────────────────────────────────────────────────────────
help-header-config = ── lokal konfig gramma ────────────────────────────────────────────────────
help-header-common = ── komon path dem ─────────────────────────────────────────────────────────
help-header-inbox = ── inbox ──────────────────────────────────────────────────────────────────
help-header-documents = ── dokument dem (.my.doc.*) ───────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text
help-cmd-clear =   .clear                       klia terminal
help-cmd-panic =   .panic                       las resort — yus am if yu waka enter wahala
help-cmd-history =   .history                     history of command (repeat wey follow each oda don join)
help-cmd-logout =   .logout                      log owt
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch:sync / .batch         run scratch document line by line
help-msg-echo = @alias                       show resolved DID/DID-URL (no message sent)
help-msg-send =   @alias!msg body / @alias:verb args           send mesej / RPC go aktor
help-msg-fragment =   @alias#fragment:verb body  send go alias wey get eksplisit DID fragment
help-msg-escape =   \@name                       literal @name (noh alias lookup)
help-config-get =   .path                        get leaf valu or list sabtri
help-config-filter =   .path value                  match kweri (filta by valu)
help-config-set = .path: value                 set leaf
help-config-delete =   .path:                       dilit leaf or sabtri
help-config-verb =   .path!verb [args]            invok lokal verb
help-my =   .my                          shoh all personal konfig
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did-url>    add/update alias (DID or DID-URL)
help-aliases-del =   .my.aliases.<name>:          rimov alias
help-runtime-discover =   .ma [port]          diskova lokal runtime and kreate @ma alias
help-runtime-claim =   .ma [port]             klaim ownashop of runtime wit yu DID
help-identity =   .my.identity                 shoh identity konfig
help-identity-did =   .my.identity.did             shoh yu own DID (read-only)
help-identity-publish =   .my.identity!publish @pub    publish yu own DID via publisher savis
help-identity-export =   .my.identity!export          download your own identity bundle
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N field dem
help-inbox-from =   .my.inbox.N.from             senda DID of entri N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (open edita if noh bodi)
help-inbox-open =   .my.inbox.N!open             open entri content read-only insyd edita
help-inbox-del =   .my.inbox.N:                 dilit entri N
help-inbox-delall =   .my.inbox:                   dilit all inbox entri dem
help-inbox-flush =   .my.inbox!flush              print all entri dem go terminal
help-inbox-filter =   .my.inbox!filter @who        show only entri from @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse senda DID dokument layzily
help-doc-edit =   .my.doc.<name>!edit           open edita wit saved content
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetsh CID, open for review only
help-doc-eval = .my.doc.<name>!eval           execute saved content line-by-line
help-doc-publish = .my.doc.<name>!publish @pub   store as raw blob (any type)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  store YAML as struktured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    import CID content (noh execution)
help-doc-cid =   .my.doc.<name>!cid            shoh stored CID
help-doc-del =   .my.doc.<name>:              dilit dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n stores the language preference tied to your identity.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room na di space between 間 identities. ma dey make dose identities fit find each oda and communicate; once dem publish your identity, you fit join.
help-ma-command = .ma [port]                   connect to your local ma runtime, read /status.json, and save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish your DID document make odas fit resolve your keys and endpoint
help-ma-security = Di clearest trust boundary na your own ma runtime with your own IPFS Desktop/Kubo. Remote publisher fit help, but den you dey depend on anoda person service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how to enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When your identity don known, .enter @ma go let you step into 間. Find world, enter am, and join from there.
help-ma-entry-steps = Start IPFS Desktop and ma, then run .ma. Publish with .my.identity!publish @ma, find world, and enter with .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-toggle =   .enter                       turn room focus on or off; your identity dey active
help-ma-entry-url =   ?enter=<runtime>             enter after login from shared URL

msg-send-failed = send no work: { $e }
msg-not-logged-in = you no log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse wahala: { $e }
yaml-not-mapping = YAML must be mapping (key: value pair); plain text and scalar no fit store as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode wahala: { $e }
cbor-decode-error = CBOR decode wahala: { $e }
cbor-json-error = CBOR go JSON wahala: { $e }
yaml-serialise-error = YAML serialize wahala: { $e }
edit-reply-invalid = invalid edit reply
doc-publish-ipld-error = IPLD publish no work: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox clean up save wahala: { $e }
err-config-load = config load wahala: { $e }
err-lang-persist = language save wahala: { $e }
err-history-parse = history parse wahala: { $e }
err-history-load = history load wahala: { $e }
err-ipfs-reply-decode = IPFS reply decode no work: { $e }
err-edit-cbor = edit CBOR wahala: { $e }
err-popup-blocked = browser block popup
status-publishing = dey publish

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ɛrɔ
rpc-error-detail = ɛrɔ: { $detail }
msg-new-message = ← [{ $from }] new mesej — { $count } dey inbox
msg-chat = { $sender } tok { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } tok say { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } enter di room.
room-leave = * { $name } comot di room.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } carry { $thing }.
err-edit-decode-failed = edit: decode fail: { $e }
err-edit-fetch-failed = edit: fetch fail: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no active session — e no fit delete profile
profile-delete-error = profile delete no work: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile don encrypt and send go IPFS; DID document go update when CID land
profile-publish-done = profile don publish — DID document don update with ma.agent CID
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
profiles-empty = (noting)
profiles-deleted = profile { $name } don delete
profiles-not-found = profile no dey: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    message matter
help-topic-ma = .help/ma                     ma-space, publishing, and entry
help-topic-path = .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal setup
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    document dem
help-topic-actor =   .help/actor                  far actor
help-topic-zscheme =   .help/zscheme               Scheme expression inside line and docs
help-unknown-topic =   .help/{ $topic }: topic wey no sabi

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping = @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              show entity dem
help-actor-entities-get = @actor/entities/<n>          get entity node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     change entity
help-actor-entities-del = @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          take config value
help-actor-config-set =   @actor/config/<key>: val     put config value
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              change ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  keep RPC replies in the session environment
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    open zion through URL link
help-topic-i18n = .help/i18n                   language preference for your identity
help-header-url = ── URL parameters dem ───────────────────────────────────────────────────────────
help-url-intro =   Share link wey go open zion with di person wey don put inside:
help-url-msg =   ?msg=<did>                   put before: @<did>!msg (normal message)
help-url-say =   ?say=<did>                   put before: @<did>!say (verb say)
help-url-emote =   ?emote=<did>                 put before: @<did>!emote (verb emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             enta runtime wold afta yu don login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input don fill but dem no send am — press Enter make e send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish your identity for the network
help-header-publish = ── publish identity ─────────────────────────────────────────────────────────
help-publish-intro = Publishing go make your identity findable for the network. Other people fit search your DID to reach you.
help-publish-ma = To publish, you need ma (local runtime) installed. E go connect ego to IPFS/IPNS for your side.
help-publish-steps = Steps: run '.ma [port]' to find your local ma, den '.my.identity!publish @ma'.
help-publish-without = Without publishing, other people no fit reach you — even if dem sabi your DID, dem no fit resolve your endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = put profile name: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Batch dey run…
batch-step-timeout = batch step timed out

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
err-unknown-command = no sabi command: { $path }
err-read-only-path = { $path } na read-only
help-cmd-batch-async =   .batch:async / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No fit fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dis CID no valid: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Warning: Yur IPNS private key go send go dis runtime to publish yur identity. Only use runtime wey you trust kpata kpata.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme dey run Scheme expression we dey inside zion command, den put di result inside di line before e send am.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    example inside line; e send "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions go stay for dis login session
help-zscheme-doc = Dokument: https://github.com/bahner/rust-ma-zscheme
