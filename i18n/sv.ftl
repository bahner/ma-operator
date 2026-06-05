# zion — Svenska
lang-name = Svenska

# ── Inloggningssida ───────────────────────────────────────────────────────
tab-login = logga in
tab-new-identity = ny identitet
tab-import = importera
label-passphrase = lösenfras
label-username = användarnamn
label-confirm-passphrase = bekräfta lösenfras
btn-login = logga in
btn-export = exportera
btn-generate = generera
btn-new-endpoint = nytt slutpunkt
passphrase-warning = Förlorad lösenfras = förlorad identitet. Det finns ingen återhämtning.
import-help = Välj en exporterad .zion.json-fil. Paketet förblir krypterat.
status-unlocking = låser upp...
status-generating = genererar identitet...
status-reading-file = läser fil...
status-imported = importerade '{ $name }' — byt till fliken Logga in
error-wrong-passphrase = fel lösenfras: { $e }
error-identity-not-found = identiteten '{ $name }' hittades inte
error-username-required = användarnamn krävs
error-passphrase-required = lösenfras krävs
error-passphrases-no-match = lösenfraser matchar inte

# ── Terminalsystemmeddelanden ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — inloggad som { $username }
msg-type-help = Skriv .help för en lista över kommandon.
msg-connecting = ansluter till iroh...
msg-iroh-ready = iroh-slutpunkt redo
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicerat via lokalt ma ({ $url })
msg-identity-not-published = Identitet hittades inte online — om du har ma installerat lokalt, kör '.my.ma:discover' sedan '.my.identity:publish @ma'. Skriv '.help.publish' för detaljer.
msg-blocked = ⊗ blockerad [{ $cap }]: { $from }
msg-focus-cleared = fokus rensat
msg-focusing = fokuserar { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = raderade { $path } ({ $count } poster)
msg-read-only = { $path } är skrivskyddad
msg-subtree-set = { $path } är ett underträd; vägrar ange
msg-ancestor-leaf = ett förfäder till { $path } är ett löv; vägrar skugga
msg-key-not-found = nyckel hittades inte: { $path }
msg-no-match = ingen träff
msg-link-not-connected = länkhämtningsfel: ej ansluten
msg-link-fetch-error = länkhämtningsfel: { $e }
msg-link-key-not-found = nyckeln `{ $key }` hittades inte i länkat dokument

# ── Aliasvalidering ───────────────────────────────────────────────────────
err-alias-name-empty = aliasnamn kan inte vara tomt
err-alias-has-dot = aliasnamn kan inte innehålla '.'
err-alias-has-fragment = aliasnamn kan inte innehålla '#'
err-alias-value-fragment = aliasvärde måste vara bart did:ma:<ipns> (inget fragment)
err-alias-value-path = aliasvärde måste vara bart did:ma:<ipns> (ingen sökväg)
err-alias-not-did = aliasvärde måste börja med did:ma:
err-unknown-alias = okänt alias: @{ $name }
err-bare-did = förväntade bart did:ma:<ipns> (inget fragment eller sökväg), fick { $did }

# ── Redigerare ────────────────────────────────────────────────────────────
btn-save = Spara
btn-eval = Kör
btn-cancel = Avbryt
btn-close = Stäng
btn-reply = Svara
btn-publish = Publicera
btn-publish-ipld = Publicera IPLD
msg-reply-sent = svar skickat
msg-reply-failed = svar misslyckades: { $e }
msg-entity-publish-sent = entitet { $name }: publicering skickad
msg-entity-publish-failed = entitetspublicering misslyckades: { $e }
msg-kind-publish-failed = typens publicering misslyckades: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publicering skickad
msg-field-publish-failed = fältpublicering misslyckades: { $e }
msg-acl-publish-sent = runtime ACL: publicering skickad
msg-crud-edit-publish-sent = { $path }: publicering skickad
msg-acl-publish-failed = runtime ACL-publicering misslyckades: { $e }
msg-yaml-error = YAML-fel: { $e }
msg-editor-saved = { $path }:spara
msg-fetch-review = hämtade { $cid } — granska innan körning
msg-fetch-failed = hämtning { $cid }: { $e }

# ── Verb — inkorg ─────────────────────────────────────────────────────────
inbox-empty = inkorgen är tom
inbox-entry-not-found = inkorgspost { $n } hittades inte
inbox-no-message-id = inkorgspost { $n } saknar message_id
inbox-no-verb = inget verb `{ $verb }` för inkorgspost { $n }
inbox-filter-no-arg = filter kräver ett DID- eller aliasargument
inbox-filter-empty = inga meddelanden från { $did }

# ── Verb — körtid ─────────────────────────────────────────────────────────
discover-fetch-failed = identifiering misslyckades vid { $url }: { $e }
discover-json-error = identifiering misslyckades: ogiltigt JSON från { $url }: { $e }
discover-missing-did = identifiering misslyckades: status.json saknar obligatoriskt fält `did`
discover-invalid-did = identifiering misslyckades: förväntade `did` börja med did:ma:, fick `{ $did }`
discover-no-endpoint = identifieringsvarning: `endpoint_id` saknas i status.json; lagrade enbart DID
discover-success = ma identifierat vid { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma skapat — kör '.my.identity:publish @ma' för att publicera din identitet.
claim-success = Körtid gjord anspråk på för { $did }
claim-conflict = Körtid redan gjord anspråk på av annan identitet
claim-http-failed = anspråk misslyckades: HTTP { $status }
claim-error = anspråk misslyckades: { $e }
claim-no-session = ej inloggad; logga in först för att göra anspråk på körtiden
runtime-no-verb = inget verb `{ $verb }` för { $path }

# ── Verb — åtkomstkontroll ────────────────────────────────────────────────
acl-reset = .my.acl återställd (fullt öppen)
acl-persist-error = sparfel: { $e }
acl-no-verb = inget verb `{ $verb }` för .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = användning: .my.identity:publish <did-eller-alias>
identity-exported = Bundle nedladdat som { $filename }
identity-export-failed = Export misslyckades: { $e }

# ── Verb — dokument ───────────────────────────────────────────────────────
doc-content-empty = { $path }.content är tom
doc-save-first = { $path }.content är tom — spara först
doc-missing-name = dokumentnamn saknas
doc-publish-usage = användning: .my.doc.<namn>:publish <utgivare>
doc-publish-ipld-usage = användning: .my.doc.<namn>:publish-ipld <utgivare>
doc-publish-failed = publicering { $path }: { $e }
doc-publish-ipld-failed = ipld-publicering { $path }: { $e }
doc-store-sent = lagringsförfrågan skickad ({ $id }) → { $publisher }; CID anländer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsförfrågan skickad ({ $id }) → { $publisher }; CID anländer via RPC-svar
doc-fetch-done = hämtade { $cid } → { $path }.content (ej utförd)
doc-fetch-failed = hämtning { $cid }: { $e }
doc-fetch-usage = användning: .my.doc.<namn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid är inte angiven
doc-no-verb = inget verb `{ $verb }` för { $path }
path-no-verb = inget verb `{ $verb }` för { $path }

# ── Hjälptext — rubriker ──────────────────────────────────────────────────
help-header-zion = ── zion-kommandon ─────────────────────────────────────────────────────────
help-header-messaging = ── meddelanden ──────────────────────────────────────────────────────────
help-header-focus = ── fokusläge ────────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurationsgrammatik ─────────────────────────────────────────
help-header-common = ── vanliga sökvägar ──────────────────────────────────────────────────────
help-header-inbox = ── inkorg ───────────────────────────────────────────────────────────────
help-header-documents = ── dokument ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjälptext — zion-kommandon ────────────────────────────────────────────
help-cmd-help =   .help                        denna text
help-cmd-clear =   .clear                       rensa terminalen
help-cmd-panic =   .panic                       sista utvägen — använd om du är i trubbel
help-cmd-history =   .history                     kommandohistorik (på varandra följande dubletter slås samman)
help-cmd-logout =   .logout                      logga ut
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync                  eval scratch document line-by-line (sequential)

# ── Hjälptext — meddelanden ───────────────────────────────────────────────
help-msg-echo =   @alias                       visa löst DID (inget meddelande skickat)
help-msg-send =   @alias[:verb] body           skicka meddelande / RPC till aktör
help-msg-fragment =   @alias#fragment[:verb] body  skicka till alias med explicit DID-fragment
help-msg-escape =   \@name                       bokstavlig @name (ingen alias-sökning)

# ── Hjälptext — fokusläge ─────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokusera på aktör (ändrar prompt)
help-focus-clear =   .use                         rensa fokus

# ── Hjälptext — konfigurationsgrammatik ──────────────────────────────────
help-config-get =   .path                        hämta löv-värde eller lista underträd
help-config-filter =   .path value                  sökfilter (filtrera efter värde)
help-config-set =   .path: value                 ange löv
help-config-delete =   .path:                       radera löv eller underträd
help-config-verb =   .path:verb [args]            kör lokalt verb

# ── Hjälptext — vanliga sökvägar ─────────────────────────────────────────
help-my =   .my                          visa all personlig konfiguration
help-aliases =   .my.aliases                  lista alias
help-aliases-set =   .my.aliases.<name>: <did>    lägg till/uppdatera alias (bart DID, inget #fragment)
help-aliases-del =   .my.aliases.<name>:          ta bort alias
help-runtime-discover =   .my.ma:discover          identifiera lokal körtid och skapa @ma-alias
help-runtime-claim =   .my.ma:claim             gör anspråk på körtid med din DID
help-identity =   .my.identity                 visa identitetskonfiguration
help-identity-did =   .my.identity.did             visa eget DID (skrivskyddat)
help-identity-publish =   .my.identity:publish @pub    publicera eget DID via utgivartjänst
help-identity-export =   .my.identity:export          ladda ned eget identitetspaket
help-config-path =   .config                      visa alla .config.*-poster

# ── Hjälptext — inkorg ────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lista inkorg (underträdsvy)
help-inbox-n =   .my.inbox.N                  visa post N:s fält
help-inbox-from =   .my.inbox.N.from             avsändar-DID för post N
help-inbox-reply =   .my.inbox.N:reply [body]     skicka svar (öppnar redigerare utan body)
help-inbox-open =   .my.inbox.N:open             öppna innehållet i skrivskyddad redigerare
help-inbox-del =   .my.inbox.N:                 radera post N
help-inbox-delall =   .my.inbox:                   radera alla inkorgsposter
help-inbox-flush =   .my.inbox:flush              skriv alla poster till terminalen
help-inbox-filter =   .my.inbox:filter @who        visa bara poster från @who
help-inbox-traverse =   .my.inbox.N.sender.<fält>   traversera avsändarens DID-dokument latent

# ── Hjälptext — dokument ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<namn>:edit           öppna redigerare med sparat innehåll
help-doc-edit-cid =   .my.doc.<namn>:edit <cid>     hämta CID, öppna för granskning
help-doc-eval =   .my.doc.<namn>:eval           kör sparat innehåll rad för rad
help-doc-publish =   .my.doc.<namn>:publish @pub   lagra som rå blob (alla typer)
help-doc-publish-ipld =   .my.doc.<namn>:publish-ipld @pub  lagra YAML som strukturerad DAG-CBOR IPLD-nod
help-doc-fetch =   .my.doc.<namn>:fetch <cid>    importera CID-innehåll (ingen körning)
help-doc-cid =   .my.doc.<namn>:cid            visa lagrat CID
help-doc-del =   .my.doc.<namn>:              radera dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tillgängliga språk (ange med .my.i18n: <code>):
err-lang-not-found = språket hittades inte: { $lang }

msg-send-failed = sändning misslyckades: { $e }
msg-not-logged-in = inte inloggad

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-tolkningsfel: { $e }
yaml-not-mapping = YAML måste vara ett mapping (nyckel: värde-par); ren text och skalärer kan inte lagras som DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kodningsfel: { $e }
cbor-decode-error = CBOR-avkodningsfel: { $e }
cbor-json-error = CBOR till JSON-fel: { $e }
yaml-serialize-error = YAML-serialiseringsfel: { $e }
edit-reply-invalid = Ogiltigt redigeringssvar
doc-publish-ipld-error = IPLD-publicering misslyckades: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Inkorg rensning sparningsfel: { $e }
err-config-load = Konfigurationsladdningsfel: { $e }
err-lang-persist = Språklagringsfel: { $e }
err-history-parse = Historieparsningsfel: { $e }
err-history-load = Historieladdningsfel: { $e }
err-ipfs-reply-decode = IPFS-svar avkodningsfel: { $e }
err-edit-cbor = CBOR-redigeringsfel: { $e }
err-popup-blocked = Webbläsaren blockerade popup-fönstret
status-publishing = publicerar

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = fel
rpc-error-detail = fel: { $detail }
msg-new-message = ← [{ $from }] nytt meddelande — { $count } i inkorgen
msg-chat = { $sender } säger { $body }
err-edit-decode-failed = redigering: avkodningsfel: { $e }
err-edit-fetch-failed = redigering: hämtningsfel: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv session — profilen kan inte raderas
profile-delete-error = radering av profil misslyckades: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ingen)
profiles-deleted = profil { $name } raderad
profiles-not-found = profil hittades inte: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    öppna zion via en URL-länk
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
help-url-intro =   Dela en länk som öppnar zion med förifylld mottagare:
help-url-msg =   ?msg=<did>                   fyller i: @<did> (textmeddelande)
help-url-say =   ?say=<did>                   fyller i: @<did>:say (say-verb)
help-url-emote =   ?emote=<did>                 fyller i: @<did>:emote (emote-verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Inmatningsfältet fylls i men skickas inte — tryck Enter för att skicka.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publicera din identitet till nätverket
help-header-publish = ── publicera identitet ──────────────────────────────────────────────────────
help-publish-intro = Publicering gör din identitet sökbar på nätverket. Andra kan slå upp ditt DID för att nå dig.
help-publish-ma = För att publicera behöver du ma (lokal körtid) installerat. Det kopplar ego till IPFS/IPNS åt dig.
help-publish-steps = Steg: kör '.my.ma:discover' för att hitta din lokala ma, sedan '.my.identity:publish @ma'.
help-publish-without = Utan publicering kan andra inte nå dig — även om de känner ditt DID kan de inte slå upp din endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
