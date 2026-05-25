# zion — Български
lang-name = Български

# ── Страница за вход ──────────────────────────────────────────────────────
tab-login = вход
tab-new-identity = нова идентичност
tab-import = импортиране
label-passphrase = парола-фраза
label-username = потребителско име
label-confirm-passphrase = потвърдете паролата-фраза
btn-login = вход
btn-export = експортиране
btn-generate = генериране
passphrase-warning = Изгубена парола-фраза = изгубена идентичност. Възстановяването не е възможно.
import-help = Изберете експортиран .zion.json файл. Пакетът остава криптиран.
status-unlocking = отключване...
status-generating = генериране на идентичност...
status-reading-file = четене на файл...
status-imported = '{ $name }' импортирано — преминете към раздел Вход
error-wrong-passphrase = грешна парола-фраза: { $e }
error-identity-not-found = идентичността '{ $name }' не е намерена
error-username-required = потребителското име е задължително
error-passphrase-required = паролата-фраза е задължителна
error-passphrases-no-match = паролите-фрази не съвпадат

# ── Системни съобщения на терминала ──────────────────────────────────────
msg-logged-in = zion v{ $version } — влязохте като { $username }
msg-type-help = Въведете .help за списък с команди.
msg-connecting = свързване с iroh...
msg-iroh-ready = iroh крайната точка е готова
msg-iroh-failed = iroh: { $e }
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

# ── Глаголи — среда за изпълнение ────────────────────────────────────────
discover-fetch-failed = откриването е неуспешно на { $url }: { $e }
discover-json-error = откриването е неуспешно: невалиден JSON от { $url }: { $e }
discover-missing-did = откриването е неуспешно: status.json липсва задължителното поле `did`
discover-invalid-did = откриването е неуспешно: очаква се `did` да започва с did:ma:, получено `{ $did }`
discover-no-endpoint = предупреждение при откриване: `endpoint_id` липсва в status.json; запазен само DID
discover-success = ma е открито на { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   псевдоним @ma създаден — публикувайте с: .my.identity:publish @ma
claim-success = Средата за изпълнение е заявена за { $did }
claim-conflict = Средата за изпълнение вече е заявена от друга идентичност
claim-http-failed = заявяването е неуспешно: HTTP { $status }
claim-error = заявяването е неуспешно: { $e }
claim-no-session = не сте влезли; влезте първо, за да заявите средата за изпълнение
runtime-no-verb = няма глагол `{ $verb }` за { $path }

# ── Глаголи — контрол на достъп ──────────────────────────────────────────
acl-reset = .my.acl е нулиран (напълно отворен)
acl-persist-error = грешка при запазване: { $e }
acl-no-verb = няма глагол `{ $verb }` за .my.acl

# ── Глаголи — идентичност ─────────────────────────────────────────────────
publish-usage = употреба: .my.identity:publish <did-или-псевдоним>

# ── Глаголи — документи ───────────────────────────────────────────────────
doc-content-empty = { $path }.content е празно
doc-save-first = { $path }.content е празно — първо запазете
doc-missing-name = липсва името на документа
doc-publish-usage = употреба: .my.doc.<име>:publish <издател>
doc-publish-ipld-usage = употреба: .my.doc.<име>:publish-ipld <издател>
doc-publish-failed = публикуване { $path }: { $e }
doc-publish-ipld-failed = публикуване IPLD { $path }: { $e }
doc-store-sent = заявка за съхранение изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-ipld-store-sent = заявка за съхранение IPLD изпратена ({ $id }) → { $publisher }; CID ще пристигне в отговора RPC
doc-fetch-done = { $cid } е извлечен → { $path }.content (не е изпълнено)
doc-fetch-failed = извличане { $cid }: { $e }
doc-fetch-usage = употреба: .my.doc.<име>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid не е зададен
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
help-cmd-logout =   .logout                      изход

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
help-config-verb =   .path:verb [args]            изпълнява локален глагол

help-my =   .my                          показва цялата лична конфигурация
help-aliases =   .my.aliases                  изброява псевдоними
help-aliases-set =   .my.aliases.<name>: <did>    добавя/актуализира псевдоним (чисто DID, без #фрагмент)
help-aliases-del =   .my.aliases.<name>:          премахва псевдоним
help-runtime-discover =   .my.ma:discover          открива локална среда за изпълнение и създава псевдоним @ma
help-runtime-claim =   .my.ma:claim             заявява средата за изпълнение с вашия DID
help-identity =   .my.identity                 показва конфигурацията на идентичността
help-identity-did =   .my.identity.did             показва собствения DID (само за четене)
help-identity-publish =   .my.identity:publish @pub    публикува собствения DID чрез услугата на издателя
help-config-path =   .config                      показва всички записи .config.*

help-inbox =   .my.inbox                    изброява входящата поща (изглед на поддърво)
help-inbox-n =   .my.inbox.N                  показва полетата на запис N
help-inbox-from =   .my.inbox.N.from             DID на подателя за запис N
help-inbox-reply =   .my.inbox.N:reply [body]     изпраща отговор (отваря редактор без тяло)
help-inbox-open =   .my.inbox.N:open             отваря съдържанието в редактор само за четене
help-inbox-del =   .my.inbox.N:                 изтрива запис N
help-inbox-delall =   .my.inbox:                   изтрива всички записи от входящата поща
help-inbox-flush =   .my.inbox:flush              отпечатва всички записи в терминала
help-inbox-traverse =   .my.inbox.N.sender.<поле>   обхожда DID документа на подателя мързеливо

help-doc-edit =   .my.doc.<име>:edit           отваря редактор със запазено съдържание
help-doc-edit-cid =   .my.doc.<ime>:edit <cid>     извлича CID, отваря за преглед
help-doc-eval =   .my.doc.<ime>:eval           изпълнява запазеното съдържание ред по ред
help-doc-publish =   .my.doc.<ime>:publish @pub   запазва като суров блоб (всички типове)
help-doc-publish-ipld =   .my.doc.<ime>:publish-ipld @pub  запазва YAML като структуриран DAG-CBOR IPLD възел
help-doc-fetch =   .my.doc.<ime>:fetch <cid>    импортира съдържание CID (без изпълнение)
help-doc-cid =   .my.doc.<ime>:cid            показва запазения CID
help-doc-del =   .my.doc.<ime>:              изтрива документ

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
err-edit-decode-failed = грешка при декодиране: { $e }
err-edit-fetch-failed = грешка при зареждане: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = няма активна сесия — профилът не може да бъде изтрит
profile-delete-error = изтриването на профила не бе успешно: { $e }
profile-no-verb = .my.profile: непозната команда: { $verb }
