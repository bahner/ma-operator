# zion — اردو
lang-name = اردو
label-nick = عرفی نام
new-identity-nick-help = 間-space کے لیے عرفی نام منتخب کریں۔ یہ صرف عرفی نام ہے اور آپ اسے کسی بھی وقت بدل سکتے ہیں۔
error-nick-required = عرفی نام درکار ہے
error-nick-invalid = عرفی نام میں خالی جگہ یا @ نہیں ہونا چاہیے

# ── لاگ ان صفحہ ───────────────────────────────────────────────────────────
tab-login = لاگ ان
tab-new-identity = نئی شناخت
tab-import-profile = پروفائل درآمد کریں
label-passphrase = پاس فریز
label-username = صارف نام
label-confirm-passphrase = پاس فریز کی تصدیق کریں
label-did = DID
label-profile-cid = پروفائل CID
label-or-file = یا فائل
btn-login = لاگ ان کریں
btn-export = برآمد
btn-generate = بنائیں
btn-new-endpoint = نئی اینڈپوائنٹ
btn-import-profile = پروفائل درآمد کریں
btn-show-qr = QR دکھائیں
btn-scan-qr = QR اسکین کریں
qr-scan-hint = کیمرے کو zion پروفائل کے QR کوڈ کی طرف کریں۔
qr-error-camera = کیمرہ دستیاب نہیں: { $e }
qr-error-too-large = پروفائل QR کوڈ کے لیے بہت بڑا ہے
passphrase-warning = پاس فریز کھونے کا مطلب شناخت کھونا ہے۔ کوئی بحالی ممکن نہیں۔
import-profile-help = CID یا فائل کے ذریعے پروفائل درآمد کریں۔ اشاعت کے وقت استعمال کی گئی وہی پاس فریز درکار ہے۔
import-profile-detected-user = پروفائل کا مالک: { $name }
status-unlocking = کھولا جا رہا ہے...
status-generating = شناخت بنائی جا رہی ہے...
status-reading-file = فائل پڑھی جا رہی ہے...
status-fetching-profile = IPFS سے پروفائل لایا جا رہا ہے...
status-imported = '{ $name }' درآمد کیا گیا — لاگ ان ٹیب پر جائیں
status-importing-profile = پروفائل درآمد ہو رہا ہے...
profile-import-done = '{ $name }' کے لیے پروفائل درآمد ہوا — { $n } کلیدیں لوڈ ہوئیں
error-wrong-passphrase = غلط پاس فریز: { $e }
error-identity-not-found = شناخت '{ $name }' نہیں ملی
error-username-required = صارف نام ضروری ہے
error-passphrase-required = پاس فریز ضروری ہے
error-passphrases-no-match = پاس فریز میل نہیں کھاتے
error-profile-source-required = CID فراہم کریں یا فائل اپلوڈ کریں
error-did-required = اپنا DID درج کریں
error-profile-fetch = پروفائل حاصل نہیں ہو سکا: { $e }
error-profile-no-username = پروفائل میں صارف نام نہیں ہے
error-profile-no-identity = شناخت '{ $name }' نہیں ملی — پہلے شناخت درآمد کریں

# ── ٹرمینل سسٹم پیغامات ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } کے طور پر لاگ ان
msg-type-help = کمانڈ کی فہرست کے لیے .help ٹائپ کریں۔
msg-getting-started = شروع کرنے کے لیے آزمائیں: say Hello world، look، .help، یا help۔
msg-connecting = iroh سے منسلک ہو رہا ہے...
msg-iroh-ready = iroh اینڈ پوائنٹ تیار ہے
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID مقامی 間 ({ $url }) کے ذریعے شائع ہوا
msg-identity-publication-propagating = شناخت کی اشاعت ابھی پھیل رہی ہے؛ entry مؤخر ہے: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = شناخت شائع کی جا رہی ہے۔ اس میں { $seconds } سیکنڈ تک لگ سکتے ہیں۔
msg-ma-connecting-matrix = آپ کو 間trix سے جوڑنے کی کوشش ہو رہی ہے
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = مقامی 間 کا دعویٰ ہو گیا
msg-local-ma-already-claimed = مقامی 間 پہلے ہی دعویٰ ہو چکا ہے
msg-local-ma-claim-failed = مقامی 間 کا دعویٰ ناکام ہوا
msg-identity-not-published = شناخت آن لائن نہیں ملی — اگر 間 مقامی طور پر نصب ہے، تو '.ma: claim [port]' چلائیں پھر '.my.identity!publish @ma'۔ تفصیلات کے لیے '.help/publish' ٹائپ کریں۔
msg-blocked = ⊗ بلاک کیا گیا [{ $cap }]: { $from }
msg-focus-cleared = فوکس صاف کیا گیا
msg-left = left
msg-focusing = { $did } کو { $prompt } کے طور پر فوکس کیا جا رہا ہے
msg-set = { $path }: { $value }
msg-deleted = { $path } حذف کیا گیا ({ $count } اندراجات)
msg-read-only = { $path } صرف پڑھنے کے قابل ہے
msg-subtree-set = { $path } ایک ذیلی درخت ہے؛ ترتیب سے انکار
msg-ancestor-leaf = { $path } کا ایک آبا و اجداد پتہ ہے؛ سایہ سے انکار
msg-key-not-found = کلید نہیں ملی: { $path }
msg-link-not-connected = لنک حاصل کرنے میں خرابی: منسلک نہیں
msg-link-fetch-error = لنک حاصل کرنے میں خرابی: { $e }
msg-link-key-not-found = منسلک دستاویز میں کلید `{ $key }` نہیں ملی

# ── عرفی نام کی تصدیق ────────────────────────────────────────────────────
err-alias-name-empty = عرفی نام خالی نہیں ہو سکتا
err-alias-has-dot = عرفی ناموں میں '.' نہیں ہو سکتا
err-alias-has-fragment = عرفی ناموں میں '#' نہیں ہو سکتا
err-alias-value-fragment = عرفی نام کی قدر میں زیادہ سے زیادہ ایک غیر خالی DID-URL فریگمنٹ ہو سکتا ہے
err-alias-value-path = عرفی نام کی قدر did:ma:<ipns> DID یا DID-URL ہونی چاہیے (کوئی path نہیں)
err-alias-not-did = عرفی نام کی قدر did:ma: سے شروع ہونی چاہیے
err-unknown-alias = نامعلوم عرفی نام: @{ $name }
err-bare-did = bare did:ma:<ipns> (بغیر فریگمنٹ یا راستے) متوقع تھا، ملا { $did }

# ── ایڈیٹر ────────────────────────────────────────────────────────────────
btn-save = محفوظ کریں
btn-eval = چلائیں
btn-cancel = منسوخ کریں
msg-jobs-cancelled = کام منسوخ ہو گئے
btn-close = بند کریں
btn-reply = جواب دیں
btn-publish = شائع کریں
btn-publish-ipld = شائع کریں IPLD
msg-reply-sent = جواب بھیجا گیا
msg-reply-failed = جواب ناکام: { $e }
msg-entity-publish-sent = ادارہ { $name }: اشاعت بھیجی گئی
msg-entity-publish-failed = ادارہ اشاعت ناکام: { $e }
msg-kind-publish-failed = قسم کی اشاعت ناکام: { $e }
msg-field-publish-sent = ادارہ { $name }.{ $field }: اشاعت بھیجی گئی
msg-field-publish-failed = فیلڈ اشاعت ناکام: { $e }
msg-acl-publish-sent = رن ٹائم ACL: اشاعت بھیجی گئی
msg-crud-edit-publish-sent = { $path }: اشاعت بھیجی گئی
msg-acl-publish-failed = رن ٹائم ACL اشاعت ناکام: { $e }
msg-yaml-error = YAML خرابی: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } حاصل کیا گیا — چلانے سے پہلے جائزہ لیں
msg-fetch-failed = حاصل کریں { $cid }: { $e }

# ── افعال — ان باکس ───────────────────────────────────────────────────────
inbox-empty = ان باکس خالی ہے
inbox-entry-not-found = ان باکس اندراج { $n } نہیں ملا
inbox-no-message-id = ان باکس اندراج { $n } میں message_id نہیں
inbox-no-verb = ان باکس اندراج { $n } کے لیے `{ $verb }` فعل نہیں
inbox-filter-no-arg = فلٹر کو DID یا عرف نام کی ضرورت ہے
inbox-filter-empty = { $did } سے کوئی پیغام نہیں

# ── افعال — رن ٹائم ───────────────────────────────────────────────────────
discover-fetch-failed = { $url } پر دریافت ناکام: { $e }
discover-json-error = دریافت ناکام: { $url } سے غلط JSON: { $e }
discover-missing-did = دریافت ناکام: status.json میں `did` فیلڈ غائب
discover-invalid-did = دریافت ناکام: `did` کو did:ma: سے شروع ہونا چاہیے تھا، ملا `{ $did }`
discover-no-endpoint = دریافت انتباہ: status.json میں `endpoint_id` غائب؛ صرف DID محفوظ
discover-hint-endpoint-not-found = اشارہ: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = اشارہ: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = اشارہ: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = اشارہ: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url } پر 間 دریافت ہوا
discover-did-line = DID: { $did }
discover-alias-hint =   عرف @ma بنایا گیا — اپنی شناخت شائع کرنے کے لیے '.my.identity!publish @ma' چلائیں۔
claim-success = { $did } کے لیے رن ٹائم کا دعوی کیا گیا
claim-conflict = رن ٹائم پہلے ہی کسی اور شناخت نے دعوی کیا ہے
claim-already-owned = Runtime پہلے ہی اس شناخت نے دعویٰ کیا ہے
claim-http-failed = دعوی ناکام: HTTP { $status }
claim-error = دعوی ناکام: { $e }
claim-no-session = لاگ ان نہیں؛ رن ٹائم کا دعوی کرنے کے لیے پہلے لاگ ان کریں
runtime-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں

# ── افعال — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl ری سیٹ کیا گیا (مکمل کھلا)
err-persist = محفوظ کرنے کی خرابی: { $e }
acl-no-verb = .my.acl کے لیے `{ $verb }` فعل نہیں

# ── افعال — شناخت ─────────────────────────────────────────────────────────
publish-usage = استعمال: .my.identity!publish <did-یا-عرفی-نام>
identity-exported = بنڈل { $filename } کے طور پر ڈاؤن لوڈ ہو گیا
identity-export-failed = برآمد ناکام: { $e }

# ── افعال — دستاویزات ────────────────────────────────────────────────────
doc-content-empty = { $path } خالی ہے
doc-save-first = { $path } خالی ہے — پہلے محفوظ کریں
doc-missing-name = دستاویز کا نام غائب
doc-publish-usage = استعمال: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = استعمال: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = اشاعت { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = اشاعت ناکام [{ $code }]: { $err }
doc-publish-error-hint = اشارہ: { $hint }
doc-publish-hint-session = دوبارہ لاگ ان کریں تاکہ انا آپ کی شناختی چابیاں تک رسائی حاصل کر سکے۔
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = تصدیق کریں کہ ناشر کی ڈی آئی ڈی دستاویز شائع ہوئی ہے اور اس میں قابل رسائی اختتامی نقطہ ہے۔
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = رن ٹائم/پلگ ان نے درخواست کو مسترد کر دیا؛ وجہ کا معائنہ کریں اور ہستی/رن ٹائم کو ٹھیک کرنے کے بعد دوبارہ کوشش کریں۔
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = تفصیلی وجہ کے لیے رن ٹائم لاگ کا معائنہ کریں اور دوبارہ کوشش کریں۔
doc-store-sent = ذخیرہ کرنے کی درخواست بھیجی گئی ({ $id }) → { $publisher }؛ CID RPC جواب کے ذریعے آئے گا
doc-ipld-store-sent = IPLD ذخیرہ کرنے کی درخواست بھیجی گئی ({ $id }) → { $publisher }؛ CID RPC جواب کے ذریعے آئے گا
doc-fetch-done = { $cid } حاصل کیا → { $path } (چلایا نہیں گیا)
doc-fetch-failed = حاصل کریں { $cid }: { $e }
doc-fetch-usage = استعمال: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ترتیب نہیں دیا گیا
doc-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں
path-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں

# ── مدد — سرخیاں ──────────────────────────────────────────────────────────
help-header-zion = ── zion کمانڈز ────────────────────────────────────────────────────────────
help-header-messaging = ── پیغام رسانی ────────────────────────────────────────────────────────────
help-header-config = ── مقامی ترتیب کا قواعد ──────────────────────────────────────────────────
help-header-common = ── عام راستے ─────────────────────────────────────────────────────────────
help-header-inbox = ── ان باکس ───────────────────────────────────────────────────────────────
help-header-documents = ── دستاویزات ─────────────────────────────────────────────────────────────
help-header-i18n = ── زبان ───────────────────────────────── ──────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-اسپیس میں داخل ہونا ───────────────────────────── ──────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── مدد — zion کمانڈز ──────────────────────────────────────────────────────
help-cmd-help =   .help                        یہ متن
help-cmd-clear =   .clear                       ٹرمینل صاف کریں
help-cmd-panic =   .panic                       آخری چارہ — مسئلہ ہونے پر استعمال کریں
help-cmd-history =   .history [n]                 کمانڈ ہسٹری (مسلسل تکرار ضم ہو گئی)؛ اختیاری n صرف آخری n سطریں دکھاتا ہے
help-cmd-logout =   .logout                      لاگ آؤٹ
help-cmd-batch =   .batch                       قيّم مستند المسودة (بالتوازي)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         قيّم مستند المسودة سطراً بسطر

# ── مدد — پیغام رسانی ─────────────────────────────────────────────────────
help-msg-echo =   @alias                       حل شدہ DID/DID-URL دکھائیں (کوئی پیغام نہیں بھیجا جاتا)
help-msg-send =   @alias!msg body / @alias:verb args           اداکار کو پیغام / RPC بھیجیں
help-msg-fragment =   @alias#fragment:verb body  واضح DID فریگمنٹ کے ساتھ بھیجیں
help-msg-escape =   \@name                       لفظی @name (عرفی نام تلاش نہیں)

# ── مدد — فوکس موڈ ────────────────────────────────────────────────────────

# ── مدد — ترتیب کا قواعد ──────────────────────────────────────────────────
help-config-get =   .path                        پتی کی قدر حاصل کریں یا ذیلی درخت کی فہرست
help-config-filter =   .path [نام]                  نام رکھنے والی ذیلی کلیدی ناموں کی فہرست
help-config-full =   .path. [نام]                 نام رکھنے والی مکمل ذیلی درخت قدروں کی فہرست
help-config-set =   .path: value                 پتی ترتیب دیں
help-config-delete =   .path:                       پتی یا ذیلی درخت حذف کریں
help-config-verb =   .path!verb [args]            مقامی فعل کال کریں

# ── مدد — عام راستے ───────────────────────────────────────────────────────
help-my =   .my                          تمام ذاتی ترتیب دکھائیں
help-aliases =   .my.aliases                  عرفی ناموں کی فہرست
help-aliases-set =   .my.aliases.<name>: <did-url>    عرفی نام شامل/اپ ڈیٹ کریں (DID یا DID-URL)
help-aliases-del =   .my.aliases.<name>:          عرفی نام ہٹائیں
help-runtime-discover =   .ma: claim [port]          مقامی رن ٹائم دریافت کریں اور @ma بنائیں
help-runtime-claim =   .ma: claim [port]             اپنے DID سے رن ٹائم کا دعوی کریں
help-identity =   .my.identity                 شناخت کی ترتیب دکھائیں
help-identity-did =   .my.identity.did             اپنا DID دکھائیں (صرف پڑھنے کے قابل)
help-identity-publish =   .my.identity!publish @pub    اشاعت سروس کے ذریعے DID شائع کریں
help-identity-export =   .my.identity!export          اپنا شناختی بنڈل ڈاؤن لوڈ کریں
help-config-path =   .config                      تمام .config.* اندراجات دکھائیں

# ── مدد — ان باکس ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    ان باکس کی فہرست (ذیلی درخت نظارہ)
help-inbox-n =   .my.inbox.N                  اندراج N کے فیلڈ دکھائیں
help-inbox-from =   .my.inbox.N.from             اندراج N کا بھیجنے والا DID
help-inbox-reply =   .my.inbox.N!reply [body]     جواب بھیجیں (بغیر مواد — ایڈیٹر کھلتا ہے)
help-inbox-open =   .my.inbox.N!open             صرف پڑھنے کے لیے ایڈیٹر میں مواد کھولیں
help-inbox-del =   .my.inbox.N:                 اندراج N حذف کریں
help-inbox-delall =   .my.inbox:                   تمام ان باکس اندراجات حذف کریں
help-inbox-flush =   .my.inbox!flush              تمام اندراجات ٹرمینل میں پرنٹ کریں
help-inbox-filter =   .my.inbox!filter @who        صرف @who کی اندراجات دکھائیں
help-inbox-traverse =   .my.inbox.N.sender.<field>   بھیجنے والے DID دستاویز کا سست بھرمار

# ── مدد — دستاویزات ──────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           محفوظ مواد کے ساتھ ایڈیٹر کھولیں
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID حاصل کریں، صرف جائزے کے لیے کھولیں
help-doc-eval =   .my.doc.<name>!eval           محفوظ مواد لائن بلائن چلائیں
help-doc-publish =   .my.doc.<name>!publish @pub   خام blob کے طور پر ذخیرہ کریں
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML کو DAG-CBOR IPLD نوڈ کے طور پر ذخیرہ کریں
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID مواد درآمد کریں (چلایا نہیں جاتا)
help-doc-cid =   .my.doc.<name>!cid            محفوظ CID دکھائیں
help-doc-del =   .my.doc.<name>:              دستاویز حذف کریں

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n آپ کی شناخت سے منسلک زبان کی ترجیح کو اسٹور کرتا ہے۔
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               دستیاب زبان کے کوڈز کی فہرست بنائیں

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 کمرہ 間 شناختوں کے درمیان کی جگہ ہے۔ ma ان شناختوں کو ایک دوسرے کو تلاش کرنے اور بات چیت کرنے دیتا ہے؛ جب تمہاری شناخت شائع ہو جائے تو تم حصہ لے سکتے ہو۔
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   اپنے مقامی 間 runtime سے جڑو، /status.json پڑھو، اور .ma.ctx.* محفوظ کرو
help-ma-publish =   .my.identity!publish @ma     اپنا DID دستاویز شائع کرو تاکہ دوسرے تمہاری keys اور endpoint حل کر سکیں
help-ma-security = اعتماد کی سب سے واضح حد تمہارا اپنا 間 runtime ہے، اپنے IPFS Desktop/Kubo کے ساتھ۔ دور کا publisher مفید ہو سکتا ہے، مگر پھر تم کسی اور کی خدمت پر انحصار کرتے ہو۔
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 کمرے میں داخل ہونے کا طریقہ

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = جب تمہاری شناخت معلوم ہو جائے تو .enter @ma تمہیں 間 میں قدم رکھنے دیتا ہے۔ ایک world تلاش کرو، اس میں داخل ہو، اور وہیں سے حصہ لو۔
help-ma-entry-steps = IPFS Desktop اور ma شروع کرو، پھر .ma چلاؤ۔ .my.identity!publish @ma سے شائع کرو، ایک world تلاش کرو، اور .enter @ma سے داخل ہو۔
help-ma-entry-command =   .enter @ma                  @ma runtime کے ذریعے 間 میں داخل ہو
help-ma-entry-toggle =   .enter                       کمرے کا فوکس آن یا آف کرو؛ تمہاری شناخت فعال رہتی ہے
help-ma-entry-url =   ?enter=<runtime>             مشترک URL سے login کے بعد داخل ہو

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = دستیاب زبانیں (.my.i18n: <code> سے ترتیب دیں):
err-lang-not-found = زبان نہیں ملی: { $lang }

msg-send-failed = بھیجنا ناکام ہوا: { $e }
msg-not-logged-in = لاگ ان نہیں ہوا

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML تجزیہ خرابی: { $e }
yaml-not-mapping = YAML ایک mapping (جوڑے کلید: قدر) ہونا چاہیے؛ سادہ متن اور سکیلر DAG-CBOR کے طور پر محفوظ نہیں کیے جا سکتے
dagcbor-encode-error = DAG-CBOR خفیہ کاری خرابی: { $e }
cbor-decode-error = CBOR ڈی کوڈنگ خرابی: { $e }
cbor-json-error = CBOR سے JSON خرابی: { $e }
yaml-serialise-error = YAML سیریلائزیشن خرابی: { $e }
edit-reply-invalid = غلط ترمیم جواب
doc-publish-ipld-error = IPLD اشاعت ناکام: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ان باکس چھانٹنا محفوظ کریں خرابی: { $e }
err-config-load = کنفگریشن لوڈ خرابی: { $e }
err-lang-persist = زبان محفوظ کریں خرابی: { $e }
err-history-parse = تاریخ تجزیہ خرابی: { $e }
err-history-load = تاریخ لوڈ خرابی: { $e }
err-history-count-invalid = ہسٹری کی تعداد ایک مثبت عدد صحیح ہونی چاہیے
err-ipfs-reply-decode = IPFS جواب ڈی کوڈنگ ناکام: { $e }
err-edit-cbor = CBOR ترمیم خرابی: { $e }
err-popup-blocked = براؤزر نے پاپ اپ روک لیا
status-publishing = شائع ہو رہا ہے

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = خطا
rpc-error-detail = خطا: { $detail }
msg-new-message = ← [{ $from }] نئی پیغام — { $count } ان باکس میں
msg-chat = { $sender } کہتا ہے { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } کہتے ہیں { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } کمرے میں داخل ہوئے۔
room-leave = * { $name } کمرے سے نکل گئے۔
room-drop  = * { $name } نے { $thing } گرا دیا۔
room-take  = * { $name } نے { $thing } اٹھایا۔
err-edit-decode-failed = ترمیم: ڈی کوڈ ناکام: { $e }
err-edit-fetch-failed = ترمیم: حاصل کرنا ناکام: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = کوئی فعال سیشن نہیں — پروفائل حذف نہیں کی جا سکتی
profile-delete-error = پروفائل حذف کرنا ناکام ہوا: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = پروفائل کو خفیہ کر کے IPFS کو بھیج دیا گیا؛ CID آنے پر DID دستاویز اپ ڈیٹ ہو گی
profile-publish-done = پروفائل شائع ہو گیا — DID دستاویز ma.agent CID کے ساتھ اپ ڈیٹ ہو گئی
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = شناخت پہلے ہی شائع ہو چکی ہے — پروفائل اپ ٹو ڈیٹ
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = بائنری مواد (دکھایا نہیں گیا)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (کوئی نہیں)
profiles-deleted = پروفائل { $name } حذف کی گئی
profiles-not-found = پروفائل نہیں ملی: { $name }

# -- Help topics index
help-header-topics = -- المواضيع -- اكتب .help/<topic> للتفاصيل
help-topic-msg =   .help/msg                    المراسلة
help-topic-ma = .help/ma                     間-اسپیس، اشاعت، اور اندراج
help-topic-path = .help/path                   مقامی ڈاٹ پاتھ گرامر
help-topic-my =   .help/my                     الإعداد الشخصي
help-topic-inbox =   .help/inbox                  الوارد
help-topic-doc =   .help/doc                    المستندات
help-topic-actor =   .help/actor                  ممثل بعيد
help-topic-zscheme =   .help/zscheme               اِن لائن Scheme اظہارات اور دستاویزات
help-unknown-topic =   .help/{ $topic }: موضوع غير معروف

# -- Help actor section
help-header-actor = -- ممثلون بعيدون
help-actor-echo =   @actor                       اعرض DID المحلول
help-actor-text = @actor[#entity]!msg|!say|!emote body         براہ راست / چیٹ / جذباتی پیغام بھیجیں۔
help-actor-ping = @actor:ping                  liveness پنگ
help-actor-entities =   @actor/entities              اسرد الكيانات
help-actor-entities-get = @actor/entities/<n>          ہستی نوڈ حاصل کریں
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     حرّر الكيان
help-actor-entities-del = @actor/entities/<n>:         ہستی کو حذف کریں۔
help-actor-config-get =   @actor/config/<key>          احصل على قيمة الإعداد
help-actor-config-set =   @actor/config/<key>: val     عيّن قيمة الإعداد
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              حرّر ACL
help-actor-fragment =   @actor#entity                أرسل إلى الإضافة
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC إلى الإضافة
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  5 جوابات کو سیشن کے ماحول میں رکھیں
help-actor-wc-l = .z.scheme!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    URL لنک کے ذریعے zion کھولنا
help-topic-i18n = .help/i18n                   آپ کی شناخت کے لیے زبان کی ترجیح
help-header-url = ── URL پیرامیٹرز ─────────────────────────────────────────────────────────────────
help-url-intro =   ایک لنک شیئر کریں جو پہلے سے بھرے ہوئے وصول کنندہ کے ساتھ zion کھولے:
help-url-msg =   ?msg=<did>                   پہلے سے بھرتا ہے: @<did>!msg (سادہ پیغام)
help-url-say =   ?say=<did>                   پہلے سے بھرتا ہے: @<did>!say (say فعل)
help-url-emote =   ?emote=<did>                 پہلے سے بھرتا ہے: @<did>!emote (emote فعل)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             لاگ ان کے بعد رن ٹائم دنیا میں داخل ہوں۔
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ان پٹ پہلے سے بھرا ہوا ہے لیکن بھیجا نہیں گیا — بھیجنے کے لیے Enter دبائیں۔
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                نیٹ ورک پر اپنی شناخت شائع کریں
help-header-publish = ── شناخت کی اشاعت ───────────────────────────────────────────────────────────
help-publish-intro = اشاعت آپ کی شناخت کو نیٹ ورک پر قابلِ دریافت بناتی ہے۔ دوسرے آپ کا DID تلاش کر کے آپ سے رابطہ کر سکتے ہیں۔
help-publish-ma = شائع کرنے کے لیے آپ کو 間 (مقامی رن ٹائم) نصب چاہیے۔ یہ آپ کی جانب سے ego کو IPFS/IPNS سے جوڑتا ہے۔
help-publish-steps = اقدامات: مقامی ma دریافت کرنے کے لیے '.ma: claim [port]' چلائیں، پھر '.my.identity!publish @ma'۔
help-publish-without = اشاعت کے بغیر دوسرے آپ تک نہیں پہنچ سکتے — چاہے وہ آپ کا DID جانتے ہوں، وہ آپ کا endpoint حل نہیں کر سکتے۔
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = پروفائل کا نام بتائیں: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = بیچ جمع کرنا — ٹائپ کمانڈز، .batch کے ساتھ ختم کریں۔
batch-already-collecting = پہلے ہی ایک بیچ جمع کر رہا ہے — پہلے .batch کے ساتھ ختم کریں۔
batch-empty = بیچ خالی تھا - چلانے کے لیے کچھ نہیں۔
batch-running = تشغيل الدفعة…
batch-step-timeout = بیچ کا مرحلہ ختم ہو گیا۔

batch-done = اكتملت الدفعة في { $secs }ث — { $steps } خطوات
batch-done-error = اكتملت الدفعة مع أخطاء في { $secs }ث — { $steps } خطوات
msg-timeout = انتهت مهلة الرسالة (لا رد خلال 60ث)
err-unknown-command = نامعلوم کمانڈ: { $path }
err-read-only-path = { $path } صرف پڑھنے کے لیے ہے
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        قيّم مستند المسودة (بالتوازي)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } حاصل کرنے میں ناکامی: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = غیر معتبر CID: { $value }
label-runtime = ما
label-runtime-placeholder = did:ma:...
warning-remote-runtime = انتباہ: آپ کی IPNS نجی کلید شناخت کی اشاعت کے لیے اس رن ٹائم کو بھیجی جائے گی۔ صرف ایسے رن ٹائم کا استعمال کریں جس پر آپ مکمل بھروسہ کریں۔

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme zion کمانڈز میں شامل Scheme اظہارات کو پرکھتا ہے اور بھیجنے سے پہلے نتیجہ اسی لائن میں جوڑ دیتا ہے۔
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    اِن لائن مثال؛ "say 7 + 5 = 12" بھیجتا ہے
help-zscheme-define =   (define x 12)             تعریفیں موجودہ لاگ اِن سیشن میں برقرار رہتی ہیں
help-zscheme-doc = دستاویزات: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = مقامی IPFS گیٹ وے (براؤزر استثنا ضروری ہے)

tab-config = ترتیبات
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
