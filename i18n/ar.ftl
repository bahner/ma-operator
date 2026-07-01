# zion — العربية
lang-name = العربية

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
msg-connecting = جارٍ الاتصال بـ iroh...
msg-iroh-ready = نقطة نهاية iroh جاهزة
msg-iroh-failed = iroh: { $e }
msg-auto-published = تم نشر DID عبر ma المحلي ({ $url })
msg-identity-not-published = لم يُعثر على الهوية عبر الإنترنت — إن كان ma مثبتاً محلياً، شغّل '.ma [port]' ثم '.my.identity!publish @ma'. اكتب '.help.publish' للتفاصيل.
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
err-alias-has-dot = لا يمكن أن تحتوي الأسماء المستعارة على '.'
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
discover-success = تم اكتشاف ma في { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   تم إنشاء الاسم المستعار @ma — شغّل '.my.identity!publish @ma' لنشر هويتك.
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
publish-usage = الاستخدام: .my.identity!publish <did-أو-اسم-مستعار>
identity-exported = تم تنزيل الحزمة باسم { $filename }
identity-export-failed = فشل التصدير: { $e }

# ── الأفعال — المستندات ───────────────────────────────────────────────────
doc-content-empty = { $path }.content فارغ
doc-save-first = { $path }.content فارغ — احفظ أولاً
doc-missing-name = اسم المستند مفقود
doc-publish-usage = الاستخدام: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = الاستخدام: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = نشر { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = تم إرسال طلب التخزين ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-ipld-store-sent = تم إرسال طلب تخزين IPLD ({ $id }) → { $publisher }؛ سيصل CID عبر رد RPC
doc-fetch-done = تم جلب { $cid } → { $path }.content (لم يُنفَّذ)
doc-fetch-failed = جلب { $cid }: { $e }
doc-fetch-usage = الاستخدام: .my.doc.<name>!fetch <cid>
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
help-cmd-history =   .history                     سجل الأوامر (التكرارات المتتالية مدمجة)
help-cmd-logout =   .logout                      تسجيل الخروج
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

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
help-config-verb =   .path!verb [args]            استدعاء فعل محلي

# ── المساعدة — المسارات الشائعة ──────────────────────────────────────────
help-my =   .my                          عرض جميع الضبط الشخصي
help-aliases =   .my.aliases                  قائمة الأسماء المستعارة
help-aliases-set =   .my.aliases.<name>: <did>    إضافة/تحديث اسم مستعار
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
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     جلب CID وفتحه للمراجعة فقط
help-doc-eval =   .my.doc.<name>!eval           تشغيل المحتوى المحفوظ سطراً سطراً
help-doc-publish =   .my.doc.<name>!publish @pub   تخزين كبيانات خام (أي نوع)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  تخزين YAML كعقدة IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch <cid>    استيراد محتوى CID (بلا تشغيل)
help-doc-cid =   .my.doc.<name>!cid            عرض CID المخزَّن
help-doc-del =   .my.doc.<name>:              حذف المستند

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
yaml-serialize-error = خطأ في تسلسل YAML: { $e }
edit-reply-invalid = رد تعديل غير صالح
doc-publish-ipld-error = فشل نشر IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = خطأ في حفظ تنظيف البريد الوارد: { $e }
err-config-load = خطأ في تحميل الإعداد: { $e }
err-lang-persist = خطأ في حفظ اللغة: { $e }
err-history-parse = خطأ في تحليل السجل: { $e }
err-history-load = خطأ في تحميل السجل: { $e }
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
profiles-empty = (لا شيء)
profiles-deleted = تم حذف الملف الشخصي { $name }
profiles-not-found = الملف الشخصي غير موجود: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    فتح zion عبر رابط URL
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities.<n>          get entity
help-actor-entities-set =   @actor.entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities.<n>!edit     edit entity
help-actor-entities-del =   @actor.entities.<n>:         delete entity
help-actor-config-get =   @actor.config.<key>          get config value
help-actor-config-set =   @actor.config.<key>: val     set config value
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
help-header-url = ── معاملات URL ─────────────────────────────────────────────────────────────
help-url-intro =   شارك رابطاً يفتح zion مع مستلم مملوء مسبقاً:
help-url-msg =   ?msg=<did>                   يملأ مسبقاً: @<did> (رسالة نصية)
help-url-say =   ?say=<did>                   يملأ مسبقاً: @<did>:say (فعل say)
help-url-emote =   ?emote=<did>                 يملأ مسبقاً: @<did>:emote (فعل emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   الحقل يُملأ مسبقاً لكنه لا يُرسل — اضغط Enter للإرسال.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                نشر هويتك على الشبكة
help-header-publish = ── نشر الهوية ───────────────────────────────────────────────────────────────
help-publish-intro = النشر يجعل هويتك قابلة للاكتشاف على الشبكة. يمكن للآخرين البحث عن DID الخاص بك للتواصل معك.
help-publish-ma = للنشر تحتاج إلى تثبيت ma (بيئة التشغيل المحلية). تربط ego بـ IPFS/IPNS نيابةً عنك.
help-publish-steps = الخطوات: شغّل '.ma [port]' للكشف عن ma المحلي، ثم '.my.identity!publish @ma'.
help-publish-without = بدون نشر، لا يستطيع الآخرون الوصول إليك — حتى لو عرفوا DID الخاص بك، لا يستطيعون تحليل نقطة النهاية الخاصة بك.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = فشل جلب CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID غير صالح: { $value }
