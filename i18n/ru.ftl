# zion — Русский
lang-name = Русский

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
msg-connecting = подключение к iroh...
msg-iroh-ready = iroh endpoint готов
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID опубликован через локальный ma ({ $url })
msg-identity-not-published = Личность не найдена онлайн — если ma установлен локально, выполни '.ma [port]', а затем '/my/identity!publish @ma'. Напиши '.help.publish' для деталей.
msg-blocked = ⊗ заблокировано [{ $cap }]: { $from }
msg-focus-cleared = фокус снят
msg-focusing = фокус на { $did } как { $prompt }
msg-set = { $path }: { $value }
msg-deleted = удалено { $path } ({ $count } записей)
msg-read-only = { $path } только для чтения
msg-subtree-set = { $path } — поддерево; установка запрещена
msg-ancestor-leaf = предок пути { $path } является листом; затенение запрещено
msg-key-not-found = ключ не найден: { $path }
msg-no-match = нет совпадений
msg-link-not-connected = ошибка загрузки ссылки: нет подключения
msg-link-fetch-error = ошибка загрузки ссылки: { $e }
msg-link-key-not-found = ключ `{ $key }` не найден в связанном документе

# ── Проверка псевдонимов ──────────────────────────────────────────────────
err-alias-name-empty = имя псевдонима не может быть пустым
err-alias-has-dot = имена псевдонимов не могут содержать '.'
err-alias-has-fragment = имена псевдонимов не могут содержать '#'
err-alias-value-fragment = значение псевдонима должно быть bare did:ma:<ipns> (без фрагмента)
err-alias-value-path = значение псевдонима должно быть bare did:ma:<ipns> (без пути)
err-alias-not-did = значение псевдонима должно начинаться с did:ma:
err-unknown-alias = неизвестный псевдоним: @{ $name }
err-bare-did = ожидался bare did:ma:<ipns> (без фрагмента или пути), получено { $did }

# ── Редактор ──────────────────────────────────────────────────────────────
btn-save = Сохранить
btn-eval = Выполнить
btn-cancel = Отмена
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
discover-success = ma обнаружен по { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдоним @ma создан — выполни '/my/identity!publish @ma' для публикации своей личности.
claim-success = среда выполнения заявлена для { $did }
claim-conflict = среда выполнения уже заявлена другой личностью
claim-http-failed = заявка не удалась: HTTP { $status }
claim-error = заявка не удалась: { $e }
claim-no-session = не вошли; войдите для заявки среды выполнения
runtime-no-verb = нет команды `{ $verb }` для { $path }

# ── Глаголы — ACL ─────────────────────────────────────────────────────────
acl-reset = /my/acl сброшен (полностью открыт)
acl-persist-error = ошибка сохранения: { $e }
acl-no-verb = нет команды `{ $verb }` для /my/acl

# ── Глаголы — личность ────────────────────────────────────────────────────
publish-usage = использование: /my/identity!publish <did-или-псевдоним>
identity-exported = Пакет загружен как { $filename }
identity-export-failed = Экспорт не удался: { $e }

# ── Глаголы — документы ───────────────────────────────────────────────────
doc-content-empty = { $path }/content пуст
doc-save-first = { $path }/content пуст — сначала сохраните
doc-missing-name = отсутствует имя документа
doc-publish-usage = использование: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = использование: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = публикация { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = запрос хранения отправлен ({ $id }) → { $publisher }; CID придёт через RPC ответ
doc-ipld-store-sent = запрос IPLD хранения отправлен ({ $id }) → { $publisher }; CID придёт через RPC ответ
doc-fetch-done = загружено { $cid } → { $path }/content (не выполнено)
doc-fetch-failed = загрузка { $cid }: { $e }
doc-fetch-usage = использование: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid не установлен
doc-no-verb = нет команды `{ $verb }` для { $path }
path-no-verb = нет команды `{ $verb }` для { $path }

# ── Справка — заголовки ───────────────────────────────────────────────────
help-header-zion = ── команды zion ──────────────────────────────────────────────────────────
help-header-messaging = ── сообщения ────────────────────────────────────────────────────────────
help-header-focus = ── режим фокуса ─────────────────────────────────────────────────────────
help-header-config = ── синтаксис конфигурации ───────────────────────────────────────────────
help-header-common = ── общие пути ───────────────────────────────────────────────────────────
help-header-inbox = ── входящие ─────────────────────────────────────────────────────────────
help-header-documents = ── документы ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Справка — команды zion ────────────────────────────────────────────────
help-cmd-help =   .help                        этот текст
help-cmd-clear =   .clear                       очистить терминал
help-cmd-panic =   .panic                       последний resort — использовать при проблемах
help-cmd-history =   .history                     история команд (последовательные дубликаты объединены)
help-cmd-logout =   .logout                      выйти
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Справка — сообщения ───────────────────────────────────────────────────
help-msg-echo =   @alias                       вывести DID (без отправки)
help-msg-send =   @alias[:verb] body           отправить сообщение / RPC актору
help-msg-fragment =   @alias#fragment[:verb] body  отправить с явным фрагментом DID
help-msg-escape =   \@name                       буквальный @name (без поиска псевдонима)

# ── Справка — режим фокуса ────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       сфокусироваться на акторе
help-focus-clear =   .use                         снять фокус

# ── Справка — синтаксис конфигурации ──────────────────────────────────────
help-config-get =   .path                        получить значение или список
help-config-filter =   .path value                  фильтр по значению
help-config-set =   .path: value                 установить значение
help-config-delete =   .path:                       удалить лист или поддерево
help-config-verb =   .path!verb [args]            вызвать локальный глагол

# ── Справка — общие пути ──────────────────────────────────────────────────
help-my =   /my                          показать личную конфигурацию
help-aliases =   /my/aliases                  список псевдонимов
help-aliases-set =   /my/aliases/<name>: <did>    добавить/обновить псевдоним
help-aliases-del =   /my/aliases/<name>:          удалить псевдоним
help-runtime-discover =   .ma [port]          обнаружить локальную среду и создать @ma
help-runtime-claim =   .ma [port]             заявить права на среду выполнения
help-identity =   /my/identity                 показать конфигурацию личности
help-identity-did =   /my/identity/did             показать собственный DID (только чтение)
help-identity-publish =   /my/identity!publish @pub    опубликовать DID через сервис публикации
help-identity-export =   /my/identity!export          загрузить собственный пакет идентичности
help-config-path =   .config                      показать все записи .config.*

# ── Справка — входящие ────────────────────────────────────────────────────
help-inbox =   /my/inbox                    список входящих (поддерево)
help-inbox-n =   /my/inbox/N                  показать поля записи N
help-inbox-from =   /my/inbox/N/from             DID отправителя записи N
help-inbox-reply =   /my/inbox/N!reply [body]     отправить ответ (без текста — редактор)
help-inbox-open =   /my/inbox/N!open             открыть содержимое в режиме чтения
help-inbox-del =   /my/inbox/N:                 удалить запись N
help-inbox-delall =   /my/inbox:                   удалить все входящие
help-inbox-flush =   /my/inbox!flush              вывести все записи в терминал
help-inbox-filter =   /my/inbox!filter @who        показать только записи от @who
help-inbox-traverse =   /my/inbox/N/sender/<field>   обход документа отправителя

# ── Справка — документы ───────────────────────────────────────────────────
help-doc-edit =   /my/doc/<name>!edit           открыть редактор с сохранённым содержимым
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     загрузить CID для просмотра
help-doc-eval =   /my/doc/<name>!eval           выполнить содержимое построчно
help-doc-publish =   /my/doc/<name>!publish @pub   сохранить как сырые данные
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  сохранить YAML как DAG-CBOR IPLD узел
help-doc-fetch =   /my/doc/<name>!fetch <cid>    импортировать содержимое CID
help-doc-cid =   /my/doc/<name>!cid            показать сохранённый CID
help-doc-del =   /my/doc/<name>:              удалить документ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Доступные языки (задать через /my/i18n: <code>):
err-lang-not-found = язык не найден: { $lang }

msg-send-failed = ошибка отправки: { $e }
msg-not-logged-in = не выполнен вход

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Ошибка разбора YAML: { $e }
yaml-not-mapping = YAML должен быть mapping (пары ключ: значение); простой текст и скаляры не могут быть сохранены как DAG-CBOR
dagcbor-encode-error = Ошибка кодирования DAG-CBOR: { $e }
cbor-decode-error = Ошибка декодирования CBOR: { $e }
cbor-json-error = Ошибка CBOR→JSON: { $e }
yaml-serialize-error = Ошибка сериализации YAML: { $e }
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
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (нет)
profiles-deleted = профиль { $name } удалён
profiles-not-found = профиль не найден: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    открыть zion по URL-ссылке
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only
help-header-url = ── параметры URL ───────────────────────────────────────────────────────────
help-url-intro =   Поделись ссылкой, открывающей zion с заранее заполненным получателем:
help-url-msg =   ?msg=<did>                   предзаполняет: @<did> (текстовое сообщение)
help-url-say =   ?say=<did>                   предзаполняет: @<did>:say (глагол say)
help-url-emote =   ?emote=<did>                 предзаполняет: @<did>:emote (глагол emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Поле заполнено, но не отправлено — нажми Enter для отправки.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                публикация личности в сети
help-header-publish = ── публикация личности ──────────────────────────────────────────────────────
help-publish-intro = Публикация делает твою личность доступной для поиска в сети. Другие могут найти твой DID, чтобы связаться с тобой.
help-publish-ma = Для публикации нужен установленный ma (локальная среда выполнения). Он соединяет ego с IPFS/IPNS от твоего имени.
help-publish-steps = Шаги: выполни '.ma [port]' для обнаружения локального ma, затем '/my/identity!publish @ma'.
help-publish-without = Без публикации другие не смогут тебя найти — даже зная твой DID, они не смогут определить твой endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
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

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Ошибка получения CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Неверный CID: { $value }
label-runtime = ма
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Предупреждение: Ваш закрытый ключ IPNS будет отправлен в эту среду выполнения для публикации удостоверения личности. Используйте только среду выполнения, которой полностью доверяете.
