# zion — Eesti
lang-name = Eesti
label-nick = hüüdnimi
new-identity-nick-help = Vali 間-space'i jaoks hüüdnimi. See on ainult hüüdnimi ja seda saab igal ajal muuta.
error-nick-required = hüüdnimi on nõutav
error-nick-invalid = hüüdnimi ei tohi sisaldada tühikuid ega @ märki

# ── Sisselogimise leht ────────────────────────────────────────────────────
tab-login = logi sisse
tab-new-identity = uus identiteet
tab-import-profile = impordi profiil
label-passphrase = paroolilause
label-username = kasutajanimi
label-confirm-passphrase = kinnita paroolilause
label-did = DID
label-profile-cid = profiili CID
label-or-file = või fail
btn-login = logi sisse
btn-export = ekspordi
btn-generate = genereeri
btn-new-endpoint = uus lõpp-punkt
btn-import-profile = impordi profiil
btn-show-qr = näita QR-i
btn-scan-qr = skanni QR
qr-scan-hint = Suuna kaamera zioni profiili QR-koodile.
qr-error-camera = kaamera pole saadaval: { $e }
qr-error-too-large = profiil on QR-koodi jaoks liiga suur
passphrase-warning = Kaotatud paroolilause = kaotatud identiteet. Taastamine pole võimalik.
import-profile-help = Importige profiil CID või faili kaudu. Vajate sama paroolfraasi, mida kasutati avaldamisel.
import-profile-detected-user = Profiil kuulub: { $name }
status-unlocking = avatakse lukk...
status-generating = genereeritakse identiteeti...
status-reading-file = loetakse faili...
status-fetching-profile = profiili laadimine IPFS-ist...
status-imported = imporditi '{ $name }' — lülitu Sisselogimise vahekaardile
status-importing-profile = profiili importimine...
profile-import-done = profiil imporditi '{ $name }' jaoks — laaditi { $n } võtit
error-wrong-passphrase = vale paroolilause: { $e }
error-identity-not-found = identiteeti '{ $name }' ei leitud
error-username-required = kasutajanimi on kohustuslik
error-passphrase-required = paroolilause on kohustuslik
error-passphrases-no-match = paroolilaused ei ühti
error-profile-source-required = esitage CID või laadige üles fail
error-did-required = sisestage oma DID
error-profile-fetch = profiili ei saanud laadida: { $e }
error-profile-no-username = profiil ei sisalda kasutajanime
error-profile-no-identity = identiteet '{ $name }' ei leitud — importige esmalt identiteet

# ── Terminali süsteemiteated ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — sisse logitud kasutajana { $username }
msg-type-help = Käskude loendi saamiseks kirjuta .help/
msg-getting-started = Proovi: say Hello world, look, .help või help.
msg-connecting = ühendatakse iroh-iga...
msg-iroh-ready = iroh lõpp-punkt valmis
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID avaldatud kohaliku 間 kaudu ({ $url })
msg-identity-publication-propagating = Identiteedi avaldamine alles levib; entry on edasi lükatud: { $e }
msg-identity-first-publish = Avaldame identiteeti. See võib võtta kuni { $seconds } sekundit.
msg-ma-connecting-matrix = püüame sind ühendada 間trixiga
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = kohalik 間 nõutud
msg-local-ma-already-claimed = kohalik 間 on juba nõutud
msg-local-ma-claim-failed = kohaliku 間 nõudmine ebaõnnestus
msg-identity-not-published = Identiteeti ei leitud veebist — kui 間 on kohalikult installitud, käivita '.ma: claim [port]' ja seejärel '.my.identity!publish @ma'. Kirjuta '.help/publish' üksikasjade jaoks.
msg-blocked = ⊗ blokeeritud [{ $cap }]: { $from }
msg-focus-cleared = fookus tühjendatud
msg-left = left
msg-focusing = fokuseeritakse { $did } kui { $prompt }
msg-set = { $path }: { $value }
msg-deleted = kustutati { $path } ({ $count } kirjet)
msg-read-only = { $path } on kirjutuskaitstud
msg-subtree-set = { $path } on alampuu; seadmine keelatud
msg-ancestor-leaf = { $path } eellane on leht; varjutamine keelatud
msg-key-not-found = võtit ei leitud: { $path }
msg-link-not-connected = lingi toomise viga: pole ühendust
msg-link-fetch-error = lingi toomise viga: { $e }
msg-link-key-not-found = võtit `{ $key }` ei leitud lingitud dokumendist

# ── Aliase valideerimine ──────────────────────────────────────────────────
err-alias-name-empty = aliase nimi ei saa olla tühi
err-alias-has-dot = aliase nimi ei saa sisaldada '.'
err-alias-has-fragment = aliase nimi ei saa sisaldada '#'
err-alias-value-fragment = aliase väärtus võib sisaldada kuni ühte mittetühja DID-URL fragmenti
err-alias-value-path = aliase väärtus peab olema did:ma:<ipns> DID või DID-URL (ilma teeta)
err-alias-not-did = aliase väärtus peab algama did:ma:-ga
err-unknown-alias = tundmatu alias: @{ $name }
err-bare-did = oodati puhast did:ma:<ipns>-i (ilma fragmendi või teeta), saadi { $did }

# ── Redaktor ──────────────────────────────────────────────────────────────
btn-save = Salvesta
btn-eval = Käivita
btn-cancel = Tühista
msg-jobs-cancelled = tööd tühistatud
btn-close = Sulge
btn-reply = Vasta
btn-publish = Avalda
btn-publish-ipld = Avalda IPLD
msg-reply-sent = vastus saadetud
msg-reply-failed = vastuse saatmine ebaõnnestus: { $e }
msg-entity-publish-sent = olem { $name }: avaldamine saadetud
msg-entity-publish-failed = olemi avaldamine ebaõnnestus: { $e }
msg-kind-publish-failed = tüübi avaldamine ebaõnnestus: { $e }
msg-field-publish-sent = olem { $name }.{ $field }: avaldamine saadetud
msg-field-publish-failed = välja avaldamine ebaõnnestus: { $e }
msg-acl-publish-sent = käitusaja ACL: avaldamine saadetud
msg-crud-edit-publish-sent = { $path }: avaldamine saadetud
msg-acl-publish-failed = käitusaja ACL avaldamine ebaõnnestus: { $e }
msg-yaml-error = YAML-viga: { $e }
msg-editor-saved = { $path }:salvesta
msg-fetch-review = toodi { $cid } — vaata üle enne käivitamist
msg-fetch-failed = toomine { $cid }: { $e }

# ── Verbid — postkast ─────────────────────────────────────────────────────
inbox-empty = postkast on tühi
inbox-entry-not-found = postkasti kirjet { $n } ei leitud
inbox-no-message-id = postkasti kirjel { $n } puudub message_id
inbox-no-verb = postkasti kirjele { $n } pole verbi `{ $verb }`
inbox-filter-no-arg = filter vajab DID-i või aliase argumenti
inbox-filter-empty = { $did } sõnumeid pole

# ── Verbid — käitusaeg ────────────────────────────────────────────────────
discover-fetch-failed = avastamine ebaõnnestus aadressil { $url }: { $e }
discover-json-error = avastamine ebaõnnestus: vigane JSON aadressilt { $url }: { $e }
discover-missing-did = avastamine ebaõnnestus: status.json-il puudub kohustuslik väli `did`
discover-invalid-did = avastamine ebaõnnestus: oodati `did` algust did:ma:-ga, saadi `{ $did }`
discover-no-endpoint = avastamise hoiatus: `endpoint_id` puudub status.json-ist; salvestati ainult DID
discover-hint-endpoint-not-found = Vihje: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Vihje: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Vihje: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Vihje: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 avastati aadressil { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma loodud — käivita '.my.identity!publish @ma' oma identiteedi avaldamiseks.
claim-success = Käitusaeg nõutud kasutajale { $did }
claim-conflict = Käitusaeg on juba teise identiteedi poolt nõutud
claim-already-owned = Käitusaeg on juba selle identiteedi poolt nõutud
claim-http-failed = nõudmine ebaõnnestus: HTTP { $status }
claim-error = nõudmine ebaõnnestus: { $e }
claim-no-session = pole sisse logitud; logi kõigepealt sisse, et käitusaeg nõuda
runtime-no-verb = { $path } jaoks pole verbi `{ $verb }`

# ── Verbid — juurdepääsukontroll ──────────────────────────────────────────
acl-reset = .my.acl lähtestatud (täielikult avatud)
err-persist = salvestusviga: { $e }
acl-no-verb = .my.acl jaoks pole verbi `{ $verb }`

# ── Verbid — identiteet ───────────────────────────────────────────────────
publish-usage = kasutus: .my.identity!publish <did-või-alias>
identity-exported = Pakett alla laaditud nimega { $filename }
identity-export-failed = Eksport ebaõnnestus: { $e }

# ── Verbid — dokumendid ───────────────────────────────────────────────────
doc-content-empty = { $path } on tühi
doc-save-first = { $path } on tühi — salvesta esmalt
doc-missing-name = dokumendi nimi puudub
doc-publish-usage = kasutus: .my.doc.<nimi>!publish <avaldaja>
doc-publish-ipld-usage = kasutus: .my.doc.<nimi>!publish-ipld <avaldaja>
doc-publish-failed = avaldamine { $path }: { $e }
doc-publish-ipld-failed = ipld-avaldamine { $path }: { $e }
doc-publish-error-detail = avaldamine ebaõnnestus [{ $code }]: { $err }
doc-publish-error-hint = Vihje: { $hint }
doc-publish-hint-session = logige uuesti sisse, et ego pääseks teie identiteedivõtmetele juurde
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = veenduge, et väljaandja DID-dokument on avaldatud ja sisaldab saavutatavat lõpp-punkti
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = käitusaeg/plugin lükkas taotluse tagasi; kontrollige põhjust ja proovige pärast olemi/käitusaja parandamist uuesti
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = kontrollige käitusaja logisid üksikasjaliku põhjuse leidmiseks ja proovige uuesti
doc-store-sent = salvestustaotlus saadetud ({ $id }) → { $publisher }; CID saabub RPC-vastuse kaudu
doc-ipld-store-sent = IPLD-salvestustaotlus saadetud ({ $id }) → { $publisher }; CID saabub RPC-vastuse kaudu
doc-fetch-done = toodi { $cid } → { $path } (pole käivitatud)
doc-fetch-failed = toomine { $cid }: { $e }
doc-fetch-usage = kasutus: .my.doc.<nimi>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid pole seatud
doc-no-verb = { $path } jaoks pole verbi `{ $verb }`
path-no-verb = { $path } jaoks pole verbi `{ $verb }`

# ── Abiinfo — pealkirjad ──────────────────────────────────────────────────
help-header-zion = ── zion-käsud ────────────────────────────────────────────────────────────
help-header-messaging = ── sõnumid ───────────────────────────────────────────────────────────────
help-header-config = ── kohalik konfiguratsioonisüntaks ─────────────────────────────────────
help-header-common = ── tavalised teed ────────────────────────────────────────────────────────
help-header-inbox = ── postkast ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumendid ───────────────────────────────────────────────────────────
help-header-i18n = ── keel ───────────────────────────── ─────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-tühiku sisestamine ────────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        see tekst
help-cmd-clear =   .clear                       tühjenda terminal
help-cmd-panic =   .panic                       viimane abinõu — kasuta, kui oled hätta sattunud
help-cmd-history =   .history [n]                 käsuajalugu (järjestikused kordused ühendatud); valikuline n näitab ainult viimased n rida
help-cmd-logout =   .logout                      logi välja
help-cmd-batch =   .batch                       arvioi luonnosdokumentti rinnakkain
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         arvioi luonnosdokumentti riveittäin

help-msg-echo =   @alias                       kuva lahendatud DID/DID-URL (ühtegi sõnumit pole saadetud)
help-msg-send =   @alias!msg body / @alias:verb args           saada sõnum / RPC osalejale
help-msg-fragment =   @alias#fragment:verb body  saada aliasele selge DID-fragmendiga
help-msg-escape =   \@name                       sõnasõnaline @name (aliast ei otsita)


help-config-get =   .path                        too lehe väärtus või loetle alampuu
help-config-filter =   .path [nimi]                 loetle nime sisaldavate alamvõtmete nimed
help-config-full =   .path. [nimi]                loetle nime sisaldavad alampuu täisväärtused
help-config-set =   .path: value                 sea leht
help-config-delete =   .path:                       kustuta leht või alampuu
help-config-verb =   .path!verb [args]            käivita kohalik verb

help-my =   .my                          kuva kogu isiklik konfiguratsioon
help-aliases =   .my.aliases                  loetle aliased
help-aliases-set =   .my.aliases.<name>: <did-url>    lisa/uuenda alias (DID või DID-URL)
help-aliases-del =   .my.aliases.<name>:          eemalda alias
help-runtime-discover =   .ma: claim [port]          avasta kohalik käitusaeg ja loo @ma-alias
help-runtime-claim =   .ma: claim [port]             nõua käitusaeg oma DID-iga
help-identity =   .my.identity                 kuva identiteedi konfiguratsioon
help-identity-did =   .my.identity.did             kuva oma DID (kirjutuskaitstud)
help-identity-publish =   .my.identity!publish @pub    avalda oma DID avaldajateenuse kaudu
help-identity-export =   .my.identity!export          laadi alla oma identiteedipakett
help-config-path =   .config                      kuva kõik .config.*-kirjed

help-inbox =   .my.inbox                    loetle postkast (alampuuvaade)
help-inbox-n =   .my.inbox.N                  kuva kirje N väljad
help-inbox-from =   .my.inbox.N.from             saatja DID kirjele N
help-inbox-reply =   .my.inbox.N!reply [body]     saada vastus (avab redaktori ilma kehata)
help-inbox-open =   .my.inbox.N!open             ava sisu kirjutuskaitstud redaktoris
help-inbox-del =   .my.inbox.N:                 kustuta kirje N
help-inbox-delall =   .my.inbox:                   kustuta kõik postkasti kirjed
help-inbox-flush =   .my.inbox!flush              prindi kõik kirjed terminali
help-inbox-filter =   .my.inbox!filter @who        näita ainult @who kirjeid
help-inbox-traverse =   .my.inbox.N.sender.<väli>   läbi saatja DID-dokument viivitusega

help-doc-edit =   .my.doc.<nimi>!edit           ava redaktor salvestatud sisuga
help-doc-edit-cid =   .my.doc.<nimi>!edit /ipfs/<cid>     too CID, ava ülevaatamiseks
help-doc-eval =   .my.doc.<nimi>!eval           käivita salvestatud sisu rida-realt
help-doc-publish =   .my.doc.<nimi>!publish @pub   salvesta toorana blob (kõik tüübid)
help-doc-publish-ipld =   .my.doc.<nimi>!publish-ipld @pub  salvesta YAML struktureeritud DAG-CBOR IPLD-sõlmena
help-doc-fetch =   .my.doc.<nimi>!fetch /ipfs/<cid>    impordi CID-sisu (ei käivitata)
help-doc-cid =   .my.doc.<nimi>!cid            kuva salvestatud CID
help-doc-del =   .my.doc.<nimi>:              kustuta dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n salvestab teie identiteediga seotud keele-eelistuse.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               saadaolevate keelekoodide loend

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-tuba on ruum 間-identiteetide vahel. ma aitab neil identiteetidel üksteist leida ja suhelda; kui sinu identiteet on avaldatud, saad osaleda.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   ühendu kohaliku 間 runtime-iga, loe /status.json ja salvesta .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     avalda oma DID-dokument, et teised leiaksid sinu võtmed ja endpoint-i
help-ma-security = Kõige selgem usalduspiir on sinu enda 間 runtime koos sinu enda IPFS Desktop/Kubo-ga. Kaug-publisher võib olla kasulik, kuid siis sõltud kellegi teise teenusest.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kuidas 間-tuppa siseneda

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kui sinu identiteet on teada, lubab .enter @ma sul astuda 間-i. Leia maailm, sisene sellesse ja osale sealt.
help-ma-entry-steps = Käivita IPFS Desktop ja ma, seejärel käivita .ma. Avalda käsuga .my.identity!publish @ma, leia maailm ja sisene käsuga .enter @ma.
help-ma-entry-command =   .enter @ma                  sisene 間-i @ma runtime-i kaudu
help-ma-entry-toggle =   .enter                       lülita ruumifookus sisse või välja; sinu identiteet jääb aktiivseks
help-ma-entry-url =   ?enter=<runtime>             sisene pärast sisselogimist jagatud URL-ist

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Saadaolevad keeled (määra .my.i18n: <code>):
err-lang-not-found = keelt ei leitud: { $lang }

msg-send-failed = saatmine ebaõnnestus: { $e }
msg-not-logged-in = pole sisse logitud

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-parsimise viga: { $e }
yaml-not-mapping = YAML peab olema mapping (võtme: väärtuse paarid); lihtteksti ja skalaarid ei saa salvestada DAG-CBOR-ina
dagcbor-encode-error = DAG-CBOR-kodeerimise viga: { $e }
cbor-decode-error = CBOR-dekodeerimise viga: { $e }
cbor-json-error = CBOR JSONi teisendamise viga: { $e }
yaml-serialise-error = YAML-serialiseerimise viga: { $e }
edit-reply-invalid = Vigane redigeerimise vastus
doc-publish-ipld-error = IPLD avaldamine ebaõnnestus: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Postkasti puhastamise salvestamise viga: { $e }
err-config-load = Konfiguratsiooni laadimise viga: { $e }
err-lang-persist = Keele salvestamise viga: { $e }
err-history-parse = Ajaloo parsimise viga: { $e }
err-history-load = Ajaloo laadimise viga: { $e }
err-history-count-invalid = ajaloo arv peab olema positiivne täisarv
err-ipfs-reply-decode = IPFS vastuse dekodeerimine ebaõnnestus: { $e }
err-edit-cbor = CBOR redigeerimise viga: { $e }
err-popup-blocked = Brauser blokeeris hüpikakna
status-publishing = avaldamine

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = viga
rpc-error-detail = viga: { $detail }
msg-new-message = ← [{ $from }] uus sõnum — { $count } postkastis
msg-chat = { $sender } ütleb { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ütleb { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } siseneb ruumi.
room-leave = * { $name } lahkub ruumist.
room-drop  = * { $name } viskab { $thing }.
room-take  = * { $name } võtab { $thing }.
err-edit-decode-failed = redigeerimine: dekodeerimistõrge: { $e }
err-edit-fetch-failed = redigeerimine: laadimistõrge: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = aktiivne seanss puudub — profiili ei saa kustutada
profile-delete-error = profiili kustutamine ebaõnnestus: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profiil krüpteeriti ja saadeti IPFS-i; DID-dokument uuendatakse, kui CID saabub
profile-publish-done = profiil avaldatud — DID-dokument uuendati ma.agent CID-iga
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identiteet on juba avaldatud — profiil on ajakohane
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binaarne sisu (ei kuvata)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ühtegi)
profiles-deleted = profiil { $name } kustutatud
profiles-not-found = profiili ei leitud: { $name }

# -- Help topics index
help-header-topics = -- aiheet -- kirjoita .help/<topic> saadaksesi tiedot
help-topic-msg =   .help/msg                    viestit
help-topic-ma = .help/ma                     間-ruum, avaldamine ja sisestamine
help-topic-path = .help/path                   kohalik dot-path grammatika
help-topic-my =   .help/my                     henkilökohtainen config
help-topic-inbox =   .help/inbox                  saapuneet
help-topic-doc =   .help/doc                    dokumentit
help-topic-actor =   .help/actor                  etä-actor
help-topic-zscheme =   .help/zscheme               reasisesed Scheme-avaldised ja dokumentatsioon
help-unknown-topic =   .help/{ $topic }: tuntematon aihe

# -- Help actor section
help-header-actor = -- etätoimijat
help-actor-echo =   @actor                       näytä ratkaistu DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         saata otse-/vestlus-/emotsioonsõnum
help-actor-ping = @actor:ping                  elavuse ping
help-actor-entities =   @actor/entities              listaa entiteetit
help-actor-entities-get = @actor/entities/<n>          hankige olemi sõlm
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     muokkaa entiteettiä
help-actor-entities-del = @actor/entities/<n>:         kustuta üksus
help-actor-config-get =   @actor/config/<key>          hae config-arvo
help-actor-config-set =   @actor/config/<key>: val     aseta config-arvo
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              muokkaa ACL:ää
help-actor-fragment =   @actor#entity                lähetä pluginille
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC pluginille
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  hoia 5 vastuseid seansikeskkonnas
help-actor-wc-l = .z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    zion'i avamine URL-lingi kaudu
help-topic-i18n = .help/i18n                   keele eelistus teie identiteedile
help-header-url = ── URL-parameetrid ──────────────────────────────────────────────────────────────
help-url-intro =   Jaga linki, mis avab zion'i eeltäidetud saajaga:
help-url-msg =   ?msg=<did>                   eeltäidab: @<did>!msg (lihtteade)
help-url-say =   ?say=<did>                   eeltäidab: @<did>!say (tegusõna say)
help-url-emote =   ?emote=<did>                 eeltäidab: @<did>!emote (tegusõna emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             sisenege käitusaja maailma pärast sisselogimist
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Sisend on eeltäidetud, kuid saatmata — vajuta Enter saatmiseks.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                identiteedi avaldamine võrgus
help-header-publish = ── identiteedi avaldamine ───────────────────────────────────────────────────
help-publish-intro = Avaldamine muudab su identiteedi võrgus leitavaks. Teised saavad sinu DID-i otsida, et sinuga ühendust võtta.
help-publish-ma = Avaldamiseks vajad installitud 間-d (kohalik käituskeskkond). See ühendab ego IPFS/IPNS-iga sinu nimel.
help-publish-steps = Sammud: käivita '.ma: claim [port]' kohaliku ma tuvastamiseks, seejärel '.my.identity!publish @ma'.
help-publish-without = Ilma avaldamiseta teised ei saa sulle jõuda — isegi kui nad teavad sinu DID-i, ei suuda nad sinu endpointi lahendada.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = määra profiili nimi: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Partii kogumine — tippige käsud, lõpetage .batch
batch-already-collecting = Juba kogutakse partiid – lõpetage kõigepealt .batch
batch-empty = Partii oli tühi – pole vaja käivitada
batch-running = Ajetaan erää…
batch-step-timeout = partii samm aegus

batch-done = Erä valmis { $secs }s ajassa — { $steps } vaihetta
batch-done-error = Erä päättyi virheisiin { $secs }s ajassa — { $steps } vaihetta
msg-timeout = Viestin aika loppui (ei vastausta 60s aikana)
err-unknown-command = tundmatu käsk: { $path }
err-read-only-path = { $path } on kirjutuskaitstud
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        arvioi luonnosdokumentti rinnakkain


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } toomine ebaõnnestus: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Vigane CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Hoiatus: Teie IPNS privaatvõti saadetakse sellesse käitusruumi identiteedi avaldamiseks. Kasutage ainult käitusruumi, millele täielikult usaldate.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme hindab zioni käskudesse põimitud Scheme-avaldisi ja lisab tulemuse reale enne saatmist.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    reasisesene näide; saadab "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitsioonid püsivad praeguse sisselogimisseansi ajal
help-zscheme-doc = Dokumentatsioon: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Kohalik IPFS-lüüs (vajab brauseri erandit)

tab-config = Seaded
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
