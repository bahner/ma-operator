# zion — Polski
lang-name = Polski

# ── Strona logowania ──────────────────────────────────────────────────────
tab-login = zaloguj
tab-new-identity = nowa tożsamość
tab-import = importuj
label-passphrase = hasło
label-username = nazwa użytkownika
label-confirm-passphrase = potwierdź hasło
btn-login = zaloguj
btn-export = eksportuj
btn-generate = generuj
passphrase-warning = Utracone hasło = utracona tożsamość. Odzyskanie nie jest możliwe.
import-help = Wybierz wyeksportowany plik .zion.json. Pakiet pozostaje zaszyfrowany.
status-unlocking = odblokowywanie...
status-generating = generowanie tożsamości...
status-reading-file = odczyt pliku...
status-imported = '{ $name }' zaimportowano — przejdź do zakładki Zaloguj
error-wrong-passphrase = błędne hasło: { $e }
error-identity-not-found = tożsamość '{ $name }' nie znaleziona
error-username-required = nazwa użytkownika jest wymagana
error-passphrase-required = hasło jest wymagane
error-passphrases-no-match = hasła nie pasują do siebie

# ── Komunikaty systemowe terminala ────────────────────────────────────────
msg-logged-in = zion v{ $version } — zalogowano jako { $username }
msg-type-help = Wpisz .help, aby uzyskać listę poleceń.
msg-connecting = łączenie z iroh...
msg-iroh-ready = punkt końcowy iroh gotowy
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Tożsamość nie znaleziona online — uruchom '.my.identity:publish @ma', aby stać się osiągalnym.
msg-blocked = ⊗ zablokowano [{ $cap }]: { $from }
msg-focus-cleared = fokus wyczyszczony
msg-focusing = fokusowanie na { $did } jako { $prompt }
msg-set = { $path }: { $value }
msg-deleted = usunięto { $path } ({ $count } wpisów)
msg-read-only = { $path } jest tylko do odczytu
msg-subtree-set = { $path } jest poddrzewem; ustawienie odrzucone
msg-ancestor-leaf = przodek { $path } jest liściem; przesłanianie odrzucone
msg-key-not-found = klucz nie znaleziony: { $path }
msg-no-match = brak dopasowania
msg-link-not-connected = błąd pobierania łącza: brak połączenia
msg-link-fetch-error = błąd pobierania łącza: { $e }
msg-link-key-not-found = klucz `{ $key }` nie znaleziony w połączonym dokumencie

# ── Walidacja aliasów ─────────────────────────────────────────────────────
err-alias-name-empty = nazwa aliasu nie może być pusta
err-alias-has-dot = nazwa aliasu nie może zawierać '.'
err-alias-has-fragment = nazwa aliasu nie może zawierać '#'
err-alias-value-fragment = wartość aliasu musi być czystym did:ma:<ipns> (bez fragmentu)
err-alias-value-path = wartość aliasu musi być czystym did:ma:<ipns> (bez ścieżki)
err-alias-not-did = wartość aliasu musi zaczynać się od did:ma:
err-unknown-alias = nieznany alias: @{ $name }
err-bare-did = oczekiwano czystego did:ma:<ipns> (bez fragmentu lub ścieżki), otrzymano { $did }

# ── Edytor ────────────────────────────────────────────────────────────────
btn-save = Zapisz
btn-eval = Uruchom
btn-cancel = Anuluj
btn-close = Zamknij
btn-reply = Odpowiedz
btn-publish = Opublikuj
btn-publish-ipld = Opublikuj IPLD
msg-reply-sent = odpowiedź wysłana
msg-reply-failed = wysyłanie odpowiedzi nie powiodło się: { $e }
msg-entity-publish-sent = encja { $name }: publikacja wysłana
msg-entity-publish-failed = publikowanie encji nie powiodło się: { $e }
msg-kind-publish-failed = publikacja typu nie powiodła się: { $e }
msg-field-publish-sent = encja { $name }.{ $field }: publikacja wysłana
msg-field-publish-failed = publikowanie pola nie powiodło się: { $e }
msg-acl-publish-sent = ACL środowiska uruchomieniowego: publikacja wysłana
msg-crud-edit-publish-sent = { $path }: publikacja wysłana
msg-acl-publish-failed = publikowanie ACL środowiska uruchomieniowego nie powiodło się: { $e }
msg-yaml-error = błąd YAML: { $e }
msg-editor-saved = { $path }:zapisz
msg-fetch-review = { $cid } pobrano — sprawdź przed uruchomieniem
msg-fetch-failed = pobieranie { $cid }: { $e }

# ── Czasowniki — skrzynka odbiorcza ──────────────────────────────────────
inbox-empty = skrzynka odbiorcza jest pusta
inbox-entry-not-found = wpis { $n } skrzynki odbiorczej nie znaleziony
inbox-no-message-id = wpis { $n } skrzynki odbiorczej nie ma message_id
inbox-no-verb = brak czasownika `{ $verb }` dla wpisu { $n } skrzynki odbiorczej

# ── Czasowniki — środowisko uruchomieniowe ────────────────────────────────
discover-fetch-failed = wykrywanie nie powiodło się pod { $url }: { $e }
discover-json-error = wykrywanie nie powiodło się: nieprawidłowy JSON z { $url }: { $e }
discover-missing-did = wykrywanie nie powiodło się: status.json nie zawiera wymaganego pola `did`
discover-invalid-did = wykrywanie nie powiodło się: oczekiwano `did` zaczynającego od did:ma:, otrzymano `{ $did }`
discover-no-endpoint = ostrzeżenie wykrywania: `endpoint_id` nieobecny w status.json; zapisano tylko DID
discover-success = ma wykryto pod { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma utworzony — opublikuj przez: .my.identity:publish @ma
claim-success = Środowisko uruchomieniowe przejęte dla { $did }
claim-conflict = Środowisko uruchomieniowe już przejęte przez inną tożsamość
claim-http-failed = przejęcie nie powiodło się: HTTP { $status }
claim-error = przejęcie nie powiodło się: { $e }
claim-no-session = niezalogowano; zaloguj się najpierw, aby przejąć środowisko uruchomieniowe
runtime-no-verb = brak czasownika `{ $verb }` dla { $path }

# ── Czasowniki — kontrola dostępu ────────────────────────────────────────
acl-reset = .my.acl zresetowano (w pełni otwarte)
acl-persist-error = błąd zapisu: { $e }
acl-no-verb = brak czasownika `{ $verb }` dla .my.acl

# ── Czasowniki — tożsamość ────────────────────────────────────────────────
publish-usage = użycie: .my.identity:publish <did-lub-alias>

# ── Czasowniki — dokumenty ────────────────────────────────────────────────
doc-content-empty = { $path }.content jest puste
doc-save-first = { $path }.content jest puste — najpierw zapisz
doc-missing-name = brak nazwy dokumentu
doc-publish-usage = użycie: .my.doc.<nazwa>:publish <wydawca>
doc-publish-ipld-usage = użycie: .my.doc.<nazwa>:publish-ipld <wydawca>
doc-publish-failed = publikowanie { $path }: { $e }
doc-publish-ipld-failed = publikowanie IPLD { $path }: { $e }
doc-store-sent = żądanie przechowywania wysłane ({ $id }) → { $publisher }; CID nadejdzie w odpowiedzi RPC
doc-ipld-store-sent = żądanie przechowywania IPLD wysłane ({ $id }) → { $publisher }; CID nadejdzie w odpowiedzi RPC
doc-fetch-done = { $cid } pobrano → { $path }.content (nie uruchomiono)
doc-fetch-failed = pobieranie { $cid }: { $e }
doc-fetch-usage = użycie: .my.doc.<nazwa>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nie jest ustawione
doc-no-verb = brak czasownika `{ $verb }` dla { $path }
path-no-verb = brak czasownika `{ $verb }` dla { $path }

# ── Tekst pomocy — nagłówki ───────────────────────────────────────────────
help-header-zion = ── polecenia zion ─────────────────────────────────────────────────────────
help-header-messaging = ── wiadomości ────────────────────────────────────────────────────────────
help-header-focus = ── tryb fokusa ───────────────────────────────────────────────────────────
help-header-config = ── lokalna gramatyka konfiguracji ────────────────────────────────────
help-header-common = ── popularne ścieżki ─────────────────────────────────────────────────────
help-header-inbox = ── skrzynka odbiorcza ────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ten tekst
help-cmd-clear =   .clear                       wyczyść terminal
help-cmd-panic =   .panic                       ostateczność — użyj gdy masz kłopoty
help-cmd-history =   .history                     historia poleceń (kolejne duplikaty połączone)
help-cmd-logout =   .logout                      wyloguj

help-msg-echo =   @alias                       pokaż rozwiązany DID (nie wysyła wiadomości)
help-msg-send =   @alias[:verb] body           wyślij wiadomość / RPC do aktora
help-msg-fragment =   @alias#fragment[:verb] body  wyślij do aliasu z jawnym fragmentem DID
help-msg-escape =   \@name                       literalne @name (bez wyszukiwania aliasów)

help-focus-set =   .use @alias [as @name]       fokusuj na aktorze (zmienia podpowiedź)
help-focus-clear =   .use                         wyczyść fokus

help-config-get =   .path                        pobierz wartość liścia lub wylistuj poddrzewo
help-config-filter =   .path value                  filtr wyszukiwania (filtruj według wartości)
help-config-set =   .path: value                 ustaw liść
help-config-delete =   .path:                       usuń liść lub poddrzewo
help-config-verb =   .path:verb [args]            wykonaj lokalny czasownik

help-my =   .my                          pokaż całą konfigurację osobistą
help-aliases =   .my.aliases                  wylistuj aliasy
help-aliases-set =   .my.aliases.<name>: <did>    dodaj/zaktualizuj alias (czysty DID, bez #fragmentu)
help-aliases-del =   .my.aliases.<name>:          usuń alias
help-runtime-discover =   .my.ma:discover          wykryj lokalne środowisko uruchomieniowe i utwórz alias @ma
help-runtime-claim =   .my.ma:claim             przejmij środowisko uruchomieniowe swoim DID
help-identity =   .my.identity                 pokaż konfigurację tożsamości
help-identity-did =   .my.identity.did             pokaż własny DID (tylko do odczytu)
help-identity-publish =   .my.identity:publish @pub    opublikuj własny DID przez usługę wydawcy
help-config-path =   .config                      pokaż wszystkie wpisy .config.*

help-inbox =   .my.inbox                    wylistuj skrzynkę odbiorczą (widok poddrzewa)
help-inbox-n =   .my.inbox.N                  pokaż pola wpisu N
help-inbox-from =   .my.inbox.N.from             DID nadawcy dla wpisu N
help-inbox-reply =   .my.inbox.N:reply [body]     wyślij odpowiedź (otwiera edytor bez treści)
help-inbox-open =   .my.inbox.N:open             otwórz treść w edytorze tylko do odczytu
help-inbox-del =   .my.inbox.N:                 usuń wpis N
help-inbox-delall =   .my.inbox:                   usuń wszystkie wpisy skrzynki odbiorczej
help-inbox-flush =   .my.inbox:flush              wydrukuj wszystkie wpisy w terminalu
help-inbox-traverse =   .my.inbox.N.sender.<pole>   przejrzyj dokument DID nadawcy leniwie

help-doc-edit =   .my.doc.<nazwa>:edit           otwórz edytor z zapisaną treścią
help-doc-edit-cid =   .my.doc.<nazwa>:edit <cid>     pobierz CID, otwórz do przeglądu
help-doc-eval =   .my.doc.<nazwa>:eval           uruchom zapisaną treść linia po linii
help-doc-publish =   .my.doc.<nazwa>:publish @pub   zapisz jako surowy blob (wszystkie typy)
help-doc-publish-ipld =   .my.doc.<nazwa>:publish-ipld @pub  zapisz YAML jako strukturalny węzeł DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<nazwa>:fetch <cid>    importuj treść CID (bez uruchamiania)
help-doc-cid =   .my.doc.<nazwa>:cid            pokaż zapisany CID
help-doc-del =   .my.doc.<nazwa>:              usuń dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostępne języki (ustaw przez .my.i18n: <code>):
err-lang-not-found = język nie znaleziony: { $lang }

msg-send-failed = wysyłanie nie powiodło się: { $e }
msg-not-logged-in = niezalogowany

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Błąd analizy YAML: { $e }
yaml-not-mapping = YAML musi być mapowaniem (pary klucz: wartość); zwykły tekst i skalary nie mogą być zapisane jako DAG-CBOR
dagcbor-encode-error = Błąd kodowania DAG-CBOR: { $e }
cbor-decode-error = Błąd dekodowania CBOR: { $e }
cbor-json-error = Błąd konwersji CBOR do JSON: { $e }
yaml-serialize-error = Błąd serializacji YAML: { $e }
edit-reply-invalid = Nieprawidłowa odpowiedź edycji
doc-publish-ipld-error = Publikacja IPLD nie powiodła się: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Błąd zapisu czyszczenia skrzynki odbiorczej: { $e }
err-config-load = Błąd wczytywania konfiguracji: { $e }
err-lang-persist = Błąd zapisu języka: { $e }
err-history-parse = Błąd analizy historii: { $e }
err-history-load = Błąd wczytywania historii: { $e }
err-ipfs-reply-decode = Błąd dekodowania odpowiedzi IPFS: { $e }
err-edit-cbor = Błąd edycji CBOR: { $e }
err-popup-blocked = Przeglądarka zablokowała wyskakujące okno
status-publishing = publikowanie

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = błąd
rpc-error-detail = błąd: { $detail }
msg-new-message = ← [{ $from }] nowa wiadomość — { $count } w skrzynce odbiorczej
err-edit-decode-failed = edycja: błąd dekodowania: { $e }
err-edit-fetch-failed = edycja: błąd pobierania: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = brak aktywnej sesji — nie można usunąć profilu
profile-delete-error = usunięcie profilu nie powiodło się: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (brak)
profiles-deleted = profil { $name } usunięty
profiles-not-found = profil nie znaleziony: { $name }

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

help-topic-url =   .help.url                    otwieranie ziona przez link URL
help-header-url = ── parametry URL ────────────────────────────────────────────────────────────────
help-url-intro =   Udostępnij link, który otworzy zion z wstępnie wypełnionym odbiorcą:
help-url-msg =   ?msg=<did>                   wstępnie wypełnia: @<did> (zwykła wiadomość)
help-url-say =   ?say=<did>                   wstępnie wypełnia: @<did>:say (czasownik say)
help-url-emote =   ?emote=<did>                 wstępnie wypełnia: @<did>:emote (czasownik emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Pole jest wstępnie wypełnione, ale nie wysłane — naciśnij Enter, aby wysłać.
