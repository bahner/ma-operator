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
btn-new-endpoint = نئی اینڈپوائنٹ
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
msg-auto-published = DID مقامی ma ({ $url }) کے ذریعے شائع ہوا
msg-identity-not-published = شناخت آن لائن نہیں ملی — اگر ma مقامی طور پر نصب ہے، تو '.my.ma:discover' چلائیں پھر '.my.identity:publish @ma'۔ تفصیلات کے لیے '.help.publish' ٹائپ کریں۔
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
err-alias-has-dot = عرفی ناموں میں '.' نہیں ہو سکتا
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
discover-success = { $url } پر ma دریافت ہوا
discover-did-line = DID: { $did }
discover-alias-hint =   عرف @ma بنایا گیا — اپنی شناخت شائع کرنے کے لیے '.my.identity:publish @ma' چلائیں۔
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
identity-exported = بنڈل { $filename } کے طور پر ڈاؤن لوڈ ہو گیا
identity-export-failed = برآمد ناکام: { $e }

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
help-cmd-history =   .history                     کمانڈ ہسٹری (مسلسل تکرار ضم ہو گئی)
help-cmd-logout =   .logout                      لاگ آؤٹ
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

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
help-identity-export =   .my.identity:export          اپنا شناختی بنڈل ڈاؤن لوڈ کریں
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
help-inbox-filter =   .my.inbox:filter @who        صرف @who کی اندراجات دکھائیں
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

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML تجزیہ خرابی: { $e }
yaml-not-mapping = YAML ایک mapping (جوڑے کلید: قدر) ہونا چاہیے؛ سادہ متن اور سکیلر DAG-CBOR کے طور پر محفوظ نہیں کیے جا سکتے
dagcbor-encode-error = DAG-CBOR خفیہ کاری خرابی: { $e }
cbor-decode-error = CBOR ڈی کوڈنگ خرابی: { $e }
cbor-json-error = CBOR سے JSON خرابی: { $e }
yaml-serialize-error = YAML سیریلائزیشن خرابی: { $e }
edit-reply-invalid = غلط ترمیم جواب
doc-publish-ipld-error = IPLD اشاعت ناکام: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ان باکس چھانٹنا محفوظ کریں خرابی: { $e }
err-config-load = کنفگریشن لوڈ خرابی: { $e }
err-lang-persist = زبان محفوظ کریں خرابی: { $e }
err-history-parse = تاریخ تجزیہ خرابی: { $e }
err-history-load = تاریخ لوڈ خرابی: { $e }
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
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (کوئی نہیں)
profiles-deleted = پروفائل { $name } حذف کی گئی
profiles-not-found = پروفائل نہیں ملی: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor:entities              list entities
help-actor-entities-get =   @actor:entities.<n>          get entity
help-actor-entities-set =   @actor:entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor:entities.<n>:edit     edit entity
help-actor-entities-del =   @actor:entities.<n>:         delete entity
help-actor-config-get =   @actor:config.<key>          get config value
help-actor-config-set =   @actor:config.<key>: val     set config value
help-actor-acl =   @actor:acl                   get ACL
help-actor-acl-edit =   @actor:acl:edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    URL لنک کے ذریعے zion کھولنا
help-header-url = ── URL پیرامیٹرز ─────────────────────────────────────────────────────────────────
help-url-intro =   ایک لنک شیئر کریں جو پہلے سے بھرے ہوئے وصول کنندہ کے ساتھ zion کھولے:
help-url-msg =   ?msg=<did>                   پہلے سے بھرتا ہے: @<did> (سادہ پیغام)
help-url-say =   ?say=<did>                   پہلے سے بھرتا ہے: @<did>:say (say فعل)
help-url-emote =   ?emote=<did>                 پہلے سے بھرتا ہے: @<did>:emote (emote فعل)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   ان پٹ پہلے سے بھرا ہوا ہے لیکن بھیجا نہیں گیا — بھیجنے کے لیے Enter دبائیں۔
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                نیٹ ورک پر اپنی شناخت شائع کریں
help-header-publish = ── شناخت کی اشاعت ───────────────────────────────────────────────────────────
help-publish-intro = اشاعت آپ کی شناخت کو نیٹ ورک پر قابلِ دریافت بناتی ہے۔ دوسرے آپ کا DID تلاش کر کے آپ سے رابطہ کر سکتے ہیں۔
help-publish-ma = شائع کرنے کے لیے آپ کو ma (مقامی رن ٹائم) نصب چاہیے۔ یہ آپ کی جانب سے ego کو IPFS/IPNS سے جوڑتا ہے۔
help-publish-steps = اقدامات: مقامی ma دریافت کرنے کے لیے '.my.ma:discover' چلائیں، پھر '.my.identity:publish @ma'۔
help-publish-without = اشاعت کے بغیر دوسرے آپ تک نہیں پہنچ سکتے — چاہے وہ آپ کا DID جانتے ہوں، وہ آپ کا endpoint حل نہیں کر سکتے۔
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
