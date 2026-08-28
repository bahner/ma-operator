# zion — lang belta (Belter Creole)
lang-name = Lang Belta
label-nick = name
new-identity-nick-help = Chosem xitim name fo 間-space. Im only name, im can change any time.
error-nick-required = name im required
error-nick-invalid = name no can have space or @
# From The Expanse, constructed by linguist Nick Farmer.
# ISO 639-3: qbc (local/private use code)

# ── Pej ingang ────────────────────────────────────────────────────────────
tab-login = ingang
tab-new-identity = nyu selfmang
tab-import-profile = bringin profayel
label-passphrase = sekrit-lang
label-username = mang-nim
label-confirm-passphrase = sikkina sekrit-lang
label-did = DID
label-profile-cid = profayel CID
label-or-file = o fayl
btn-login = ingang
btn-export = tekout
btn-generate = mek
btn-new-endpoint = nyu boneway
btn-import-profile = bringin profayel
btn-show-qr = showim QR
btn-scan-qr = skanim QR
qr-scan-hint = Pointim da kamera na wan zion profayel QR kod, ke.
qr-error-camera = kamera na gut: { $e }
qr-error-too-large = da profayel im tumang big fo wan QR kod
passphrase-warning = Losh sekrit-lang = losh selfmang. Na du finyish wit nating.
import-profile-help = Bringin profayel wit CID o fayl. Im gonya sekrit-lang kopeng fo pablikesim.
import-profile-detected-user = Profayel da fo: { $name }
status-unlocking = uddering...
status-generating = mekking nyu selfmang...
status-reading-file = lit fayl...
status-fetching-profile = dey bring profayel koming IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = '{ $name }' bringin — go ingang tab
status-importing-profile = bringinéfosho profayel...
profile-import-done = profayel bringin fo '{ $name }' — { $n } ki loding
error-wrong-passphrase = sekrit-lang da no gut: { $e }
error-identity-not-found = selfmang '{ $name }' na finyish wit
error-username-required = mang-nim gonya kom
error-passphrase-required = sekrit-lang gonya kom
error-passphrases-no-match = sekrit-lang du na kopeng
error-profile-source-required = tekout CID o upfayel fayl
error-did-required = put in DID fo yu
error-profile-fetch = nating kom fo profayel: { $e }
error-profile-no-username = profayel na hesh mang-nim
error-profile-no-identity = selfmang '{ $name }' na finyish wit — bringin selfmang fosh

# ── Sistem koments terminal ────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ingangé wit { $username }
msg-type-help = Showxa .help fo kowl komands.
msg-getting-started = Try wa: say Hello world, look, .help, or help.
msg-connecting = konekting to iroh...
msg-iroh-ready = iroh endpoint gútegow
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID push out, local 間 ({ $url })
msg-identity-publication-propagating = Identity publish im still gonya out; entry im ta nating gut yet: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Publishing identity. This im can take til { $seconds } seconds.
msg-ma-connecting-matrix = du ta xitim fo konek to da 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 ta klaim
msg-local-ma-already-claimed = local 間 ta klaim bifo
msg-local-ma-claim-failed = local 間 klaim na go
msg-identity-not-published = Inyalowda pashang nowit kewe na la tube — si 間 besh da gut, run '.ma: claim [port]' den '.my.identity!publish @ma'. Slip '.help/publish' fo detay.
msg-blocked = ⊗ hamma [{ $cap }]: { $from }
msg-focus-cleared = fokus na du
msg-left = left
msg-focusing = fokus { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } na du ({ $count } tenye)
msg-read-only = { $path } lit-seng oyedeng
msg-subtree-set = { $path } im gova-kopeng; na du seting
msg-ancestor-leaf = { $path } gova im lef; na du dabali
msg-key-not-found = ki na finyish wit: { $path }
msg-link-not-connected = hámfalla du fech link: na konekt
msg-link-fetch-error = hámfalla du fech link: { $e }
msg-link-key-not-found = ki `{ $key }` na finyish wit im link-dok

# ── Alias falaare ─────────────────────────────────────────────────────────
err-alias-name-empty = alias nim na owkwa im nating
err-alias-has-dot = alias nim na tenye '.'
err-alias-has-fragment = alias nim na tenye '#'
err-alias-value-fragment = alias sanda gonya na mowt wang non-empty DID-URL fragment
err-alias-value-path = alias sanda gonya did:ma:<ipns> DID unte DID-URL (na path)
err-alias-not-did = alias sanda gonya showxa did:ma: diching
err-unknown-alias = alias na sasa: @{ $name }
err-bare-did = bare did:ma:<ipns> kolowda (na wit fragment oyedeng path), towa { $did }

# ── Editow ────────────────────────────────────────────────────────────────
btn-save = hol
btn-eval = du
btn-cancel = na-du
msg-jobs-cancelled = wowk na-du
btn-close = tek-out
btn-reply = bek-showxa
btn-publish = sendowt
btn-publish-ipld = sendowt IPLD
msg-reply-sent = bek-showxa gonya kom
msg-reply-failed = bek-showxa hámfalla: { $e }
msg-entity-publish-sent = entity { $name }: sendowt gonya kom
msg-entity-publish-failed = sendowt entity hámfalla: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: sendowt gonya kom
msg-field-publish-failed = sendowt fild hámfalla: { $e }
msg-acl-publish-sent = runtime ACL: sendowt gonya kom
msg-crud-edit-publish-sent = { $path }: sendowt gonya kom
msg-acl-publish-failed = sendowt runtime ACL hámfalla: { $e }
msg-yaml-error = YAML hámfalla: { $e }
msg-editor-saved = { $path }:hol
msg-fetch-review = { $cid } fech finyish — pensa kowl bifo du
msg-fetch-failed = feching { $cid }: { $e }

# ── Du — inbox ────────────────────────────────────────────────────────────
inbox-empty = inbox im nating
inbox-entry-not-found = inbox tenye { $n } na finyish wit
inbox-no-message-id = inbox tenye { $n } na tenye message_id
inbox-no-verb = na du `{ $verb }` fo inbox tenye { $n }
inbox-filter-no-arg = filtew nid DID wa alias argument
inbox-filter-empty = nating showxa fom { $did }

# ── Du — runtime ──────────────────────────────────────────────────────────
discover-fetch-failed = diskova hámfalla wit { $url }: { $e }
discover-json-error = diskova hámfalla: mal JSON from { $url }: { $e }
discover-missing-did = diskova hámfalla: status.json na tenye `did`
discover-invalid-did = diskova hámfalla: `did` gonya showxa did:ma: diching, towa `{ $did }`
discover-no-endpoint = diskova beleti: `endpoint_id` na finyish wit status.json; DID oyedeng hol
discover-hint-endpoint-not-found = Hint: endpoint na du find. Check im 間 show /status.json na port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check 間 log im en try again.
discover-hint-network = Hint: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 diskova at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias kowl da — run '.my.identity!publish @ma' fo pashang inyalowda setara.
claim-success = Runtime klaim fo { $did }
claim-conflict = Runtime ta klaim by bifo selfmang
claim-already-owned = Runtime ta klaim by dis selfmang
claim-http-failed = kolowda hámfalla: HTTP { $status }
claim-error = kolowda hámfalla: { $e }
claim-no-session = na ingang; ingang diching fo klaim runtime
runtime-no-verb = na du `{ $verb }` fo { $path }

# ── Du — ACL ──────────────────────────────────────────────────────────────
acl-reset = .my.acl reset finyish (udda kowl-wit)
err-persist = hámfalla hol: { $e }
acl-no-verb = na du `{ $verb }` fo .my.acl

# ── Du — selfmang ─────────────────────────────────────────────────────────
publish-usage = showxa: .my.identity!publish <did-oyedeng-alias>
identity-exported = Bundle downye as { $filename }
identity-export-failed = Export bombauch: { $e }

# ── Du — dokuments ────────────────────────────────────────────────────────
doc-content-empty = { $path } im nating
doc-save-first = { $path } im nating — hol diching
doc-missing-name = dokument nim na finyish
doc-publish-usage = showxa: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = showxa: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = sendowt { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish hámfalla [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = faça login novamente para que o ego possa acessar suas chaves de selfmang
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifique se o documento DID do editor foi sendowt e contém um endpoint acessível
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-ipld-store-sent = IPLD hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-fetch-done = { $cid } fech finyish → { $path } (na du-im)
doc-fetch-failed = feching { $cid }: { $e }
doc-fetch-usage = showxa: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid na hol
doc-no-verb = na du `{ $verb }` fo { $path }
path-no-verb = na du `{ $verb }` fo { $path }

# ── Halp — gova ──────────────────────────────────────────────────────────
help-header-zion = ── zion komands ────────────────────────────────────────────────────────────
help-header-messaging = ── showxa ───────────────────────────────────────────────────────────────
help-header-config = ── konfig naxwe ──────────────────────────────────────────────────────────
help-header-common = ── kowl paj du ──────────────────────────────────────────────────────────
help-header-inbox = ── message box ────────────────────────────────────────────────────────────
help-header-documents = ── dokuments ────────────────────────────────────────────────────────────
help-header-i18n = ── lang ───────────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ───────────────────────────────────────────────────────────────
help-header-ma-entry = ── go inside 間-space ─────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Halp — zion komands ───────────────────────────────────────────────────
help-cmd-help =   .help                        dis lit-pej
help-cmd-clear =   .clear                       kel terminal
help-cmd-panic =   .panic                       owkwa keting — du wit problem
help-cmd-history =   .history [n]                 komand histori (sekwens duplikat mash bikik); optional n show only da last n lain
help-cmd-logout =   .logout                      tek-out
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         run scratch document line by line

# ── Halp — showxa ─────────────────────────────────────────────────────────
help-msg-echo =   @alias                       lit resolved DID/DID-URL (na send message)
help-msg-send =   @alias!msg body / @alias:verb args           showxa message / RPC fo actor
help-msg-fragment =   @alias#fragment:verb body  showxa wit DID fragment cler
help-msg-escape =   \@name                       @name leshi (na du alias)

# ── Halp — fokus mod ──────────────────────────────────────────────────────

# ── Halp — konfig naxwe ───────────────────────────────────────────────────
help-config-get =   .path                        sasa lef sanda oyedeng lit gova-kopeng
help-config-filter =   .path [nem]                  lit pikin ki nem dem get nem
help-config-full =   .path. [nem]                 lit gova-kopeng sanda ful we get nem
help-config-set =   .path: value                 set lef
help-config-delete =   .path:                       na-du lef oyedeng gova-kopeng
help-config-verb =   .path!verb [args]            kol lokal verb

# ── Halp — kowl paj du ───────────────────────────────────────────────────
help-my =   .my                          lit kowl selfmang konfig
help-aliases =   .my.aliases                  lit alias kowl
help-aliases-set =   .my.aliases.<name>: <did-url> mek/update alias (DID unte DID-URL)
help-aliases-del =   .my.aliases.<name>:          na-du alias
help-runtime-discover =   .ma: claim [port]          diskova lokal runtime unte mek @ma alias
help-runtime-claim =   .ma: claim [port]             klaim runtime wit yu DID
help-identity =   .my.identity                 lit selfmang konfig
help-identity-did =   .my.identity.did             lit yu DID (lit-seng oyedeng)
help-identity-publish =   .my.identity!publish @pub    sendowt DID wit publishe
help-identity-export =   .my.identity!export          downye yu owp identity bundle
help-config-path =   .config                      lit kowl .config.* tenye

# ── Halp — inbox ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lit inbox (gova-kopeng lit)
help-inbox-n =   .my.inbox.N                  lit tenye N fild kowl
help-inbox-from =   .my.inbox.N.from             DID showxa-mang tenye N
help-inbox-reply =   .my.inbox.N!reply [body]     showxa bek-showxa (editow udda na wit body)
help-inbox-open =   .my.inbox.N!open             udda mbeɗe lit-seng editow
help-inbox-del =   .my.inbox.N:                 na-du tenye N
help-inbox-delall =   .my.inbox:                   na-du kowl inbox tenye
help-inbox-flush =   .my.inbox!flush              lit kowl tenye terminal
help-inbox-filter =   .my.inbox!filter @who        lit kowl tenye fom @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   mali-du DID dok showxa-mang

# ── Halp — dokuments ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           udda editow wit hol mbeɗe
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fech CID, udda lit-seng oyedeng
help-doc-eval =   .my.doc.<name>!eval           du hol mbeɗe lain-wit-lain
help-doc-publish =   .my.doc.<name>!publish @pub   hol as raw blob (kowl tip)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  hol YAML as IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bringin CID mbeɗe (na du-im)
help-doc-cid =   .my.doc.<name>!cid            lit hol CID
help-doc-del =   .my.doc.<name>:              na-du dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n keep lang choice fo dis selfmang.
help-i18n-set =   .my.i18n: <code>             set which lang zion use fo dis selfmang
help-i18n-list =   .my.i18n!list               show all lang codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Da 間 room im da space between 間 identities. ma du da identities find each other and talk; once your identity im published, you can join.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   connect local 間 runtime, read /status.json, save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish your DID document so felota can find your keys and endpoint
help-ma-security = Da clearest trust boundary im your own 間 runtime with your own IPFS Desktop/Kubo. Remote publisher can help, but then you depend on another service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how fo go inside da 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When your identity im known, .enter @ma let you step into 間. Find a world, go in, and join from there.
help-ma-entry-steps = Start IPFS Desktop and 間, then run .ma. Publish wit .my.identity!publish @ma, find world, enter wit .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through da @ma runtime
help-ma-entry-toggle =   .enter                       toggle da room focus on or off; yer identity stays active
help-ma-entry-url =   ?enter=<runtime>             enter after login from shared URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Belter languages (.my.i18n: <code> fo set):
err-lang-not-found = language not found: { $lang }

msg-send-failed = sako nah bringin: { $e }
msg-not-logged-in = inyalowda nah owkwa

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML mus bi mapping (keya: valyu pɛr); plen tèks an skalas no kɛn bi stòrd as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode error: { $e }
cbor-decode-error = CBOR decode error: { $e }
cbor-json-error = CBOR to JSON error: { $e }
yaml-serialise-error = YAML serialise error: { $e }
edit-reply-invalid = resposta de edição inválida
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox prune persist: { $e }
err-config-load = config load error: { $e }
err-lang-persist = lang persist: { $e }
err-history-parse = history parse error: { $e }
err-history-load = history load error: { $e }
err-history-count-invalid = histori namba mus be positive hol namba
err-ipfs-reply-decode = IPFS reply decode failed: { $e }
err-edit-cbor = edit CBOR error: { $e }
err-popup-blocked = popup block by browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = keng ando gonya
rpc-error-detail = fot: { $detail }
msg-new-message = ← [{ $from }] nyú mesej — { $count } in de boks
msg-chat = { $sender } sa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } go sabe { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kopeng insid.
room-leave = * { $name } go owt.
room-drop  = * { $name } drip { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit: fot decode: { $e }
err-edit-fetch-failed = edit: fot fetch: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no session kopeng — no pensa dele profil
profile-delete-error = profil dele bek no go: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile du encrypt im send na IPFS; DID doc pensa update when CID kom
profile-publish-done = profile publish — DID doc update wit ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = selfmang já publicada — profayel atualizado
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (none)
profiles-deleted = profil { $name } dele go
profiles-not-found = profil no found: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> fo detail
help-topic-msg =   .help/msg                    message-talk
help-topic-ma =   .help/ma                     間-space, publish, enter
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     own config
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    docu dem
help-topic-actor =   .help/actor                  far actor
help-topic-z =   .help/z                      public unte private Scheme konten
help-topic-zscheme =   .help/zscheme               Scheme komang insid line unte docs
help-unknown-topic =   .help/{ $topic }: topic na du sabe

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              show entity-list
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     change entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          take config value
help-actor-config-set =   @actor/config/<key>: val     put config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              change ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  call entity RPC from Scheme and wait fo reply
help-actor-head =   (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail =   (<bafy...>)                  include and eval Scheme from IPFS CID
help-actor-wc =   (define x (@actor:verb arg))  keep RPC replies in session env

help-topic-url =   .help/url                    open zion tru URL peng
help-topic-i18n =   .help/i18n                   lang choice fo yer selfmang
help-header-url = ── URL pamitim ──────────────────────────────────────────────────────────────────
help-url-intro =   Fo peng fo open zion wit belter wating already fill:
help-url-msg =   ?msg=<did>                   fill befo: @<did>!msg (basic palabras)
help-url-say =   ?say=<did>                   fill befo: @<did>!say (say verd)
help-url-emote =   ?emote=<did>                 fill befo: @<did>!emote (emote verd)
help-url-ma =   ?ma=<did-or-url>              prefill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input fill but no sen — peng Enter fo sen.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pashang inyalowda setara to da ring
help-header-publish = ── pashang setara ───────────────────────────────────────────────────────────
help-publish-intro = Pashang da setara tube-kewe na la ring. Felota mang DID inyalowda setara fo da kontak.
help-publish-ma = Fo pashang, 間 (local runtime) besh da gut. Im kang ego wit IPFS/IPNS fo inyalowda.
help-publish-steps = Stap: run '.ma: claim [port]' fo find local 間, den '.my.identity!publish @ma'.
help-publish-without = Wit no pashang, felota no kang reach you — even si dem know you DID, dem no kang solve you endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = set profile nem: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Coletando lote — digite komands, termine com .batch
batch-already-collecting = Já coletando um lote – termine primeiro com .batch
batch-empty = O lote estava vazio – nada para executar
batch-running = Batch dey run…
batch-step-timeout = a etapa do lote expirou

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
msg-outbox-open-timeout = actor { $target } fout beltalowda no ka rich um — connection taim owt aftaa { $ms }ms
msg-outbox-send-timeout = sendin go { $target } taim owt aftaa { $ms }ms — di connection maybe drop
err-unknown-command = komang na du sabe: { $path }
err-read-only-path = { $path } pensa read-only
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Pensa CID { $cid } na kang: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat na proper CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Belte wok: Da IPNS priv-key du senye go na dis runtime fo pashang identity. Kowl yuse runtime du fulding trust, walowda.

# -- Help text -- z and my
help-header-z = ── .z unte .my ──────────────────────────────────────────────────────────────
help-z-public =   .z.*                       public o publishable konten; no stash secret ere fo bera
help-z-scheme =   .z.scheme                  di Scheme script im load unte run fo startup
help-z-control =   .z.scheme                 yu kontrol wetin de inside di startup script yusef
help-z-private =   .my.*                     private local config; Scheme fit stash ere too
help-z-choice =   .z.* / .my.*               yus .z.* fo public Scheme unte .my.* fo private Scheme

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme du Scheme komang wey im insid zion komang, den splice result im da line bifo sendowt.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    insid-line example; sendowt "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             define dem stay fo dis ingang session
help-zscheme-doc = Doku: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokal IPFS gateway (browser-go need eksepshen, sa)

tab-config = settings
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
