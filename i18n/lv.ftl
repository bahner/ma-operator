# zion — Latviešu
lang-name = Latviešu

# ── Pieteikšanās lapa ─────────────────────────────────────────────────────
tab-login = pierakstīties
tab-new-identity = jauna identitāte
tab-import-profile = importēt profilu
label-passphrase = paroles frāze
label-username = lietotājvārds
label-confirm-passphrase = apstiprināt paroles frāzi
label-did = DID
label-profile-cid = profila CID
label-or-file = vai fails
btn-login = pierakstīties
btn-export = eksportēt
btn-generate = ģenerēt
btn-new-endpoint = jauns galapunkts
btn-import-profile = importēt profilu
passphrase-warning = Zaudēta paroles frāze = zaudēta identitāte. Atjaunošana nav iespējama.
import-profile-help = Importējiet profilu, izmantojot CID vai failu. Nepieciešama tā pati ieejas frāze, kas izmantota publicēšanas laikā.
import-profile-detected-user = Profils pieder: { $name }
status-unlocking = atbloķē...
status-generating = ģenerē identitāti...
status-reading-file = lasa failu...
status-fetching-profile = profils tiek ielādēts no IPFS...
status-imported = importēja '{ $name }' — pārslēdzieties uz Pieteikšanās cilni
status-importing-profile = profils tiek importēts...
profile-import-done = profils importēts '{ $name }' — ielādētas { $n } atslēgas
error-wrong-passphrase = nepareiza paroles frāze: { $e }
error-identity-not-found = identitāte '{ $name }' nav atrasta
error-username-required = lietotājvārds ir obligāts
error-passphrase-required = paroles frāze ir obligāta
error-passphrases-no-match = paroles frāzes nesakrīt
error-profile-source-required = norādiet CID vai augšupielādējiet failu
error-did-required = ievadiet savu DID
error-profile-fetch = nevarēja ielādēt profilu: { $e }
error-profile-no-username = profilā nav lietotājvārda
error-profile-no-identity = identitāte '{ $name }' nav atrasta — vispirms importējiet identitāti

# ── Termināļa sistēmas ziņojumi ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — pierakstījies kā { $username }
msg-type-help = Ierakstiet .help, lai iegūtu komandu sarakstu.
msg-connecting = savienojas ar iroh...
msg-iroh-ready = iroh galapunkts gatavs
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicēts caur lokālo ma ({ $url })
msg-ma-connecting-matrix = trying to connect you to the 間trix
msg-local-ma-claimed = claimed local 間
msg-local-ma-already-claimed = local 間 already claimed
msg-local-ma-claim-failed = failed to claim local 間
msg-identity-not-published = Identitāte nav atrasta tiešsaistē — ja ma ir instalēts lokāli, izpildi '.ma [port]' un pēc tam '.my.identity!publish @ma'. Raksti '.help/publish' detaļām.
msg-blocked = ⊗ bloķēts [{ $cap }]: { $from }
msg-focus-cleared = fokuss notīrīts
msg-focusing = fokusē { $did } kā { $prompt }
msg-set = { $path }: { $value }
msg-deleted = dzēsa { $path } ({ $count } ierakstus)
msg-read-only = { $path } ir tikai lasāms
msg-subtree-set = { $path } ir apakškoks; iestatīšana atteikta
msg-ancestor-leaf = { $path } priekštecis ir lapa; pārklāšana atteikta
msg-key-not-found = atslēga nav atrasta: { $path }
msg-no-match = nav sakritību
msg-link-not-connected = saites ielādes kļūda: nav savienojuma
msg-link-fetch-error = saites ielādes kļūda: { $e }
msg-link-key-not-found = atslēga `{ $key }` nav atrasta saistītajā dokumentā

# ── Aizstājvārdu validācija ───────────────────────────────────────────────
err-alias-name-empty = aizstājvārda nosaukums nevar būt tukšs
err-alias-has-dot = aizstājvārda nosaukums nevar saturēt '.'
err-alias-has-fragment = aizstājvārda nosaukums nevar saturēt '#'
err-alias-value-fragment = aizstājvārda vērtībā var būt ne vairāk kā viens netukšs DID-URL fragments
err-alias-value-path = aizstājvārda vērtībai jābūt did:ma:<ipns> DID vai DID-URL (bez ceļa)
err-alias-not-did = aizstājvārda vērtībai jāsākas ar did:ma:
err-unknown-alias = nezināms aizstājvārds: @{ $name }
err-bare-did = gaidīja tīru did:ma:<ipns> (bez fragmenta vai ceļa), saņēma { $did }

# ── Redaktors ─────────────────────────────────────────────────────────────
btn-save = Saglabāt
btn-eval = Izpildīt
btn-cancel = Atcelt
btn-close = Aizvērt
btn-reply = Atbildēt
btn-publish = Publicēt
btn-publish-ipld = Publicēt IPLD
msg-reply-sent = atbilde nosūtīta
msg-reply-failed = atbildes nosūtīšana neizdevās: { $e }
msg-entity-publish-sent = entītija { $name }: publicēšana nosūtīta
msg-entity-publish-failed = entītijas publicēšana neizdevās: { $e }
msg-kind-publish-failed = tipa publicēšana neizdevās: { $e }
msg-field-publish-sent = entītija { $name }.{ $field }: publicēšana nosūtīta
msg-field-publish-failed = lauka publicēšana neizdevās: { $e }
msg-acl-publish-sent = izpildlaika ACL: publicēšana nosūtīta
msg-crud-edit-publish-sent = { $path }: publicēšana nosūtīta
msg-acl-publish-failed = izpildlaika ACL publicēšana neizdevās: { $e }
msg-yaml-error = YAML kļūda: { $e }
msg-editor-saved = { $path }:saglabāt
msg-fetch-review = ielādēja { $cid } — pārskatiet pirms izpildes
msg-fetch-failed = ielāde { $cid }: { $e }

# ── Darbības vārdi — iesūtne ──────────────────────────────────────────────
inbox-empty = iesūtne ir tukša
inbox-entry-not-found = iesūtnes ieraksts { $n } nav atrasts
inbox-no-message-id = iesūtnes ierakstam { $n } nav message_id
inbox-no-verb = iesūtnes ierakstam { $n } nav darbības vārda `{ $verb }`
inbox-filter-no-arg = filtram nepieciešams DID vai alias arguments
inbox-filter-empty = nav ziņojumu no { $did }

# ── Darbības vārdi — izpildlaiks ─────────────────────────────────────────
discover-fetch-failed = atklāšana neizdevās { $url }: { $e }
discover-json-error = atklāšana neizdevās: nepareizs JSON no { $url }: { $e }
discover-missing-did = atklāšana neizdevās: status.json trūkst obligātā lauka `did`
discover-invalid-did = atklāšana neizdevās: gaidīja `did` sākumu ar did:ma:, saņēma `{ $did }`
discover-no-endpoint = atklāšanas brīdinājums: `endpoint_id` trūkst status.json; saglabāja tikai DID
discover-hint-endpoint-not-found = Padoms: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Padoms: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Padoms: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Padoms: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma atklāts { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   aizstājvārds @ma izveidots — izpildi '.my.identity!publish @ma', lai publicētu savu identitāti.
claim-success = Izpildlaiks pieprasīts { $did }
claim-conflict = Izpildlaiks jau pieprasīts citas identitātes
claim-already-owned = Runtime already claimed by this identity
claim-http-failed = pieprasīšana neizdevās: HTTP { $status }
claim-error = pieprasīšana neizdevās: { $e }
claim-no-session = nav pierakstījies; vispirms pierakstieties, lai pieprasītu izpildlaiku
runtime-no-verb = { $path } nav darbības vārda `{ $verb }`

# ── Darbības vārdi — piekļuves kontrole ──────────────────────────────────
acl-reset = .my.acl atiestatīts (pilnīgi atvērts)
acl-persist-error = saglabāšanas kļūda: { $e }
acl-no-verb = .my.acl nav darbības vārda `{ $verb }`

# ── Darbības vārdi — identitāte ──────────────────────────────────────────
publish-usage = lietošana: .my.identity!publish <did-vai-aizstājvārds>
identity-exported = Pakotne lejupielādēta kā { $filename }
identity-export-failed = Eksports neizdevās: { $e }

# ── Darbības vārdi — dokumenti ───────────────────────────────────────────
doc-content-empty = { $path }.content ir tukšs
doc-save-first = { $path }.content ir tukšs — vispirms saglabājiet
doc-missing-name = trūkst dokumenta nosaukuma
doc-publish-usage = lietošana: .my.doc.<nosaukums>!publish <izdevējs>
doc-publish-ipld-usage = lietošana: .my.doc.<nosaukums>!publish-ipld <izdevējs>
doc-publish-failed = publicēšana { $path }: { $e }
doc-publish-ipld-failed = ipld-publicēšana { $path }: { $e }
doc-publish-error-detail = publicēšana neizdevās [{ $code }]: { $err }
doc-publish-error-hint = Padoms: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = saglabāšanas pieprasījums nosūtīts ({ $id }) → { $publisher }; CID pienāks caur RPC atbildi
doc-ipld-store-sent = IPLD-saglabāšanas pieprasījums nosūtīts ({ $id }) → { $publisher }; CID pienāks caur RPC atbildi
doc-fetch-done = ielādēja { $cid } → { $path }.content (nav izpildīts)
doc-fetch-failed = ielāde { $cid }: { $e }
doc-fetch-usage = lietošana: .my.doc.<nosaukums>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nav iestatīts
doc-no-verb = { $path } nav darbības vārda `{ $verb }`
path-no-verb = { $path } nav darbības vārda `{ $verb }`

# ── Palīdzības teksts — virsraksti ────────────────────────────────────────
help-header-zion = ── zion komandas ──────────────────────────────────────────────────────────
help-header-messaging = ── ziņojumi ──────────────────────────────────────────────────────────────
help-header-config = ── lokālā konfigurācijas gramatika ─────────────────────────────────────
help-header-common = ── biežākie ceļi ─────────────────────────────────────────────────────────
help-header-inbox = ── iesūtne ───────────────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        šis teksts
help-cmd-clear =   .clear                       notīrīt termināli
help-cmd-panic =   .panic                       pēdējais līdzeklis — izmantojiet, ja esat nonācis grūtībās
help-cmd-history =   .history                     komandu vēsture (secīgie dublikāti apvienoti)
help-cmd-logout =   .logout                      atteikties
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       parādīt atrisināto DID/DID-URL (ziņa netiek sūtīta)
help-msg-send =   @alias!msg body / @alias:verb args           nosūtīt ziņojumu / RPC dalībniekam
help-msg-fragment =   @alias#fragment:verb body  nosūtīt aizstājvārdam ar skaidru DID fragmentu
help-msg-escape =   \@name                       burtiski @name (nav aizstājvārda meklēšanas)


help-config-get =   .path                        iegūt lapas vērtību vai uzskaitīt apakškoku
help-config-filter =   .path value                  meklēšanas filtrs (filtrēt pēc vērtības)
help-config-set =   .path: value                 iestatīt lapu
help-config-delete =   .path:                       dzēst lapu vai apakškoku
help-config-verb =   .path!verb [args]            izpildīt lokālo darbības vārdu

help-my =   .my                          parādīt visu personisko konfigurāciju
help-aliases =   .my.aliases                  uzskaitīt aizstājvārdus
help-aliases-set =   .my.aliases.<name>: <did-url>    pievienot/atjaunināt aizstājvārdu (DID vai DID-URL)
help-aliases-del =   .my.aliases.<name>:          noņemt aizstājvārdu
help-runtime-discover =   .ma [port]          atklāt lokālo izpildlaiku un izveidot @ma aizstājvārdu
help-runtime-claim =   .ma [port]             pieprasīt izpildlaiku ar savu DID
help-identity =   .my.identity                 parādīt identitātes konfigurāciju
help-identity-did =   .my.identity.did             parādīt savu DID (tikai lasāms)
help-identity-publish =   .my.identity!publish @pub    publicēt savu DID caur izdevēja pakalpojumu
help-identity-export =   .my.identity!export          lejupielādēt savu identitātes pakotni
help-config-path =   .config                      parādīt visus .config.* ierakstus

help-inbox =   .my.inbox                    uzskaitīt iesūtni (apakškoka skats)
help-inbox-n =   .my.inbox.N                  parādīt ieraksta N laukus
help-inbox-from =   .my.inbox.N.from             sūtītāja DID ierakstam N
help-inbox-reply =   .my.inbox.N!reply [body]     nosūtīt atbildi (atver redaktoru bez satura)
help-inbox-open =   .my.inbox.N!open             atvērt saturu tikai lasāmā redaktorā
help-inbox-del =   .my.inbox.N:                 dzēst ierakstu N
help-inbox-delall =   .my.inbox:                   dzēst visus iesūtnes ierakstus
help-inbox-flush =   .my.inbox!flush              izdrukāt visus ierakstus terminālī
help-inbox-filter =   .my.inbox!filter @who        rādīt tikai @who ierakstus
help-inbox-traverse =   .my.inbox.N.sender.<lauks>  šķērsot sūtītāja DID dokumentu ar kavēšanos

help-doc-edit =   .my.doc.<nosaukums>!edit           atvērt redaktoru ar saglabāto saturu
help-doc-edit-cid =   .my.doc.<nosaukums>!edit /ipfs/<cid>     ielādēt CID, atvērt pārskatīšanai
help-doc-eval =   .my.doc.<nosaukums>!eval           izpildīt saglabāto saturu rindu pa rindai
help-doc-publish =   .my.doc.<nosaukums>!publish @pub   saglabāt kā neapstrādātu blob (visi veidi)
help-doc-publish-ipld =   .my.doc.<nosaukums>!publish-ipld @pub  saglabāt YAML kā strukturētu DAG-CBOR IPLD mezglu
help-doc-fetch =   .my.doc.<nosaukums>!fetch /ipfs/<cid>    importēt CID saturu (nav izpildes)
help-doc-cid =   .my.doc.<nosaukums>!cid            parādīt saglabāto CID
help-doc-del =   .my.doc.<nosaukums>:              dzēst dokumentu

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n stores the language preference tied to your identity.
help-i18n-set =   .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list =   .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 telpa ir telpa starp 間 identitātēm. ma ļauj šīm identitātēm atrast citai citu un sazināties; kad tava identitāte ir publicēta, tu vari piedalīties.
help-ma-command =   .ma [port]                   pieslēdzies lokālajam ma runtime, nolasi /status.json un saglabā .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publicē savu DID dokumentu, lai citi varētu atrast tavas atslēgas un endpoint
help-ma-security = Skaidrākā uzticēšanās robeža ir tavs paša ma runtime ar tavu paša IPFS Desktop/Kubo. Attāls publisher var būt noderīgs, bet tad tu paļaujies uz cita cilvēka pakalpojumu.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kā ieiet 間 telpā

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kad tava identitāte ir zināma, .enter @ma ļauj tev ieiet 間. Atrodi pasauli, ieej tajā un piedalies no turienes.
help-ma-entry-steps = Palaid IPFS Desktop un ma, pēc tam izpildi .ma. Publicē ar .my.identity!publish @ma, atrodi pasauli un ieej ar .enter @ma.
help-ma-entry-command =   .enter @ma                  ieiet 間 caur @ma runtime
help-ma-entry-leave =   .leave                       atstāj telpu; tava identitāte paliek aktīva un tu paliec pieteicies
help-ma-entry-url =   ?enter=<runtime>             ieiet pēc pieteikšanās no koplietota URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Pieejamās valodas (iestatīt ar .my.i18n: <code>):
err-lang-not-found = valoda nav atrasta: { $lang }

msg-send-failed = sūtīšana neizdevās: { $e }
msg-not-logged-in = nav pieteicies

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parsēšanas kļūda: { $e }
yaml-not-mapping = YAML jābūt mapping (atslēga: vērtību pāri); vienkāršs teksts un skalāri nevar tikt saglabāti kā DAG-CBOR
dagcbor-encode-error = DAG-CBOR kodēšanas kļūda: { $e }
cbor-decode-error = CBOR dekodēšanas kļūda: { $e }
cbor-json-error = CBOR uz JSON kļūda: { $e }
yaml-serialize-error = YAML serializācijas kļūda: { $e }
edit-reply-invalid = Nepareiza rediģēšanas atbilde
doc-publish-ipld-error = IPLD publicēšana neizdevās: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Iesūtnes tīrīšanas saglabāšanas kļūda: { $e }
err-config-load = Konfigurācijas ielādes kļūda: { $e }
err-lang-persist = Valodas saglabāšanas kļūda: { $e }
err-history-parse = Vēstures parsēšanas kļūda: { $e }
err-history-load = Vēstures ielādes kļūda: { $e }
err-ipfs-reply-decode = IPFS atbildes dekodēšanas kļūda: { $e }
err-edit-cbor = CBOR rediģēšanas kļūda: { $e }
err-popup-blocked = Uznirstošais logs ir bloķēts pārlūkprogrammā
status-publishing = publicēšana

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = kļūda
rpc-error-detail = kļūda: { $detail }
msg-new-message = ← [{ $from }] jauna ziņa — { $count } iesūtnē
msg-chat = { $sender } saka { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } saka { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ienāk istabā.
room-leave = * { $name } iziet no istabas.
room-drop  = * { $name } nometat { $thing }.
room-take  = * { $name } paņem { $thing }.
err-edit-decode-failed = rediģēšana: atšifrēšanas kļūda: { $e }
err-edit-fetch-failed = rediģēšana: iegūšanas kļūda: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nav aktīvas sesijas — profilu nevar dzēst
profile-delete-error = profila dzēšana neizdevās: { $e }
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
profiles-empty = (nav)
profiles-deleted = profils { $name } dzēsts
profiles-not-found = profils nav atrasts: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-ma =   .help/ma                     ma-space, publishing, and entry
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list entities
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head =   (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail =   (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc =   (define x (@actor:verb arg))  keep RPC replies in the session environment
help-actor-wc-l =   .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    zion atvēršana, izmantojot URL saiti
help-topic-i18n =   .help/i18n                   language preference for your identity
help-header-url = ── URL parametri ────────────────────────────────────────────────────────────────
help-url-intro =   Dalies ar saiti, kas atver zion ar iepriekš aizpildītu saņēmēju:
help-url-msg =   ?msg=<did>                   iepriekš aizpilda: @<did>!msg (parasta ziņa)
help-url-say =   ?say=<did>                   iepriekš aizpilda: @<did>!say (darbības vārds say)
help-url-emote =   ?emote=<did>                 iepriekš aizpilda: @<did>!emote (darbības vārds emote)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ievade ir iepriekš aizpildīta, bet nav nosūtīta — nospied Enter, lai nosūtītu.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                identitātes publicēšana tīklā
help-header-publish = ── identitātes publicēšana ──────────────────────────────────────────────────
help-publish-intro = Publicēšana padara tavu identitāti atrodamu tīklā. Citi var meklēt tavu DID, lai sazinātos ar tevi.
help-publish-ma = Lai publicētu, tev ir nepieciešams instalēts ma (lokālā izpildes vide). Tas savieno ego ar IPFS/IPNS tavā vārdā.
help-publish-steps = Soļi: izpildi '.ma [port]', lai noteiktu vietējo ma, pēc tam '.my.identity!publish @ma'.
help-publish-without = Bez publicēšanas citi nevar tevi sasniegt — pat zinot tavu DID, viņi nevar atrisināt tavu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = Neizdevās ielādēt CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Nederīgs CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Brīdinājums: Jūsu IPNS privātā atslēga tiks nosūtīta uz šo izpildes vidi identitātes publicēšanai. Izmantojiet tikai izpildes vidi, kurai pilnībā uzticaties.
