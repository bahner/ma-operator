# zion — Български
lang-name = Български

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
msg-connecting = свързване с iroh...
msg-iroh-ready = iroh крайната точка е готова
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID публикуван чрез локален ma ({ $url })
msg-identity-not-published = Самоличността не е намерена онлайн — ако имаш инсталиран ma локално, изпълни '.ma [port]' и след това '/my/identity!publish @ma'. Напиши '.help.publish' за подробности.
msg-blocked = ⊗ блокирано [{ $cap }]: { $from }
msg-focus-cleared = фокусът е изчистен
msg-focusing = фокусиране върху { $did } като { $prompt }
msg-set = { $path }: { $value }
msg-deleted = изтрито { $path } ({ $count } записа)
msg-read-only = { $path } е само за четене
msg-subtree-set = { $path } е поддърво; задаването е отказано
msg-ancestor-leaf = предшественик на { $path } е лист; засенчването е отказано
msg-key-not-found = ключът не е намерен: { $path }
msg-no-match = няма съвпадение
msg-link-not-connected = грешка при извличане на връзка: не е свързано
msg-link-fetch-error = грешка при извличане на връзка: { $e }
msg-link-key-not-found = ключът `{ $key }` не е намерен в свързания документ

# ── Валидиране на псевдоними ──────────────────────────────────────────────
err-alias-name-empty = името на псевдонима не може да е празно
err-alias-has-dot = името на псевдонима не може да съдържа '.'
err-alias-has-fragment = името на псевдонима не може да съдържа '#'
err-alias-value-fragment = стойността на псевдонима трябва да е чисто did:ma:<ipns> (без фрагмент)
err-alias-value-path = стойността на псевдонима трябва да е чисто did:ma:<ipns> (без път)
err-alias-not-did = стойността на псевдонима трябва да започва с did:ma:
err-unknown-alias = непознат псевдоним: @{ $name }
err-bare-did = очаква се чисто did:ma:<ipns> (без фрагмент или път), получено { $did }

# ── Редактор ──────────────────────────────────────────────────────────────
btn-save = Запазване
btn-eval = Изпълнение
btn-cancel = Отмяна
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
discover-success = ma е открито на { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдоним @ma създаден — изпълни '/my/identity!publish @ma' за публикуване на самоличността ти.
claim-success = Средата за изпълнение е заявена за { $did }
claim-conflict = Средата за изпълнение вече е заявена от друга идентичност
claim-http-failed = заявяването е неуспешно: HTTP { $status }
claim-error = заявяването е неуспешно: { $e }
claim-no-session = не сте влезли; влезте първо, за да заявите средата за изпълнение
runtime-no-verb = няма глагол `{ $verb }` за { $path }

# ── Глаголи — контрол на достъп ──────────────────────────────────────────
acl-reset = /my/acl е нулиран (напълно отворен)
acl-persist-error = грешка при запазване: { $e }
acl-no-verb = няма глагол `{ $verb }` за /my/acl

# ── Глаголи — идентичност ─────────────────────────────────────────────────
publish-usage = употреба: /my/identity!publish <did-или-псевдоним>
identity-exported = Пакетът е изтеглен като { $filename }
identity-export-failed = Грешка при експортиране: { $e }

# ── Глаголи — документи ───────────────────────────────────────────────────
doc-content-empty = { $path }/content е празно
doc-save-first = { $path }/content е празно — първо запазете
doc-missing-name = липсва името на документа
doc-publish-usage = употреба: /my/doc/<име>:publish <издател>
doc-publish-ipld-usage = употреба: /my/doc/<име>:publish-ipld <издател>
doc-publish-failed = публикуване { $path }: { $e }
doc-publish-ipld-failed = публикуване IPLD { $path }: { $e }
doc-store-sent = заявка за съхранение изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-ipld-store-sent = заявка за съхранение IPLD изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-fetch-done = { $cid } е извлечен → { $path }/content (не е изпълнено)
doc-fetch-failed = извличане { $cid }: { $e }
doc-fetch-usage = употреба: /my/doc/<име>:fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid не е зададен
doc-no-verb = няма глагол `{ $verb }` за { $path }
path-no-verb = няма глагол `{ $verb }` за { $path }

# ── Текст за помощ — заглавия ─────────────────────────────────────────────
help-header-zion = ── команди на zion ────────────────────────────────────────────────────────
help-header-messaging = ── съобщения ─────────────────────────────────────────────────────────────
help-header-focus = ── режим на фокус ────────────────────────────────────────────────────────
help-header-config = ── локален синтаксис за конфигурация ──────────────────────────────────
help-header-common = ── чести пътища ──────────────────────────────────────────────────────────
help-header-inbox = ── входяща поща ──────────────────────────────────────────────────────────
help-header-documents = ── документи ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        този текст
help-cmd-clear =   .clear                       изчистване на терминала
help-cmd-panic =   .panic                       последна мярка — използвайте ако сте в затруднение
help-cmd-history =   .history                     история на командите (последователните дублирания се обединяват)
help-cmd-logout =   .logout                      изход
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       показва разрешения DID (не изпраща съобщение)
help-msg-send =   @alias[:verb] body           изпраща съобщение / RPC на актьор
help-msg-fragment =   @alias#fragment[:verb] body  изпраща до псевдоним с явен DID фрагмент
help-msg-escape =   \@name                       буквален @name (без търсене на псевдоним)

help-focus-set =   .use @alias [as @name]       фокусира върху актьор (променя подсказката)
help-focus-clear =   .use                         изчиства фокуса

help-config-get =   .path                        получава стойността на лист или изброява поддърво
help-config-filter =   .path value                  филтър за търсене (филтриране по стойност)
help-config-set =   .path: value                 задава лист
help-config-delete =   .path:                       изтрива лист или поддърво
help-config-verb =   .path!verb [args]            изпълнява локален глагол

help-my =   /my                          показва цялата лична конфигурация
help-aliases =   /my/aliases                  изброява псевдоними
help-aliases-set =   /my/aliases/<name>: <did>    добавя/актуализира псевдоним (чисто DID, без #фрагмент)
help-aliases-del =   /my/aliases/<name>:          премахва псевдоним
help-runtime-discover =   .ma [port]          открива локална среда за изпълнение и създава псевдоним @ma
help-runtime-claim =   .ma [port]             заявява средата за изпълнение с вашия DID
help-identity =   /my/identity                 показва конфигурацията на идентичността
help-identity-did =   /my/identity/did             показва собствения DID (само за четене)
help-identity-publish =   /my/identity!publish @pub    публикува собствения DID чрез услугата на издателя
help-identity-export =   /my/identity!export          изтегли собствения пакет с идентичност
help-config-path =   .config                      показва всички записи .config.*

help-inbox =   /my/inbox                    изброява входящата поща (изглед на поддърво)
help-inbox-n =   /my/inbox/N                  показва полетата на запис N
help-inbox-from =   /my/inbox/N/from             DID на подателя за запис N
help-inbox-reply =   /my/inbox/N!reply [body]     изпраща отговор (отваря редактор без тяло)
help-inbox-open =   /my/inbox/N!open             отваря съдържанието в редактор само за четене
help-inbox-del =   /my/inbox/N:                 изтрива запис N
help-inbox-delall =   /my/inbox:                   изтрива всички записи от входящата поща
help-inbox-flush =   /my/inbox!flush              отпечатва всички записи в терминала
help-inbox-filter =   /my/inbox!filter @who        покажи само записи от @who
help-inbox-traverse =   /my/inbox/N/sender/<поле>   обхожда DID документа на подателя мързеливо

help-doc-edit =   /my/doc/<име>:edit           отваря редактор със запазено съдържание
help-doc-edit-cid =   /my/doc/<ime>:edit <cid>     извлича CID, отваря за преглед
help-doc-eval =   /my/doc/<ime>:eval           изпълнява запазеното съдържание ред по ред
help-doc-publish =   /my/doc/<ime>:publish @pub   запазва като суров блоб (всички типове)
help-doc-publish-ipld =   /my/doc/<ime>:publish-ipld @pub  запазва YAML като структуриран DAG-CBOR IPLD възел
help-doc-fetch =   /my/doc/<ime>:fetch <cid>    импортира съдържание CID (без изпълнение)
help-doc-cid =   /my/doc/<ime>:cid            показва запазения CID
help-doc-del =   /my/doc/<ime>:              изтрива документ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Налични езици (задайте с /my/i18n: <code>):
err-lang-not-found = езикът не е намерен: { $lang }

msg-send-failed = изпращането не бе успешно: { $e }
msg-not-logged-in = не е влязъл в профила

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Грешка при разбор на YAML: { $e }
yaml-not-mapping = YAML трябва да бъде mapping (двойки ключ: стойност); обикновен текст и скалари не могат да се съхраняват като DAG-CBOR
dagcbor-encode-error = Грешка при кодиране на DAG-CBOR: { $e }
cbor-decode-error = Грешка при декодиране на CBOR: { $e }
cbor-json-error = Грешка при конвертиране CBOR→JSON: { $e }
yaml-serialize-error = Грешка при сериализиране на YAML: { $e }
edit-reply-invalid = Невалиден отговор за редактиране
doc-publish-ipld-error = Неуспешно публикуване на IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Грешка при запазване на почистването на входяща поща: { $e }
err-config-load = Грешка при зареждане на конфигурацията: { $e }
err-lang-persist = Грешка при запазване на езика: { $e }
err-history-parse = Грешка при разбор на историята: { $e }
err-history-load = Грешка при зареждане на историята: { $e }
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
profiles-empty = (никой)
profiles-deleted = профил { $name } изтрит
profiles-not-found = профилът не е намерен: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
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

help-topic-url =   .help.url                    отваряне на zion чрез URL връзка
help-header-url = ── URL параметри ────────────────────────────────────────────────────────────────
help-url-intro =   Сподели връзка, която отваря zion с предварително попълнен получател:
help-url-msg =   ?msg=<did>                   предварително попълва: @<did> (обикновено съобщение)
help-url-say =   ?say=<did>                   предварително попълва: @<did>:say (глагол say)
help-url-emote =   ?emote=<did>                 предварително попълва: @<did>:emote (глагол emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Полето е предварително попълнено, но не изпратено — натисни Enter за изпращане.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                публикуване на самоличността ти в мрежата
help-header-publish = ── публикуване на самоличност ───────────────────────────────────────────────
help-publish-intro = Публикуването прави самоличността ти намираема в мрежата. Другите могат да потърсят твоя DID, за да те достигнат.
help-publish-ma = За публикуване е необходим инсталиран ma (локален runtime). Той свързва ego с IPFS/IPNS от твое име.
help-publish-steps = Стъпки: изпълни '.ma [port]' за намиране на локалния ma, след което '/my/identity!publish @ma'.
help-publish-without = Без публикуване другите не могат да те достигнат — дори да знаят твоя DID, не могат да разрешат твоя endpoint.
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
scheme-cid-fetch-error = Грешка при извличане на CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Невалиден CID: { $value }
label-runtime = ма
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Предупреждение: Вашият частен IPNS ключ ще бъде изпратен към тази среда за изпълнение за публикуване на самоличност. Използвайте само среда за изпълнение, на която напълно се доверявате.
