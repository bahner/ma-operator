# zion — Kiswahili
lang-name = Kiswahili

# ── Ukurasa wa kuingia ────────────────────────────────────────────────────
tab-login = ingia
tab-new-identity = utambulisho mpya
tab-import = ingiza
label-passphrase = neno la siri
label-username = jina la mtumiaji
label-confirm-passphrase = thibitisha neno la siri
btn-login = ingia
btn-export = hamisha
btn-generate = tengeneza
btn-new-endpoint = kituo kipya
passphrase-warning = Neno la siri lililopotea = utambulisho uliopotea. Hakuna urejeshaji unaowezekana.
import-help = Chagua faili ya .zion.json iliyohamishwa. Kifurushi kinabaki kimefichwa.
status-unlocking = kufungua...
status-generating = kutengeneza utambulisho...
status-reading-file = kusoma faili...
status-imported = '{ $name }' imeingizwa — nenda kwenye kichupo cha Ingia
error-wrong-passphrase = neno la siri lisilo sahihi: { $e }
error-identity-not-found = utambulisho '{ $name }' haupatikani
error-username-required = jina la mtumiaji linahitajika
error-passphrase-required = neno la siri linahitajika
error-passphrases-no-match = maneno ya siri hayafanani

# ── Ujumbe wa mfumo wa terminal ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — umeingia kama { $username }
msg-type-help = Andika .help kupata orodha ya amri.
msg-connecting = kuunganisha na iroh...
msg-iroh-ready = mwisho wa iroh uko tayari
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID imechapishwa kupitia ma ya ndani ({ $url })
msg-identity-not-published = Utambulisho haukupatikana mtandaoni — ikiwa ma imewekwa ndani, endesha '.my.ma:discover' kisha '.my.identity:publish @ma'. Andika '.help.publish' kwa maelezo.
msg-blocked = ⊗ imezuiwa [{ $cap }]: { $from }
msg-focus-cleared = umakini umefutwa
msg-focusing = kuzingatia { $did } kama { $prompt }
msg-set = { $path }: { $value }
msg-deleted = imefutwa { $path } ({ $count } ingizo)
msg-read-only = { $path } ni ya kusoma tu
msg-subtree-set = { $path } ni mti mdogo; mipangilio imekataliwa
msg-ancestor-leaf = babu wa { $path } ni jani; ufunikaji umekataliwa
msg-key-not-found = ufunguo haupatikani: { $path }
msg-no-match = hakuna mechi
msg-link-not-connected = hitilafu ya kupata kiungo: haijaunganishwa
msg-link-fetch-error = hitilafu ya kupata kiungo: { $e }
msg-link-key-not-found = ufunguo `{ $key }` haupatikani katika hati iliyounganishwa

# ── Uthibitisho wa jina la kubadilisha ───────────────────────────────────
err-alias-name-empty = jina la jina la kubadilisha haliwezi kuwa wazi
err-alias-has-dot = jina la jina la kubadilisha haliwezi kuwa na '.'
err-alias-has-fragment = jina la jina la kubadilisha haliwezi kuwa na '#'
err-alias-value-fragment = thamani ya jina la kubadilisha lazima iwe did:ma:<ipns> safi (bila kipande)
err-alias-value-path = thamani ya jina la kubadilisha lazima iwe did:ma:<ipns> safi (bila njia)
err-alias-not-did = thamani ya jina la kubadilisha lazima ianze na did:ma:
err-unknown-alias = jina la kubadilisha lisilojulikana: @{ $name }
err-bare-did = imehitajika did:ma:<ipns> safi (bila kipande au njia), ilipokea { $did }

# ── Mhariri ───────────────────────────────────────────────────────────────
btn-save = Hifadhi
btn-eval = Tekeleza
btn-cancel = Ghairi
btn-close = Funga
btn-reply = Jibu
btn-publish = Chapisha
btn-publish-ipld = Chapisha IPLD
msg-reply-sent = jibu limetumwa
msg-reply-failed = kutuma jibu kumeshindwa: { $e }
msg-entity-publish-sent = kitu { $name }: uchapishaji umetumwa
msg-entity-publish-failed = kuchapisha kitu kumeshindwa: { $e }
msg-kind-publish-failed = kuchapisha aina kumeshindwa: { $e }
msg-field-publish-sent = kitu { $name }.{ $field }: uchapishaji umetumwa
msg-field-publish-failed = kuchapisha uwanja kumeshindwa: { $e }
msg-acl-publish-sent = ACL ya wakati wa utekelezaji: uchapishaji umetumwa
msg-crud-edit-publish-sent = { $path }: uchapishaji umetumwa
msg-acl-publish-failed = kuchapisha ACL ya wakati wa utekelezaji kumeshindwa: { $e }
msg-yaml-error = hitilafu ya YAML: { $e }
msg-editor-saved = { $path }:hifadhi
msg-fetch-review = { $cid } imepatikana — angalia kabla ya kutekeleza
msg-fetch-failed = kupata { $cid }: { $e }

# ── Vitenzi — kisanduku cha barua ────────────────────────────────────────
inbox-empty = kisanduku cha barua kipo wazi
inbox-entry-not-found = ingizo { $n } la kisanduku cha barua halipatikani
inbox-no-message-id = ingizo { $n } la kisanduku cha barua halina message_id
inbox-no-verb = hakuna kitenzi `{ $verb }` kwa ingizo { $n } la kisanduku cha barua
inbox-filter-no-arg = kichujio kinahitaji hoja ya DID au jina bandia
inbox-filter-empty = hakuna ujumbe kutoka { $did }

# ── Vitenzi — wakati wa utekelezaji ──────────────────────────────────────
discover-fetch-failed = ugunduzi umeshindwa katika { $url }: { $e }
discover-json-error = ugunduzi umeshindwa: JSON batili kutoka { $url }: { $e }
discover-missing-did = ugunduzi umeshindwa: status.json inakosea uwanja unaohitajika `did`
discover-invalid-did = ugunduzi umeshindwa: ilitarajiwa `did` kuanza na did:ma:, ilipokea `{ $did }`
discover-no-endpoint = onyo la ugunduzi: `endpoint_id` haipo katika status.json; DID tu ilihifadhiwa
discover-success = ma imegunduliwa katika { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   jina bandia @ma limeundwa — endesha '.my.identity:publish @ma' kutangaza utambulisho wako.
claim-success = Wakati wa utekelezaji umedaiwa kwa { $did }
claim-conflict = Wakati wa utekelezaji tayari umedaiwa na utambulisho mwingine
claim-http-failed = kudai kumeshindwa: HTTP { $status }
claim-error = kudai kumeshindwa: { $e }
claim-no-session = hujaingia; ingia kwanza ili kudai wakati wa utekelezaji
runtime-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }

# ── Vitenzi — udhibiti wa ufikiaji ────────────────────────────────────────
acl-reset = .my.acl imewekwa upya (wazi kabisa)
acl-persist-error = hitilafu ya kuhifadhi: { $e }
acl-no-verb = hakuna kitenzi `{ $verb }` kwa .my.acl

# ── Vitenzi — utambulisho ─────────────────────────────────────────────────
publish-usage = matumizi: .my.identity:publish <did-au-jina-la-kubadilisha>
identity-exported = Kifurushi kilipakuliwa kama { $filename }
identity-export-failed = Usafirishaji umeshindwa: { $e }

# ── Vitenzi — nyaraka ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content ipo wazi
doc-save-first = { $path }.content ipo wazi — hifadhi kwanza
doc-missing-name = jina la hati linakosekana
doc-publish-usage = matumizi: .my.doc.<jina>:publish <mchapishaji>
doc-publish-ipld-usage = matumizi: .my.doc.<jina>:publish-ipld <mchapishaji>
doc-publish-failed = kuchapisha { $path }: { $e }
doc-publish-ipld-failed = kuchapisha IPLD { $path }: { $e }
doc-store-sent = ombi la kuhifadhi limetumwa ({ $id }) → { $publisher }; CID itafika kupitia jibu la RPC
doc-ipld-store-sent = ombi la kuhifadhi IPLD limetumwa ({ $id }) → { $publisher }; CID itafika kupitia jibu la RPC
doc-fetch-done = { $cid } imepatikana → { $path }.content (haijatekelezwa)
doc-fetch-failed = kupata { $cid }: { $e }
doc-fetch-usage = matumizi: .my.doc.<jina>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid haijawekwa
doc-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }
path-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }

# ── Maandishi ya msaada — vichwa ──────────────────────────────────────────
help-header-zion = ── amri za zion ───────────────────────────────────────────────────────────
help-header-messaging = ── ujumbe ────────────────────────────────────────────────────────────────
help-header-focus = ── hali ya umakini ───────────────────────────────────────────────────────
help-header-config = ── sarufi ya usanidi wa ndani ─────────────────────────────────────────
help-header-common = ── njia za kawaida ───────────────────────────────────────────────────────
help-header-inbox = ── kisanduku cha barua ───────────────────────────────────────────────────
help-header-documents = ── nyaraka ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        maandishi haya
help-cmd-clear =   .clear                       futa terminal
help-cmd-panic =   .panic                       njia ya mwisho — tumia ukiwa katika shida
help-cmd-history =   .history                     historia ya amri (marudio yanayofuatana yamejumuishwa)
help-cmd-logout =   .logout                      toka
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       onyesha DID iliyotatuliwa (hakuna ujumbe unaotumwa)
help-msg-send =   @alias[:verb] body           tuma ujumbe / RPC kwa muigizaji
help-msg-fragment =   @alias#fragment[:verb] body  tuma kwa jina la kubadilisha lenye kipande cha DID wazi
help-msg-escape =   \@name                       @name halisi (bila utafutaji wa jina la kubadilisha)

help-focus-set =   .use @alias [as @name]       zingatia muigizaji (hubadilisha kidokezo)
help-focus-clear =   .use                         futa umakini

help-config-get =   .path                        pata thamani ya jani au orodhesha mti mdogo
help-config-filter =   .path value                  kichujio cha utafutaji (chuja kwa thamani)
help-config-set =   .path: value                 weka jani
help-config-delete =   .path:                       futa jani au mti mdogo
help-config-verb =   .path:verb [args]            tekeleza kitenzi cha ndani

help-my =   .my                          onyesha usanidi wote wa kibinafsi
help-aliases =   .my.aliases                  orodhesha majina ya kubadilisha
help-aliases-set =   .my.aliases.<name>: <did>    ongeza/sasisha jina la kubadilisha (DID safi, bila #kipande)
help-aliases-del =   .my.aliases.<name>:          ondoa jina la kubadilisha
help-runtime-discover =   .my.ma:discover          gundua wakati wa utekelezaji wa ndani na unda jina la kubadilisha @ma
help-runtime-claim =   .my.ma:claim             dai wakati wa utekelezaji na DID yako
help-identity =   .my.identity                 onyesha usanidi wa utambulisho
help-identity-did =   .my.identity.did             onyesha DID yako mwenyewe (kusoma tu)
help-identity-publish =   .my.identity:publish @pub    chapisha DID yako kupitia huduma ya mchapishaji
help-identity-export =   .my.identity:export          pakua kifurushi cha utambulisho wako
help-config-path =   .config                      onyesha ingizo zote za .config.*

help-inbox =   .my.inbox                    orodhesha kisanduku cha barua (mtazamo wa mti mdogo)
help-inbox-n =   .my.inbox.N                  onyesha sehemu za ingizo N
help-inbox-from =   .my.inbox.N.from             DID ya mtumaji kwa ingizo N
help-inbox-reply =   .my.inbox.N:reply [body]     tuma jibu (fungua mhariri bila mwili)
help-inbox-open =   .my.inbox.N:open             fungua maudhui katika mhariri wa kusoma tu
help-inbox-del =   .my.inbox.N:                 futa ingizo N
help-inbox-delall =   .my.inbox:                   futa ingizo zote za kisanduku cha barua
help-inbox-flush =   .my.inbox:flush              chapisha ingizo zote kwenye terminal
help-inbox-filter =   .my.inbox:filter @who        onyesha maingizo kutoka @who peke yake
help-inbox-traverse =   .my.inbox.N.sender.<uwanja>  pita hati ya DID ya mtumaji kwa uvivu

help-doc-edit =   .my.doc.<jina>:edit           fungua mhariri na maudhui yaliyohifadhiwa
help-doc-edit-cid =   .my.doc.<jina>:edit <cid>     pata CID, fungua kwa mapitio
help-doc-eval =   .my.doc.<jina>:eval           tekeleza maudhui yaliyohifadhiwa mstari kwa mstari
help-doc-publish =   .my.doc.<jina>:publish @pub   hifadhi kama blob ghafi (aina zote)
help-doc-publish-ipld =   .my.doc.<jina>:publish-ipld @pub  hifadhi YAML kama nodi ya DAG-CBOR IPLD iliyopangwa
help-doc-fetch =   .my.doc.<jina>:fetch <cid>    ingiza maudhui ya CID (bila utekelezaji)
help-doc-cid =   .my.doc.<jina>:cid            onyesha CID iliyohifadhiwa
help-doc-del =   .my.doc.<jina>:              futa hati

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lugha zinazopatikana (weka kwa .my.i18n: <code>):
err-lang-not-found = lugha haikupatikana: { $lang }

msg-send-failed = kutuma kulishindwa: { $e }
msg-not-logged-in = haujaingia

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Kosa la kuchanganua YAML: { $e }
yaml-not-mapping = YAML lazima iwe mapping (jozi la ufunguo: thamani); maandishi ya kawaida na skalari haziwezi kuhifadhiwa kama DAG-CBOR
dagcbor-encode-error = Kosa la kusimba DAG-CBOR: { $e }
cbor-decode-error = Kosa la kusimbua CBOR: { $e }
cbor-json-error = Kosa la CBOR hadi JSON: { $e }
yaml-serialize-error = Kosa la kusindika YAML: { $e }
edit-reply-invalid = Jibu la uhariri lisilofaa
doc-publish-ipld-error = Kuchapisha IPLD kulishindwa: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kosa la kuhifadhi usafishaji wa kisanduku cha barua: { $e }
err-config-load = Kosa la kupakia mipangilio: { $e }
err-lang-persist = Kosa la kuhifadhi lugha: { $e }
err-history-parse = Kosa la kuchanganua historia: { $e }
err-history-load = Kosa la kupakia historia: { $e }
err-ipfs-reply-decode = Kushindwa kusimbua jibu la IPFS: { $e }
err-edit-cbor = Kosa la kuhariri CBOR: { $e }
err-popup-blocked = Kivinjari kimezuia dirisha la popup
status-publishing = inachapisha

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = hitilafu
rpc-error-detail = hitilafu: { $detail }
msg-new-message = ← [{ $from }] ujumbe mpya — { $count } kwenye kisanduku
msg-chat = { $sender } anasema { $body }
err-edit-decode-failed = kuhariri: hitilafu ya usimbaji: { $e }
err-edit-fetch-failed = kuhariri: hitilafu ya kupata: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = hakuna kipindi cha kazi — profaili haiwezi kufutwa
profile-delete-error = kufuta profaili kumeshindwa: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (hakuna)
profiles-deleted = profaili { $name } imefutwa
profiles-not-found = profaili haikupatikana: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor:entities              list entities
help-actor-entities-get =   @actor:entities.<n>          get entity
help-actor-entities-set =   @actor:entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor:entities.<n>:edit     edit entity
help-actor-entities-del =   @actor:entities.<n>:         delete entity
help-actor-config-get =   @actor:config.<key>          get config value
help-actor-config-set =   @actor:config.<key>: val     set config value
help-actor-acl =   @actor:acl                   get ACL
help-actor-acl-edit =   @actor:acl:edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    kufungua zion kupitia kiungo cha URL
help-header-url = ── vigezo vya URL ────────────────────────────────────────────────────────────────
help-url-intro =   Shiriki kiungo kinachofungua zion na mpokeaji aliyewekwa mapema:
help-url-msg =   ?msg=<did>                   jaza mapema: @<did> (ujumbe wa kawaida)
help-url-say =   ?say=<did>                   jaza mapema: @<did>:say (kitenzi say)
help-url-emote =   ?emote=<did>                 jaza mapema: @<did>:emote (kitenzi emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Ingizo limejazwa mapema lakini halijatumwa — bonyeza Enter kutuma.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                chapisha utambulisho wako kwenye mtandao
help-header-publish = ── kuchapisha utambulisho ────────────────────────────────────────────────────
help-publish-intro = Kuchapisha hufanya utambulisho wako upatikane kwenye mtandao. Wengine wanaweza kutafuta DID yako kukufikia.
help-publish-ma = Ili kuchapisha, unahitaji ma (runtime ya ndani) imewekwa. Inaunganisha ego na IPFS/IPNS kwa niaba yako.
help-publish-steps = Hatua: endesha '.my.ma:discover' kugundua ma ya ndani, kisha '.my.identity:publish @ma'.
help-publish-without = Bila kuchapisha, wengine hawawezi kukufikia — hata kama wanajua DID yako, hawawezi kutatua endpoint yako.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
