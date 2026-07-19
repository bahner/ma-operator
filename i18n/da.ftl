# zion — Dansk
lang-name = Dansk

# ── Loginside ─────────────────────────────────────────────────────────────
tab-login = log ind
tab-new-identity = ny identitet
tab-import-profile = importer profil
label-passphrase = adgangssætning
label-username = brugernavn
label-confirm-passphrase = bekræft adgangssætning
label-did = DID
label-profile-cid = profil-CID
label-or-file = eller fil
btn-login = log ind
btn-export = eksportér
btn-generate = generér
btn-new-endpoint = nyt slutpunkt
btn-import-profile = importer profil
passphrase-warning = Mistet adgangssætning = mistet identitet. Der er ingen gendannelse.
import-profile-help = Importer en profil via CID eller fil. Du skal bruge den samme adgangssætning, der blev brugt ved publicering.
import-profile-detected-user = Profilen tilhører: { $name }
status-unlocking = låser op...
status-generating = genererer identitet...
status-reading-file = læser fil...
status-fetching-profile = henter profil fra IPFS...
status-imported = importerede '{ $name }' — skift til Login-fanen
status-importing-profile = importerer profil...
profile-import-done = profil importeret for '{ $name }' — { $n } nøgler indlæst
error-wrong-passphrase = forkert adgangssætning: { $e }
error-identity-not-found = identiteten '{ $name }' blev ikke fundet
error-username-required = brugernavn er påkrævet
error-passphrase-required = adgangssætning er påkrævet
error-passphrases-no-match = adgangssætninger stemmer ikke overens
error-profile-source-required = angiv et CID eller upload en fil
error-did-required = angiv dit DID
error-profile-fetch = kunne ikke hente profil: { $e }
error-profile-no-username = profilen indeholder ikke et brugernavn
error-profile-no-identity = identiteten '{ $name }' ikke fundet — importer identitet først

# ── Terminalsystemmeddelelser ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logget ind som { $username }
msg-type-help = Skriv .help for en liste over kommandoer.
msg-connecting = opretter forbindelse til iroh...
msg-iroh-ready = iroh-slutpunkt klar
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID offentliggjort via lokal ma ({ $url })
msg-ma-connecting-matrix = forsøger at forbinde dig til 間trix
msg-local-ma-claimed = lokal 間 gjort krav på
msg-local-ma-already-claimed = lokal 間 er allerede gjort krav på
msg-local-ma-claim-failed = kunne ikke gøre krav på lokal 間
msg-identity-not-published = Identitet ikke fundet online — har du ma installeret lokalt, kør '.ma [port]' og derefter '.my.identity!publish @ma'. Skriv '.help/publish' for detaljer.
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
err-alias-value-fragment = aliasværdi må højst indeholde ét ikke-tomt DID-URL-fragment
err-alias-value-path = aliasværdi skal være en did:ma:<ipns> DID eller DID-URL (ingen sti)
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
inbox-filter-no-arg = filter kræver et DID- eller aliasargument
inbox-filter-empty = ingen beskeder fra { $did }

# ── Verb — kørselstid ─────────────────────────────────────────────────────
discover-fetch-failed = opdagelse mislykkedes ved { $url }: { $e }
discover-json-error = opdagelse mislykkedes: ugyldigt JSON fra { $url }: { $e }
discover-missing-did = opdagelse mislykkedes: status.json mangler påkrævet felt `did`
discover-invalid-did = opdagelse mislykkedes: forventede `did` starter med did:ma:, fik `{ $did }`
discover-no-endpoint = opdagelsesadvarsel: `endpoint_id` mangler i status.json; gemte kun DID
discover-hint-endpoint-not-found = Hint: slutpunktet blev ikke fundet. Tjek at `ma` kører og eksponerer /status.json på port 5003.
discover-hint-server-error = Hint: runtime svarede med serverfejl. Tjek `ma`-loggene og prøv igen.
discover-hint-network = Hint: netværks-/forbindelsesproblem. Start `ma`, tjek at localhost:5003 kan nås, og tillad lokal HTTP-adgang i browseren.
discover-hint-generic = Hint: tjek at `ma` og IPFS Desktop kører, og prøv `.ma` igen.
discover-success = ma opdaget ved { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma oprettet — kør '.my.identity!publish @ma' for at udgive din identitet.
claim-success = Kørselstid gjort krav på for { $did }
claim-conflict = Kørselstid allerede gjort krav på af en anden identitet
claim-already-owned = Runtime er allerede gjort krav på af denne identitet
claim-http-failed = krav mislykkedes: HTTP { $status }
claim-error = krav mislykkedes: { $e }
claim-no-session = ikke logget ind; log ind først for at gøre krav på kørselstiden
runtime-no-verb = intet verb `{ $verb }` for { $path }

# ── Verb — adgangskontrol ─────────────────────────────────────────────────
acl-reset = .my.acl nulstillet (fuldt åben)
acl-persist-error = gemningsfejl: { $e }
acl-no-verb = intet verb `{ $verb }` for .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = brug: .my.identity!publish <did-eller-alias>
identity-exported = Pakke hentet som { $filename }
identity-export-failed = Eksport mislykkedes: { $e }

# ── Verb — dokumenter ────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tom
doc-save-first = { $path }.content er tom — gem først
doc-missing-name = manglende dokumentnavn
doc-publish-usage = brug: .my.doc.<navn>!publish <udgiver>
doc-publish-ipld-usage = brug: .my.doc.<navn>!publish-ipld <udgiver>
doc-publish-failed = publicering { $path }: { $e }
doc-publish-ipld-failed = ipld-publicering { $path }: { $e }
doc-publish-error-detail = publicering mislykkedes [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = log ind igen, så ego kan få adgang til dine identitetsnøgler
doc-publish-hint-target = brug en gyldig udgiver-DID eller et alias der løses til en ren did:ma:<ipns>
doc-publish-hint-network = tjek at ma-runtime og IPFS kan nås, og prøv igen
doc-publish-hint-resolve = tjek at udgiverens DID-dokument er publiceret og indeholder et tilgængeligt slutpunkt
doc-publish-hint-acl = bed udgiveroperatøren om at tillade din DID i ACL
doc-publish-hint-runtime = runtime/plugin afviste anmodningen; læs årsagen og prøv igen efter rettelse af entitet/runtime
doc-publish-hint-ipfs = tjek lokal Kubo/IPFS-sundhed og udgiver-runtime-status
doc-publish-hint-unknown = se runtime-loggene for detaljeret årsag og prøv igen
doc-store-sent = lagringsanmodning sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsanmodning sendt ({ $id }) → { $publisher }; CID ankommer via RPC-svar
doc-fetch-done = hentede { $cid } → { $path }.content (ikke udført)
doc-fetch-failed = hentning { $cid }: { $e }
doc-fetch-usage = brug: .my.doc.<navn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikke angivet
doc-no-verb = intet verb `{ $verb }` for { $path }
path-no-verb = intet verb `{ $verb }` for { $path }

# ── Hjælpetekst — overskrifter ────────────────────────────────────────────
help-header-zion = ── zion-kommandoer ────────────────────────────────────────────────────────
help-header-messaging = ── beskeder ─────────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurationsgrammatik ──────────────────────────────────────
help-header-common = ── almindelige stier ─────────────────────────────────────────────────────
help-header-inbox = ── indbakke ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumenter ───────────────────────────────────────────────────────────
help-header-i18n = ── sprog ────────────────────────────── ───────────────────────────────
help-header-ma = ── 3-mellemrum ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── ind i 間-rummet ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjælpetekst — zion-kommandoer ─────────────────────────────────────────
help-cmd-help =   .help                        denne tekst
help-cmd-clear =   .clear                       ryd terminalen
help-cmd-panic =   .panic                       sidste udvej — brug hvis du er i problemer
help-cmd-history =   .history                     kommandohistorik (efterfølgende dubletter slås sammen)
help-cmd-logout =   .logout                      log ud
help-cmd-batch =   .batch                       evaluer kladdedokument parallelt
help-cmd-batch-sync =   .batch:sync / .batch         evaluer kladdedokument linje for linje

# ── Hjælpetekst — beskeder ────────────────────────────────────────────────
help-msg-echo =   @alias                       vis løst DID/DID-URL (ingen besked sendt)
help-msg-send =   @alias!msg body / @alias:verb args           send besked / RPC til aktør
help-msg-fragment =   @alias#fragment:verb body  send til alias med eksplicit DID-fragment
help-msg-escape =   \@name                       bogstavelig @name (ingen alias-søgning)

# ── Hjælpetekst — fokustilstand ───────────────────────────────────────────

# ── Hjælpetekst — konfigurationsgrammatik ────────────────────────────────
help-config-get =   .path                        hent bladværdi eller list undertræ
help-config-filter =   .path value                  søgefilter (filtrer efter værdi)
help-config-set =   .path: value                 angiv blad
help-config-delete =   .path:                       slet blad eller undertræ
help-config-verb =   .path!verb [args]            kør lokalt verb

# ── Hjælpetekst — almindelige stier ──────────────────────────────────────
help-my =   .my                          vis al personlig konfiguration
help-aliases =   .my.aliases                  list aliaser
help-aliases-set =   .my.aliases.<name>: <did-url>    tilføj/opdater alias (DID eller DID-URL)
help-aliases-del =   .my.aliases.<name>:          fjern alias
help-runtime-discover =   .ma [port]          opdagé lokal kørselstid og opret @ma-alias
help-runtime-claim =   .ma [port]             gør krav på kørselstid med din DID
help-identity =   .my.identity                 vis identitetskonfiguration
help-identity-did =   .my.identity.did             vis eget DID (skrivebeskyttet)
help-identity-publish =   .my.identity!publish @pub    publicér eget DID via udgiver-tjeneste
help-identity-export =   .my.identity!export          hent eget identitetspakke
help-config-path =   .config                      vis alle .config.*-poster

# ── Hjælpetekst — indbakke ────────────────────────────────────────────────
help-inbox =   .my.inbox                    list indbakke (undertræsvisning)
help-inbox-n =   .my.inbox.N                  vis post N's felter
help-inbox-from =   .my.inbox.N.from             afsender-DID for post N
help-inbox-reply =   .my.inbox.N!reply [body]     send svar (åbner redaktør uden body)
help-inbox-open =   .my.inbox.N!open             åbn indhold i skrivebeskyttet redaktør
help-inbox-del =   .my.inbox.N:                 slet post N
help-inbox-delall =   .my.inbox:                   slet alle indbakkeposter
help-inbox-flush =   .my.inbox!flush              udskriv alle poster til terminalen
help-inbox-filter =   .my.inbox!filter @who        vis kun poster fra @who
help-inbox-traverse =   .my.inbox.N.sender.<felt>   traversér afsenderens DID-dokument latenst

# ── Hjælpetekst — dokumenter ──────────────────────────────────────────────
help-doc-edit =   .my.doc.<navn>!edit           åbn redaktør med gemt indhold
help-doc-edit-cid =   .my.doc.<navn>!edit /ipfs/<cid>     hent CID, åbn til gennemgang
help-doc-eval =   .my.doc.<navn>!eval           kør gemt indhold linje for linje
help-doc-publish =   .my.doc.<navn>!publish @pub   lagr som rå blob (alle typer)
help-doc-publish-ipld =   .my.doc.<navn>!publish-ipld @pub  lagr YAML som struktureret DAG-CBOR IPLD-node
help-doc-fetch =   .my.doc.<navn>!fetch /ipfs/<cid>    importér CID-indhold (ingen kørsel)
help-doc-cid =   .my.doc.<navn>!cid            vis gemt CID
help-doc-del =   .my.doc.<navn>:              slet dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n gemmer sprogpræferencen knyttet til din identitet.
help-i18n-set = .my.i18n: <code>             vælg det sprog, 20 bruger til denne identitet
help-i18n-list = .my.i18n!list               liste tilgængelige sprogkoder

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-rummet er rummet mellem 間-identiteter. ma sørger for, at identiteterne kan finde hinanden og kommunikere; når din identitet er publiceret, kan du deltage.
help-ma-command =   .ma [port]                   forbind til din lokale ma-runtime, læs /status.json, og gem .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publicer dit DID-dokument, så andre kan finde dine nøgler og dit endpoint
help-ma-security = Den tydeligste tillidsgrænse er din egen ma-runtime med din egen IPFS Desktop/Kubo. En fjern publisher kan være nyttig, men så er du afhængig af en andens tjeneste.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hvordan du går ind i 間-rummet

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Når din identitet er kendt, lader .enter @ma dig træde ind i 間. Find en verden, gå ind i den, og deltag derfra.
help-ma-entry-steps = Start IPFS Desktop og ma, kør derefter .ma. Publicer med .my.identity!publish @ma, find en verden, og gå ind med .enter @ma.
help-ma-entry-command =   .enter @ma                  træd ind i 間 gennem @ma-runtime
help-ma-entry-toggle =   .enter                       slå rumfokus til eller fra; din identitet forbliver aktiv
help-ma-entry-url =   ?enter=<runtime>             gå ind efter login fra en delt URL

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

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } siger { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } træder ind.
room-leave = * { $name } forlader rummet.
room-drop  = * { $name } taber { $thing }.
room-take  = * { $name } samler { $thing } op.
err-edit-decode-failed = redigering: afkodningsfejl: { $e }
err-edit-fetch-failed = redigering: hentningsfejl: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv session — profilen kan ikke slettes
profile-delete-error = sletning af profil mislykkedes: { $e }
profile-wrong-user = kan ikke indstille 11 til en anden profil - kun din egen
profile-wrong-user-name = kan ikke indstille 11 til 19 — kun din egen profil
profile-no-ma = ingen 3 runtime konfigureret — kør 31 først
profile-no-cid = ingen 3 gemt for denne profil — kør 37 først
profile-no-cid-in-doc = ingen profil 11 fundet i DID-dokumentet — kør 43 først
profile-publish-sent = profilen er krypteret og sendt til IPFS; DID-dokumentet opdateres, når CID kommer
profile-publish-done = profilen er publiceret — DID-dokumentet er opdateret med ma.agent-CID
profile-publish-failed = profiludgivelse mislykkedes: 24
profile-fetch-done = profil hentet — 18 nøgler indlæst fra 43
profile-fetch-failed = profilhentning mislykkedes: 22
msg-identity-exists = identitet allerede offentliggjort — profilen er opdateret
profile-import-exists = profilen 8 eksisterer allerede - slet den først
profile-import-wrong-user = fil indeholder profil 22, forventet 42

# -- CID content operations
cid-op-binary = binært indhold (ikke vist)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = kunne ikke hente indhold: 25
cid-op-unknown = ukendt indholdsoperation: 27
cid-op-wc = { $lines } linjer 18 ord 36 tegn
profiles-empty = (ingen)
profiles-deleted = profil { $name } slettet
profiles-not-found = profil ikke fundet: { $name }

# -- Help topics index
help-header-topics = -- emner -- skriv .help/<topic> for detaljer
help-topic-msg =   .help/msg                    beskeder
help-topic-ma = .help/ma                     ma-mellemrum, udgivelse og indtastning
help-topic-path = .help/path                   lokal prik-sti grammatik
help-topic-my =   .help/my                     personlig config
help-topic-inbox =   .help/inbox                  indbakke
help-topic-doc =   .help/doc                    dokumenter
help-topic-actor =   .help/actor                  fjern actor
help-topic-url =   .help/url                    åbn zion via et URL-link
help-topic-i18n = .help/i18n                   sprogpræference for din identitet
help-unknown-topic =   .help/{ $topic }: ukendt emne

# -- Help actor section
help-header-actor = -- fjernaktører
help-actor-echo =   @actor                       vis opløst DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         send direkte/chat/emote besked
help-actor-ping = @actor:ping                  livlighed ping
help-actor-entities =   @actor/entities              vis entiteter
help-actor-entities-get = @actor/entities/<n>          få enhedsknudepunkt
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   sæt entitet ved 14 reference
help-actor-entities-edit =   @actor/entities/<n>!edit     rediger entitet
help-actor-entities-del = @actor/entities/<n>:         slette enhed
help-actor-config-get =   @actor/config/<key>          hent config-værdi
help-actor-config-set =   @actor/config/<key>: val     sæt config-værdi
help-actor-acl = @actor/acl                   få 4
help-actor-acl-edit =   @actor/acl!edit              rediger ACL
help-actor-fragment =   @actor#entity                send til plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC til plugin
help-header-cid-ops = ── 3 skuespillerkalder ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  ring til en enhed 15 fra 24 og afvent dens svar
help-actor-head = (@actor/path)                hent eksternt CRUD-indhold fra 31
help-actor-tail = (<bafy...>)                  inkludere og evaluere 21 fra en 36 41
help-actor-wc = (define x (@actor:verb arg))  behold 5-svar i sessionsmiljøet
help-actor-wc-l = .my.scheme.ma!edit           rediger gemte 11 hjælpere til denne identitet
help-header-url = ── URL-parametre ───────────────────────────────────────────────────────────
help-url-intro =   Del et link der åbner zion med forudfyldt modtager:
help-url-msg =   ?msg=<did>                   udfylder: @<did>!msg (tekstbesked)
help-url-say =   ?say=<did>                   udfylder: @<did>!say (sig-verb)
help-url-emote =   ?emote=<did>                 udfylder: @<did>!emote (emote-verb)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / 23 URL
help-url-enter = ?enter=<runtime>             indtast runtime-verden efter login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Inputfeltet udfyldes men sendes ikke — tryk Enter for at sende.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                udgiv din identitet til netværket
help-header-publish = ── udgiv identitet ──────────────────────────────────────────────────────────
help-publish-intro = Udgivelse gør din identitet synlig på netværket. Andre kan slå dit DID op for at nå dig.
help-publish-ma = For at udgive skal du have ma (lokal kørselstid) installeret. Det forbinder ego med IPFS/IPNS på dine vegne.
help-publish-steps = Trin: kør '.ma [port]' for at opdage din lokale ma, derefter '.my.identity!publish @ma'.
help-publish-without = Uden udgivelse kan andre ikke nå dig — selv om de kender dit DID, kan de ikke opløse dit endepunkt.
profile-fetch-did-resolve-failed = ER ikke offentliggjort endnu — kør først 28, derefter 67 din profil
profile-update-done = profil opdateret — 18-nøgler fusioneret fra 43
profile-delete-needs-name = angiv et profilnavn: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Indsamling af batch — skriv kommandoer, afslut med .batch
batch-already-collecting = Samler allerede en batch — afslut med .batch først
batch-empty = Batchen var tom - intet at køre
batch-running = Kører batch…
batch-step-timeout = batch-trin timeout

batch-done = Batch færdig på { $secs }s — { $steps } trin
batch-done-error = Batch færdig med fejl på { $secs }s — { $steps } trin
msg-timeout = Beskeden fik timeout (intet svar på 60s)
err-unknown-command = ukendt kommando: { $path }
err-read-only-path = { $path } er skrivebeskyttet
help-cmd-batch-async =   .batch:async / .batch        evaluer kladdedokument parallelt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Kunne ikke hente CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ugyldigt CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Advarsel: Din private IPNS-nøgle vil blive sendt til dette køretidsmiljø til publicering af identitet. Brug kun et køretidsmiljø, du stoler fuldt ud på.
