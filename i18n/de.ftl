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

# ── Verben — Laufzeit ─────────────────────────────────────────────────────
discover-fetch-failed = Erkennung fehlgeschlagen bei { $url }: { $e }
discover-json-error = Erkennung fehlgeschlagen: ungültiges JSON von { $url }: { $e }
discover-missing-did = Erkennung fehlgeschlagen: status.json fehlt Pflichtfeld `did`
discover-invalid-did = Erkennung fehlgeschlagen: `did` sollte mit did:ma: beginnen, erhalten `{ $did }`
discover-no-endpoint = Erkennungswarnung: `endpoint_id` fehlt in status.json; nur DID gespeichert
discover-success = ma erkannt bei { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   Alias @ma erstellt — veröffentlichen mit: .my.identity:publish @ma
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
help-config-path =   .config                      alle .config.*-Einträge anzeigen

help-inbox =   .my.inbox                    Posteingang auflisten (Teilbaumansicht)
help-inbox-n =   .my.inbox.N                  Felder von Eintrag N anzeigen
help-inbox-from =   .my.inbox.N.from             Absender-DID für Eintrag N
help-inbox-reply =   .my.inbox.N:reply [body]     Antwort senden (öffnet Editor ohne Text)
help-inbox-open =   .my.inbox.N:open             Inhalt im schreibgeschützten Editor öffnen
help-inbox-del =   .my.inbox.N:                 Eintrag N löschen
help-inbox-delall =   .my.inbox:                   alle Posteingangs-Einträge löschen
help-inbox-flush =   .my.inbox:flush              alle Einträge im Terminal ausgeben
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
err-edit-decode-failed = Bearbeitung: Dekodierfehler: { $e }
err-edit-fetch-failed = Bearbeitung: Ladefehler: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = keine aktive Sitzung — Profil kann nicht gelöscht werden
profile-delete-error = Profil konnte nicht gelöscht werden: { $e }

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
