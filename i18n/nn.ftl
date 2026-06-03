# zion — Nynorsk
lang-name = Nynorsk

# ── Innloggingsside ───────────────────────────────────────────────────────
tab-login = logg inn
tab-new-identity = ny identitet
tab-import = importer
label-passphrase = passfrase
label-username = brukarnamn
label-confirm-passphrase = stadfest passfrase
btn-login = logg inn
btn-export = eksporter
btn-generate = generer
passphrase-warning = Mist passfrase = mist identitet. Det finst ingen atterhenting.
import-help = Vel ei eksportert .zion.json-fil. Pakka forblir kryptert.
status-unlocking = låser opp...
status-generating = genererer identitet...
status-reading-file = les fil...
status-imported = importerte '{ $name }' — byt til fana Logg inn
error-wrong-passphrase = feil passfrase: { $e }
error-identity-not-found = identiteten '{ $name }' vart ikkje funnen
error-username-required = brukarnamn er påkravd
error-passphrase-required = passfrase er påkravd
error-passphrases-no-match = passfraser stemmer ikkje overeins

# ── Terminalsystemmeldingar ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logga inn som { $username }
msg-type-help = Skriv .help for ei liste over kommandoar.
msg-connecting = koplar til iroh...
msg-iroh-ready = iroh-endepunkt klart
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publisert via lokal ma ({ $url })
msg-identity-not-published = Identitet ikkje funne online — om du har ma installert lokalt, køyr '.my.ma:discover' og deretter '.my.identity:publish @ma'. Skriv '.help.publish' for detaljar.
msg-blocked = ⊗ blokkert [{ $cap }]: { $from }
msg-focus-cleared = fokus tømt
msg-focusing = fokuserer { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = sletta { $path } ({ $count } postar)
msg-read-only = { $path } er skriveverna
msg-subtree-set = { $path } er eit undertre; nektar å angi
msg-ancestor-leaf = ein forfar til { $path } er eit lauv; nektar å skugge
msg-key-not-found = nøkkel ikkje funnen: { $path }
msg-no-match = ingen treff
msg-link-not-connected = lenke-hentingsfeil: ikkje kopla
msg-link-fetch-error = lenke-hentingsfeil: { $e }
msg-link-key-not-found = nøkkelen `{ $key }` ikkje funnen i kopla dokument

# ── Alias-validering ──────────────────────────────────────────────────────
err-alias-name-empty = aliasnamn kan ikkje vere tomt
err-alias-has-dot = aliasnamn kan ikkje innehalde '.'
err-alias-has-fragment = aliasnamn kan ikkje innehalde '#'
err-alias-value-fragment = aliasverd må vere bart did:ma:<ipns> (inkje fragment)
err-alias-value-path = aliasverd må vere bart did:ma:<ipns> (ingen sti)
err-alias-not-did = aliasverd må starte med did:ma:
err-unknown-alias = ukjend alias: @{ $name }
err-bare-did = forventa bart did:ma:<ipns> (inkje fragment eller sti), fekk { $did }

# ── Redigeringsprogram ────────────────────────────────────────────────────
btn-save = Lagre
btn-eval = Køyr
btn-cancel = Avbryt
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
discover-success = ma oppdaga ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma oppretta — køyr '.my.identity:publish @ma' for å publisere identiteten din.
claim-success = Køyretid gjort krav på for { $did }
claim-conflict = Køyretid allereie gjort krav på av ein annan identitet
claim-http-failed = krav mislykkast: HTTP { $status }
claim-error = krav mislykkast: { $e }
claim-no-session = ikkje logga inn; logg inn fyrst for å gjere krav på køyretida
runtime-no-verb = inkje verb `{ $verb }` for { $path }

# ── Verb — tilgangskontroll ───────────────────────────────────────────────
acl-reset = .my.acl tilbakestilt (heilt open)
acl-persist-error = lagringsfeil: { $e }
acl-no-verb = inkje verb `{ $verb }` for .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = bruk: .my.identity:publish <did-eller-alias>
identity-exported = Bundle lasta ned som { $filename }
identity-export-failed = Eksport mislukkast: { $e }

# ── Verb — dokument ───────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tom
doc-save-first = { $path }.content er tom — lagre fyrst
doc-missing-name = manglande dokumentnamn
doc-publish-usage = bruk: .my.doc.<namn>:publish <utgjevar>
doc-publish-ipld-usage = bruk: .my.doc.<namn>:publish-ipld <utgjevar>
doc-publish-failed = publisering { $path }: { $e }
doc-publish-ipld-failed = ipld-publisering { $path }: { $e }
doc-store-sent = lagringsførespurnad sendt ({ $id }) → { $publisher }; CID kjem via RPC-svar
doc-ipld-store-sent = IPLD-lagringsførespurnad sendt ({ $id }) → { $publisher }; CID kjem via RPC-svar
doc-fetch-done = henta { $cid } → { $path }.content (ikkje køyrd)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = bruk: .my.doc.<namn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikkje sett
doc-no-verb = inkje verb `{ $verb }` for { $path }
path-no-verb = inkje verb `{ $verb }` for { $path }

# ── Hjelptekst — overskrifter ─────────────────────────────────────────────
help-header-zion = ── zion-kommandoar ────────────────────────────────────────────────────────
help-header-messaging = ── meldingar ────────────────────────────────────────────────────────────
help-header-focus = ── fokusmodus ───────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurasjonsgrammatikk ───────────────────────────────────────
help-header-common = ── vanlege stiar ─────────────────────────────────────────────────────────
help-header-inbox = ── innboks ───────────────────────────────────────────────────────────────
help-header-documents = ── dokument ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjelptekst — zion-kommandoar ──────────────────────────────────────────
help-cmd-help =   .help                        denne teksten
help-cmd-clear =   .clear                       tøm terminalen
help-cmd-panic =   .panic                       siste utveg — bruk om du er i trøbbel
help-cmd-history =   .history                     kommandohistorikk (etterfylgjande duplikatar vert samanslåtte)
help-cmd-logout =   .logout                      logg ut

# ── Hjelptekst — meldingar ────────────────────────────────────────────────
help-msg-echo =   @alias                       vis løyst DID (inkje melding sendt)
help-msg-send =   @alias[:verb] body           send melding / RPC til aktør
help-msg-fragment =   @alias#fragment[:verb] body  send til alias med eksplisitt DID-fragment
help-msg-escape =   \@name                       bokstaveleg @name (ingen alias-søk)

# ── Hjelptekst — fokusmodus ───────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokuser på aktør (endrar prompt)
help-focus-clear =   .use                         tøm fokus

# ── Hjelptekst — konfigurasjonsgrammatikk ────────────────────────────────
help-config-get =   .path                        hent lauv-verdi eller list undertre
help-config-filter =   .path value                  søkefilter (filtrer etter verdi)
help-config-set =   .path: value                 set lauv
help-config-delete =   .path:                       slett lauv eller undertre
help-config-verb =   .path:verb [args]            køyr lokalt verb

# ── Hjelptekst — vanlege stiar ───────────────────────────────────────────
help-my =   .my                          vis all personleg konfigurasjon
help-aliases =   .my.aliases                  list alias
help-aliases-set =   .my.aliases.<name>: <did>    legg til/oppdater alias (bart DID, inkje #fragment)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .my.ma:discover          oppdag lokal køyretid og opprett @ma-alias
help-runtime-claim =   .my.ma:claim             gjer krav på køyretid med din DID
help-identity =   .my.identity                 vis identitetskonfigurasjon
help-identity-did =   .my.identity.did             vis eige DID (skriveverna)
help-identity-publish =   .my.identity:publish @pub    publiser eige DID via utgjevar-teneste
help-identity-export =   .my.identity:export          last ned eigen identitetspakke
help-config-path =   .config                      vis alle .config.*-postar

# ── Hjelptekst — innboks ──────────────────────────────────────────────────
help-inbox =   .my.inbox                    list innboks (undertre-visning)
help-inbox-n =   .my.inbox.N                  vis post N sine felt
help-inbox-from =   .my.inbox.N.from             avsendar-DID for post N
help-inbox-reply =   .my.inbox.N:reply [body]     send svar (opnar redigeringsprogram utan body)
help-inbox-open =   .my.inbox.N:open             opna innhald i skriveverna redigeringsprogram
help-inbox-del =   .my.inbox.N:                 slett post N
help-inbox-delall =   .my.inbox:                   slett alle innbokspostar
help-inbox-flush =   .my.inbox:flush              skriv alle postar til terminalen
help-inbox-filter =   .my.inbox:filter @who        vis berre oppføringar frå @who
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traverser avsendar sitt DID-dokument latent

# ── Hjelptekst — dokument ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<namn>:edit           opna redigeringsprogram med lagra innhald
help-doc-edit-cid =   .my.doc.<namn>:edit <cid>     hent CID, opna for gjennomgang
help-doc-eval =   .my.doc.<namn>:eval           køyr lagra innhald linje for linje
help-doc-publish =   .my.doc.<namn>:publish @pub   lagre som rå blob (alle typar)
help-doc-publish-ipld =   .my.doc.<namn>:publish-ipld @pub  lagre YAML som strukturert DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<namn>:fetch <cid>    importer CID-innhald (ingen køyring)
help-doc-cid =   .my.doc.<namn>:cid            vis lagra CID
help-doc-del =   .my.doc.<namn>:              slett dokument

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
yaml-serialize-error = YAML-serialiseringsfeil: { $e }
edit-reply-invalid = Ugyldig redigeringssvar
doc-publish-ipld-error = IPLD-publisering mislykkast: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Innboks-rydding lagringsfeil: { $e }
err-config-load = Konfigurasjonslastingsfeil: { $e }
err-lang-persist = Språklagringsfeil: { $e }
err-history-parse = Historieparsefeil: { $e }
err-history-load = Historielastingsfeil: { $e }
err-ipfs-reply-decode = IPFS-svar avkodeingsfeil: { $e }
err-edit-cbor = CBOR-redigeringsfeil: { $e }
err-popup-blocked = Nettlesar blokkerte sprettoppvindauget
status-publishing = publiserer

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = feil
rpc-error-detail = feil: { $detail }
msg-new-message = ← [{ $from }] ny melding — { $count } i innboksen
msg-chat = { $sender } seier { $body }
err-edit-decode-failed = redigering: dekodingsfeil: { $e }
err-edit-fetch-failed = redigering: hentingsfeil: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv økt — profilen kan ikkje slettast
profile-delete-error = sletting av profil mislukkast: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ingen)
profiles-deleted = profil { $name } sletta
profiles-not-found = fann ikkje profil: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    opne zion via ei URL-lenkje
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
help-header-url = ── URL-parametrar ──────────────────────────────────────────────────────────
help-url-intro =   Del ei lenkje som opnar zion med ferdig utfylt mottakar:
help-url-msg =   ?msg=<did>                   fyller inn: @<did> (tekstmelding)
help-url-say =   ?say=<did>                   fyller inn: @<did>:say (si-verb)
help-url-emote =   ?emote=<did>                 fyller inn: @<did>:emote (emote-verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Inputfeltet vert fylt ut, men vert ikkje sendt — trykk Enter for å sende.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publisere identiteten din til nettverket
help-header-publish = ── publisering av identitet ─────────────────────────────────────────────────
help-publish-intro = Publisering gjer identiteten din synleg på nettverket. Andre kan slå opp din DID for å nå deg.
help-publish-ma = For å publisere treng du ma (lokal køyretid) installert. Han koplar ego til IPFS/IPNS på dine vegner.
help-publish-steps = Steg: køyr '.my.ma:discover' for å oppdage din lokale ma, deretter '.my.identity:publish @ma'.
help-publish-without = Utan publisering kan ikkje andre nå deg — sjølv om dei kjenner din DID, kan dei ikkje løyse opp endepunktet ditt.
