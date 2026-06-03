# zion — Dansk
lang-name = Dansk

# ── Loginside ─────────────────────────────────────────────────────────────
tab-login = log ind
tab-new-identity = ny identitet
tab-import = importér
label-passphrase = adgangssætning
label-username = brugernavn
label-confirm-passphrase = bekræft adgangssætning
btn-login = log ind
btn-export = eksportér
btn-generate = generér
passphrase-warning = Mistet adgangssætning = mistet identitet. Der er ingen gendannelse.
import-help = Vælg en eksporteret .zion.json-fil. Pakken forbliver krypteret.
status-unlocking = låser op...
status-generating = genererer identitet...
status-reading-file = læser fil...
status-imported = importerede '{ $name }' — skift til Login-fanen
error-wrong-passphrase = forkert adgangssætning: { $e }
error-identity-not-found = identiteten '{ $name }' blev ikke fundet
error-username-required = brugernavn er påkrævet
error-passphrase-required = adgangssætning er påkrævet
error-passphrases-no-match = adgangssætninger stemmer ikke overens

# ── Terminalsystemmeddelelser ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logget ind som { $username }
msg-type-help = Skriv .help for en liste over kommandoer.
msg-connecting = opretter forbindelse til iroh...
msg-iroh-ready = iroh-slutpunkt klar
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Identitet ikke fundet online — kør '.my.identity:publish @ma' for at blive tilgængelig.
msg-blocked = ⊗ blokeret [{ $cap }]: { $from }
msg-focus-cleared = fokus ryddet
msg-focusing = fokuserer { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = slettede { $path } ({ $count } poster)
msg-read-only = { $path } er skrivebeskyttet
msg-subtree-set = { $path } er et undertræ; nægter at angive
msg-ancestor-leaf = et forfader til { $path } er et blad; nægter at skygge
msg-key-not-found = nøgle ikke fundet: { $path }
msg-no-match = ingen match
msg-link-not-connected = linkhentningsfejl: ikke forbundet
msg-link-fetch-error = linkhentningsfejl: { $e }
msg-link-key-not-found = nøglen `{ $key }` ikke fundet i linket dokument

# ── Aliasvalidering ───────────────────────────────────────────────────────
err-alias-name-empty = aliasnavn kan ikke være tomt
err-alias-has-dot = aliasnavn kan ikke indeholde '.'
err-alias-has-fragment = aliasnavn kan ikke indeholde '#'
err-alias-value-fragment = aliasværdi skal være bart did:ma:<ipns> (intet fragment)
err-alias-value-path = aliasværdi skal være bart did:ma:<ipns> (ingen sti)
err-alias-not-did = aliasværdi skal starte med did:ma:
err-unknown-alias = ukendt alias: @{ $name }
err-bare-did = forventede bart did:ma:<ipns> (intet fragment eller sti), fik { $did }

# ── Redaktør ──────────────────────────────────────────────────────────────
btn-save = Gem
btn-eval = Kør
btn-cancel = Annullér
btn-close = Luk
btn-reply = Svar
btn-publish = Publicér
btn-publish-ipld = Publicér IPLD
msg-reply-sent = svar sendt
msg-reply-failed = svar mislykkedes: { $e }
msg-entity-publish-sent = entitet { $name }: publicering sendt
msg-entity-publish-failed = entitetspublicering mislykkedes: { $e }
msg-kind-publish-failed = type-publicering mislykkedes: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publicering sendt
msg-field-publish-failed = feltpublicering mislykkedes: { $e }
msg-acl-publish-sent = runtime ACL: publicering sendt
msg-crud-edit-publish-sent = { $path }: publicering sendt
msg-acl-publish-failed = runtime ACL-publicering mislykkedes: { $e }
msg-yaml-error = YAML-fejl: { $e }
msg-editor-saved = { $path }:gem
msg-fetch-review = hentede { $cid } — gennemgå inden kørsel
msg-fetch-failed = hentning { $cid }: { $e }

# ── Verb — indbakke ───────────────────────────────────────────────────────
inbox-empty = indbakken er tom
inbox-entry-not-found = indbakkepost { $n } ikke fundet
inbox-no-message-id = indbakkepost { $n } har ingen message_id
inbox-no-verb = intet verb `{ $verb }` for indbakkepost { $n }

# ── Verb — kørselstid ─────────────────────────────────────────────────────
discover-fetch-failed = opdagelse mislykkedes ved { $url }: { $e }
discover-json-error = opdagelse mislykkedes: ugyldigt JSON fra { $url }: { $e }
discover-missing-did = opdagelse mislykkedes: status.json mangler påkrævet felt `did`
discover-invalid-did = opdagelse mislykkedes: forventede `did` starter med did:ma:, fik `{ $did }`
discover-no-endpoint = opdagelsesadvarsel: `endpoint_id` mangler i status.json; gemte kun DID
discover-success = ma opdaget ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma oprettet — publicér med: .my.identity:publish @ma
claim-success = Kørselstid gjort krav på for { $did }
claim-conflict = Kørselstid allerede gjort krav på af en anden identitet
claim-http-failed = krav mislykkedes: HTTP { $status }
claim-error = krav mislykkedes: { $e }
claim-no-session = ikke logget ind; log ind først for at gøre krav på kørselstiden
runtime-no-verb = intet verb `{ $verb }` for { $path }

# ── Verb — adgangskontrol ─────────────────────────────────────────────────
acl-reset = .my.acl nulstillet (fuldt åben)
acl-persist-error = gemningsfejl: { $e }
acl-no-verb = intet verb `{ $verb }` for .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = brug: .my.identity:publish <did-eller-alias>

# ── Verb — dokumenter ────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tom
doc-save-first = { $path }.content er tom — gem først
doc-missing-name = manglende dokumentnavn
doc-publish-usage = brug: .my.doc.<navn>:publish <udgiver>
doc-publish-ipld-usage = brug: .my.doc.<navn>:publish-ipld <udgiver>
doc-publish-failed = publicering { $path }: { $e }
doc-publish-ipld-failed = ipld-publicering { $path }: { $e }
doc-store-sent = lagringsanmodning sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsanmodning sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-fetch-done = hentede { $cid } → { $path }.content (ikke udført)
doc-fetch-failed = hentning { $cid }: { $e }
doc-fetch-usage = brug: .my.doc.<navn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikke angivet
doc-no-verb = intet verb `{ $verb }` for { $path }
path-no-verb = intet verb `{ $verb }` for { $path }

# ── Hjælpetekst — overskrifter ────────────────────────────────────────────
help-header-zion = ── zion-kommandoer ────────────────────────────────────────────────────────
help-header-messaging = ── beskeder ─────────────────────────────────────────────────────────────
help-header-focus = ── fokustilstand ─────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurationsgrammatik ──────────────────────────────────────
help-header-common = ── almindelige stier ─────────────────────────────────────────────────────
help-header-inbox = ── indbakke ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumenter ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjælpetekst — zion-kommandoer ─────────────────────────────────────────
help-cmd-help =   .help                        denne tekst
help-cmd-clear =   .clear                       ryd terminalen
help-cmd-panic =   .panic                       sidste udvej — brug hvis du er i problemer
help-cmd-history =   .history                     kommandohistorik (efterfølgende dubletter slås sammen)
help-cmd-logout =   .logout                      log ud

# ── Hjælpetekst — beskeder ────────────────────────────────────────────────
help-msg-echo =   @alias                       vis løst DID (ingen besked sendt)
help-msg-send =   @alias[:verb] body           send besked / RPC til aktør
help-msg-fragment =   @alias#fragment[:verb] body  send til alias med eksplicit DID-fragment
help-msg-escape =   \@name                       bogstavelig @name (ingen alias-søgning)

# ── Hjælpetekst — fokustilstand ───────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokusér på aktør (ændrer prompt)
help-focus-clear =   .use                         ryd fokus

# ── Hjælpetekst — konfigurationsgrammatik ────────────────────────────────
help-config-get =   .path                        hent bladværdi eller list undertræ
help-config-filter =   .path value                  søgefilter (filtrer efter værdi)
help-config-set =   .path: value                 angiv blad
help-config-delete =   .path:                       slet blad eller undertræ
help-config-verb =   .path:verb [args]            kør lokalt verb

# ── Hjælpetekst — almindelige stier ──────────────────────────────────────
help-my =   .my                          vis al personlig konfiguration
help-aliases =   .my.aliases                  list aliaser
help-aliases-set =   .my.aliases.<name>: <did>    tilføj/opdater alias (bart DID, intet #fragment)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .my.ma:discover          opdagé lokal kørselstid og opret @ma-alias
help-runtime-claim =   .my.ma:claim             gør krav på kørselstid med din DID
help-identity =   .my.identity                 vis identitetskonfiguration
help-identity-did =   .my.identity.did             vis eget DID (skrivebeskyttet)
help-identity-publish =   .my.identity:publish @pub    publicér eget DID via udgiver-tjeneste
help-config-path =   .config                      vis alle .config.*-poster

# ── Hjælpetekst — indbakke ────────────────────────────────────────────────
help-inbox =   .my.inbox                    list indbakke (undertræsvisning)
help-inbox-n =   .my.inbox.N                  vis post N's felter
help-inbox-from =   .my.inbox.N.from             afsender-DID for post N
help-inbox-reply =   .my.inbox.N:reply [body]     send svar (åbner redaktør uden body)
help-inbox-open =   .my.inbox.N:open             åbn indhold i skrivebeskyttet redaktør
help-inbox-del =   .my.inbox.N:                 slet post N
help-inbox-delall =   .my.inbox:                   slet alle indbakkeposter
help-inbox-flush =   .my.inbox:flush              udskriv alle poster til terminalen
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traversér afsenderens DID-dokument latenst

# ── Hjælpetekst — dokumenter ──────────────────────────────────────────────
help-doc-edit =   .my.doc.<navn>:edit           åbn redaktør med gemt indhold
help-doc-edit-cid =   .my.doc.<navn>:edit <cid>     hent CID, åbn til gennemgang
help-doc-eval =   .my.doc.<navn>:eval           kør gemt indhold linje for linje
help-doc-publish =   .my.doc.<navn>:publish @pub   lagr som rå blob (alle typer)
help-doc-publish-ipld =   .my.doc.<navn>:publish-ipld @pub  lagr YAML som struktureret DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<navn>:fetch <cid>    importér CID-indhold (ingen kørsel)
help-doc-cid =   .my.doc.<navn>:cid            vis gemt CID
help-doc-del =   .my.doc.<navn>:              slet dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tilgængelige sprog (indstil med .my.i18n: <code>):
err-lang-not-found = sproget ikke fundet: { $lang }

msg-send-failed = afsendelse mislykkedes: { $e }
msg-not-logged-in = ikke logget ind

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-parsefejl: { $e }
yaml-not-mapping = YAML skal være et mapping (nøgle: værdi-par); ren tekst og skalarer kan ikke lagres som DAG-CBOR
dagcbor-encode-error = DAG-CBOR-koderingsfejl: { $e }
cbor-decode-error = CBOR-dekoderingsfejl: { $e }
cbor-json-error = CBOR til JSON-fejl: { $e }
yaml-serialize-error = YAML-serializeringsfejl: { $e }
edit-reply-invalid = Ugyldig redigeringssvar
doc-publish-ipld-error = IPLD-publicering mislykkedes: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Indbakke-beskæring gem-fejl: { $e }
err-config-load = Konfigurationsindlæsningsfejl: { $e }
err-lang-persist = Sproglagringsfejl: { $e }
err-history-parse = Historieparsefejl: { $e }
err-history-load = Historieindlæsningsfejl: { $e }
err-ipfs-reply-decode = IPFS-svar-dekoderingsfejl: { $e }
err-edit-cbor = CBOR-redigeringsfejl: { $e }
err-popup-blocked = Pop-up blokeret af browser
status-publishing = udgiver

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = fejl
rpc-error-detail = fejl: { $detail }
msg-new-message = ← [{ $from }] ny besked — { $count } i indbakken
msg-chat = { $sender } siger { $body }
err-edit-decode-failed = redigering: afkodningsfejl: { $e }
err-edit-fetch-failed = redigering: hentningsfejl: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv session — profilen kan ikke slettes
profile-delete-error = sletning af profil mislykkedes: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ingen)
profiles-deleted = profil { $name } slettet
profiles-not-found = profil ikke fundet: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    åbn zion via et URL-link
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
help-header-url = ── URL-parametre ───────────────────────────────────────────────────────────
help-url-intro =   Del et link der åbner zion med forudfyldt modtager:
help-url-msg =   ?msg=<did>                   udfylder: @<did> (tekstbesked)
help-url-say =   ?say=<did>                   udfylder: @<did>:say (sig-verb)
help-url-emote =   ?emote=<did>                 udfylder: @<did>:emote (emote-verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Inputfeltet udfyldes men sendes ikke — tryk Enter for at sende.
