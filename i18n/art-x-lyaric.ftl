# art-x-lyaric — Dread Talk / Lyaric (Rasta)
# Rastafarian Lyaric dialect, also known as Dread Talk or Lyaric.
# BCP-47 private-use tag: art-x-lyaric
lang-name = Lyaric
label-nick = call-name
new-identity-nick-help = Choose a call-name fi 間-space. Is only a call-name, an can change any time.
error-nick-required = call-name required
error-nick-invalid = call-name cyan contain spaces or @

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = enter Zion
tab-new-identity = nouvo I-dentity
tab-import-profile = bring in I-profile
label-passphrase = pass phrase
label-username = I-name
label-confirm-passphrase = confirm pass phrase
label-did = DID
label-profile-cid = I-profile CID
label-or-file = oswa dosye
btn-login = enter
btn-export = carry out
btn-generate = manifest
btn-new-endpoint = new overstanding
btn-import-profile = bring in I-profile
btn-show-qr = show di QR
btn-scan-qr = scan di QR
qr-scan-hint = Point di camera pon a zion I-profile QR code.
qr-error-camera = camera nah reach: { $e }
qr-error-too-large = I-profile too big fi one QR code
passphrase-warning = Lose pass phrase = lose identity. There is no recovery in Babylon.
import-profile-help = Bring in I-profile by CID or file. Same pass phrase used when publishing needed, seen?
import-profile-detected-user = I-profile belong to: { $name }
status-unlocking = opening...
status-generating = manifesting identity...
status-reading-file = lekti dosye...
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
msg-getting-started = Try dis: say Hello world, look, .help, or help.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint irie
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID published through I-an-I local 間 ({ $url })
msg-identity-publication-propagating = Di identity publish still a spread out; entry hold back: { $e }
msg-identity-first-publish = A publish identity fi di first time. Dis can tek up to { $seconds } seconds.
msg-ma-connecting-matrix = I-an-I a try connect yuh to di 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 claim done
msg-local-ma-already-claimed = local 間 already claim
msg-local-ma-claim-failed = local 間 claim fall down
msg-identity-not-published = Ites not inna di web — if 間 install inna di machine, run '.ma [port]' den '.my.identity!publish @ma'. Write '.help/publish' fi di details.
msg-blocked = ⊗ blocked by Zion [{ $cap }]: { $from }
msg-focus-cleared = konsantre klè
msg-left = left
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = removed { $path } ({ $count } entries)
msg-read-only = { $path } se lekti sèlman
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-link-not-connected = link fetch: nuh connected
msg-link-fetch-error = link fetch: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias I-name cyan be empty
err-alias-has-dot = alias I-name cyan contain '.'
err-alias-has-fragment = alias I-name cyan contain '#'
err-alias-value-fragment = alias value may contain at most one non-empty DID-URL fragment
err-alias-value-path = alias value must be a did:ma:<ipns> DID or DID-URL (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Keep
btn-eval = Livity
btn-cancel = Anile
msg-jobs-cancelled = wuk anile
btn-close = Fèmen
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
discover-hint-endpoint-not-found = Hint: endpoint no found. Check seh 間 expose /status.json pon port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check 間 log dem and try again.
discover-hint-network = Hint: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 found at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma create — run '.my.identity!publish @ma' fi publish di ites.
claim-success = Runtime claim for { $did } in Iration
claim-conflict = Runtime already claim by another I-dentity
claim-already-owned = Runtime already claim by dis I-dentity
claim-http-failed = claim fall: HTTP { $status }
claim-error = claim fall: { $e }
claim-no-session = nuh entered; enter first fi claim di runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully irie and open)
acl-persist-error = keeping trouble: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = livity: .my.identity!publish <did-or-alias>
identity-exported = Bundle downpressed as { $filename }
identity-export-failed = Export nah work: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path } empty
doc-save-first = { $path } empty — keep it first
doc-missing-name = document I-name missing
doc-publish-usage = livity: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = livity: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = manifest { $path }: { $e }
doc-publish-ipld-failed = manifest-ipld { $path }: { $e }
doc-publish-error-detail = publish fall [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = konekte ankò pou ego ka jwenn aksè nan kle I-dentity w yo
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifye dokiman DID piblikatè a manifest epi li gen yon pwen final ki ka jwenn
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin te rejte demann lan; enspekte networkn an epi eseye refè apre ranje antite / ègzekutabl
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = enspekte mòso bwa pou egzekite kòz detaye epi eseye eseye ankò
doc-store-sent = store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-ipld-store-sent = IPLD store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-fetch-done = brought { $cid } → { $path } (not livity)
doc-fetch-failed = bringing { $cid }: { $e }
doc-fetch-usage = livity: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Irie languages in Zion (set with .my.i18n: <code>):

err-lang-not-found = I-language nuh find: { $lang }

help-header-zion = ── zion commands — Irie ───────────────────────────────────────────────────
help-header-messaging = ── I-messages ─────────────────────────────────────────────────────────────
help-header-config = ── I-config grammar ───────────────────────────────────────────────────────
help-header-common = ── I-paths ────────────────────────────────────────────────────────────────
help-header-inbox = ── I-box ──────────────────────────────────────────────────────────────────
help-header-documents = ── I-writings (.my.doc.*) ─────────────────────────────────────────────────
help-header-i18n = ── lang ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── k ap antre nan 間-espas ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis I-text
help-cmd-clear =   .clear                       clear di terminal
help-cmd-panic =   .panic                       last resort — use if I-self find trouble in Babylon
help-cmd-history =   .history                     I-command history (consecutive repeats mash inna one)
help-cmd-logout =   .logout                      depart from Zion
help-cmd-batch =   .batch                       eval scratch dakiment parallel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         eval scratch dakiment lain bai lain
help-msg-echo = @alias                       show resolved DID/DID-URL (no message sent)
help-msg-send =   @alias!msg body / @alias:verb args           send message / RPC to I-dren
help-msg-fragment =   @alias#fragment:verb body  send to I-name wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (no I-name search)
help-config-get =   .path                        sight leaf value or list subtree
help-config-filter =   .path [name]                 list pickney key name dem wid name
help-config-full =   .path. [name]                list full subtree value dem wid name
help-config-set = .path: value                 mete fèy
help-config-delete =   .path:                       remove leaf or subtree
help-config-verb =   .path!verb [args]            invoke I-local verb
help-my =   .my                          sight all personal I-config
help-aliases =   .my.aliases                  list I-names
help-aliases-set = .my.aliases.<name>: <did-url> add/update alias (DID or DID-URL)
help-aliases-del =   .my.aliases.<name>:          remove I-name
help-runtime-discover =   .ma [port]          discover local runtime and manifest @ma I-name
help-runtime-claim =   .ma [port]             claim runtime ownership with I and I DID
help-identity =   .my.identity                 sight I and I identity config
help-identity-did =   .my.identity.did             sight I and I DID (I-sight only)
help-identity-publish =   .my.identity!publish @pub    publish I and I DID via publisher
help-identity-export =   .my.identity!export          download I-and-I identity bundle
help-config-path =   .config                      sight all .config.* entries
help-inbox =   .my.inbox                    sight I-box (subtree view)
help-inbox-n =   .my.inbox.N                  sight entry N fields
help-inbox-from = .my.inbox.N.from             moun k ap voye DID antre N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (opens editor if nuh body)
help-inbox-open =   .my.inbox.N!open             open entry in I-sight only in editor
help-inbox-del =   .my.inbox.N:                 remove entry N
help-inbox-delall =   .my.inbox:                   remove all I-box entries
help-inbox-flush =   .my.inbox!flush              manifest all entries to terminal
help-inbox-filter =   .my.inbox!filter @who        sight only I-box from @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse sender DID document in I-time
help-doc-edit =   .my.doc.<name>!edit           open editor with saved I-writing
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetch CID, open for I-sight only
help-doc-eval =   .my.doc.<name>!eval           execute saved I-writing line by line
help-doc-publish = .my.doc.<name>!publish @pub   magazen kòm blob anvan tout koreksyon (nenpòt kalite)
help-doc-publish-ipld = .my.doc.<name>!publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bring in CID content (no execution)
help-doc-cid =   .my.doc.<name>!cid            sight stored CID
help-doc-del =   .my.doc.<name>:              remove I-writing from Zion

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n estoke preferans lang ki asosye ak I-dentity w.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lis kòd lang ki disponib yo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room a di space between 間 identity dem. ma mek dem identity deh find one anedda an reason; when yuh identity publish, yuh can tek part.
help-ma-command =   .ma [port]                   link to yuh local 間 runtime, read /status.json, an save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yuh DID document so odda can resolve yuh key dem an endpoint
help-ma-security = Di clearest trust boundary a yuh own 間 runtime wid yuh own IPFS Desktop/Kubo. A remote publisher can help, but den yuh lean pon somebody else service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how fi enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When yuh identity known, .enter @ma mek yuh step into 間. Find a world, enter it, an tek part from deh.
help-ma-entry-steps = Start IPFS Desktop an ma, den run .ma. Publish wid .my.identity!publish @ma, find a world, an enter wid .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-toggle =   .enter                       toggle di room focus on or off; yuh identity stay active
help-ma-entry-url = ?enter=<runtime>             antre apre ou fin konekte nan yon URL pataje

msg-send-failed = send nuh forward: { $e }
msg-not-logged-in = I an I nuh log in, seen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML dwe yon kat (kle: pè valè); tèks klè ak eskalatè vid yo pa ka estoke kòm 91
dagcbor-encode-error = DAG-CBOR encode error: { $e }
cbor-decode-error = CBOR decode error: { $e }
cbor-json-error = CBOR to JSON error: { $e }
yaml-serialise-error = YAML serialise error: { $e }
edit-reply-invalid = repons modifye pa valab
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
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile lock up an send to IPFS; DID document a go update when CID come
profile-publish-done = profile publish — DID document update wid ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = I-dentity deja manifest - I-profile jiska dat
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = kontni binè (pa parèt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (okenn)
profiles-deleted = profile { $name } gone
profiles-not-found = profile nuh deh: { $name }

# -- Help topics index
help-header-topics = -- taapik -- taip .help/<topic> fi di ditael
help-topic-msg =   .help/msg                    message dem
help-topic-ma = .help/ma                     間-espas, manifest, ak antre
help-topic-path = .help/path                   gramè lokal dot-chemen
help-topic-my =   .help/my                     personal settings
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    dakiment dem
help-topic-actor =   .help/actor                  far actor
help-topic-zscheme =   .help/zscheme               Scheme talk ina line an docs
help-unknown-topic =   .help/{ $topic }: topic no known

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       shuo di DID weh rizalv
help-actor-text = @actor[#entity]!msg|!say|!emote body         voye mesaj dirèk/chat/emote
help-actor-ping = @actor:ping                  lavi ping
help-actor-entities =   @actor/entities              lis entity dem
help-actor-entities-get = @actor/entities/<n>          jwenn node antite
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit di entity
help-actor-entities-del = @actor/entities/<n>:         efase antite
help-actor-config-get =   @actor/config/<key>          get config valyu
help-actor-config-set =   @actor/config/<key>: val     set config valyu
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              fix ACL
help-actor-fragment =   @actor#entity                sen go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  kenbe repons 5 nan anviwònman sesyon an
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    open Zion tru a URL link
help-topic-i18n = .help/i18n                   preferans lang pou I-dentity w
help-header-url = ── URL I-parameters ─────────────────────────────────────────────────────────────
help-url-intro =   Share a link fi open Zion wid a I-recipient ready fill:
help-url-msg =   ?msg=<did>                   fill up: @<did>!msg (I-message)
help-url-say =   ?say=<did>                   fill up: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>!emote (emote verb)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             antre nan mond lan apre konekte
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di I-input fill up but not send — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish di ites pon di network
help-header-publish = ── publish di ites ──────────────────────────────────────────────────────────
help-publish-intro = Publishing mek di ites findable pon di network. Odda ones can search di DID fi reach.
help-publish-ma = Fi publish, InI need 間 (local runtime) install. It bridge ego to IPFS/IPNS pon di behalf.
help-publish-steps = Steps: run '.ma [port]' fi find di local 間, den '.my.identity!publish @ma'.
help-publish-without = Without publishing, odda ones cannot reach — even knowing di DID, dem cannot resolve di endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = name di profile: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolekte pakèt - tape kòmandman, fini ak .batch
batch-already-collecting = Deja kolekte yon pakèt - fini ak .batch an premye
batch-empty = Pakèt te vid - pa gen anyen yo kouri
batch-running = Batch a ron…
batch-step-timeout = etap pakèt kwonometre soti

batch-done = Batch don inna { $secs }s — { $steps } step
batch-done-error = Batch don wid error inna { $secs }s — { $steps } step
msg-timeout = Message taim out (no reply inna 60s)
err-unknown-command = command no known: { $path }
err-read-only-path = { $path } a read-only
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        eval scratch dakiment parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } cyaan fetch: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No real CID dis: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Watchout: Yuh IPNS private key ago sen to dis runtime fi publish yuh livity. Only use a runtime yuh fully trust, Iyah.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme sight up Scheme speech inside zion command, an sew di answer ina di line before it send.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inna-line example; send "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definition dem stay fo dis login sitting
help-zscheme-doc = Writings: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Local IPFS gateway (need browser livity)

tab-config = settings
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
