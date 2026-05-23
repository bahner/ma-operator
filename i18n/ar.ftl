# zion — العربية
lang-name = العربية

# ── صفحة تسجيل الدخول ────────────────────────────────────────────────────
tab-login = دخول
tab-new-identity = هوية جديدة
tab-import = استيراد
label-passphrase = عبارة المرور
label-username = اسم المستخدم
label-confirm-passphrase = تأكيد عبارة المرور
btn-login = تسجيل الدخول
btn-export = تصدير
btn-generate = إنشاء
passphrase-warning = فقدان عبارة المرور = فقدان الهوية. لا يوجد استرداد.
import-help = اختر ملف .zion.json المُصدَّر. تبقى الحزمة مشفرة.
status-unlocking = جارٍ إلغاء القفل...
status-generating = جارٍ إنشاء الهوية...
status-reading-file = جارٍ قراءة الملف...
status-imported = تم استيراد '{ $name }' — انتقل إلى تبويب تسجيل الدخول
error-wrong-passphrase = عبارة مرور خاطئة: { $e }
error-identity-not-found = الهوية '{ $name }' غير موجودة
error-username-required = اسم المستخدم مطلوب
error-passphrase-required = عبارة المرور مطلوبة
error-passphrases-no-match = عبارات المرور غير متطابقة

# ── رسائل نظام الطرفية ────────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — مسجَّل دخول بوصفك { $username }
msg-type-help = اكتب .help للحصول على قائمة الأوامر.
msg-connecting = جارٍ الاتصال بـ iroh...
msg-iroh-ready = نقطة نهاية iroh جاهزة
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ محجوب [{ $cap }]: { $from }
msg-focus-cleared = تم مسح التركيز
msg-focusing = تركيز { $did } بوصفه { $prompt }
msg-set = { $path }: { $value }
msg-deleted = تم حذف { $path } ({ $count } إدخالات)
msg-read-only = { $path } للقراءة فقط
msg-subtree-set = { $path } شجرة فرعية؛ رُفض التعيين
msg-ancestor-leaf = أحد أسلاف { $path } ورقة؛ رُفض التظليل
msg-key-not-found = المفتاح غير موجود: { $path }
msg-no-match = لا يوجد تطابق
msg-link-not-connected = خطأ في جلب الرابط: غير متصل
msg-link-fetch-error = خطأ في جلب الرابط: { $e }
msg-link-key-not-found = المفتاح `{ $key }` غير موجود في المستند المرتبط

# ── التحقق من صحة الأسماء المستعارة ──────────────────────────────────────
err-alias-name-empty = لا يمكن أن يكون اسم الاسم المستعار فارغاً
err-alias-has-fragment = لا يمكن أن تحتوي الأسماء المستعارة على '#'
err-alias-value-fragment = يجب أن تكون قيمة الاسم المستعار did:ma:<ipns> خالصاً (بلا مقطع)
err-alias-value-path = يجب أن تكون قيمة الاسم المستعار did:ma:<ipns> خالصاً (بلا مسار)
err-alias-not-did = يجب أن تبدأ قيمة الاسم المستعار بـ did:ma:
err-unknown-alias = اسم مستعار غير معروف: @{ $name }
err-bare-did = متوقع did:ma:<ipns> خالصاً (بلا مقطع أو مسار)، تم استلام { $did }

# ── المحرر ────────────────────────────────────────────────────────────────
btn-save = حفظ
btn-eval = تشغيل
btn-cancel = إلغاء
btn-close = إغلاق
btn-reply = رد
btn-publish = نشر
msg-reply-sent = تم إرسال الرد
msg-reply-failed = فشل الرد: { $e }
msg-entity-publish-sent = الكيان { $name }: تم إرسال طلب النشر
msg-entity-publish-failed = فشل نشر الكيان: { $e }
msg-field-publish-sent = الكيان { $name }.{ $field }: تم إرسال طلب النشر
msg-field-publish-failed = فشل نشر الحقل: { $e }
msg-acl-publish-sent = ACL وقت التشغيل: تم إرسال طلب النشر
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

# ── الأفعال — وقت التشغيل ─────────────────────────────────────────────────
discover-fetch-failed = فشل الاكتشاف في { $url }: { $e }
discover-json-error = فشل الاكتشاف: JSON غير صالح من { $url }: { $e }
discover-missing-did = فشل الاكتشاف: الحقل `did` مفقود في status.json
discover-invalid-did = فشل الاكتشاف: متوقع أن يبدأ `did` بـ did:ma:، تم استلام `{ $did }`
discover-no-endpoint = تحذير الاكتشاف: `endpoint_id` مفقود في status.json؛ تم تخزين DID فقط
discover-success = تم اكتشاف ma في { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   تم إنشاء الاسم المستعار @ma — انشر بـ: .my.identity:publish @ma
claim-success = تم المطالبة بوقت التشغيل لـ { $did }
claim-conflict = وقت التشغيل مطالب به بالفعل من قِبل هوية أخرى
claim-http-failed = فشلت المطالبة: HTTP { $status }
claim-error = فشلت المطالبة: { $e }
claim-no-session = غير مسجَّل دخول؛ سجِّل دخولك أولاً للمطالبة بوقت التشغيل
runtime-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }

# ── الأفعال — ACL ──────────────────────────────────────────────────────────
acl-reset = تمت إعادة تعيين .my.acl (مفتوح تماماً)
acl-persist-error = خطأ في الحفظ: { $e }
acl-no-verb = لا يوجد فعل `{ $verb }` لـ .my.acl

# ── الأفعال — الهوية ──────────────────────────────────────────────────────
publish-usage = الاستخدام: .my.identity:publish <did-أو-اسم-مستعار>

# ── الأفعال — المستندات ───────────────────────────────────────────────────
doc-content-empty = { $path }.content فارغ
doc-save-first = { $path }.content فارغ — احفظ أولاً
doc-missing-name = اسم المستند مفقود
doc-publish-usage = الاستخدام: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = الاستخدام: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = نشر { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = تم إرسال طلب التخزين ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-ipld-store-sent = تم إرسال طلب تخزين IPLD ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-fetch-done = تم جلب { $cid } → { $path }.content (لم يُنفَّذ)
doc-fetch-failed = جلب { $cid }: { $e }
doc-fetch-usage = الاستخدام: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid غير محدد
doc-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }
path-no-verb = لا يوجد فعل `{ $verb }` لـ { $path }

# ── المساعدة — العناوين ───────────────────────────────────────────────────
help-header-zion = ── أوامر zion ───────────────────────────────────────────────────────────
help-header-messaging = ── المراسلة ──────────────────────────────────────────────────────────────
help-header-focus = ── وضع التركيز ───────────────────────────────────────────────────────────
help-header-config = ── قواعد الضبط المحلي ───────────────────────────────────────────────────
help-header-common = ── المسارات الشائعة ──────────────────────────────────────────────────────
help-header-inbox = ── صندوق الوارد ──────────────────────────────────────────────────────────
help-header-documents = ── المستندات ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── المساعدة — أوامر zion ──────────────────────────────────────────────────
help-cmd-help =   .help                        هذا النص
help-cmd-clear =   .clear                       مسح الطرفية
help-cmd-panic =   .panic                       الملاذ الأخير — استخدم عند المشاكل
help-cmd-logout =   .logout                      تسجيل الخروج

# ── المساعدة — المراسلة ───────────────────────────────────────────────────
help-msg-echo =   @alias                       عرض DID المُحلَّل (لا رسالة مرسلة)
help-msg-send =   @alias[:verb] body           إرسال رسالة / RPC إلى ممثل
help-msg-fragment =   @alias#fragment[:verb] body  إرسال مع مقطع DID صريح
help-msg-escape =   \@name                       @name حرفياً (بلا بحث عن اسم مستعار)

# ── المساعدة — وضع التركيز ────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       التركيز على ممثل (يغير المحث)
help-focus-clear =   .use                         مسح التركيز

# ── المساعدة — قواعد الضبط ────────────────────────────────────────────────
help-config-get =   .path                        الحصول على قيمة ورقة أو سرد الشجرة الفرعية
help-config-filter =   .path value                  تصفية بالقيمة
help-config-set =   .path: value                 تعيين قيمة ورقة
help-config-delete =   .path:                       حذف ورقة أو شجرة فرعية
help-config-verb =   .path:verb [args]            استدعاء فعل محلي

# ── المساعدة — المسارات الشائعة ──────────────────────────────────────────
help-my =   .my                          عرض جميع الضبط الشخصي
help-aliases =   .my.aliases                  قائمة الأسماء المستعارة
help-aliases-set =   .my.aliases.<name>: <did>    إضافة/تحديث اسم مستعار
help-aliases-del =   .my.aliases.<name>:          إزالة اسم مستعار
help-runtime-discover =   .my.ma:discover          اكتشاف وقت التشغيل المحلي وإنشاء @ma
help-runtime-claim =   .my.ma:claim             المطالبة بملكية وقت التشغيل
help-identity =   .my.identity                 عرض ضبط الهوية
help-identity-did =   .my.identity.did             عرض DID الخاص (للقراءة فقط)
help-identity-publish =   .my.identity:publish @pub    نشر DID عبر خدمة النشر
help-config-path =   .config                      عرض جميع إدخالات .config.*

# ── المساعدة — صندوق الوارد ──────────────────────────────────────────────
help-inbox =   .my.inbox                    سرد صندوق الوارد (عرض الشجرة الفرعية)
help-inbox-n =   .my.inbox.N                  عرض حقول الإدخال N
help-inbox-from =   .my.inbox.N.from             DID مرسل الإدخال N
help-inbox-reply =   .my.inbox.N:reply [body]     إرسال رد (بلا نص — يفتح المحرر)
help-inbox-open =   .my.inbox.N:open             فتح المحتوى للقراءة فقط في المحرر
help-inbox-del =   .my.inbox.N:                 حذف الإدخال N
help-inbox-delall =   .my.inbox:                   حذف جميع إدخالات صندوق الوارد
help-inbox-flush =   .my.inbox:flush              طباعة جميع الإدخالات في الطرفية
help-inbox-traverse =   .my.inbox.N.sender.<field>   استعراض مستند DID المرسل بشكل كسول

# ── المساعدة — المستندات ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           فتح المحرر بالمحتوى المحفوظ
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     جلب CID وفتحه للمراجعة فقط
help-doc-eval =   .my.doc.<name>:eval           تشغيل المحتوى المحفوظ سطراً سطراً
help-doc-publish =   .my.doc.<name>:publish @pub   تخزين كبيانات خام (أي نوع)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  تخزين YAML كعقدة IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    استيراد محتوى CID (بلا تشغيل)
help-doc-cid =   .my.doc.<name>:cid            عرض CID المخزَّن
help-doc-del =   .my.doc.<name>:              حذف المستند

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = اللغات المتاحة (عيّن بـ .my.i18n: <code>):
err-lang-not-found = اللغة غير موجودة: { $lang }
