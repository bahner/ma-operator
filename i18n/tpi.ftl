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
msg-identity-not-published = Nem bilong yu i no stap long net — sapos ma i istap long komputa bilong yu, ran '.ma [port]' na '/my/identity!publish @ma'. Rait '.help/publish' bilong kisim sampela save.
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
err-alias-value-fragment = valiu bilong alias i mas i stap did:ma:<ipns> tasol (no gat fragmen)
err-alias-value-path = valiu bilong alias i mas i stap did:ma:<ipns> tasol (no gat pat)
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
discover-success = ma discoveri long { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma i kamap pinis — ran '/my/identity!publish @ma' bilong putim nem bilong yu antap.
claim-success = Runtime klemim bilong { $did }
claim-conflict = Runtime i klemim pinis long narapela identiti
claim-http-failed = klem i no wok: HTTP { $status }
claim-error = klem i no wok: { $e }
claim-no-session = i no lagin; lagin pastaim bilong klemim runtime
runtime-no-verb = i no gat vèb `{ $verb }` bilong { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = /my/acl i resit (opim olgeta)
acl-persist-error = seivim erò: { $e }
acl-no-verb = i no gat vèb `{ $verb }` bilong /my/acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = yusim olsem: /my/identity!publish <did-o-alias>
identity-exported = Bundle i save kamdaun olsem { $filename }
identity-export-failed = Eksport i no wok: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }/content i emptipela
doc-save-first = { $path }/content i emptipela — seivim pastaim
doc-missing-name = nem bilong dokumen i no stap
doc-publish-usage = yusim olsem: /my/doc/<nem>:publish <publishman>
doc-publish-ipld-usage = yusim olsem: /my/doc/<nem>:publish-ipld <publishman>
doc-publish-failed = publishim { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = stoa rikwest i bin salim ({ $id }) → { $publisher }; CID bai kam long RPC bekim
doc-ipld-store-sent = IPLD stoa rikwest i bin salim ({ $id }) → { $publisher }; CID bai kam long RPC bekim
doc-fetch-done = kisim { $cid } → { $path }/content (i noران)
doc-fetch-failed = kisim { $cid }: { $e }
doc-fetch-usage = yusim olsem: /my/doc/<nem>:fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid i no putim
doc-no-verb = i no gat vèb `{ $verb }` bilong { $path }
path-no-verb = i no gat vèb `{ $verb }` bilong { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tok ples i gat (/my/i18n: <code> bilong putim):

err-lang-not-found = tok i no painim: { $lang }

help-header-zion = ── tok bilong zion ────────────────────────────────────────────────────────
help-header-messaging = ── toktok ─────────────────────────────────────────────────────────────────
help-header-focus = ── fokus rot ──────────────────────────────────────────────────────────────
help-header-config = ── lokal seting gramar ────────────────────────────────────────────────────
help-header-common = ── rot bilong olgeta ──────────────────────────────────────────────────────
help-header-inbox = ── bokis bilong mesej ─────────────────────────────────────────────────────
help-header-documents = ── pepa (/my/doc.*) ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dispela tok
help-cmd-clear =   .clear                       klinim terminal
help-cmd-panic =   .panic                       las rot — yusim sapos yu bagarap
help-cmd-history =   .history                     histri bilong komand (ol sem koman i stap wantaim)
help-cmd-logout =   .logout                      autim
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)
help-msg-echo =   @alias                       soim DID (noh mesej salim)
help-msg-send =   @alias[:verb] body           salim mesej / RPC i go long aktor
help-msg-fragment =   @alias#fragment[:verb] body  salim i go long alias wantaim DID fragment
help-msg-escape =   \@name                       stret @name (noh lukim alias)
help-focus-set =   .use @alias [as @name]       fokusim aktor (senisim prompt)
help-focus-clear =   .use                         rausim fokus
help-config-get =   .path                        kisim lif valu o soim sabpatri
help-config-filter =   .path value                  kisim ol wantaim kweri (filta long valu)
help-config-set =   .path: value                 setim lif
help-config-delete =   .path:                       rausim lif o sabpatri
help-config-verb =   .path!verb [args]            kolim lokal vob
help-my =   /my                          soim olgeta seting bilong yu
help-aliases =   /my/aliases                  soim olgeta alias
help-aliases-set =   /my/aliases/<name>: <did>    putim/senisim alias (bea DID, noh #fragment)
help-aliases-del =   /my/aliases/<name>:          rausim alias
help-runtime-discover =   .ma [port]          painim lokal runtime na mekim alias @ma
help-runtime-claim =   .ma [port]             klemim ownashop bilong runtime long yu DID
help-identity =   /my/identity                 soim seting bilong identiti
help-identity-did =   /my/identity/did             soim yu DID (ritim tasol)
help-identity-publish =   /my/identity!publish @pub    pablisim yu DID long pablisha sovic
help-identity-export =   /my/identity!export          kisim bundle bilong yu yet
help-config-path =   .config                      soim olgeta .config.* entri
help-inbox =   /my/inbox                    soim bokis bilong mesej (sabpatri)
help-inbox-n =   /my/inbox/N                  soim fild bilong entri N
help-inbox-from =   /my/inbox/N/from             DID bilong salim entri N
help-inbox-reply =   /my/inbox/N!reply [body]     salim beksave (openim edita sapos noh bodi)
help-inbox-open =   /my/inbox/N!open             openim content bilong entri ritim tasol long edita
help-inbox-del =   /my/inbox/N:                 rausim entri N
help-inbox-delall =   /my/inbox:                   rausim olgeta entri long bokis
help-inbox-flush =   /my/inbox!flush              soim olgeta entri long terminal
help-inbox-filter =   /my/inbox!filter @who        soim tasol enteri bilong @who
help-inbox-traverse =   /my/inbox/N/sender/<field>   wokabaut long senda DID dokumen isi isi
help-doc-edit =   /my/doc/<name>!edit           openim edita wantaim content i sev pinis
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     kisim CID, openim bilong lukluk tasol
help-doc-eval =   /my/doc/<name>!eval           renim content i sev pinis lain long lain
help-doc-publish =   /my/doc/<name>!publish @pub   storim olsem rou blob (eni kain)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  storim YAML olsem nod DAG-CBOR IPLD
help-doc-fetch =   /my/doc/<name>!fetch <cid>    impotim content bilong CID (noh renim)
help-doc-cid =   /my/doc/<name>!cid            soim CID i storim pinis
help-doc-del =   /my/doc/<name>:              rausim pepa

msg-send-failed = salim i no wok: { $e }
msg-not-logged-in = yu no bin log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse ero: { $e }
yaml-not-mapping = YAML i mas stap mapping (pe ki: valu); tokples stret na skala i no inap stoa olsem DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode ero: { $e }
cbor-decode-error = CBOR decode ero: { $e }
cbor-json-error = CBOR i go JSON ero: { $e }
yaml-serialize-error = YAML serialize ero: { $e }
edit-reply-invalid = invalid edit reply
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
profiles-empty = (nogat)
profiles-deleted = profil { $name } rausim pinis
profiles-not-found = profil i no stap: { $name }

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

help-topic-url =   .help/url                    opim zion long URL link
help-header-url = ── URL paramita ─────────────────────────────────────────────────────────────────
help-url-intro =   Serem wanpela link bilong opim zion wantaim man bilong kisim olgeta i stap pinis:
help-url-msg =   ?msg=<did>                   pulapim pastaim: @<did> (simol meses)
help-url-say =   ?say=<did>                   pulapim pastaim: @<did>:say (vep say)
help-url-emote =   ?emote=<did>                 pulapim pastaim: @<did>:emote (vep emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Tok i pulap pinis tasol i no salim yet — presim Enter bilong salim.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                putim nem bilong yu antap long net
help-header-publish = ── putim nem antap ──────────────────────────────────────────────────────────
help-publish-intro = Putim nem antap i mekim nem bilong yu i stap long net. Ol arapela man inap painim DID bilong yu bilong toktok wantaim yu.
help-publish-ma = Bilong putim nem antap, yu nidim ma (local runtime) istap long komputa. Em i joinim ego wantaim IPFS/IPNS bilong yu.
help-publish-steps = Ol hap: ran '.ma [port]' bilong painim local ma, na '/my/identity!publish @ma'.
help-publish-without = Sapos yu no putim nem antap, ol arapela man inap yet lusim yu — ol i no inap painim endpoint bilong yu, maski ol i save DID bilong yu.
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
scheme-cid-fetch-error = No inap kisim CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dispela CID i no stret: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Woning: Praivit ki bilong IPNS bilong yu bai i go long runtime ia bilong publisim aideniti. Usum tasol runtime yu trastim tru.
