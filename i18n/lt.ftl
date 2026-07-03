# zion — Lietuvių
lang-name = Lietuvių

# ── Prisijungimo puslapis ─────────────────────────────────────────────────
tab-login = prisijungti
tab-new-identity = nauja tapatybė
tab-import-profile = importuoti profilį
label-passphrase = slaptažodžio frazė
label-username = vartotojo vardas
label-confirm-passphrase = patvirtinti slaptažodžio frazę
label-did = DID
label-profile-cid = profilio CID
label-or-file = arba failas
btn-login = prisijungti
btn-export = eksportuoti
btn-generate = generuoti
btn-new-endpoint = naujas galas
btn-import-profile = importuoti profilį
passphrase-warning = Prarasta slaptažodžio frazė = prarasta tapatybė. Atkūrimas neįmanomas.
import-profile-help = Importuokite profilį naudodami CID arba failą. Reikalinga ta pati prieigos frazė, naudota skelbiant.
import-profile-detected-user = Profilis priklauso: { $name }
status-unlocking = atrakinamas...
status-generating = generuojama tapatybė...
status-reading-file = skaitomas failas...
status-fetching-profile = profilis gaunamas iš IPFS...
status-imported = importuota '{ $name }' — perjunkite į Prisijungimo skirtuką
status-importing-profile = importuojamas profilis...
profile-import-done = profilis importuotas '{ $name }' — { $n } raktų įkelta
error-wrong-passphrase = neteisinga slaptažodžio frazė: { $e }
error-identity-not-found = tapatybė '{ $name }' nerasta
error-username-required = vartotojo vardas yra privalomas
error-passphrase-required = slaptažodžio frazė yra privaloma
error-passphrases-no-match = slaptažodžio frazės nesutampa
error-profile-source-required = pateikite CID arba įkelkite failą
error-did-required = įveskite savo DID
error-profile-fetch = nepavyko gauti profilio: { $e }
error-profile-no-username = profilis neturi vartotojo vardo
error-profile-no-identity = tapatybė '{ $name }' nerasta — pirmiausia importuokite tapatybę

# ── Terminalo sistemos pranešimai ─────────────────────────────────────────
msg-logged-in = zion v{ $version } — prisijungta kaip { $username }
msg-type-help = Įveskite .help, kad gautumėte komandų sąrašą.
msg-connecting = jungiamasi prie iroh...
msg-iroh-ready = iroh galinys paruoštas
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID paskelbtas per vietinį ma ({ $url })
msg-identity-not-published = Tapatybė nerasta internete — jei ma įdiegtas vietoje, paleisk '.ma [port]' ir tada '.my.identity!publish @ma'. Parašyk '.help.publish' dėl detalių.
msg-blocked = ⊗ užblokuota [{ $cap }]: { $from }
msg-focus-cleared = fokusas išvalytas
msg-focusing = fokusuojama { $did } kaip { $prompt }
msg-set = { $path }: { $value }
msg-deleted = ištrinta { $path } ({ $count } įrašai)
msg-read-only = { $path } yra tik skaitomas
msg-subtree-set = { $path } yra pomedis; nustatymas atsisakytas
msg-ancestor-leaf = { $path } protėvis yra lapas; šešėliavimas atsisakytas
msg-key-not-found = raktas nerastas: { $path }
msg-no-match = atitikmenų nerasta
msg-link-not-connected = nuorodos gavimo klaida: neprisijungta
msg-link-fetch-error = nuorodos gavimo klaida: { $e }
msg-link-key-not-found = raktas `{ $key }` nerastas susietame dokumente

# ── Pseudonimų tikrinimas ─────────────────────────────────────────────────
err-alias-name-empty = pseudonimo pavadinimas negali būti tuščias
err-alias-has-dot = pseudonimo pavadinimas negali turėti '.'
err-alias-has-fragment = pseudonimo pavadinimas negali turėti '#'
err-alias-value-fragment = pseudonimo reikšmė turi būti grynas did:ma:<ipns> (be fragmento)
err-alias-value-path = pseudonimo reikšmė turi būti grynas did:ma:<ipns> (be kelio)
err-alias-not-did = pseudonimo reikšmė turi prasidėti did:ma:
err-unknown-alias = nežinomas pseudonimas: @{ $name }
err-bare-did = tikėtasi gryno did:ma:<ipns> (be fragmento ar kelio), gauta { $did }

# ── Redaktorius ───────────────────────────────────────────────────────────
btn-save = Išsaugoti
btn-eval = Vykdyti
btn-cancel = Atšaukti
btn-close = Uždaryti
btn-reply = Atsakyti
btn-publish = Publikuoti
btn-publish-ipld = Publikuoti IPLD
msg-reply-sent = atsakymas išsiųstas
msg-reply-failed = atsakymo siuntimas nepavyko: { $e }
msg-entity-publish-sent = esybė { $name }: publikavimas išsiųstas
msg-entity-publish-failed = esybės publikavimas nepavyko: { $e }
msg-kind-publish-failed = tipo publikavimas nepavyko: { $e }
msg-field-publish-sent = esybė { $name }.{ $field }: publikavimas išsiųstas
msg-field-publish-failed = lauko publikavimas nepavyko: { $e }
msg-acl-publish-sent = vykdymo laiko ACL: publikavimas išsiųstas
msg-crud-edit-publish-sent = { $path }: publikavimas išsiųstas
msg-acl-publish-failed = vykdymo laiko ACL publikavimas nepavyko: { $e }
msg-yaml-error = YAML klaida: { $e }
msg-editor-saved = { $path }:išsaugoti
msg-fetch-review = gauta { $cid } — peržiūrėkite prieš vykdymą
msg-fetch-failed = gavimas { $cid }: { $e }

# ── Veiksmažodžiai — pašto dėžutė ────────────────────────────────────────
inbox-empty = pašto dėžutė tuščia
inbox-entry-not-found = pašto dėžutės įrašas { $n } nerastas
inbox-no-message-id = pašto dėžutės įrašas { $n } neturi message_id
inbox-no-verb = pašto dėžutės įrašui { $n } nėra veiksmažodžio `{ $verb }`
inbox-filter-no-arg = filtras reikalauja DID arba slapyvardžio argumento
inbox-filter-empty = nėra žinučių iš { $did }

# ── Veiksmažodžiai — vykdymo laikas ──────────────────────────────────────
discover-fetch-failed = aptikimas nepavyko { $url }: { $e }
discover-json-error = aptikimas nepavyko: neteisingas JSON iš { $url }: { $e }
discover-missing-did = aptikimas nepavyko: status.json trūksta privalomo lauko `did`
discover-invalid-did = aptikimas nepavyko: tikėtasi, kad `did` prasideda did:ma:, gauta `{ $did }`
discover-no-endpoint = aptikimo įspėjimas: `endpoint_id` trūksta status.json; išsaugota tik DID
discover-success = ma aptikta { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   slapyvardis @ma sukurtas — paleisk '.my.identity!publish @ma' savo tapatybei paskelbti.
claim-success = Vykdymo laikas pareikštas { $did }
claim-conflict = Vykdymo laikas jau pareikštas kitos tapatybės
claim-http-failed = pareikšimas nepavyko: HTTP { $status }
claim-error = pareikšimas nepavyko: { $e }
claim-no-session = neprisijungta; pirmiausia prisijunkite, kad pareikštumėte vykdymo laiką
runtime-no-verb = { $path } nėra veiksmažodžio `{ $verb }`

# ── Veiksmažodžiai — prieigos valdymas ───────────────────────────────────
acl-reset = .my.acl atstatytas (visiškai atviras)
acl-persist-error = išsaugojimo klaida: { $e }
acl-no-verb = .my.acl nėra veiksmažodžio `{ $verb }`

# ── Veiksmažodžiai — tapatybė ────────────────────────────────────────────
publish-usage = naudojimas: .my.identity!publish <did-arba-pseudonimas>
identity-exported = Paketas atsisiųstas kaip { $filename }
identity-export-failed = Eksportas nepavyko: { $e }

# ── Veiksmažodžiai — dokumentai ───────────────────────────────────────────
doc-content-empty = { $path }.content yra tuščias
doc-save-first = { $path }.content yra tuščias — pirmiausia išsaugokite
doc-missing-name = trūksta dokumento pavadinimo
doc-publish-usage = naudojimas: .my.doc.<pavadinimas>:publish <leidėjas>
doc-publish-ipld-usage = naudojimas: .my.doc.<pavadinimas>:publish-ipld <leidėjas>
doc-publish-failed = publikavimas { $path }: { $e }
doc-publish-ipld-failed = ipld publikavimas { $path }: { $e }
doc-store-sent = saugojimo užklausa išsiųsta ({ $id }) → { $publisher }; CID ateis per RPC atsakymą
doc-ipld-store-sent = IPLD saugojimo užklausa išsiųsta ({ $id }) → { $publisher }; CID ateis per RPC atsakymą
doc-fetch-done = gauta { $cid } → { $path }.content (nevykdyta)
doc-fetch-failed = gavimas { $cid }: { $e }
doc-fetch-usage = naudojimas: .my.doc.<pavadinimas>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nenustatytas
doc-no-verb = { $path } nėra veiksmažodžio `{ $verb }`
path-no-verb = { $path } nėra veiksmažodžio `{ $verb }`

# ── Pagalbos tekstas — antraštės ──────────────────────────────────────────
help-header-zion = ── zion komandos ──────────────────────────────────────────────────────────
help-header-messaging = ── pranešimai ────────────────────────────────────────────────────────────
help-header-focus = ── fokuso režimas ────────────────────────────────────────────────────────
help-header-config = ── vietinė konfigūracijos gramatika ──────────────────────────────────────
help-header-common = ── dažni keliai ──────────────────────────────────────────────────────────
help-header-inbox = ── pašto dėžutė ──────────────────────────────────────────────────────────
help-header-documents = ── dokumentai ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        šis tekstas
help-cmd-clear =   .clear                       išvalyti terminalą
help-cmd-panic =   .panic                       paskutinė priemonė — naudokite, jei esate bėdoje
help-cmd-history =   .history                     komandų istorija (nuoseklūs dublikatai sujungti)
help-cmd-logout =   .logout                      atsijungti
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       rodyti išspręstą DID (joks pranešimas neišsiųstas)
help-msg-send =   @alias[:verb] body           siųsti pranešimą / RPC dalyviui
help-msg-fragment =   @alias#fragment[:verb] body  siųsti pseudonimui su aiškiu DID fragmentu
help-msg-escape =   \@name                       pažodinis @name (be pseudonimo paieškos)

help-focus-set =   .use @alias [as @name]       fokusuotis į dalyvį (keičia raginimą)
help-focus-clear =   .use                         išvalyti fokusą

help-config-get =   .path                        gauti lapo reikšmę arba išvardyti pomedį
help-config-filter =   .path value                  paieškos filtras (filtruoti pagal reikšmę)
help-config-set =   .path: value                 nustatyti lapą
help-config-delete =   .path:                       ištrinti lapą arba pomedį
help-config-verb =   .path!verb [args]            vykdyti vietinį veiksmažodį

help-my =   .my                          rodyti visą asmeninę konfigūraciją
help-aliases =   .my.aliases                  išvardyti pseudonimus
help-aliases-set =   .my.aliases.<name>: <did>    pridėti/atnaujinti pseudonimą (grynas DID, be #fragmento)
help-aliases-del =   .my.aliases.<name>:          pašalinti pseudonimą
help-runtime-discover =   .ma [port]          aptikti vietinį vykdymo laiką ir sukurti @ma pseudonimą
help-runtime-claim =   .ma [port]             pareikšti vykdymo laiką savo DID
help-identity =   .my.identity                 rodyti tapatybės konfigūraciją
help-identity-did =   .my.identity.did             rodyti savo DID (tik skaitomas)
help-identity-publish =   .my.identity!publish @pub    publikuoti savo DID per leidėjo paslaugą
help-identity-export =   .my.identity!export          atsisiųsti savą tapatybės paketą
help-config-path =   .config                      rodyti visus .config.* įrašus

help-inbox =   .my.inbox                    išvardyti pašto dėžutę (pomedinė peržiūra)
help-inbox-n =   .my.inbox.N                  rodyti įrašo N laukus
help-inbox-from =   .my.inbox.N.from             siuntėjo DID įrašui N
help-inbox-reply =   .my.inbox.N!reply [body]     siųsti atsakymą (atidaro redaktorių be turinio)
help-inbox-open =   .my.inbox.N!open             atidaryti turinį tik skaitomame redaktoriuje
help-inbox-del =   .my.inbox.N:                 ištrinti įrašą N
help-inbox-delall =   .my.inbox:                   ištrinti visus pašto dėžutės įrašus
help-inbox-flush =   .my.inbox!flush              spausdinti visus įrašus terminale
help-inbox-filter =   .my.inbox!filter @who        rodyti tik @who įrašus
help-inbox-traverse =   .my.inbox.N.sender.<laukas>  naršyti siuntėjo DID dokumentą su vėlavimu

help-doc-edit =   .my.doc.<pavadinimas>:edit           atidaryti redaktorių su išsaugotu turiniu
help-doc-edit-cid =   .my.doc.<pavadinimas>:edit <cid>     gauti CID, atidaryti peržiūrai
help-doc-eval =   .my.doc.<pavadinimas>:eval           vykdyti išsaugotą turinį eilutė po eilutės
help-doc-publish =   .my.doc.<pavadinimas>:publish @pub   išsaugoti kaip neapdorotą blob (visi tipai)
help-doc-publish-ipld =   .my.doc.<pavadinimas>:publish-ipld @pub  išsaugoti YAML kaip struktūrizuotą DAG-CBOR IPLD mazgą
help-doc-fetch =   .my.doc.<pavadinimas>:fetch <cid>    importuoti CID turinį (be vykdymo)
help-doc-cid =   .my.doc.<pavadinimas>:cid            rodyti išsaugotą CID
help-doc-del =   .my.doc.<pavadinimas>:              ištrinti dokumentą

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Galimos kalbos (nustatyti su .my.i18n: <code>):
err-lang-not-found = kalba nerasta: { $lang }

msg-send-failed = siuntimas nepavyko: { $e }
msg-not-logged-in = neprisijungęs

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML analizės klaida: { $e }
yaml-not-mapping = YAML turi būti mapping (raktas: reikšmių poros); paprastas tekstas ir skaliarai negali būti saugomi kaip DAG-CBOR
dagcbor-encode-error = DAG-CBOR kodavimo klaida: { $e }
cbor-decode-error = CBOR dekodavimo klaida: { $e }
cbor-json-error = CBOR į JSON klaida: { $e }
yaml-serialize-error = YAML serializavimo klaida: { $e }
edit-reply-invalid = Netinkamas redagavimo atsakymas
doc-publish-ipld-error = IPLD paskelbimas nepavyko: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Gaunamų laiškų valymo išsaugojimo klaida: { $e }
err-config-load = Konfigūracijos įkėlimo klaida: { $e }
err-lang-persist = Kalbos išsaugojimo klaida: { $e }
err-history-parse = Istorijos analizės klaida: { $e }
err-history-load = Istorijos įkėlimo klaida: { $e }
err-ipfs-reply-decode = IPFS atsakymo dekodavimo klaida: { $e }
err-edit-cbor = CBOR redagavimo klaida: { $e }
err-popup-blocked = Iššokantysis langas užblokuotas naršyklės
status-publishing = skelbiama

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = klaida
rpc-error-detail = klaida: { $detail }
msg-new-message = ← [{ $from }] naujas pranešimas — { $count } gautuosiuose
msg-chat = { $sender } sako { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } sako { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } įeina į kambarį.
room-leave = * { $name } išeina iš kambario.
room-drop  = * { $name } numeta { $thing }.
room-take  = * { $name } paima { $thing }.
err-edit-decode-failed = redagavimas: dekodaravimo klaida: { $e }
err-edit-fetch-failed = redagavimas: gavimo klaida: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nėra aktyvios sesijos — profilio negalima ištrinti
profile-delete-error = profilio ištrynimas nepavyko: { $e }
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
profiles-empty = (nėra)
profiles-deleted = profilis { $name } ištrintas
profiles-not-found = profilis nerastas: { $name }

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
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities.<n>          get entity
help-actor-entities-set =   @actor.entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities.<n>!edit     edit entity
help-actor-entities-del =   @actor.entities.<n>:         delete entity
help-actor-config-get =   @actor.config.<key>          get config value
help-actor-config-set =   @actor.config.<key>: val     set config value
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

help-topic-url =   .help.url                    zion atidarymas per URL nuorodą
help-header-url = ── URL parametrai ───────────────────────────────────────────────────────────────
help-url-intro =   Pasidalinkite nuoroda, kuri atidaro zion su iš anksto užpildytu gavėju:
help-url-msg =   ?msg=<did>                   iš anksto užpildo: @<did> (paprastas pranešimas)
help-url-say =   ?say=<did>                   iš anksto užpildo: @<did>:say (veiksmažodis say)
help-url-emote =   ?emote=<did>                 iš anksto užpildo: @<did>:emote (veiksmažodis emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Įvestis iš anksto užpildyta, bet nesiųsta — paspausk Enter siųsti.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                tapatybės paskelbimas tinkle
help-header-publish = ── tapatybės paskelbimas ────────────────────────────────────────────────────
help-publish-intro = Paskelbimas padaro tavo tapatybę randamą tinkle. Kiti gali ieškoti tavo DID, kad su tavimi susisiektų.
help-publish-ma = Paskelbimui reikia įdiegto ma (vietinė vykdymo aplinka). Ji sujungia ego su IPFS/IPNS tavo vardu.
help-publish-steps = Žingsniai: paleisk '.ma [port]' vietiniam ma aptikti, tada '.my.identity!publish @ma'.
help-publish-without = Be paskelbimo kiti negali tavęs pasiekti — net žinodami tavo DID, jie negali išspręsti tavo endpoint.
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
scheme-cid-fetch-error = Nepavyko gauti CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Netinkamas CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Įspėjimas: Jūsų IPNS privatus raktas bus išsiųstas į šią vykdymo aplinką tapatybei paskelbti. Naudokite tik vykdymo aplinką, kuriai visiškai pasitikite.
