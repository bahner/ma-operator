# zion — Русский
lang-name = Русский
label-nick = ник
new-identity-nick-help = Выберите ник для 間-space. Это просто ник, его можно изменить в любое время.
error-nick-required = требуется ник
error-nick-invalid = ник не должен содержать пробелы или @

# ── Страница входа ────────────────────────────────────────────────────────
tab-login = войти
tab-new-identity = новая личность
tab-import-profile = импортировать профиль
label-passphrase = парольная фраза
label-username = имя пользователя
label-confirm-passphrase = подтвердить парольную фразу
label-did = DID
label-profile-cid = CID профиля
label-or-file = или файл
btn-login = войти
btn-export = экспорт
btn-generate = создать
btn-new-endpoint = новая конечная точка
btn-import-profile = импортировать профиль
btn-show-qr = показать QR
btn-scan-qr = сканировать QR
qr-scan-hint = Наведите камеру на QR-код профиля zion.
qr-error-camera = камера недоступна: { $e }
qr-error-too-large = профиль слишком велик для QR-кода
passphrase-warning = Потеря парольной фразы = потеря личности. Восстановление невозможно.
import-profile-help = Импортируйте профиль по CID или из файла. Необходима та же парольная фраза, что использовалась при публикации.
import-profile-detected-user = Профиль принадлежит: { $name }
status-unlocking = разблокировка...
status-generating = создание личности...
status-reading-file = чтение файла...
status-fetching-profile = получение профиля из IPFS...
status-imported = импортирован '{ $name }' — перейдите на вкладку входа
status-importing-profile = импорт профиля...
profile-import-done = профиль импортирован для '{ $name }' — загружено ключей: { $n }
error-wrong-passphrase = неверная парольная фраза: { $e }
error-identity-not-found = личность '{ $name }' не найдена
error-username-required = требуется имя пользователя
error-passphrase-required = требуется парольная фраза
error-passphrases-no-match = парольные фразы не совпадают
error-profile-source-required = укажите CID или загрузите файл
error-did-required = введите ваш DID
error-profile-fetch = не удалось получить профиль: { $e }
error-profile-no-username = профиль не содержит имени пользователя
error-profile-no-identity = личность '{ $name }' не найдена — сначала импортируйте личность

# ── Системные сообщения терминала ─────────────────────────────────────────
msg-logged-in = zion v{ $version } — вошли как { $username }
msg-type-help = Введите .help для списка команд.
msg-getting-started = Попробуйте: say Hello world, look, .help или help.
msg-connecting = подключение к iroh...
msg-iroh-ready = iroh endpoint готов
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID опубликован через локальный 間 ({ $url })
msg-identity-publication-propagating = Публикация идентичности всё ещё распространяется; вход отложен: { $e }
msg-identity-first-publish = Идентичность публикуется впервые. Это может занять до { $seconds } секунд.
msg-ma-connecting-matrix = пытаемся подключить вас к 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = локальный 間 заявлен
msg-local-ma-already-claimed = локальный 間 уже заявлен
msg-local-ma-claim-failed = не удалось заявить локальный 間
msg-identity-not-published = Личность не найдена онлайн — если 間 установлен локально, выполни '.ma [port]', а затем '.my.identity!publish @ma'. Напиши '.help/publish' для деталей.
msg-blocked = ⊗ заблокировано [{ $cap }]: { $from }
msg-focus-cleared = фокус снят
msg-left = left
msg-focusing = фокус на { $did } как { $prompt }
msg-set = { $path }: { $value }
msg-deleted = удалено { $path } ({ $count } записей)
msg-read-only = { $path } только для чтения
msg-subtree-set = { $path } — поддерево; установка запрещена
msg-ancestor-leaf = предок пути { $path } является листом; затенение запрещено
msg-key-not-found = ключ не найден: { $path }
msg-link-not-connected = ошибка загрузки ссылки: нет подключения
msg-link-fetch-error = ошибка загрузки ссылки: { $e }
msg-link-key-not-found = ключ `{ $key }` не найден в связанном документе

# ── Проверка псевдонимов ──────────────────────────────────────────────────
err-alias-name-empty = имя псевдонима не может быть пустым
err-alias-has-dot = имена псевдонимов не могут содержать '.'
err-alias-has-fragment = имена псевдонимов не могут содержать '#'
err-alias-value-fragment = значение псевдонима может содержать не более одного непустого фрагмента DID-URL
err-alias-value-path = значение псевдонима должно быть DID did:ma:<ipns> или DID-URL (без пути)
err-alias-not-did = значение псевдонима должно начинаться с did:ma:
err-unknown-alias = неизвестный псевдоним: @{ $name }
err-bare-did = ожидался bare did:ma:<ipns> (без фрагмента или пути), получено { $did }

# ── Редактор ──────────────────────────────────────────────────────────────
btn-save = Сохранить
btn-eval = Выполнить
btn-cancel = Отмена
msg-jobs-cancelled = задания отменены
btn-close = Закрыть
btn-reply = Ответить
btn-publish = Опубликовать
btn-publish-ipld = Опубликовать IPLD
msg-reply-sent = ответ отправлен
msg-reply-failed = ошибка отправки ответа: { $e }
msg-entity-publish-sent = объект { $name }: публикация отправлена
msg-entity-publish-failed = ошибка публикации объекта: { $e }
msg-kind-publish-failed = публикация типа не удалась: { $e }
msg-field-publish-sent = объект { $name }.{ $field }: публикация отправлена
msg-field-publish-failed = ошибка публикации поля: { $e }
msg-acl-publish-sent = ACL среды выполнения: публикация отправлена
msg-crud-edit-publish-sent = { $path }: публикация отправлена
msg-acl-publish-failed = ошибка публикации ACL среды выполнения: { $e }
msg-yaml-error = ошибка YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = загружено { $cid } — проверьте перед выполнением
msg-fetch-failed = загрузка { $cid }: { $e }

# ── Глаголы — входящие ────────────────────────────────────────────────────
inbox-empty = входящие пусты
inbox-entry-not-found = запись входящих { $n } не найдена
inbox-no-message-id = запись входящих { $n } не имеет message_id
inbox-no-verb = нет команды `{ $verb }` для записи входящих { $n }
inbox-filter-no-arg = фильтр требует аргумент DID или псевдоним
inbox-filter-empty = нет сообщений от { $did }

# ── Глаголы — среда выполнения ────────────────────────────────────────────
discover-fetch-failed = обнаружение не удалось по { $url }: { $e }
discover-json-error = обнаружение не удалось: неверный JSON от { $url }: { $e }
discover-missing-did = обнаружение не удалось: в status.json отсутствует поле `did`
discover-invalid-did = обнаружение не удалось: ожидалось, что `did` начинается с did:ma:, получено `{ $did }`
discover-no-endpoint = предупреждение: `endpoint_id` отсутствует в status.json; сохранён только DID
discover-hint-endpoint-not-found = Подсказка: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Подсказка: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Подсказка: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Подсказка: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 обнаружен по { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдоним @ma создан — выполни '.my.identity!publish @ma' для публикации своей личности.
claim-success = среда выполнения заявлена для { $did }
claim-conflict = среда выполнения уже заявлена другой личностью
claim-already-owned = Runtime уже заявлен этой личностью
claim-http-failed = заявка не удалась: HTTP { $status }
claim-error = заявка не удалась: { $e }
claim-no-session = не вошли; войдите для заявки среды выполнения
runtime-no-verb = нет команды `{ $verb }` для { $path }

# ── Глаголы — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl сброшен (полностью открыт)
acl-persist-error = ошибка сохранения: { $e }
acl-no-verb = нет команды `{ $verb }` для .my.acl

# ── Глаголы — личность ────────────────────────────────────────────────────
publish-usage = использование: .my.identity!publish <did-или-псевдоним>
identity-exported = Пакет загружен как { $filename }
identity-export-failed = Экспорт не удался: { $e }

# ── Глаголы — документы ───────────────────────────────────────────────────
doc-content-empty = { $path } пуст
doc-save-first = { $path } пуст — сначала сохраните
doc-missing-name = отсутствует имя документа
doc-publish-usage = использование: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = использование: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = публикация { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = публикация не удалась [{ $code }]: { $err }
doc-publish-error-hint = Подсказка: { $hint }
doc-publish-hint-session = войдите в систему еще раз, чтобы ego могло получить доступ к вашим идентификационным ключам
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = убедитесь, что документ DID издателя опубликован и содержит доступную конечную точку
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = среда выполнения/плагин отклонил запрос; проверьте причину и повторите попытку после исправления объекта/среды выполнения.
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = проверьте журналы времени выполнения для подробной причины и повторите попытку.
doc-store-sent = запрос хранения отправлен ({ $id }) → { $publisher }; CID придёт через RPC ответ
doc-ipld-store-sent = запрос IPLD хранения отправлен ({ $id }) → { $publisher }; CID придёт через RPC ответ
doc-fetch-done = загружено { $cid } → { $path } (не выполнено)
doc-fetch-failed = загрузка { $cid }: { $e }
doc-fetch-usage = использование: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid не установлен
doc-no-verb = нет команды `{ $verb }` для { $path }
path-no-verb = нет команды `{ $verb }` для { $path }

# ── Справка — заголовки ───────────────────────────────────────────────────
help-header-zion = ── команды zion ──────────────────────────────────────────────────────────
help-header-messaging = ── сообщения ────────────────────────────────────────────────────────────
help-header-config = ── синтаксис конфигурации ───────────────────────────────────────────────
help-header-common = ── общие пути ───────────────────────────────────────────────────────────
help-header-inbox = ── входящие ─────────────────────────────────────────────────────────────
help-header-documents = ── документы ────────────────────────────────────────────────────────────
help-header-i18n = ── язык ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ???
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── входит в 間-пространство ───────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Справка — команды zion ────────────────────────────────────────────────
help-cmd-help =   .help                        этот текст
help-cmd-clear =   .clear                       очистить терминал
help-cmd-panic =   .panic                       последний resort — использовать при проблемах
help-cmd-history =   .history                     история команд (последовательные дубликаты объединены)
help-cmd-logout =   .logout                      выйти
help-cmd-batch =   .batch                       выполнить черновой документ параллельно
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         выполнить черновой документ построчно

# ── Справка — сообщения ───────────────────────────────────────────────────
help-msg-echo =   @alias                       показать разрешённый DID/DID-URL (сообщение не отправляется)
help-msg-send =   @alias!msg body / @alias:verb args           отправить сообщение / RPC актору
help-msg-fragment =   @alias#fragment:verb body  отправить с явным фрагментом DID
help-msg-escape =   \@name                       буквальный @name (без поиска псевдонима)

# ── Справка — режим фокуса ────────────────────────────────────────────────

# ── Справка — синтаксис конфигурации ──────────────────────────────────────
help-config-get =   .path                        получить значение или список
help-config-filter =   .path [имя]                  вывести имена дочерних ключей, содержащие имя
help-config-full =   .path. [имя]                 вывести полные значения поддерева, содержащие имя
help-config-set =   .path: value                 установить значение
help-config-delete =   .path:                       удалить лист или поддерево
help-config-verb =   .path!verb [args]            вызвать локальный глагол

# ── Справка — общие пути ──────────────────────────────────────────────────
help-my =   .my                          показать личную конфигурацию
help-aliases =   .my.aliases                  список псевдонимов
help-aliases-set =   .my.aliases.<name>: <did-url>    добавить/обновить псевдоним (DID или DID-URL)
help-aliases-del =   .my.aliases.<name>:          удалить псевдоним
help-runtime-discover =   .ma [port]          обнаружить локальную среду и создать @ma
help-runtime-claim =   .ma [port]             заявить права на среду выполнения
help-identity =   .my.identity                 показать конфигурацию личности
help-identity-did =   .my.identity.did             показать собственный DID (только чтение)
help-identity-publish =   .my.identity!publish @pub    опубликовать DID через сервис публикации
help-identity-export =   .my.identity!export          загрузить собственный пакет идентичности
help-config-path =   .config                      показать все записи .config.*

# ── Справка — входящие ────────────────────────────────────────────────────
help-inbox =   .my.inbox                    список входящих (поддерево)
help-inbox-n =   .my.inbox.N                  показать поля записи N
help-inbox-from =   .my.inbox.N.from             DID отправителя записи N
help-inbox-reply =   .my.inbox.N!reply [body]     отправить ответ (без текста — редактор)
help-inbox-open =   .my.inbox.N!open             открыть содержимое в режиме чтения
help-inbox-del =   .my.inbox.N:                 удалить запись N
help-inbox-delall =   .my.inbox:                   удалить все входящие
help-inbox-flush =   .my.inbox!flush              вывести все записи в терминал
help-inbox-filter =   .my.inbox!filter @who        показать только записи от @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   обход документа отправителя

# ── Справка — документы ───────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           открыть редактор с сохранённым содержимым
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     загрузить CID для просмотра
help-doc-eval =   .my.doc.<name>!eval           выполнить содержимое построчно
help-doc-publish =   .my.doc.<name>!publish @pub   сохранить как сырые данные
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  сохранить YAML как DAG-CBOR IPLD узел
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    импортировать содержимое CID
help-doc-cid =   .my.doc.<name>!cid            показать сохранённый CID
help-doc-del =   .my.doc.<name>:              удалить документ

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n сохраняет языковые предпочтения, привязанные к вашей личности.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               список доступных языковых кодов

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Комната 間 — это пространство между идентичностями 間. ma помогает этим идентичностям находить друг друга и общаться; когда твоя идентичность опубликована, ты можешь участвовать.
help-ma-command =   .ma [port]                   подключиться к локальному 間 runtime, прочитать /status.json и сохранить .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     опубликовать твой DID-документ, чтобы другие могли разрешить твои ключи и endpoint
help-ma-security = Самая ясная граница доверия — твой собственный 間 runtime с твоим собственным IPFS Desktop/Kubo. Удалённый publisher может быть полезен, но тогда ты полагаешься на чужой сервис.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             как войти в комнату 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Когда твоя идентичность известна, .enter @ma позволяет войти в 間. Найди мир, войди в него и участвуй оттуда.
help-ma-entry-steps = Запусти IPFS Desktop и ma, затем выполни .ma. Опубликуй через .my.identity!publish @ma, найди мир и войди через .enter @ma.
help-ma-entry-command =   .enter @ma                  войти в 間 через runtime @ma
help-ma-entry-toggle =   .enter                       включить или выключить фокус комнаты; твоя идентичность остаётся активной
help-ma-entry-url =   ?enter=<runtime>             войти после входа по общей URL-ссылке

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Доступные языки (задать через .my.i18n: <code>):
err-lang-not-found = язык не найден: { $lang }

msg-send-failed = ошибка отправки: { $e }
msg-not-logged-in = не выполнен вход

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Ошибка разбора YAML: { $e }
yaml-not-mapping = YAML должен быть mapping (пары ключ: значение); простой текст и скаляры не могут быть сохранены как DAG-CBOR
dagcbor-encode-error = Ошибка кодирования DAG-CBOR: { $e }
cbor-decode-error = Ошибка декодирования CBOR: { $e }
cbor-json-error = Ошибка CBOR→JSON: { $e }
yaml-serialise-error = Ошибка сериализации YAML: { $e }
edit-reply-invalid = Некорректный ответ на редактирование
doc-publish-ipld-error = Ошибка публикации IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Ошибка сохранения очистки входящих: { $e }
err-config-load = Ошибка загрузки конфигурации: { $e }
err-lang-persist = Ошибка сохранения языка: { $e }
err-history-parse = Ошибка разбора истории: { $e }
err-history-load = Ошибка загрузки истории: { $e }
err-ipfs-reply-decode = Ошибка декодирования ответа IPFS: { $e }
err-edit-cbor = Ошибка редактирования CBOR: { $e }
err-popup-blocked = Всплывающее окно заблокировано браузером
status-publishing = публикуется

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ошибка
rpc-error-detail = ошибка: { $detail }
msg-new-message = ← [{ $from }] новое сообщение — { $count } во входящих
msg-chat = { $sender } говорит { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } говорит { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } входит в комнату.
room-leave = * { $name } выходит из комнаты.
room-drop  = * { $name } роняет { $thing }.
room-take  = * { $name } поднимает { $thing }.
err-edit-decode-failed = редактирование: ошибка декодирования: { $e }
err-edit-fetch-failed = редактирование: ошибка загрузки: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = нет активной сессии — профиль не может быть удалён
profile-delete-error = удаление профиля не удалось: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = профиль зашифрован и отправлен в IPFS; DID-документ будет обновлён, когда придёт CID
profile-publish-done = профиль опубликован — DID-документ обновлён с ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = личность уже опубликована — профиль обновлен
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = двоичный контент (не отображается)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (нет)
profiles-deleted = профиль { $name } удалён
profiles-not-found = профиль не найден: { $name }

# -- Help topics index
help-header-topics = -- темы -- введите .help/<topic> для подробностей
help-topic-msg =   .help/msg                    сообщения
help-topic-ma = .help/ma                     間-пространство, публикация и вход
help-topic-path = .help/path                   локальная грамматика точечного пути
help-topic-my =   .help/my                     личная config
help-topic-inbox =   .help/inbox                  входящие
help-topic-doc =   .help/doc                    документы
help-topic-actor =   .help/actor                  удалённый actor
help-topic-zscheme =   .help/zscheme               встроенные выражения Scheme и документация
help-topic-url =   .help/url                    открыть zion по URL-ссылке
help-topic-i18n = .help/i18n                   языковые предпочтения для вашей личности
help-unknown-topic =   .help/{ $topic }: неизвестная тема

# -- Help actor section
help-header-actor = -- удалённые акторы
help-actor-echo =   @actor                       показать разрешённый DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         отправить прямое/чат/эмоциональное сообщение
help-actor-ping = @actor:ping                  пинг активности
help-actor-entities =   @actor/entities              список сущностей
help-actor-entities-get = @actor/entities/<n>          получить узел сущности
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     редактировать сущность
help-actor-entities-del = @actor/entities/<n>:         удалить объект
help-actor-config-get =   @actor/config/<key>          получить значение config
help-actor-config-set =   @actor/config/<key>: val     задать значение config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              редактировать ACL
help-actor-fragment =   @actor#entity                отправить в plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC в plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  сохранять ответы 5 в среде сеанса
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── параметры URL ───────────────────────────────────────────────────────────
help-url-intro =   Поделись ссылкой, открывающей zion с заранее заполненным получателем:
help-url-msg =   ?msg=<did>                   предзаполняет: @<did>!msg (текстовое сообщение)
help-url-say =   ?say=<did>                   предзаполняет: @<did>!say (глагол say)
help-url-emote =   ?emote=<did>                 предзаполняет: @<did>!emote (глагол emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             войти в мир времени выполнения после входа в систему
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Поле заполнено, но не отправлено — нажми Enter для отправки.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                публикация личности в сети
help-header-publish = ── публикация личности ──────────────────────────────────────────────────────
help-publish-intro = Публикация делает твою личность доступной для поиска в сети. Другие могут найти твой DID, чтобы связаться с тобой.
help-publish-ma = Для публикации нужен установленный 間 (локальная среда выполнения). Он соединяет ego с IPFS/IPNS от твоего имени.
help-publish-steps = Шаги: выполни '.ma [port]' для обнаружения локального ma, затем '.my.identity!publish @ma'.
help-publish-without = Без публикации другие не смогут тебя найти — даже зная твой DID, они не смогут определить твой endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = укажите имя профиля: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Сбор пакета — введите команды, заканчивающиеся на .batch
batch-already-collecting = Уже собираю партию — сначала закончите с .batch
batch-empty = Пакет пуст — нечего запускать
batch-running = Выполняется batch…
batch-step-timeout = Время ожидания пакетного шага истекло

batch-done = Batch завершён за { $secs }s — { $steps } шагов
batch-done-error = Batch завершён с ошибками за { $secs }s — { $steps } шагов
msg-timeout = Сообщение истекло (нет ответа за 60s)
err-unknown-command = неизвестная команда: { $path }
err-read-only-path = { $path } доступен только для чтения
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        выполнить черновой документ параллельно


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Ошибка получения CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Неверный CID: { $value }
label-runtime = ма
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Предупреждение: Ваш закрытый ключ IPNS будет отправлен в эту среду выполнения для публикации удостоверения личности. Используйте только среду выполнения, которой полностью доверяете.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme вычисляет выражения Scheme, встроенные в команды zion, и подставляет результат в строку перед отправкой.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    встроенный пример; отправляет "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             определения сохраняются в текущем сеансе входа
help-zscheme-doc = Документация: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Локальный шлюз IPFS (требуется исключение в браузере)

tab-config = Настройки
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
