# zion — Svenska
lang-name = Svenska
label-nick = smeknamn
new-identity-nick-help = Välj ett smeknamn för 間-utrymme. Det är bara ett smeknamn och du kan ändra det när du vill.
error-nick-required = smeknamn krävs
error-nick-invalid = smeknamnet får inte innehålla mellanslag eller @

# ── Inloggningssida ───────────────────────────────────────────────────────
tab-login = logga in
tab-new-identity = ny identitet
tab-import-profile = importera profil
label-passphrase = lösenfras
label-username = användarnamn
label-confirm-passphrase = bekräfta lösenfras
label-did = DID
label-profile-cid = profil-CID
label-or-file = eller fil
btn-login = logga in
btn-export = exportera
btn-generate = generera
btn-new-endpoint = nytt slutpunkt
btn-import-profile = importera profil
btn-show-qr = visa QR
btn-scan-qr = skanna QR
qr-scan-hint = Rikta kameran mot en QR-kod för en zion-profil.
qr-error-camera = kameran är inte tillgänglig: { $e }
qr-error-too-large = profilen är för stor för en QR-kod
passphrase-warning = Förlorad lösenfras = förlorad identitet. Det finns ingen återhämtning.
import-profile-help = Importera en profil via CID eller fil. Du behöver samma lösenfras som användes vid publicering.
import-profile-detected-user = Profil tillhör: { $name }
status-unlocking = låser upp...
status-generating = genererar identitet...
status-reading-file = läser fil...
status-fetching-profile = hämtar profil från IPFS...
status-imported = importerade '{ $name }' — byt till fliken Logga in
status-importing-profile = importerar profil...
profile-import-done = profil importerad för '{ $name }' — { $n } nycklar laddade
error-wrong-passphrase = fel lösenfras: { $e }
error-identity-not-found = identiteten '{ $name }' hittades inte
error-username-required = användarnamn krävs
error-passphrase-required = lösenfras krävs
error-passphrases-no-match = lösenfraser matchar inte
error-profile-source-required = ange ett CID eller ladda upp en fil
error-did-required = ange ditt DID
error-profile-fetch = kunde inte hämta profilen: { $e }
error-profile-no-username = profilen innehåller inget användarnamn
error-profile-no-identity = identiteten '{ $name }' hittades inte — importera identiteten först

# ── Terminalsystemmeddelanden ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — inloggad som { $username }
msg-type-help = Skriv .help för en lista över kommandon.
msg-getting-started = Prova: say Hello world, look, .help eller help.
msg-connecting = ansluter till iroh...
msg-iroh-ready = iroh-slutpunkt redo
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicerat via lokalt 間 ({ $url })
msg-identity-publication-propagating = Identitetspubliceringen sprids fortfarande; entry är fördröjd: { $e }
msg-identity-first-publish = Publicerar identiteten för första gången. Det kan ta upp till { $seconds } sekunder.
msg-ma-connecting-matrix = försöker ansluta dig till 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokalt 間 gjort anspråk på
msg-local-ma-already-claimed = lokalt 間 redan gjort anspråk på
msg-local-ma-claim-failed = kunde inte göra anspråk på lokalt 間
msg-identity-not-published = Identitet hittades inte online — om du har 間 installerat lokalt, kör '.ma: claim [port]' sedan '.my.identity!publish @ma'. Skriv '.help/publish' för detaljer.
msg-blocked = ⊗ blockerad [{ $cap }]: { $from }
msg-focus-cleared = fokus rensat
msg-left = left
msg-focusing = fokuserar { $did } som { $prompt }
msg-set = { $path }: { $value }
msg-deleted = raderade { $path } ({ $count } poster)
msg-read-only = { $path } är skrivskyddad
msg-subtree-set = { $path } är ett underträd; vägrar ange
msg-ancestor-leaf = ett förfäder till { $path } är ett löv; vägrar skugga
msg-key-not-found = nyckel hittades inte: { $path }
msg-link-not-connected = länkhämtningsfel: ej ansluten
msg-link-fetch-error = länkhämtningsfel: { $e }
msg-link-key-not-found = nyckeln `{ $key }` hittades inte i länkat dokument

# ── Aliasvalidering ───────────────────────────────────────────────────────
err-alias-name-empty = aliasnamn kan inte vara tomt
err-alias-has-dot = aliasnamn kan inte innehålla '.'
err-alias-has-fragment = aliasnamn kan inte innehålla '#'
err-alias-value-fragment = aliasvärde får innehålla högst ett icke-tomt DID-URL-fragment
err-alias-value-path = aliasvärde måste vara en did:ma:<ipns>-DID eller DID-URL (ingen sökväg)
err-alias-not-did = aliasvärde måste börja med did:ma:
err-unknown-alias = okänt alias: @{ $name }
err-bare-did = förväntade bart did:ma:<ipns> (inget fragment eller sökväg), fick { $did }

# ── Redigerare ────────────────────────────────────────────────────────────
btn-save = Spara
btn-eval = Kör
btn-cancel = Avbryt
msg-jobs-cancelled = jobb avbrutna
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
discover-hint-endpoint-not-found = Tips: slutpunkten hittades inte. Kontrollera att 間 kör och exponerar /status.json på port 5003.
discover-hint-server-error = Tips: körmiljön svarade med serverfel. Kontrollera 間-loggarna och försök igen.
discover-hint-network = Tips: nätverks-/anslutningsproblem. Starta 間, kontrollera att localhost:5003 kan nås och tillåt lokal HTTP-åtkomst i webbläsaren.
discover-hint-generic = Tips: kontrollera att 間 och IPFS Desktop kör och försök `.ma` igen.
discover-success = 間 identifierat vid { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma skapat — kör '.my.identity!publish @ma' för att publicera din identitet.
claim-success = Körtid gjord anspråk på för { $did }
claim-conflict = Körtid redan gjord anspråk på av annan identitet
claim-already-owned = Runtime redan gjort anspråk på av denna identitet
claim-http-failed = anspråk misslyckades: HTTP { $status }
claim-error = anspråk misslyckades: { $e }
claim-no-session = ej inloggad; logga in först för att göra anspråk på körtiden
runtime-no-verb = inget verb `{ $verb }` för { $path }

# ── Verb — åtkomstkontroll ────────────────────────────────────────────────
acl-reset = .my.acl återställd (fullt öppen)
acl-persist-error = sparfel: { $e }
acl-no-verb = inget verb `{ $verb }` för .my.acl

# ── Verb — identitet ─────────────────────────────────────────────────────
publish-usage = användning: .my.identity!publish <did-eller-alias>
identity-exported = Bundle nedladdat som { $filename }
identity-export-failed = Export misslyckades: { $e }

# ── Verb — dokument ───────────────────────────────────────────────────────
doc-content-empty = { $path } är tom
doc-save-first = { $path } är tom — spara först
doc-missing-name = dokumentnamn saknas
doc-publish-usage = användning: .my.doc.<namn>!publish <utgivare>
doc-publish-ipld-usage = användning: .my.doc.<namn>!publish-ipld <utgivare>
doc-publish-failed = publicering { $path }: { $e }
doc-publish-ipld-failed = ipld-publicering { $path }: { $e }
doc-publish-error-detail = publicering misslyckades [{ $code }]: { $err }
doc-publish-error-hint = Tips: { $hint }
doc-publish-hint-session = logga in igen så att ego kan komma åt dina identitetsnycklar
doc-publish-hint-target = använd en giltig utgivar-DID eller ett alias som löses till en ren did:ma:<ipns>
doc-publish-hint-network = kontrollera att 間-körmiljön och IPFS kan nås och försök igen
doc-publish-hint-resolve = kontrollera att utgivarens DID-dokument är publicerat och innehåller en nåbar slutpunkt
doc-publish-hint-acl = be utgivaroperatören tillåta din DID i ACL
doc-publish-hint-runtime = körmiljön/pluginen avvisade begäran; läs orsaken och försök igen efter att entitet/körmiljö har rättats
doc-publish-hint-ipfs = kontrollera lokal Kubo/IPFS-hälsa och status för utgivarens körmiljö
doc-publish-hint-unknown = granska körmiljöloggarna för detaljerad orsak och försök igen
doc-store-sent = lagringsförfrågan skickad ({ $id }) → { $publisher }; CID anländer via RPC-svar
doc-ipld-store-sent = IPLD-lagringsförfrågan skickad ({ $id }) → { $publisher }; CID anländer via RPC-svar
doc-fetch-done = hämtade { $cid } → { $path } (ej utförd)
doc-fetch-failed = hämtning { $cid }: { $e }
doc-fetch-usage = användning: .my.doc.<namn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid är inte angiven
doc-no-verb = inget verb `{ $verb }` för { $path }
path-no-verb = inget verb `{ $verb }` för { $path }

# ── Hjälptext — rubriker ──────────────────────────────────────────────────
help-header-zion = ── zion-kommandon ─────────────────────────────────────────────────────────
help-header-messaging = ── meddelanden ──────────────────────────────────────────────────────────
help-header-config = ── lokal konfigurationsgrammatik ─────────────────────────────────────────
help-header-common = ── vanliga sökvägar ──────────────────────────────────────────────────────
help-header-inbox = ── inkorg ───────────────────────────────────────────────────────────────
help-header-documents = ── dokument ─────────────────────────────────────────────────────────────
help-header-i18n = ── språk ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-utrymme ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── går in i 間-utrymmet ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Hjälptext — zion-kommandon ────────────────────────────────────────────
help-cmd-help =   .help                        denna text
help-cmd-clear =   .clear                       rensa terminalen
help-cmd-panic =   .panic                       sista utvägen — använd om du är i trubbel
help-cmd-history =   .history [n]                 kommandohistorik (på varandra följande dubletter slås samman); valfritt n visar bara de sista n raderna
help-cmd-logout =   .logout                      logga ut
help-cmd-batch =   .batch                       utvärdera kladddokument parallellt
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         utvärdera kladddokument rad för rad

# ── Hjälptext — meddelanden ───────────────────────────────────────────────
help-msg-echo =   @alias                       visa löst DID/DID-URL (inget meddelande skickas)
help-msg-send =   @alias!msg body / @alias:verb args           skicka meddelande / RPC till aktör
help-msg-fragment =   @alias#fragment:verb body  skicka till alias med explicit DID-fragment
help-msg-escape =   \@name                       bokstavlig @name (ingen alias-sökning)

# ── Hjälptext — fokusläge ─────────────────────────────────────────────────

# ── Hjälptext — konfigurationsgrammatik ──────────────────────────────────
help-config-get =   .path                        hämta löv-värde eller lista underträd
help-config-filter =   .path [namn]               lista undernyckelnamn som innehåller namn
help-config-full =   .path. [namn]                lista fullständiga underträdsvärden som innehåller namn
help-config-set =   .path: value                 ange löv
help-config-delete =   .path:                       radera löv eller underträd
help-config-verb =   .path!verb [args]            kör lokalt verb

# ── Hjälptext — vanliga sökvägar ─────────────────────────────────────────
help-my =   .my                          visa all personlig konfiguration
help-aliases =   .my.aliases                  lista alias
help-aliases-set =   .my.aliases.<name>: <did-url>    lägg till/uppdatera alias (DID eller DID-URL)
help-aliases-del =   .my.aliases.<name>:          ta bort alias
help-runtime-discover =   .ma: claim [port]          identifiera lokal körtid och skapa @ma-alias
help-runtime-claim =   .ma: claim [port]             gör anspråk på körtid med din DID
help-identity =   .my.identity                 visa identitetskonfiguration
help-identity-did =   .my.identity.did             visa eget DID (skrivskyddat)
help-identity-publish =   .my.identity!publish @pub    publicera eget DID via utgivartjänst
help-identity-export =   .my.identity!export          ladda ned eget identitetspaket
help-config-path =   .config                      visa alla .config.*-poster

# ── Hjälptext — inkorg ────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lista inkorg (underträdsvy)
help-inbox-n =   .my.inbox.N                  visa post N:s fält
help-inbox-from =   .my.inbox.N.from             avsändar-DID för post N
help-inbox-reply =   .my.inbox.N!reply [body]     skicka svar (öppnar redigerare utan body)
help-inbox-open =   .my.inbox.N!open             öppna innehållet i skrivskyddad redigerare
help-inbox-del =   .my.inbox.N:                 radera post N
help-inbox-delall =   .my.inbox:                   radera alla inkorgsposter
help-inbox-flush =   .my.inbox!flush              skriv alla poster till terminalen
help-inbox-filter =   .my.inbox!filter @who        visa bara poster från @who
help-inbox-traverse =   .my.inbox.N.sender.<fält>   traversera avsändarens DID-dokument latent

# ── Hjälptext — dokument ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<namn>!edit           öppna redigerare med sparat innehåll
help-doc-edit-cid =   .my.doc.<namn>!edit /ipfs/<cid>     hämta CID, öppna för granskning
help-doc-eval =   .my.doc.<namn>!eval           kör sparat innehåll rad för rad
help-doc-publish =   .my.doc.<namn>!publish @pub   lagra som rå blob (alla typer)
help-doc-publish-ipld =   .my.doc.<namn>!publish-ipld @pub  lagra YAML som strukturerad DAG-CBOR IPLD-nod
help-doc-fetch =   .my.doc.<namn>!fetch /ipfs/<cid>    importera CID-innehåll (ingen körning)
help-doc-cid =   .my.doc.<namn>!cid            visa lagrat CID
help-doc-del =   .my.doc.<namn>:              radera dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n lagrar språkinställningen kopplad till din identitet.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lista tillgängliga språkkoder

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-rummet är rummet mellan 間-identiteter. ma ser till att identiteterna kan hitta varandra och kommunicera; när din identitet är publicerad kan du delta.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   anslut till din lokala 間-runtime, läs /status.json och spara .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publicera ditt DID-dokument så att andra kan hitta dina nycklar och din endpoint
help-ma-security = Den tydligaste tillitsgränsen är din egen 間-runtime med din egen IPFS Desktop/Kubo. En fjärrpublisher kan vara användbar, men då förlitar du dig på någon annans tjänst.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hur du går in i 間-rummet

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = När din identitet är känd låter .enter @ma dig stiga in i 間. Hitta en värld, gå in i den och delta därifrån.
help-ma-entry-steps = Starta IPFS Desktop och ma, kör sedan .ma. Publicera med .my.identity!publish @ma, hitta en värld och gå in med .enter @ma.
help-ma-entry-command =   .enter @ma                  gå in i 間 genom @ma-runtime
help-ma-entry-toggle =   .enter                       slå rumsfokus av eller på; din identitet förblir aktiv
help-ma-entry-url =   ?enter=<runtime>             gå in efter inloggning från en delad URL

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
yaml-serialise-error = YAML-serialiseringsfel: { $e }
edit-reply-invalid = Ogiltigt redigeringssvar
doc-publish-ipld-error = IPLD-publicering misslyckades: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Inkorg rensning sparningsfel: { $e }
err-config-load = Konfigurationsladdningsfel: { $e }
err-lang-persist = Språklagringsfel: { $e }
err-history-parse = Historieparsningsfel: { $e }
err-history-load = Historieladdningsfel: { $e }
err-history-count-invalid = historikantalet måste vara ett positivt heltal
err-ipfs-reply-decode = IPFS-svar avkodningsfel: { $e }
err-edit-cbor = CBOR-redigeringsfel: { $e }
err-popup-blocked = Webbläsaren blockerade popup-fönstret
status-publishing = publicerar

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = fel
rpc-error-detail = fel: { $detail }
msg-new-message = ← [{ $from }] nytt meddelande — { $count } i inkorgen
msg-chat = { $sender } säger { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } säger { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kliver in.
room-leave = * { $name } lämnar rummet.
room-drop  = * { $name } tappar { $thing }.
room-take  = * { $name } plockar upp { $thing }.
err-edit-decode-failed = redigering: avkodningsfel: { $e }
err-edit-fetch-failed = redigering: hämtningsfel: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ingen aktiv session — profilen kan inte raderas
profile-delete-error = radering av profil misslyckades: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profilen krypterades och skickades till IPFS; DID-dokumentet uppdateras när CID kommer
profile-publish-done = profilen publicerad — DID-dokumentet uppdaterat med ma.agent-CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identitet redan publicerad — profilen uppdaterad
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binärt innehåll (visas inte)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ingen)
profiles-deleted = profil { $name } raderad
profiles-not-found = profil hittades inte: { $name }

# -- Help topics index
help-header-topics = -- ämnen -- skriv .help/<topic> för detaljer
help-topic-msg =   .help/msg                    meddelanden
help-topic-ma = .help/ma                     間-utrymme, publicering och inträde
help-topic-path = .help/path                   lokal prickvägsgrammatik
help-topic-my =   .help/my                     personlig config
help-topic-inbox =   .help/inbox                  inkorg
help-topic-doc =   .help/doc                    dokument
help-topic-actor =   .help/actor                  fjärr-actor
help-topic-zscheme =   .help/zscheme               inbäddade Scheme-uttryck och dokumentation
help-topic-url =   .help/url                    öppna zion via en URL-länk
help-topic-i18n = .help/i18n                   språkpreferens för din identitet
help-unknown-topic =   .help/{ $topic }: okänt ämne

# -- Help actor section
help-header-actor = -- fjärraktörer
help-actor-echo =   @actor                       visa upplöst DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         skicka direkt/chatt/emote-meddelande
help-actor-ping = @actor:ping                  livlighet ping
help-actor-entities =   @actor/entities              lista entiteter
help-actor-entities-get = @actor/entities/<n>          hämta entitetsnod
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     redigera entitet
help-actor-entities-del = @actor/entities/<n>:         ta bort enhet
help-actor-config-get =   @actor/config/<key>          hämta config-värde
help-actor-config-set =   @actor/config/<key>: val     ställ in config-värde
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              redigera ACL
help-actor-fragment =   @actor#entity                skicka till plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC till plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  behålla 5-svar i sessionsmiljön
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URL-parametrar ──────────────────────────────────────────────────────────
help-url-intro =   Dela en länk som öppnar zion med förifylld mottagare:
help-url-msg =   ?msg=<did>                   fyller i: @<did>!msg (textmeddelande)
help-url-say =   ?say=<did>                   fyller i: @<did>!say (say-verb)
help-url-emote =   ?emote=<did>                 fyller i: @<did>!emote (emote-verb)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             gå in i runtime-världen efter inloggning
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Inmatningsfältet fylls i men skickas inte — tryck Enter för att skicka.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publicera din identitet till nätverket
help-header-publish = ── publicera identitet ──────────────────────────────────────────────────────
help-publish-intro = Publicering gör din identitet sökbar på nätverket. Andra kan slå upp ditt DID för att nå dig.
help-publish-ma = För att publicera behöver du 間 (lokal körtid) installerat. Det kopplar ego till IPFS/IPNS åt dig.
help-publish-steps = Steg: kör '.ma: claim [port]' för att hitta din lokala ma, sedan '.my.identity!publish @ma'.
help-publish-without = Utan publicering kan andra inte nå dig — även om de känner ditt DID kan de inte slå upp din endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = ange ett profilnamn: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Samla batch — skriv kommandon, avsluta med .batch
batch-already-collecting = Samlar redan en batch — avsluta med .batch först
batch-empty = Batchen var tom — inget att köra
batch-running = Kör batch…
batch-step-timeout = batchsteget tog timeout

batch-done = Batch klar på { $secs }s — { $steps } steg
batch-done-error = Batch klar med fel på { $secs }s — { $steps } steg
msg-timeout = Meddelandet tog timeout (inget svar på 60s)
err-unknown-command = okänt kommando: { $path }
err-read-only-path = { $path } är skrivskyddad
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        utvärdera kladddokument parallellt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Det gick inte att hämta CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ogiltigt CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Varning: Din privata IPNS-nyckel kommer att skickas till denna körningstjänst för publicering av din identitet. Använd bara en körningstjänst som du litar helt på.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme utvärderar Scheme-uttryck som är inbäddade i zion-kommandon och infogar resultatet i raden innan den skickas.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inbäddat exempel; skickar "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitioner finns kvar under den aktuella inloggningssessionen
help-zscheme-doc = Dokumentation: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokal IPFS-gateway (kräver webbläsarundantag)

tab-config = Inställningar
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
