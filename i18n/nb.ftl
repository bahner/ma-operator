# zion — Norsk bokmål
lang-name = Norsk bokmål

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
msg-connecting = kobler til iroh...
msg-iroh-ready = iroh-endepunkt klart
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publisert via lokal ma ({ $url })
msg-identity-not-published = Identitet ikke funnet online — om du har ma installert lokalt, kjør '.ma [port]' og deretter '.my.identity!publish @ma'. Skriv '.help.publish' for detaljer.
msg-blocked = ⊗ blokkert [{ $cap }]: { $from }
msg-focus-cleared = fokus fjernet
msg-focusing = fokuserer { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = slettet { $path } ({ $count } oppføringer)
msg-read-only = { $path } er skrivebeskyttet
msg-subtree-set = { $path } er et undertre; nekter å sette
msg-ancestor-leaf = en forfader til { $path } er en bladnode; nekter å skyggelegge
msg-key-not-found = nøkkel ikke funnet: { $path }
msg-no-match = ingen treff
msg-link-not-connected = lenke-hentingsfeil: ikke tilkoblet
msg-link-fetch-error = lenke-hentingsfeil: { $e }
msg-link-key-not-found = nøkkel `{ $key }` ikke funnet i lenket dokument

# ── Alias-validering ──────────────────────────────────────────────────────
err-alias-name-empty = aliasnavn kan ikke være tomt
err-alias-has-dot = aliasnavn kan ikke inneholde '.'
err-alias-has-fragment = aliasnavn kan ikke inneholde '#'
err-alias-value-fragment = aliasverdi må være en enkel did:ma:<ipns> (ingen fragment)
err-alias-value-path = aliasverdi må være en enkel did:ma:<ipns> (ingen sti)
err-alias-not-did = aliasverdi må starte med did:ma:
err-unknown-alias = ukjent alias: @{ $name }
err-bare-did = forventet enkel did:ma:<ipns> (ingen fragment eller sti), fikk { $did }
err-lang-not-found = språk ikke funnet: { $lang }

# ── Redaktør ──────────────────────────────────────────────────────────────
btn-save = Lagre
btn-eval = Kjør
btn-cancel = Avbryt
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
discover-success = ma oppdaget ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma opprettet — kjør '.my.identity!publish @ma' for å publisere din identitet.
claim-success = Kjøretid gjort krav på for { $did }
claim-conflict = Kjøretid allerede gjort krav på av en annen identitet
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
doc-publish-usage = bruk: .my.doc.<navn>:publish <utgiver>
doc-publish-ipld-usage = bruk: .my.doc.<navn>:publish-ipld <utgiver>
doc-publish-failed = publisering { $path }: { $e }
doc-publish-ipld-failed = ipld-publisering { $path }: { $e }
doc-store-sent = lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-fetch-done = hentet { $cid } → { $path }.content (ikke kjørt)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = bruk: .my.doc.<navn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikke satt
doc-no-verb = intet verb `{ $verb }` for { $path }
path-no-verb = intet verb `{ $verb }` for { $path }

# ── Hjelpetekst — overskrifter ────────────────────────────────────────────
help-header-zion = ── zion-kommandoer ────────────────────────────────────────────────────────
help-header-messaging = ── meldinger ────────────────────────────────────────────────────────────
help-header-focus = ── fokusmodus ───────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurasjonsgrammatikk ──────────────────────────────────────
help-header-common = ── vanlige stier ─────────────────────────────────────────────────────────
help-header-inbox = ── innboks ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumenter (.my.doc.*) ───────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjelpetekst — zion-kommandoer ─────────────────────────────────────────
help-cmd-help =   .help                        denne teksten
help-cmd-clear =   .clear                       tøm terminalen
help-cmd-panic =   .panic                       siste utvei — bruk hvis du er i en vanskelig situasjon
help-cmd-history =   .history                     kommandohistorikk (påfølgende duplikater slås sammen)
help-cmd-logout =   .logout                      logg ut
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Hjelpetekst — meldinger ───────────────────────────────────────────────
help-msg-echo =   @alias                       vis løst DID (ingen melding sendt)
help-msg-send =   @alias[:verb] body           send melding / RPC til aktør
help-msg-fragment =   @alias#fragment[:verb] body  send til alias med eksplisitt DID-fragment
help-msg-escape =   \@name                       bokstavelig @name (ingen alias-oppslag)

# ── Hjelpetekst — fokusmodus ──────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokuser på aktør (endrer prompt)
help-focus-clear =   .use                         fjern fokus

# ── Hjelpetekst — konfigurasjonsgrammatikk ───────────────────────────────
help-config-get =   .path                        hent bladverdi eller list undertre
help-config-filter =   .path value                  søkfilter (filtrer etter verdi)
help-config-set =   .path: value                 sett blad
help-config-delete =   .path:                       slett blad eller undertre
help-config-verb =   .path!verb [args]             kjør lokalt verb

# ── Hjelpetekst — vanlige stier ───────────────────────────────────────────
help-my =   .my                          vis all personlig konfigurasjon
help-aliases =   .my.aliases                  list aliaser
help-aliases-set =   .my.aliases.<name>: <did>    legg til/oppdater alias (enkel DID, ingen #fragment)
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
help-doc-edit =   .my.doc.<navn>:edit           åpne redigator med lagret innhold
help-doc-edit-cid =   .my.doc.<navn>:edit <cid>     hent CID, åpne for gjennomgang
help-doc-eval =   .my.doc.<navn>:eval           kjør lagret innhold linje for linje
help-doc-publish =   .my.doc.<navn>:publish @pub   lagre som rå blob (alle typer)
help-doc-publish-ipld =   .my.doc.<navn>:publish-ipld @pub  lagre YAML som strukturert DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<navn>:fetch <cid>    importer CID-innhold (ingen kjøring)
help-doc-cid =   .my.doc.<navn>:cid            vis lagret CID
help-doc-del =   .my.doc.<navn>:              slett dokument

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
yaml-serialize-error = YAML-serialiseringsfeil: { $e }
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
profile-no-ma = ingen ma-kjøretid konfigurert — kjør '.ma [port]' først
profile-no-cid = ingen CID lagret for denne profilen — kjør '!publish' først
profile-no-cid-in-doc = ingen profil-CID funnet i DID-dokument — kjør '!publish' først
profile-publish-failed = profilpublisering mislyktes: { $e }
profile-fetch-done = profil hentet — { $n } nøkler hentet fra IPFS
profile-fetch-failed = profil-henting mislyktes: { $e }
msg-identity-exists = identitet allerede publisert — profil-CID lastet fra lokal lagring
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ingen)
profiles-deleted = profil { $name } slettet
profiles-not-found = fant ikke profil: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    åpne zion via en URL-lenke
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
help-header-url = ── URL-parametere ──────────────────────────────────────────────────────────
help-url-intro =   Del en lenke som åpner zion med ferdig utfylt mottaker:
help-url-msg =   ?msg=<did>                   forhåndsutfyller: @<did> (tekstmelding)
help-url-say =   ?say=<did>                   forhåndsutfyller: @<did>:say (si-verb)
help-url-emote =   ?emote=<did>                 forhåndsutfyller: @<did>:emote (emote-verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Inputfeltet fylles ut, men sendes ikke — trykk Enter for å sende.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publisere identiteten din til nettverket
help-header-publish = ── publisering av identitet ─────────────────────────────────────────────────
help-publish-intro = Publisering gjør identiteten din synlig på nettverket. Andre kan slå opp din DID for å nå deg.
help-publish-ma = For å publisere trenger du ma (lokal kjøretid) installert. Den kobler ego til IPFS/IPNS på dine vegne.
help-publish-steps = Steg: kjør '.ma [port]' for å oppdage din lokale ma, deretter '.my.identity!publish @ma'.
help-publish-without = Uten publisering kan ikke andre nå deg — selv om de kjenner din DID, kan de ikke løse opp endepunktet ditt.
profile-fetch-did-resolve-failed = DID ikke publisert ennå — kjør '.my.identity!publish @ma' først, deretter '!publish' profilen din
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
scheme-cid-fetch-error = Klarte ikke hente CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ugyldig CID: { $value }
