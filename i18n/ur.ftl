# zion — اردو
lang-name = اردو

# ── لاگ ان صفحہ ───────────────────────────────────────────────────────────
tab-login = لاگ ان
tab-new-identity = نئی شناخت
tab-import = درآمد
label-passphrase = پاس فریز
label-username = صارف نام
label-confirm-passphrase = پاس فریز کی تصدیق کریں
btn-login = لاگ ان کریں
btn-export = برآمد
btn-generate = بنائیں
passphrase-warning = پاس فریز کھونے کا مطلب شناخت کھونا ہے۔ کوئی بحالی ممکن نہیں۔
import-help = برآمد شدہ .zion.json فائل منتخب کریں۔ بنڈل خفیہ کاری شدہ رہتا ہے۔
status-unlocking = کھولا جا رہا ہے...
status-generating = شناخت بنائی جا رہی ہے...
status-reading-file = فائل پڑھی جا رہی ہے...
status-imported = '{ $name }' درآمد کیا گیا — لاگ ان ٹیب پر جائیں
error-wrong-passphrase = غلط پاس فریز: { $e }
error-identity-not-found = شناخت '{ $name }' نہیں ملی
error-username-required = صارف نام ضروری ہے
error-passphrase-required = پاس فریز ضروری ہے
error-passphrases-no-match = پاس فریز میل نہیں کھاتے

# ── ٹرمینل سسٹم پیغامات ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } کے طور پر لاگ ان
msg-type-help = کمانڈ کی فہرست کے لیے .help ٹائپ کریں۔
msg-connecting = iroh سے منسلک ہو رہا ہے...
msg-iroh-ready = iroh اینڈ پوائنٹ تیار ہے
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ بلاک کیا گیا [{ $cap }]: { $from }
msg-focus-cleared = فوکس صاف کیا گیا
msg-focusing = { $did } کو { $prompt } کے طور پر فوکس کیا جا رہا ہے
msg-set = { $path }: { $value }
msg-deleted = { $path } حذف کیا گیا ({ $count } اندراجات)
msg-read-only = { $path } صرف پڑھنے کے قابل ہے
msg-subtree-set = { $path } ایک ذیلی درخت ہے؛ ترتیب سے انکار
msg-ancestor-leaf = { $path } کا ایک آبا و اجداد پتہ ہے؛ سایہ سے انکار
msg-key-not-found = کلید نہیں ملی: { $path }
msg-no-match = کوئی میل نہیں
msg-link-not-connected = لنک حاصل کرنے میں خرابی: منسلک نہیں
msg-link-fetch-error = لنک حاصل کرنے میں خرابی: { $e }
msg-link-key-not-found = منسلک دستاویز میں کلید `{ $key }` نہیں ملی

# ── عرفی نام کی تصدیق ────────────────────────────────────────────────────
err-alias-name-empty = عرفی نام خالی نہیں ہو سکتا
err-alias-has-fragment = عرفی ناموں میں '#' نہیں ہو سکتا
err-alias-value-fragment = عرفی نام کی قدر bare did:ma:<ipns> ہونی چاہیے (کوئی فریگمنٹ نہیں)
err-alias-value-path = عرفی نام کی قدر bare did:ma:<ipns> ہونی چاہیے (کوئی راستہ نہیں)
err-alias-not-did = عرفی نام کی قدر did:ma: سے شروع ہونی چاہیے
err-unknown-alias = نامعلوم عرفی نام: @{ $name }
err-bare-did = bare did:ma:<ipns> (بغیر فریگمنٹ یا راستے) متوقع تھا، ملا { $did }

# ── ایڈیٹر ────────────────────────────────────────────────────────────────
btn-save = محفوظ کریں
btn-eval = چلائیں
btn-cancel = منسوخ کریں
btn-close = بند کریں
btn-reply = جواب دیں
btn-publish = شائع کریں
msg-reply-sent = جواب بھیجا گیا
msg-reply-failed = جواب ناکام: { $e }
msg-entity-publish-sent = ادارہ { $name }: اشاعت بھیجی گئی
msg-entity-publish-failed = ادارہ اشاعت ناکام: { $e }
msg-field-publish-sent = ادارہ { $name }.{ $field }: اشاعت بھیجی گئی
msg-field-publish-failed = فیلڈ اشاعت ناکام: { $e }
msg-acl-publish-sent = رن ٹائم ACL: اشاعت بھیجی گئی
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

# ── افعال — رن ٹائم ───────────────────────────────────────────────────────
discover-fetch-failed = { $url } پر دریافت ناکام: { $e }
discover-json-error = دریافت ناکام: { $url } سے غلط JSON: { $e }
discover-missing-did = دریافت ناکام: status.json میں `did` فیلڈ غائب
discover-invalid-did = دریافت ناکام: `did` کو did:ma: سے شروع ہونا چاہیے تھا، ملا `{ $did }`
discover-no-endpoint = دریافت انتباہ: status.json میں `endpoint_id` غائب؛ صرف DID محفوظ
discover-success = { $url } پر ma دریافت ہوا
discover-did-line = DID: { $did }
discover-alias-hint =   عرفی نام @ma بنایا گیا — شائع کریں: .my.identity:publish @ma
claim-success = { $did } کے لیے رن ٹائم کا دعوی کیا گیا
claim-conflict = رن ٹائم پہلے ہی کسی اور شناخت نے دعوی کیا ہے
claim-http-failed = دعوی ناکام: HTTP { $status }
claim-error = دعوی ناکام: { $e }
claim-no-session = لاگ ان نہیں؛ رن ٹائم کا دعوی کرنے کے لیے پہلے لاگ ان کریں
runtime-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں

# ── افعال — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl ری سیٹ کیا گیا (مکمل کھلا)
acl-persist-error = محفوظ کرنے کی خرابی: { $e }
acl-no-verb = .my.acl کے لیے `{ $verb }` فعل نہیں

# ── افعال — شناخت ─────────────────────────────────────────────────────────
publish-usage = استعمال: .my.identity:publish <did-یا-عرفی-نام>

# ── افعال — دستاویزات ────────────────────────────────────────────────────
doc-content-empty = { $path }.content خالی ہے
doc-save-first = { $path }.content خالی ہے — پہلے محفوظ کریں
doc-missing-name = دستاویز کا نام غائب
doc-publish-usage = استعمال: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = استعمال: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = اشاعت { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = ذخیرہ کرنے کی درخواست بھیجی گئی ({ $id }) → { $publisher }؛ CID RPC جواب کے ذریعے آئے گا
doc-ipld-store-sent = IPLD ذخیرہ کرنے کی درخواست بھیجی گئی ({ $id }) → { $publisher }؛ CID RPC جواب کے ذریعے آئے گا
doc-fetch-done = { $cid } حاصل کیا → { $path }.content (چلایا نہیں گیا)
doc-fetch-failed = حاصل کریں { $cid }: { $e }
doc-fetch-usage = استعمال: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ترتیب نہیں دیا گیا
doc-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں
path-no-verb = { $path } کے لیے `{ $verb }` فعل نہیں

# ── مدد — سرخیاں ──────────────────────────────────────────────────────────
help-header-zion = ── zion کمانڈز ────────────────────────────────────────────────────────────
help-header-messaging = ── پیغام رسانی ────────────────────────────────────────────────────────────
help-header-focus = ── فوکس موڈ ──────────────────────────────────────────────────────────────
help-header-config = ── مقامی ترتیب کا قواعد ──────────────────────────────────────────────────
help-header-common = ── عام راستے ─────────────────────────────────────────────────────────────
help-header-inbox = ── ان باکس ───────────────────────────────────────────────────────────────
help-header-documents = ── دستاویزات ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── مدد — zion کمانڈز ──────────────────────────────────────────────────────
help-cmd-help =   .help                        یہ متن
help-cmd-clear =   .clear                       ٹرمینل صاف کریں
help-cmd-panic =   .panic                       آخری چارہ — مسئلہ ہونے پر استعمال کریں
help-cmd-logout =   .logout                      لاگ آؤٹ

# ── مدد — پیغام رسانی ─────────────────────────────────────────────────────
help-msg-echo =   @alias                       حل شدہ DID دکھائیں (پیغام نہیں بھیجا)
help-msg-send =   @alias[:verb] body           اداکار کو پیغام / RPC بھیجیں
help-msg-fragment =   @alias#fragment[:verb] body  واضح DID فریگمنٹ کے ساتھ بھیجیں
help-msg-escape =   \@name                       لفظی @name (عرفی نام تلاش نہیں)

# ── مدد — فوکس موڈ ────────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       اداکار پر فوکس کریں (پرامپٹ بدلتا ہے)
help-focus-clear =   .use                         فوکس صاف کریں

# ── مدد — ترتیب کا قواعد ──────────────────────────────────────────────────
help-config-get =   .path                        پتی کی قدر حاصل کریں یا ذیلی درخت کی فہرست
help-config-filter =   .path value                  قدر سے فلٹر کریں
help-config-set =   .path: value                 پتی ترتیب دیں
help-config-delete =   .path:                       پتی یا ذیلی درخت حذف کریں
help-config-verb =   .path:verb [args]            مقامی فعل کال کریں

# ── مدد — عام راستے ───────────────────────────────────────────────────────
help-my =   .my                          تمام ذاتی ترتیب دکھائیں
help-aliases =   .my.aliases                  عرفی ناموں کی فہرست
help-aliases-set =   .my.aliases.<name>: <did>    عرفی نام شامل/اپ ڈیٹ کریں
help-aliases-del =   .my.aliases.<name>:          عرفی نام ہٹائیں
help-runtime-discover =   .my.ma:discover          مقامی رن ٹائم دریافت کریں اور @ma بنائیں
help-runtime-claim =   .my.ma:claim             اپنے DID سے رن ٹائم کا دعوی کریں
help-identity =   .my.identity                 شناخت کی ترتیب دکھائیں
help-identity-did =   .my.identity.did             اپنا DID دکھائیں (صرف پڑھنے کے قابل)
help-identity-publish =   .my.identity:publish @pub    اشاعت سروس کے ذریعے DID شائع کریں
help-config-path =   .config                      تمام .config.* اندراجات دکھائیں

# ── مدد — ان باکس ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    ان باکس کی فہرست (ذیلی درخت نظارہ)
help-inbox-n =   .my.inbox.N                  اندراج N کے فیلڈ دکھائیں
help-inbox-from =   .my.inbox.N.from             اندراج N کا بھیجنے والا DID
help-inbox-reply =   .my.inbox.N:reply [body]     جواب بھیجیں (بغیر مواد — ایڈیٹر کھلتا ہے)
help-inbox-open =   .my.inbox.N:open             صرف پڑھنے کے لیے ایڈیٹر میں مواد کھولیں
help-inbox-del =   .my.inbox.N:                 اندراج N حذف کریں
help-inbox-delall =   .my.inbox:                   تمام ان باکس اندراجات حذف کریں
help-inbox-flush =   .my.inbox:flush              تمام اندراجات ٹرمینل میں پرنٹ کریں
help-inbox-traverse =   .my.inbox.N.sender.<field>   بھیجنے والے DID دستاویز کا سست بھرمار

# ── مدد — دستاویزات ──────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           محفوظ مواد کے ساتھ ایڈیٹر کھولیں
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID حاصل کریں، صرف جائزے کے لیے کھولیں
help-doc-eval =   .my.doc.<name>:eval           محفوظ مواد لائن بلائن چلائیں
help-doc-publish =   .my.doc.<name>:publish @pub   خام blob کے طور پر ذخیرہ کریں
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML کو DAG-CBOR IPLD نوڈ کے طور پر ذخیرہ کریں
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID مواد درآمد کریں (چلایا نہیں جاتا)
help-doc-cid =   .my.doc.<name>:cid            محفوظ CID دکھائیں
help-doc-del =   .my.doc.<name>:              دستاویز حذف کریں

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = دستیاب زبانیں (.my.i18n: <code> سے ترتیب دیں):
err-lang-not-found = زبان نہیں ملی: { $lang }

msg-send-failed = بھیجنا ناکام ہوا: { $e }
msg-not-logged-in = لاگ ان نہیں ہوا
