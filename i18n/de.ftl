# zion — Deutsch
lang-name = Deutsch
label-nick = Spitzname
new-identity-nick-help = Wähle einen Spitznamen für ma-space. Es ist nur ein Spitzname und kann jederzeit geändert werden.
error-nick-required = Spitzname erforderlich
error-nick-invalid = Der Spitzname darf keine Leerzeichen oder @ enthalten

# ── Anmeldeseite ──────────────────────────────────────────────────────────
tab-login = anmelden
tab-new-identity = neue Identität
tab-import-profile = Profil importieren
label-passphrase = Passphrase
label-username = Benutzername
label-confirm-passphrase = Passphrase bestätigen
label-did = DID
label-profile-cid = Profil-CID
label-or-file = oder Datei
btn-login = anmelden
btn-export = exportieren
btn-generate = generieren
btn-new-endpoint = neuer Endpunkt
btn-import-profile = Profil importieren
btn-show-qr = QR anzeigen
btn-scan-qr = QR scannen
qr-scan-hint = Richten Sie die Kamera auf einen zion-Profil-QR-Code.
qr-error-camera = Kamera nicht verfügbar: { $e }
qr-error-too-large = Profil zu groß für einen QR-Code
passphrase-warning = Verlorene Passphrase = verlorene Identität. Eine Wiederherstellung ist nicht möglich.
import-profile-help = Importieren Sie ein Profil per CID oder Datei. Sie benötigen dieselbe Passphrase, die beim Veröffentlichen verwendet wurde.
import-profile-detected-user = Profil gehört: { $name }
status-unlocking = entsperrt...
status-generating = Identität wird generiert...
status-reading-file = Datei wird gelesen...
status-fetching-profile = Profil wird von IPFS abgerufen...
status-imported = '{ $name }' importiert — wechseln Sie zur Anmelde-Registerkarte
status-importing-profile = Profil wird importiert...
profile-import-done = Profil für '{ $name }' importiert — { $n } Schlüssel geladen
error-wrong-passphrase = falsche Passphrase: { $e }
error-identity-not-found = Identität '{ $name }' nicht gefunden
error-username-required = Benutzername erforderlich
error-passphrase-required = Passphrase erforderlich
error-passphrases-no-match = Passphrasen stimmen nicht überein
error-profile-source-required = CID angeben oder Datei hochladen
error-did-required = DID eingeben
error-profile-fetch = Profil konnte nicht abgerufen werden: { $e }
error-profile-no-username = Profil enthält keinen Benutzernamen
error-profile-no-identity = Identität '{ $name }' nicht gefunden — Identität zuerst importieren

# ── Terminalsystemmeldungen ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — angemeldet als { $username }
msg-type-help = Geben Sie .help ein, um eine Liste der Befehle zu erhalten.
msg-getting-started = Probieren Sie: say Hello world, look, .help oder help.
msg-connecting = Verbindung zu iroh wird hergestellt...
msg-iroh-ready = iroh-Endpunkt bereit
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID über lokales ma veröffentlicht ({ $url })
msg-identity-publication-propagating = Die Identitätsveröffentlichung wird noch verbreitet; entry ist verzögert: { $e }
msg-identity-first-publish = Identität wird zum ersten Mal veröffentlicht. Das kann bis zu { $seconds } Sekunden dauern.
msg-ma-connecting-matrix = versuche, dich mit der 間trix zu verbinden
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokales 間 beansprucht
msg-local-ma-already-claimed = lokales 間 ist bereits beansprucht
msg-local-ma-claim-failed = lokales 間 konnte nicht beansprucht werden
msg-identity-not-published = Identität nicht online gefunden — wenn ma lokal installiert ist, führe '.ma [port]' und dann '.my.identity!publish @ma' aus. Tippe '.help/publish' für Details.
msg-blocked = ⊗ gesperrt [{ $cap }]: { $from }
msg-focus-cleared = Fokus gelöscht
msg-focusing = Fokussierung auf { $did } als { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } gelöscht ({ $count } Einträge)
msg-read-only = { $path } ist schreibgeschützt
msg-subtree-set = { $path } ist ein Teilbaum; Setzen verweigert
msg-ancestor-leaf = Ein Vorfahre von { $path } ist ein Blatt; Überschatten verweigert
msg-key-not-found = Schlüssel nicht gefunden: { $path }
msg-link-not-connected = Link-Abruffehler: nicht verbunden
msg-link-fetch-error = Link-Abruffehler: { $e }
msg-link-key-not-found = Schlüssel `{ $key }` nicht im verknüpften Dokument gefunden

# ── Alias-Validierung ─────────────────────────────────────────────────────
err-alias-name-empty = Aliasname darf nicht leer sein
err-alias-has-dot = Aliasname darf kein '.' enthalten
err-alias-has-fragment = Aliasname darf kein '#' enthalten
err-alias-value-fragment = Aliaswert darf höchstens ein nicht-leeres DID-URL-Fragment enthalten
err-alias-value-path = Aliaswert muss eine did:ma:<ipns>-DID oder DID-URL sein (kein Pfad)
err-alias-not-did = Aliaswert muss mit did:ma: beginnen
err-unknown-alias = unbekannter Alias: @{ $name }
err-bare-did = Reines did:ma:<ipns> erwartet (kein Fragment oder Pfad), erhalten { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Speichern
btn-eval = Ausführen
btn-cancel = Abbrechen
msg-jobs-cancelled = Aufträge abgebrochen
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
discover-hint-endpoint-not-found = Hinweis: Endpunkt nicht gefunden. Prüfe, dass `ma` läuft und /status.json auf Port 5003 bereitstellt.
discover-hint-server-error = Hinweis: Die Laufzeit antwortete mit einem Serverfehler. Prüfe die `ma`-Logs und versuche es erneut.
discover-hint-network = Hinweis: Netzwerk-/Verbindungsproblem. Starte `ma`, prüfe localhost:5003 und erlaube lokalen HTTP-Zugriff im Browser.
discover-hint-generic = Hinweis: Prüfe, dass `ma` und IPFS Desktop laufen, und versuche `.ma` erneut.
discover-success = ma erkannt bei { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   Alias @ma erstellt — führe '.my.identity!publish @ma' aus, um deine Identität zu veröffentlichen.
claim-success = Laufzeit für { $did } beansprucht
claim-conflict = Laufzeit bereits von einer anderen Identität beansprucht
claim-already-owned = Runtime wurde bereits von dieser Identität beansprucht
claim-http-failed = Beanspruchung fehlgeschlagen: HTTP { $status }
claim-error = Beanspruchung fehlgeschlagen: { $e }
claim-no-session = nicht angemeldet; bitte zuerst anmelden, um die Laufzeit zu beanspruchen
runtime-no-verb = kein Verb `{ $verb }` für { $path }

# ── Verben — Zugriffskontrolle ────────────────────────────────────────────
acl-reset = .my.acl zurückgesetzt (vollständig offen)
acl-persist-error = Speicherfehler: { $e }
acl-no-verb = kein Verb `{ $verb }` für .my.acl

# ── Verben — Identität ────────────────────────────────────────────────────
publish-usage = Verwendung: .my.identity!publish <did-oder-alias>
identity-exported = Paket heruntergeladen als { $filename }
identity-export-failed = Export fehlgeschlagen: { $e }

# ── Verben — Dokumente ────────────────────────────────────────────────────
doc-content-empty = { $path }.content ist leer
doc-save-first = { $path }.content ist leer — bitte zuerst speichern
doc-missing-name = Dokumentname fehlt
doc-publish-usage = Verwendung: .my.doc.<name>!publish <herausgeber>
doc-publish-ipld-usage = Verwendung: .my.doc.<name>!publish-ipld <herausgeber>
doc-publish-failed = Veröffentlichung { $path }: { $e }
doc-publish-ipld-failed = IPLD-Veröffentlichung { $path }: { $e }
doc-publish-error-detail = Veröffentlichung fehlgeschlagen [{ $code }]: { $err }
doc-publish-error-hint = Hinweis: { $hint }
doc-publish-hint-session = melde dich erneut an, damit ego auf deine Identitätsschlüssel zugreifen kann
doc-publish-hint-target = verwende eine gültige Publisher-DID oder einen Alias, der zu einer reinen did:ma:<ipns> auflöst
doc-publish-hint-network = prüfe, dass ma-Laufzeit und IPFS erreichbar sind, und versuche es erneut
doc-publish-hint-resolve = prüfe, dass das DID-Dokument des Publishers veröffentlicht ist und einen erreichbaren Endpunkt enthält
doc-publish-hint-acl = bitte den Publisher-Betreiber, deine DID in der ACL zu erlauben
doc-publish-hint-runtime = Laufzeit/Plugin hat die Anfrage abgelehnt; prüfe den Grund und versuche es nach Korrektur von Entität/Laufzeit erneut
doc-publish-hint-ipfs = prüfe lokalen Kubo/IPFS-Zustand und den Status der Publisher-Laufzeit
doc-publish-hint-unknown = prüfe die Laufzeit-Logs auf die genaue Ursache und versuche es erneut
doc-store-sent = Speicheranfrage gesendet ({ $id }) → { $publisher }; CID kommt per RPC-Antwort
doc-ipld-store-sent = IPLD-Speicheranfrage gesendet ({ $id }) → { $publisher }; CID kommt per RPC-Antwort
doc-fetch-done = { $cid } abgerufen → { $path }.content (nicht ausgeführt)
doc-fetch-failed = Abruf { $cid }: { $e }
doc-fetch-usage = Verwendung: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ist nicht gesetzt
doc-no-verb = kein Verb `{ $verb }` für { $path }
path-no-verb = kein Verb `{ $verb }` für { $path }

# ── Hilfetext — Überschriften ─────────────────────────────────────────────
help-header-zion = ── zion-Befehle ───────────────────────────────────────────────────────────
help-header-messaging = ── Nachrichten ───────────────────────────────────────────────────────────
help-header-config = ── lokale Konfigurationsgrammatik ────────────────────────────────────────
help-header-common = ── häufige Pfade ─────────────────────────────────────────────────────────
help-header-inbox = ── Posteingang ───────────────────────────────────────────────────────────
help-header-documents = ── Dokumente ─────────────────────────────────────────────────────────────
help-header-i18n = ── Sprache ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── Betreten des 間-Leerzeichens ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        dieser Text
help-cmd-clear =   .clear                       Terminal leeren
help-cmd-panic =   .panic                       letztes Mittel — verwenden, wenn Sie in der Klemme sitzen
help-cmd-history =   .history                     Befehlsverlauf (aufeinanderfolgende Duplikate zusammengefasst)
help-cmd-logout =   .logout                      abmelden
help-cmd-batch =   .batch                       Scratch-Dokument parallel auswerten
help-cmd-batch-sync =   .batch:sync / .batch         Scratch-Dokument zeilenweise auswerten

help-msg-echo =   @alias                       aufgelöste DID/DID-URL anzeigen (keine Nachricht gesendet)
help-msg-send =   @alias!msg body / @alias:verb args           Nachricht / RPC an Akteur senden
help-msg-fragment =   @alias#fragment:verb body  an Alias mit explizitem DID-Fragment senden
help-msg-escape =   \@name                       wörtliches @name (keine Alias-Suche)


help-config-get =   .path                        Blattwert abrufen oder Teilbaum auflisten
help-config-set =   .path: value                 Blatt setzen
help-config-delete =   .path:                       Blatt oder Teilbaum löschen
help-config-verb =   .path!verb [args]            lokales Verb ausführen

help-my =   .my                          alle persönlichen Konfigurationen anzeigen
help-aliases =   .my.aliases                  Aliase auflisten
help-aliases-set =   .my.aliases.<name>: <did-url>    Alias hinzufügen/aktualisieren (DID oder DID-URL)
help-aliases-del =   .my.aliases.<name>:          Alias entfernen
help-runtime-discover =   .ma [port]          lokale Laufzeit erkennen und @ma-Alias erstellen
help-runtime-claim =   .ma [port]             Laufzeit mit Ihrer DID beanspruchen
help-identity =   .my.identity                 Identitätskonfiguration anzeigen
help-identity-did =   .my.identity.did             eigene DID anzeigen (schreibgeschützt)
help-identity-publish =   .my.identity!publish @pub    eigene DID über Herausgeber-Dienst veröffentlichen
help-identity-export =   .my.identity!export          eigenes Identitätspaket herunterladen
help-config-path =   .config                      alle .config.*-Einträge anzeigen

help-inbox =   .my.inbox                    Posteingang auflisten (Teilbaumansicht)
help-inbox-n =   .my.inbox.N                  Felder von Eintrag N anzeigen
help-inbox-from =   .my.inbox.N.from             Absender-DID für Eintrag N
help-inbox-reply =   .my.inbox.N!reply [body]     Antwort senden (öffnet Editor ohne Text)
help-inbox-open =   .my.inbox.N!open             Inhalt im schreibgeschützten Editor öffnen
help-inbox-del =   .my.inbox.N:                 Eintrag N löschen
help-inbox-delall =   .my.inbox:                   alle Posteingangs-Einträge löschen
help-inbox-flush =   .my.inbox!flush              alle Einträge im Terminal ausgeben
help-inbox-filter =   .my.inbox!filter @who        nur Einträge von @who anzeigen
help-inbox-traverse =   .my.inbox.N.sender.<feld>   DID-Dokument des Absenders lazy traversieren

help-doc-edit =   .my.doc.<name>!edit           Editor mit gespeichertem Inhalt öffnen
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID abrufen, zur Überprüfung öffnen
help-doc-eval =   .my.doc.<name>!eval           gespeicherten Inhalt zeilenweise ausführen
help-doc-publish =   .my.doc.<name>!publish @pub   als Raw-Blob speichern (alle Typen)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML als strukturierten DAG-CBOR IPLD-Knoten speichern
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID-Inhalt importieren (keine Ausführung)
help-doc-cid =   .my.doc.<name>!cid            gespeicherte CID anzeigen
help-doc-del =   .my.doc.<name>:              Dokument löschen

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n speichert die mit Ihrer Identität verknüpfte Sprachpräferenz.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               Liste der verfügbaren Sprachcodes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Der 間-Raum ist der Raum zwischen 間-Identitäten. ma sorgt dafür, dass diese Identitäten einander finden und kommunizieren können; sobald deine Identität veröffentlicht ist, kannst du teilnehmen.
help-ma-command =   .ma [port]                   mit deinem lokalen ma-Runtime verbinden, /status.json lesen und .ma.ctx.* speichern
help-ma-publish =   .my.identity!publish @ma     dein DID-Dokument veröffentlichen, damit andere deine Schlüssel und deinen Endpoint auflösen können
help-ma-security = Die klarste Vertrauensgrenze ist dein eigener ma-Runtime mit deinem eigenen IPFS Desktop/Kubo. Ein entfernter Publisher kann nützlich sein, aber dann verlässt du dich auf den Dienst einer anderen Person.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             wie du den 間-Raum betrittst

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Wenn deine Identität bekannt ist, lässt dich .enter @ma in 間 eintreten. Such dir eine Welt, tritt ein und nimm von dort aus teil.
help-ma-entry-steps = Starte IPFS Desktop und ma, führe dann .ma aus. Veröffentliche mit .my.identity!publish @ma, such dir eine Welt und tritt mit .enter @ma ein.
help-ma-entry-command =   .enter @ma                  間 über den @ma-Runtime betreten
help-ma-entry-toggle =   .enter                       Raumfokus ein- oder ausschalten; deine Identität bleibt aktiv
help-ma-entry-url =   ?enter=<runtime>             nach dem Login über eine geteilte URL eintreten

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
yaml-serialise-error = YAML-Serialisierungsfehler: { $e }
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
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = Profil verschlüsselt und an IPFS gesendet; das DID-Dokument wird aktualisiert, sobald die CID eintrifft
profile-publish-done = Profil veröffentlicht — DID-Dokument mit ma.agent-CID aktualisiert
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = Identität bereits veröffentlicht – Profil aktuell
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binärer Inhalt (nicht angezeigt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (keine)
profiles-deleted = Profil { $name } gelöscht
profiles-not-found = Profil nicht gefunden: { $name }

# -- Help topics index
help-header-topics = -- Themen -- .help/<topic> für Details eingeben
help-topic-msg =   .help/msg                    Nachrichten
help-topic-ma = .help/ma                     ma-Raum, Veröffentlichung und Eintrag
help-topic-path = .help/path                   Lokale Punkt-Pfad-Grammatik
help-topic-my =   .help/my                     persönliche Konfiguration
help-topic-inbox =   .help/inbox                  Posteingang
help-topic-doc =   .help/doc                    Dokumente
help-topic-actor =   .help/actor                  entfernter Actor
help-topic-zscheme =   .help/zscheme               eingebettete Scheme-Ausdrücke und Dokumentation
help-topic-url =   .help/url                    zion über einen URL-Link öffnen
help-topic-i18n = .help/i18n                   Sprachpräferenz für Ihre Identität
help-unknown-topic =   .help/{ $topic }: unbekanntes Thema

# -- Help actor section
help-header-actor = -- entfernte Actors
help-actor-echo =   @actor                       aufgelöste DID anzeigen
help-actor-text = @actor[#entity]!msg|!say|!emote body         Senden Sie eine Direkt-/Chat-/Emote-Nachricht
help-actor-ping = @actor:ping                  Liveness-Ping
help-actor-entities =   @actor/entities              Entitäten auflisten
help-actor-entities-get = @actor/entities/<n>          Entitätsknoten abrufen
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     Entität bearbeiten
help-actor-entities-del = @actor/entities/<n>:         Entität löschen
help-actor-config-get =   @actor/config/<key>          Konfigurationswert lesen
help-actor-config-set =   @actor/config/<key>: val     Konfigurationswert setzen
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL bearbeiten
help-actor-fragment =   @actor#entity                an Plugin senden
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC an Plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  Behalten Sie 5-Antworten in der Sitzungsumgebung bei
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URL-Parameter ───────────────────────────────────────────────────────────
help-url-intro =   Link teilen, der zion mit vorausgefülltem Empfänger öffnet:
help-url-msg =   ?msg=<did>                   vorausfüllen: @<did>!msg (Textnachricht)
help-url-say =   ?say=<did>                   vorausfüllen: @<did>!say (Say-Verb)
help-url-emote =   ?emote=<did>                 vorausfüllen: @<did>!emote (Emote-Verb)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             Betreten Sie nach der Anmeldung die Laufzeitwelt
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Das Eingabefeld wird gefüllt, aber nicht gesendet — Enter drücken zum Senden.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                Identität im Netzwerk veröffentlichen
help-header-publish = ── Identität veröffentlichen ────────────────────────────────────────────────
help-publish-intro = Durch Veröffentlichung wird deine Identität im Netzwerk auffindbar. Andere können deine DID nachschlagen, um dich zu erreichen.
help-publish-ma = Zum Veröffentlichen benötigst du ma (lokale Laufzeit). Es verbindet ego mit IPFS/IPNS in deinem Auftrag.
help-publish-steps = Schritte: führe '.ma [port]' aus, um dein lokales ma zu finden, dann '.my.identity!publish @ma'.
help-publish-without = Ohne Veröffentlichung können andere dich nicht erreichen — selbst wenn sie deine DID kennen, können sie deinen Endpunkt nicht auflösen.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = Profilnamen angeben: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Batch sammeln – Befehle eingeben, mit .batch enden
batch-already-collecting = Es wird bereits ein Stapel gesammelt – beenden Sie zuerst mit .batch
batch-empty = Die Charge war leer – nichts zum Ausführen
batch-running = Batch läuft…
batch-step-timeout = Zeitüberschreitung beim Batch-Schritt

batch-done = Batch fertig in { $secs }s — { $steps } Schritte
batch-done-error = Batch mit Fehlern fertig in { $secs }s — { $steps } Schritte
msg-timeout = Nachricht abgelaufen (keine Antwort in 60s)
err-unknown-command = unbekannter Befehl: { $path }
err-read-only-path = { $path } ist schreibgeschützt
help-cmd-batch-async =   .batch:async / .batch        Scratch-Dokument parallel auswerten


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } konnte nicht abgerufen werden: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Kein gültiger CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Warnung: Dein privater IPNS-Schlüssel wird an diese Laufzeitumgebung zur Identitätspublizierung gesendet. Verwende nur eine Laufzeitumgebung, der du vollständig vertraust.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme wertet Scheme-Ausdrücke aus, die in zion-Befehle eingebettet sind, und fügt das Ergebnis vor dem Senden in die Zeile ein.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    eingebettetes Beispiel; sendet "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             Definitionen bleiben für die aktuelle Login-Sitzung erhalten
help-zscheme-doc = Dokumentation: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Lokales IPFS-Gateway (Browser-Ausnahme erforderlich)

tab-config = Einstellungen
label-gateway = gateway
