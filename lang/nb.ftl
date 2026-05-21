# zion — Norsk bokmål

# ── Landingsside ──────────────────────────────────────────────────────────
tab-login = logg inn
tab-new-identity = ny identitet
tab-import = importer
label-passphrase = passfrase
label-username = brukernavn
label-confirm-passphrase = bekreft passfrase
btn-login = logg inn
btn-export = eksporter
btn-generate = generer
passphrase-warning = Mistet passfrase = mistet identitet. Det finnes ingen gjenoppretting.
import-help = Velg en eksportert .zion.json-fil. Pakken forblir kryptert.
status-unlocking = låser opp...
status-generating = genererer identitet...
status-reading-file = leser fil...
status-imported = importerte '{ $name }' — bytt til Logg inn-fanen
error-wrong-passphrase = feil passfrase: { $e }
error-identity-not-found = identiteten '{ $name }' finnes ikke
error-username-required = brukernavn påkrevd
error-passphrase-required = passfrase påkrevd
error-passphrases-no-match = passfraser stemmer ikke overens

# ── Terminal-systemmeldinger ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logget inn som { $username }
msg-type-help = Skriv .help for en liste over kommandoer.
msg-connecting = kobler til iroh...
msg-iroh-ready = iroh-endepunkt klart
msg-iroh-failed = iroh: { $e }
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
err-alias-has-fragment = aliasnavn kan ikke inneholde '#'
err-alias-value-fragment = aliasverdi må være en enkel did:ma:<ipns> (ingen fragment)
err-alias-value-path = aliasverdi må være en enkel did:ma:<ipns> (ingen sti)
err-alias-not-did = aliasverdi må starte med did:ma:
err-unknown-alias = ukjent alias: @{ $name }
err-bare-did = forventet enkel did:ma:<ipns> (ingen fragment eller sti), fikk { $did }

# ── Redaktør ──────────────────────────────────────────────────────────────
btn-save = Lagre
btn-eval = Kjør
btn-cancel = Avbryt
btn-close = Lukk
btn-reply = Svar
btn-publish = Publiser
msg-reply-sent = svar sendt
msg-reply-failed = svaret feilet: { $e }
msg-entity-publish-sent = entitet { $name }: publisering sendt
msg-entity-publish-failed = entitetspublisering feilet: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publisering sendt
msg-field-publish-failed = feltpublisering feilet: { $e }
msg-yaml-error = YAML-feil: { $e }
msg-editor-saved = { $path }:lagre
msg-fetch-review = hentet { $cid } — gjennomgå før kjøring
msg-fetch-failed = henting { $cid }: { $e }

# ── Verb — innboks ────────────────────────────────────────────────────────
inbox-empty = innboksen er tom
inbox-entry-not-found = innboksoppføring { $n } ikke funnet
inbox-no-message-id = innboksoppføring { $n } har ingen message_id
inbox-no-verb = intet verb `{ $verb }` for innboksoppføring { $n }

# ── Verb — kjøretid ───────────────────────────────────────────────────────
discover-fetch-failed = oppdagelse feilet ved { $url }: { $e }
discover-json-error = oppdagelse feilet: ugyldig JSON fra { $url }: { $e }
discover-missing-did = oppdagelse feilet: status.json mangler påkrevd felt `did`
discover-invalid-did = oppdagelse feilet: forventet `did` å starte med did:ma:, fikk `{ $did }`
discover-no-endpoint = oppdagelsesadvarsel: `endpoint_id` mangler i status.json; lagret kun DID
discover-success = ma oppdaget ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 opprettet — publiser med: .my.identity:publish @間
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
publish-usage = bruk: .my.identity:publish <did-eller-alias>

# ── Verb — dokumenter ────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tom
doc-save-first = { $path }.content er tom — lagre først
doc-missing-name = manglende dokumentnavn
doc-publish-usage = bruk: .my.documents.<navn>:publish <utgiver>
doc-publish-ipld-usage = bruk: .my.documents.<navn>:publish-ipld <utgiver>
doc-publish-failed = publisering { $path }: { $e }
doc-publish-ipld-failed = ipld-publisering { $path }: { $e }
doc-store-sent = lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsforespørsel sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-fetch-done = hentet { $cid } → { $path }.content (ikke kjørt)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = bruk: .my.documents.<navn>:fetch <cid>
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
help-header-documents = ── dokumenter ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjelpetekst — zion-kommandoer ─────────────────────────────────────────
help-cmd-help =   .help                        denne teksten
help-cmd-clear =   .clear                       tøm terminalen
help-cmd-panic =   .panic                       siste utvei — bruk hvis du er i en vanskelig situasjon
help-cmd-logout =   .logout                      logg ut

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
help-config-verb =   .path:verb [args]             kjør lokalt verb

# ── Hjelpetekst — vanlige stier ───────────────────────────────────────────
help-my =   .my                          vis all personlig konfigurasjon
help-aliases =   .my.aliases                  list aliaser
help-aliases-set =   .my.aliases.<name>: <did>    legg til/oppdater alias (enkel DID, ingen #fragment)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .my.runtime:discover          oppdag lokal kjøretid og opprett @間-alias
help-runtime-claim =   .my.runtime:claim             gjør krav på kjøretid med din DID
help-identity =   .my.identity                 vis identitetskonfigurasjon
help-identity-did =   .my.identity.did             vis egen DID (skrivebeskyttet)
help-identity-publish =   .my.identity:publish @pub    publiser egen DID via utgiver-tjeneste
help-config-path =   .config                      vis alle .config.*-oppføringer

# ── Hjelpetekst — innboks ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    list innboks (undertre-visning)
help-inbox-n =   .my.inbox.N                  vis oppføring N sine felt
help-inbox-from =   .my.inbox.N.from             avsender-DID for oppføring N
help-inbox-reply =   .my.inbox.N:reply [body]     send svar (åpner redaktør uten body)
help-inbox-open =   .my.inbox.N:open             åpne innholdet i skrivebeskyttet redaktør
help-inbox-del =   .my.inbox.N:                 slett oppføring N
help-inbox-delall =   .my.inbox:                   slett alle innboksoppføringer
help-inbox-flush =   .my.inbox:flush              skriv alle oppføringer til terminal
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traverser avsenderens DID-dokument lat

# ── Hjelpetekst — dokumenter ──────────────────────────────────────────────
help-doc-edit =   .my.documents.<navn>:edit           åpne redaktør med lagret innhold
help-doc-edit-cid =   .my.documents.<navn>:edit <cid>     hent CID, åpne for gjennomgang
help-doc-eval =   .my.documents.<navn>:eval           kjør lagret innhold linje for linje
help-doc-publish =   .my.documents.<navn>:publish @pub   lagre som rå blob (alle typer)
help-doc-publish-ipld =   .my.documents.<navn>:publish-ipld @pub  lagre YAML som strukturert DAG-CBOR IPLD-node
help-doc-fetch =   .my.documents.<navn>:fetch <cid>    importer CID-innhold (ingen kjøring)
help-doc-cid =   .my.documents.<navn>:cid            vis lagret CID
help-doc-del =   .my.documents.<navn>:              slett dokument
