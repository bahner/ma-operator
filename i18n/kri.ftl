# zion — Krio
lang-name = Krio
label-nick = niknem
new-identity-nick-help = Pik wan niknem for 間-space. Na jos niknem, yu kin chenj am eni taim.
error-nick-required = niknem nid
error-nick-invalid = niknem nor fo get spes or @

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login fɔ login
tab-new-identity = new identity
tab-import-profile = bring profayl kɔmɔt
label-passphrase = passfraze
label-username = yuza nem
label-confirm-passphrase = konfam passfraze
label-did = DID
label-profile-cid = profayl CID
label-or-file = ɔ fayl
btn-login = login fɔ login
btn-export = eksport
btn-generate = jenaret
btn-new-endpoint = nyu endpoint
btn-import-profile = bring profayl kɔmɔt
btn-show-qr = sho di QR
btn-scan-qr = skan di QR
qr-scan-hint = Point di kamera pan wan zion profayl QR kod.
qr-error-camera = kamera nɔ de: { $e }
qr-error-too-large = di profayl big pas wetin QR kod ebul kya
passphrase-warning = Lus passfraze = lus identity. Nor get no wei fi get am bak.
import-profile-help = Bring profayl kɔmɔt bay CID ɔ fayl. Yu nid di sem pasfrez we yu yuz wen yu pɔblish.
import-profile-detected-user = Di profayl bɛlɔŋ tu: { $name }
status-unlocking = de unlok...
status-generating = de jenaret identity...
status-reading-file = de rid fail...
status-fetching-profile = dɛn bring profayl kɔmɔt na IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = import '{ $name }' — switch go Login tab
status-importing-profile = dɛn bring profayl kɔmɔt...
profile-import-done = profayl bring kɔmɔt fɔ '{ $name }' — { $n } ki lod
error-wrong-passphrase = rong passfraze: { $e }
error-identity-not-found = identity '{ $name }' nor fine
error-username-required = yuza nem nid
error-passphrase-required = passfraze nid
error-passphrases-no-match = passfraze dem nor match
error-profile-source-required = giv CID ɔ ɔplod fayl
error-did-required = put DID yu
error-profile-fetch = nɔ pɔsɔbul fɔ gɛt profayl: { $e }
error-profile-no-username = di profayl nɔ gɛt yuzɔnem
error-profile-no-identity = aydɛntɪti '{ $name }' nɔ fɔnd — bring aydɛntɪti kɔmɔt fɔs

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — login as { $username }
msg-type-help = Taip .help fi get list ɔf komand dem.
msg-getting-started = Tray: say Hello world, look, .help, ɔ help.
msg-connecting = de konect go iroh...
msg-iroh-ready = iroh endpoint redi
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID don pablish tru local 間 ({ $url })
msg-identity-publication-propagating = Di identity publish stil de spread; entry don delay: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = De publish identity. Dis fit tek up to { $seconds } sekond.
msg-ma-connecting-matrix = de tray fo konekt yu go di 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 dɔn claim
msg-local-ma-already-claimed = local 間 dɔn claim bifo
msg-local-ma-claim-failed = nɔ bin able claim local 間
msg-identity-not-published = Ɔpsɛt nɔ fɔ gɛt ɔnlain — ɛf 間 dɔn sɛt ɛp fo yɔ, ron '.ma: claim [port]' den '.my.identity!publish @ma'. Rait '.help/publish' fo mɔ infɔmeshɔn.
msg-blocked = ⊗ blok [{ $cap }]: { $from }
msg-focus-cleared = fokɔs klia
msg-left = left
msg-focusing = fokɔs { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = delete { $path } ({ $count } entri dem)
msg-read-only = { $path } na rid-only
msg-subtree-set = { $path } na wan sabtri; rifiyuz fi set am
msg-ancestor-leaf = wan ansesta ɔf { $path } na wan lif; rifiyuz fi shadɔ am
msg-key-not-found = ki nor fine: { $path }
msg-link-not-connected = link fetch ɛrɔ: nor konect
msg-link-fetch-error = link fetch ɛrɔ: { $e }
msg-link-key-not-found = ki `{ $key }` nor fine insaid di linkid dokument

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias nem nor fit bi empty
err-alias-has-dot = alias nem nor fit get '.'
err-alias-has-fragment = alias nem nor fit get '#'
err-alias-value-fragment = alias value kin get at mos wan DID-URL fragment we noh empty
err-alias-value-path = alias value mas bi did:ma:<ipns> DID ɔ DID-URL (noh path)
err-alias-not-did = alias value mas stat wit did:ma:
err-unknown-alias = unkown alias: @{ $name }
err-bare-did = ekspekt bɛ did:ma:<ipns> (nor get fragment ɔ path), get { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Sev
btn-eval = Eval
btn-cancel = Kansel
msg-jobs-cancelled = wok dɛn kansel
btn-close = Kloz
btn-reply = Rɛpli
btn-publish = Pɔblish
btn-publish-ipld = Pɔblish IPLD
msg-reply-sent = rɛpli don sen
msg-reply-failed = rɛpli fail: { $e }
msg-entity-publish-sent = entity { $name }: pɔblish don sen
msg-entity-publish-failed = entity pɔblish fail: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: pɔblish don sen
msg-field-publish-failed = field pɔblish fail: { $e }
msg-acl-publish-sent = runtime ACL: pɔblish don sen
msg-crud-edit-publish-sent = { $path }: pɔblish don sen
msg-acl-publish-failed = runtime ACL pɔblish fail: { $e }
msg-yaml-error = YAML ɛrɔ: { $e }
msg-editor-saved = { $path }:sev
msg-fetch-review = fetch { $cid } — riview bifo eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entri { $n } nor fine
inbox-no-message-id = inbox entri { $n } nor get message_id
inbox-no-verb = nor get vɛb `{ $verb }` fɔ inbox entri { $n }
inbox-filter-no-arg = filta nid DID ɔr alias argument
inbox-filter-empty = nɔ mesej fɔm { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskɔva fail at { $url }: { $e }
discover-json-error = diskɔva fail: invalid JSON from { $url }: { $e }
discover-missing-did = diskɔva fail: status.json nor get `did` field
discover-invalid-did = diskɔva fail: ekspekt `did` fi stat wit did:ma:, get `{ $did }`
discover-no-endpoint = diskɔva waning: `endpoint_id` nor dɛ status.json; sev DID only
discover-hint-endpoint-not-found = Hint: endpoint no de. Check say 間 dey show /status.json pan port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check 間 log dem en try bak.
discover-hint-network = Hint: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 diskɔva at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias mek — ron '.my.identity!publish @ma' fo pɔblish yu ɔpsɛt.
claim-success = Runtime claim fɔ { $did }
claim-conflict = Runtime already claim by anɔdɔ identity
claim-already-owned = Runtime dɔn claim by dis identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor login; login fɛs fi claim di runtime
runtime-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
err-persist = pɛsist ɛrɔ: { $e }
acl-no-verb = nor get vɛb `{ $verb }` fɔ .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = yusij: .my.identity!publish <did-ɔ-alias>
identity-exported = Bɔndɔl dɔnlod as { $filename }
identity-export-failed = Ekspɔt fɛl: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path } empty
doc-save-first = { $path } empty — sev fɛs
doc-missing-name = dokument nem nor dɛ
doc-publish-usage = yusij: .my.doc.<nem>!publish <pɔblisha>
doc-publish-ipld-usage = yusij: .my.doc.<nem>!publish-ipld <pɔblisha>
doc-publish-failed = pɔblish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = pɔblish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-ipld-store-sent = IPLD stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-fetch-done = fetch { $cid } → { $path } (nor execute)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = yusij: .my.doc.<nem>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = nor get vɛb `{ $verb }` fɔ { $path }
path-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lenggwij dem wey dey (set wit .my.i18n: <code>):

err-lang-not-found = langwej nor fine: { $lang }

help-header-zion = ── zion komand dem ────────────────────────────────────────────────────────
help-header-messaging = ── mesej dem ──────────────────────────────────────────────────────────────
help-header-config = ── lokal konfig gramma ────────────────────────────────────────────────────
help-header-common = ── komon paf dem ──────────────────────────────────────────────────────────
help-header-inbox = ── inbox ──────────────────────────────────────────────────────────────────
help-header-documents = ── dokument dem (.my.doc.*) ───────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text
help-cmd-clear =   .clear                       klia terminal
help-cmd-panic =   .panic                       las opshen — yus if yu los yoself
help-cmd-history =   .history [n]                 komand istri (kopi dem wey dɔn folo sɛf bia wanwan); optional n go sho na di las n lain dem
help-cmd-logout =   .logout                      log owt
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         run scratch document line by line
help-msg-echo =   @alias                       sho resolved DID/DID-URL (noh send message)
help-msg-send =   @alias!msg body / @alias:verb args           send mesej / RPC go to ator
help-msg-fragment =   @alias#fragment:verb body  send go to alias wid eksplisit DID fragment
help-msg-escape =   \@name                       literal @name (noh alias lukov)
help-config-get =   .path                        get lif valu or list sabtri
help-config-filter =   .path [nem]                  list pikin ki nem dem get nem
help-config-full =   .path. [nem]                 list ful sabtri valu dem we get nem
help-config-set =   .path: value                 set lif
help-config-delete =   .path:                       dilet lif or sabtri
help-config-verb =   .path!verb [args]            invok lokal vob
help-my =   .my                          shoh all pesonal konifig
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did-url> mek/update alias (DID ɔ DID-URL)
help-aliases-del =   .my.aliases.<name>:          rimov alias
help-runtime-discover =   .ma: claim [port]          diskova lokal runtime en kreyet @ma alias
help-runtime-claim =   .ma: claim [port]             klem runtime onashep wid yu DID
help-identity =   .my.identity                 shoh identity konifig
help-identity-did =   .my.identity.did             shoh on DID (rid onli)
help-identity-publish =   .my.identity!publish @pub    pablish on DID bifo pablisha sovic
help-identity-export =   .my.identity!export          dɔnlod yu ɔn idɛntiti bɔndɔl
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N fild dem
help-inbox-from =   .my.inbox.N.from             senda DID foh entri N
help-inbox-reply =   .my.inbox.N!reply [body]     send ripla (opin edita if noh bodi)
help-inbox-open =   .my.inbox.N!open             opin entri kontent rid-onli insay edita
help-inbox-del =   .my.inbox.N:                 dilet entri N
help-inbox-delall =   .my.inbox:                   dilet all inbox entri dem
help-inbox-flush =   .my.inbox!flush              print all entri dem go terminal
help-inbox-filter =   .my.inbox!filter @who        sho ɔnli entri fɔm @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   travos senda DID dokument layzili
help-doc-edit =   .my.doc.<name>!edit           opin edita wid seyvd kontent
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fech CID, opin foh rivyu onli
help-doc-eval =   .my.doc.<name>!eval           eksekut seyvd kontent lin by lin
help-doc-publish =   .my.doc.<name>!publish @pub   stoh as ro blob (eni tayp)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  stoh YAML as strakchad DAG-CBOR IPLD nod
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    impot CID kontent (noh eksekushon)
help-doc-cid =   .my.doc.<name>!cid            shoh stohd CID
help-doc-del =   .my.doc.<name>:              dilet dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n stores the language preference tied to your identity.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 rum na di ples bitwin 間 identity dem. ma mek dem identity fɛn wan anɔda an tɔk; afta yu identity dɔn publish, yu kin jɔin.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   kɔnɛkt to yu lokal 間 runtime, rid /status.json, ɛn sev .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yu DID dɔkyumɛnt so ɔda pipul kin resolve yu keys ɛn endpoint
help-ma-security = Di klia trust boundary na yu yon 間 runtime wit yu yon IPFS Desktop/Kubo. Rimot publisher fit ɛp, bɔt den yu de dipɛn pan ɔda pɔsin savis.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             aw fo ɛnta di 間 rum

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Wɛn pipul sabi yu identity, .enter @ma go mek yu step insay 間. Fɛn wan wɔld, ɛnta am, ɛn jɔin frɔm de.
help-ma-entry-steps = Stat IPFS Desktop ɛn ma, den rɔn .ma. Publish wit .my.identity!publish @ma, fɛn wan wɔld, ɛn ɛnta wit .enter @ma.
help-ma-entry-command =   .enter @ma                  ɛnta 間 tru di @ma runtime
help-ma-entry-toggle =   .enter                       tɔn di rum focus ɔn ɔf ɔf; yu identity stil active
help-ma-entry-url =   ?enter=<runtime>             ɛnta afta login frɔm shared URL

msg-send-failed = sen no go: { $e }
msg-not-logged-in = yu nɔ lɔg in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse ɛrɔ: { $e }
yaml-not-mapping = YAML mas bi mapping (ki: valyu pɛr); plen tɛks ɛn skɛlɛ no kɛn stor as DAG-CBOR
dagcbor-encode-error = DAG-CBOR enkod ɛrɔ: { $e }
cbor-decode-error = CBOR dɛkod ɛrɔ: { $e }
cbor-json-error = CBOR tu JSON ɛrɔ: { $e }
yaml-serialise-error = YAML sɛrialajz ɛrɔ: { $e }
edit-reply-invalid = invalid ɛdit rɛpli
doc-publish-ipld-error = IPLD pɔblish fɛl: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbɔks prune persist ɛrɔ: { $e }
err-config-load = config lod ɛrɔ: { $e }
err-lang-persist = lang persist ɛrɔ: { $e }
err-history-parse = history parse ɛrɔ: { $e }
err-history-load = history lod ɛrɔ: { $e }
err-history-count-invalid = di istri numba fɔ bi wan pozitiv hol namba
err-ipfs-reply-decode = IPFS reply dɛkod fɛl: { $e }
err-edit-cbor = ɛdit CBOR ɛrɔ: { $e }
err-popup-blocked = popup bɔlɔk bai browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ɛrɔ
rpc-error-detail = ɛrɔ: { $detail }
msg-new-message = ← [{ $from }] nyù mɛsej — { $count } de insay inbox
msg-chat = { $sender } se { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } se { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kam insay.
room-leave = * { $name } go awt.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } pick op { $thing }.
err-edit-decode-failed = edit: dipkod fɛl: { $e }
err-edit-fetch-failed = edit: fɛtʃ fɛl: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no aktiv sesin — no fit delet profail
profile-delete-error = profail delet no wok: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = dem lok profayl en send am to IPFS; DID dokyument go update wen CID kam
profile-publish-done = profayl publish — DID dokyument update wit ma.agent CID
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
profiles-deleted = profail { $name } delet
profiles-not-found = profail no dey: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    mesaj dem
help-topic-ma = .help/ma                     間-space, publishing, and entry
help-topic-path = .help/path                   local dot-path grammar
help-topic-my =   .help/my                     persnal config
help-topic-inbox =   .help/inbox                  inbox box
help-topic-doc =   .help/doc                    dokyument dem
help-topic-actor =   .help/actor                  far actor
help-topic-z =   .help/z                      pɔblik ɛn prayvit Scheme kɔntin
help-topic-zscheme =   .help/zscheme               Scheme ɛkspreshɔn insay layn ɛn dɔkyumɛnt
help-unknown-topic =   .help/{ $topic }: topic no sabi

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping = @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              sho entity dem
help-actor-entities-get = @actor/entities/<n>          get entity node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     chenj entity
help-actor-entities-del = @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          tek config valyu
help-actor-config-set =   @actor/config/<key>: val     put config valyu
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              chenj ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  kip 5 riply dɛn na di sɛshɔn ɛnvayrɔmɛnt

help-topic-url =   .help/url                    opin zion tru URL link
help-topic-i18n = .help/i18n                   language preference for your identity
help-header-url = ── URL paramita dem ─────────────────────────────────────────────────────────────
help-url-intro =   Shia wan link we go opin zion wit di pɔsin aredɛ put insɛd:
help-url-msg =   ?msg=<did>                   put bifo: @<did>!msg (simpul mɛsɛj)
help-url-say =   ?say=<did>                   put bifo: @<did>!say (vɛb say)
help-url-emote =   ?emote=<did>                 put bifo: @<did>!emote (vɛb emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input put bifo bɛt na sɛn yet — prɛs Enter fɔ sɛn.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pɔblish yu ɔpsɛt ɔn di nɛtwɔk
help-header-publish = ── pɔblish ɔpsɛt ────────────────────────────────────────────────────────────
help-publish-intro = Pɔblishine mek yu ɔpsɛt fɔ fain ɔn di nɛtwɔk. Ɔda pipul kɛn luk yu DID fɔ rich yu.
help-publish-ma = Fɔ pɔblish, yu nid 間 (lɔkɔl rɔntaim) sɛt ɛp. I kɔnɛkt ego wit IPFS/IPNS fɔ yu.
help-publish-steps = Stɛps: ron '.ma: claim [port]' fɔ faind lɔkɔl ma, den '.my.identity!publish @ma'.
help-publish-without = Widaut pɔblishine, ɔda pipul kɛnnɔ rich yu — even if dɛn nɔ yu DID, dɛn kɛnnɔ sɔlv yu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = put profayl nem: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Batch dey run…
batch-step-timeout = batch step timed out

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
msg-outbox-open-timeout = di actor { $target } no dey reach — di connection don time out afta { $ms }ms
msg-outbox-send-timeout = di sendin to { $target } don time out afta { $ms }ms — di connection fit don drop
err-unknown-command = no sabi koman: { $path }
err-read-only-path = { $path } na for rid nomo
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No bin ebl fo get CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat no bin valid CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Wanin: Yu IPNS praivet ki go sen go dis runtime fo pablish yu adentiti. Yon-li yuz wan runtime we yu trit im.

# -- Help text -- z and my
help-header-z = ── .z ɛn .my ───────────────────────────────────────────────────────────────
help-z-public =   .z.*                       pɔblik ɔ we yu go pɔblish; nɔ stoa sikrit de
help-z-scheme =   .z.scheme                  di Scheme skript we lod ɛn ron we yu stat
help-z-control =   .z.scheme                 yu yusɛf kɔntrol wetin de insay di stat skript
help-z-private =   .my.*                     prayvit lokal kɔnfig; Scheme kin stoa de bak
help-z-choice =   .z.* / .my.*               yuz .z.* fɔ pɔblik Scheme ɛn .my.* fɔ prayvit Scheme

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme de evalyut Scheme ɛkspreshɔn we de insay zion kɔmand, ɛn i de put di rizɔlt insay di layn bifo i sɛn am.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    insay-layn ɛgzampul; i sɛn "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             difinishɔn dem de stay fɔ dis login sɛshɔn
help-zscheme-doc = Dɔkyumɛnt: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokal IPFS getwe (browser eksepshen dey need)

tab-config = settings
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
