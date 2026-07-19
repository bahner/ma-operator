# zion — Tok Pisin
lang-name = Tok Pisin

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = lagin
tab-new-identity = nupela identiti
tab-import-profile = kisim profail
label-passphrase = pasfreis
label-username = nem bilong yuzah
label-confirm-passphrase = konfomim pasfreis
label-did = DID
label-profile-cid = profail CID
label-or-file = o fail
btn-login = lagin
btn-export = ekspotim
btn-generate = mekim
btn-new-endpoint = nupela hap
btn-import-profile = kisim profail
passphrase-warning = Lusim pasfreis = lusim identiti. I no gat wei bilong kisim bek.
import-profile-help = Kisim profail long CID o fail. Yu nidim sem pasfreis we yu usim taim yu putim ausait.
import-profile-detected-user = Profail i bilong: { $name }
status-unlocking = i openim...
status-generating = i mekim identiti...
status-reading-file = i ritim fail...
status-fetching-profile = kisim profail long IPFS...
status-imported = impotim '{ $name }' — senisim go long Login tab
status-importing-profile = kisim profail i go...
profile-import-done = profail i kam long '{ $name }' — { $n } ki i kam
error-wrong-passphrase = pasfreis i no stret: { $e }
error-identity-not-found = identiti '{ $name }' i no painim
error-username-required = yuzah nem i mas kamap
error-passphrase-required = pasfreis i mas kamap
error-passphrases-no-match = pasfreis i no mach
error-profile-source-required = givim CID o apload fail
error-did-required = putim DID bilong yu
error-profile-fetch = i no inap kisim profail: { $e }
error-profile-no-username = profail i no gat nem bilong yusa
error-profile-no-identity = identiti '{ $name }' i no stap — kisim identiti pastaim

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — lagin olsem { $username }
msg-type-help = Raitim .help bilong lukim lis bilong komand.
msg-connecting = i konek long iroh...
msg-iroh-ready = iroh poin i redi
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID i bin publishim long local ma ({ $url })
msg-ma-connecting-matrix = traim long konektim yu long 間trix
msg-local-ma-claimed = local 間 i klem pinis
msg-local-ma-already-claimed = local 間 i klem pinis bipo
msg-local-ma-claim-failed = i no inap klemim local 間
msg-identity-not-published = Nem bilong yu i no stap long net — sapos ma i istap long komputa bilong yu, ran '.ma [port]' na '.my.identity!publish @ma'. Rait '.help/publish' bilong kisim sampela save.
msg-blocked = ⊗ blok [{ $cap }]: { $from }
msg-focus-cleared = fokus i klia pinis
msg-focusing = fokus { $did } olsem { $prompt }
msg-set = { $path }: { $value }
msg-deleted = rausim { $path } ({ $count } lain)
msg-read-only = { $path } i ritim tasol
msg-subtree-set = { $path } em i wan sabkri; i no orait long putim
msg-ancestor-leaf = wan ansesta bilong { $path } em i wan lif; i no orait long karamapim
msg-key-not-found = ki i no painim: { $path }
msg-no-match = i no gat mach
msg-link-not-connected = erò kisim link: i no konek
msg-link-fetch-error = erò kisim link: { $e }
msg-link-key-not-found = ki `{ $key }` i no painim insait long dokumen i bin linkimap

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = nem bilong alias i no ken i emptipela
err-alias-has-dot = nem bilong alias i no ken gat '.'
err-alias-has-fragment = nem bilong alias i no ken gat '#'
err-alias-value-fragment = valiu bilong alias inap gat wanpela DID-URL fragmen tasol we i no empty
err-alias-value-path = valiu bilong alias i mas did:ma:<ipns> DID o DID-URL (no gat path)
err-alias-not-did = valiu bilong alias i mas stat long did:ma:
err-unknown-alias = i no save alias: @{ $name }
err-bare-did = i ekspektim did:ma:<ipns> tasol (no gat fragmen o pat), painim { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Seivim
btn-eval = Evaluetim
btn-cancel = Kanselim
btn-close = Klosim
btn-reply = Bekim
btn-publish = Publishim
btn-publish-ipld = Publishim IPLD
msg-reply-sent = bekim i bin salim
msg-reply-failed = bekim i no wok: { $e }
msg-entity-publish-sent = entiti { $name }: publish i bin salim
msg-entity-publish-failed = publish bilong entiti i no wok: { $e }
msg-kind-publish-failed = publishim kain i no wok: { $e }
msg-field-publish-sent = entiti { $name }.{ $field }: publish i bin salim
msg-field-publish-failed = publish bilong fil i no wok: { $e }
msg-acl-publish-sent = runtime ACL: publish i bin salim
msg-crud-edit-publish-sent = { $path }: publish i bin salim
msg-acl-publish-failed = runtime ACL publish i no wok: { $e }
msg-yaml-error = YAML erò: { $e }
msg-editor-saved = { $path }:seivim
msg-fetch-review = kisim { $cid } — lukim gut pastaim bipo evaluetim
msg-fetch-failed = kisim { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inboks i emptipela
inbox-entry-not-found = inboks entri { $n } i no painim
inbox-no-message-id = inboks entri { $n } i no gat message_id
inbox-no-verb = i no gat vèb `{ $verb }` bilong inboks entri { $n }
inbox-filter-no-arg = filtim i nidim DID o alias tok
inbox-filter-empty = i no gat tok bilong { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discoveri i no wok long { $url }: { $e }
discover-json-error = discoveri i no wok: JSON i no stret long { $url }: { $e }
discover-missing-did = discoveri i no wok: status.json i no gat `did` fil
discover-invalid-did = discoveri i no wok: i ekspektim `did` i stat long did:ma:, painim `{ $did }`
discover-no-endpoint = woning discoveri: `endpoint_id` i no stap long status.json; seivim DID tasol
discover-hint-endpoint-not-found = Toksave: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Toksave: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Toksave: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Toksave: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma discoveri long { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma i kamap pinis — ran '.my.identity!publish @ma' bilong putim nem bilong yu antap.
claim-success = Runtime klemim bilong { $did }
claim-conflict = Runtime i klemim pinis long narapela identiti
claim-already-owned = Runtime i klem pinis long dispela identiti
claim-http-failed = klem i no wok: HTTP { $status }
claim-error = klem i no wok: { $e }
claim-no-session = i no lagin; lagin pastaim bilong klemim runtime
runtime-no-verb = i no gat vèb `{ $verb }` bilong { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl i resit (opim olgeta)
acl-persist-error = seivim erò: { $e }
acl-no-verb = i no gat vèb `{ $verb }` bilong .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = yusim olsem: .my.identity!publish <did-o-alias>
identity-exported = Bundle i save kamdaun olsem { $filename }
identity-export-failed = Eksport i no wok: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content i emptipela
doc-save-first = { $path }.content i emptipela — seivim pastaim
doc-missing-name = nem bilong dokumen i no stap
doc-publish-usage = yusim olsem: .my.doc.<nem>!publish <publishman>
doc-publish-ipld-usage = yusim olsem: .my.doc.<nem>!publish-ipld <publishman>
doc-publish-failed = publishim { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish i no wok [{ $code }]: { $err }
doc-publish-error-hint = Toksave: { $hint }
doc-publish-hint-session = log in gen bai ego i ken kisim ol aidentiti ki bilong yu
doc-publish-hint-target = yusim wanpela gutpela pablisa DID o 'alias' we i makim 'bare 57'
doc-publish-hint-network = sekim 7 rantaim na 22 i ken kamap, na bihain traim gen
doc-publish-hint-resolve = sekim olsem pablisa DID pepa i pablisim pinis na i gat wanpela 'reachable endpoint'
doc-publish-hint-acl = askim pablisa opereta long larim DID bilong yu i go insait long 48
doc-publish-hint-runtime = runtime/plugin i sakim askim; sekim as na traim gen bihain long stretim entiti/rantaim
doc-publish-hint-ipfs = sekim lokal 12/17 helt na pablisa rantaim status
doc-publish-hint-unknown = sekim ol 'runtime' log bilong painimaut as bilong en na traim gen
doc-store-sent = stoa rikwest i bin salim ({ $id }) → { $publisher }; CID bai kam long RPC bekim
doc-ipld-store-sent = IPLD stoa rikwest i bin salim ({ $id }) → { $publisher }; CID bai kam long RPC bekim
doc-fetch-done = kisim { $cid } → { $path }.content (i noران)
doc-fetch-failed = kisim { $cid }: { $e }
doc-fetch-usage = yusim olsem: .my.doc.<nem>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid i no putim
doc-no-verb = i no gat vèb `{ $verb }` bilong { $path }
path-no-verb = i no gat vèb `{ $verb }` bilong { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tok ples i gat (.my.i18n: <code> bilong putim):

err-lang-not-found = tok i no painim: { $lang }

help-header-zion = ── tok bilong zion ────────────────────────────────────────────────────────
help-header-messaging = ── toktok ─────────────────────────────────────────────────────────────────
help-header-config = ── lokal seting gramar ────────────────────────────────────────────────────
help-header-common = ── rot bilong olgeta ──────────────────────────────────────────────────────
help-header-inbox = ── bokis bilong mesej ─────────────────────────────────────────────────────
help-header-documents = ── pepa (.my.doc.*) ───────────────────────────────────────────────────────
help-header-i18n = ── tokples ─────────────────────────────── ────────────────────────────────
help-header-ma = ── 3-spes ──────────────────────────────── ────────────────────────────────
help-header-ma-entry = ── putim 間-spes ─────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dispela tok
help-cmd-clear =   .clear                       klinim terminal
help-cmd-panic =   .panic                       las rot — yusim sapos yu bagarap
help-cmd-history =   .history                     histri bilong komand (ol sem koman i stap wantaim)
help-cmd-logout =   .logout                      autim
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch:sync / .batch         run scratch document line by line
help-msg-echo =   @alias                       soim resolved DID/DID-URL (no salim mesij)
help-msg-send =   @alias!msg body / @alias:verb args           salim mesej / RPC i go long aktor
help-msg-fragment =   @alias#fragment:verb body  salim i go long alias wantaim DID fragment
help-msg-escape =   \@name                       stret @name (noh lukim alias)
help-config-get =   .path                        kisim lif valu o soim sabpatri
help-config-filter =   .path value                  kisim ol wantaim kweri (filta long valu)
help-config-set =   .path: value                 setim lif
help-config-delete =   .path:                       rausim lif o sabpatri
help-config-verb =   .path!verb [args]            kolim lokal vob
help-my =   .my                          soim olgeta seting bilong yu
help-aliases =   .my.aliases                  soim olgeta alias
help-aliases-set =   .my.aliases.<name>: <did-url> putim/senisim alias (DID o DID-URL)
help-aliases-del =   .my.aliases.<name>:          rausim alias
help-runtime-discover =   .ma [port]          painim lokal runtime na mekim alias @ma
help-runtime-claim =   .ma [port]             klemim ownashop bilong runtime long yu DID
help-identity =   .my.identity                 soim seting bilong identiti
help-identity-did =   .my.identity.did             soim yu DID (ritim tasol)
help-identity-publish =   .my.identity!publish @pub    pablisim yu DID long pablisha sovic
help-identity-export =   .my.identity!export          kisim bundle bilong yu yet
help-config-path =   .config                      soim olgeta .config.* entri
help-inbox =   .my.inbox                    soim bokis bilong mesej (sabpatri)
help-inbox-n =   .my.inbox.N                  soim fild bilong entri N
help-inbox-from =   .my.inbox.N.from             DID bilong salim entri N
help-inbox-reply =   .my.inbox.N!reply [body]     salim beksave (openim edita sapos noh bodi)
help-inbox-open =   .my.inbox.N!open             openim content bilong entri ritim tasol long edita
help-inbox-del =   .my.inbox.N:                 rausim entri N
help-inbox-delall =   .my.inbox:                   rausim olgeta entri long bokis
help-inbox-flush =   .my.inbox!flush              soim olgeta entri long terminal
help-inbox-filter =   .my.inbox!filter @who        soim tasol enteri bilong @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   wokabaut long senda DID dokumen isi isi
help-doc-edit =   .my.doc.<name>!edit           openim edita wantaim content i sev pinis
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     kisim CID, openim bilong lukluk tasol
help-doc-eval =   .my.doc.<name>!eval           renim content i sev pinis lain long lain
help-doc-publish =   .my.doc.<name>!publish @pub   storim olsem rou blob (eni kain)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  storim YAML olsem nod DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    impotim content bilong CID (noh renim)
help-doc-cid =   .my.doc.<name>!cid            soim CID i storim pinis
help-doc-del =   .my.doc.<name>:              rausim pepa

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n i save putim ol tokples yu laikim we i stap wantaim aidentiti bilong yu.
help-i18n-set = .my.i18n: <code>             makim tokples 20 i yusim long dispela aidentiti
help-i18n-list = .my.i18n!list               listim ol tokples kod we i stap

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 rum em spes namel long ol 間 identity. ma i mekim ol dispela identity i painim narapela na toktok; taim identity bilong yu i publish pinis, yu inap join.
help-ma-command =   .ma [port]                   connect long local ma runtime bilong yu, ritim /status.json, na save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish DID document bilong yu bai ol narapela inap resolve keys na endpoint bilong yu
help-ma-security = Klir trust boundary em own ma runtime bilong yu wantaim own IPFS Desktop/Kubo bilong yu. Remote publisher inap help, tasol bihain yu depend long service bilong narapela.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             olsem wanem long go insait long 間 rum

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Taim identity bilong yu i known, .enter @ma i larim yu step insait long 間. Painim wanpela world, go insait, na join long hap.
help-ma-entry-steps = Startim IPFS Desktop na ma, bihain runim .ma. Publish long .my.identity!publish @ma, painim world, na enter long .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 long @ma runtime
help-ma-entry-leave =   .leave                       lusim rum; identity bilong yu i stap active, na yu stap logged in
help-ma-entry-url =   ?enter=<runtime>             enter bihain login long shared URL

msg-send-failed = salim i no wok: { $e }
msg-not-logged-in = yu no bin log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse ero: { $e }
yaml-not-mapping = YAML i mas stap mapping (pe ki: valu); tokples stret na skala i no inap stoa olsem DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode ero: { $e }
cbor-decode-error = CBOR decode ero: { $e }
cbor-json-error = CBOR i go JSON ero: { $e }
yaml-serialize-error = YAML serialize ero: { $e }
edit-reply-invalid = bekim bilong stretim i no stret
doc-publish-ipld-error = IPLD publish i no go: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox prune save ero: { $e }
err-config-load = config load ero: { $e }
err-lang-persist = lang persist ero: { $e }
err-history-parse = history parse ero: { $e }
err-history-load = history load ero: { $e }
err-ipfs-reply-decode = IPFS reply decode i no go: { $e }
err-edit-cbor = edit CBOR ero: { $e }
err-popup-blocked = browser i blokim popup
status-publishing = i publishim

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = rong
rpc-error-detail = rong: { $detail }
msg-new-message = ← [{ $from }] nupela tok — { $count } long bokis bilong yu
msg-chat = { $sender } i tok { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } i tok olsem { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } i kam insait.
room-leave = * { $name } i lusim rum.
room-drop  = * { $name } i droppim { $thing }.
room-take  = * { $name } i kisim { $thing }.
err-edit-decode-failed = senisim: rong long dekod: { $e }
err-edit-fetch-failed = senisim: rong long kisim: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = i no gat wok taim — no inap rausim profil
profile-delete-error = rausim profil i no wok: { $e }
profile-wrong-user = yu no inap long putim 11 long narapela profail — bilong yu yet tasol
profile-wrong-user-name = i no inap long setim 11 bilong 19 — tasol profail bilong yu yet
profile-no-ma = nogat 3 rantaim i stap — ranim 31 pastaim
profile-no-cid = nogat 3 i stap long dispela profail — ranim 37 pastaim
profile-no-cid-in-doc = nogat profail 11 i stap insait long DID pepa — ranim 43 pastaim
profile-publish-sent = profail i bin lok na salim i go long IPFS; DID pepa bai kamap nupela taim CID i kam
profile-publish-done = profail i publish pinis — DID pepa i kisim ma.agent CID
profile-publish-failed = profail pablisim i no inap: 24
profile-fetch-done = profail i kisim — 18 ki i kam long 43
profile-fetch-failed = 'profile fetch' i no inap: 22
msg-identity-exists = aidentiti i kamap pinis — profail i stap nau
profile-import-exists = profail 8 i stap pinis — rausim pastaim
profile-import-wrong-user = fail i gat profail 22, ekspektim 42

# -- CID content operations
cid-op-binary = binary konten (i no soim)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = i no inap long kisim ol samting: 25
cid-op-unknown = wok bilong konten we yu no save long en: 27
cid-op-wc = { $lines } lain 18 wod 36 leta
profiles-empty = (nogat)
profiles-deleted = profil { $name } rausim pinis
profiles-not-found = profil i no stap: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    tok-mesij
help-topic-ma = .help/ma                     ma-spes, pablising, na entri
help-topic-path = .help/path                   lokol dot-pat grama
help-topic-my =   .help/my                     config bilong mi
help-topic-inbox =   .help/inbox                  bokis mesij
help-topic-doc =   .help/doc                    ol dokumen
help-topic-actor =   .help/actor                  actor longwe
help-unknown-topic =   .help/{ $topic }: topik i no save

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         salim dairekt/toktok/emot mesej
help-actor-ping = @actor:ping                  laipnes ping
help-actor-entities =   @actor/entities              soim ol entity
help-actor-entities-get = @actor/entities/<n>          kisim entiti node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   Setim samting long 14 refrens
help-actor-entities-edit =   @actor/entities/<n>!edit     editim entity
help-actor-entities-del = @actor/entities/<n>:         rausim samting
help-actor-config-get =   @actor/config/<key>          kisim config value
help-actor-config-set =   @actor/config/<key>: val     putim config value
help-actor-acl = @actor/acl                   kisim 4
help-actor-acl-edit =   @actor/acl!edit              editim ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── 3 akta i singaut ───────────────────────── ───────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  ringim wanpela entiti 15 long 24 na wetim bekim bilong em
help-actor-head = (@actor/path)                kisim CRUD konten long 31
help-actor-tail = (<bafy...>)                  inkludim na skelim 21 long wanpela 36 41
help-actor-wc = (define x (@actor:verb arg))  holim 5 bekim insait long sesen envairomen
help-actor-wc-l = .my.scheme.ma!edit           stretim ol sevim 11 helpim bilong dispela aidentiti

help-topic-url =   .help/url                    opim zion long URL link
help-topic-i18n = .help/i18n                   tokples yu laikim long aidentiti bilong yu
help-header-url = ── URL paramita ─────────────────────────────────────────────────────────────────
help-url-intro =   Serem wanpela link bilong opim zion wantaim man bilong kisim olgeta i stap pinis:
help-url-msg =   ?msg=<did>                   pulapim pastaim: @<did>!msg (simol meses)
help-url-say =   ?say=<did>                   pulapim pastaim: @<did>!say (vep say)
help-url-emote =   ?emote=<did>                 pulapim pastaim: @<did>!emote (vep emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / 23 URL
help-url-enter = ?enter=<runtime>             go insait long rantaim wol bihain long login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Tok i pulap pinis tasol i no salim yet — presim Enter bilong salim.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                putim nem bilong yu antap long net
help-header-publish = ── putim nem antap ──────────────────────────────────────────────────────────
help-publish-intro = Putim nem antap i mekim nem bilong yu i stap long net. Ol arapela man inap painim DID bilong yu bilong toktok wantaim yu.
help-publish-ma = Bilong putim nem antap, yu nidim ma (local runtime) istap long komputa. Em i joinim ego wantaim IPFS/IPNS bilong yu.
help-publish-steps = Ol hap: ran '.ma [port]' bilong painim local ma, na '.my.identity!publish @ma'.
help-publish-without = Sapos yu no putim nem antap, ol arapela man inap yet lusim yu — ol i no inap painim endpoint bilong yu, maski ol i save DID bilong yu.
profile-fetch-did-resolve-failed = I no bin pablisim yet — ranim 28 pastaim, bihain 67 long profail bilong yu
profile-update-done = profail i kamap nupela — 18 ki i bung wantaim long 43
profile-delete-needs-name = givim nem bilong profail: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolektim ol batch — taip komand, pinis wantaim .batch
batch-already-collecting = Yu wok long bungim wanpela lain pinis — pinisim wantaim .batch pastaim
batch-empty = Batch i bin stap nating — nogat wanpela samting long ranim
batch-running = Batch dey run…
batch-step-timeout = batch step taim aut

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
err-unknown-command = komand i no save: { $path }
err-read-only-path = { $path } em bilong rit tasol
help-cmd-batch-async =   .batch:async / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No inap kisim CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dispela CID i no stret: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Woning: Praivit ki bilong IPNS bilong yu bai i go long runtime ia bilong publisim aideniti. Usum tasol runtime yu trastim tru.
