# zion — فارسی
lang-name = فارسی
label-nick = نام مستعار
new-identity-nick-help = برای 間-space یک نام مستعار انتخاب کنید. این فقط یک لقب است و هر زمان بخواهید می‌توانید آن را تغییر دهید.
error-nick-required = نام مستعار لازم است
error-nick-invalid = نام مستعار نباید فاصله یا @ داشته باشد

# ── صفحه ورود ─────────────────────────────────────────────────────────────
tab-login = ورود
tab-new-identity = هویت تازه
tab-import-profile = وارد کردن پروفایل
label-passphrase = عبارت عبور
label-username = نام کاربری
label-confirm-passphrase = تأیید عبارت عبور
label-did = DID
label-runtime = 間
label-runtime-placeholder = did:ma:...
label-profile-cid = CID پروفایل
label-or-file = یا فایل
btn-login = ورود
btn-export = خروجی گرفتن
btn-generate = ساختن
btn-new-endpoint = نقطه پایانی تازه
btn-import-profile = وارد کردن پروفایل
btn-show-qr = نمایش QR
btn-scan-qr = اسکن QR
qr-scan-hint = دوربین را به سمت کد QR پروفایل zion بگیرید.
qr-error-camera = دوربین در دسترس نیست: { $e }
qr-error-too-large = پروفایل برای کد QR بیش از حد بزرگ است
passphrase-warning = گم شدن عبارت عبور یعنی گم شدن هویت. راه بازیابی وجود ندارد.
warning-remote-runtime = هشدار: کلید خصوصی IPNS شما برای انتشار هویت به این runtime فرستاده می‌شود. فقط از runtimeی استفاده کنید که کاملاً به آن اعتماد دارید.
import-profile-help = یک پروفایل .zion.json را با CID یا فایل وارد کنید. برای وارد کردن تازه، عبارت عبور لازم نیست. عبارت عبور فقط برای بازنویسی هویت موجود لازم است.
import-profile-detected-user = این پروفایل متعلق است به: { $name }
status-unlocking = در حال باز کردن قفل...
status-generating = در حال ساخت هویت...
status-reading-file = در حال خواندن فایل...
status-fetching-profile = در حال واکشی پروفایل از IPFS...
status-importing-profile = در حال وارد کردن پروفایل...
status-imported = '{ $name }' وارد شد — به زبانه ورود بروید
profile-import-done = پروفایل برای '{ $name }' وارد شد — { $n } کلید بارگذاری شد
error-wrong-passphrase = عبارت عبور نادرست است: { $e }
error-identity-not-found = هویت '{ $name }' پیدا نشد
error-username-required = نام کاربری لازم است
error-passphrase-required = عبارت عبور لازم است
error-passphrases-no-match = عبارت‌های عبور یکسان نیستند
error-profile-source-required = یک CID بدهید یا فایلی بارگذاری کنید
error-did-required = DID خود را وارد کنید
error-profile-fetch = واکشی پروفایل ممکن نشد: { $e }
error-profile-no-username = پروفایل نام کاربری ندارد
error-profile-no-identity = هویت '{ $name }' پیدا نشد — ابتدا هویت را وارد کنید

# ── پیام‌های سامانه ترمینال ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — با نام { $username } وارد شده‌اید
msg-type-help = برای دیدن فهرست فرمان‌ها .help را تایپ کنید.
msg-getting-started = امتحان کنید: say Hello world، look، .help، یا help.
msg-connecting = در حال اتصال به iroh...
msg-iroh-ready = نقطه پایانی iroh آماده است
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID از راه 間 محلی منتشر شد ({ $url })
msg-identity-publication-propagating = انتشار هویت هنوز در حال پخش شدن است؛ ورود به تعویق افتاد: { $e }
msg-identity-first-publish = هویت برای نخستین بار منتشر می‌شود. این کار ممکن است تا { $seconds } ثانیه طول بکشد.
msg-ma-connecting-matrix = در حال وصل کردن شما به 間trix
msg-ma-checking-url = در حال بررسی 間 محلی در { $url }
msg-local-ma-unreachable = 間 محلی در { $url } پس از { $seconds } ثانیه در دسترس نبود؛ 間 را اجرا کنید یا .ma.ctx.url را تغییر دهید
msg-runtime-pinging = در حال ping کردن runtime { $did }
msg-runtime-ping-timeout = runtime { $did } در { $seconds } ثانیه پاسخ نداد؛ ورود خودکار رد شد
msg-startup-enter-skipped = به runtime ذخیره‌شده وارد نمی‌شویم چون { $target } پاسخ نداد
msg-local-ma-claimed = 間 محلی مطالبه شد
msg-local-ma-already-claimed = 間 محلی پیش‌تر مطالبه شده است
msg-local-ma-claim-failed = مطالبه 間 محلی ناموفق بود
msg-identity-not-published = هویت در شبکه پیدا نشد — اگر 間 را محلی نصب کرده‌اید، '.ma: claim [port]' و سپس '.my.identity!publish @ma' را اجرا کنید. برای جزئیات '.help/publish' را تایپ کنید.
msg-blocked = ⊗ مسدود شد [{ $cap }]: { $from }
msg-focus-cleared = تمرکز پاک شد
msg-left = left
msg-focusing = تمرکز روی { $did } با اعلان { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } حذف شد ({ $count } ورودی)
msg-read-only = { $path } فقط خواندنی است
msg-subtree-set = { $path } یک زیردرخت است؛ از تنظیم آن خودداری شد
msg-ancestor-leaf = یکی از نیاکان { $path } برگ است؛ از سایه انداختن خودداری شد
err-unknown-command = فرمان ناشناخته: { $path }
err-read-only-path = { $path } فقط خواندنی است
msg-key-not-found = کلید پیدا نشد: { $path }
msg-link-not-connected = خطای واکشی پیوند: وصل نیست
msg-link-fetch-error = خطای واکشی پیوند: { $e }
msg-link-key-not-found = کلید `{ $key }` در سند پیوندشده پیدا نشد

# ── اعتبارسنجی نام مستعار ────────────────────────────────────────────────
err-alias-name-empty = نام مستعار نمی‌تواند خالی باشد
err-alias-has-dot = نام‌های مستعار نمی‌توانند '.' داشته باشند
err-alias-has-fragment = نام‌های مستعار نمی‌توانند '#' داشته باشند
err-alias-value-fragment = مقدار نام مستعار حداکثر می‌تواند یک fragment غیرخالی DID-URL داشته باشد
err-alias-value-path = مقدار نام مستعار باید یک DID با قالب did:ma:<ipns> یا DID-URL باشد (بدون مسیر)
err-alias-not-did = مقدار نام مستعار باید با did:ma: آغاز شود
err-unknown-alias = نام مستعار ناشناخته: @{ $name }
err-bare-did = DID خام did:ma:<ipns> انتظار می‌رفت (بدون fragment یا مسیر)، اما { $did } دریافت شد
err-lang-not-found = زبان پیدا نشد: { $lang }

# ── ویرایشگر ──────────────────────────────────────────────────────────────
btn-save = ذخیره
btn-eval = اجرا
btn-cancel = لغو
msg-jobs-cancelled = کارها لغو شدند
btn-close = بستن
btn-reply = پاسخ
btn-publish = انتشار
btn-publish-ipld = انتشار IPLD
msg-reply-sent = پاسخ فرستاده شد
msg-reply-failed = پاسخ ناموفق بود: { $e }
msg-entity-publish-sent = موجودیت { $name }: درخواست انتشار فرستاده شد
msg-entity-publish-failed = انتشار موجودیت ناموفق بود: { $e }
msg-kind-publish-failed = انتشار kind ناموفق بود: { $e }
msg-field-publish-sent = موجودیت { $name }.{ $field }: درخواست انتشار فرستاده شد
msg-field-publish-failed = انتشار فیلد ناموفق بود: { $e }
msg-acl-publish-sent = ACL runtime: درخواست انتشار فرستاده شد
msg-acl-publish-failed = انتشار ACL runtime ناموفق بود: { $e }
msg-crud-edit-publish-sent = { $path }: درخواست انتشار فرستاده شد
msg-yaml-error = خطای YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } واکشی شد — پیش از اجرا بازبینی کنید
msg-fetch-failed = واکشی { $cid }: { $e }

# ── فعل‌ها — صندوق ورودی ─────────────────────────────────────────────────
inbox-empty = صندوق ورودی خالی است
inbox-entry-not-found = ورودی صندوق ورودی { $n } پیدا نشد
inbox-no-message-id = ورودی صندوق ورودی { $n } message_id ندارد
inbox-no-verb = فعل `{ $verb }` برای ورودی صندوق ورودی { $n } وجود ندارد
inbox-filter-no-arg = فیلتر به یک DID یا نام مستعار به عنوان آرگومان نیاز دارد
inbox-filter-empty = پیامی از { $did } نیست

# ── فعل‌ها — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = کشف در { $url } ناموفق بود: { $e }
discover-json-error = کشف ناموفق بود: JSON نامعتبر از { $url }: { $e }
discover-missing-did = کشف ناموفق بود: فیلد ضروری `did` در status.json نیست
discover-invalid-did = کشف ناموفق بود: انتظار می‌رفت `did` با did:ma: آغاز شود، اما `{ $did }` دریافت شد
discover-no-endpoint = هشدار کشف: `endpoint_id` در status.json نیست؛ فقط DID ذخیره شد
discover-hint-endpoint-not-found = راهنما: endpoint پیدا نشد. بررسی کنید که 間 اجرا شده و /status.json را روی پورت 5003 ارائه می‌کند.
discover-hint-server-error = راهنما: runtime با خطای سرور پاسخ داد. گزارش‌های 間 را بررسی کنید و دوباره بکوشید.
discover-hint-network = راهنما: مشکل شبکه یا اتصال. 間 را اجرا کنید، دسترسی localhost:5003 را بررسی کنید، و دسترسی HTTP محلی را در مرورگر مجاز کنید.
discover-hint-generic = راهنما: بررسی کنید 間 و IPFS Desktop در حال اجرا هستند، سپس `.ma` را دوباره اجرا کنید.
discover-success = 間 در { $url } کشف شد
discover-did-line = DID: { $did }
discover-alias-hint =   نام مستعار @ma ساخته شد — برای انتشار هویت خود '.my.identity!publish @ma' را اجرا کنید.
claim-success = runtime برای { $did } مطالبه شد
claim-conflict = runtime پیش‌تر توسط هویتی دیگر مطالبه شده است
claim-already-owned = runtime پیش‌تر توسط همین هویت مطالبه شده است
claim-http-failed = مطالبه ناموفق بود: HTTP { $status }
claim-error = مطالبه ناموفق بود: { $e }
claim-no-session = وارد نشده‌اید؛ برای مطالبه runtime ابتدا وارد شوید
runtime-no-verb = فعل `{ $verb }` برای { $path } وجود ندارد

# ── فعل‌ها — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl بازنشانی شد (کاملاً باز)
err-persist = خطای ذخیره‌سازی: { $e }
acl-no-verb = فعل `{ $verb }` برای .my.acl وجود ندارد

# ── فعل‌ها — زبان ────────────────────────────────────────────────────────
lang-list-header = زبان‌های موجود (با .my.i18n: <code> تنظیم کنید):

# ── فعل‌ها — هویت ────────────────────────────────────────────────────────
publish-usage = کاربرد: .my.identity!publish <did-or-alias>
identity-exported = بسته با نام { $filename } دریافت شد
identity-export-failed = خروجی گرفتن ناموفق بود: { $e }

# ── فعل‌ها — سندها ───────────────────────────────────────────────────────
doc-content-empty = { $path } خالی است
doc-save-first = { $path } خالی است — ابتدا ذخیره کنید
doc-missing-name = نام سند نیست
doc-publish-usage = کاربرد: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = کاربرد: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = انتشار { $path }: { $e }
doc-publish-ipld-failed = انتشار publish-ipld برای { $path } ناموفق بود: { $e }
doc-publish-error-detail = انتشار ناموفق بود [{ $code }]: { $err }
doc-publish-error-hint = راهنما: { $hint }
doc-publish-hint-session = دوباره وارد شوید تا ego بتواند به کلیدهای هویت شما دسترسی داشته باشد
doc-publish-hint-target = از DID ناشر معتبر یا نام مستعاری استفاده کنید که به did:ma:<ipns> خام حل می‌شود
doc-publish-hint-network = بررسی کنید runtime 間 و IPFS در دسترس هستند، سپس دوباره بکوشید
doc-publish-hint-resolve = بررسی کنید سند DID ناشر منتشر شده و نقطه پایانی قابل دسترسی دارد
doc-publish-hint-acl = از گرداننده ناشر بخواهید DID شما را در ACL مجاز کند
doc-publish-hint-runtime = runtime یا افزونه درخواست را رد کرد؛ دلیل را بررسی کنید و پس از اصلاح موجودیت/runtime دوباره بکوشید
doc-publish-hint-ipfs = سلامت Kubo/IPFS محلی و وضعیت runtime ناشر را بررسی کنید
doc-publish-hint-unknown = برای علت دقیق‌تر گزارش‌های runtime را بررسی کنید و دوباره بکوشید
doc-store-sent = درخواست ذخیره‌سازی فرستاده شد ({ $id }) → { $publisher }؛ CID از راه پاسخ RPC خواهد رسید
doc-ipld-store-sent = درخواست ذخیره‌سازی IPLD فرستاده شد ({ $id }) → { $publisher }؛ CID از راه پاسخ RPC خواهد رسید
doc-fetch-done = { $cid } واکشی شد → { $path } (اجرا نشد)
doc-fetch-failed = واکشی { $cid }: { $e }
doc-fetch-usage = کاربرد: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid تنظیم نشده است
doc-no-verb = فعل `{ $verb }` برای { $path } وجود ندارد
path-no-verb = فعل `{ $verb }` برای { $path } وجود ندارد

# ── متن راهنما — سرآیندها ────────────────────────────────────────────────
help-header-zion = ── فرمان‌های zion ─────────────────────────────────────────────────────────
help-header-messaging = ── پیام‌رسانی ───────────────────────────────────────────────────────────
help-header-config = ── دستور زبان پیکربندی محلی ───────────────────────────────────────────────
help-header-common = ── مسیرهای رایج ───────────────────────────────────────────────────────────
help-header-inbox = ── صندوق ورودی ────────────────────────────────────────────────────────────
help-header-documents = ── اسناد (.my.doc.*) ───────────────────────────────────────────────────
help-header-i18n = ── زبان ───────────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ─────────────────────────────────────────────────────────────────
help-header-ma-entry = ── ورود به 間-space ────────────────────────────────────────────────────
help-header-zscheme-topic = ── zscheme ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── متن راهنما — فرمان‌های zion ─────────────────────────────────────────
help-cmd-help =   .help                        این متن
help-cmd-clear =   .clear                       پاک کردن ترمینال
help-cmd-history =   .history [n]                 تاریخچه فرمان‌ها (تکرارهای پیاپی ادغام می‌شوند)؛ n اختیاری فقط n خط آخر را نشان می‌دهد
help-cmd-panic =   .panic                       آخرین چاره — اگر به دردسر افتادید استفاده کنید
help-cmd-logout =   .logout                      خروج
help-cmd-batch =   .batch                       اجرای سند scratch (موازی، بدون انتظار)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         اجرای فرمان‌ها به ترتیب، هر خط یکی

# ── متن راهنما — فهرست موضوع‌ها ─────────────────────────────────────────
help-header-topics = ── موضوع‌ها — برای جزئیات .help/<topic> را تایپ کنید ─────────────────────
help-topic-msg =   .help/msg                    پیام‌رسانی — @actor، فرستادن، RPC
help-topic-ma =   .help/ma                     間-space، انتشار، و ورود
help-topic-path =   .help/path                   دستور زبان dot-path محلی
help-topic-my =   .help/my                     پیکربندی شخصی — .my.*، نام‌های مستعار، هویت
help-topic-inbox =   .help/inbox                  صندوق ورودی — .my.inbox.*
help-topic-doc =   .help/doc                    فعل‌های محتوا — !edit، !eval، !publish، !fetch، !cid
help-topic-actor =   .help/actor                  actor دوردست — CRUD، موجودیت‌ها، عملیات CID
help-topic-zscheme =   .help/zscheme               عبارت‌های Scheme درون‌خطی و سندها
help-topic-url =   .help/url                    باز کردن zion با پیوند URL
help-topic-i18n =   .help/i18n                   ترجیح زبان برای هویت شما
help-unknown-topic =   .help/{ $topic }: موضوع ناشناخته — برای فهرست .help را امتحان کنید

# ── متن راهنما — پیام‌رسانی ─────────────────────────────────────────────
help-msg-echo =   @alias                       DID/DID-URL حل‌شده را نشان بده (پیامی فرستاده نمی‌شود)
help-msg-send =   @alias!msg body / @alias:verb args           پیام / RPC به actor بفرست
help-msg-fragment =   @alias#fragment:verb body  به نام مستعار با fragment صریح DID بفرست
help-msg-escape =   \@name                       متن لفظی @name (بدون جست‌وجوی نام مستعار)


# ── متن راهنما — ma-space ────────────────────────────────────────────────
help-ma-intro = اتاق 間 فضای میان هویت‌های 間 است. ma به این هویت‌ها کمک می‌کند یکدیگر را پیدا کنند و ارتباط بگیرند؛ پس از انتشار هویت خود می‌توانید شرکت کنید.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   به runtime محلی ma وصل شو، /status.json را بخوان، و .ma.ctx.* را ذخیره کن
help-ma-publish =   .my.identity!publish @ma     سند DID خود را منتشر کن تا دیگران بتوانند کلیدها و نقطه پایانی شما را حل کنند
help-ma-security = روشن‌ترین مرز اعتماد، runtime 間 خودتان همراه با IPFS Desktop/Kubo خودتان است. ناشر دوردست می‌تواند مفید باشد، اما در آن حالت به سرویس کس دیگری تکیه می‌کنید.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             چگونگی ورود به اتاق 間

# ── متن راهنما — ورود به ma-space ───────────────────────────────────────
help-ma-entry-intro = پس از شناخته شدن هویت شما، .enter @ma اجازه می‌دهد وارد 間 شوید. جهانی پیدا کنید، واردش شوید، و از آن‌جا مشارکت کنید.
help-ma-entry-steps = IPFS Desktop و ma را اجرا کنید، سپس .ma را اجرا کنید. با .my.identity!publish @ma منتشر کنید، جهانی پیدا کنید، و با .enter @ma وارد شوید.
help-ma-entry-command =   .enter @ma                  ورود به 間 از راه runtime @ma
help-ma-entry-toggle =   .enter                       تمرکز اتاق را روشن یا خاموش کن؛ هویت شما فعال می‌ماند
help-ma-entry-url =   ?enter=<runtime>             پس از ورود از URL هم‌رسانی‌شده وارد شو

# ── متن راهنما — دستور زبان پیکربندی ────────────────────────────────────
help-config-get =   .path                        گرفتن مقدار برگ یا فهرست زیردرخت
help-config-filter =   .path [نام]                  فهرست نام کلیدهای فرزند دارای نام
help-config-full =   .path. [نام]                 فهرست مقدارهای کامل زیردرخت دارای نام
help-config-set =   .path: value                 تنظیم برگ
help-config-delete =   .path:                       حذف برگ یا زیردرخت
help-config-verb =   .path!verb [args]            فراخوانی فعل محلی

# ── متن راهنما — مسیرهای رایج ───────────────────────────────────────────
help-my =   .my                          نمایش همه پیکربندی شخصی
help-aliases =   .my.aliases                  فهرست نام‌های مستعار
help-aliases-set =   .my.aliases.<name>: <did-url> افزودن/به‌روزرسانی نام مستعار (DID یا DID-URL)
help-aliases-del =   .my.aliases.<name>:          حذف نام مستعار
help-runtime-discover =   .ma: claim [port]                   اتصال/مطالبه runtime محلی → .ma.ctx.* (پورت پیش‌فرض 5003)
help-runtime-claim =   .ma: claim [port]                   (همان مورد بالا — مطالبه و کشف یکی شده‌اند)
help-identity =   .my.identity                 نمایش پیکربندی هویت
help-identity-did =   .my.identity.did             نمایش DID خودتان (فقط خواندنی)
help-identity-publish =   .my.identity!publish @pub    انتشار DID خودتان از راه سرویس ناشر
help-identity-export =   .my.identity!export          دریافت بسته هویت خودتان
help-config-path =   .ma.ctx                      زمینه runtime محلی ma

# ── متن راهنما — صندوق ورودی ────────────────────────────────────────────
help-inbox =   .my.inbox                    فهرست صندوق ورودی (نمای زیردرخت)
help-inbox-n =   .my.inbox.N                  نمایش فیلدهای ورودی N
help-inbox-from =   .my.inbox.N.from             DID فرستنده ورودی N
help-inbox-reply =   .my.inbox.N!reply [body]     فرستادن پاسخ (اگر متن نباشد ویرایشگر باز می‌شود)
help-inbox-open =   .my.inbox.N!open             باز کردن محتوای ورودی فقط‌خواندنی در ویرایشگر
help-inbox-del =   .my.inbox.N:                 حذف ورودی N
help-inbox-delall =   .my.inbox:                   حذف همه ورودی‌های صندوق ورودی
help-inbox-flush =   .my.inbox!flush              چاپ همه ورودی‌ها در ترمینال
help-inbox-filter =   .my.inbox!filter @who        نمایش فقط ورودی‌های @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   پیمایش تنبل سند DID فرستنده

# ── متن راهنما — سندها ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           باز کردن ویرایشگر با محتوای ذخیره‌شده
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>  واکشی CID و باز کردن فقط برای بازبینی
help-doc-eval =   .my.doc.<name>!eval           اجرای محتوای ذخیره‌شده خط به خط
help-doc-publish =   .my.doc.<name>!publish @pub   ذخیره به صورت blob خام (هر نوعی)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  ذخیره YAML به عنوان گره ساختاریافته DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>  وارد کردن محتوای CID (بدون اجرا)
help-doc-cid =   .my.doc.<name>!cid            نمایش CID ذخیره‌شده
help-doc-del =   .my.doc.<name>:              حذف سند

# ── متن راهنما — زبان ───────────────────────────────────────────────────
help-i18n-intro =   .my.i18n ترجیح زبان پیوندخورده به هویت شما را نگه می‌دارد.
help-i18n-set =   .my.i18n: <code>             زبانی را که zion برای این هویت به کار می‌برد انتخاب کن
help-i18n-list =   .my.i18n!list               فهرست کدهای زبان موجود

# ── متن راهنما — zscheme ────────────────────────────────────────────────
help-zscheme-intro = zscheme عبارت‌های Scheme جاسازی‌شده در فرمان‌های zion را ارزیابی می‌کند و نتیجه را پیش از ارسال در خط جای‌گذاری می‌کند.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    نمونه درون‌خطی؛ "say 7 + 5 = 12" را می‌فرستد
help-zscheme-define =   (define x 12)             تعریف‌ها برای نشست ورود فعلی باقی می‌مانند
help-zscheme-doc = سندها: https://github.com/bahner/rust-ma-zscheme

# ── متن راهنما — پارامترهای URL ─────────────────────────────────────────
help-header-url = ── پارامترهای URL ─────────────────────────────────────────────────────────
help-url-intro =   پیوندی را هم‌رسانی کنید تا zion با گیرنده از پیش پرشده باز شود:
help-url-msg =   ?msg=<did>                   پر کردن از پیش: @<did>!msg (پیام ساده)
help-url-say =   ?say=<did>                   پر کردن از پیش: @<did>!say (فعل say)
help-url-emote =   ?emote=<did>                 پر کردن از پیش: @<did>!emote (فعل emote)
help-url-ma =   ?ma=<did-or-url>              پر کردن DID runtime / URL HTTP
help-url-enter =   ?enter=<runtime>             ورود به جهان runtime پس از ورود
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ورودی از پیش پر می‌شود اما فرستاده نمی‌شود — برای ارسال Enter را بزنید.

# ── پیام‌های خطا ─────────────────────────────────────────────────────────
msg-send-failed = ارسال ناموفق بود: { $e }
msg-not-logged-in = وارد نشده‌اید
msg-new-message = ← [{ $from }] پیام تازه — { $count } در صندوق ورودی
msg-chat = { $sender } می‌گوید { $body }

# ── رویدادهای اتاق ──────────────────────────────────────────────────────
room-say   = { $name } می‌گوید { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } وارد اتاق می‌شود.
room-leave = * { $name } اتاق را ترک می‌کند.
room-drop  = * { $name } { $thing } را می‌اندازد.
room-take  = * { $name } { $thing } را برمی‌دارد.

# ── نمایش پاسخ RPC ──────────────────────────────────────────────────────
rpc-error = خطا
rpc-error-detail = خطا: { $detail }

# ── خطاهای ویرایش ───────────────────────────────────────────────────────
err-edit-decode-failed = رمزگشایی ویرایش ناموفق بود: { $e }
err-edit-fetch-failed = واکشی ویرایش ناموفق بود: { $e }

# ── خطاهای codec CBOR / YAML ────────────────────────────────────────────
yaml-parse-error = خطای تجزیه YAML: { $e }
yaml-not-mapping = YAML باید یک نگاشت باشد (جفت‌های key: value)؛ متن ساده و scalar خام را نمی‌توان به صورت DAG-CBOR ذخیره کرد
dagcbor-encode-error = خطای رمزگذاری DAG-CBOR: { $e }
cbor-decode-error = خطای رمزگشایی CBOR: { $e }
cbor-json-error = خطای تبدیل CBOR به JSON: { $e }
yaml-serialise-error = خطای serialise کردن YAML: { $e }
edit-reply-invalid = پاسخ ویرایش نامعتبر است
doc-publish-ipld-error = publish-ipld ممکن نیست: { $e }

# ── خطاهای داخلی / نشست ─────────────────────────────────────────────────
err-inbox-prune-persist = ذخیره‌سازی پاک‌سازی صندوق ورودی: { $e }
err-config-load = خطای بارگذاری پیکربندی: { $e }
err-lang-persist = ذخیره‌سازی زبان: { $e }
err-history-parse = خطای تجزیه تاریخچه: { $e }
err-history-load = خطای بارگذاری تاریخچه: { $e }
err-history-count-invalid = تعداد تاریخچه باید یک عدد صحیح مثبت باشد
err-ipfs-reply-decode = رمزگشایی پاسخ IPFS ناموفق بود: { $e }
err-edit-cbor = خطای CBOR در ویرایش: { $e }
err-popup-blocked = پنجره popup توسط مرورگر مسدود شد
status-publishing = در حال انتشار

# ── مدیریت پروفایل ──────────────────────────────────────────────────────
profile-delete-no-session = نشست فعالی وجود ندارد — نمی‌توان پروفایل را حذف کرد
profile-delete-needs-name = نام پروفایل را مشخص کنید: .profiles.<name>:
profile-delete-error = حذف پروفایل ناموفق بود: { $e }
profiles-empty = (هیچ‌کدام)
profiles-deleted = پروفایل { $name } حذف شد
profiles-not-found = پروفایل پیدا نشد: { $name }
profile-wrong-user = نمی‌توان CID را برای پروفایل دیگری تنظیم کرد — فقط برای پروفایل خودتان
profile-wrong-user-name = نمی‌توان CID را برای '{ $name }' تنظیم کرد — فقط برای پروفایل خودتان
profile-no-ma = runtime 間 پیکربندی نشده است — ابتدا '.ma: claim [port]' را اجرا کنید
profile-no-cid = CID برای این پروفایل ذخیره نشده است — ابتدا '!publish' را اجرا کنید
profile-no-cid-in-doc = CID پروفایل در سند DID پیدا نشد — ابتدا '!publish' را اجرا کنید
profile-publish-sent = پروفایل رمزگذاری شد و به IPFS فرستاده شد؛ سند DID هنگام رسیدن CID به‌روزرسانی می‌شود
profile-publish-done = پروفایل منتشر شد — سند DID با CID مربوط به ma.agent به‌روزرسانی شد
profile-publish-failed = انتشار پروفایل ناموفق بود: { $e }
profile-fetch-done = پروفایل واکشی شد — { $n } کلید از IPFS بارگذاری شد
profile-fetch-failed = واکشی پروفایل ناموفق بود: { $e }
profile-fetch-did-resolve-failed = DID هنوز منتشر نشده است — ابتدا '.my.identity!publish @ma' را اجرا کنید، سپس پروفایل خود را با '!publish' منتشر کنید
profile-update-done = پروفایل به‌روزرسانی شد — { $n } کلید از CID ادغام شد
msg-identity-exists = هویت از قبل منتشر شده است — پروفایل به‌روز است
profile-import-exists = پروفایل '{ $name }' از قبل وجود دارد — ابتدا آن را حذف کنید
profile-import-wrong-user = فایل حاوی پروفایل '{ $found }' است، اما '{ $expected }' انتظار می‌رفت

# ── عملیات محتوای CID ───────────────────────────────────────────────────
cid-op-binary = محتوای دودویی (نمایش داده نمی‌شود)
cid-op-cat-truncated = … (خروجی در { $n } خط کوتاه شد)
cid-op-fetch-failed = واکشی محتوا ناموفق بود: { $e }
cid-op-unknown = عملیات محتوای ناشناخته: { $op }
cid-op-wc = { $lines } خط  { $words } واژه  { $chars } نویسه

# ── متن راهنما — actor / CRUD دوردست ────────────────────────────────────
help-header-actor = ── actorهای دوردست ───────────────────────────────────────────────────────
help-actor-echo =   @actor                       DID حل‌شده را بازتاب بده (پیامی فرستاده نمی‌شود)
help-actor-text =   @actor[#entity]!msg|!say|!emote body         پیام مستقیم/گفت‌وگو/emote بفرست
help-actor-ping =   @actor:ping                  ping زنده بودن
help-actor-entities =   @actor/entities              فهرست همه موجودیت‌ها
help-actor-entities-get =   @actor/entities/<n>          گرفتن گره موجودیت
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   تنظیم موجودیت با مرجع IPFS
help-actor-entities-edit =   @actor/entities/<n>!edit     ویرایش موجودیت در ویرایشگر
help-actor-entities-del =   @actor/entities/<n>:         حذف موجودیت
help-actor-config-get =   @actor/config/<key>          گرفتن مقدار پیکربندی runtime
help-actor-config-set =   @actor/config/<key>: val     تنظیم مقدار پیکربندی runtime
help-actor-acl =   @actor/acl                   گرفتن ACL
help-actor-acl-edit =   @actor/acl!edit              ویرایش ACL در ویرایشگر
help-actor-fragment =   @actor#entity                فرستادن به افزونه موجودیت
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC به فعل افزونه موجودیت
help-header-cid-ops = ── فراخوانی‌های Scheme actor ─────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  فراخوانی RPC موجودیت از Scheme و انتظار برای پاسخ
help-actor-head =   (@actor/path)                واکشی محتوای CRUD دوردست از Scheme
help-actor-tail =   (<bafy...>)                  include و ارزیابی Scheme از CID در IPFS
help-actor-wc =   (define x (@actor:verb arg))  نگه داشتن پاسخ‌های RPC در محیط نشست
help-actor-wc-l =   .z.scheme.ma!edit           ویرایش helperهای ذخیره‌شده Scheme برای این هویت
# ── متن راهنما — انتشار ─────────────────────────────────────────────────
help-topic-publish =   .help/publish                انتشار هویت شما در شبکه
help-header-publish = ── انتشار هویت شما ────────────────────────────────────────────────────
help-publish-intro = انتشار باعث می‌شود هویت شما در شبکه پیدا شود. دیگران می‌توانند DID شما را جست‌وجو کنند تا به شما برسند.
help-publish-ma = برای انتشار، باید 間 (runtime محلی) نصب باشد. 間 از طرف شما ego را به IPFS/IPNS وصل می‌کند.
help-publish-steps = گام‌ها: برای اتصال runtime محلی '.ma' (یا '.ma <port>') را اجرا کنید، سپس '.my.identity!publish @ma'.
help-publish-without = بدون انتشار، دیگران نمی‌توانند به شما برسند — حتی اگر DID شما را بدانند، نقطه پایانی شما را نمی‌توانند حل کنند.

# ── حالت batch ──────────────────────────────────────────────────────────
batch-collecting-started = در حال گردآوری batch — فرمان‌ها را تایپ کنید و با .batch پایان دهید
batch-already-collecting = از قبل در حال گردآوری batch هستیم — ابتدا با .batch پایان دهید
batch-empty = Batch خالی بود — چیزی برای اجرا نیست
batch-running = در حال اجرای batch…
batch-step-timeout = مهلت گام batch پایان یافت
batch-done = Batch در { $secs } ثانیه کامل شد — { $steps } گام
batch-done-error = Batch با خطا در { $secs } ثانیه پایان یافت — { $steps } گام
msg-timeout = مهلت پیام پایان یافت (در ۶۰ ثانیه پاسخی نیامد)
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        اجرای فرمان‌ها به صورت موازی


# ── پخش gossip ──────────────────────────────────────────────────────────

# ── Scheme ───────────────────────────────────────────────────────────────
scheme-cid-fetch-error = واکشی CID { $cid } ناموفق بود: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID معتبر نیست: { $value }

label-local-ipfs = دروازه IPFS محلی (نیازمند استثنا در مرورگر)

tab-config = تنظیمات
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
