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
msg-reply-sent = jibu limetumwa
msg-reply-failed = kutuma jibu kumeshindwa: { $e }
msg-entity-publish-sent = kitu { $name }: uchapishaji umetumwa
msg-entity-publish-failed = kuchapisha kitu kumeshindwa: { $e }
msg-field-publish-sent = kitu { $name }.{ $field }: uchapishaji umetumwa
msg-field-publish-failed = kuchapisha uwanja kumeshindwa: { $e }
msg-acl-publish-sent = ACL ya wakati wa utekelezaji: uchapishaji umetumwa
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

# ── Vitenzi — wakati wa utekelezaji ──────────────────────────────────────
discover-fetch-failed = ugunduzi umeshindwa katika { $url }: { $e }
discover-json-error = ugunduzi umeshindwa: JSON batili kutoka { $url }: { $e }
discover-missing-did = ugunduzi umeshindwa: status.json inakosea uwanja unaohitajika `did`
discover-invalid-did = ugunduzi umeshindwa: ilitarajiwa `did` kuanza na did:ma:, ilipokea `{ $did }`
discover-no-endpoint = onyo la ugunduzi: `endpoint_id` haipo katika status.json; DID tu ilihifadhiwa
discover-success = ma imegunduliwa katika { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   jina la kubadilisha @ma limeundwa — chapisha na: .my.identity:publish @ma
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
help-cmd-logout =   .logout                      toka

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
help-config-path =   .config                      onyesha ingizo zote za .config.*

help-inbox =   .my.inbox                    orodhesha kisanduku cha barua (mtazamo wa mti mdogo)
help-inbox-n =   .my.inbox.N                  onyesha sehemu za ingizo N
help-inbox-from =   .my.inbox.N.from             DID ya mtumaji kwa ingizo N
help-inbox-reply =   .my.inbox.N:reply [body]     tuma jibu (fungua mhariri bila mwili)
help-inbox-open =   .my.inbox.N:open             fungua maudhui katika mhariri wa kusoma tu
help-inbox-del =   .my.inbox.N:                 futa ingizo N
help-inbox-delall =   .my.inbox:                   futa ingizo zote za kisanduku cha barua
help-inbox-flush =   .my.inbox:flush              chapisha ingizo zote kwenye terminal
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
