# zion — Български
lang-name = Български
label-nick = прякор
new-identity-nick-help = Изберете прякор за 間-space. Това е само прякор и може да се промени по всяко време.
error-nick-required = необходим е прякор
error-nick-invalid = прякорът не трябва да съдържа интервали или @

# ── Страница за вход ──────────────────────────────────────────────────────
tab-login = вход
tab-new-identity = нова идентичност
tab-import-profile = импортиране на профил
label-passphrase = парола-фраза
label-username = потребителско име
label-confirm-passphrase = потвърдете паролата-фраза
label-did = DID
label-profile-cid = CID на профила
label-or-file = или файл
btn-login = вход
btn-export = експортиране
btn-generate = генериране
btn-new-endpoint = нова крайна точка
btn-import-profile = импортиране на профил
btn-show-qr = покажи QR
btn-scan-qr = сканирай QR
qr-scan-hint = Насочете камерата към QR код на zion профил.
qr-error-camera = камерата не е достъпна: { $e }
qr-error-too-large = профилът е твърде голям за QR код
passphrase-warning = Изгубена парола-фраза = изгубена идентичност. Възстановяването не е възможно.
import-profile-help = Импортирайте профил чрез CID или файл. Необходима е същата парола, използвана при публикуване.
import-profile-detected-user = Профилът принадлежи на: { $name }
status-unlocking = отключване...
status-generating = генериране на идентичност...
status-reading-file = четене на файл...
status-fetching-profile = извличане на профил от IPFS...
status-imported = '{ $name }' импортирано — преминете към раздел Вход
status-importing-profile = профилът се импортира...
profile-import-done = профилът за '{ $name }' е импортиран — заредени са { $n } ключа
error-wrong-passphrase = грешна парола-фраза: { $e }
error-identity-not-found = идентичността '{ $name }' не е намерена
error-username-required = потребителското име е задължително
error-passphrase-required = паролата-фраза е задължителна
error-passphrases-no-match = паролите-фрази не съвпадат
error-profile-source-required = въведете CID или качете файл
error-did-required = въведете вашия DID
error-profile-fetch = неуспешно извличане на профила: { $e }
error-profile-no-username = профилът не съдържа потребителско име
error-profile-no-identity = самоличността '{ $name }' не е намерена — първо импортирайте самоличността

# ── Системни съобщения на терминала ──────────────────────────────────────
msg-logged-in = zion v{ $version } — влязохте като { $username }
msg-type-help = Въведете .help за списък с команди.
msg-getting-started = Опитайте: say Hello world, look, .help или help.
msg-connecting = свързване с iroh...
msg-iroh-ready = iroh крайната точка е готова
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID публикуван чрез локален 間 ({ $url })
msg-identity-publication-propagating = Публикуването на идентичността все още се разпространява; влизането е отложено: { $e }
msg-identity-first-publish = Публикуваме идентичността за първи път. Това може да отнеме до { $seconds } секунди.
msg-ma-connecting-matrix = опитваме се да те свържем с 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = локалният 間 е заявен
msg-local-ma-already-claimed = локалният 間 вече е заявен
msg-local-ma-claim-failed = неуспешно заявяване на локалния 間
msg-identity-not-published = Самоличността не е намерена онлайн — ако имаш инсталиран 間 локално, изпълни '.ma: claim [port]' и след това '.my.identity!publish @ma'. Напиши '.help/publish' за подробности.
msg-blocked = ⊗ блокирано [{ $cap }]: { $from }
msg-focus-cleared = фокусът е изчистен
msg-left = left
msg-focusing = фокусиране върху { $did } като { $prompt }
msg-set = { $path }: { $value }
msg-deleted = изтрито { $path } ({ $count } записа)
msg-read-only = { $path } е само за четене
msg-subtree-set = { $path } е поддърво; задаването е отказано
msg-ancestor-leaf = предшественик на { $path } е лист; засенчването е отказано
msg-key-not-found = ключът не е намерен: { $path }
msg-link-not-connected = грешка при извличане на връзка: не е свързано
msg-link-fetch-error = грешка при извличане на връзка: { $e }
msg-link-key-not-found = ключът `{ $key }` не е намерен в свързания документ

# ── Валидиране на псевдоними ──────────────────────────────────────────────
err-alias-name-empty = името на псевдонима не може да е празно
err-alias-has-dot = името на псевдонима не може да съдържа '.'
err-alias-has-fragment = името на псевдонима не може да съдържа '#'
err-alias-value-fragment = стойността на псевдонима може да съдържа най-много един непразен DID-URL фрагмент
err-alias-value-path = стойността на псевдонима трябва да е did:ma:<ipns> DID или DID-URL (без път)
err-alias-not-did = стойността на псевдонима трябва да започва с did:ma:
err-unknown-alias = непознат псевдоним: @{ $name }
err-bare-did = очаква се чисто did:ma:<ipns> (без фрагмент или път), получено { $did }

# ── Редактор ──────────────────────────────────────────────────────────────
btn-save = Запазване
btn-eval = Изпълнение
btn-cancel = Отмяна
msg-jobs-cancelled = задачите са отменени
btn-close = Затваряне
btn-reply = Отговор
btn-publish = Публикуване
btn-publish-ipld = Публикуване IPLD
msg-reply-sent = отговорът е изпратен
msg-reply-failed = изпращането на отговора е неуспешно: { $e }
msg-entity-publish-sent = обект { $name }: публикуването е изпратено
msg-entity-publish-failed = публикуването на обекта е неуспешно: { $e }
msg-kind-publish-failed = Неуспешно публикуване на тип: { $e }
msg-field-publish-sent = обект { $name }.{ $field }: публикуването е изпратено
msg-field-publish-failed = публикуването на полето е неуспешно: { $e }
msg-acl-publish-sent = ACL на средата за изпълнение: публикуването е изпратено
msg-crud-edit-publish-sent = { $path }: публикуването е изпратено
msg-acl-publish-failed = публикуването на ACL на средата за изпълнение е неуспешно: { $e }
msg-yaml-error = грешка в YAML: { $e }
msg-editor-saved = { $path }:запазване
msg-fetch-review = { $cid } е извлечен — прегледайте преди изпълнение
msg-fetch-failed = извличане { $cid }: { $e }

# ── Глаголи — входяща поща ───────────────────────────────────────────────
inbox-empty = входящата поща е празна
inbox-entry-not-found = запис { $n } от входящата поща не е намерен
inbox-no-message-id = запис { $n } от входящата поща няма message_id
inbox-no-verb = няма глагол `{ $verb }` за запис { $n } от входящата поща
inbox-filter-no-arg = филтърът изисква DID или псевдоним
inbox-filter-empty = няма съобщения от { $did }

# ── Глаголи — среда за изпълнение ────────────────────────────────────────
discover-fetch-failed = откриването е неуспешно на { $url }: { $e }
discover-json-error = откриването е неуспешно: невалиден JSON от { $url }: { $e }
discover-missing-did = откриването е неуспешно: status.json липсва задължителното поле `did`
discover-invalid-did = откриването е неуспешно: очаква се `did` да започва с did:ma:, получено `{ $did }`
discover-no-endpoint = предупреждение при откриване: `endpoint_id` липсва в status.json; запазен само DID
discover-hint-endpoint-not-found = Подсказка: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Подсказка: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Подсказка: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Подсказка: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 е открито на { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдоним @ma създаден — изпълни '.my.identity!publish @ma' за публикуване на самоличността ти.
claim-success = Средата за изпълнение е заявена за { $did }
claim-conflict = Средата за изпълнение вече е заявена от друга идентичност
claim-already-owned = Runtime вече е заявен от тази идентичност
claim-http-failed = заявяването е неуспешно: HTTP { $status }
claim-error = заявяването е неуспешно: { $e }
claim-no-session = не сте влезли; влезте първо, за да заявите средата за изпълнение
runtime-no-verb = няма глагол `{ $verb }` за { $path }

# ── Глаголи — контрол на достъп ──────────────────────────────────────────
acl-reset = .my.acl е нулиран (напълно отворен)
acl-persist-error = грешка при запазване: { $e }
acl-no-verb = няма глагол `{ $verb }` за .my.acl

# ── Глаголи — идентичност ─────────────────────────────────────────────────
publish-usage = употреба: .my.identity!publish <did-или-псевдоним>
identity-exported = Пакетът е изтеглен като { $filename }
identity-export-failed = Грешка при експортиране: { $e }

# ── Глаголи — документи ───────────────────────────────────────────────────
doc-content-empty = { $path } е празно
doc-save-first = { $path } е празно — първо запазете
doc-missing-name = липсва името на документа
doc-publish-usage = употреба: .my.doc.<име>!publish <издател>
doc-publish-ipld-usage = употреба: .my.doc.<име>!publish-ipld <издател>
doc-publish-failed = публикуване { $path }: { $e }
doc-publish-ipld-failed = публикуване IPLD { $path }: { $e }
doc-publish-error-detail = публикуването е неуспешно [{ $code }]: { $err }
doc-publish-error-hint = Подсказка: { $hint }
doc-publish-hint-session = влезте отново, за да може егото да има достъп до ключовете ви за самоличност
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = проверете дали документът DID на издателя е публикуван и съдържа достижима крайна точка
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin отхвърли заявката; проверете причината и опитайте отново след коригиране на обекта/времето за изпълнение
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = проверете регистрационните файлове по време на изпълнение за подробна причина и опитайте отново
doc-store-sent = заявка за съхранение изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-ipld-store-sent = заявка за съхранение IPLD изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-fetch-done = { $cid } е извлечен → { $path } (не е изпълнено)
doc-fetch-failed = извличане { $cid }: { $e }
doc-fetch-usage = употреба: .my.doc.<име>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid не е зададен
doc-no-verb = няма глагол `{ $verb }` за { $path }
path-no-verb = няма глагол `{ $verb }` за { $path }

# ── Текст за помощ — заглавия ─────────────────────────────────────────────
help-header-zion = ── команди на zion ────────────────────────────────────────────────────────
help-header-messaging = ── съобщения ─────────────────────────────────────────────────────────────
help-header-config = ── локален синтаксис за конфигурация ──────────────────────────────────
help-header-common = ── чести пътища ──────────────────────────────────────────────────────────
help-header-inbox = ── входяща поща ──────────────────────────────────────────────────────────
help-header-documents = ── документи ────────────────────────────────────────────────────────────
help-header-i18n = ── език ───────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── въвеждане на 間-интервал ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        този текст
help-cmd-clear =   .clear                       изчистване на терминала
help-cmd-panic =   .panic                       последна мярка — използвайте ако сте в затруднение
help-cmd-history =   .history [n]                 история на командите (последователните дублирания се обединяват); незадължителният n показва само последните n реда
help-cmd-logout =   .logout                      изход
help-cmd-batch =   .batch                       изпълни временен документ (паралелно)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         изпълни временен документ ред по ред

help-msg-echo =   @alias                       покажи разрешения DID/DID-URL (не се изпраща съобщение)
help-msg-send =   @alias!msg body / @alias:verb args           изпраща съобщение / RPC на актьор
help-msg-fragment =   @alias#fragment:verb body  изпраща до псевдоним с явен DID фрагмент
help-msg-escape =   \@name                       буквален @name (без търсене на псевдоним)


help-config-get =   .path                        получава стойността на лист или изброява поддърво
help-config-filter =   .path [име]                  изброява имена на дъщерни ключове, съдържащи име
help-config-full =   .path. [име]                 изброява пълни стойности на поддърво, съдържащи име
help-config-set =   .path: value                 задава лист
help-config-delete =   .path:                       изтрива лист или поддърво
help-config-verb =   .path!verb [args]            изпълнява локален глагол

help-my =   .my                          показва цялата лична конфигурация
help-aliases =   .my.aliases                  изброява псевдоними
help-aliases-set =   .my.aliases.<name>: <did-url>    добавяне/обновяване на псевдоним (DID или DID-URL)
help-aliases-del =   .my.aliases.<name>:          премахва псевдоним
help-runtime-discover =   .ma: claim [port]          открива локална среда за изпълнение и създава псевдоним @ma
help-runtime-claim =   .ma: claim [port]             заявява средата за изпълнение с вашия DID
help-identity =   .my.identity                 показва конфигурацията на идентичността
help-identity-did =   .my.identity.did             показва собствения DID (само за четене)
help-identity-publish =   .my.identity!publish @pub    публикува собствения DID чрез услугата на издателя
help-identity-export =   .my.identity!export          изтегли собствения пакет с идентичност
help-config-path =   .config                      показва всички записи .config.*

help-inbox =   .my.inbox                    изброява входящата поща (изглед на поддърво)
help-inbox-n =   .my.inbox.N                  показва полетата на запис N
help-inbox-from =   .my.inbox.N.from             DID на подателя за запис N
help-inbox-reply =   .my.inbox.N!reply [body]     изпраща отговор (отваря редактор без тяло)
help-inbox-open =   .my.inbox.N!open             отваря съдържанието в редактор само за четене
help-inbox-del =   .my.inbox.N:                 изтрива запис N
help-inbox-delall =   .my.inbox:                   изтрива всички записи от входящата поща
help-inbox-flush =   .my.inbox!flush              отпечатва всички записи в терминала
help-inbox-filter =   .my.inbox!filter @who        покажи само записи от @who
help-inbox-traverse =   .my.inbox.N.sender.<поле>   обхожда DID документа на подателя мързеливо

help-doc-edit =   .my.doc.<име>!edit           отваря редактор със запазено съдържание
help-doc-edit-cid =   .my.doc.<ime>!edit /ipfs/<cid>     извлича CID, отваря за преглед
help-doc-eval =   .my.doc.<ime>!eval           изпълнява запазеното съдържание ред по ред
help-doc-publish =   .my.doc.<ime>!publish @pub   запазва като суров блоб (всички типове)
help-doc-publish-ipld =   .my.doc.<ime>!publish-ipld @pub  запазва YAML като структуриран DAG-CBOR IPLD възел
help-doc-fetch =   .my.doc.<ime>!fetch /ipfs/<cid>    импортира съдържание CID (без изпълнение)
help-doc-cid =   .my.doc.<ime>!cid            показва запазения CID
help-doc-del =   .my.doc.<ime>:              изтрива документ

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n съхранява езиковите предпочитания, свързани с вашата самоличност.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               избройте наличните езикови кодове

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Стаята 間 е пространството между 間 идентичности. ma помага на тези идентичности да се намират и да общуват; щом идентичността ти е публикувана, можеш да участваш.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   свържи се с локалния 間 runtime, прочети /status.json и запази .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     публикувай своя DID документ, за да могат другите да открият ключовете и endpoint-а ти
help-ma-security = Най-ясната граница на доверие е твоят собствен 間 runtime със собствен IPFS Desktop/Kubo. Отдалечен publisher може да е полезен, но тогава разчиташ на чужда услуга.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             как да влезеш в стаята 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Когато идентичността ти е позната, .enter @ma ти позволява да влезеш в 間. Намери свят, влез в него и участвай оттам.
help-ma-entry-steps = Стартирай IPFS Desktop и ma, после изпълни .ma. Публикувай с .my.identity!publish @ma, намери свят и влез с .enter @ma.
help-ma-entry-command =   .enter @ma                  влез в 間 през runtime-а @ma
help-ma-entry-toggle =   .enter                       включи или изключи фокуса към стаята; идентичността ти остава активна
help-ma-entry-url =   ?enter=<runtime>             влез след вход от споделен URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Налични езици (задайте с .my.i18n: <code>):
err-lang-not-found = езикът не е намерен: { $lang }

msg-send-failed = изпращането не бе успешно: { $e }
msg-not-logged-in = не е влязъл в профила

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Грешка при разбор на YAML: { $e }
yaml-not-mapping = YAML трябва да бъде mapping (двойки ключ: стойност); обикновен текст и скалари не могат да се съхраняват като DAG-CBOR
dagcbor-encode-error = Грешка при кодиране на DAG-CBOR: { $e }
cbor-decode-error = Грешка при декодиране на CBOR: { $e }
cbor-json-error = Грешка при конвертиране CBOR→JSON: { $e }
yaml-serialise-error = Грешка при сериализиране на YAML: { $e }
edit-reply-invalid = Невалиден отговор за редактиране
doc-publish-ipld-error = Неуспешно публикуване на IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Грешка при запазване на почистването на входяща поща: { $e }
err-config-load = Грешка при зареждане на конфигурацията: { $e }
err-lang-persist = Грешка при запазване на езика: { $e }
err-history-parse = Грешка при разбор на историята: { $e }
err-history-load = Грешка при зареждане на историята: { $e }
err-history-count-invalid = броят за историята трябва да е положително цяло число
err-ipfs-reply-decode = Грешка при декодиране на IPFS отговор: { $e }
err-edit-cbor = Грешка при редактиране на CBOR: { $e }
err-popup-blocked = Изскачащият прозорец е блокиран от браузъра
status-publishing = публикуване

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = грешка
rpc-error-detail = грешка: { $detail }
msg-new-message = ← [{ $from }] ново съобщение — { $count } в пощата
msg-chat = { $sender } казва { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } казва { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } влезе в стаята.
room-leave = * { $name } излезе от стаята.
room-drop  = * { $name } пусна { $thing }.
room-take  = * { $name } вдигна { $thing }.
err-edit-decode-failed = грешка при декодиране: { $e }
err-edit-fetch-failed = грешка при зареждане: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = няма активна сесия — профилът не може да бъде изтрит
profile-delete-error = изтриването на профила не бе успешно: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = профилът е шифрован и изпратен към IPFS; DID документът ще бъде обновен, когато пристигне CID
profile-publish-done = профилът е публикуван — DID документът е обновен с ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = самоличността вече е публикувана — профилът е актуален
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = двоично съдържание (не се показва)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (никой)
profiles-deleted = профил { $name } изтрит
profiles-not-found = профилът не е намерен: { $name }

# -- Help topics index
help-header-topics = -- теми -- въведете .help/<topic> за подробности
help-topic-msg =   .help/msg                    съобщения
help-topic-ma = .help/ma                     間-пространство, публикуване и влизане
help-topic-path = .help/path                   локална граматика на точков път
help-topic-my =   .help/my                     лична config
help-topic-inbox =   .help/inbox                  входяща кутия
help-topic-doc =   .help/doc                    документи
help-topic-actor =   .help/actor                  отдалечен actor
help-topic-zscheme =   .help/zscheme               вградени Scheme изрази и документация
help-unknown-topic =   .help/{ $topic }: непозната тема

# -- Help actor section
help-header-actor = -- отдалечени актьори
help-actor-echo =   @actor                       покажи разрешения DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         изпращане на директно/чат/емоционално съобщение
help-actor-ping = @actor:ping                  живост пинг
help-actor-entities =   @actor/entities              изброй обектите
help-actor-entities-get = @actor/entities/<n>          вземете възел на обект
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     редактирай обект
help-actor-entities-del = @actor/entities/<n>:         изтриване на обект
help-actor-config-get =   @actor/config/<key>          вземи стойност на config
help-actor-config-set =   @actor/config/<key>: val     задай стойност на config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              редактирай ACL
help-actor-fragment =   @actor#entity                изпрати към plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC към plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  запазва 5 отговорите в средата на сесията
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    отваряне на zion чрез URL връзка
help-topic-i18n = .help/i18n                   езикови предпочитания за вашата идентичност
help-header-url = ── URL параметри ────────────────────────────────────────────────────────────────
help-url-intro =   Сподели връзка, която отваря zion с предварително попълнен получател:
help-url-msg =   ?msg=<did>                   предварително попълва: @<did>!msg (обикновено съобщение)
help-url-say =   ?say=<did>                   предварително попълва: @<did>!say (глагол say)
help-url-emote =   ?emote=<did>                 предварително попълва: @<did>!emote (глагол emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             влезте в света на изпълнение след влизане
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Полето е предварително попълнено, но не изпратено — натисни Enter за изпращане.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                публикуване на самоличността ти в мрежата
help-header-publish = ── публикуване на самоличност ───────────────────────────────────────────────
help-publish-intro = Публикуването прави самоличността ти намираема в мрежата. Другите могат да потърсят твоя DID, за да те достигнат.
help-publish-ma = За публикуване е необходим инсталиран 間 (локален runtime). Той свързва ego с IPFS/IPNS от твое име.
help-publish-steps = Стъпки: изпълни '.ma: claim [port]' за намиране на локалния ma, след което '.my.identity!publish @ma'.
help-publish-without = Без публикуване другите не могат да те достигнат — дори да знаят твоя DID, не могат да разрешат твоя endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = посочете име на профил: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Събиране на пакетни команди, завършващи с .batch
batch-already-collecting = Вече събирате партида — първо завършете с .batch
batch-empty = Партидата беше празна — нямаше нищо за изпълнение
batch-running = Изпълняване на batch…
batch-step-timeout = пакетната стъпка изтече

batch-done = Batch завърши за { $secs }s — { $steps } стъпки
batch-done-error = Batch завърши с грешки за { $secs }s — { $steps } стъпки
msg-timeout = Съобщението изтече (няма отговор за 60s)
err-unknown-command = непозната команда: { $path }
err-read-only-path = { $path } е само за четене
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        изпълни временен документ (паралелно)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Грешка при извличане на CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Невалиден CID: { $value }
label-runtime = ма
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Предупреждение: Вашият частен IPNS ключ ще бъде изпратен към тази среда за изпълнение за публикуване на самоличност. Използвайте само среда за изпълнение, на която напълно се доверявате.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme оценява Scheme изрази, вградени в zion команди, и вмъква резултата в реда, преди той да бъде изпратен.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    вграден пример; изпраща "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             дефинициите остават за текущата сесия
help-zscheme-doc = Документация: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Локален IPFS шлюз (изисква изключение в браузъра)

tab-config = Настройки
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
