# zion — Norsk bokmål
lang-name = Norsk bokmål
label-nick = kallenavn
new-identity-nick-help = Velg et kallenavn for 間-rom. Det er bare et kallenavn, og du kan endre det når som helst.
error-nick-required = kallenavn påkrevd
error-nick-invalid = kallenavnet kan ikke inneholde mellomrom eller @

# ── Landingsside ──────────────────────────────────────────────────────────
tab-login = logg inn
tab-new-identity = ny identitet
tab-import-profile = importer profil
label-passphrase = passfrase
label-username = brukernavn
label-confirm-passphrase = bekreft passfrase
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
qr-scan-hint = Pek kameraet mot en zion-profil-QR-kode.
qr-error-camera = kamera utilgjengelig: { $e }
qr-error-too-large = profilen er for stor for en QR-kode
passphrase-warning = Mistet passfrase = mistet identitet. Det finnes ingen gjenoppretting.
import-profile-help = Importer en profil via CID eller fil. Du trenger den samme passfrasen som ble brukt ved publisering.
import-profile-detected-user = Profil tilhører: { $name }
status-unlocking = låser opp...
status-generating = genererer identitet...
status-reading-file = leser fil...
status-fetching-profile = henter profil fra IPFS...
status-imported = importerte '{ $name }' — bytt til Logg inn-fanen
status-importing-profile = importerer profil...
profile-import-done = profil importert for '{ $name }' — { $n } nøkler lastet
error-wrong-passphrase = feil passfrase: { $e }
error-identity-not-found = identiteten '{ $name }' finnes ikke
error-username-required = brukernavn påkrevd
error-passphrase-required = passfrase påkrevd
error-passphrases-no-match = passfraser stemmer ikke overens
error-profile-source-required = oppgi en CID eller last opp en fil
error-did-required = skriv inn ditt DID
error-profile-fetch = kunne ikke hente profil: { $e }
error-profile-no-username = profilen inneholder ikke et brukernavn
error-profile-no-identity = identiteten '{ $name }' ikke funnet — importer identiteten først

# ── Terminal-systemmeldinger ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logget inn som { $username }
msg-type-help = Skriv .help for en liste over kommandoer.
msg-getting-started = Prøv: say Hello world, look, .help eller help.
msg-connecting = kobler til iroh...
msg-iroh-ready = iroh-endepunkt klart
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publisert via lokal 間 ({ $url })
msg-identity-publication-propagating = Identitetspubliseringen forplanter seg fortsatt; entry er utsatt: { $e }
msg-identity-first-publish = Publiserer identitet for første gang. Dette kan ta opptil { $seconds } sekunder.
msg-ma-connecting-matrix = prøver å koble deg til 間trix
msg-ma-checking-url = sjekker lokal 間 på { $url }
msg-local-ma-unreachable = lokal 間 svarer ikke på { $url } etter { $seconds }s; start 間 eller endre .ma.ctx.url
msg-runtime-pinging = pinger runtime { $did }
msg-runtime-ping-timeout = runtime { $did } svarte ikke innen { $seconds }s; hopper over automatisk entry
msg-startup-enter-skipped = går ikke inn i lagret runtime fordi { $target } ikke svarte
msg-local-ma-claimed = lokal 間 gjort krav på
msg-local-ma-already-claimed = lokal 間 er allerede gjort krav på
msg-local-ma-claim-failed = klarte ikke å gjøre krav på lokal 間
msg-identity-not-published = Identitet ikke funnet online — om du har 間 installert lokalt, kjør '.ma [port]' og deretter '.my.identity!publish @ma'. Skriv '.help/publish' for detaljer.
msg-blocked = ⊗ blokkert [{ $cap }]: { $from }
msg-focus-cleared = fokus fjernet
msg-left = left
msg-focusing = fokuserer { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = slettet { $path } ({ $count } oppføringer)
msg-read-only = { $path } er skrivebeskyttet
msg-subtree-set = { $path } er et undertre; nekter å sette
msg-ancestor-leaf = en forfader til { $path } er en bladnode; nekter å skyggelegge
msg-key-not-found = nøkkel ikke funnet: { $path }
msg-link-not-connected = lenke-hentingsfeil: ikke tilkoblet
msg-link-fetch-error = lenke-hentingsfeil: { $e }
msg-link-key-not-found = nøkkel `{ $key }` ikke funnet i lenket dokument

# ── Alias-validering ──────────────────────────────────────────────────────
err-alias-name-empty = aliasnavn kan ikke være tomt
err-alias-has-dot = aliasnavn kan ikke inneholde '.'
err-alias-has-fragment = aliasnavn kan ikke inneholde '#'
err-alias-value-fragment = aliasverdi kan ha høyst ett ikke-tomt DID-URL-fragment
err-alias-value-path = aliasverdi må være en did:ma:<ipns>-DID eller DID-URL (ingen sti)
err-alias-not-did = aliasverdi må starte med did:ma:
err-unknown-alias = ukjent alias: @{ $name }
err-bare-did = forventet enkel did:ma:<ipns> (ingen fragment eller sti), fikk { $did }
err-lang-not-found = språk ikke funnet: { $lang }

# ── Redaktør ──────────────────────────────────────────────────────────────
btn-save = Lagre
btn-eval = Kjør
btn-cancel = Avbryt
msg-jobs-cancelled = jobber avbrutt
btn-close = Lukk
btn-reply = Svar
btn-publish = Publiser
btn-publish-ipld = Publiser IPLD
msg-reply-sent = svar sendt
msg-reply-failed = svaret feilet: { $e }
msg-entity-publish-sent = entitet { $name }: publisering sendt
msg-entity-publish-failed = entitetspublisering feilet: { $e }
msg-kind-publish-failed = publisering av type mislyktes: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publisering sendt
msg-field-publish-failed = feltpublisering feilet: { $e }
msg-acl-publish-sent = runtime ACL: publisering sendt
msg-crud-edit-publish-sent = { $path }: publisering sendt
msg-acl-publish-failed = runtime ACL-publisering feilet: { $e }
msg-yaml-error = YAML-feil: { $e }
msg-editor-saved = { $path }:lagre
msg-fetch-review = hentet { $cid } — gjennomgå før kjøring
msg-fetch-failed = henting { $cid }: { $e }

# ── Verb — innboks ────────────────────────────────────────────────────────
inbox-empty = innboksen er tom
inbox-entry-not-found = innboksoppføring { $n } ikke funnet
inbox-no-message-id = innboksoppføring { $n } har ingen message_id
inbox-no-verb = intet verb `{ $verb }` for innboksoppføring { $n }
inbox-filter-no-arg = filter krever et DID- eller alias-argument
inbox-filter-empty = ingen meldinger fra { $did }

# ── Verb — kjøretid ───────────────────────────────────────────────────────
discover-fetch-failed = oppdagelse feilet ved { $url }: { $e }
discover-json-error = oppdagelse feilet: ugyldig JSON fra { $url }: { $e }
discover-missing-did = oppdagelse feilet: status.json mangler påkrevd felt `did`
discover-invalid-did = oppdagelse feilet: forventet `did` å starte med did:ma:, fikk `{ $did }`
discover-no-endpoint = oppdagelsesadvarsel: `endpoint_id` mangler i status.json; lagret kun DID
discover-hint-endpoint-not-found = Hint: endepunktet ble ikke funnet. Sjekk at 間 kjører og eksponerer /status.json på port 5003.
discover-hint-server-error = Hint: kjøretiden svarte med serverfeil. Sjekk 間-loggene og prøv igjen.
discover-hint-network = Hint: nettverks-/tilkoblingsproblem. Start 間, sjekk at localhost:5003 kan nås, og tillat lokal HTTP-tilgang i nettleseren.
discover-hint-generic = Hint: sjekk at 間 og IPFS Desktop kjører, og prøv `.ma` igjen.
discover-success = 間 oppdaget ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma opprettet — kjør '.my.identity!publish @ma' for å publisere din identitet.
claim-success = Kjøretid gjort krav på for { $did }
claim-conflict = Kjøretid allerede gjort krav på av en annen identitet
claim-already-owned = Runtime er allerede gjort krav på av denne identiteten
claim-http-failed = krav feilet: HTTP { $status }
claim-error = krav feilet: { $e }
claim-no-session = ikke logget inn; logg inn først for å gjøre krav på kjøretiden
runtime-no-verb = intet verb `{ $verb }` for { $path }

# ── Verb — tilgangskontroll ───────────────────────────────────────────────
acl-reset = .my.acl tilbakestilt (fullt åpen)
acl-persist-error = lagringsfeil: { $e }
acl-no-verb = intet verb `{ $verb }` for .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = bruk: .my.identity!publish <did-eller-alias>
identity-exported = Bundle lastet ned som { $filename }
identity-export-failed = Eksport mislyktes: { $e }

# ── Verb — dokumenter ────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tom
doc-save-first = { $path }.content er tom — lagre først
doc-missing-name = manglende dokumentnavn
doc-publish-usage = bruk: .my.doc.<navn>!publish <utgiver>
doc-publish-ipld-usage = bruk: .my.doc.<navn>!publish-ipld <utgiver>
doc-publish-failed = publisering { $path }: { $e }
doc-publish-ipld-failed = ipld-publisering { $path }: { $e }
doc-publish-error-detail = publisering feilet [{ $code }]: { $err }
doc-publish-error-hint = Tips: { $hint }
doc-publish-hint-session = logg inn på nytt så ego får tilgang til identitetsnøklene dine
doc-publish-hint-target = bruk en gyldig utgiver-DID eller et alias som peker til en bar did:ma:<ipns>
doc-publish-hint-network = sjekk at 間-kjøretiden og IPFS kan nås, og prøv igjen
doc-publish-hint-resolve = sjekk at utgiverens DID-dokument er publisert og inneholder et tilgjengelig endepunkt
doc-publish-hint-acl = be utgiveroperatøren tillate din DID i ACL
doc-publish-hint-runtime = kjøretiden/pluginen avviste forespørselen; les årsaken og prøv igjen etter å ha rettet entitet/kjøretid
doc-publish-hint-ipfs = sjekk lokal Kubo/IPFS-helse og status for utgiverkjøretiden
doc-publish-hint-unknown = se i kjøretidsloggene etter detaljert årsak og prøv igjen
doc-store-sent = lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-fetch-done = hentet { $cid } → { $path }.content (ikke kjørt)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = bruk: .my.doc.<navn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikke satt
doc-no-verb = intet verb `{ $verb }` for { $path }
path-no-verb = intet verb `{ $verb }` for { $path }

# ── Hjelpetekst — overskrifter ────────────────────────────────────────────
help-header-zion = ── zion-kommandoer ────────────────────────────────────────────────────────
help-header-messaging = ── meldinger ────────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurasjonsgrammatikk ──────────────────────────────────────
help-header-common = ── vanlige stier ─────────────────────────────────────────────────────────
help-header-inbox = ── innboks ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumenter (.my.doc.*) ───────────────────────────────────────────────────
help-header-i18n = ── språk ────────────────────────────────────────────────────────────────
help-header-ma = ── 間-rom ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── inn i 間-rommet ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjelpetekst — zion-kommandoer ─────────────────────────────────────────
help-cmd-help =   .help                        denne teksten
help-cmd-clear =   .clear                       tøm terminalen
help-cmd-panic =   .panic                       siste utvei — bruk hvis du er i en vanskelig situasjon
help-cmd-history =   .history                     kommandohistorikk (påfølgende duplikater slås sammen)
help-cmd-logout =   .logout                      logg ut
help-cmd-batch =   .batch                       evaluer kladdedokument parallelt
help-cmd-batch-sync =   .batch:sync / .batch         evaluer kladdedokument linje for linje

# ── Hjelpetekst — meldinger ───────────────────────────────────────────────
help-msg-echo =   @alias                       vis løst DID/DID-URL (ingen melding sendt)
help-msg-send =   @alias!msg body / @alias:verb args           send melding / RPC til aktør
help-msg-fragment =   @alias#fragment:verb body  send til alias med eksplisitt DID-fragment
help-msg-escape =   \@name                       bokstavelig @name (ingen alias-oppslag)


# ── Hjelpetekst — ma-space ────────────────────────────────────────────────
help-ma-intro = 間-rommet er rommet mellom 間-identiteter. 間 sørger for at identitetene kan finne hverandre og kommunisere; når identiteten din er publisert, kan du delta.
help-ma-command =   .ma [port]                   koble til lokal 間-runtime, les /status.json, og lagre .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publiser DID-dokumentet ditt så andre kan finne nøkler og endpoint
help-ma-security = Den tydeligste tillitsgrensen er din egen 間-runtime med din egen IPFS Desktop/Kubo. En fjern publisher kan være nyttig, men da bruker du noen andres tjeneste.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hvordan du går inn i 間-rommet

# ── Hjelpetekst — inn i ma-space ──────────────────────────────────────────
help-ma-entry-intro = Når identiteten din er kjent, kan .enter @ma la deg tre inn i 間. Finn deg en verden, gå inn i den, og delta derfra.
help-ma-entry-steps = Start IPFS Desktop og ma, og kjør deretter .ma. Publiser med .my.identity!publish @ma, finn en verden, og gå inn med .enter @ma.
help-ma-entry-command =   .enter @ma                  tre inn i 間 gjennom @ma-runtime
help-ma-entry-toggle =   .enter                       slå romfokus av eller på; identiteten din er fortsatt aktiv
help-ma-entry-url =   ?enter=<runtime>             tre inn etter innlogging fra en delt URL

# ── Hjelpetekst — konfigurasjonsgrammatikk ───────────────────────────────
help-config-get =   .path                        hent bladverdi eller list undertre
help-config-set =   .path: value                 sett blad
help-config-delete =   .path:                       slett blad eller undertre
help-config-verb =   .path!verb [args]             kjør lokalt verb

# ── Hjelpetekst — vanlige stier ───────────────────────────────────────────
help-my =   .my                          vis all personlig konfigurasjon
help-aliases =   .my.aliases                  list aliaser
help-aliases-set =   .my.aliases.<name>: <did-url> legg til/oppdater alias (DID eller DID-URL)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .ma [port]          oppdag lokal kjøretid og opprett @ma-alias
help-runtime-claim =   .ma [port]             gjør krav på kjøretid med din DID
help-identity =   .my.identity                 vis identitetskonfigurasjon
help-identity-did =   .my.identity.did             vis egen DID (skrivebeskyttet)
help-identity-publish =   .my.identity!publish @pub    publiser egen DID via utgiver-tjeneste
help-identity-export =   .my.identity!export          last ned eget identitetspakke
help-config-path =   .config                      vis alle .config.*-oppføringer

# ── Hjelpetekst — innboks ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    list innboks (undertre-visning)
help-inbox-n =   .my.inbox.N                  vis oppføring N sine felt
help-inbox-from =   .my.inbox.N.from             avsender-DID for oppføring N
help-inbox-reply =   .my.inbox.N!reply [body]     send svar (åpner redaktør uten body)
help-inbox-open =   .my.inbox.N!open             åpne innholdet i skrivebeskyttet redaktør
help-inbox-del =   .my.inbox.N:                 slett oppføring N
help-inbox-delall =   .my.inbox:                   slett alle innboksoppføringer
help-inbox-flush =   .my.inbox!flush              skriv alle oppføringer til terminal
help-inbox-filter =   .my.inbox!filter @who        vis bare oppføringer fra @who
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traverser avsenderens DID-dokument lat

# ── Hjelpetekst — dokumenter ──────────────────────────────────────────────
help-doc-edit =   .my.doc.<navn>!edit           åpne redigator med lagret innhold
help-doc-edit-cid =   .my.doc.<navn>!edit /ipfs/<cid>     hent CID, åpne for gjennomgang
help-doc-eval =   .my.doc.<navn>!eval           kjør lagret innhold linje for linje
help-doc-publish =   .my.doc.<navn>!publish @pub   lagre som rå blob (alle typer)
help-doc-publish-ipld =   .my.doc.<navn>!publish-ipld @pub  lagre YAML som strukturert DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<navn>!fetch /ipfs/<cid>    importer CID-innhold (ingen kjøring)
help-doc-cid =   .my.doc.<navn>!cid            vis lagret CID
help-doc-del =   .my.doc.<navn>:              slett dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n lagrer språkvalget som er knyttet til identiteten din.
help-i18n-set =   .my.i18n: <kode>             velg språket zion bruker for denne identiteten
help-i18n-list =   .my.i18n!list               list tilgjengelige språkkoder

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tilgjengelige språk (angi med .my.i18n: <code>):

msg-send-failed = sending feilet: { $e }
msg-not-logged-in = ikke innlogget
msg-new-message = ← [{ $from }] ny melding — { $count } i innboksen
msg-chat = { $sender } sier { $body }

# ── Romhendelser ──────────────────────────────────────────────────────────
room-say   = { $name } sier { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kommer inn.
room-leave = * { $name } går ut.
room-drop  = * { $name } slipper { $thing }.
room-take  = * { $name } plukker opp { $thing }.

# ── RPC-svardisplay ───────────────────────────────────────────────────────
rpc-error = feil
rpc-error-detail = feil: { $detail }

# ── Redigeringsfeil ───────────────────────────────────────────────────────
err-edit-decode-failed = redigering: dekodingsfeil: { $e }
err-edit-fetch-failed = redigering: hentingsfeil: { $e }

# ── CBOR / YAML-kodeingsfeil ──────────────────────────────────────────────
yaml-parse-error = YAML-parsefeil: { $e }
yaml-not-mapping = YAML må være en mapping (nøkkel: verdi-par); ren tekst og skalarer kan ikke lagres som DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kodeingsfeil: { $e }
cbor-decode-error = CBOR-avkodingsfeil: { $e }
cbor-json-error = CBOR til JSON-feil: { $e }
yaml-serialise-error = YAML-serialiseringsfeil: { $e }
edit-reply-invalid = ugyldig redigeringssvar
doc-publish-ipld-error = kan ikke publisere-ipld: { $e }

# ── Interne / sesjonsfeil ─────────────────────────────────────────────────
err-inbox-prune-persist = innboksrensing lagringsfeil: { $e }
err-config-load = konfigurasjonslastingsfeil: { $e }
err-lang-persist = språklagringsfeil: { $e }
err-history-parse = historikkparsefeil: { $e }
err-history-load = historikklastingsfeil: { $e }
err-ipfs-reply-decode = IPFS-svar-avkodingsfeil: { $e }
err-edit-cbor = redigeringsfeil (CBOR): { $e }
err-popup-blocked = popup blokkert av nettleseren
status-publishing = publiserer

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv økt — profilen kan ikke slettes
profile-delete-error = sletting av profil mislyktes: { $e }
profile-wrong-user = kan ikke sette CID for en annen profil — bare din egen
profile-wrong-user-name = kan ikke sette CID for '{ $name }' — bare din egen profil
profile-no-ma = ingen 間-kjøretid konfigurert — kjør '.ma [port]' først
profile-no-cid = ingen CID lagret for denne profilen — kjør '!publish' først
profile-no-cid-in-doc = ingen profil-CID funnet i DID-dokument — kjør '!publish' først
profile-publish-failed = profilpublisering mislyktes: { $e }
profile-fetch-done = profil hentet — { $n } nøkler hentet fra IPFS
profile-fetch-failed = profil-henting mislyktes: { $e }
msg-identity-exists = identitet allerede publisert — profil-CID lastet fra lokal lagring
profile-import-exists = profilen '{ $name }' finnes allerede — slett den først
profile-import-wrong-user = filen inneholder profilen '{ $found }', forventet '{ $expected }'

# -- CID content operations
cid-op-binary = binært innhold (vises ikke)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = klarte ikke å hente innhold: { $e }
cid-op-unknown = ukjent innholdsoperasjon: { $op }
cid-op-wc = { $lines } linjer  { $words } ord  { $chars } tegn
profiles-empty = (ingen)
profiles-deleted = profil { $name } slettet
profiles-not-found = fant ikke profil: { $name }

# -- Help topics index
help-header-topics = -- emner -- skriv .help/<topic> for detaljer
help-topic-msg =   .help/msg                    meldinger
help-topic-ma =   .help/ma                     間-rom, publisering og entry
help-topic-path =   .help/path                   lokal dot-path-grammatikk
help-topic-my =   .help/my                     personlig config
help-topic-inbox =   .help/inbox                  innboks
help-topic-doc =   .help/doc                    dokumenter
help-topic-actor =   .help/actor                  ekstern actor
help-topic-zscheme =   .help/zscheme               Scheme-uttrykk i kommandoer og dokumentasjon
help-topic-url =   .help/url                    åpne zion via en URL-lenke
help-topic-i18n =   .help/i18n                   språkvalg for identiteten din
help-unknown-topic =   .help/{ $topic }: ukjent emne

# -- Help actor section
help-header-actor = -- eksterne aktører
help-actor-echo =   @actor                       vis oppslått DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direkte/chat/emote-melding
help-actor-ping =   @actor:ping                  tilgjengelighetsping
help-actor-entities =   @actor/entities              list entiteter
help-actor-entities-get =   @actor/entities/<n>          hent entity-node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   sett entity med IPFS-referanse
help-actor-entities-edit =   @actor/entities/<n>!edit     rediger entitet
help-actor-entities-del =   @actor/entities/<n>:         slett entitet
help-actor-config-get =   @actor/config/<key>          hent config-verdi
help-actor-config-set =   @actor/config/<key>: val     sett config-verdi
help-actor-acl =   @actor/acl                   hent ACL
help-actor-acl-edit =   @actor/acl!edit              rediger ACL
help-actor-fragment =   @actor#entity                send til plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC til plugin
help-header-cid-ops = ── Scheme actor-kall ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  kall entity-RPC fra Scheme og vent på svar
help-actor-head =   (@actor/path)                hent remote CRUD-innhold fra Scheme
help-actor-tail =   (<bafy...>)                  inkluder og evaluer Scheme fra en IPFS-CID
help-actor-wc =   (define x (@actor:verb arg))  behold RPC-svar i session-miljøet
help-actor-wc-l =   .my.z.scheme.ma!edit           rediger lagrede Scheme-hjelpere for denne identiteten
help-header-url = ── URL-parametere ──────────────────────────────────────────────────────────
help-url-intro =   Del en lenke som åpner zion med ferdig utfylt mottaker:
help-url-msg =   ?msg=<did>                   forhåndsutfyller: @<did>!msg (tekstmelding)
help-url-say =   ?say=<did>                   forhåndsutfyller: @<did>!say (si-verb)
help-url-emote =   ?emote=<did>                 forhåndsutfyller: @<did>!emote (emote-verb)
help-url-ma =   ?ma=<did-or-url>              forhåndsfyll runtime-DID / HTTP-URL
help-url-enter =   ?enter=<runtime>             gå inn i runtime-verden etter innlogging
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Inputfeltet fylles ut, men sendes ikke — trykk Enter for å sende.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publisere identiteten din til nettverket
help-header-publish = ── publisering av identitet ─────────────────────────────────────────────────
help-publish-intro = Publisering gjør identiteten din synlig på nettverket. Andre kan slå opp din DID for å nå deg.
help-publish-ma = For å publisere trenger du 間 (lokal kjøretid) installert. Den kobler ego til IPFS/IPNS på dine vegne.
help-publish-steps = Steg: kjør '.ma [port]' for å oppdage din lokale 間, deretter '.my.identity!publish @ma'.
help-publish-without = Uten publisering kan ikke andre nå deg — selv om de kjenner din DID, kan de ikke løse opp endepunktet ditt.
profile-fetch-did-resolve-failed = DID ikke publisert ennå — kjør '.my.identity!publish @ma' først, deretter '!publish' profilen din
profile-update-done = profilen er oppdatert — { $n } nøkler slått sammen fra CID
profile-delete-needs-name = angi et profilnavn: .profiles.<name>:
profile-publish-sent = profilen er kryptert og sendt til IPFS; DID-dokumentet oppdateres når CID kommer
profile-publish-done = profil publisert — DID-dokumentet er oppdatert med ma.agent-CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Samler batch — skriv kommandoer, avslutt med .batch
batch-already-collecting = Samler allerede en batch — avslutt med .batch først
batch-empty = Batchen var tom — ingenting å kjøre
batch-running = Kjører batch…
batch-step-timeout = batch-steg tidsavbrutt

batch-done = Batch ferdig på { $secs }s — { $steps } steg
batch-done-error = Batch ferdig med feil på { $secs }s — { $steps } steg
msg-timeout = Meldingen tidsavbrutt (ingen svar på 60s)
err-unknown-command = ukjent kommando: { $path }
err-read-only-path = { $path } er skrivebeskyttet
help-cmd-batch-async =   .batch:async / .batch        evaluer kladdedokument parallelt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Klarte ikke hente CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ugyldig CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Advarsel: Din private IPNS-nøkkel vil bli sendt til dette kjøretidsmiljøet for identitetspublisering. Bruk bare et kjøretidsmiljø du stoler fullt ut på.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme evaluerer Scheme-uttrykk som er skrevet inn i zion-kommandoer, og fletter resultatet inn i linjen før den sendes.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    eksempel i linjen; sender "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definisjoner blir værende i gjeldende innloggingsøkt
help-zscheme-doc = Dokumentasjon: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokal IPFS-gateway (krever nettleserunntak)

tab-config = Innstillinger
label-gateway = gateway
