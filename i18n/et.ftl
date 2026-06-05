# zion — Eesti
lang-name = Eesti

# ── Sisselogimise leht ────────────────────────────────────────────────────
tab-login = logi sisse
tab-new-identity = uus identiteet
tab-import = impordi
label-passphrase = paroolilause
label-username = kasutajanimi
label-confirm-passphrase = kinnita paroolilause
btn-login = logi sisse
btn-export = ekspordi
btn-generate = genereeri
btn-new-endpoint = uus lõpp-punkt
passphrase-warning = Kaotatud paroolilause = kaotatud identiteet. Taastamine pole võimalik.
import-help = Vali eksporditud .zion.json-fail. Pakett jääb krüpteerituks.
status-unlocking = avatakse lukk...
status-generating = genereeritakse identiteeti...
status-reading-file = loetakse faili...
status-imported = imporditi '{ $name }' — lülitu Sisselogimise vahekaardile
error-wrong-passphrase = vale paroolilause: { $e }
error-identity-not-found = identiteeti '{ $name }' ei leitud
error-username-required = kasutajanimi on kohustuslik
error-passphrase-required = paroolilause on kohustuslik
error-passphrases-no-match = paroolilaused ei ühti

# ── Terminali süsteemiteated ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — sisse logitud kasutajana { $username }
msg-type-help = Käskude loendi saamiseks kirjuta .help.
msg-connecting = ühendatakse iroh-iga...
msg-iroh-ready = iroh lõpp-punkt valmis
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID avaldatud kohaliku ma kaudu ({ $url })
msg-identity-not-published = Identiteeti ei leitud veebist — kui ma on kohalikult installitud, käivita '.my.ma:discover' ja seejärel '.my.identity:publish @ma'. Kirjuta '.help.publish' üksikasjade jaoks.
msg-blocked = ⊗ blokeeritud [{ $cap }]: { $from }
msg-focus-cleared = fookus tühjendatud
msg-focusing = fokuseeritakse { $did } kui { $prompt }
msg-set = { $path }: { $value }
msg-deleted = kustutati { $path } ({ $count } kirjet)
msg-read-only = { $path } on kirjutuskaitstud
msg-subtree-set = { $path } on alampuu; seadmine keelatud
msg-ancestor-leaf = { $path } eellane on leht; varjutamine keelatud
msg-key-not-found = võtit ei leitud: { $path }
msg-no-match = vastet ei leitud
msg-link-not-connected = lingi toomise viga: pole ühendust
msg-link-fetch-error = lingi toomise viga: { $e }
msg-link-key-not-found = võtit `{ $key }` ei leitud lingitud dokumendist

# ── Aliase valideerimine ──────────────────────────────────────────────────
err-alias-name-empty = aliase nimi ei saa olla tühi
err-alias-has-dot = aliase nimi ei saa sisaldada '.'
err-alias-has-fragment = aliase nimi ei saa sisaldada '#'
err-alias-value-fragment = aliase väärtus peab olema puhas did:ma:<ipns> (ilma fragmendita)
err-alias-value-path = aliase väärtus peab olema puhas did:ma:<ipns> (ilma teeta)
err-alias-not-did = aliase väärtus peab algama did:ma:-ga
err-unknown-alias = tundmatu alias: @{ $name }
err-bare-did = oodati puhast did:ma:<ipns>-i (ilma fragmendi või teeta), saadi { $did }

# ── Redaktor ──────────────────────────────────────────────────────────────
btn-save = Salvesta
btn-eval = Käivita
btn-cancel = Tühista
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
discover-success = ma avastati aadressil { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma loodud — käivita '.my.identity:publish @ma' oma identiteedi avaldamiseks.
claim-success = Käitusaeg nõutud kasutajale { $did }
claim-conflict = Käitusaeg on juba teise identiteedi poolt nõutud
claim-http-failed = nõudmine ebaõnnestus: HTTP { $status }
claim-error = nõudmine ebaõnnestus: { $e }
claim-no-session = pole sisse logitud; logi kõigepealt sisse, et käitusaeg nõuda
runtime-no-verb = { $path } jaoks pole verbi `{ $verb }`

# ── Verbid — juurdepääsukontroll ──────────────────────────────────────────
acl-reset = .my.acl lähtestatud (täielikult avatud)
acl-persist-error = salvestusviga: { $e }
acl-no-verb = .my.acl jaoks pole verbi `{ $verb }`

# ── Verbid — identiteet ───────────────────────────────────────────────────
publish-usage = kasutus: .my.identity:publish <did-või-alias>
identity-exported = Pakett alla laaditud nimega { $filename }
identity-export-failed = Eksport ebaõnnestus: { $e }

# ── Verbid — dokumendid ───────────────────────────────────────────────────
doc-content-empty = { $path }.content on tühi
doc-save-first = { $path }.content on tühi — salvesta esmalt
doc-missing-name = dokumendi nimi puudub
doc-publish-usage = kasutus: .my.doc.<nimi>:publish <avaldaja>
doc-publish-ipld-usage = kasutus: .my.doc.<nimi>:publish-ipld <avaldaja>
doc-publish-failed = avaldamine { $path }: { $e }
doc-publish-ipld-failed = ipld-avaldamine { $path }: { $e }
doc-store-sent = salvestustaotlus saadetud ({ $id }) → { $publisher }; CID saabub RPC-vastuse kaudu
doc-ipld-store-sent = IPLD-salvestustaotlus saadetud ({ $id }) → { $publisher }; CID saabub RPC-vastuse kaudu
doc-fetch-done = toodi { $cid } → { $path }.content (pole käivitatud)
doc-fetch-failed = toomine { $cid }: { $e }
doc-fetch-usage = kasutus: .my.doc.<nimi>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid pole seatud
doc-no-verb = { $path } jaoks pole verbi `{ $verb }`
path-no-verb = { $path } jaoks pole verbi `{ $verb }`

# ── Abiinfo — pealkirjad ──────────────────────────────────────────────────
help-header-zion = ── zion-käsud ────────────────────────────────────────────────────────────
help-header-messaging = ── sõnumid ───────────────────────────────────────────────────────────────
help-header-focus = ── fookusrežiim ──────────────────────────────────────────────────────────
help-header-config = ── kohalik konfiguratsioonisüntaks ─────────────────────────────────────
help-header-common = ── tavalised teed ────────────────────────────────────────────────────────
help-header-inbox = ── postkast ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumendid ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        see tekst
help-cmd-clear =   .clear                       tühjenda terminal
help-cmd-panic =   .panic                       viimane abinõu — kasuta, kui oled hätta sattunud
help-cmd-history =   .history                     käsuajalugu (järjestikused kordused ühendatud)
help-cmd-logout =   .logout                      logi välja

help-msg-echo =   @alias                       kuva lahendatud DID (ühtegi sõnumit pole saadetud)
help-msg-send =   @alias[:verb] body           saada sõnum / RPC osalejale
help-msg-fragment =   @alias#fragment[:verb] body  saada aliasele selge DID-fragmendiga
help-msg-escape =   \@name                       sõnasõnaline @name (aliast ei otsita)

help-focus-set =   .use @alias [as @name]       fokusseeri osalejale (muudab viipa)
help-focus-clear =   .use                         tühjenda fookus

help-config-get =   .path                        too lehe väärtus või loetle alampuu
help-config-filter =   .path value                  otsingufiltri (filtreeri väärtuse järgi)
help-config-set =   .path: value                 sea leht
help-config-delete =   .path:                       kustuta leht või alampuu
help-config-verb =   .path:verb [args]            käivita kohalik verb

help-my =   .my                          kuva kogu isiklik konfiguratsioon
help-aliases =   .my.aliases                  loetle aliased
help-aliases-set =   .my.aliases.<name>: <did>    lisa/uuenda alias (puhas DID, ilma #fragmendita)
help-aliases-del =   .my.aliases.<name>:          eemalda alias
help-runtime-discover =   .my.ma:discover          avasta kohalik käitusaeg ja loo @ma-alias
help-runtime-claim =   .my.ma:claim             nõua käitusaeg oma DID-iga
help-identity =   .my.identity                 kuva identiteedi konfiguratsioon
help-identity-did =   .my.identity.did             kuva oma DID (kirjutuskaitstud)
help-identity-publish =   .my.identity:publish @pub    avalda oma DID avaldajateenuse kaudu
help-identity-export =   .my.identity:export          laadi alla oma identiteedipakett
help-config-path =   .config                      kuva kõik .config.*-kirjed

help-inbox =   .my.inbox                    loetle postkast (alampuuvaade)
help-inbox-n =   .my.inbox.N                  kuva kirje N väljad
help-inbox-from =   .my.inbox.N.from             saatja DID kirjele N
help-inbox-reply =   .my.inbox.N:reply [body]     saada vastus (avab redaktori ilma kehata)
help-inbox-open =   .my.inbox.N:open             ava sisu kirjutuskaitstud redaktoris
help-inbox-del =   .my.inbox.N:                 kustuta kirje N
help-inbox-delall =   .my.inbox:                   kustuta kõik postkasti kirjed
help-inbox-flush =   .my.inbox:flush              prindi kõik kirjed terminali
help-inbox-filter =   .my.inbox:filter @who        näita ainult @who kirjeid
help-inbox-traverse =   .my.inbox.N.sender.<väli>   läbi saatja DID-dokument viivitusega

help-doc-edit =   .my.doc.<nimi>:edit           ava redaktor salvestatud sisuga
help-doc-edit-cid =   .my.doc.<nimi>:edit <cid>     too CID, ava ülevaatamiseks
help-doc-eval =   .my.doc.<nimi>:eval           käivita salvestatud sisu rida-realt
help-doc-publish =   .my.doc.<nimi>:publish @pub   salvesta toorana blob (kõik tüübid)
help-doc-publish-ipld =   .my.doc.<nimi>:publish-ipld @pub  salvesta YAML struktureeritud DAG-CBOR IPLD-sõlmena
help-doc-fetch =   .my.doc.<nimi>:fetch <cid>    impordi CID-sisu (ei käivitata)
help-doc-cid =   .my.doc.<nimi>:cid            kuva salvestatud CID
help-doc-del =   .my.doc.<nimi>:              kustuta dokument

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
yaml-serialize-error = YAML-serialiseerimise viga: { $e }
edit-reply-invalid = Vigane redigeerimise vastus
doc-publish-ipld-error = IPLD avaldamine ebaõnnestus: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Postkasti puhastamise salvestamise viga: { $e }
err-config-load = Konfiguratsiooni laadimise viga: { $e }
err-lang-persist = Keele salvestamise viga: { $e }
err-history-parse = Ajaloo parsimise viga: { $e }
err-history-load = Ajaloo laadimise viga: { $e }
err-ipfs-reply-decode = IPFS vastuse dekodeerimine ebaõnnestus: { $e }
err-edit-cbor = CBOR redigeerimise viga: { $e }
err-popup-blocked = Brauser blokeeris hüpikakna
status-publishing = avaldamine

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = viga
rpc-error-detail = viga: { $detail }
msg-new-message = ← [{ $from }] uus sõnum — { $count } postkastis
msg-chat = { $sender } ütleb { $body }
err-edit-decode-failed = redigeerimine: dekodeerimistõrge: { $e }
err-edit-fetch-failed = redigeerimine: laadimistõrge: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = aktiivne seanss puudub — profiili ei saa kustutada
profile-delete-error = profiili kustutamine ebaõnnestus: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys merged from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ühtegi)
profiles-deleted = profiil { $name } kustutatud
profiles-not-found = profiili ei leitud: { $name }

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

help-topic-url =   .help.url                    zion'i avamine URL-lingi kaudu
help-header-url = ── URL-parameetrid ──────────────────────────────────────────────────────────────
help-url-intro =   Jaga linki, mis avab zion'i eeltäidetud saajaga:
help-url-msg =   ?msg=<did>                   eeltäidab: @<did> (lihtteade)
help-url-say =   ?say=<did>                   eeltäidab: @<did>:say (tegusõna say)
help-url-emote =   ?emote=<did>                 eeltäidab: @<did>:emote (tegusõna emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Sisend on eeltäidetud, kuid saatmata — vajuta Enter saatmiseks.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                identiteedi avaldamine võrgus
help-header-publish = ── identiteedi avaldamine ───────────────────────────────────────────────────
help-publish-intro = Avaldamine muudab su identiteedi võrgus leitavaks. Teised saavad sinu DID-i otsida, et sinuga ühendust võtta.
help-publish-ma = Avaldamiseks vajad installitud ma-d (kohalik käituskeskkond). See ühendab ego IPFS/IPNS-iga sinu nimel.
help-publish-steps = Sammud: käivita '.my.ma:discover' kohaliku ma tuvastamiseks, seejärel '.my.identity:publish @ma'.
help-publish-without = Ilma avaldamiseta teised ei saa sulle jõuda — isegi kui nad teavad sinu DID-i, ei suuda nad sinu endpointi lahendada.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
