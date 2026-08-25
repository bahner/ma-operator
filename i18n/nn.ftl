# zion — Nynorsk
lang-name = Nynorsk
label-nick = kallenamn
new-identity-nick-help = Vel eit kallenamn for 間-rom. Det er berre eit kallenamn, og du kan endre det når som helst.
error-nick-required = kallenamn er påkravd
error-nick-invalid = kallenamnet kan ikkje innehalde mellomrom eller @

# ── Innloggingsside ───────────────────────────────────────────────────────
tab-login = logg inn
tab-new-identity = ny identitet
tab-import-profile = importer profil
label-passphrase = passfrase
label-username = brukarnamn
label-confirm-passphrase = stadfest passfrase
label-did = DID
label-profile-cid = profil-CID
label-or-file = eller fil
btn-login = logg inn
btn-export = eksporter
btn-generate = generer
btn-new-endpoint = nytt endepunkt
btn-import-profile = importer profil
btn-show-qr = vis QR
btn-scan-qr = skann QR
qr-scan-hint = Peik kameraet mot ein zion-profil-QR-kode.
qr-error-camera = kamera utilgjengeleg: { $e }
qr-error-too-large = profilen er for stor for ein QR-kode
passphrase-warning = Mist passfrase = mist identitet. Det finst ingen atterhenting.
import-profile-help = Importer ein profil via CID eller fil. Du treng den same passfrasen som vart brukt ved publisering.
import-profile-detected-user = Profil tilhøyrer: { $name }
status-unlocking = låser opp...
status-generating = genererer identitet...
status-reading-file = les fil...
status-fetching-profile = hentar profil frå IPFS...
status-imported = importerte '{ $name }' — byt til fana Logg inn
status-importing-profile = importerer profil...
profile-import-done = profil importert for '{ $name }' — { $n } nøklar lasta
error-wrong-passphrase = feil passfrase: { $e }
error-identity-not-found = identiteten '{ $name }' vart ikkje funnen
error-username-required = brukarnamn er påkravd
error-passphrase-required = passfrase er påkravd
error-passphrases-no-match = passfraser stemmer ikkje overeins
error-profile-source-required = oppgi ein CID eller last opp ein fil
error-did-required = skriv inn ditt DID
error-profile-fetch = klarte ikkje hente profil: { $e }
error-profile-no-username = profilen inneheld ikkje eit brukarnamn
error-profile-no-identity = identiteten '{ $name }' ikkje funnen — importer identiteten fyrst

# ── Terminalsystemmeldingar ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logga inn som { $username }
msg-type-help = Skriv .help for ei liste over kommandoar.
msg-getting-started = Prøv: say Hello world, look, .help eller help.
msg-connecting = koplar til iroh...
msg-iroh-ready = iroh-endepunkt klart
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publisert via lokal 間 ({ $url })
msg-identity-publication-propagating = Identitetspubliseringa forplantar seg framleis; entry er utsett: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Publiserer identitet. Dette kan ta opptil { $seconds } sekund.
msg-ma-connecting-matrix = prøver å kopla deg til 間trix
msg-ma-checking-url = sjekkar lokal 間 på { $url }
msg-local-ma-unreachable = lokal 間 svarar ikkje på { $url } etter { $seconds }s; start 間 eller endra .ma.ctx.url
msg-runtime-pinging = pingar runtime { $did }
msg-runtime-ping-timeout = runtime { $did } svara ikkje innan { $seconds }s; hoppar over automatisk entry
msg-startup-enter-skipped = går ikkje inn i lagra runtime fordi { $target } ikkje svara
msg-local-ma-claimed = lokal 間 gjort krav på
msg-local-ma-already-claimed = lokal 間 er allereie gjort krav på
msg-local-ma-claim-failed = klarte ikkje å gjera krav på lokal 間
msg-identity-not-published = Identitet ikkje funne online — om du har 間 installert lokalt, køyr '.ma: claim [port]' og deretter '.my.identity!publish @ma'. Skriv '.help/publish' for detaljar.
msg-blocked = ⊗ blokkert [{ $cap }]: { $from }
msg-focus-cleared = fokus tømt
msg-left = left
msg-focusing = fokuserer { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = sletta { $path } ({ $count } postar)
msg-read-only = { $path } er skriveverna
msg-subtree-set = { $path } er eit undertre; nektar å angi
msg-ancestor-leaf = ein forfar til { $path } er eit lauv; nektar å skugge
msg-key-not-found = nøkkel ikkje funnen: { $path }
msg-link-not-connected = lenke-hentingsfeil: ikkje kopla
msg-link-fetch-error = lenke-hentingsfeil: { $e }
msg-link-key-not-found = nøkkelen `{ $key }` ikkje funnen i kopla dokument

# ── Alias-validering ──────────────────────────────────────────────────────
err-alias-name-empty = aliasnamn kan ikkje vere tomt
err-alias-has-dot = aliasnamn kan ikkje innehalde '.'
err-alias-has-fragment = aliasnamn kan ikkje innehalde '#'
err-alias-value-fragment = aliasverd kan ha høgst eitt ikkje-tomt DID-URL-fragment
err-alias-value-path = aliasverd må vere ein did:ma:<ipns>-DID eller DID-URL (ingen sti)
err-alias-not-did = aliasverd må starte med did:ma:
err-unknown-alias = ukjend alias: @{ $name }
err-bare-did = forventa bart did:ma:<ipns> (inkje fragment eller sti), fekk { $did }

# ── Redigeringsprogram ────────────────────────────────────────────────────
btn-save = Lagre
btn-eval = Køyr
btn-cancel = Avbryt
msg-jobs-cancelled = jobbar avbrotne
btn-close = Lukk
btn-reply = Svar
btn-publish = Publiser
btn-publish-ipld = Publiser IPLD
msg-reply-sent = svar sendt
msg-reply-failed = svar mislykkast: { $e }
msg-entity-publish-sent = entitet { $name }: publisering sendt
msg-entity-publish-failed = entitetspublisering mislykkast: { $e }
msg-kind-publish-failed = publisering av type mislukkast: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publisering sendt
msg-field-publish-failed = feltpublisering mislykkast: { $e }
msg-acl-publish-sent = runtime ACL: publisering sendt
msg-crud-edit-publish-sent = { $path }: publisering sendt
msg-acl-publish-failed = runtime ACL-publisering mislykkast: { $e }
msg-yaml-error = YAML-feil: { $e }
msg-editor-saved = { $path }:lagre
msg-fetch-review = henta { $cid } — gå gjennom før køyring
msg-fetch-failed = henting { $cid }: { $e }

# ── Verb — innboks ────────────────────────────────────────────────────────
inbox-empty = innboksen er tom
inbox-entry-not-found = innbokspost { $n } ikkje funnen
inbox-no-message-id = innbokspost { $n } manglar message_id
inbox-no-verb = inkje verb `{ $verb }` for innbokspost { $n }
inbox-filter-no-arg = filter krev eit DID- eller alias-argument
inbox-filter-empty = ingen meldingar frå { $did }

# ── Verb — køyretid ───────────────────────────────────────────────────────
discover-fetch-failed = oppdaging mislykkast ved { $url }: { $e }
discover-json-error = oppdaging mislykkast: ugyldig JSON frå { $url }: { $e }
discover-missing-did = oppdaging mislykkast: status.json manglar påkravd felt `did`
discover-invalid-did = oppdaging mislykkast: forventa `did` byrjar med did:ma:, fekk `{ $did }`
discover-no-endpoint = oppdagingsåtvaring: `endpoint_id` manglar i status.json; lagra berre DID
discover-hint-endpoint-not-found = Hint: endepunktet vart ikkje funne. Sjekk at 間 køyrer og eksponerer /status.json på port 5003.
discover-hint-server-error = Hint: køyretida svarte med tenarfeil. Sjekk 間-loggane og prøv igjen.
discover-hint-network = Hint: nettverks-/tilkoplingsproblem. Start 間, sjekk at localhost:5003 kan nåast, og tillat lokal HTTP-tilgang i nettlesaren.
discover-hint-generic = Hint: sjekk at 間 og IPFS Desktop køyrer, og prøv `.ma` igjen.
discover-success = 間 oppdaga ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma oppretta — køyr '.my.identity!publish @ma' for å publisere identiteten din.
claim-success = Køyretid gjort krav på for { $did }
claim-conflict = Køyretid allereie gjort krav på av ein annan identitet
claim-already-owned = Runtime er allereie gjort krav på av denne identiteten
claim-http-failed = krav mislykkast: HTTP { $status }
claim-error = krav mislykkast: { $e }
claim-no-session = ikkje logga inn; logg inn fyrst for å gjere krav på køyretida
runtime-no-verb = inkje verb `{ $verb }` for { $path }

# ── Verb — tilgangskontroll ───────────────────────────────────────────────
acl-reset = .my.acl tilbakestilt (heilt open)
err-persist = lagringsfeil: { $e }
acl-no-verb = inkje verb `{ $verb }` for .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = bruk: .my.identity!publish <did-eller-alias>
identity-exported = Bundle lasta ned som { $filename }
identity-export-failed = Eksport mislukkast: { $e }

# ── Verb — dokument ───────────────────────────────────────────────────────
doc-content-empty = { $path } er tom
doc-save-first = { $path } er tom — lagre fyrst
doc-missing-name = manglande dokumentnamn
doc-publish-usage = bruk: .my.doc.<namn>!publish <utgjevar>
doc-publish-ipld-usage = bruk: .my.doc.<namn>!publish-ipld <utgjevar>
doc-publish-failed = publisering { $path }: { $e }
doc-publish-ipld-failed = ipld-publisering { $path }: { $e }
doc-publish-error-detail = publisering feila [{ $code }]: { $err }
doc-publish-error-hint = Tips: { $hint }
doc-publish-hint-session = logg inn på nytt så ego får tilgang til identitetsnøklane dine
doc-publish-hint-target = bruk ein gyldig utgjevar-DID eller eit alias som peikar til ein rein did:ma:<ipns>
doc-publish-hint-network = sjekk at 間-køyretida og IPFS kan nåast, og prøv igjen
doc-publish-hint-resolve = sjekk at DID-dokumentet til utgjevaren er publisert og inneheld eit tilgjengeleg endepunkt
doc-publish-hint-acl = be utgjevaroperatøren tillate DID-en din i ACL
doc-publish-hint-runtime = køyretida/pluginen avviste førespurnaden; les årsaka og prøv igjen etter å ha retta entitet/køyretid
doc-publish-hint-ipfs = sjekk lokal Kubo/IPFS-helse og status for utgjevarkøyretida
doc-publish-hint-unknown = sjå i køyretidsloggane etter detaljert årsak og prøv igjen
doc-store-sent = lagringsførespurnad sendt ({ $id }) → { $publisher }; CID kjem via RPC-svar
doc-ipld-store-sent = IPLD-lagringsførespurnad sendt ({ $id }) → { $publisher }; CID kjem via RPC-svar
doc-fetch-done = henta { $cid } → { $path } (ikkje køyrd)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = bruk: .my.doc.<namn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikkje sett
doc-no-verb = inkje verb `{ $verb }` for { $path }
path-no-verb = inkje verb `{ $verb }` for { $path }

# ── Hjelptekst — overskrifter ─────────────────────────────────────────────
help-header-zion = ── zion-kommandoar ────────────────────────────────────────────────────────
help-header-messaging = ── meldingar ────────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurasjonsgrammatikk ───────────────────────────────────────
help-header-common = ── vanlege stiar ─────────────────────────────────────────────────────────
help-header-inbox = ── innboks ───────────────────────────────────────────────────────────────
help-header-documents = ── dokument ─────────────────────────────────────────────────────────────
help-header-i18n = ── språk ─────────────────────────────────────────────────────────────
help-header-ma = ── 間-rom ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── inn i 間-rommet ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjelptekst — zion-kommandoar ──────────────────────────────────────────
help-cmd-help =   .help                        denne teksten
help-cmd-clear =   .clear                       tøm terminalen
help-cmd-panic =   .panic                       siste utveg — bruk om du er i trøbbel
help-cmd-history =   .history [n]                 kommandohistorikk (etterfylgjande duplikatar vert samanslåtte); valfri n viser berre dei siste n linjene
help-cmd-logout =   .logout                      logg ut
help-cmd-batch =   .batch                       evaluer kladdedokument parallelt
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         evaluer kladdedokument line for line

# ── Hjelptekst — meldingar ────────────────────────────────────────────────
help-msg-echo =   @alias                       vis løyst DID/DID-URL (inkje melding sendt)
help-msg-send =   @alias!msg body / @alias:verb args           send melding / RPC til aktør
help-msg-fragment =   @alias#fragment:verb body  send til alias med eksplisitt DID-fragment
help-msg-escape =   \@name                       bokstaveleg @name (ingen alias-søk)

# ── Hjelptekst — fokusmodus ───────────────────────────────────────────────

# ── Hjelptekst — konfigurasjonsgrammatikk ────────────────────────────────
help-config-get =   .path                        hent lauv-verdi eller list undertre
help-config-filter =   .path [namn]               vis undernøklar som inneheld namn
help-config-full =   .path. [namn]                vis heile undertreet med verdiar som inneheld namn
help-config-set =   .path: value                 set lauv
help-config-delete =   .path:                       slett lauv eller undertre
help-config-verb =   .path!verb [args]            køyr lokalt verb

# ── Hjelptekst — vanlege stiar ───────────────────────────────────────────
help-my =   .my                          vis all personleg konfigurasjon
help-aliases =   .my.aliases                  list alias
help-aliases-set =   .my.aliases.<name>: <did-url>    legg til/oppdater alias (DID eller DID-URL)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .ma: claim [port]          oppdag lokal køyretid og opprett @ma-alias
help-runtime-claim =   .ma: claim [port]             gjer krav på køyretid med din DID
help-identity =   .my.identity                 vis identitetskonfigurasjon
help-identity-did =   .my.identity.did             vis eige DID (skriveverna)
help-identity-publish =   .my.identity!publish @pub    publiser eige DID via utgjevar-teneste
help-identity-export =   .my.identity!export          last ned eigen identitetspakke
help-config-path =   .config                      vis alle .config.*-postar

# ── Hjelptekst — innboks ──────────────────────────────────────────────────
help-inbox =   .my.inbox                    list innboks (undertre-visning)
help-inbox-n =   .my.inbox.N                  vis post N sine felt
help-inbox-from =   .my.inbox.N.from             avsendar-DID for post N
help-inbox-reply =   .my.inbox.N!reply [body]     send svar (opnar redigeringsprogram utan body)
help-inbox-open =   .my.inbox.N!open             opna innhald i skriveverna redigeringsprogram
help-inbox-del =   .my.inbox.N:                 slett post N
help-inbox-delall =   .my.inbox:                   slett alle innbokspostar
help-inbox-flush =   .my.inbox!flush              skriv alle postar til terminalen
help-inbox-filter =   .my.inbox!filter @who        vis berre oppføringar frå @who
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traverser avsendar sitt DID-dokument latent

# ── Hjelptekst — dokument ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<namn>!edit           opna redigeringsprogram med lagra innhald
help-doc-edit-cid =   .my.doc.<namn>!edit /ipfs/<cid>     hent CID, opna for gjennomgang
help-doc-eval =   .my.doc.<namn>!eval           køyr lagra innhald linje for linje
help-doc-publish =   .my.doc.<namn>!publish @pub   lagre som rå blob (alle typar)
help-doc-publish-ipld =   .my.doc.<namn>!publish-ipld @pub  lagre YAML som strukturert DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<namn>!fetch /ipfs/<cid>    importer CID-innhald (ingen køyring)
help-doc-cid =   .my.doc.<namn>!cid            vis lagra CID
help-doc-del =   .my.doc.<namn>:              slett dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n lagrar språkvalet knytt til identiteten din.
help-i18n-set =   .my.i18n: <code>             vel språket zion brukar for denne identiteten
help-i18n-list =   .my.i18n!list               vis tilgjengelege språkkodar

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-rommet er rommet mellom 間-identitetar. ma sørgjer for at identitetane kan finne kvarandre og kommunisere; når identiteten din er publisert, kan du delta.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   kopla til lokal 間-runtime, les /status.json, og lagra .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publiser DID-dokumentet ditt så andre kan finna nøklane og endpointet ditt
help-ma-security = Den tydelegaste tillitsgrensa er din eigen 間-runtime med din eigen IPFS Desktop/Kubo. Ein fjern publisher kan vera nyttig, men då brukar du tenesta til nokon andre.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             korleis du går inn i 間-rommet

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Når identiteten din er kjend, kan .enter @ma la deg tre inn i 間. Finn deg ei verd, gå inn i henne, og delta derfrå.
help-ma-entry-steps = Start IPFS Desktop og ma, og køyr deretter .ma. Publiser med .my.identity!publish @ma, finn ei verd, og gå inn med .enter @ma.
help-ma-entry-command =   .enter @ma                  tre inn i 間 gjennom @ma-runtime
help-ma-entry-toggle =   .enter                       slå romfokus av eller på; identiteten din er framleis aktiv
help-ma-entry-url =   ?enter=<runtime>             gå inn etter innlogging frå ein delt URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tilgjengelege språk (set med .my.i18n: <code>):
err-lang-not-found = språk ikkje funne: { $lang }

msg-send-failed = sending feila: { $e }
msg-not-logged-in = ikkje innlogga

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-parsefeil: { $e }
yaml-not-mapping = YAML må vere eit mapping (nøkkel: verdi-par); klårtekst og skalarar kan ikkje lagrast som DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kodeingsfeil: { $e }
cbor-decode-error = CBOR-avkodeingsfeil: { $e }
cbor-json-error = CBOR til JSON-feil: { $e }
yaml-serialise-error = YAML-serialiseringsfeil: { $e }
edit-reply-invalid = Ugyldig redigeringssvar
doc-publish-ipld-error = IPLD-publisering mislykkast: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Innboks-rydding lagringsfeil: { $e }
err-config-load = Konfigurasjonslastingsfeil: { $e }
err-lang-persist = Språklagringsfeil: { $e }
err-history-parse = Historieparsefeil: { $e }
err-history-load = Historielastingsfeil: { $e }
err-history-count-invalid = historikktalet må vere eit positivt heiltal
err-ipfs-reply-decode = IPFS-svar avkodeingsfeil: { $e }
err-edit-cbor = CBOR-redigeringsfeil: { $e }
err-popup-blocked = Nettlesar blokkerte sprettoppvindauget
status-publishing = publiserer

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = feil
rpc-error-detail = feil: { $detail }
msg-new-message = ← [{ $from }] ny melding — { $count } i innboksen
msg-chat = { $sender } seier { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } seier { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kjem inn.
room-leave = * { $name } går ut.
room-drop  = * { $name } slepper { $thing }.
room-take  = * { $name } plukkar opp { $thing }.
err-edit-decode-failed = redigering: dekodingsfeil: { $e }
err-edit-fetch-failed = redigering: hentingsfeil: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv økt — profilen kan ikkje slettast
profile-delete-error = sletting av profil mislukkast: { $e }
profile-wrong-user = kan ikkje setje CID for ein annan profil — berre din eigen
profile-wrong-user-name = kan ikkje setje CID for '{ $name }' — berre din eigen profil
profile-no-ma = ingen 間-køyretid konfigurert — køyr '.ma: claim [port]' fyrst
profile-no-cid = ingen CID lagra for denne profilen — køyr '!publish' fyrst
profile-no-cid-in-doc = ingen profil-CID funnen i DID-dokument — køyr '!publish' fyrst
profile-publish-failed = profilpublisering mislukkast: { $e }
profile-fetch-done = profil henta — { $n } nøklar henta frå IPFS
profile-fetch-failed = profil-henting mislukkast: { $e }
msg-identity-exists = identitet alt publisert — profil-CID lasta frå lokal lagring
profile-import-exists = profilen '{ $name }' finst allereie — slett han først
profile-import-wrong-user = fila inneheld profilen '{ $found }', venta '{ $expected }'

# -- CID content operations
cid-op-binary = binært innhald (blir ikkje vist)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = klarte ikkje å hente innhald: { $e }
cid-op-unknown = ukjend innhaldsoperasjon: { $op }
cid-op-wc = { $lines } linjer  { $words } ord  { $chars } teikn
profiles-empty = (ingen)
profiles-deleted = profil { $name } sletta
profiles-not-found = fann ikkje profil: { $name }

# -- Help topics index
help-header-topics = -- emne -- skriv .help/<topic> for detaljar
help-topic-msg =   .help/msg                    meldingar
help-topic-ma =   .help/ma                     間-rom, publisering og inngang
help-topic-path =   .help/path                   lokal dot-path-grammatikk
help-topic-my =   .help/my                     personleg config
help-topic-inbox =   .help/inbox                  innboks
help-topic-doc =   .help/doc                    dokument
help-topic-actor =   .help/actor                  ekstern actor
help-topic-z =   .help/z                      offentleg og privat Scheme-innhald
help-topic-zscheme =   .help/zscheme               Scheme-uttrykk i kommandoar og dokumentasjon
help-topic-url =   .help/url                    opne zion via ei URL-lenkje
help-topic-i18n =   .help/i18n                   språkval for identiteten din
help-unknown-topic =   .help/{ $topic }: ukjent emne

# -- Help actor section
help-header-actor = -- eksterne aktørar
help-actor-echo =   @actor                       vis oppslått DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direkte/chat/emote-melding
help-actor-ping =   @actor:ping                  tilgjengelegheitsping
help-actor-entities =   @actor/entities              list entitetar
help-actor-entities-get =   @actor/entities/<n>          hent entitetsnode
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entitet via IPFS-referanse
help-actor-entities-edit =   @actor/entities/<n>!edit     rediger entitet
help-actor-entities-del =   @actor/entities/<n>:         slett entitet
help-actor-config-get =   @actor/config/<key>          hent config-verdi
help-actor-config-set =   @actor/config/<key>: val     set config-verdi
help-actor-acl =   @actor/acl                   hent ACL
help-actor-acl-edit =   @actor/acl!edit              rediger ACL
help-actor-fragment =   @actor#entity                send til plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC til plugin
help-header-cid-ops = ── Scheme-aktørkall ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  kall entitets-RPC frå Scheme og vent på svar
help-actor-head =   (@actor/path)                hent eksternt CRUD-innhald frå Scheme
help-actor-tail =   (<bafy...>)                  inkluder og evaluer Scheme frå ein IPFS-CID
help-actor-wc =   (define x (@actor:verb arg))  hald RPC-svar i sesjonsmiljøet
help-header-url = ── URL-parametrar ──────────────────────────────────────────────────────────
help-url-intro =   Del ei lenkje som opnar zion med ferdig utfylt mottakar:
help-url-msg =   ?msg=<did>                   fyller inn: @<did>!msg (tekstmelding)
help-url-say =   ?say=<did>                   fyller inn: @<did>!say (si-verb)
help-url-emote =   ?emote=<did>                 fyller inn: @<did>!emote (emote-verb)
help-url-ma =   ?ma=<did-or-url>              førehandsfyll runtime-DID / HTTP-URL
help-url-enter =   ?enter=<runtime>             gå inn i runtime-verda etter innlogging
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Inputfeltet vert fylt ut, men vert ikkje sendt — trykk Enter for å sende.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publisere identiteten din til nettverket
help-header-publish = ── publisering av identitet ─────────────────────────────────────────────────
help-publish-intro = Publisering gjer identiteten din synleg på nettverket. Andre kan slå opp din DID for å nå deg.
help-publish-ma = For å publisere treng du 間 (lokal køyretid) installert. Han koplar ego til IPFS/IPNS på dine vegner.
help-publish-steps = Steg: køyr '.ma: claim [port]' for å oppdage din lokale 間, deretter '.my.identity!publish @ma'.
help-publish-without = Utan publisering kan ikkje andre nå deg — sjølv om dei kjenner din DID, kan dei ikkje løyse opp endepunktet ditt.
profile-fetch-did-resolve-failed = DID ikkje publisert endå — køyr '.my.identity!publish @ma' fyrst, deretter '!publish' profilen din
profile-update-done = profilen er oppdatert — { $n } nøklar slått saman frå CID
profile-delete-needs-name = oppgje eit profilnamn: .profiles.<name>:
profile-publish-sent = profilen er kryptert og send til IPFS; DID-dokumentet blir oppdatert når CID kjem
profile-publish-done = profil publisert — DID-dokumentet er oppdatert med ma.agent-CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Samlar batch — skriv kommandoar, avslutt med .batch
batch-already-collecting = Samlar allereie ein batch — avslutt med .batch først
batch-empty = Batchen var tom — ingenting å køyre
batch-running = Køyrer batch…
batch-step-timeout = batch-steg tidsavbrote

batch-done = Batch ferdig på { $secs }s — { $steps } steg
batch-done-error = Batch ferdig med feil på { $secs }s — { $steps } steg
msg-timeout = Meldinga fekk tidsavbrot (ingen svar på 60s)
msg-outbox-open-timeout = aktøren { $target } er ikkje tilgjengeleg — sambandet fekk tidsavbrot etter { $ms }ms
msg-outbox-send-timeout = sending til { $target } fekk tidsavbrot etter { $ms }ms — sambandet kan ha falle ut
err-unknown-command = ukjend kommando: { $path }
err-read-only-path = { $path } er skriveverna
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        evaluer kladdedokument parallelt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Klarte ikkje henta CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ugyldig CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Åtvaring: Den private IPNS-nøkkelen din vil bli send til dette køyretidsmiljøet for identitetspublisering. Bruk berre eit køyretidsmiljø du stolar fullt og heilt på.

# -- Help text -- zscheme
help-header-z = ── .z og .my ───────────────────────────────────────────────────────────────
help-z-public =   .z.*                       offentleg eller publiserbart innhald; ikkje lagre løyndommar her
help-z-scheme =   .z.scheme                  Scheme-skriptet som blir lasta inn og evaluert ved oppstart
help-z-control =   .z.scheme                 du styrer sjølv innhaldet i oppstartsskriptet
help-z-private =   .my.*                     privat lokal konfigurasjon; Scheme kan òg lagrast her
help-z-choice =   .z.* / .my.*               bruk .z.* for offentleg Scheme og .my.* for privat Scheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme evaluerer Scheme-uttrykk som er skrivne inn i zion-kommandoar, og flettar resultatet inn i linja før ho blir send.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    døme i linja; sender "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definisjonar blir verande i gjeldande innloggingsøkt
help-zscheme-doc = Dokumentasjon: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokal IPFS-gateway (krev nettlesarunntak)

tab-config = Innstillingar
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
