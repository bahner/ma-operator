# zion — Lietuvių
lang-name = Lietuvių

# ── Prisijungimo puslapis ─────────────────────────────────────────────────
tab-login = prisijungti
tab-new-identity = nauja tapatybė
tab-import = importuoti
label-passphrase = slaptažodžio frazė
label-username = vartotojo vardas
label-confirm-passphrase = patvirtinti slaptažodžio frazę
btn-login = prisijungti
btn-export = eksportuoti
btn-generate = generuoti
passphrase-warning = Prarasta slaptažodžio frazė = prarasta tapatybė. Atkūrimas neįmanomas.
import-help = Pasirinkite eksportuotą .zion.json failą. Paketas lieka užšifruotas.
status-unlocking = atrakinamas...
status-generating = generuojama tapatybė...
status-reading-file = skaitomas failas...
status-imported = importuota '{ $name }' — perjunkite į Prisijungimo skirtuką
error-wrong-passphrase = neteisinga slaptažodžio frazė: { $e }
error-identity-not-found = tapatybė '{ $name }' nerasta
error-username-required = vartotojo vardas yra privalomas
error-passphrase-required = slaptažodžio frazė yra privaloma
error-passphrases-no-match = slaptažodžio frazės nesutampa

# ── Terminalo sistemos pranešimai ─────────────────────────────────────────
msg-logged-in = zion v{ $version } — prisijungta kaip { $username }
msg-type-help = Įveskite .help, kad gautumėte komandų sąrašą.
msg-connecting = jungiamasi prie iroh...
msg-iroh-ready = iroh galinys paruoštas
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = atsakymas išsiųstas
msg-reply-failed = atsakymo siuntimas nepavyko: { $e }
msg-entity-publish-sent = esybė { $name }: publikavimas išsiųstas
msg-entity-publish-failed = esybės publikavimas nepavyko: { $e }
msg-field-publish-sent = esybė { $name }.{ $field }: publikavimas išsiųstas
msg-field-publish-failed = lauko publikavimas nepavyko: { $e }
msg-acl-publish-sent = vykdymo laiko ACL: publikavimas išsiųstas
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

# ── Veiksmažodžiai — vykdymo laikas ──────────────────────────────────────
discover-fetch-failed = aptikimas nepavyko { $url }: { $e }
discover-json-error = aptikimas nepavyko: neteisingas JSON iš { $url }: { $e }
discover-missing-did = aptikimas nepavyko: status.json trūksta privalomo lauko `did`
discover-invalid-did = aptikimas nepavyko: tikėtasi, kad `did` prasideda did:ma:, gauta `{ $did }`
discover-no-endpoint = aptikimo įspėjimas: `endpoint_id` trūksta status.json; išsaugota tik DID
discover-success = ma aptikta { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   pseudonimas @間 sukurtas — publikuokite su: .my.identity:publish @間
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
publish-usage = naudojimas: .my.identity:publish <did-arba-pseudonimas>

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
help-cmd-logout =   .logout                      atsijungti

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
help-config-verb =   .path:verb [args]            vykdyti vietinį veiksmažodį

help-my =   .my                          rodyti visą asmeninę konfigūraciją
help-aliases =   .my.aliases                  išvardyti pseudonimus
help-aliases-set =   .my.aliases.<name>: <did>    pridėti/atnaujinti pseudonimą (grynas DID, be #fragmento)
help-aliases-del =   .my.aliases.<name>:          pašalinti pseudonimą
help-runtime-discover =   .my.runtime:discover          aptikti vietinį vykdymo laiką ir sukurti @間 pseudonimą
help-runtime-claim =   .my.runtime:claim             pareikšti vykdymo laiką savo DID
help-identity =   .my.identity                 rodyti tapatybės konfigūraciją
help-identity-did =   .my.identity.did             rodyti savo DID (tik skaitomas)
help-identity-publish =   .my.identity:publish @pub    publikuoti savo DID per leidėjo paslaugą
help-config-path =   .config                      rodyti visus .config.* įrašus

help-inbox =   .my.inbox                    išvardyti pašto dėžutę (pomedinė peržiūra)
help-inbox-n =   .my.inbox.N                  rodyti įrašo N laukus
help-inbox-from =   .my.inbox.N.from             siuntėjo DID įrašui N
help-inbox-reply =   .my.inbox.N:reply [body]     siųsti atsakymą (atidaro redaktorių be turinio)
help-inbox-open =   .my.inbox.N:open             atidaryti turinį tik skaitomame redaktoriuje
help-inbox-del =   .my.inbox.N:                 ištrinti įrašą N
help-inbox-delall =   .my.inbox:                   ištrinti visus pašto dėžutės įrašus
help-inbox-flush =   .my.inbox:flush              spausdinti visus įrašus terminale
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
