# zion — Nederlands
lang-name = Nederlands

# ── Aanmeldingspagina ─────────────────────────────────────────────────────
tab-login = aanmelden
tab-new-identity = nieuwe identiteit
tab-import-profile = profiel importeren
label-passphrase = wachtzin
label-username = gebruikersnaam
label-confirm-passphrase = wachtzin bevestigen
label-did = DID
label-profile-cid = profiel-CID
label-or-file = of bestand
btn-login = aanmelden
btn-export = exporteren
btn-generate = genereren
btn-new-endpoint = nieuw eindpunt
btn-import-profile = profiel importeren
passphrase-warning = Verloren wachtzin = verloren identiteit. Herstel is niet mogelijk.
import-profile-help = Importeer een profiel via CID of bestand. U heeft dezelfde wachtzin nodig die bij het publiceren is gebruikt.
import-profile-detected-user = Profiel is van: { $name }
status-unlocking = ontgrendelen...
status-generating = identiteit genereren...
status-reading-file = bestand lezen...
status-fetching-profile = profiel ophalen van IPFS...
status-imported = '{ $name }' geïmporteerd — schakel over naar het tabblad Aanmelden
status-importing-profile = profiel importeren...
profile-import-done = profiel geïmporteerd voor '{ $name }' — { $n } sleutels geladen
error-wrong-passphrase = onjuiste wachtzin: { $e }
error-identity-not-found = identiteit '{ $name }' niet gevonden
error-username-required = gebruikersnaam is vereist
error-passphrase-required = wachtzin is vereist
error-passphrases-no-match = wachtzinnen komen niet overeen
error-profile-source-required = geef een CID op of upload een bestand
error-did-required = voer uw DID in
error-profile-fetch = kan profiel niet ophalen: { $e }
error-profile-no-username = profiel bevat geen gebruikersnaam
error-profile-no-identity = identiteit '{ $name }' niet gevonden — importeer eerst de identiteit

# ── Terminaalsysteemberichten ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — aangemeld als { $username }
msg-type-help = Typ .help voor een lijst met opdrachten.
msg-connecting = verbinding maken met iroh...
msg-iroh-ready = iroh-eindpunt gereed
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID gepubliceerd via lokale ma ({ $url })
msg-ma-connecting-matrix = probeert je met de 間trix te verbinden
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokale 間 geclaimd
msg-local-ma-already-claimed = lokale 間 is al geclaimd
msg-local-ma-claim-failed = kon lokale 間 niet claimen
msg-identity-not-published = Identiteit niet online gevonden — als je ma lokaal geïnstalleerd hebt, voer '.ma [port]' uit en dan '.my.identity!publish @ma'. Typ '.help/publish' voor details.
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
err-alias-has-dot = aliasnaam mag geen '.' bevatten
err-alias-has-fragment = aliasnaam mag geen '#' bevatten
err-alias-value-fragment = aliaswaarde mag maximaal één niet-leeg DID-URL-fragment bevatten
err-alias-value-path = aliaswaarde moet een did:ma:<ipns> DID of DID-URL zijn (zonder pad)
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
msg-kind-publish-failed = type publiceren mislukt: { $e }
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
inbox-filter-no-arg = filter vereist een DID- of alias-argument
inbox-filter-empty = geen berichten van { $did }

# ── Werkwoorden — runtime ─────────────────────────────────────────────────
discover-fetch-failed = detectie mislukt bij { $url }: { $e }
discover-json-error = detectie mislukt: ongeldige JSON van { $url }: { $e }
discover-missing-did = detectie mislukt: status.json mist verplicht veld `did`
discover-invalid-did = detectie mislukt: `did` moest beginnen met did:ma:, ontvangen `{ $did }`
discover-no-endpoint = detectiewaarschuwing: `endpoint_id` ontbreekt in status.json; alleen DID opgeslagen
discover-hint-endpoint-not-found = Hint: eindpunt niet gevonden. Controleer dat `ma` draait en /status.json op poort 5003 aanbiedt.
discover-hint-server-error = Hint: runtime antwoordde met een serverfout. Controleer de `ma`-logs en probeer opnieuw.
discover-hint-network = Hint: netwerk-/verbindingsprobleem. Start `ma`, controleer dat localhost:5003 bereikbaar is en sta lokale HTTP-toegang in de browser toe.
discover-hint-generic = Hint: controleer dat `ma` en IPFS Desktop draaien en probeer `.ma` opnieuw.
discover-success = ma gedetecteerd bij { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma aangemaakt — voer '.my.identity!publish @ma' uit om je identiteit te publiceren.
claim-success = Runtime geclaimd voor { $did }
claim-conflict = Runtime al geclaimd door een andere identiteit
claim-already-owned = Runtime is al geclaimd door deze identiteit
claim-http-failed = claimen mislukt: HTTP { $status }
claim-error = claimen mislukt: { $e }
claim-no-session = niet aangemeld; meld u eerst aan om de runtime te claimen
runtime-no-verb = geen werkwoord `{ $verb }` voor { $path }

# ── Werkwoorden — toegangsbeheer ──────────────────────────────────────────
acl-reset = .my.acl gereset (volledig open)
acl-persist-error = opslagfout: { $e }
acl-no-verb = geen werkwoord `{ $verb }` voor .my.acl

# ── Werkwoorden — identiteit ──────────────────────────────────────────────
publish-usage = gebruik: .my.identity!publish <did-of-alias>
identity-exported = Bundel gedownload als { $filename }
identity-export-failed = Export mislukt: { $e }

# ── Werkwoorden — documenten ──────────────────────────────────────────────
doc-content-empty = { $path }.content is leeg
doc-save-first = { $path }.content is leeg — sla eerst op
doc-missing-name = documentnaam ontbreekt
doc-publish-usage = gebruik: .my.doc.<naam>!publish <uitgever>
doc-publish-ipld-usage = gebruik: .my.doc.<naam>!publish-ipld <uitgever>
doc-publish-failed = publiceren { $path }: { $e }
doc-publish-ipld-failed = IPLD publiceren { $path }: { $e }
doc-publish-error-detail = publiceren mislukt [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = meld je opnieuw aan zodat ego toegang heeft tot je identiteitssleutels
doc-publish-hint-target = gebruik een geldige publisher-DID of alias die naar een kale did:ma:<ipns> verwijst
doc-publish-hint-network = controleer dat ma-runtime en IPFS bereikbaar zijn en probeer opnieuw
doc-publish-hint-resolve = controleer dat het DID-document van de publisher gepubliceerd is en een bereikbaar eindpunt bevat
doc-publish-hint-acl = vraag de publisher-operator om je DID in ACL toe te staan
doc-publish-hint-runtime = runtime/plugin heeft het verzoek geweigerd; bekijk de reden en probeer opnieuw na correctie van entiteit/runtime
doc-publish-hint-ipfs = controleer lokale Kubo/IPFS-gezondheid en status van de publisher-runtime
doc-publish-hint-unknown = bekijk runtime-logs voor de gedetailleerde oorzaak en probeer opnieuw
doc-store-sent = opslagverzoek verzonden ({ $id }) → { $publisher }; CID komt via RPC-antwoord
doc-ipld-store-sent = IPLD-opslagverzoek verzonden ({ $id }) → { $publisher }; CID komt via RPC-antwoord
doc-fetch-done = { $cid } opgehaald → { $path }.content (niet uitgevoerd)
doc-fetch-failed = ophalen { $cid }: { $e }
doc-fetch-usage = gebruik: .my.doc.<naam>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid is niet ingesteld
doc-no-verb = geen werkwoord `{ $verb }` voor { $path }
path-no-verb = geen werkwoord `{ $verb }` voor { $path }

# ── Helptekst — koppen ────────────────────────────────────────────────────
help-header-zion = ── zion-opdrachten ────────────────────────────────────────────────────────
help-header-messaging = ── berichten ─────────────────────────────────────────────────────────────
help-header-config = ── lokale configuratiegrammatica ──────────────────────────────────────
help-header-common = ── veelgebruikte paden ───────────────────────────────────────────────────
help-header-inbox = ── postvak in ────────────────────────────────────────────────────────────
help-header-documents = ── documenten ───────────────────────────────────────────────────────────
help-header-i18n = ── taal ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-ruimte betreden ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        deze tekst
help-cmd-clear =   .clear                       terminal leegmaken
help-cmd-panic =   .panic                       laatste redmiddel — gebruik als u in de problemen zit
help-cmd-history =   .history                     opdrachtgeschiedenis (opeenvolgende duplicaten samengevoegd)
help-cmd-logout =   .logout                      afmelden
help-cmd-batch =   .batch                       klad-document parallel evalueren
help-cmd-batch-sync =   .batch:sync / .batch         klad-document regel voor regel evalueren

help-msg-echo =   @alias                       opgeloste DID/DID-URL weergeven (geen bericht verzonden)
help-msg-send =   @alias!msg body / @alias:verb args           bericht / RPC sturen naar actor
help-msg-fragment =   @alias#fragment:verb body  sturen naar alias met expliciet DID-fragment
help-msg-escape =   \@name                       letterlijke @name (geen aliaszoekactie)


help-config-get =   .path                        bladwaarde ophalen of deelboom weergeven
help-config-filter =   .path value                  zoekfilter (filteren op waarde)
help-config-set =   .path: value                 blad instellen
help-config-delete =   .path:                       blad of deelboom verwijderen
help-config-verb =   .path!verb [args]            lokaal werkwoord uitvoeren

help-my =   .my                          alle persoonlijke configuratie weergeven
help-aliases =   .my.aliases                  aliassen weergeven
help-aliases-set =   .my.aliases.<name>: <did-url>    alias toevoegen/bijwerken (DID of DID-URL)
help-aliases-del =   .my.aliases.<name>:          alias verwijderen
help-runtime-discover =   .ma [port]          lokale runtime detecteren en @ma-alias aanmaken
help-runtime-claim =   .ma [port]             runtime claimen met uw DID
help-identity =   .my.identity                 identiteitsconfiguratie weergeven
help-identity-did =   .my.identity.did             eigen DID weergeven (alleen-lezen)
help-identity-publish =   .my.identity!publish @pub    eigen DID publiceren via uitgeversdienst
help-identity-export =   .my.identity!export          eigen identiteitsbundel downloaden
help-config-path =   .config                      alle .config.*-items weergeven

help-inbox =   .my.inbox                    postvak in weergeven (deelboomweergave)
help-inbox-n =   .my.inbox.N                  velden van item N weergeven
help-inbox-from =   .my.inbox.N.from             afzender-DID voor item N
help-inbox-reply =   .my.inbox.N!reply [body]     antwoord sturen (opent editor zonder inhoud)
help-inbox-open =   .my.inbox.N!open             inhoud openen in alleen-lezen editor
help-inbox-del =   .my.inbox.N:                 item N verwijderen
help-inbox-delall =   .my.inbox:                   alle items in postvak in verwijderen
help-inbox-flush =   .my.inbox!flush              alle items naar terminal afdrukken
help-inbox-filter =   .my.inbox!filter @who        toon alleen vermeldingen van @who
help-inbox-traverse =   .my.inbox.N.sender.<veld>   DID-document afzender lazy doorlopen

help-doc-edit =   .my.doc.<naam>!edit           editor openen met opgeslagen inhoud
help-doc-edit-cid =   .my.doc.<naam>!edit /ipfs/<cid>     CID ophalen, openen voor revisie
help-doc-eval =   .my.doc.<naam>!eval           opgeslagen inhoud regel voor regel uitvoeren
help-doc-publish =   .my.doc.<naam>!publish @pub   opslaan als ruwe blob (alle typen)
help-doc-publish-ipld =   .my.doc.<naam>!publish-ipld @pub  YAML opslaan als gestructureerd DAG-CBOR IPLD-knooppunt
help-doc-fetch =   .my.doc.<naam>!fetch /ipfs/<cid>    CID-inhoud importeren (geen uitvoering)
help-doc-cid =   .my.doc.<naam>!cid            opgeslagen CID weergeven
help-doc-del =   .my.doc.<naam>:              document verwijderen

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n slaat de taalvoorkeur op die verband houdt met uw identiteit.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lijst met beschikbare taalcodes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = De 間-kamer is de ruimte tussen 間-identiteiten. ma zorgt dat die identiteiten elkaar kunnen vinden en communiceren; zodra je identiteit is gepubliceerd, kun je meedoen.
help-ma-command =   .ma [port]                   verbind met je lokale ma-runtime, lees /status.json en sla .ma.ctx.* op
help-ma-publish =   .my.identity!publish @ma     publiceer je DID-document zodat anderen je sleutels en endpoint kunnen vinden
help-ma-security = De duidelijkste vertrouwensgrens is je eigen ma-runtime met je eigen IPFS Desktop/Kubo. Een externe publisher kan nuttig zijn, maar dan vertrouw je op de dienst van iemand anders.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hoe je de 間-kamer binnenkomt

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Wanneer je identiteit bekend is, laat .enter @ma je 間 binnenstappen. Zoek een wereld, ga naar binnen en doe van daaruit mee.
help-ma-entry-steps = Start IPFS Desktop en ma, voer daarna .ma uit. Publiceer met .my.identity!publish @ma, zoek een wereld en ga naar binnen met .enter @ma.
help-ma-entry-command =   .enter @ma                  間 binnengaan via de @ma-runtime
help-ma-entry-toggle =   .enter                       zet kamerfocus aan of uit; je identiteit blijft actief
help-ma-entry-url =   ?enter=<runtime>             binnengaan na login via een gedeelde URL

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
msg-chat = { $sender } zegt { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } zegt { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } betreedt de kamer.
room-leave = * { $name } verlaat de kamer.
room-drop  = * { $name } laat { $thing } vallen.
room-take  = * { $name } pakt { $thing } op.
err-edit-decode-failed = bewerking: decodering mislukt: { $e }
err-edit-fetch-failed = bewerking: ophalen mislukt: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = geen actieve sessie — profiel kan niet worden verwijderd
profile-delete-error = verwijderen van profiel mislukt: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profiel versleuteld en naar IPFS verzonden; het DID-document wordt bijgewerkt wanneer de CID binnenkomt
profile-publish-done = profiel gepubliceerd — DID-document bijgewerkt met ma.agent-CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identiteit al gepubliceerd - profiel up-to-date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binaire inhoud (niet weergegeven)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (geen)
profiles-deleted = profiel { $name } verwijderd
profiles-not-found = profiel niet gevonden: { $name }

# -- Help topics index
help-header-topics = -- onderwerpen -- typ .help/<topic> voor details
help-topic-msg =   .help/msg                    berichten
help-topic-ma = .help/ma                     ma-ruimte, publicatie en invoer
help-topic-path = .help/path                   lokale grammatica met puntpaden
help-topic-my =   .help/my                     persoonlijke config
help-topic-inbox =   .help/inbox                  postvak
help-topic-doc =   .help/doc                    documenten
help-topic-actor =   .help/actor                  externe actor
help-topic-zscheme =   .help/zscheme               inline Scheme-expressies en documentatie
help-topic-url =   .help/url                    zion openen via een URL-link
help-topic-i18n = .help/i18n                   taalvoorkeur voor uw identiteit
help-unknown-topic =   .help/{ $topic }: onbekend onderwerp

# -- Help actor section
help-header-actor = -- externe actors
help-actor-echo =   @actor                       toon opgeloste DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         stuur een direct/chat/emote-bericht
help-actor-ping = @actor:ping                  levendigheid ping
help-actor-entities =   @actor/entities              entiteiten tonen
help-actor-entities-get = @actor/entities/<n>          entiteitsknooppunt ophalen
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entiteit bewerken
help-actor-entities-del = @actor/entities/<n>:         entiteit verwijderen
help-actor-config-get =   @actor/config/<key>          configwaarde ophalen
help-actor-config-set =   @actor/config/<key>: val     configwaarde instellen
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL bewerken
help-actor-fragment =   @actor#entity                naar plugin sturen
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC naar plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  bewaar 5-antwoorden in de sessieomgeving
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URL-parameters ──────────────────────────────────────────────────────────
help-url-intro =   Deel een link die zion opent met een vooraf ingevulde ontvanger:
help-url-msg =   ?msg=<did>                   vult in: @<did>!msg (tekstbericht)
help-url-say =   ?say=<did>                   vult in: @<did>!say (say-werkwoord)
help-url-emote =   ?emote=<did>                 vult in: @<did>!emote (emote-werkwoord)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             voer de runtime-wereld in na het inloggen
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Het invoerveld wordt ingevuld maar niet verzonden — druk op Enter.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                je identiteit publiceren op het netwerk
help-header-publish = ── identiteit publiceren ────────────────────────────────────────────────────
help-publish-intro = Publiceren maakt je identiteit vindbaar op het netwerk. Anderen kunnen je DID opzoeken om je te bereiken.
help-publish-ma = Om te publiceren heb je ma (lokale runtime) nodig. Het koppelt ego aan IPFS/IPNS namens jou.
help-publish-steps = Stappen: voer '.ma [port]' uit om je lokale ma te detecteren, dan '.my.identity!publish @ma'.
help-publish-without = Zonder publiceren kunnen anderen je niet bereiken — zelfs als ze je DID kennen, kunnen ze je endpoint niet oplossen.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = geef een profielnaam op: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Batch verzamelen: typ opdrachten, eindig met .batch
batch-already-collecting = Er is al een batch verzameld: eindig eerst met .batch
batch-empty = Batch was leeg - niets om uit te voeren
batch-running = Batch wordt uitgevoerd…
batch-step-timeout = Er is een time-out opgetreden in de batchstap

batch-done = Batch klaar in { $secs }s — { $steps } stappen
batch-done-error = Batch klaar met fouten in { $secs }s — { $steps } stappen
msg-timeout = Bericht verlopen (geen antwoord in 60s)
err-unknown-command = onbekende opdracht: { $path }
err-read-only-path = { $path } is alleen-lezen
help-cmd-batch-async =   .batch:async / .batch        klad-document parallel evalueren


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } ophalen mislukt: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ongeldig CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Waarschuwing: Je privé IPNS-sleutel wordt naar deze uitvoeringsomgeving gestuurd voor identiteitspublicatie. Gebruik alleen een uitvoeringsomgeving die je volledig vertrouwt.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme evalueert Scheme-expressies die in zion-opdrachten zijn ingebed en voegt het resultaat vóór verzending in de regel in.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline voorbeeld; verzendt "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definities blijven bewaard voor de huidige inlogsessie
help-zscheme-doc = Documentatie: https://github.com/bahner/rust-ma-zscheme
