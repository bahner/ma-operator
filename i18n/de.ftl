# zion — Deutsch
lang-name = Deutsch

# ── Anmeldeseite ──────────────────────────────────────────────────────────
tab-login = anmelden
tab-new-identity = neue Identität
tab-import = importieren
label-passphrase = Passphrase
label-username = Benutzername
label-confirm-passphrase = Passphrase bestätigen
btn-login = anmelden
btn-export = exportieren
btn-generate = generieren
btn-new-endpoint = neuer Endpunkt
passphrase-warning = Verlorene Passphrase = verlorene Identität. Eine Wiederherstellung ist nicht möglich.
import-help = Wählen Sie eine exportierte .zion.json-Datei. Das Paket bleibt verschlüsselt.
status-unlocking = entsperrt...
status-generating = Identität wird generiert...
status-reading-file = Datei wird gelesen...
status-imported = '{ $name }' importiert — wechseln Sie zur Anmelde-Registerkarte
error-wrong-passphrase = falsche Passphrase: { $e }
error-identity-not-found = Identität '{ $name }' nicht gefunden
error-username-required = Benutzername erforderlich
error-passphrase-required = Passphrase erforderlich
error-passphrases-no-match = Passphrasen stimmen nicht überein

# ── Terminalsystemmeldungen ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — angemeldet als { $username }
msg-type-help = Geben Sie .help ein, um eine Liste der Befehle zu erhalten.
msg-connecting = Verbindung zu iroh wird hergestellt...
msg-iroh-ready = iroh-Endpunkt bereit
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID über lokales ma veröffentlicht ({ $url })
msg-identity-not-published = Identität nicht online gefunden — wenn ma lokal installiert ist, führe '.my.ma:discover' und dann '.my.identity:publish @ma' aus. Tippe '.help.publish' für Details.
msg-blocked = ⊗ gesperrt [{ $cap }]: { $from }
msg-focus-cleared = Fokus gelöscht
msg-focusing = Fokussierung auf { $did } als { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } gelöscht ({ $count } Einträge)
msg-read-only = { $path } ist schreibgeschützt
msg-subtree-set = { $path } ist ein Teilbaum; Setzen verweigert
msg-ancestor-leaf = Ein Vorfahre von { $path } ist ein Blatt; Überschatten verweigert
msg-key-not-found = Schlüssel nicht gefunden: { $path }
msg-no-match = keine Übereinstimmung
msg-link-not-connected = Link-Abruffehler: nicht verbunden
msg-link-fetch-error = Link-Abruffehler: { $e }
msg-link-key-not-found = Schlüssel `{ $key }` nicht im verknüpften Dokument gefunden

# ── Alias-Validierung ─────────────────────────────────────────────────────
err-alias-name-empty = Aliasname darf nicht leer sein
err-alias-has-dot = Aliasname darf kein '.' enthalten
err-alias-has-fragment = Aliasname darf kein '#' enthalten
err-alias-value-fragment = Aliaswert muss reines did:ma:<ipns> sein (kein Fragment)
err-alias-value-path = Aliaswert muss reines did:ma:<ipns> sein (kein Pfad)
err-alias-not-did = Aliaswert muss mit did:ma: beginnen
err-unknown-alias = unbekannter Alias: @{ $name }
err-bare-did = Reines did:ma:<ipns> erwartet (kein Fragment oder Pfad), erhalten { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Speichern
btn-eval = Ausführen
btn-cancel = Abbrechen
btn-close = Schließen
btn-reply = Antworten
btn-publish = Veröffentlichen
btn-publish-ipld = Veröffentlichen IPLD
msg-reply-sent = Antwort gesendet
msg-reply-failed = Antwort konnte nicht gesendet werden: { $e }
msg-entity-publish-sent = Entität { $name }: Veröffentlichung gesendet
msg-entity-publish-failed = Entitäts-Veröffentlichung fehlgeschlagen: { $e }
msg-kind-publish-failed = Typ-Veröffentlichung fehlgeschlagen: { $e }
msg-field-publish-sent = Entität { $name }.{ $field }: Veröffentlichung gesendet
msg-field-publish-failed = Feld-Veröffentlichung fehlgeschlagen: { $e }
msg-acl-publish-sent = Laufzeit-ACL: Veröffentlichung gesendet
msg-crud-edit-publish-sent = { $path }: Veröffentlichung gesendet
msg-acl-publish-failed = Laufzeit-ACL-Veröffentlichung fehlgeschlagen: { $e }
msg-yaml-error = YAML-Fehler: { $e }
msg-editor-saved = { $path }:speichern
msg-fetch-review = { $cid } abgerufen — vor Ausführung prüfen
msg-fetch-failed = Abruf { $cid }: { $e }

# ── Verben — Posteingang ──────────────────────────────────────────────────
inbox-empty = Posteingang ist leer
inbox-entry-not-found = Posteingangs-Eintrag { $n } nicht gefunden
inbox-no-message-id = Posteingangs-Eintrag { $n } hat keine message_id
inbox-no-verb = kein Verb `{ $verb }` für Posteingangs-Eintrag { $n }
inbox-filter-no-arg = Filter benötigt ein DID- oder Alias-Argument
inbox-filter-empty = keine Nachrichten von { $did }

# ── Verben — Laufzeit ─────────────────────────────────────────────────────
discover-fetch-failed = Erkennung fehlgeschlagen bei { $url }: { $e }
discover-json-error = Erkennung fehlgeschlagen: ungültiges JSON von { $url }: { $e }
discover-missing-did = Erkennung fehlgeschlagen: status.json fehlt Pflichtfeld `did`
discover-invalid-did = Erkennung fehlgeschlagen: `did` sollte mit did:ma: beginnen, erhalten `{ $did }`
discover-no-endpoint = Erkennungswarnung: `endpoint_id` fehlt in status.json; nur DID gespeichert
discover-success = ma erkannt bei { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   Alias @ma erstellt — führe '.my.identity:publish @ma' aus, um deine Identität zu veröffentlichen.
claim-success = Laufzeit für { $did } beansprucht
claim-conflict = Laufzeit bereits von einer anderen Identität beansprucht
claim-http-failed = Beanspruchung fehlgeschlagen: HTTP { $status }
claim-error = Beanspruchung fehlgeschlagen: { $e }
claim-no-session = nicht angemeldet; bitte zuerst anmelden, um die Laufzeit zu beanspruchen
runtime-no-verb = kein Verb `{ $verb }` für { $path }

# ── Verben — Zugriffskontrolle ────────────────────────────────────────────
acl-reset = .my.acl zurückgesetzt (vollständig offen)
acl-persist-error = Speicherfehler: { $e }
acl-no-verb = kein Verb `{ $verb }` für .my.acl

# ── Verben — Identität ────────────────────────────────────────────────────
publish-usage = Verwendung: .my.identity:publish <did-oder-alias>
identity-exported = Paket heruntergeladen als { $filename }
identity-export-failed = Export fehlgeschlagen: { $e }

# ── Verben — Dokumente ────────────────────────────────────────────────────
doc-content-empty = { $path }.content ist leer
doc-save-first = { $path }.content ist leer — bitte zuerst speichern
doc-missing-name = Dokumentname fehlt
doc-publish-usage = Verwendung: .my.doc.<name>:publish <herausgeber>
doc-publish-ipld-usage = Verwendung: .my.doc.<name>:publish-ipld <herausgeber>
doc-publish-failed = Veröffentlichung { $path }: { $e }
doc-publish-ipld-failed = IPLD-Veröffentlichung { $path }: { $e }
doc-store-sent = Speicheranfrage gesendet ({ $id }) → { $publisher }; CID kommt per RPC-Antwort
doc-ipld-store-sent = IPLD-Speicheranfrage gesendet ({ $id }) → { $publisher }; CID kommt per RPC-Antwort
doc-fetch-done = { $cid } abgerufen → { $path }.content (nicht ausgeführt)
doc-fetch-failed = Abruf { $cid }: { $e }
doc-fetch-usage = Verwendung: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ist nicht gesetzt
doc-no-verb = kein Verb `{ $verb }` für { $path }
path-no-verb = kein Verb `{ $verb }` für { $path }

# ── Hilfetext — Überschriften ─────────────────────────────────────────────
help-header-zion = ── zion-Befehle ───────────────────────────────────────────────────────────
help-header-messaging = ── Nachrichten ───────────────────────────────────────────────────────────
help-header-focus = ── Fokusmodus ────────────────────────────────────────────────────────────
help-header-config = ── lokale Konfigurationsgrammatik ────────────────────────────────────────
help-header-common = ── häufige Pfade ─────────────────────────────────────────────────────────
help-header-inbox = ── Posteingang ───────────────────────────────────────────────────────────
help-header-documents = ── Dokumente ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        dieser Text
help-cmd-clear =   .clear                       Terminal leeren
help-cmd-panic =   .panic                       letztes Mittel — verwenden, wenn Sie in der Klemme sitzen
help-cmd-history =   .history                     Befehlsverlauf (aufeinanderfolgende Duplikate zusammengefasst)
help-cmd-logout =   .logout                      abmelden
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       aufgelöstes DID anzeigen (keine Nachricht gesendet)
help-msg-send =   @alias[:verb] body           Nachricht / RPC an Akteur senden
help-msg-fragment =   @alias#fragment[:verb] body  an Alias mit explizitem DID-Fragment senden
help-msg-escape =   \@name                       wörtliches @name (keine Alias-Suche)

help-focus-set =   .use @alias [as @name]       auf Akteur fokussieren (ändert Eingabeaufforderung)
help-focus-clear =   .use                         Fokus löschen

help-config-get =   .path                        Blattwert abrufen oder Teilbaum auflisten
help-config-filter =   .path value                  Suchfilter (nach Wert filtern)
help-config-set =   .path: value                 Blatt setzen
help-config-delete =   .path:                       Blatt oder Teilbaum löschen
help-config-verb =   .path:verb [args]            lokales Verb ausführen

help-my =   .my                          alle persönlichen Konfigurationen anzeigen
help-aliases =   .my.aliases                  Aliase auflisten
help-aliases-set =   .my.aliases.<name>: <did>    Alias hinzufügen/aktualisieren (reines DID, kein #Fragment)
help-aliases-del =   .my.aliases.<name>:          Alias entfernen
help-runtime-discover =   .my.ma:discover          lokale Laufzeit erkennen und @ma-Alias erstellen
help-runtime-claim =   .my.ma:claim             Laufzeit mit Ihrer DID beanspruchen
help-identity =   .my.identity                 Identitätskonfiguration anzeigen
help-identity-did =   .my.identity.did             eigene DID anzeigen (schreibgeschützt)
help-identity-publish =   .my.identity:publish @pub    eigene DID über Herausgeber-Dienst veröffentlichen
help-identity-export =   .my.identity:export          eigenes Identitätspaket herunterladen
help-config-path =   .config                      alle .config.*-Einträge anzeigen

help-inbox =   .my.inbox                    Posteingang auflisten (Teilbaumansicht)
help-inbox-n =   .my.inbox.N                  Felder von Eintrag N anzeigen
help-inbox-from =   .my.inbox.N.from             Absender-DID für Eintrag N
help-inbox-reply =   .my.inbox.N:reply [body]     Antwort senden (öffnet Editor ohne Text)
help-inbox-open =   .my.inbox.N:open             Inhalt im schreibgeschützten Editor öffnen
help-inbox-del =   .my.inbox.N:                 Eintrag N löschen
help-inbox-delall =   .my.inbox:                   alle Posteingangs-Einträge löschen
help-inbox-flush =   .my.inbox:flush              alle Einträge im Terminal ausgeben
help-inbox-filter =   .my.inbox:filter @who        nur Einträge von @who anzeigen
help-inbox-traverse =   .my.inbox.N.sender.<feld>   DID-Dokument des Absenders lazy traversieren

help-doc-edit =   .my.doc.<name>:edit           Editor mit gespeichertem Inhalt öffnen
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID abrufen, zur Überprüfung öffnen
help-doc-eval =   .my.doc.<name>:eval           gespeicherten Inhalt zeilenweise ausführen
help-doc-publish =   .my.doc.<name>:publish @pub   als Raw-Blob speichern (alle Typen)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML als strukturierten DAG-CBOR IPLD-Knoten speichern
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID-Inhalt importieren (keine Ausführung)
help-doc-cid =   .my.doc.<name>:cid            gespeicherte CID anzeigen
help-doc-del =   .my.doc.<name>:              Dokument löschen

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Verfügbare Sprachen (setzen mit .my.i18n: <code>):
err-lang-not-found = Sprache nicht gefunden: { $lang }

msg-send-failed = Senden fehlgeschlagen: { $e }
msg-not-logged-in = nicht angemeldet

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-Analysefehler: { $e }
yaml-not-mapping = YAML muss ein Mapping (Schlüssel-Wert-Paare) sein; einfacher Text und skalare Werte können nicht als DAG-CBOR gespeichert werden
dagcbor-encode-error = DAG-CBOR-Kodierungsfehler: { $e }
cbor-decode-error = CBOR-Dekodierungsfehler: { $e }
cbor-json-error = CBOR-nach-JSON-Fehler: { $e }
yaml-serialize-error = YAML-Serialisierungsfehler: { $e }
edit-reply-invalid = Ungültige Bearbeitungsantwort
doc-publish-ipld-error = IPLD-Veröffentlichung fehlgeschlagen: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Posteingang-Bereinigung Speicherfehler: { $e }
err-config-load = Konfigurationsladefolher: { $e }
err-lang-persist = Sprachspeicherfehler: { $e }
err-history-parse = Verlaufsanalysefehler: { $e }
err-history-load = Verlaufsladefolher: { $e }
err-ipfs-reply-decode = IPFS-Antwort-Dekodierung fehlgeschlagen: { $e }
err-edit-cbor = CBOR-Bearbeitungsfehler: { $e }
err-popup-blocked = Popup vom Browser blockiert
status-publishing = veröffentlicht

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = Fehler
rpc-error-detail = Fehler: { $detail }
msg-new-message = ← [{ $from }] neue Nachricht — { $count } im Posteingang
msg-chat = { $sender } sagt { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } sagt { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } betritt den Raum.
room-leave = * { $name } verlässt den Raum.
room-drop  = * { $name } lässt { $thing } fallen.
room-take  = * { $name } hebt { $thing } auf.
err-edit-decode-failed = Bearbeitung: Dekodierfehler: { $e }
err-edit-fetch-failed = Bearbeitung: Ladefehler: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = keine aktive Sitzung — Profil kann nicht gelöscht werden
profile-delete-error = Profil konnte nicht gelöscht werden: { $e }
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
profiles-empty = (keine)
profiles-deleted = Profil { $name } gelöscht
profiles-not-found = Profil nicht gefunden: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    zion über einen URL-Link öffnen
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
help-header-url = ── URL-Parameter ───────────────────────────────────────────────────────────
help-url-intro =   Link teilen, der zion mit vorausgefülltem Empfänger öffnet:
help-url-msg =   ?msg=<did>                   vorausfüllen: @<did> (Textnachricht)
help-url-say =   ?say=<did>                   vorausfüllen: @<did>:say (Say-Verb)
help-url-emote =   ?emote=<did>                 vorausfüllen: @<did>:emote (Emote-Verb)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Das Eingabefeld wird gefüllt, aber nicht gesendet — Enter drücken zum Senden.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                Identität im Netzwerk veröffentlichen
help-header-publish = ── Identität veröffentlichen ────────────────────────────────────────────────
help-publish-intro = Durch Veröffentlichung wird deine Identität im Netzwerk auffindbar. Andere können deine DID nachschlagen, um dich zu erreichen.
help-publish-ma = Zum Veröffentlichen benötigst du ma (lokale Laufzeit). Es verbindet ego mit IPFS/IPNS in deinem Auftrag.
help-publish-steps = Schritte: führe '.my.ma:discover' aus, um dein lokales ma zu finden, dann '.my.identity:publish @ma'.
help-publish-without = Ohne Veröffentlichung können andere dich nicht erreichen — selbst wenn sie deine DID kennen, können sie deinen Endpunkt nicht auflösen.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
