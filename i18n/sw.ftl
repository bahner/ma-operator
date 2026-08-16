# zion — Kiswahili
lang-name = Kiswahili
label-nick = jina la utani
new-identity-nick-help = Chagua jina la utani kwa 間-space. Ni jina la utani tu, na unaweza kulibadilisha wakati wowote.
error-nick-required = jina la utani linahitajika
error-nick-invalid = jina la utani halipaswi kuwa na nafasi au @

# ── Ukurasa wa kuingia ────────────────────────────────────────────────────
tab-login = ingia
tab-new-identity = utambulisho mpya
tab-import-profile = leta wasifu
label-passphrase = neno la siri
label-username = jina la mtumiaji
label-confirm-passphrase = thibitisha neno la siri
label-did = DID
label-profile-cid = CID ya wasifu
label-or-file = au faili
btn-login = ingia
btn-export = hamisha
btn-generate = tengeneza
btn-new-endpoint = kituo kipya
btn-import-profile = leta wasifu
btn-show-qr = onyesha QR
btn-scan-qr = skani QR
qr-scan-hint = Elekeza kamera kwenye msimbo wa QR wa wasifu wa zion.
qr-error-camera = kamera haipatikani: { $e }
qr-error-too-large = wasifu ni mkubwa mno kwa msimbo wa QR
passphrase-warning = Neno la siri lililopotea = utambulisho uliopotea. Hakuna urejeshaji unaowezekana.
import-profile-help = Leta wasifu kwa kutumia CID au faili. Unahitaji neno kuu sawa lililotumika wakati wa kuchapisha.
import-profile-detected-user = Wasifu ni wa: { $name }
status-unlocking = kufungua...
status-generating = kutengeneza utambulisho...
status-reading-file = kusoma faili...
status-fetching-profile = inaleta wasifu kutoka IPFS...
status-imported = '{ $name }' imeingizwa — nenda kwenye kichupo cha Ingia
status-importing-profile = inaleta wasifu...
profile-import-done = wasifu uliletwa kwa '{ $name }' — funguo { $n } zimepakiwa
error-wrong-passphrase = neno la siri lisilo sahihi: { $e }
error-identity-not-found = utambulisho '{ $name }' haupatikani
error-username-required = jina la mtumiaji linahitajika
error-passphrase-required = neno la siri linahitajika
error-passphrases-no-match = maneno ya siri hayafanani
error-profile-source-required = toa CID au pakia faili
error-did-required = ingiza DID yako
error-profile-fetch = haikuwezekana kupata wasifu: { $e }
error-profile-no-username = wasifu hauna jina la mtumiaji
error-profile-no-identity = utambulisho '{ $name }' haukupatikana — leta utambulisho kwanza

# ── Ujumbe wa mfumo wa terminal ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — umeingia kama { $username }
msg-type-help = Andika .help kupata orodha ya amri.
msg-getting-started = Jaribu: say Hello world, look, .help, au help.
msg-connecting = kuunganisha na iroh...
msg-iroh-ready = mwisho wa iroh uko tayari
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID imechapishwa kupitia 間 ya ndani ({ $url })
msg-identity-publication-propagating = Uchapishaji wa utambulisho bado unasambaa; entry imechelewa: { $e }
msg-identity-first-publish = Inachapisha utambulisho kwa mara ya kwanza. Hii inaweza kuchukua hadi sekunde { $seconds }.
msg-ma-connecting-matrix = tunajaribu kukuunganisha na 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 ya ndani imedaiwa
msg-local-ma-already-claimed = 間 ya ndani tayari imedaiwa
msg-local-ma-claim-failed = imeshindikana kudai 間 ya ndani
msg-identity-not-published = Utambulisho haukupatikana mtandaoni — ikiwa 間 imewekwa ndani, endesha '.ma: claim [port]' kisha '.my.identity!publish @ma'. Andika '.help/publish' kwa maelezo.
msg-blocked = ⊗ imezuiwa [{ $cap }]: { $from }
msg-focus-cleared = umakini umefutwa
msg-left = left
msg-focusing = kuzingatia { $did } kama { $prompt }
msg-set = { $path }: { $value }
msg-deleted = imefutwa { $path } ({ $count } ingizo)
msg-read-only = { $path } ni ya kusoma tu
msg-subtree-set = { $path } ni mti mdogo; mipangilio imekataliwa
msg-ancestor-leaf = babu wa { $path } ni jani; ufunikaji umekataliwa
msg-key-not-found = ufunguo haupatikani: { $path }
msg-link-not-connected = hitilafu ya kupata kiungo: haijaunganishwa
msg-link-fetch-error = hitilafu ya kupata kiungo: { $e }
msg-link-key-not-found = ufunguo `{ $key }` haupatikani katika hati iliyounganishwa

# ── Uthibitisho wa jina la kubadilisha ───────────────────────────────────
err-alias-name-empty = jina la jina la kubadilisha haliwezi kuwa wazi
err-alias-has-dot = jina la jina la kubadilisha haliwezi kuwa na '.'
err-alias-has-fragment = jina la jina la kubadilisha haliwezi kuwa na '#'
err-alias-value-fragment = thamani ya jina la kubadilisha inaweza kuwa na kipande kimoja tu cha DID-URL kisicho tupu
err-alias-value-path = thamani ya jina la kubadilisha lazima iwe did:ma:<ipns> DID au DID-URL (bila njia)
err-alias-not-did = thamani ya jina la kubadilisha lazima ianze na did:ma:
err-unknown-alias = jina la kubadilisha lisilojulikana: @{ $name }
err-bare-did = imehitajika did:ma:<ipns> safi (bila kipande au njia), ilipokea { $did }

# ── Mhariri ───────────────────────────────────────────────────────────────
btn-save = Hifadhi
btn-eval = Tekeleza
btn-cancel = Ghairi
msg-jobs-cancelled = kazi zimeghairiwa
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
discover-hint-endpoint-not-found = Kidokezo: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Kidokezo: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Kidokezo: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Kidokezo: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 imegunduliwa katika { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   jina bandia @ma limeundwa — endesha '.my.identity!publish @ma' kutangaza utambulisho wako.
claim-success = Wakati wa utekelezaji umedaiwa kwa { $did }
claim-conflict = Wakati wa utekelezaji tayari umedaiwa na utambulisho mwingine
claim-already-owned = Runtime tayari imedaiwa na utambulisho huu
claim-http-failed = kudai kumeshindwa: HTTP { $status }
claim-error = kudai kumeshindwa: { $e }
claim-no-session = hujaingia; ingia kwanza ili kudai wakati wa utekelezaji
runtime-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }

# ── Vitenzi — udhibiti wa ufikiaji ────────────────────────────────────────
acl-reset = .my.acl imewekwa upya (wazi kabisa)
err-persist = hitilafu ya kuhifadhi: { $e }
acl-no-verb = hakuna kitenzi `{ $verb }` kwa .my.acl

# ── Vitenzi — utambulisho ─────────────────────────────────────────────────
publish-usage = matumizi: .my.identity!publish <did-au-jina-la-kubadilisha>
identity-exported = Kifurushi kilipakuliwa kama { $filename }
identity-export-failed = Usafirishaji umeshindwa: { $e }

# ── Vitenzi — nyaraka ─────────────────────────────────────────────────────
doc-content-empty = { $path } ipo wazi
doc-save-first = { $path } ipo wazi — hifadhi kwanza
doc-missing-name = jina la hati linakosekana
doc-publish-usage = matumizi: .my.doc.<jina>!publish <mchapishaji>
doc-publish-ipld-usage = matumizi: .my.doc.<jina>!publish-ipld <mchapishaji>
doc-publish-failed = kuchapisha { $path }: { $e }
doc-publish-ipld-failed = kuchapisha IPLD { $path }: { $e }
doc-publish-error-detail = uchapishaji umeshindwa [{ $code }]: { $err }
doc-publish-error-hint = Kidokezo: { $hint }
doc-publish-hint-session = ingia tena ili ego iweze kufikia funguo zako za utambulisho
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = thibitisha kuwa hati ya DID ya mchapishaji imechapishwa na ina sehemu ya mwisho inayoweza kufikiwa
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = wakati wa kukimbia/programu-jalizi imekataa ombi; kagua sababu na ujaribu tena baada ya kurekebisha huluki/muda wa utekelezaji
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = kagua kumbukumbu za wakati wa utekelezaji kwa sababu za kina na ujaribu tena
doc-store-sent = ombi la kuhifadhi limetumwa ({ $id }) → { $publisher }; CID itafika kupitia jibu la RPC
doc-ipld-store-sent = ombi la kuhifadhi IPLD limetumwa ({ $id }) → { $publisher }; CID itafika kupitia jibu la RPC
doc-fetch-done = { $cid } imepatikana → { $path } (haijatekelezwa)
doc-fetch-failed = kupata { $cid }: { $e }
doc-fetch-usage = matumizi: .my.doc.<jina>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid haijawekwa
doc-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }
path-no-verb = hakuna kitenzi `{ $verb }` kwa { $path }

# ── Maandishi ya msaada — vichwa ──────────────────────────────────────────
help-header-zion = ── amri za zion ───────────────────────────────────────────────────────────
help-header-messaging = ── ujumbe ────────────────────────────────────────────────────────────────
help-header-config = ── sarufi ya usanidi wa ndani ─────────────────────────────────────────
help-header-common = ── njia za kawaida ───────────────────────────────────────────────────────
help-header-inbox = ── kisanduku cha barua ───────────────────────────────────────────────────
help-header-documents = ── nyaraka ──────────────────────────────────────────────────────────────
help-header-i18n = ── lugha ───────────────────────────── ──────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── kuingia 間-nafasi ───────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        maandishi haya
help-cmd-clear =   .clear                       futa terminal
help-cmd-panic =   .panic                       njia ya mwisho — tumia ukiwa katika shida
help-cmd-history =   .history [n]                 historia ya amri (marudio yanayofuatana yamejumuishwa); n hiari inaonyesha tu mistari n ya mwisho
help-cmd-logout =   .logout                      toka
help-cmd-batch =   .batch                       evaluasi dokumen coretan secara paralel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         evaluasi dokumen coretan baris demi baris

help-msg-echo =   @alias                       onyesha DID/DID-URL iliyotatuliwa (hakuna ujumbe unaotumwa)
help-msg-send =   @alias!msg body / @alias:verb args           tuma ujumbe / RPC kwa muigizaji
help-msg-fragment =   @alias#fragment:verb body  tuma kwa jina la kubadilisha lenye kipande cha DID wazi
help-msg-escape =   \@name                       @name halisi (bila utafutaji wa jina la kubadilisha)


help-config-get =   .path                        pata thamani ya jani au orodhesha mti mdogo
help-config-filter =   .path [jina]                 orodhesha majina ya funguo za watoto zenye jina
help-config-full =   .path. [jina]                orodhesha thamani kamili za mti mdogo zenye jina
help-config-set =   .path: value                 weka jani
help-config-delete =   .path:                       futa jani au mti mdogo
help-config-verb =   .path!verb [args]            tekeleza kitenzi cha ndani

help-my =   .my                          onyesha usanidi wote wa kibinafsi
help-aliases =   .my.aliases                  orodhesha majina ya kubadilisha
help-aliases-set =   .my.aliases.<name>: <did-url>    ongeza/sasisha jina la kubadilisha (DID au DID-URL)
help-aliases-del =   .my.aliases.<name>:          ondoa jina la kubadilisha
help-runtime-discover =   .ma: claim [port]          gundua wakati wa utekelezaji wa ndani na unda jina la kubadilisha @ma
help-runtime-claim =   .ma: claim [port]             dai wakati wa utekelezaji na DID yako
help-identity =   .my.identity                 onyesha usanidi wa utambulisho
help-identity-did =   .my.identity.did             onyesha DID yako mwenyewe (kusoma tu)
help-identity-publish =   .my.identity!publish @pub    chapisha DID yako kupitia huduma ya mchapishaji
help-identity-export =   .my.identity!export          pakua kifurushi cha utambulisho wako
help-config-path =   .config                      onyesha ingizo zote za .config.*

help-inbox =   .my.inbox                    orodhesha kisanduku cha barua (mtazamo wa mti mdogo)
help-inbox-n =   .my.inbox.N                  onyesha sehemu za ingizo N
help-inbox-from =   .my.inbox.N.from             DID ya mtumaji kwa ingizo N
help-inbox-reply =   .my.inbox.N!reply [body]     tuma jibu (fungua mhariri bila mwili)
help-inbox-open =   .my.inbox.N!open             fungua maudhui katika mhariri wa kusoma tu
help-inbox-del =   .my.inbox.N:                 futa ingizo N
help-inbox-delall =   .my.inbox:                   futa ingizo zote za kisanduku cha barua
help-inbox-flush =   .my.inbox!flush              chapisha ingizo zote kwenye terminal
help-inbox-filter =   .my.inbox!filter @who        onyesha maingizo kutoka @who peke yake
help-inbox-traverse =   .my.inbox.N.sender.<uwanja>  pita hati ya DID ya mtumaji kwa uvivu

help-doc-edit =   .my.doc.<jina>!edit           fungua mhariri na maudhui yaliyohifadhiwa
help-doc-edit-cid =   .my.doc.<jina>!edit /ipfs/<cid>     pata CID, fungua kwa mapitio
help-doc-eval =   .my.doc.<jina>!eval           tekeleza maudhui yaliyohifadhiwa mstari kwa mstari
help-doc-publish =   .my.doc.<jina>!publish @pub   hifadhi kama blob ghafi (aina zote)
help-doc-publish-ipld =   .my.doc.<jina>!publish-ipld @pub  hifadhi YAML kama nodi ya DAG-CBOR IPLD iliyopangwa
help-doc-fetch =   .my.doc.<jina>!fetch /ipfs/<cid>    ingiza maudhui ya CID (bila utekelezaji)
help-doc-cid =   .my.doc.<jina>!cid            onyesha CID iliyohifadhiwa
help-doc-del =   .my.doc.<jina>:              futa hati

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n huhifadhi mapendeleo ya lugha yanayohusiana na utambulisho wako.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               orodhesha misimbo ya lugha inayopatikana

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Chumba cha 間 ni nafasi kati ya vitambulisho vya 間. ma huviwezesha vitambulisho hivyo kupatana na kuwasiliana; utambulisho wako ukishachapishwa, unaweza kushiriki.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   unganisha kwenye 間 runtime yako ya karibu, soma /status.json, na uhifadhi .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     chapisha hati yako ya DID ili wengine wapate funguo zako na endpoint yako
help-ma-security = Mpaka wa uaminifu ulio wazi zaidi ni 間 runtime yako mwenyewe pamoja na IPFS Desktop/Kubo yako mwenyewe. Publisher wa mbali anaweza kusaidia, lakini hapo unategemea huduma ya mtu mwingine.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             jinsi ya kuingia chumba cha 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Utambulisho wako ukijulikana, .enter @ma hukuruhusu kuingia 間. Tafuta ulimwengu, ingia ndani yake, na shiriki ukiwa hapo.
help-ma-entry-steps = Anzisha IPFS Desktop na ma, kisha endesha .ma. Chapisha kwa .my.identity!publish @ma, tafuta ulimwengu, na ingia kwa .enter @ma.
help-ma-entry-command =   .enter @ma                  ingia 間 kupitia @ma runtime
help-ma-entry-toggle =   .enter                       washa au zima fokasi ya chumba; utambulisho wako unabaki hai
help-ma-entry-url =   ?enter=<runtime>             ingia baada ya login kutoka URL iliyoshirikiwa

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
yaml-serialise-error = Kosa la kusindika YAML: { $e }
edit-reply-invalid = Jibu la uhariri lisilofaa
doc-publish-ipld-error = Kuchapisha IPLD kulishindwa: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kosa la kuhifadhi usafishaji wa kisanduku cha barua: { $e }
err-config-load = Kosa la kupakia mipangilio: { $e }
err-lang-persist = Kosa la kuhifadhi lugha: { $e }
err-history-parse = Kosa la kuchanganua historia: { $e }
err-history-load = Kosa la kupakia historia: { $e }
err-history-count-invalid = idadi ya historia lazima iwe nambari nzima chanya
err-ipfs-reply-decode = Kushindwa kusimbua jibu la IPFS: { $e }
err-edit-cbor = Kosa la kuhariri CBOR: { $e }
err-popup-blocked = Kivinjari kimezuia dirisha la popup
status-publishing = inachapisha

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = hitilafu
rpc-error-detail = hitilafu: { $detail }
msg-new-message = ← [{ $from }] ujumbe mpya — { $count } kwenye kisanduku
msg-chat = { $sender } anasema { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } anasema { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ameingia chumbani.
room-leave = * { $name } ametoka chumbani.
room-drop  = * { $name } amemwaga { $thing }.
room-take  = * { $name } amechukua { $thing }.
err-edit-decode-failed = kuhariri: hitilafu ya usimbaji: { $e }
err-edit-fetch-failed = kuhariri: hitilafu ya kupata: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = hakuna kipindi cha kazi — profaili haiwezi kufutwa
profile-delete-error = kufuta profaili kumeshindwa: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = wasifu umesimbwa na kutumwa kwa IPFS; hati ya DID itasasishwa CID itakapofika
profile-publish-done = wasifu umechapishwa — hati ya DID imesasishwa kwa ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = utambulisho tayari umechapishwa - wasifu umesasishwa
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = maudhui ya jozi (hayajaonyeshwa)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (hakuna)
profiles-deleted = profaili { $name } imefutwa
profiles-not-found = profaili haikupatikana: { $name }

# -- Help topics index
help-header-topics = -- topik -- ketik .help/<topic> untuk detail
help-topic-msg =   .help/msg                    pesan
help-topic-ma = .help/ma                     間-nafasi, uchapishaji, na kuingia
help-topic-path = .help/path                   sarufi ya njia ya nukta
help-topic-my =   .help/my                     config pribadi
help-topic-inbox =   .help/inbox                  kotak masuk
help-topic-doc =   .help/doc                    dokumen
help-topic-actor =   .help/actor                  actor jarak jauh
help-topic-zscheme =   .help/zscheme               semi za Scheme ndani ya mstari na nyaraka
help-unknown-topic =   .help/{ $topic }: topik tidak dikenal

# -- Help actor section
help-header-actor = -- aktor jarak jauh
help-actor-echo =   @actor                       tampilkan DID yang diselesaikan
help-actor-text = @actor[#entity]!msg|!say|!emote body         tuma ujumbe wa moja kwa moja / gumzo / hisia
help-actor-ping = @actor:ping                  uhai wa ping
help-actor-entities =   @actor/entities              daftar entitas
help-actor-entities-get = @actor/entities/<n>          pata nodi ya chombo
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entitas
help-actor-entities-del = @actor/entities/<n>:         futa huluki
help-actor-config-get =   @actor/config/<key>          ambil nilai config
help-actor-config-set =   @actor/config/<key>: val     atur nilai config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              hariri ACL
help-actor-fragment =   @actor#entity                kirim ke plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ke plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  weka majibu ya 5 katika mazingira ya kikao
help-actor-wc-l = .z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    kufungua zion kupitia kiungo cha URL
help-topic-i18n = .help/i18n                   upendeleo wa lugha kwa utambulisho wako
help-header-url = ── vigezo vya URL ────────────────────────────────────────────────────────────────
help-url-intro =   Shiriki kiungo kinachofungua zion na mpokeaji aliyewekwa mapema:
help-url-msg =   ?msg=<did>                   jaza mapema: @<did>!msg (ujumbe wa kawaida)
help-url-say =   ?say=<did>                   jaza mapema: @<did>!say (kitenzi say)
help-url-emote =   ?emote=<did>                 jaza mapema: @<did>!emote (kitenzi emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             ingiza ulimwengu wa wakati wa kukimbia baada ya kuingia
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ingizo limejazwa mapema lakini halijatumwa — bonyeza Enter kutuma.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                chapisha utambulisho wako kwenye mtandao
help-header-publish = ── kuchapisha utambulisho ────────────────────────────────────────────────────
help-publish-intro = Kuchapisha hufanya utambulisho wako upatikane kwenye mtandao. Wengine wanaweza kutafuta DID yako kukufikia.
help-publish-ma = Ili kuchapisha, unahitaji 間 (runtime ya ndani) imewekwa. Inaunganisha ego na IPFS/IPNS kwa niaba yako.
help-publish-steps = Hatua: endesha '.ma: claim [port]' kugundua ma ya ndani, kisha '.my.identity!publish @ma'.
help-publish-without = Bila kuchapisha, wengine hawawezi kukufikia — hata kama wanajua DID yako, hawawezi kutatua endpoint yako.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = taja jina la wasifu: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kukusanya kundi — andika amri, malizia kwa .batch
batch-already-collecting = Tayari inakusanya kundi - malizia kwa .batch kwanza
batch-empty = Kundi lilikuwa tupu - hakuna cha kukimbia
batch-running = Menjalankan batch…
batch-step-timeout = hatua ya kundi imeisha muda

batch-done = Batch selesai dalam { $secs }d — { $steps } langkah
batch-done-error = Batch selesai dengan kesalahan dalam { $secs }d — { $steps } langkah
msg-timeout = Pesan habis waktu (tidak ada balasan dalam 60d)
err-unknown-command = amri isiyojulikana: { $path }
err-read-only-path = { $path } ni ya kusoma tu
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        evaluasi dokumen coretan secara paralel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Imeshindwa kupata CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID si sahihi: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Onyo: Ufunguo wako wa siri wa IPNS utatumwa kwa runtime hii kwa ajili ya kuchapisha utambulisho. Tumia runtime unayoiamini kabisa tu.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme hutathmini semi za Scheme zilizowekwa ndani ya amri za zion na huingiza matokeo kwenye mstari kabla ya kutumwa.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    mfano ndani ya mstari; hutuma "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             ufafanuzi hubaki kwa kipindi cha sasa cha kuingia
help-zscheme-doc = Nyaraka: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lango la IPFS la ndani (linahitaji ruhusa ya kivinjari)

tab-config = Mipangilio
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
