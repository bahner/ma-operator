# zion — Patwa
lang-name = Patwa

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
passphrase-warning = Lase passphrase = lase identity. Nuh have no recovery.
import-profile-help = Bring een profayl by CID ar file. Yu need di same pasfrayz yu use wen yu piblish.
import-profile-detected-user = Di profayl belong to: { $name }
status-unlocking = debloke...
status-generating = jenere idantite...
status-reading-file = lekti dosye...
status-fetching-profile = a fetch di profayl from IPFS...
status-imported = enpòte 9 — chanje nan tab Login
status-importing-profile = a bring een di profayl...
profile-import-done = profayl bring een fi '{ $name }' — { $n } key load
error-wrong-passphrase = move pasfraz: 18
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
msg-logged-in = zion v6 — konekte kòm 34
msg-type-help = Type .help fi get a list of commands.
msg-connecting = konekte ak 14...
msg-iroh-ready = iroh pwen final pare
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publish tru local ma ({ $url })
msg-ma-connecting-matrix = a try connect yu to di 間trix
msg-local-ma-claimed = local 間 claim
msg-local-ma-already-claimed = local 間 claim already
msg-local-ma-claim-failed = couldn't claim local 間
msg-identity-not-published = Di identity nuh foun online — if yu have ma install locally, run '.ma [port]' den '.my.identity!publish @ma'. Type '.help/publish' fi details.
msg-blocked = ⊗ bloke [11]: 22
msg-focus-cleared = konsantre klè
msg-focusing = konsantre 9 kòm 21
msg-set = { $path }: { $value }
msg-deleted = efase 8 (19 antre)
msg-read-only = { $path } se lekti sèlman
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = pa gen match
msg-link-not-connected = link fetch error: nuh connected
msg-link-fetch-error = erè chache lyen: 18
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name cyan be empty
err-alias-has-dot = alias name cyan contain '.'
err-alias-has-fragment = alias name cyan contain '#'
err-alias-value-fragment = alias value can hav at mos one DID-URL fragment weh no empty
err-alias-value-path = alias value fi be one did:ma:<ipns> DID or DID-URL (no path)
err-alias-not-did = valè alyas dwe kòmanse ak did:32:
err-unknown-alias = alyas enkoni: @QXQ0XQX
err-bare-did = espere bare 14 (pa gen okenn fragman oswa chemen), te resevwa 55

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Sove
btn-eval = Eval
btn-cancel = Anile
btn-close = Fèmen
btn-reply = Repons
btn-publish = Pablish
btn-publish-ipld = Pablish 8
msg-reply-sent = repons voye
msg-reply-failed = repons echwe: 14
msg-entity-publish-sent = antite 7: pablish voye
msg-entity-publish-failed = piblikasyon antite echwe: 23
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = antite 7.17: pablish voye
msg-field-publish-failed = Piblikasyon jaden echwe: 22
msg-acl-publish-sent = runtime 8: pablish voye
msg-crud-edit-publish-sent = { $path }: pablish voye
msg-acl-publish-failed = ègzekutabl 8 pablish echwe: 28
msg-yaml-error = Erè YAML: 12
msg-editor-saved = { $path }:save
msg-fetch-review = chache 8 — revize anvan eval
msg-fetch-failed = chache 6: 16

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nuh find
inbox-no-message-id = inbox entry { $n } nuh have message_id
inbox-no-verb = no verb `{ $verb }` fi inbox entry { $n }
inbox-filter-no-arg = filta need DID ar alias aagiment
inbox-filter-empty = no mesij fram { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = dekouvri echwe nan 19: 29
discover-json-error = dekouvri echwe: envalid 25 soti nan 35: 45
discover-missing-did = dekouvri echwe: status.json manke jaden obligatwa 52
discover-invalid-did = discover failed: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = dekouvri avètisman: 18 ki manke nan status.json; ki estoke DID sèlman
discover-hint-endpoint-not-found = Hint: endpoint no fain. Chek seh `ma` a shuo /status.json pan port 5003.
discover-hint-server-error = Hint: runtime gi server error. Chek `ma` log dem an trai agen.
discover-hint-network = Sijesyon: pwoblèm netwok/koneksyon. Kòmanse 40, verifye localhost:5003 ou ka jwenn, epi pèmèt lokal 101 aksè nan navigatè a.
discover-hint-generic = Sijesyon: verifye 13 ak 25 Desktop ap fonksyone, apresa reesye 59.
discover-success = ma dekouvri nan 17
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma mek — run '.my.identity!publish @ma' fi publish yu identity.
claim-success = Runtime reklame pou 20
claim-conflict = Runtime deja reklame pa yon lòt idantite
claim-already-owned = Runtime already claimed by dis identity
claim-http-failed = reklamasyon echwe: 14 19
claim-error = reklamasyon echwe: 14
claim-no-session = nuh logged in; log in first fi claim the runtime
runtime-no-verb = pa gen okenn vèb 8 pou 24

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (konplètman louvri)
acl-persist-error = pèsiste erè: 15
acl-no-verb = pa gen okenn vèb 8 pou .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = Itilizasyon: .my.identity!publish <did-or-alias>
identity-exported = Bundle download as { $filename }
identity-export-failed = Export fail: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content vid
doc-save-first = { $path }.content vid — sove an premye
doc-missing-name = non dokiman ki manke
doc-publish-usage = Itilizasyon: .my.doc.<name>!publish <piblikatè>
doc-publish-ipld-usage = Itilizasyon: .my.doc.<name>!publish-ipld <piblikatè>
doc-publish-failed = pablish 8: 19
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = konekte ankò pou ego ka jwenn aksè nan kle idantite w yo
doc-publish-hint-target = sèvi ak yon piblikatè valab DID oswa alyas ki netwokud nan bare 57
doc-publish-hint-network = verifye 7 ègzekutabl ak 22 yo ka jwenn, Lè sa a, reesye
doc-publish-hint-resolve = verifye dokiman DID piblikatè a pablish epi li gen yon pwen final ki ka jwenn
doc-publish-hint-acl = mande operatè piblikatè a pou pèmèt DID ou nan 48
doc-publish-hint-runtime = runtime/plugin te rejte demann lan; enspekte netwokn an epi eseye refè apre ranje antite / ègzekutabl
doc-publish-hint-ipfs = tcheke sante lokal 12/17 ak estati egzekite Piblikatè
doc-publish-hint-unknown = enspekte mòso bwa pou egzekite kòz detaye epi eseye eseye ankò
doc-store-sent = demann magazen voye (20) → 31; 40 ap rive atravè repons 60
doc-ipld-store-sent = IPLD demann magazen voye (25) → 36; 45 ap rive atravè repons 65
doc-fetch-done = chache 8 → 19.content (pa egzekite)
doc-fetch-failed = chache 6: 16
doc-fetch-usage = itilizasyon: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid pa mete
doc-no-verb = pa gen okenn vèb 8 pou 24
path-no-verb = pa gen okenn vèb 8 pou 24

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
help-header-ma = ── 3-espas ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── k ap antre nan 間-espas ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text ya
help-cmd-clear =   .clear                       wipe di terminal
help-cmd-panic =   .panic                       last resort — use if yuh find yuhself inna trouble
help-cmd-history =   .history                     command histri (consecutive duplicate dem merge)
help-cmd-logout = .logout                      dekonekte
help-cmd-batch =   .batch                       eval scratch dakiment parallel
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch dakiment lain bai lain
help-msg-echo = @alias                       montre netwokud DID/18 (pa gen okenn mesaj voye)
help-msg-send = @alias!msg body / @alias:verb args           voye mesaj / 15 bay aktè
help-msg-fragment =   @alias#fragment:verb body  send to alias wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (nuh alias lookup)
help-config-get = .path                        jwenn valè fèy oswa lis subtree
help-config-filter = .path value                  matche rechèch (filtre pa valè)
help-config-set = .path: value                 mete fèy
help-config-delete = .path:                       efase fèy oswa subtree
help-config-verb = .path!verb [args]            envoke vèb lokal
help-my = .my                          montre tout konfigirasyon pèsonèl yo
help-aliases =   .my.aliases                  list alias dem
help-aliases-set = .my.aliases.<name>: <did-url> ajoute/mete ajou alyas (DID oswa 55)
help-aliases-del = .my.aliases.<name>:          retire alyas
help-runtime-discover =   .ma [port]          discover local runtime an create @ma alias
help-runtime-claim =   .ma [port]             claim runtime ownership wid yuh DID
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
help-doc-publish-ipld = .my.doc.<name>!publish-ipld @pub  magazen 6 kòm estrikti 25 34 ne
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    import CID content (nuh execution)
help-doc-cid = .my.doc.<name>!cid            montre ki estoke 12
help-doc-del = .my.doc.<name>:              efase dokiman an

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n estoke preferans lang ki asosye ak idantite w.
help-i18n-set = .my.i18n: <code>             chwazi lang 20 itilize pou idantite sa a
help-i18n-list = .my.i18n!list               lis kòd lang ki disponib yo

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
help-ma-entry-toggle =   .enter                       ton di room focus on or off; yuh identity stay active
help-ma-entry-url = ?enter=<runtime>             antre apre ou fin konekte nan yon URL pataje

msg-send-failed = send nuh work: { $e }
msg-not-logged-in = nuh log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML analiz erè: 18
yaml-not-mapping = YAML mus bi a mapping (ki: value pair); plain text an scalar cyan store as DAG-CBOR
dagcbor-encode-error = DAG-CBOR kode erè: 23
cbor-decode-error = CBOR dekode erè: 19
cbor-json-error = Erè CBOR pou 8: 20
yaml-serialize-error = YAML seri erè: 22
edit-reply-invalid = repons modifye pa valab
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = bwat resepsyon taye pèsiste: 21
err-config-load = erè chaj konfigirasyon: 19
err-lang-persist = lang pèsiste: 14
err-history-parse = erè analiz istwa: 21
err-history-load = erè chaj istwa: 20
err-ipfs-reply-decode = Dekode repons IPFS echwe: 26
err-edit-cbor = modifye erè 5: 17
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
profile-wrong-user = pa ka mete 11 pou yon lòt profayl - sèlman pwòp ou a
profile-wrong-user-name = pa ka mete 11 pou 19 — sèlman pwòp profayl ou
profile-no-ma = pa gen 3 ègzekutabl konfigirasyon - kouri 31 an premye
profile-no-cid = pa gen 3 ki estoke pou profayl sa a — kouri 37 an premye
profile-no-cid-in-doc = pa gen okenn profayl 11 yo jwenn nan dokiman DID — kouri 43 an premye
profile-publish-sent = profail enkrip an sen go IPFS; DID dakiment a go opdeit wen CID kom
profile-publish-done = profail publish — DID dakiment opdeit wid ma.agent CID
profile-publish-failed = profayl pablish echwe: 24
profile-fetch-done = profayl chache — kle 18 chaje soti nan 43
profile-fetch-failed = chache profayl echwe: 22
msg-identity-exists = idantite deja pablish - profayl jiska dat
profile-import-exists = profayl 8 deja egziste — efase li an premye
profile-import-wrong-user = dosye gen profayl 22, espere 42

# -- CID content operations
cid-op-binary = kontni binè (pa parèt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = echwe pou jwenn kontni: 25
cid-op-unknown = operasyon kontni enkoni: 27
cid-op-wc = { $lines } liy 18 mo 36 karaktè
profiles-empty = (okenn)
profiles-deleted = profile { $name } delete
profiles-not-found = profile nuh find: { $name }

# -- Help topics index
help-header-topics = -- taapik -- taip .help/<topic> fi di ditael
help-topic-msg =   .help/msg                    message dem
help-topic-ma = .help/ma                     ma-espas, pablish, ak antre
help-topic-path = .help/path                   gramè lokal dot-chemen
help-topic-my =   .help/my                     persnal config
help-topic-inbox =   .help/inbox                  inbox box
help-topic-doc =   .help/doc                    dakiment dem
help-topic-actor =   .help/actor                  far actor
help-unknown-topic =   .help/{ $topic }: taapik no nuo

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       shuo di DID weh rizalv
help-actor-text = @actor[#entity]!msg|!say|!emote body         voye mesaj dirèk/chat/emote
help-actor-ping = @actor:ping                  lavi ping
help-actor-entities =   @actor/entities              lis entity dem
help-actor-entities-get = @actor/entities/<n>          jwenn node antite
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   mete antite pa referans 14
help-actor-entities-edit =   @actor/entities/<n>!edit     edit di entity
help-actor-entities-del = @actor/entities/<n>:         efase antite
help-actor-config-get =   @actor/config/<key>          get config valyu
help-actor-config-set =   @actor/config/<key>: val     set config valyu
help-actor-acl = @actor/acl                   jwenn 4
help-actor-acl-edit =   @actor/acl!edit              fix ACL
help-actor-fragment =   @actor#entity                sen go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── 3 aktè rele ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  rele yon antite 15 soti nan 24 epi tann repons li
help-actor-head = (@actor/path)                chache kontni CRUD aleka nan 31
help-actor-tail = (<bafy...>)                  enkli ak evalye 21 soti nan yon 36 41
help-actor-wc = (define x (@actor:verb arg))  kenbe repons 5 nan anviwònman sesyon an
help-actor-wc-l = .my.scheme.ma!edit           edite ki te sove 11 asistan yo pou idantite sa a

help-topic-url =   .help/url                    open zion tru URL link
help-topic-i18n = .help/i18n                   preferans lang pou idantite w
help-header-url = ── URL parameter dem ────────────────────────────────────────────────────────────
help-url-intro =   Share a link weh open zion wid di recipient already deh deh:
help-url-msg =   ?msg=<did>                   fill up: @<did>!msg (plain message)
help-url-say =   ?say=<did>                   fill up: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>!emote (emote verb)
help-url-ma = ?ma=<did-or-url>              pre-ranpli ègzekutabl DID / 23 URL
help-url-enter = ?enter=<runtime>             antre nan mond lan apre konekte
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input fill up but nuh send yet — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish yu identity pan di network
help-header-publish = ── publish identity ─────────────────────────────────────────────────────────
help-publish-intro = Publishin mek yu identity findable pan di network. Odda people can search yu DID fi reach yu.
help-publish-ma = Fi publish, yu need ma (local runtime) install. It connect ego to IPFS/IPNS fi yu.
help-publish-steps = Steps: run '.ma [port]' fi find di local ma, den '.my.identity!publish @ma'.
help-publish-without = Widout publishin, odda people kyaan reach yu — even if dem know yu DID, dem kyaan resolve yu endpoint.
profile-fetch-did-resolve-failed = DID pa pablish ankò — kouri 28 an premye, apre sa 67 profayl ou a
profile-update-done = profayl mete ajou - kle 18 fizyone soti nan 43
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
help-cmd-batch-async =   .batch:async / .batch        eval scratch dakiment parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Kyaan fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No valid CID dis: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Warnin: Yuh IPNS privit key a go sen to dis runtime fi publish yuh identity. Only use a runtime yu fully trust.
