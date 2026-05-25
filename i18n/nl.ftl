# zion — Nederlands
lang-name = Nederlands

# ── Aanmeldingspagina ─────────────────────────────────────────────────────
tab-login = aanmelden
tab-new-identity = nieuwe identiteit
tab-import = importeren
label-passphrase = wachtzin
label-username = gebruikersnaam
label-confirm-passphrase = wachtzin bevestigen
btn-login = aanmelden
btn-export = exporteren
btn-generate = genereren
passphrase-warning = Verloren wachtzin = verloren identiteit. Herstel is niet mogelijk.
import-help = Kies een geëxporteerd .zion.json-bestand. Het pakket blijft versleuteld.
status-unlocking = ontgrendelen...
status-generating = identiteit genereren...
status-reading-file = bestand lezen...
status-imported = '{ $name }' geïmporteerd — schakel over naar het tabblad Aanmelden
error-wrong-passphrase = onjuiste wachtzin: { $e }
error-identity-not-found = identiteit '{ $name }' niet gevonden
error-username-required = gebruikersnaam is vereist
error-passphrase-required = wachtzin is vereist
error-passphrases-no-match = wachtzinnen komen niet overeen

# ── Terminaalsysteemberichten ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — aangemeld als { $username }
msg-type-help = Typ .help voor een lijst met opdrachten.
msg-connecting = verbinding maken met iroh...
msg-iroh-ready = iroh-eindpunt gereed
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ geblokkeerd [{ $cap }]: { $from }
msg-focus-cleared = focus gewist
msg-focusing = focussen op { $did } als { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } verwijderd ({ $count } items)
msg-read-only = { $path } is alleen-lezen
msg-subtree-set = { $path } is een deelboom; instellen geweigerd
msg-ancestor-leaf = een voorouder van { $path } is een blad; overschaduwen geweigerd
msg-key-not-found = sleutel niet gevonden: { $path }
msg-no-match = geen overeenkomst
msg-link-not-connected = fout bij ophalen koppeling: niet verbonden
msg-link-fetch-error = fout bij ophalen koppeling: { $e }
msg-link-key-not-found = sleutel `{ $key }` niet gevonden in gekoppeld document

# ── Aliasvalidatie ────────────────────────────────────────────────────────
err-alias-name-empty = aliasnaam mag niet leeg zijn
err-alias-has-fragment = aliasnaam mag geen '#' bevatten
err-alias-value-fragment = aliaswaarde moet een zuivere did:ma:<ipns> zijn (zonder fragment)
err-alias-value-path = aliaswaarde moet een zuivere did:ma:<ipns> zijn (zonder pad)
err-alias-not-did = aliaswaarde moet beginnen met did:ma:
err-unknown-alias = onbekend alias: @{ $name }
err-bare-did = zuivere did:ma:<ipns> verwacht (zonder fragment of pad), ontvangen { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Opslaan
btn-eval = Uitvoeren
btn-cancel = Annuleren
btn-close = Sluiten
btn-reply = Beantwoorden
btn-publish = Publiceren
btn-publish-ipld = Publiceren IPLD
msg-reply-sent = antwoord verzonden
msg-reply-failed = antwoord verzenden mislukt: { $e }
msg-entity-publish-sent = entiteit { $name }: publicatie verzonden
msg-entity-publish-failed = publiceren entiteit mislukt: { $e }
msg-field-publish-sent = entiteit { $name }.{ $field }: publicatie verzonden
msg-field-publish-failed = publiceren veld mislukt: { $e }
msg-acl-publish-sent = runtime-ACL: publicatie verzonden
msg-crud-edit-publish-sent = { $path }: publicatie verzonden
msg-acl-publish-failed = publiceren runtime-ACL mislukt: { $e }
msg-yaml-error = YAML-fout: { $e }
msg-editor-saved = { $path }:opslaan
msg-fetch-review = { $cid } opgehaald — controleer voor uitvoering
msg-fetch-failed = ophalen { $cid }: { $e }

# ── Werkwoorden — postvak in ──────────────────────────────────────────────
inbox-empty = postvak in is leeg
inbox-entry-not-found = item { $n } in postvak in niet gevonden
inbox-no-message-id = item { $n } in postvak in heeft geen message_id
inbox-no-verb = geen werkwoord `{ $verb }` voor item { $n } in postvak in

# ── Werkwoorden — runtime ─────────────────────────────────────────────────
discover-fetch-failed = detectie mislukt bij { $url }: { $e }
discover-json-error = detectie mislukt: ongeldige JSON van { $url }: { $e }
discover-missing-did = detectie mislukt: status.json mist verplicht veld `did`
discover-invalid-did = detectie mislukt: `did` moest beginnen met did:ma:, ontvangen `{ $did }`
discover-no-endpoint = detectiewaarschuwing: `endpoint_id` ontbreekt in status.json; alleen DID opgeslagen
discover-success = ma gedetecteerd bij { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma aangemaakt — publiceer met: .my.identity:publish @ma
claim-success = Runtime geclaimd voor { $did }
claim-conflict = Runtime al geclaimd door een andere identiteit
claim-http-failed = claimen mislukt: HTTP { $status }
claim-error = claimen mislukt: { $e }
claim-no-session = niet aangemeld; meld u eerst aan om de runtime te claimen
runtime-no-verb = geen werkwoord `{ $verb }` voor { $path }

# ── Werkwoorden — toegangsbeheer ──────────────────────────────────────────
acl-reset = .my.acl gereset (volledig open)
acl-persist-error = opslagfout: { $e }
acl-no-verb = geen werkwoord `{ $verb }` voor .my.acl

# ── Werkwoorden — identiteit ──────────────────────────────────────────────
publish-usage = gebruik: .my.identity:publish <did-of-alias>

# ── Werkwoorden — documenten ──────────────────────────────────────────────
doc-content-empty = { $path }.content is leeg
doc-save-first = { $path }.content is leeg — sla eerst op
doc-missing-name = documentnaam ontbreekt
doc-publish-usage = gebruik: .my.doc.<naam>:publish <uitgever>
doc-publish-ipld-usage = gebruik: .my.doc.<naam>:publish-ipld <uitgever>
doc-publish-failed = publiceren { $path }: { $e }
doc-publish-ipld-failed = IPLD publiceren { $path }: { $e }
doc-store-sent = opslagverzoek verzonden ({ $id }) → { $publisher }; CID komt via RPC-antwoord
doc-ipld-store-sent = IPLD-opslagverzoek verzonden ({ $id }) → { $publisher }; CID komt via RPC-antwoord
doc-fetch-done = { $cid } opgehaald → { $path }.content (niet uitgevoerd)
doc-fetch-failed = ophalen { $cid }: { $e }
doc-fetch-usage = gebruik: .my.doc.<naam>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid is niet ingesteld
doc-no-verb = geen werkwoord `{ $verb }` voor { $path }
path-no-verb = geen werkwoord `{ $verb }` voor { $path }

# ── Helptekst — koppen ────────────────────────────────────────────────────
help-header-zion = ── zion-opdrachten ────────────────────────────────────────────────────────
help-header-messaging = ── berichten ─────────────────────────────────────────────────────────────
help-header-focus = ── focusmodus ────────────────────────────────────────────────────────────
help-header-config = ── lokale configuratiegrammatica ──────────────────────────────────────
help-header-common = ── veelgebruikte paden ───────────────────────────────────────────────────
help-header-inbox = ── postvak in ────────────────────────────────────────────────────────────
help-header-documents = ── documenten ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        deze tekst
help-cmd-clear =   .clear                       terminal leegmaken
help-cmd-panic =   .panic                       laatste redmiddel — gebruik als u in de problemen zit
help-cmd-logout =   .logout                      afmelden

help-msg-echo =   @alias                       opgelost DID weergeven (geen bericht verzonden)
help-msg-send =   @alias[:verb] body           bericht / RPC sturen naar actor
help-msg-fragment =   @alias#fragment[:verb] body  sturen naar alias met expliciet DID-fragment
help-msg-escape =   \@name                       letterlijke @name (geen aliaszoekactie)

help-focus-set =   .use @alias [as @name]       focussen op actor (wijzigt prompt)
help-focus-clear =   .use                         focus wissen

help-config-get =   .path                        bladwaarde ophalen of deelboom weergeven
help-config-filter =   .path value                  zoekfilter (filteren op waarde)
help-config-set =   .path: value                 blad instellen
help-config-delete =   .path:                       blad of deelboom verwijderen
help-config-verb =   .path:verb [args]            lokaal werkwoord uitvoeren

help-my =   .my                          alle persoonlijke configuratie weergeven
help-aliases =   .my.aliases                  aliassen weergeven
help-aliases-set =   .my.aliases.<name>: <did>    alias toevoegen/bijwerken (zuivere DID, geen #fragment)
help-aliases-del =   .my.aliases.<name>:          alias verwijderen
help-runtime-discover =   .my.ma:discover          lokale runtime detecteren en @ma-alias aanmaken
help-runtime-claim =   .my.ma:claim             runtime claimen met uw DID
help-identity =   .my.identity                 identiteitsconfiguratie weergeven
help-identity-did =   .my.identity.did             eigen DID weergeven (alleen-lezen)
help-identity-publish =   .my.identity:publish @pub    eigen DID publiceren via uitgeversdienst
help-config-path =   .config                      alle .config.*-items weergeven

help-inbox =   .my.inbox                    postvak in weergeven (deelboomweergave)
help-inbox-n =   .my.inbox.N                  velden van item N weergeven
help-inbox-from =   .my.inbox.N.from             afzender-DID voor item N
help-inbox-reply =   .my.inbox.N:reply [body]     antwoord sturen (opent editor zonder inhoud)
help-inbox-open =   .my.inbox.N:open             inhoud openen in alleen-lezen editor
help-inbox-del =   .my.inbox.N:                 item N verwijderen
help-inbox-delall =   .my.inbox:                   alle items in postvak in verwijderen
help-inbox-flush =   .my.inbox:flush              alle items naar terminal afdrukken
help-inbox-traverse =   .my.inbox.N.sender.<veld>   DID-document afzender lazy doorlopen

help-doc-edit =   .my.doc.<naam>:edit           editor openen met opgeslagen inhoud
help-doc-edit-cid =   .my.doc.<naam>:edit <cid>     CID ophalen, openen voor revisie
help-doc-eval =   .my.doc.<naam>:eval           opgeslagen inhoud regel voor regel uitvoeren
help-doc-publish =   .my.doc.<naam>:publish @pub   opslaan als ruwe blob (alle typen)
help-doc-publish-ipld =   .my.doc.<naam>:publish-ipld @pub  YAML opslaan als gestructureerd DAG-CBOR IPLD-knooppunt
help-doc-fetch =   .my.doc.<naam>:fetch <cid>    CID-inhoud importeren (geen uitvoering)
help-doc-cid =   .my.doc.<naam>:cid            opgeslagen CID weergeven
help-doc-del =   .my.doc.<naam>:              document verwijderen

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Beschikbare talen (instellen met .my.i18n: <code>):
err-lang-not-found = taal niet gevonden: { $lang }

msg-send-failed = verzenden mislukt: { $e }
msg-not-logged-in = niet ingelogd

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-parsefout: { $e }
yaml-not-mapping = YAML moet een mapping zijn (sleutel: waarde-paren); platte tekst en scalars kunnen niet als DAG-CBOR worden opgeslagen
dagcbor-encode-error = DAG-CBOR-coderingsfout: { $e }
cbor-decode-error = CBOR-decoderingsfout: { $e }
cbor-json-error = CBOR naar JSON-fout: { $e }
yaml-serialize-error = YAML-serialisatiefout: { $e }
edit-reply-invalid = Ongeldige bewerkingreactie
doc-publish-ipld-error = IPLD-publicatie mislukt: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Postvak-IN opruimen opslaan-fout: { $e }
err-config-load = Configuratielaadfouten: { $e }
err-lang-persist = Taalopslaan-fout: { $e }
err-history-parse = Geschiedenisparserfout: { $e }
err-history-load = Geschiedenislaad-fout: { $e }
err-ipfs-reply-decode = IPFS-antwoord decoderen mislukt: { $e }
err-edit-cbor = CBOR-bewerkingsfout: { $e }
err-popup-blocked = Pop-up geblokkeerd door browser
status-publishing = publiceert

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = fout
rpc-error-detail = fout: { $detail }
msg-new-message = ← [{ $from }] nieuw bericht — { $count } in inbox
err-edit-decode-failed = bewerking: decodering mislukt: { $e }
err-edit-fetch-failed = bewerking: ophalen mislukt: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = geen actieve sessie — profiel kan niet worden verwijderd
profile-delete-error = verwijderen van profiel mislukt: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (geen)
profiles-deleted = profiel { $name } verwijderd
profiles-not-found = profiel niet gevonden: { $name }
