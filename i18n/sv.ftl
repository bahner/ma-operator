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
msg-reply-sent = svar skickat
msg-reply-failed = svar misslyckades: { $e }
msg-entity-publish-sent = entitet { $name }: publicering skickad
msg-entity-publish-failed = entitetspublicering misslyckades: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: publicering skickad
msg-field-publish-failed = fältpublicering misslyckades: { $e }
msg-acl-publish-sent = runtime ACL: publicering skickad
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

# ── Verb — körtid ─────────────────────────────────────────────────────────
discover-fetch-failed = identifiering misslyckades vid { $url }: { $e }
discover-json-error = identifiering misslyckades: ogiltigt JSON från { $url }: { $e }
discover-missing-did = identifiering misslyckades: status.json saknar obligatoriskt fält `did`
discover-invalid-did = identifiering misslyckades: förväntade `did` börja med did:ma:, fick `{ $did }`
discover-no-endpoint = identifieringsvarning: `endpoint_id` saknas i status.json; lagrade enbart DID
discover-success = ma identifierat vid { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 skapat — publicera med: .my.identity:publish @間
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
help-cmd-logout =   .logout                      logga ut

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
help-runtime-discover =   .my.runtime:discover          identifiera lokal körtid och skapa @間-alias
help-runtime-claim =   .my.runtime:claim             gör anspråk på körtid med din DID
help-identity =   .my.identity                 visa identitetskonfiguration
help-identity-did =   .my.identity.did             visa eget DID (skrivskyddat)
help-identity-publish =   .my.identity:publish @pub    publicera eget DID via utgivartjänst
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
