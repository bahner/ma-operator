# zion — العربية
lang-name = العربية
label-nick = الكنية
new-identity-nick-help = اختر كنية لمساحة ma. إنها مجرد كنية ويمكن تغييرها في أي وقت.
error-nick-required = الكنية مطلوبة
error-nick-invalid = يجب ألا تحتوي الكنية على مسافات أو @

# ── صفحة تسجيل الدخول ────────────────────────────────────────────────────
tab-login = دخول
tab-new-identity = هوية جديدة
tab-import-profile = استيراد الملف الشخصي
label-passphrase = عبارة المرور
label-username = اسم المستخدم
label-confirm-passphrase = تأكيد عبارة المرور
label-did = DID
label-profile-cid = CID الملف الشخصي
label-or-file = أو ملف
btn-login = تسجيل الدخول
btn-export = تصدير
btn-generate = إنشاء
btn-new-endpoint = نقطة وصول جديدة
btn-import-profile = استيراد الملف الشخصي
btn-show-qr = عرض رمز QR
btn-scan-qr = مسح رمز QR
qr-scan-hint = وجّه الكاميرا نحو رمز QR لملف zion الشخصي.
qr-error-camera = الكاميرا غير متاحة: { $e }
qr-error-too-large = الملف الشخصي أكبر من أن يُحوَّل إلى رمز QR
passphrase-warning = فقدان عبارة المرور = فقدان الهوية. لا يوجد استرداد.
import-profile-help = استورد ملف تعريف الشخصية عبر CID أو ملف. تحتاج إلى نفس عبارة المرور المستخدمة عند النشر.
import-profile-detected-user = الملف الشخصي يخص: { $name }
status-unlocking = جارٍ إلغاء القفل...
status-generating = جارٍ إنشاء الهوية...
status-reading-file = جارٍ قراءة الملف...
status-fetching-profile = جارٍ جلب الملف الشخصي من IPFS...
status-imported = تم استيراد '{ $name }' — انتقل إلى تبويب تسجيل الدخول
status-importing-profile = جارٍ استيراد الملف الشخصي...
profile-import-done = تم استيراد الملف الشخصي لـ '{ $name }' — تم تحميل { $n } مفتاحًا
error-wrong-passphrase = عبارة مرور خاطئة: { $e }
error-identity-not-found = الهوية '{ $name }' غير موجودة
error-username-required = اسم المستخدم مطلوب
error-passphrase-required = عبارة المرور مطلوبة
error-passphrases-no-match = عبارات المرور غير متطابقة
error-profile-source-required = قدم CID أو ارفع ملفًا
error-did-required = أدخل DID الخاص بك
error-profile-fetch = تعذّر جلب الملف الشخصي: { $e }
error-profile-no-username = الملف الشخصي لا يحتوي على اسم مستخدم
error-profile-no-identity = الهوية '{ $name }' غير موجودة — استورد الهوية أولاً

# ── رسائل نظام الطرفية ────────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — مسجَّل دخول بوصفك { $username }
msg-type-help = اكتب .help للحصول على قائمة الأوامر.
msg-getting-started = جرّب: say Hello world أو look أو .help أو help.
msg-connecting = جارٍ الاتصال بـ iroh...
msg-iroh-ready = نقطة نهاية iroh جاهزة
msg-iroh-failed = iroh: { $e }
msg-auto-published = تم نشر DID عبر 間 المحلي ({ $url })
msg-identity-publication-propagating = نشر الهوية لا يزال قيد الانتشار؛ تم تأجيل الدخول: { $e }
msg-identity-first-publish = يجري نشر الهوية لأول مرة. قد يستغرق هذا ما يصل إلى { $seconds } ثانية.
msg-ma-connecting-matrix = نحاول توصيلك إلى 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = تمت المطالبة بـ 間 المحلي
msg-local-ma-already-claimed = تمت المطالبة بـ 間 المحلي بالفعل
msg-local-ma-claim-failed = فشلت المطالبة بـ 間 المحلي
msg-identity-not-published = لم يُعثر على الهوية عبر الإنترنت — إن كان 間 مثبتاً محلياً، شغّل '.ma [port]' ثم '.my.identity!publish @ma'. اكتب '.help/publish' للتفاصيل.
msg-blocked = ⊗ محجوب [{ $cap }]: { $from }
msg-focus-cleared = تم مسح التركيز
msg-left = left
msg-focusing = تركيز { $did } بوصفه { $prompt }
msg-set = { $path }: { $value }
msg-deleted = تم حذف { $path } ({ $count } إدخالات)
msg-read-only = { $path } للقراءة فقط
msg-subtree-set = { $path } شجرة فرعية؛ رُفض التعيين
msg-ancestor-leaf = أحد أسلاف { $path } ورقة؛ رُفض التظليل
msg-key-not-found = المفتاح غير موجود: { $path }
msg-link-not-connected = خطأ في جلب الرابط: غير متصل
msg-link-fetch-error = خطأ في جلب الرابط: { $e }
msg-link-key-not-found = المفتاح `{ $key }` غير موجود في المستند المرتبط

# ── التحقق من صحة الأسماء المستعارة ──────────────────────────────────────
err-alias-name-empty = لا يمكن أن يكون اسم الاسم المستعار فارغاً
err-alias-has-dot = لا يمكن أن تحتوي الأسماء المستعارة على '.'
err-alias-has-fragment = لا يمكن أن تحتوي الأسماء المستعارة على '#'
err-alias-value-fragment = قد تحتوي قيمة الاسم المستعار على مقطع DID-URL واحد غير فارغ كحد أقصى
err-alias-value-path = يجب أن تكون قيمة الاسم المستعار DID بصيغة did:ma:<ipns> أو DID-URL (بلا مسار)
err-alias-not-did = يجب أن تبدأ قيمة الاسم المستعار بـ did:ma:
err-unknown-alias = اسم مستعار غير معروف: @{ $name }
err-bare-did = متوقع did:ma:<ipns> خالصاً (بلا مقطع أو مسار)، تم استلام { $did }

# ── المحرر ────────────────────────────────────────────────────────────────
btn-save = حفظ
btn-eval = تشغيل
btn-cancel = إلغاء
msg-jobs-cancelled = أُلغيت المهام
btn-close = إغلاق
btn-reply = رد
btn-publish = نشر
btn-publish-ipld = نشر IPLD
msg-reply-sent = تم إرسال الرد
msg-reply-failed = فشل الرد: { $e }
msg-entity-publish-sent = الكيان { $name }: تم إرسال طلب النشر
msg-entity-publish-failed = فشل نشر الكيان: { $e }
msg-kind-publish-failed = فشل نشر النوع: { $e }
msg-field-publish-sent = الكيان { $name }.{ $field }: تم إرسال طلب النشر
msg-field-publish-failed = فشل نشر الحقل: { $e }
msg-acl-publish-sent = ACL وقت التشغيل: تم إرسال طلب النشر
msg-crud-edit-publish-sent = { $path }: تم إرسال طلب النشر
msg-acl-publish-failed = فشل نشر ACL وقت التشغيل: { $e }
msg-yaml-error = خطأ YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = تم جلب { $cid } — راجع قبل التشغيل
msg-fetch-failed = جلب { $cid }: { $e }

# ── الأفعال — صندوق الوارد ────────────────────────────────────────────────
inbox-empty = صندوق الوارد فارغ
inbox-entry-not-found = إدخال صندوق الوارد { $n } غير موجود
inbox-no-message-id = إدخال صندوق الوارد { $n } لا يحتوي على message_id
inbox-no-verb = لا يوجد فعل `{ $verb }` لإدخال صندوق الوارد { $n }
inbox-filter-no-arg = يتطلب الفلتر وسيطة DID أو مستعار
inbox-filter-empty = لا رسائل من { $did }

# ── الأفعال — وقت التشغيل ─────────────────────────────────────────────────
discover-fetch-failed = فشل الاكتشاف في { $url }: { $e }
discover-json-error = فشل الاكتشاف: JSON غير صالح من { $url }: { $e }
discover-missing-did = فشل الاكتشاف: الحقل `did` مفقود في status.json
discover-invalid-did = فشل الاكتشاف: متوقع أن يبدأ `did` بـ did:ma:، تم استلام `{ $did }`
discover-no-endpoint = تحذير الاكتشاف: `endpoint_id` مفقود في status.json؛ تم تخزين DID فقط
discover-hint-endpoint-not-found = تلميح: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = تلميح: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = تلميح: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = تلميح: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = تم اكتشاف 間 في { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   تم إنشاء الاسم المستعار @ma — شغّل '.my.identity!publish @ma' لنشر هويتك.
claim-success = تم المطالبة بوقت التشغيل لـ { $did }
claim-conflict = وقت التشغيل مطالب به بالفعل من قِبل هوية أخرى
claim-already-owned = وقت التشغيل مطالب به بالفعل من قِبل هذه الهوية
claim-http-failed = فشلت المطالبة: HTTP { $status }
claim-error = فشلت المطالبة: { $e }
claim-no-session = غير مسجَّل دخول؛ سجِّل دخولك أولاً للمطالبة بوقت التشغيل
runtime-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }

# ── الأفعال — ACL ──────────────────────────────────────────────────────────
acl-reset = تمت إعادة تعيين .my.acl (مفتوح تماماً)
acl-persist-error = خطأ في الحفظ: { $e }
acl-no-verb = لا يوجد فعل `{ $verb }` لـ .my.acl

# ── الأفعال — الهوية ──────────────────────────────────────────────────────
publish-usage = الاستخدام: .my.identity!publish <did-أو-اسم-مستعار>
identity-exported = تم تنزيل الحزمة باسم { $filename }
identity-export-failed = فشل التصدير: { $e }

# ── الأفعال — المستندات ───────────────────────────────────────────────────
doc-content-empty = { $path } فارغ
doc-save-first = { $path } فارغ — احفظ أولاً
doc-missing-name = اسم المستند مفقود
doc-publish-usage = الاستخدام: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = الاستخدام: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = نشر { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = فشل النشر [{ $code }]: { $err }
doc-publish-error-hint = تلميح: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = تم إرسال طلب التخزين ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-ipld-store-sent = تم إرسال طلب تخزين IPLD ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-fetch-done = تم جلب { $cid } → { $path } (لم يُنفَّذ)
doc-fetch-failed = جلب { $cid }: { $e }
doc-fetch-usage = الاستخدام: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid غير محدد
doc-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }
path-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }

# ── المساعدة — العناوين ───────────────────────────────────────────────────
help-header-zion = ── أوامر zion ───────────────────────────────────────────────────────────
help-header-messaging = ── المراسلة ──────────────────────────────────────────────────────────────
help-header-config = ── قواعد الضبط المحلي ───────────────────────────────────────────────────
help-header-common = ── المسارات الشائعة ──────────────────────────────────────────────────────
help-header-inbox = ── صندوق الوارد ──────────────────────────────────────────────────────────
help-header-documents = ── المستندات ─────────────────────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── المساعدة — أوامر zion ──────────────────────────────────────────────────
help-cmd-help =   .help                        هذا النص
help-cmd-clear =   .clear                       مسح الطرفية
help-cmd-panic =   .panic                       الملاذ الأخير — استخدم عند المشاكل
help-cmd-history =   .history [n]                 سجل الأوامر (التكرارات المتتالية مدمجة)؛ يعرض n السطور الأخيرة فقط إذا تم تحديده اختياريًا
help-cmd-logout =   .logout                      تسجيل الخروج
help-cmd-batch =   .batch                       قيّم مستند المسودة (بالتوازي)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         قيّم مستند المسودة سطراً بسطر

# ── المساعدة — المراسلة ───────────────────────────────────────────────────
help-msg-echo =   @alias                       اعرض DID/DID-URL المحلول (لا تُرسل رسالة)
help-msg-send =   @alias!msg body / @alias:verb args           إرسال رسالة / RPC إلى ممثل
help-msg-fragment =   @alias#fragment:verb body  إرسال مع مقطع DID صريح
help-msg-escape =   \@name                       @name حرفياً (بلا بحث عن اسم مستعار)

# ── المساعدة — وضع التركيز ────────────────────────────────────────────────

# ── المساعدة — قواعد الضبط ────────────────────────────────────────────────
help-config-get =   .path                        الحصول على قيمة ورقة أو سرد الشجرة الفرعية
help-config-filter =   .path [اسم]                  سرد أسماء المفاتيح الفرعية التي تحتوي على اسم
help-config-full =   .path. [اسم]                 سرد قيم الشجرة الفرعية الكاملة التي تحتوي على اسم
help-config-set =   .path: value                 تعيين قيمة ورقة
help-config-delete =   .path:                       حذف ورقة أو شجرة فرعية
help-config-verb =   .path!verb [args]            استدعاء فعل محلي

# ── المساعدة — المسارات الشائعة ──────────────────────────────────────────
help-my =   .my                          عرض جميع الضبط الشخصي
help-aliases =   .my.aliases                  قائمة الأسماء المستعارة
help-aliases-set =   .my.aliases.<name>: <did-url>    إضافة/تحديث اسم مستعار (DID أو DID-URL)
help-aliases-del =   .my.aliases.<name>:          إزالة اسم مستعار
help-runtime-discover =   .ma [port]          اكتشاف وقت التشغيل المحلي وإنشاء @ma
help-runtime-claim =   .ma [port]             المطالبة بملكية وقت التشغيل
help-identity =   .my.identity                 عرض ضبط الهوية
help-identity-did =   .my.identity.did             عرض DID الخاص (للقراءة فقط)
help-identity-publish =   .my.identity!publish @pub    نشر DID عبر خدمة النشر
help-identity-export =   .my.identity!export          تنزيل حزمة هويتك
help-config-path =   .config                      عرض جميع إدخالات .config.*

# ── المساعدة — صندوق الوارد ──────────────────────────────────────────────
help-inbox =   .my.inbox                    سرد صندوق الوارد (عرض الشجرة الفرعية)
help-inbox-n =   .my.inbox.N                  عرض حقول الإدخال N
help-inbox-from =   .my.inbox.N.from             DID مرسل الإدخال N
help-inbox-reply =   .my.inbox.N!reply [body]     إرسال رد (بلا نص — يفتح المحرر)
help-inbox-open =   .my.inbox.N!open             فتح المحتوى للقراءة فقط في المحرر
help-inbox-del =   .my.inbox.N:                 حذف الإدخال N
help-inbox-delall =   .my.inbox:                   حذف جميع إدخالات صندوق الوارد
help-inbox-flush =   .my.inbox!flush              طباعة جميع الإدخالات في الطرفية
help-inbox-filter =   .my.inbox!filter @who        عرض الإدخالات من @who فقط
help-inbox-traverse =   .my.inbox.N.sender.<field>   استعراض مستند DID المرسل بشكل كسول

# ── المساعدة — المستندات ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           فتح المحرر بالمحتوى المحفوظ
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     جلب CID وفتحه للمراجعة فقط
help-doc-eval =   .my.doc.<name>!eval           تشغيل المحتوى المحفوظ سطراً سطراً
help-doc-publish =   .my.doc.<name>!publish @pub   تخزين كبيانات خام (أي نوع)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  تخزين YAML كعقدة IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    استيراد محتوى CID (بلا تشغيل)
help-doc-cid =   .my.doc.<name>!cid            عرض CID المخزَّن
help-doc-del =   .my.doc.<name>:              حذف المستند

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n stores the language preference tied to your identity.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list =   .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = غرفة 間 هي المساحة بين هويات 間. يتيح ma لهذه الهويات أن تعثر على بعضها وتتواصل؛ وبعد نشر هويتك يمكنك المشاركة.
help-ma-command =   .ma [port]                   اتصل بوقت تشغيل ma المحلي، واقرأ /status.json، واحفظ .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     انشر مستند DID الخاص بك كي يتمكن الآخرون من حل مفاتيحك ونقطة النهاية
help-ma-security = أوضح حد للثقة هو وقت تشغيل 間 الخاص بك مع IPFS Desktop/Kubo الخاص بك. قد يكون ناشر بعيد مفيدًا، لكنك عندها تعتمد على خدمة شخص آخر.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             كيفية الدخول إلى غرفة 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = بعد أن تصبح هويتك معروفة، يتيح لك .enter @ma أن تدخل إلى 間. ابحث عن عالم، وادخل إليه، وشارك من هناك.
help-ma-entry-steps = شغّل IPFS Desktop و ma، ثم نفّذ .ma. انشر باستخدام .my.identity!publish @ma، وابحث عن عالم، وادخل باستخدام .enter @ma.
help-ma-entry-command =   .enter @ma                  ادخل إلى 間 عبر وقت تشغيل @ma
help-ma-entry-toggle =   .enter                       بدّل تركيز الغرفة تشغيلًا أو إيقافًا؛ تبقى هويتك نشطة
help-ma-entry-url =   ?enter=<runtime>             ادخل بعد تسجيل الدخول من URL مشترك

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = اللغات المتاحة (عيّن بـ .my.i18n: <code>):
err-lang-not-found = اللغة غير موجودة: { $lang }

msg-send-failed = فشل الإرسال: { $e }
msg-not-logged-in = غير مسجّل الدخول

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = خطأ في تحليل YAML: { $e }
yaml-not-mapping = يجب أن يكون YAML تعيينًا (أزواج مفتاح: قيمة)؛ لا يمكن تخزين النص العادي والقيم القياسية كـ DAG-CBOR
dagcbor-encode-error = خطأ في ترميز DAG-CBOR: { $e }
cbor-decode-error = خطأ في فك ترميز CBOR: { $e }
cbor-json-error = خطأ في تحويل CBOR إلى JSON: { $e }
yaml-serialise-error = خطأ في تسلسل YAML: { $e }
edit-reply-invalid = رد تعديل غير صالح
doc-publish-ipld-error = فشل نشر IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = خطأ في حفظ تنظيف البريد الوارد: { $e }
err-config-load = خطأ في تحميل الإعداد: { $e }
err-lang-persist = خطأ في حفظ اللغة: { $e }
err-history-parse = خطأ في تحليل السجل: { $e }
err-history-load = خطأ في تحميل السجل: { $e }
err-history-count-invalid = يجب أن يكون عدد السجل عددًا صحيحًا موجبًا
err-ipfs-reply-decode = فشل فك ترميز استجابة IPFS: { $e }
err-edit-cbor = خطأ تعديل CBOR: { $e }
err-popup-blocked = النوافذ المنبثقة محجوبة من المتصفح
status-publishing = يُنشر

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = خطأ
rpc-error-detail = خطأ: { $detail }
msg-new-message = ← [{ $from }] رسالة جديدة — { $count } في البريد الوارد
msg-chat = { $sender } يقول { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } يقول { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } دخل الغرفة.
room-leave = * { $name } غادر الغرفة.
room-drop  = * { $name } يلقي { $thing }.
room-take  = * { $name } يلتقط { $thing }.
err-edit-decode-failed = فشل فك ترميز التحرير: { $e }
err-edit-fetch-failed = فشل جلب التحرير: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = لا توجد جلسة نشطة — لا يمكن حذف الملف الشخصي
profile-delete-error = فشل حذف الملف الشخصي: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = تم تشفير الملف الشخصي وإرساله إلى IPFS؛ سيُحدَّث مستند DID عند وصول CID
profile-publish-done = نُشر الملف الشخصي — حُدِّث مستند DID بمعرّف ma.agent CID
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
profiles-empty = (لا شيء)
profiles-deleted = تم حذف الملف الشخصي { $name }
profiles-not-found = الملف الشخصي غير موجود: { $name }

# -- Help topics index
help-header-topics = -- المواضيع -- اكتب .help/<topic> للتفاصيل
help-topic-msg =   .help/msg                    المراسلة
help-topic-ma = .help/ma                     間-space, publishing, and entry
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     الإعداد الشخصي
help-topic-inbox =   .help/inbox                  الوارد
help-topic-doc =   .help/doc                    المستندات
help-topic-actor =   .help/actor                  ممثل بعيد
help-topic-zscheme =   .help/zscheme               تعابير Scheme المضمنة والوثائق
help-topic-url =   .help/url                    فتح zion عبر رابط URL
help-topic-i18n =   .help/i18n                   language preference for your identity
help-unknown-topic =   .help/{ $topic }: موضوع غير معروف

# -- Help actor section
help-header-actor = -- ممثلون بعيدون
help-actor-echo =   @actor                       اعرض DID المحلول
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              اسرد الكيانات
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     حرّر الكيان
help-actor-entities-del =   @actor/entities/<n>:         delete entity
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
help-actor-wc = (define x (@actor:verb arg))  keep 5 replies in the session environment
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── معاملات URL ─────────────────────────────────────────────────────────────
help-url-intro =   شارك رابطاً يفتح zion مع مستلم مملوء مسبقاً:
help-url-msg =   ?msg=<did>                   يملأ مسبقاً: @<did>!msg (رسالة نصية)
help-url-say =   ?say=<did>                   يملأ مسبقاً: @<did>!say (فعل say)
help-url-emote =   ?emote=<did>                 يملأ مسبقاً: @<did>!emote (فعل emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   الحقل يُملأ مسبقاً لكنه لا يُرسل — اضغط Enter للإرسال.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                نشر هويتك على الشبكة
help-header-publish = ── نشر الهوية ───────────────────────────────────────────────────────────────
help-publish-intro = النشر يجعل هويتك قابلة للاكتشاف على الشبكة. يمكن للآخرين البحث عن DID الخاص بك للتواصل معك.
help-publish-ma = للنشر تحتاج إلى تثبيت 間 (بيئة التشغيل المحلية). تربط ego بـ IPFS/IPNS نيابةً عنك.
help-publish-steps = الخطوات: شغّل '.ma [port]' للكشف عن ma المحلي، ثم '.my.identity!publish @ma'.
help-publish-without = بدون نشر، لا يستطيع الآخرون الوصول إليك — حتى لو عرفوا DID الخاص بك، لا يستطيعون تحليل نقطة النهاية الخاصة بك.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = حدّد اسم ملف شخصي: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = تشغيل الدفعة…
batch-step-timeout = batch step timed out

batch-done = اكتملت الدفعة في { $secs }ث — { $steps } خطوات
batch-done-error = اكتملت الدفعة مع أخطاء في { $secs }ث — { $steps } خطوات
msg-timeout = انتهت مهلة الرسالة (لا رد خلال 60ث)
err-unknown-command = أمر غير معروف: { $path }
err-read-only-path = { $path } للقراءة فقط
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        قيّم مستند المسودة (بالتوازي)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = فشل جلب CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID غير صالح: { $value }
label-runtime = ما
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = تحذير: سيتم إرسال مفتاحك الخاص IPNS إلى بيئة التشغيل هذه لنشر هويتك. استخدم فقط بيئة تشغيل تثق بها تمامًا.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = يقيم zscheme تعابير Scheme المضمنة داخل أوامر zion ويدمج النتيجة في السطر قبل إرساله.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    مثال مضمن؛ يرسل "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             تبقى التعريفات خلال جلسة تسجيل الدخول الحالية
help-zscheme-doc = الوثائق: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = بوابة IPFS المحلية (تتطلب استثناءً في المتصفح)

tab-config = الإعدادات
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
