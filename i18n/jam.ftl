# zion — Patwa
lang-name = Patwa
label-nick = nickname
new-identity-nick-help = Pick a nickname fi 間-space. A jus nickname, an yu can change it anytime.
error-nick-required = nickname needed
error-nick-invalid = nickname cyaan have space or @

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = konekte
tab-new-identity = nouvo idantite
tab-import-profile = bring een profayl
label-passphrase = pasfraz
label-username = non itilizatè
label-confirm-passphrase = konfime pasfraz
label-did = DID
label-profile-cid = profayl CID
label-or-file = ar file
btn-login = konekte
btn-export = ekspòtasyon
btn-generate = jenere
btn-new-endpoint = nyuu endpoint
btn-import-profile = bring een profayl
btn-show-qr = shou di QR
btn-scan-qr = skyan di QR
qr-scan-hint = Point di kyamra pan wan zion profayl QR kuod.
qr-error-camera = kyamra no de: { $e }
qr-error-too-large = di profayl tuu big fi wan QR kuod
passphrase-warning = Lase passphrase = lase identity. Nuh have no recovery.
import-profile-help = Bring een profayl by CID ar file. Yu need di same pasfrayz yu use wen yu piblish.
import-profile-detected-user = Di profayl belong to: { $name }
status-unlocking = debloke...
status-generating = jenere idantite...
status-reading-file = lekti dosye...
status-fetching-profile = a fetch di profayl from IPFS...
status-imported = imported '{ $name }' — switch to Login tab
status-importing-profile = a bring een di profayl...
profile-import-done = profayl bring een fi '{ $name }' — { $n } key load
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' nuh find
error-username-required = non itilizatè obligatwa
error-passphrase-required = pasfraz obligatwa
error-passphrases-no-match = passphrase dem nuh match
error-profile-source-required = give CID or upload file
error-did-required = put in yu DID
error-profile-fetch = cyaan fetch di profayl: { $e }
error-profile-no-username = di profayl nuh have no username
error-profile-no-identity = identity '{ $name }' nuh find — bring een identity firs

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help fi get a list of commands.
msg-getting-started = Try dis: say Hello world, look, .help, or help.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh pwen final pare
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publish tru local 間 ({ $url })
msg-identity-publication-propagating = Di identity publish stil a spread; entry delay: { $e }
msg-identity-first-publish = A publish identity fi di first time. Dis can tek up to { $seconds } seconds.
msg-ma-connecting-matrix = a try connect yu to di 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 claim
msg-local-ma-already-claimed = local 間 claim already
msg-local-ma-claim-failed = couldn't claim local 間
msg-identity-not-published = Di identity nuh foun online — if yu have 間 install locally, run '.ma: claim [port]' den '.my.identity!publish @ma'. Type '.help/publish' fi details.
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = konsantre klè
msg-left = left
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } se lekti sèlman
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
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
btn-save = Sove
btn-eval = Eval
btn-cancel = Anile
msg-jobs-cancelled = jab dem anile
btn-close = Fèmen
btn-reply = Repons
btn-publish = Pablish
btn-publish-ipld = Publish IPLD
msg-reply-sent = repons voye
msg-reply-failed = reply failed: { $e }
msg-entity-publish-sent = entity { $name }: publish sent
msg-entity-publish-failed = entity publish failed: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish sent
msg-field-publish-failed = field publish failed: { $e }
msg-acl-publish-sent = runtime ACL: publish sent
msg-crud-edit-publish-sent = { $path }: pablish voye
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
discover-hint-endpoint-not-found = Hint: endpoint no fain. Chek seh 間 a shuo /status.json pan port 5003.
discover-hint-server-error = Hint: runtime gi server error. Chek 間 log dem an trai agen.
discover-hint-network = Hint: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 discovered at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma mek — run '.my.identity!publish @ma' fi publish yu identity.
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime deja reklame pa yon lòt idantite
claim-already-owned = Runtime already claimed by dis identity
claim-http-failed = claim failed: HTTP { $status }
claim-error = claim failed: { $e }
claim-no-session = nuh logged in; log in first fi claim the runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (konplètman louvri)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = Itilizasyon: .my.identity!publish <did-or-alias>
identity-exported = Bundle download as { $filename }
identity-export-failed = Export fail: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path } vid
doc-save-first = { $path } vid — sove an premye
doc-missing-name = non dokiman ki manke
doc-publish-usage = Itilizasyon: .my.doc.<name>!publish <piblikatè>
doc-publish-ipld-usage = Itilizasyon: .my.doc.<name>!publish-ipld <piblikatè>
doc-publish-failed = publish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = konekte ankò pou ego ka jwenn aksè nan kle idantite w yo
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifye dokiman DID piblikatè a pablish epi li gen yon pwen final ki ka jwenn
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin te rejte demann lan; enspekte netwokn an epi eseye refè apre ranje antite / ègzekutabl
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = enspekte mòso bwa pou egzekite kòz detaye epi eseye eseye ankò
doc-store-sent = store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-ipld-store-sent = IPLD store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path } (not executed)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = itilizasyon: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid pa mete
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
help-header-i18n = ── lang ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── k ap antre nan 間-espas ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text ya
help-cmd-clear =   .clear                       wipe di terminal
help-cmd-panic =   .panic                       last resort — use if yuh find yuhself inna trouble
help-cmd-history =   .history [n]                 command histri (consecutive duplicate dem merge); optional n show onli di last n lain dem
help-cmd-logout = .logout                      dekonekte
help-cmd-batch =   .batch                       eval scratch dakiment parallel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         eval scratch dakiment lain bai lain
help-msg-echo = @alias                       show resolved DID/DID-URL (no message sent)
help-msg-send = @alias!msg body / @alias:verb args           send message / RPC to actor
help-msg-fragment =   @alias#fragment:verb body  send to alias wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (nuh alias lookup)
help-config-get = .path                        jwenn valè fèy oswa lis subtree
help-config-filter = .path [niem]                 lis pikni ki niem dem hab niem
help-config-full = .path. [niem]                lis ful subtree valu dem weh hab niem
help-config-set = .path: value                 mete fèy
help-config-delete = .path:                       efase fèy oswa subtree
help-config-verb = .path!verb [args]            envoke vèb lokal
help-my = .my                          montre tout konfigirasyon pèsonèl yo
help-aliases =   .my.aliases                  list alias dem
help-aliases-set = .my.aliases.<name>: <did-url> add/update alias (DID or DID-URL)
help-aliases-del = .my.aliases.<name>:          retire alyas
help-runtime-discover =   .ma: claim [port]          discover local runtime an create @ma alias
help-runtime-claim =   .ma: claim [port]             claim runtime ownership wid yuh DID
help-identity =   .my.identity                 show I and I identity config
help-identity-did = .my.identity.did             montre pwòp DID (li sèlman)
help-identity-publish =   .my.identity!publish @pub    publish I and I DID via publisher service
help-identity-export =   .my.identity!export          download yuh own identity bundle
help-config-path =   .config                      show all .config.* entries
help-inbox = .my.inbox                    bwat resepsyon lis (view subtree)
help-inbox-n =   .my.inbox.N                  show entry N field dem
help-inbox-from = .my.inbox.N.from             moun k ap voye DID antre N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (opens editor if nuh body)
help-inbox-open =   .my.inbox.N!open             open entry content read-only inna editor
help-inbox-del = .my.inbox.N:                 efase antre N
help-inbox-delall = .my.inbox:                   efase tout antre bwat resepsyon yo
help-inbox-flush = .my.inbox!flush              enprime tout antre nan tèminal
help-inbox-filter =   .my.inbox!filter @who        sho nuo memba fram @who
help-inbox-traverse = .my.inbox.N.sender.<field>   traverse sender DID dokiman parese
help-doc-edit =   .my.doc.<name>!edit           open editor wid saved content
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetch CID, open fi review only
help-doc-eval = .my.doc.<name>!eval           egzekite kontni sove liy-pa-liy
help-doc-publish = .my.doc.<name>!publish @pub   magazen kòm blob anvan tout koreksyon (nenpòt kalite)
help-doc-publish-ipld = .my.doc.<name>!publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    import CID content (nuh execution)
help-doc-cid = .my.doc.<name>!cid            show stored CID
help-doc-del = .my.doc.<name>:              efase dokiman an

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n estoke preferans lang ki asosye ak idantite w.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lis kòd lang ki disponib yo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room a di space between 間 identity dem. ma mek dem identity find one aneda an communicate; when yuh identity publish, yuh can join in.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   connect to yuh local 間 runtime, read /status.json, an save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yuh DID document so odda people can resolve yuh keys an endpoint
help-ma-security = Di clearest trust boundary a yuh own 間 runtime wid yuh own IPFS Desktop/Kubo. A remote publisher can useful, but den yuh a depend pan somebody else service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how fi enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When yuh identity known, .enter @ma mek yuh step into 間. Find a world, go inna it, an join in from deh.
help-ma-entry-steps = Start IPFS Desktop an ma, den run .ma. Publish wid .my.identity!publish @ma, find a world, an enter wid .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-toggle =   .enter                       ton di room focus on or off; yuh identity stay active
help-ma-entry-url = ?enter=<runtime>             antre apre ou fin konekte nan yon URL pataje

msg-send-failed = send nuh work: { $e }
msg-not-logged-in = nuh log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML mus bi a mapping (ki: value pair); plain text an scalar cyan store as DAG-CBOR
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
err-history-count-invalid = history kount fi be a pozitiv hool numba
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
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profail enkrip an sen go IPFS; DID dakiment a go opdeit wen CID kom
profile-publish-done = profail publish — DID dakiment opdeit wid ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = idantite deja pablish - profayl jiska dat
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = kontni binè (pa parèt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (okenn)
profiles-deleted = profile { $name } delete
profiles-not-found = profile nuh find: { $name }

# -- Help topics index
help-header-topics = -- taapik -- taip .help/<topic> fi di ditael
help-topic-msg =   .help/msg                    message dem
help-topic-ma = .help/ma                     間-espas, pablish, ak antre
help-topic-path = .help/path                   gramè lokal dot-chemen
help-topic-my =   .help/my                     persnal config
help-topic-inbox =   .help/inbox                  inbox box
help-topic-doc =   .help/doc                    dakiment dem
help-topic-actor =   .help/actor                  far actor
help-topic-zscheme =   .help/zscheme               Scheme ekspreshan ina line an docs
help-unknown-topic =   .help/{ $topic }: taapik no nuo

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

help-topic-url =   .help/url                    open zion tru URL link
help-topic-i18n = .help/i18n                   preferans lang pou idantite w
help-header-url = ── URL parameter dem ────────────────────────────────────────────────────────────
help-url-intro =   Share a link weh open zion wid di recipient already deh deh:
help-url-msg =   ?msg=<did>                   fill up: @<did>!msg (plain message)
help-url-say =   ?say=<did>                   fill up: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>!emote (emote verb)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             antre nan mond lan apre konekte
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input fill up but nuh send yet — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish yu identity pan di network
help-header-publish = ── publish identity ─────────────────────────────────────────────────────────
help-publish-intro = Publishin mek yu identity findable pan di network. Odda people can search yu DID fi reach yu.
help-publish-ma = Fi publish, yu need 間 (local runtime) install. It connect ego to IPFS/IPNS fi yu.
help-publish-steps = Steps: run '.ma: claim [port]' fi find di local 間, den '.my.identity!publish @ma'.
help-publish-without = Widout publishin, odda people kyaan reach yu — even if dem know yu DID, dem kyaan resolve yu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = se di profail niem: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolekte pakèt - tape kòmandman, fini ak .batch
batch-already-collecting = Deja kolekte yon pakèt - fini ak .batch an premye
batch-empty = Pakèt te vid - pa gen anyen yo kouri
batch-running = Batch a ron…
batch-step-timeout = etap pakèt kwonometre soti

batch-done = Batch don inna { $secs }s — { $steps } step
batch-done-error = Batch don wid error inna { $secs }s — { $steps } step
msg-timeout = Message taim out (no reply inna 60s)
err-unknown-command = komaan no nuo: { $path }
err-read-only-path = { $path } a onggl fi riid
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        eval scratch dakiment parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Kyaan fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No valid CID dis: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Warnin: Yuh IPNS privit key a go sen to dis runtime fi publish yuh identity. Only use a runtime yu fully trust.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme luk pon Scheme ekspreshan weh deh ina zion command an splice di result ina di line before it send.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; send "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definition dem stay fi dis login session
help-zscheme-doc = Dakiment: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Local IPFS gateway (browser exception needed)

tab-config = settings
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
