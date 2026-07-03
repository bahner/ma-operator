# zion — Українська
lang-name = Українська

# ── Сторінка входу ────────────────────────────────────────────────────────
tab-login = увійти
tab-new-identity = нова особистість
tab-import-profile = імпортувати профіль
label-passphrase = парольна фраза
label-username = ім'я користувача
label-confirm-passphrase = підтвердити парольну фразу
label-did = DID
label-runtime = ма
label-runtime-placeholder = did:ma:... or http://localhost:5003
label-profile-cid = CID профілю
label-or-file = або файл
btn-login = увійти
btn-export = експорт
btn-generate = створити
btn-new-endpoint = нова кінцева точка
btn-import-profile = імпортувати профіль
passphrase-warning = Втрата парольної фрази = втрата особистості. Відновлення неможливе.
warning-remote-runtime = Попередження: Ваш приватний ключ IPNS буде надіслано до цього середовища виконання для публікації ідентичності. Використовуйте лише середовище виконання, якому повністю довіряєте.
import-profile-help = Імпортуйте профіль .zion.json за CID або файлом. Парольна фраза не потрібна для нового імпорту. Потрібна лише для перезапису існуючої особистості.
import-profile-detected-user = Профіль належить: { $name }
status-unlocking = розблокування...
status-generating = створення особистості...
status-reading-file = читання файлу...
status-fetching-profile = отримання профілю з IPFS...
status-importing-profile = імпорт профілю...
status-imported = імпортовано '{ $name }' — перейдіть на вкладку входу
profile-import-done = профіль імпортовано для '{ $name }' — завантажено ключів: { $n }
error-wrong-passphrase = неправильна парольна фраза: { $e }
error-identity-not-found = особистість '{ $name }' не знайдена
error-username-required = необхідне ім'я користувача
error-passphrase-required = необхідна парольна фраза
error-passphrases-no-match = парольні фрази не збігаються
error-profile-source-required = вкажіть CID або завантажте файл
error-did-required = введіть ваш DID
error-profile-fetch = не вдалося отримати профіль: { $e }
error-profile-no-username = профіль не містить імені користувача
error-profile-no-identity = особистість '{ $name }' не знайдена — спочатку імпортуйте особистість

# ── Системні повідомлення терміналу ──────────────────────────────────────
msg-logged-in = zion v{ $version } — увійшли як { $username }
msg-type-help = Введіть .help для списку команд.
msg-connecting = підключення до iroh...
msg-iroh-ready = iroh endpoint готовий
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID опубліковано через локальний ma ({ $url })
msg-identity-not-published = Особистість не знайдена онлайн — якщо ma встановлено локально, виконайте '.ma [port]', а потім '.my.identity!publish @ma'. Введіть '.help.publish' для деталей.
msg-blocked = ⊗ заблоковано [{ $cap }]: { $from }
msg-focus-cleared = фокус знято
msg-focusing = фокус на { $did } як { $prompt }
msg-set = { $path }: { $value }
msg-deleted = видалено { $path } ({ $count } записів)
msg-read-only = { $path } лише для читання
msg-subtree-set = { $path } — піддерево; встановлення заборонено
msg-ancestor-leaf = предок шляху { $path } є листком; затінення заборонено
msg-key-not-found = ключ не знайдено: { $path }
msg-no-match = немає збігів
msg-link-not-connected = помилка завантаження посилання: немає підключення
msg-link-fetch-error = помилка завантаження посилання: { $e }
msg-link-key-not-found = ключ `{ $key }` не знайдено у пов'язаному документі

# ── Перевірка псевдонімів ─────────────────────────────────────────────────
err-alias-name-empty = ім'я псевдоніму не може бути порожнім
err-alias-has-dot = імена псевдонімів не можуть містити '.'
err-alias-has-fragment = імена псевдонімів не можуть містити '#'
err-alias-value-fragment = значення псевдоніму має бути bare did:ma:<ipns> (без фрагменту)
err-alias-value-path = значення псевдоніму має бути bare did:ma:<ipns> (без шляху)
err-alias-not-did = значення псевдоніму має починатися з did:ma:
err-unknown-alias = невідомий псевдонім: @{ $name }
err-bare-did = очікувався bare did:ma:<ipns> (без фрагменту або шляху), отримано { $did }
err-lang-not-found = мову не знайдено: { $lang }

# ── Редактор ──────────────────────────────────────────────────────────────
btn-save = Зберегти
btn-eval = Виконати
btn-cancel = Скасувати
btn-close = Закрити
btn-reply = Відповісти
btn-publish = Опублікувати
btn-publish-ipld = Опублікувати IPLD
msg-reply-sent = відповідь надіслано
msg-reply-failed = помилка надсилання відповіді: { $e }
msg-entity-publish-sent = об'єкт { $name }: публікацію надіслано
msg-entity-publish-failed = помилка публікації об'єкту: { $e }
msg-kind-publish-failed = публікація типу не вдалася: { $e }
msg-field-publish-sent = об'єкт { $name }.{ $field }: публікацію надіслано
msg-field-publish-failed = помилка публікації поля: { $e }
msg-acl-publish-sent = ACL середовища виконання: публікацію надіслано
msg-acl-publish-failed = помилка публікації ACL середовища виконання: { $e }
msg-crud-edit-publish-sent = { $path }: публікацію надіслано
msg-yaml-error = помилка YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = завантажено { $cid } — перевірте перед виконанням
msg-fetch-failed = завантаження { $cid }: { $e }

# ── Дієслова — вхідні ─────────────────────────────────────────────────────
inbox-empty = вхідні порожні
inbox-entry-not-found = запис вхідних { $n } не знайдено
inbox-no-message-id = запис вхідних { $n } не має message_id
inbox-no-verb = немає команди `{ $verb }` для запису вхідних { $n }
inbox-filter-no-arg = фільтр потребує аргумент DID або псевдонім
inbox-filter-empty = немає повідомлень від { $did }

# ── Дієслова — середовище виконання ──────────────────────────────────────
discover-fetch-failed = виявлення не вдалося за { $url }: { $e }
discover-json-error = виявлення не вдалося: неправильний JSON від { $url }: { $e }
discover-missing-did = виявлення не вдалося: у status.json відсутнє поле `did`
discover-invalid-did = виявлення не вдалося: очікувалося, що `did` починається з did:ma:, отримано `{ $did }`
discover-no-endpoint = попередження: `endpoint_id` відсутній у status.json; збережено лише DID
discover-success = ma знайдено за { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдонім @ma створено — виконайте '.my.identity!publish @ma' для публікації особистості.
claim-success = середовище виконання заявлено для { $did }
claim-conflict = середовище виконання вже заявлено іншою особистістю
claim-http-failed = заявка не вдалася: HTTP { $status }
claim-error = заявка не вдалася: { $e }
claim-no-session = не увійшли; увійдіть для заявки середовища виконання
runtime-no-verb = немає команди `{ $verb }` для { $path }

# ── Дієслова — ACL ────────────────────────────────────────────────────────
acl-reset = .my.acl скинуто (повністю відкрито)
acl-persist-error = помилка збереження: { $e }
acl-no-verb = немає команди `{ $verb }` для .my.acl

# ── Дієслова — мова ───────────────────────────────────────────────────────
lang-list-header = Доступні мови (задати через .my.i18n: <code>):

# ── Дієслова — особистість ────────────────────────────────────────────────
publish-usage = використання: .my.identity!publish <did-або-псевдонім>
identity-exported = Пакет завантажено як { $filename }
identity-export-failed = Експорт не вдався: { $e }

# ── Дієслова — документи ─────────────────────────────────────────────────
doc-content-empty = { $path }.content порожній
doc-save-first = { $path }.content порожній — спочатку збережіть
doc-missing-name = відсутня назва документу
doc-publish-usage = використання: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = використання: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = публікація { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = запит збереження надіслано ({ $id }) → { $publisher }; CID надійде через відповідь RPC
doc-ipld-store-sent = запит збереження IPLD надіслано ({ $id }) → { $publisher }; CID надійде через відповідь RPC
doc-fetch-done = завантажено { $cid } → { $path }.content (не виконано)
doc-fetch-failed = завантаження { $cid }: { $e }
doc-fetch-usage = використання: .my.doc.<name>!fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid не встановлено
doc-no-verb = немає команди `{ $verb }` для { $path }
path-no-verb = немає команди `{ $verb }` для { $path }

# ── Довідка — заголовки ───────────────────────────────────────────────────
help-header-zion = ── команди zion ──────────────────────────────────────────────────────────
help-header-messaging = ── повідомлення ──────────────────────────────────────────────────────────
help-header-focus = ── режим фокусу ─────────────────────────────────────────────────────────
help-header-config = ── синтаксис конфігурації ───────────────────────────────────────────────
help-header-common = ── загальні шляхи ────────────────────────────────────────────────────────
help-header-inbox = ── вхідні ───────────────────────────────────────────────────────────────
help-header-documents = ── документи ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Довідка — команди zion ────────────────────────────────────────────────
help-cmd-help =   .help                        цей текст
help-cmd-clear =   .clear                       очистити термінал
help-cmd-history =   .history                     історія команд (послідовні дублікати об'єднані)
help-cmd-panic =   .panic                       останній засіб — використовувати при проблемах
help-cmd-logout =   .logout                      вийти
help-cmd-batch =   .batch                       виконати чернетку (паралельно)
help-cmd-batch-sync =   .batch:begin / .batch         виконати команди послідовно, по одній

# ── Довідка — теми ────────────────────────────────────────────────────────
help-header-topics = ── теми — введіть .help.<тема> для деталей ─────────────────────────────────
help-topic-msg =   .help.msg                    повідомлення — @actor, надсилання, RPC
help-topic-focus =   .help.focus                  режим фокусу — .use @actor
help-topic-path =   .help.path                   синтаксис локального шляху
help-topic-my =   .help.my                     особиста конфігурація
help-topic-inbox =   .help.inbox                  вхідні — .my.inbox.*
help-topic-doc =   .help.doc                    документи — !edit, !eval, !publish, !fetch, !cid
help-topic-actor =   .help.actor                  віддалений актор — CRUD, об'єкти, CID
help-topic-url =   .help.url                    відкрити zion через URL
help-unknown-topic =   .help.{ $topic }: невідома тема — спробуйте .help для списку

# ── Довідка — повідомлення ────────────────────────────────────────────────
help-msg-echo =   @alias                       показати DID (без надсилання)
help-msg-send =   @alias[:verb] body           надіслати повідомлення / RPC актору
help-msg-fragment =   @alias#fragment[:verb] body  надіслати з явним фрагментом DID
help-msg-escape =   \@name                       буквальний @name (без пошуку псевдоніму)

# ── Довідка — режим фокусу ────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       зосередитися на акторі (змінює запрошення)
help-focus-clear =   .use                         скинути фокус

# ── Довідка — синтаксис конфігурації ─────────────────────────────────────
help-config-get =   .path                        отримати значення або список піддерева
help-config-filter =   .path value                  збіг запиту (фільтр за значенням)
help-config-set =   .path: value                 встановити лист
help-config-delete =   .path:                       видалити лист або піддерево
help-config-verb =   .path!verb [args]            викликати локальне дієслово

# ── Довідка — загальні шляхи ──────────────────────────────────────────────
help-my =   .my                          показати особисту конфігурацію
help-aliases =   .my.aliases                  список псевдонімів
help-aliases-set =   .my.aliases.<name>: <did>    додати/оновити псевдонім (bare DID, без #fragment)
help-aliases-del =   .my.aliases.<name>:          видалити псевдонім
help-runtime-discover =   .ma [port]                   підключити локальне середовище → .ctx.ma.* (порт за замовчуванням 5003)
help-runtime-claim =   .ma [port]                   (те ж саме — заявка та виявлення об'єднані)
help-identity =   .my.identity                 показати конфігурацію особистості
help-identity-did =   .my.identity.did             показати власний DID (лише читання)
help-identity-publish =   .my.identity!publish @pub    опублікувати DID через службу публікацій
help-identity-export =   .my.identity!export          завантажити власний пакет особистості
help-config-path =   .ctx                         стан контексту — інформація про ma runtime, CID профілю

# ── Довідка — вхідні ──────────────────────────────────────────────────────
help-inbox =   .my.inbox                    список вхідних (перегляд піддерева)
help-inbox-n =   .my.inbox.N                  показати поля запису N
help-inbox-from =   .my.inbox.N.from             DID відправника запису N
help-inbox-reply =   .my.inbox.N!reply [body]     надіслати відповідь (без тексту — редактор)
help-inbox-open =   .my.inbox.N!open             відкрити вміст у режимі читання
help-inbox-del =   .my.inbox.N:                 видалити запис N
help-inbox-delall =   .my.inbox:                   видалити всі вхідні
help-inbox-flush =   .my.inbox!flush              вивести всі записи в термінал
help-inbox-filter =   .my.inbox!filter @who        показати лише записи від @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   обхід документу відправника

# ── Довідка — документи ───────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           відкрити редактор зі збереженим вмістом
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     завантажити CID для перегляду
help-doc-eval =   .my.doc.<name>!eval           виконати вміст рядок за рядком
help-doc-publish =   .my.doc.<name>!publish @pub   зберегти як сирі дані (будь-який тип)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  зберегти YAML як DAG-CBOR IPLD вузол
help-doc-fetch =   .my.doc.<name>!fetch <cid>    імпортувати вміст CID
help-doc-cid =   .my.doc.<name>!cid            показати збережений CID
help-doc-del =   .my.doc.<name>:              видалити документ

# ── Довідка — параметри URL ───────────────────────────────────────────────
help-header-url = ── параметри URL ─────────────────────────────────────────────────────────
help-url-intro =   Поділіться посиланням для відкриття zion із заздалегідь заповненим отримувачем:
help-url-msg =   ?msg=<did>                   передзаповнює: @<did> (текстове повідомлення)
help-url-say =   ?say=<did>                   передзаповнює: @<did>:say (дієслово say)
help-url-emote =   ?emote=<did>                 передзаповнює: @<did>:emote (дієслово emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Поле заповнено, але не надіслано — натисніть Enter для надсилання.

# ── Повідомлення про помилки ──────────────────────────────────────────────
msg-send-failed = надсилання не вдалося: { $e }
msg-not-logged-in = не увійшли
msg-new-message = ← [{ $from }] нове повідомлення — { $count } у вхідних
msg-chat = { $sender } каже { $body }

# ── Події кімнати ─────────────────────────────────────────────────────────
room-say   = { $name } каже { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } входить до кімнати.
room-leave = * { $name } виходить з кімнати.
room-drop  = * { $name } кидає { $thing }.
room-take  = * { $name } підбирає { $thing }.

# ── Відображення відповіді RPC ────────────────────────────────────────────
rpc-error = помилка
rpc-error-detail = помилка: { $detail }

# ── Помилки редагування ───────────────────────────────────────────────────
err-edit-decode-failed = помилка декодування при редагуванні: { $e }
err-edit-fetch-failed = помилка завантаження при редагуванні: { $e }

# ── Помилки кодеку CBOR / YAML ────────────────────────────────────────────
yaml-parse-error = Помилка розбору YAML: { $e }
yaml-not-mapping = YAML має бути mapping (пари ключ: значення); простий текст і скаляри не можуть зберігатися як DAG-CBOR
dagcbor-encode-error = Помилка кодування DAG-CBOR: { $e }
cbor-decode-error = Помилка декодування CBOR: { $e }
cbor-json-error = Помилка CBOR→JSON: { $e }
yaml-serialize-error = Помилка серіалізації YAML: { $e }
edit-reply-invalid = Некоректна відповідь на редагування
doc-publish-ipld-error = Помилка публікації IPLD: { $e }

# ── Внутрішні / сесійні помилки ───────────────────────────────────────────
err-inbox-prune-persist = Помилка збереження очищення вхідних: { $e }
err-config-load = Помилка завантаження конфігурації: { $e }
err-lang-persist = Помилка збереження мови: { $e }
err-history-parse = Помилка розбору історії: { $e }
err-history-load = Помилка завантаження історії: { $e }
err-ipfs-reply-decode = Помилка декодування відповіді IPFS: { $e }
err-edit-cbor = Помилка CBOR при редагуванні: { $e }
err-popup-blocked = Спливаюче вікно заблоковано браузером
status-publishing = публікується

# ── Керування профілями ───────────────────────────────────────────────────
profile-delete-no-session = немає активної сесії — профіль не може бути видалений
profile-delete-needs-name = вкажіть назву профілю: .profiles.<name>:
profile-delete-error = видалення профілю не вдалося: { $e }
profiles-empty = (нема)
profiles-deleted = профіль { $name } видалено
profiles-not-found = профіль не знайдено: { $name }
profile-wrong-user = не можна встановити CID для іншого профілю — лише для свого
profile-wrong-user-name = не можна встановити CID для '{ $name }' — лише для свого профілю
profile-no-ma = середовище виконання ma не налаштовано — спочатку виконайте '.ma [port]'
profile-no-cid = CID не збережено для цього профілю — спочатку виконайте '!publish'
profile-no-cid-in-doc = CID профілю не знайдено в DID-документі — спочатку виконайте '!publish'
profile-publish-sent = профіль зашифровано та надіслано до IPFS; DID-документ буде оновлено, коли надійде CID
profile-publish-done = профіль опубліковано — DID-документ оновлено з ma.agent CID
profile-publish-failed = публікація профілю не вдалася: { $e }
profile-fetch-done = профіль отримано — завантажено ключів { $n } з IPFS
profile-fetch-failed = отримання профілю не вдалося: { $e }
profile-fetch-did-resolve-failed = DID ще не опубліковано — спочатку виконайте '.my.identity!publish @ma', потім '!publish' профіль
profile-update-done = профіль оновлено — { $n } ключів об'єднано з CID
msg-identity-exists = особистість вже опублікована — профіль актуальний
profile-import-exists = профіль '{ $name }' вже існує — спочатку видаліть його
profile-import-wrong-user = файл містить профіль '{ $found }', очікувалося '{ $expected }'

# ── Операції з вмістом CID ────────────────────────────────────────────────
cid-op-binary = двійковий вміст (не відображається)
cid-op-cat-truncated = … (вивід скорочено до { $n } рядків)
cid-op-fetch-failed = не вдалося отримати вміст: { $e }
cid-op-unknown = невідома операція з вмістом: { $op }
cid-op-wc = { $lines } рядків  { $words } слів  { $chars } символів

# ── Довідка — актор / віддалений CRUD ────────────────────────────────────
help-header-actor = ── віддалені актори ──────────────────────────────────────────────────────
help-actor-echo =   @actor                       показати DID (без надсилання)
help-actor-text =   @actor body                  надіслати текстове повідомлення
help-actor-ping =   @actor:ping                  перевірка доступності
help-actor-entities =   @actor.entities              список усіх об'єктів
help-actor-entities-get =   @actor.entities.<n>          отримати об'єкт (повертає CID)
help-actor-entities-set =   @actor.entities.<n>: <cid>   встановити об'єкт за CID
help-actor-entities-edit =   @actor.entities.<n>!edit     редагувати об'єкт в редакторі
help-actor-entities-del =   @actor.entities.<n>:         видалити об'єкт
help-actor-config-get =   @actor.config.<key>          отримати значення конфігурації
help-actor-config-set =   @actor.config.<key>: val     встановити значення конфігурації
help-actor-acl =   @actor.acl                   отримати ACL (повертає CID)
help-actor-acl-edit =   @actor.acl!edit              редагувати ACL в редакторі
help-actor-fragment =   @actor#entity                надіслати до плагіну об'єкту
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC до дієслова плагіну
help-header-cid-ops = ── операції з вмістом CID ────────────────────────────────────────────────
help-actor-cat =   @actor:ent:cat               показати вміст файлу
help-actor-head =   @actor:ent:head N            перші N рядків (за замовчуванням 10)
help-actor-tail =   @actor:ent:tail N            останні N рядків (за замовчуванням 10)
help-actor-wc =   @actor:ent:wc               кількість рядків / слів / символів
help-actor-wc-l =   @actor:ent:wc -l            лише кількість рядків

# ── Довідка — публікація ──────────────────────────────────────────────────
help-topic-publish =   .help.publish                публікація особистості в мережі
help-header-publish = ── публікація особистості ───────────────────────────────────────────────────
help-publish-intro = Публікація робить вашу особистість доступною для пошуку в мережі. Інші можуть знайти ваш DID, щоб зв'язатися з вами.
help-publish-ma = Для публікації потрібен встановлений ma (локальне середовище виконання). Він з'єднує ego з IPFS/IPNS від вашого імені.
help-publish-steps = Кроки: виконайте '.ma [port]' для виявлення локального ma, потім '.my.identity!publish @ma'.
help-publish-without = Без публікації інші не зможуть вас знайти — навіть знаючи ваш DID, вони не зможуть знайти ваш endpoint.

# ── Пакетний режим ────────────────────────────────────────────────────────
batch-collecting-started = Збір пакету — введіть команди, закінчіть з .batch
batch-already-collecting = Вже збирається пакет — спочатку закінчіть з .batch
batch-empty = Пакет був порожній — нічого виконувати
batch-running = Виконання пакету…
batch-step-timeout = час очікування кроку пакету вичерпано
batch-done = Пакет виконано за { $secs }с — { $steps } кроків
batch-done-error = Пакет завершено з помилками за { $secs }с — { $steps } кроків
msg-timeout = Час очікування повідомлення вичерпано (немає відповіді протягом 60 с)
help-cmd-batch-sync =   .batch:sync / .batch         виконати команди послідовно, по одній
help-cmd-batch-async =   .batch:async / .batch        виконати команди паралельно

# ── Схема ─────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Не вдалося отримати CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Недійсний CID: { $value }
