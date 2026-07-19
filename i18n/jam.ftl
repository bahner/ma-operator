# zion — Patwa
lang-name = Patwa

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = new identity
tab-import-profile = bring een profayl
label-passphrase = passphrase
label-username = username
label-confirm-passphrase = confirm passphrase
label-did = DID
label-profile-cid = profayl CID
label-or-file = ar file
btn-login = login
btn-export = export
btn-generate = generate
btn-new-endpoint = nyuu endpoint
btn-import-profile = bring een profayl
passphrase-warning = Lase passphrase = lase identity. Nuh have no recovery.
import-profile-help = Bring een profayl by CID ar file. Yu need di same pasfrayz yu use wen yu piblish.
import-profile-detected-user = Di profayl belong to: { $name }
status-unlocking = unlocking...
status-generating = generating identity...
status-reading-file = reading file...
status-fetching-profile = a fetch di profayl from IPFS...
status-imported = imported '{ $name }' — switch to Login tab
status-importing-profile = a bring een di profayl...
profile-import-done = profayl bring een fi '{ $name }' — { $n } key load
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' nuh find
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrase dem nuh match
error-profile-source-required = give CID or upload file
error-did-required = put in yu DID
error-profile-fetch = cyaan fetch di profayl: { $e }
error-profile-no-username = di profayl nuh have no username
error-profile-no-identity = identity '{ $name }' nuh find — bring een identity firs

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help fi get a list of commands.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publish tru local ma ({ $url })
msg-ma-connecting-matrix = trying to connect you to the 間trix
msg-local-ma-claimed = claimed local 間
msg-local-ma-already-claimed = local 間 already claimed
msg-local-ma-claim-failed = failed to claim local 間
msg-identity-not-published = Di identity nuh foun online — if yu have ma install locally, run '.ma [port]' den '.my.identity!publish @ma'. Type '.help/publish' fi details.
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch error: nuh connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name cyan be empty
err-alias-has-dot = alias name cyan contain '.'
err-alias-has-fragment = alias name cyan contain '#'
err-alias-value-fragment = alias value can hav at mos one DID-URL fragment weh no empty
err-alias-value-path = alias value fi be one did:ma:<ipns> DID or DID-URL (no path)
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
msg-reply-sent = reply sent
msg-reply-failed = reply failed: { $e }
msg-entity-publish-sent = entity { $name }: publish sent
msg-entity-publish-failed = entity publish failed: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish sent
msg-field-publish-failed = field publish failed: { $e }
msg-acl-publish-sent = runtime ACL: publish sent
msg-crud-edit-publish-sent = { $path }: publish sent
msg-acl-publish-failed = runtime ACL publish failed: { $e }
msg-yaml-error = YAML error: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review before eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nuh find
inbox-no-message-id = inbox entry { $n } nuh have message_id
inbox-no-verb = no verb `{ $verb }` fi inbox entry { $n }
inbox-filter-no-arg = filta need DID ar alias aagiment
inbox-filter-empty = no mesij fram { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover failed at { $url }: { $e }
discover-json-error = discover failed: invalid JSON from { $url }: { $e }
discover-missing-did = discover failed: status.json missing required field `did`
discover-invalid-did = discover failed: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` missing in status.json; stored DID only
discover-hint-endpoint-not-found = Hint: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Hint: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Hint: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma discovered at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma mek — run '.my.identity!publish @ma' fi publish yu identity.
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-already-owned = Runtime already claimed by this identity
claim-http-failed = claim failed: HTTP { $status }
claim-error = claim failed: { $e }
claim-no-session = nuh logged in; log in first fi claim the runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = usage: .my.identity!publish <did-or-alias>
identity-exported = Bundle download as { $filename }
identity-export-failed = Export fail: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content is empty
doc-save-first = { $path }.content is empty — save first
doc-missing-name = missing document name
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
doc-store-sent = store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-ipld-store-sent = IPLD store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path }.content (not executed)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = usage: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid is not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Languages available (set with .my.i18n: <code>):

err-lang-not-found = language nuh find: { $lang }

help-header-zion = ── zion comand dem ────────────────────────────────────────────────────────
help-header-messaging = ── messaging ──────────────────────────────────────────────────────────────
help-header-config = ── local config ───────────────────────────────────────────────────────────
help-header-common = ── common path dem ────────────────────────────────────────────────────────
help-header-inbox = ── inbox ──────────────────────────────────────────────────────────────────
help-header-documents = ── document dem (.my.doc.*) ───────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text ya
help-cmd-clear =   .clear                       wipe di terminal
help-cmd-panic =   .panic                       last resort — use if yuh find yuhself inna trouble
help-cmd-history =   .history                     command histri (consecutive duplicate dem merge)
help-cmd-logout =   .logout                      log out
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)
help-msg-echo =   @alias                       show resolved DID/DID-URL (no message sent)
help-msg-send =   @alias!msg body / @alias:verb args           send message / RPC to actor
help-msg-fragment =   @alias#fragment:verb body  send to alias wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (nuh alias lookup)
help-config-get =   .path                        get leaf value or list subtree
help-config-filter =   .path value                  match query (filter by value)
help-config-set =   .path: value                 set leaf
help-config-delete =   .path:                       delete leaf or subtree
help-config-verb =   .path!verb [args]            invoke local verb
help-my =   .my                          show all personal config
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did-url> add/update alias (DID or DID-URL)
help-aliases-del =   .my.aliases.<name>:          remove alias
help-runtime-discover =   .ma [port]          discover local runtime an create @ma alias
help-runtime-claim =   .ma [port]             claim runtime ownership wid yuh DID
help-identity =   .my.identity                 show I and I identity config
help-identity-did =   .my.identity.did             show own DID (read-only)
help-identity-publish =   .my.identity!publish @pub    publish I and I DID via publisher service
help-identity-export =   .my.identity!export          download yuh own identity bundle
help-config-path =   .config                      show all .config.* entries
help-inbox =   .my.inbox                    list inbox (subtree view)
help-inbox-n =   .my.inbox.N                  show entry N field dem
help-inbox-from =   .my.inbox.N.from             sender DID of entry N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (opens editor if nuh body)
help-inbox-open =   .my.inbox.N!open             open entry content read-only inna editor
help-inbox-del =   .my.inbox.N:                 delete entry N
help-inbox-delall =   .my.inbox:                   delete all inbox entries
help-inbox-flush =   .my.inbox!flush              print all entries to terminal
help-inbox-filter =   .my.inbox!filter @who        sho nuo memba fram @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse sender DID document lazily
help-doc-edit =   .my.doc.<name>!edit           open editor wid saved content
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetch CID, open fi review only
help-doc-eval =   .my.doc.<name>!eval           execute saved content line-by-line
help-doc-publish =   .my.doc.<name>!publish @pub   store as raw blob (any type)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    import CID content (nuh execution)
help-doc-cid =   .my.doc.<name>!cid            show stored CID
help-doc-del =   .my.doc.<name>:              delete document

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n stores the language preference tied to your identity.
help-i18n-set =   .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list =   .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room a di space between 間 identity dem. ma mek dem identity find one aneda an communicate; when yuh identity publish, yuh can join in.
help-ma-command =   .ma [port]                   connect to yuh local ma runtime, read /status.json, an save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yuh DID document so odda people can resolve yuh keys an endpoint
help-ma-security = Di clearest trust boundary a yuh own ma runtime wid yuh own IPFS Desktop/Kubo. A remote publisher can useful, but den yuh a depend pan somebody else service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how fi enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When yuh identity known, .enter @ma mek yuh step into 間. Find a world, go inna it, an join in from deh.
help-ma-entry-steps = Start IPFS Desktop an ma, den run .ma. Publish wid .my.identity!publish @ma, find a world, an enter wid .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-leave =   .leave                       leave di room; yuh identity stay active, an yuh still logged in
help-ma-entry-url =   ?enter=<runtime>             enter after login from a shared URL

msg-send-failed = send nuh work: { $e }
msg-not-logged-in = nuh log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML mus bi a mapping (ki: value pair); plain text an scalar cyan store as DAG-CBOR
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
err-popup-blocked = popup block by browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = erra
rpc-error-detail = erra: { $detail }
msg-new-message = ← [{ $from }] new mesij — { $count } inna inbox
msg-chat = { $sender } seh { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } seh { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } come een.
room-leave = * { $name } lef di room.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit decode fail: { $e }
err-edit-fetch-failed = edit fetch fail: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nuh active session — cyaan delete profile
profile-delete-error = profile deletion fail: { $e }
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
profiles-deleted = profile { $name } delete
profiles-not-found = profile nuh find: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-ma =   .help/ma                     ma-space, publishing, and entry
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list entities
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head =   (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail =   (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc =   (define x (@actor:verb arg))  keep RPC replies in the session environment
help-actor-wc-l =   .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    open zion tru URL link
help-topic-i18n =   .help/i18n                   language preference for your identity
help-header-url = ── URL parameter dem ────────────────────────────────────────────────────────────
help-url-intro =   Share a link weh open zion wid di recipient already deh deh:
help-url-msg =   ?msg=<did>                   fill up: @<did>!msg (plain message)
help-url-say =   ?say=<did>                   fill up: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>!emote (emote verb)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input fill up but nuh send yet — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish yu identity pan di network
help-header-publish = ── publish identity ─────────────────────────────────────────────────────────
help-publish-intro = Publishin mek yu identity findable pan di network. Odda people can search yu DID fi reach yu.
help-publish-ma = Fi publish, yu need ma (local runtime) install. It connect ego to IPFS/IPNS fi yu.
help-publish-steps = Steps: run '.ma [port]' fi find di local ma, den '.my.identity!publish @ma'.
help-publish-without = Widout publishin, odda people kyaan reach yu — even if dem know yu DID, dem kyaan resolve yu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = Kyaan fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No valid CID dis: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Warnin: Yuh IPNS privit key a go sen to dis runtime fi publish yuh identity. Only use a runtime yu fully trust.
