# zion — Polski
lang-name = Polski

# ── Strona logowania ──────────────────────────────────────────────────────
tab-login = zaloguj
tab-new-identity = nowa tożsamość
tab-import-profile = importuj profil
label-passphrase = hasło
label-username = nazwa użytkownika
label-confirm-passphrase = potwierdź hasło
label-did = DID
label-profile-cid = CID profilu
label-or-file = lub plik
btn-login = zaloguj
btn-export = eksportuj
btn-generate = generuj
btn-new-endpoint = nowy punkt końcowy
btn-import-profile = importuj profil
passphrase-warning = Utracone hasło = utracona tożsamość. Odzyskanie nie jest możliwe.
import-profile-help = Zaimportuj profil za pomocą CID lub pliku. Potrzebna jest ta sama fraza hasła użyta podczas publikacji.
import-profile-detected-user = Profil należy do: { $name }
status-unlocking = odblokowywanie...
status-generating = generowanie tożsamości...
status-reading-file = odczyt pliku...
status-fetching-profile = pobieranie profilu z IPFS...
status-imported = '{ $name }' zaimportowano — przejdź do zakładki Zaloguj
status-importing-profile = importowanie profilu...
profile-import-done = profil zaimportowany dla '{ $name }' — załadowano { $n } kluczy
error-wrong-passphrase = błędne hasło: { $e }
error-identity-not-found = tożsamość '{ $name }' nie znaleziona
error-username-required = nazwa użytkownika jest wymagana
error-passphrase-required = hasło jest wymagane
error-passphrases-no-match = hasła nie pasują do siebie
error-profile-source-required = podaj CID lub prześlij plik
error-did-required = podaj swój DID
error-profile-fetch = nie można pobrać profilu: { $e }
error-profile-no-username = profil nie zawiera nazwy użytkownika
error-profile-no-identity = tożsamość '{ $name }' nie znaleziona — najpierw zaimportuj tożsamość

# ── Komunikaty systemowe terminala ────────────────────────────────────────
msg-logged-in = zion v{ $version } — zalogowano jako { $username }
msg-type-help = Wpisz .help, aby uzyskać listę poleceń.
msg-connecting = łączenie z iroh...
msg-iroh-ready = punkt końcowy iroh gotowy
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID opublikowane przez lokalne ma ({ $url })
msg-ma-connecting-matrix = próbuję połączyć cię z 間trixem
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokalne 間 przejęte
msg-local-ma-already-claimed = lokalne 間 jest już przejęte
msg-local-ma-claim-failed = nie udało się przejąć lokalnego 間
msg-identity-not-published = Tożsamość nie znaleziona online — jeśli masz ma zainstalowane lokalnie, uruchom '.ma [port]', a potem '.my.identity!publish @ma'. Wpisz '.help/publish' po szczegóły.
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
err-alias-value-fragment = wartość aliasu może zawierać najwyżej jeden niepusty fragment DID-URL
err-alias-value-path = wartość aliasu musi być DID did:ma:<ipns> albo DID-URL (bez ścieżki)
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
inbox-filter-no-arg = filtr wymaga argumentu DID lub aliasu
inbox-filter-empty = brak wiadomości od { $did }

# ── Czasowniki — środowisko uruchomieniowe ────────────────────────────────
discover-fetch-failed = wykrywanie nie powiodło się pod { $url }: { $e }
discover-json-error = wykrywanie nie powiodło się: nieprawidłowy JSON z { $url }: { $e }
discover-missing-did = wykrywanie nie powiodło się: status.json nie zawiera wymaganego pola `did`
discover-invalid-did = wykrywanie nie powiodło się: oczekiwano `did` zaczynającego od did:ma:, otrzymano `{ $did }`
discover-no-endpoint = ostrzeżenie wykrywania: `endpoint_id` nieobecny w status.json; zapisano tylko DID
discover-hint-endpoint-not-found = Wskazówka: nie znaleziono punktu końcowego. Sprawdź, czy `ma` działa i udostępnia /status.json na porcie 5003.
discover-hint-server-error = Wskazówka: runtime odpowiedział błędem serwera. Sprawdź logi `ma` i spróbuj ponownie.
discover-hint-network = Wskazówka: problem z siecią/łącznością. Uruchom `ma`, sprawdź dostępność localhost:5003 i zezwól w przeglądarce na lokalny dostęp HTTP.
discover-hint-generic = Wskazówka: sprawdź, czy `ma` i IPFS Desktop działają, potem ponów `.ma`.
discover-success = ma wykryto pod { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma utworzony — uruchom '.my.identity!publish @ma', aby opublikować swoją tożsamość.
claim-success = Środowisko uruchomieniowe przejęte dla { $did }
claim-conflict = Środowisko uruchomieniowe już przejęte przez inną tożsamość
claim-already-owned = Runtime już przejęty przez tę tożsamość
claim-http-failed = przejęcie nie powiodło się: HTTP { $status }
claim-error = przejęcie nie powiodło się: { $e }
claim-no-session = niezalogowano; zaloguj się najpierw, aby przejąć środowisko uruchomieniowe
runtime-no-verb = brak czasownika `{ $verb }` dla { $path }

# ── Czasowniki — kontrola dostępu ────────────────────────────────────────
acl-reset = .my.acl zresetowano (w pełni otwarte)
acl-persist-error = błąd zapisu: { $e }
acl-no-verb = brak czasownika `{ $verb }` dla .my.acl

# ── Czasowniki — tożsamość ────────────────────────────────────────────────
publish-usage = użycie: .my.identity!publish <did-lub-alias>
identity-exported = Pakiet pobrany jako { $filename }
identity-export-failed = Eksport nie powiódł się: { $e }

# ── Czasowniki — dokumenty ────────────────────────────────────────────────
doc-content-empty = { $path }.content jest puste
doc-save-first = { $path }.content jest puste — najpierw zapisz
doc-missing-name = brak nazwy dokumentu
doc-publish-usage = użycie: .my.doc.<nazwa>!publish <wydawca>
doc-publish-ipld-usage = użycie: .my.doc.<nazwa>!publish-ipld <wydawca>
doc-publish-failed = publikowanie { $path }: { $e }
doc-publish-ipld-failed = publikowanie IPLD { $path }: { $e }
doc-publish-error-detail = publikowanie nie powiodło się [{ $code }]: { $err }
doc-publish-error-hint = Wskazówka: { $hint }
doc-publish-hint-session = zaloguj się ponownie, aby ego miało dostęp do twoich kluczy tożsamości
doc-publish-hint-target = użyj poprawnego DID publikującego albo aliasu wskazującego na gołe did:ma:<ipns>
doc-publish-hint-network = sprawdź, czy runtime ma i IPFS są osiągalne, potem spróbuj ponownie
doc-publish-hint-resolve = sprawdź, czy dokument DID publikującego jest opublikowany i zawiera osiągalny punkt końcowy
doc-publish-hint-acl = poproś operatora publikującego o dopuszczenie twojego DID w ACL
doc-publish-hint-runtime = runtime/plugin odrzucił żądanie; sprawdź powód i ponów po naprawie encji/runtime
doc-publish-hint-ipfs = sprawdź lokalny stan Kubo/IPFS i status runtime publikującego
doc-publish-hint-unknown = sprawdź logi runtime, aby poznać szczegółową przyczynę, i spróbuj ponownie
doc-store-sent = żądanie przechowywania wysłane ({ $id }) → { $publisher }; CID nadejdzie w odpowiedzi RPC
doc-ipld-store-sent = żądanie przechowywania IPLD wysłane ({ $id }) → { $publisher }; CID nadejdzie w odpowiedzi RPC
doc-fetch-done = { $cid } pobrano → { $path }.content (nie uruchomiono)
doc-fetch-failed = pobieranie { $cid }: { $e }
doc-fetch-usage = użycie: .my.doc.<nazwa>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nie jest ustawione
doc-no-verb = brak czasownika `{ $verb }` dla { $path }
path-no-verb = brak czasownika `{ $verb }` dla { $path }

# ── Tekst pomocy — nagłówki ───────────────────────────────────────────────
help-header-zion = ── polecenia zion ─────────────────────────────────────────────────────────
help-header-messaging = ── wiadomości ────────────────────────────────────────────────────────────
help-header-config = ── lokalna gramatyka konfiguracji ────────────────────────────────────
help-header-common = ── popularne ścieżki ─────────────────────────────────────────────────────
help-header-inbox = ── skrzynka odbiorcza ────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-header-i18n = ── język ─────────────────────────────── ───────────────────────────────
help-header-ma = ── 3-spacja ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── wchodząc w przestrzeń 間────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ten tekst
help-cmd-clear =   .clear                       wyczyść terminal
help-cmd-panic =   .panic                       ostateczność — użyj gdy masz kłopoty
help-cmd-history =   .history                     historia poleceń (kolejne duplikaty połączone)
help-cmd-logout =   .logout                      wyloguj
help-cmd-batch =   .batch                       oceń dokument roboczy równolegle
help-cmd-batch-sync =   .batch:sync / .batch         oceń dokument roboczy linia po linii

help-msg-echo =   @alias                       pokaż rozwiązany DID/DID-URL (nie wysyła wiadomości)
help-msg-send =   @alias!msg body / @alias:verb args           wyślij wiadomość / RPC do aktora
help-msg-fragment =   @alias#fragment:verb body  wyślij do aliasu z jawnym fragmentem DID
help-msg-escape =   \@name                       literalne @name (bez wyszukiwania aliasów)


help-config-get =   .path                        pobierz wartość liścia lub wylistuj poddrzewo
help-config-filter =   .path value                  filtr wyszukiwania (filtruj według wartości)
help-config-set =   .path: value                 ustaw liść
help-config-delete =   .path:                       usuń liść lub poddrzewo
help-config-verb =   .path!verb [args]            wykonaj lokalny czasownik

help-my =   .my                          pokaż całą konfigurację osobistą
help-aliases =   .my.aliases                  wylistuj aliasy
help-aliases-set =   .my.aliases.<name>: <did-url>    dodaj/zaktualizuj alias (DID lub DID-URL)
help-aliases-del =   .my.aliases.<name>:          usuń alias
help-runtime-discover =   .ma [port]          wykryj lokalne środowisko uruchomieniowe i utwórz alias @ma
help-runtime-claim =   .ma [port]             przejmij środowisko uruchomieniowe swoim DID
help-identity =   .my.identity                 pokaż konfigurację tożsamości
help-identity-did =   .my.identity.did             pokaż własny DID (tylko do odczytu)
help-identity-publish =   .my.identity!publish @pub    opublikuj własny DID przez usługę wydawcy
help-identity-export =   .my.identity!export          pobierz własny pakiet tożsamości
help-config-path =   .config                      pokaż wszystkie wpisy .config.*

help-inbox =   .my.inbox                    wylistuj skrzynkę odbiorczą (widok poddrzewa)
help-inbox-n =   .my.inbox.N                  pokaż pola wpisu N
help-inbox-from =   .my.inbox.N.from             DID nadawcy dla wpisu N
help-inbox-reply =   .my.inbox.N!reply [body]     wyślij odpowiedź (otwiera edytor bez treści)
help-inbox-open =   .my.inbox.N!open             otwórz treść w edytorze tylko do odczytu
help-inbox-del =   .my.inbox.N:                 usuń wpis N
help-inbox-delall =   .my.inbox:                   usuń wszystkie wpisy skrzynki odbiorczej
help-inbox-flush =   .my.inbox!flush              wydrukuj wszystkie wpisy w terminalu
help-inbox-filter =   .my.inbox!filter @who        pokaż tylko wpisy od @who
help-inbox-traverse =   .my.inbox.N.sender.<pole>   przejrzyj dokument DID nadawcy leniwie

help-doc-edit =   .my.doc.<nazwa>!edit           otwórz edytor z zapisaną treścią
help-doc-edit-cid =   .my.doc.<nazwa>!edit /ipfs/<cid>     pobierz CID, otwórz do przeglądu
help-doc-eval =   .my.doc.<nazwa>!eval           uruchom zapisaną treść linia po linii
help-doc-publish =   .my.doc.<nazwa>!publish @pub   zapisz jako surowy blob (wszystkie typy)
help-doc-publish-ipld =   .my.doc.<nazwa>!publish-ipld @pub  zapisz YAML jako strukturalny węzeł DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<nazwa>!fetch /ipfs/<cid>    importuj treść CID (bez uruchamiania)
help-doc-cid =   .my.doc.<nazwa>!cid            pokaż zapisany CID
help-doc-del =   .my.doc.<nazwa>:              usuń dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n przechowuje preferencje językowe powiązane z Twoją tożsamością.
help-i18n-set = .my.i18n: <code>             wybierz język, którego 20 używa dla tej tożsamości
help-i18n-list = .my.i18n!list               lista dostępnych kodów języków

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Pokój 間 to przestrzeń między tożsamościami 間. ma pozwala tym tożsamościom odnajdywać się i komunikować; gdy twoja tożsamość jest opublikowana, możesz uczestniczyć.
help-ma-command =   .ma [port]                   połącz się z lokalnym ma runtime, odczytaj /status.json i zapisz .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     opublikuj swój dokument DID, aby inni mogli rozwiązać twoje klucze i endpoint
help-ma-security = Najwyraźniejszą granicą zaufania jest własny ma runtime z własnym IPFS Desktop/Kubo. Zdalny publisher może być przydatny, ale wtedy polegasz na cudzej usłudze.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             jak wejść do pokoju 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Gdy twoja tożsamość jest znana, .enter @ma pozwala wejść do 間. Znajdź świat, wejdź do niego i uczestnicz stamtąd.
help-ma-entry-steps = Uruchom IPFS Desktop i ma, potem wykonaj .ma. Opublikuj przez .my.identity!publish @ma, znajdź świat i wejdź przez .enter @ma.
help-ma-entry-command =   .enter @ma                  wejść do 間 przez runtime @ma
help-ma-entry-toggle =   .enter                       włącz lub wyłącz fokus pokoju; twoja tożsamość pozostaje aktywna
help-ma-entry-url =   ?enter=<runtime>             wejść po logowaniu ze współdzielonego URL

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
msg-chat = { $sender } mówi { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } mówi { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } wchodzi do pokoju.
room-leave = * { $name } wychodzi z pokoju.
room-drop  = * { $name } upuszcza { $thing }.
room-take  = * { $name } podnosi { $thing }.
err-edit-decode-failed = edycja: błąd dekodowania: { $e }
err-edit-fetch-failed = edycja: błąd pobierania: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = brak aktywnej sesji — nie można usunąć profilu
profile-delete-error = usunięcie profilu nie powiodło się: { $e }
profile-wrong-user = nie można ustawić 11 dla innego profilu — tylko dla własnego
profile-wrong-user-name = nie można ustawić 11 dla 19 — tylko własny profil
profile-no-ma = nie skonfigurowano środowiska wykonawczego 3 — najpierw uruchom 31
profile-no-cid = dla tego profilu nie zapisano żadnego 3 — najpierw uruchom 37
profile-no-cid-in-doc = w dokumencie DID nie znaleziono profilu 11 — najpierw uruchom 43
profile-publish-sent = profil zaszyfrowany i wysłany do IPFS; dokument DID zostanie zaktualizowany, gdy dotrze CID
profile-publish-done = profil opublikowany — dokument DID zaktualizowany o CID ma.agent
profile-publish-failed = publikacja profilu nie powiodła się: 24
profile-fetch-done = pobrano profil — klucze 18 załadowane z 43
profile-fetch-failed = pobranie profilu nie powiodło się: 22
msg-identity-exists = tożsamość już opublikowana — profil aktualny
profile-import-exists = profil 8 już istnieje — najpierw go usuń
profile-import-wrong-user = plik zawiera profil 22, oczekiwany 42

# -- CID content operations
cid-op-binary = zawartość binarna (niewyświetlana)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = nie udało się pobrać treści: 25
cid-op-unknown = nieznana operacja dotycząca treści: 27
cid-op-wc = { $lines } linie 18 słowa 36 znaki
profiles-empty = (brak)
profiles-deleted = profil { $name } usunięty
profiles-not-found = profil nie znaleziony: { $name }

# -- Help topics index
help-header-topics = -- tematy -- wpisz .help/<topic>, aby zobaczyć szczegóły
help-topic-msg =   .help/msg                    wiadomości
help-topic-ma = .help/ma                     ma-przestrzeń, publikacja i wpis
help-topic-path = .help/path                   lokalna gramatyka kropkowa
help-topic-my =   .help/my                     osobista config
help-topic-inbox =   .help/inbox                  skrzynka odbiorcza
help-topic-doc =   .help/doc                    dokumenty
help-topic-actor =   .help/actor                  zdalny actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: nieznany temat

# -- Help actor section
help-header-actor = -- zdalni aktorzy
help-actor-echo =   @actor                       pokaż rozwiązany DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         wyślij wiadomość bezpośrednią/czat/emotkę
help-actor-ping = @actor:ping                  ping żywotności
help-actor-entities =   @actor/entities              wyświetl encje
help-actor-entities-get = @actor/entities/<n>          pobierz węzeł jednostki
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   ustaw jednostkę według odniesienia 14
help-actor-entities-edit =   @actor/entities/<n>!edit     edytuj encję
help-actor-entities-del = @actor/entities/<n>:         usuń podmiot
help-actor-config-get =   @actor/config/<key>          pobierz wartość config
help-actor-config-set =   @actor/config/<key>: val     ustaw wartość config
help-actor-acl = @actor/acl                   zdobądź 4
help-actor-acl-edit =   @actor/acl!edit              edytuj ACL
help-actor-fragment =   @actor#entity                wyślij do pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC do pluginu
help-header-cid-ops = ── Wywołanie aktora 3 ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  zadzwoń do jednostki 15 z 24 i poczekaj na jej odpowiedź
help-actor-head = (@actor/path)                pobierz zdalną zawartość CRUD z 31
help-actor-tail = (<bafy...>)                  uwzględnić i ocenić 21 z 36 41
help-actor-wc = (define x (@actor:verb arg))  przechowuj odpowiedzi 5 w środowisku sesji
help-actor-wc-l = .my.scheme.ma!edit           edytuj zapisane pomocniki 11 dla tej tożsamości

help-topic-url =   .help/url                    otwieranie ziona przez link URL
help-topic-i18n = .help/i18n                   preferencje językowe dla Twojej tożsamości
help-header-url = ── parametry URL ────────────────────────────────────────────────────────────────
help-url-intro =   Udostępnij link, który otworzy zion z wstępnie wypełnionym odbiorcą:
help-url-msg =   ?msg=<did>                   wstępnie wypełnia: @<did>!msg (zwykła wiadomość)
help-url-say =   ?say=<did>                   wstępnie wypełnia: @<did>!say (czasownik say)
help-url-emote =   ?emote=<did>                 wstępnie wypełnia: @<did>!emote (czasownik emote)
help-url-ma = ?ma=<did-or-url>              wstępnie wypełnij adres URL środowiska wykonawczego DID / 23
help-url-enter = ?enter=<runtime>             wejdź do świata wykonawczego po zalogowaniu
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Pole jest wstępnie wypełnione, ale nie wysłane — naciśnij Enter, aby wysłać.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publikowanie tożsamości w sieci
help-header-publish = ── publikowanie tożsamości ──────────────────────────────────────────────────
help-publish-intro = Publikacja sprawia, że twoja tożsamość jest widoczna w sieci. Inni mogą wyszukać twój DID, aby się z tobą skontaktować.
help-publish-ma = Aby opublikować, potrzebujesz zainstalowanego ma (lokalny runtime). Łączy ego z IPFS/IPNS w twoim imieniu.
help-publish-steps = Kroki: uruchom '.ma [port]', aby wykryć lokalny ma, następnie '.my.identity!publish @ma'.
help-publish-without = Bez publikacji inni nie mogą cię osiągnąć — nawet jeśli znają twój DID, nie są w stanie rozwiązać twojego endpointu.
profile-fetch-did-resolve-failed = NIE Opublikowano jeszcze — najpierw uruchom 28, a następnie 67 swój profil
profile-update-done = profil zaktualizowano — klucze 18 zostały połączone z 43
profile-delete-needs-name = podaj nazwę profilu: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Zbieranie wsadu — wpisz polecenia, zakończ .batch
batch-already-collecting = Już zbieram partię — najpierw zakończ .batch
batch-empty = Partia była pusta — nie było nic do uruchomienia
batch-running = Uruchamianie batch…
batch-step-timeout = Upłynął limit czasu kroku wsadowego

batch-done = Batch ukończony w { $secs }s — { $steps } kroków
batch-done-error = Batch zakończony z błędami w { $secs }s — { $steps } kroków
msg-timeout = Wiadomość wygasła (brak odpowiedzi przez 60s)
err-unknown-command = nieznane polecenie: { $path }
err-read-only-path = { $path } jest tylko do odczytu
help-cmd-batch-async =   .batch:async / .batch        oceń dokument roboczy równolegle


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Nie udało się pobrać CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Nieprawidłowy CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Ostrzeżenie: Twój prywatny klucz IPNS zostanie przesłany do tego środowiska uruchomieniowego w celu publikacji tożsamości. Korzystaj tylko ze środowiska uruchomieniowego, któremu w pełni ufasz.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
