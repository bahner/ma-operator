# zion — বাংলা
lang-name = বাংলা
label-nick = ডাকনাম
new-identity-nick-help = 間-space-এর জন্য একটি ডাকনাম বেছে নিন। এটি শুধু একটি ডাকনাম, যেকোনো সময় বদলানো যায়।
error-nick-required = ডাকনাম প্রয়োজন
error-nick-invalid = ডাকনামে ফাঁকা স্থান বা @ থাকতে পারবে না

# ── লগইন পাতা ─────────────────────────────────────────────────────────────
tab-login = লগ ইন
tab-new-identity = নতুন পরিচয়
tab-import-profile = প্রোফাইল আমদানি
label-passphrase = পাসফ্রেজ
label-username = ব্যবহারকারীর নাম
label-confirm-passphrase = পাসফ্রেজ নিশ্চিত করুন
label-did = DID
label-profile-cid = প্রোফাইল CID
label-or-file = অথবা ফাইল
btn-login = লগ ইন করুন
btn-export = রপ্তানি
btn-generate = তৈরি করুন
btn-new-endpoint = নতুন এন্ডপয়েন্ট
btn-import-profile = প্রোফাইল আমদানি
btn-show-qr = QR দেখান
btn-scan-qr = QR স্ক্যান করুন
qr-scan-hint = ক্যামেরাটি একটি zion প্রোফাইল QR কোডের দিকে তাক করুন।
qr-error-camera = ক্যামেরা পাওয়া যাচ্ছে না: { $e }
qr-error-too-large = প্রোফাইলটি QR কোডের জন্য খুব বড়
passphrase-warning = পাসফ্রেজ হারিয়ে গেলে পরিচয় হারিয়ে যাবে। পুনরুদ্ধার সম্ভব নয়।
import-profile-help = CID বা ফাইলের মাধ্যমে প্রোফাইল আমদানি করুন। প্রকাশ করার সময় ব্যবহৃত পাসফ্রেজ প্রয়োজন।
import-profile-detected-user = প্রোফাইলটি { $name }-এর
status-unlocking = আনলক হচ্ছে...
status-generating = পরিচয় তৈরি হচ্ছে...
status-reading-file = ফাইল পড়া হচ্ছে...
status-fetching-profile = IPFS থেকে প্রোফাইল আনা হচ্ছে...
status-imported = '{ $name }' আমদানি করা হয়েছে — লগইন ট্যাবে যান
status-importing-profile = প্রোফাইল আমদানি হচ্ছে...
profile-import-done = '{ $name }'-এর জন্য প্রোফাইল আমদানি হয়েছে — { $n }টি কী লোড হয়েছে
error-wrong-passphrase = ভুল পাসফ্রেজ: { $e }
error-identity-not-found = পরিচয় '{ $name }' পাওয়া যায়নি
error-username-required = ব্যবহারকারীর নাম প্রয়োজন
error-passphrase-required = পাসফ্রেজ প্রয়োজন
error-passphrases-no-match = পাসফ্রেজ মিলছে না
error-profile-source-required = একটি CID দিন বা ফাইল আপলোড করুন
error-did-required = আপনার DID লিখুন
error-profile-fetch = প্রোফাইল আনা সম্ভব হয়নি: { $e }
error-profile-no-username = প্রোফাইলে কোনো ব্যবহারকারীর নাম নেই
error-profile-no-identity = পরিচয় '{ $name }' পাওয়া যায়নি — প্রথমে পরিচয় আমদানি করুন

# ── টার্মিনাল সিস্টেম বার্তা ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } হিসেবে লগ ইন করা হয়েছে
msg-type-help = কমান্ড তালিকার জন্য .help টাইপ করুন।
msg-getting-started = শুরু করতে চেষ্টা করুন: say Hello world, look, .help, অথবা help।
msg-connecting = iroh-এ সংযুক্ত হচ্ছে...
msg-iroh-ready = iroh এন্ডপয়েন্ট প্রস্তুত
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID স্থানীয় 間 ({ $url }) এর মাধ্যমে প্রকাশিত হয়েছে
msg-identity-publication-propagating = পরিচয় প্রকাশনা এখনও ছড়াচ্ছে; entry বিলম্বিত: { $e }
msg-identity-first-publish = প্রথমবারের মতো পরিচয় প্রকাশ করা হচ্ছে। এতে সর্বোচ্চ { $seconds } সেকেন্ড লাগতে পারে।
msg-ma-connecting-matrix = আপনাকে 間trix-এ যুক্ত করার চেষ্টা চলছে
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = স্থানীয় 間 দাবি করা হয়েছে
msg-local-ma-already-claimed = স্থানীয় 間 ইতিমধ্যে দাবি করা হয়েছে
msg-local-ma-claim-failed = স্থানীয় 間 দাবি করা যায়নি
msg-identity-not-published = পরিচয় অনলাইনে পাওয়া যায়নি — যদি 間 স্থানীয়ভাবে ইনস্টল থাকে, '.ma [port]' তারপর '.my.identity!publish @ma' চালান। বিস্তারিত জানতে '.help/publish' লিখুন।
msg-blocked = ⊗ অবরুদ্ধ [{ $cap }]: { $from }
msg-focus-cleared = ফোকাস সরানো হয়েছে
msg-left = left
msg-focusing = { $did }-কে { $prompt } হিসেবে ফোকাস করা হচ্ছে
msg-set = { $path }: { $value }
msg-deleted = { $path } মুছে ফেলা হয়েছে ({ $count } এন্ট্রি)
msg-read-only = { $path } শুধুমাত্র পঠনযোগ্য
msg-subtree-set = { $path } একটি সাবট্রি; সেট করতে অস্বীকার করা হয়েছে
msg-ancestor-leaf = { $path }-এর একটি পূর্বপুরুষ লিফ; ছায়া দিতে অস্বীকার করা হয়েছে
msg-key-not-found = কী পাওয়া যায়নি: { $path }
msg-link-not-connected = লিঙ্ক ফেচ ত্রুটি: সংযুক্ত নেই
msg-link-fetch-error = লিঙ্ক ফেচ ত্রুটি: { $e }
msg-link-key-not-found = লিঙ্ক করা ডকুমেন্টে `{ $key }` কী পাওয়া যায়নি

# ── উপনাম যাচাইকরণ ────────────────────────────────────────────────────────
err-alias-name-empty = উপনামের নাম খালি হতে পারবে না
err-alias-has-dot = উপনামে '.' থাকতে পারবে না
err-alias-has-fragment = উপনামে '#' থাকতে পারবে না
err-alias-value-fragment = উপনামের মানে সর্বোচ্চ একটি অ-খালি DID-URL ফ্র্যাগমেন্ট থাকতে পারে
err-alias-value-path = উপনামের মান did:ma:<ipns> DID অথবা DID-URL হতে হবে (কোনো path নয়)
err-alias-not-did = উপনামের মান did:ma: দিয়ে শুরু হতে হবে
err-unknown-alias = অজানা উপনাম: @{ $name }
err-bare-did = bare did:ma:<ipns> (কোনো ফ্র্যাগমেন্ট বা পথ নেই) প্রত্যাশিত, পাওয়া গেছে { $did }

# ── সম্পাদক ───────────────────────────────────────────────────────────────
btn-save = সংরক্ষণ
btn-eval = চালান
btn-cancel = বাতিল
msg-jobs-cancelled = কাজগুলো বাতিল হয়েছে
btn-close = বন্ধ করুন
btn-reply = উত্তর দিন
btn-publish = প্রকাশ করুন
btn-publish-ipld = প্রকাশ করুন IPLD
msg-reply-sent = উত্তর পাঠানো হয়েছে
msg-reply-failed = উত্তর ব্যর্থ: { $e }
msg-entity-publish-sent = সত্তা { $name }: প্রকাশনা পাঠানো হয়েছে
msg-entity-publish-failed = সত্তা প্রকাশনা ব্যর্থ: { $e }
msg-kind-publish-failed = kind প্রকাশ ব্যর্থ হয়েছে: { $e }
msg-field-publish-sent = সত্তা { $name }.{ $field }: প্রকাশনা পাঠানো হয়েছে
msg-field-publish-failed = ফিল্ড প্রকাশনা ব্যর্থ: { $e }
msg-acl-publish-sent = রানটাইম ACL: প্রকাশনা পাঠানো হয়েছে
msg-crud-edit-publish-sent = { $path }: প্রকাশনা পাঠানো হয়েছে
msg-acl-publish-failed = রানটাইম ACL প্রকাশনা ব্যর্থ: { $e }
msg-yaml-error = YAML ত্রুটি: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } আনা হয়েছে — চালানোর আগে পর্যালোচনা করুন
msg-fetch-failed = ফেচ { $cid }: { $e }

# ── ক্রিয়া — ইনবক্স ──────────────────────────────────────────────────────
inbox-empty = ইনবক্স খালি
inbox-entry-not-found = ইনবক্স এন্ট্রি { $n } পাওয়া যায়নি
inbox-no-message-id = ইনবক্স এন্ট্রি { $n }-এ message_id নেই
inbox-no-verb = ইনবক্স এন্ট্রি { $n }-এর জন্য `{ $verb }` ক্রিয়া নেই
inbox-filter-no-arg = ফিল্টারের জন্য DID বা ছদ্মনাম প্রয়োজন
inbox-filter-empty = { $did } থেকে কোনো বার্তা নেই

# ── ক্রিয়া — রানটাইম ─────────────────────────────────────────────────────
discover-fetch-failed = { $url }-এ আবিষ্কার ব্যর্থ: { $e }
discover-json-error = আবিষ্কার ব্যর্থ: { $url } থেকে অবৈধ JSON: { $e }
discover-missing-did = আবিষ্কার ব্যর্থ: status.json-এ `did` ফিল্ড নেই
discover-invalid-did = আবিষ্কার ব্যর্থ: `did` did:ma: দিয়ে শুরু হওয়ার প্রত্যাশা ছিল, পাওয়া গেছে `{ $did }`
discover-no-endpoint = আবিষ্কার সতর্কতা: status.json-এ `endpoint_id` নেই; শুধুমাত্র DID সংরক্ষিত
discover-hint-endpoint-not-found = ইঙ্গিত: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = ইঙ্গিত: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = ইঙ্গিত: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = ইঙ্গিত: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url }-এ 間 আবিষ্কৃত হয়েছে
discover-did-line = DID: { $did }
discover-alias-hint =   ছদ্মনাম @ma তৈরি হয়েছে — আপনার পরিচয় প্রকাশ করতে '.my.identity!publish @ma' চালান।
claim-success = { $did }-এর জন্য রানটাইম দাবি করা হয়েছে
claim-conflict = রানটাইম ইতিমধ্যে অন্য পরিচয় দ্বারা দাবি করা হয়েছে
claim-already-owned = রানটাইম ইতিমধ্যে এই পরিচয় দ্বারা দাবি করা হয়েছে
claim-http-failed = দাবি ব্যর্থ: HTTP { $status }
claim-error = দাবি ব্যর্থ: { $e }
claim-no-session = লগ ইন করা নেই; রানটাইম দাবি করতে আগে লগ ইন করুন
runtime-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── ক্রিয়া — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl রিসেট করা হয়েছে (সম্পূর্ণ খোলা)
acl-persist-error = সংরক্ষণ ত্রুটি: { $e }
acl-no-verb = .my.acl-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── ক্রিয়া — পরিচয় ───────────────────────────────────────────────────────
publish-usage = ব্যবহার: .my.identity!publish <did-বা-উপনাম>
identity-exported = { $filename } হিসেবে বান্ডেল ডাউনলোড হয়েছে
identity-export-failed = রপ্তানি ব্যর্থ হয়েছে: { $e }

# ── ক্রিয়া — ডকুমেন্ট ────────────────────────────────────────────────────
doc-content-empty = { $path }.content খালি
doc-save-first = { $path }.content খালি — আগে সংরক্ষণ করুন
doc-missing-name = ডকুমেন্টের নাম নেই
doc-publish-usage = ব্যবহার: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = ব্যবহার: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = প্রকাশনা { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = প্রকাশ ব্যর্থ [{ $code }]: { $err }
doc-publish-error-hint = ইঙ্গিত: { $hint }
doc-publish-hint-session = আবার লগ ইন করুন যাতে অহং আপনার পরিচয় কীগুলি অ্যাক্সেস করতে পারে
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = যাচাই করুন প্রকাশক DID নথি প্রকাশিত হয়েছে এবং একটি পৌঁছানো যায় এমন এন্ডপয়েন্ট রয়েছে৷
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = রানটাইম/প্লাগইন অনুরোধ প্রত্যাখ্যান করেছে; কারণটি পরীক্ষা করুন এবং সত্তা/রানটাইম ঠিক করার পরে পুনরায় চেষ্টা করুন
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = বিস্তারিত কারণের জন্য রানটাইম লগ পরিদর্শন করুন এবং পুনরায় চেষ্টা করুন
doc-store-sent = সংরক্ষণ অনুরোধ পাঠানো হয়েছে ({ $id }) → { $publisher }; CID RPC উত্তরের মাধ্যমে আসবে
doc-ipld-store-sent = IPLD সংরক্ষণ অনুরোধ পাঠানো হয়েছে ({ $id }) → { $publisher }; CID RPC উত্তরের মাধ্যমে আসবে
doc-fetch-done = { $cid } আনা হয়েছে → { $path }.content (চালানো হয়নি)
doc-fetch-failed = ফেচ { $cid }: { $e }
doc-fetch-usage = ব্যবহার: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid সেট করা নেই
doc-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই
path-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── সহায়তা — শিরোনাম ─────────────────────────────────────────────────────
help-header-zion = ── zion কমান্ড ────────────────────────────────────────────────────────────
help-header-messaging = ── বার্তাপ্রেরণ ────────────────────────────────────────────────────────────
help-header-config = ── স্থানীয় কনফিগ ব্যাকরণ ──────────────────────────────────────────────
help-header-common = ── সাধারণ পথ ─────────────────────────────────────────────────────────────
help-header-inbox = ── ইনবক্স ────────────────────────────────────────────────────────────────
help-header-documents = ── ডকুমেন্ট ──────────────────────────────────────────────────────────────
help-header-i18n = ── ভাষা ───────────────────────────────── ──────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-স্পেসে প্রবেশ করা ───────────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── সহায়তা — zion কমান্ড ─────────────────────────────────────────────────
help-cmd-help =   .help                        এই পাঠ্য
help-cmd-clear =   .clear                       টার্মিনাল পরিষ্কার করুন
help-cmd-panic =   .panic                       শেষ অবলম্বন — সমস্যায় ব্যবহার করুন
help-cmd-history =   .history                     কমান্ড ইতিহাস (ক্রমাগত পুনরাবৃত্তি একত্রিত)
help-cmd-logout =   .logout                      লগ আউট
help-cmd-batch =   .batch                       scratch दस्तावेज़ समानांतर चलाएँ
help-cmd-batch-sync =   .batch:sync / .batch         scratch दस्तावेज़ पंक्ति-दर-पंक्ति चलाएँ

# ── সহায়তা — বার্তাপ্রেরণ ────────────────────────────────────────────────
help-msg-echo =   @alias                       সমাধান করা DID/DID-URL দেখান (কোনো বার্তা পাঠানো হয় না)
help-msg-send =   @alias!msg body / @alias:verb args           অভিনেতাকে বার্তা / RPC পাঠান
help-msg-fragment =   @alias#fragment:verb body  স্পষ্ট DID ফ্র্যাগমেন্ট সহ পাঠান
help-msg-escape =   \@name                       আক্ষরিক @name (কোনো উপনাম অনুসন্ধান নেই)

# ── সহায়তা — ফোকাস মোড ───────────────────────────────────────────────────

# ── সহায়তা — কনফিগ ব্যাকরণ ──────────────────────────────────────────────
help-config-get =   .path                        লিফ মান পান বা সাবট্রি তালিকা করুন
help-config-filter =   .path [নাম]                 নাম ধারণকারী চাইল্ড-কীর নাম তালিকাভুক্ত করুন
help-config-full =   .path. [নাম]                নাম ধারণকারী সম্পূর্ণ সাবট্রি মান তালিকাভুক্ত করুন
help-config-set =   .path: value                 লিফ সেট করুন
help-config-delete =   .path:                       লিফ বা সাবট্রি মুছুন
help-config-verb =   .path!verb [args]            স্থানীয় ক্রিয়া কল করুন

# ── সহায়তা — সাধারণ পথ ───────────────────────────────────────────────────
help-my =   .my                          সমস্ত ব্যক্তিগত কনফিগ দেখান
help-aliases =   .my.aliases                  উপনামের তালিকা
help-aliases-set =   .my.aliases.<name>: <did-url>    উপনাম যোগ/হালনাগাদ করুন (DID অথবা DID-URL)
help-aliases-del =   .my.aliases.<name>:          উপনাম মুছুন
help-runtime-discover =   .ma [port]          স্থানীয় রানটাইম আবিষ্কার করুন এবং @ma তৈরি করুন
help-runtime-claim =   .ma [port]             আপনার DID দিয়ে রানটাইম দাবি করুন
help-identity =   .my.identity                 পরিচয় কনফিগ দেখান
help-identity-did =   .my.identity.did             নিজের DID দেখান (শুধুমাত্র পঠনযোগ্য)
help-identity-publish =   .my.identity!publish @pub    প্রকাশনা সেবার মাধ্যমে DID প্রকাশ করুন
help-identity-export =   .my.identity!export          নিজের পরিচয় বান্ডেল ডাউনলোড করুন
help-config-path =   .config                      সমস্ত .config.* এন্ট্রি দেখান

# ── সহায়তা — ইনবক্স ──────────────────────────────────────────────────────
help-inbox =   .my.inbox                    ইনবক্সের তালিকা (সাবট্রি দৃশ্য)
help-inbox-n =   .my.inbox.N                  এন্ট্রি N-এর ফিল্ড দেখান
help-inbox-from =   .my.inbox.N.from             এন্ট্রি N-এর প্রেরক DID
help-inbox-reply =   .my.inbox.N!reply [body]     উত্তর পাঠান (কোনো মূল অংশ নেই — সম্পাদক খোলে)
help-inbox-open =   .my.inbox.N!open             শুধুমাত্র পড়ার জন্য সম্পাদকে বিষয়বস্তু খুলুন
help-inbox-del =   .my.inbox.N:                 এন্ট্রি N মুছুন
help-inbox-delall =   .my.inbox:                   সমস্ত ইনবক্স এন্ট্রি মুছুন
help-inbox-flush =   .my.inbox!flush              সমস্ত এন্ট্রি টার্মিনালে প্রিন্ট করুন
help-inbox-filter =   .my.inbox!filter @who        @who থেকে কেবল এন্ট্রি দেখাও
help-inbox-traverse =   .my.inbox.N.sender.<field>   প্রেরক DID ডকুমেন্ট অলস অন্বেষণ

# ── সহায়তা — ডকুমেন্ট ───────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           সংরক্ষিত বিষয়বস্তু দিয়ে সম্পাদক খুলুন
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID আনুন, শুধুমাত্র পর্যালোচনার জন্য খুলুন
help-doc-eval =   .my.doc.<name>!eval           সংরক্ষিত বিষয়বস্তু লাইন-বাই-লাইন চালান
help-doc-publish =   .my.doc.<name>!publish @pub   কাঁচা blob হিসেবে সংরক্ষণ করুন
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML-কে DAG-CBOR IPLD নোড হিসেবে সংরক্ষণ করুন
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID বিষয়বস্তু আমদানি করুন (চালানো হয় না)
help-doc-cid =   .my.doc.<name>!cid            সংরক্ষিত CID দেখান
help-doc-del =   .my.doc.<name>:              ডকুমেন্ট মুছুন

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n আপনার পরিচয়ের সাথে সংযুক্ত ভাষা পছন্দ সংরক্ষণ করে।
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               উপলব্ধ ভাষা কোড তালিকা

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 ঘর হলো 間 পরিচয়গুলোর মাঝের স্থান। ma এই পরিচয়গুলোকে একে অন্যকে খুঁজে পেতে ও যোগাযোগ করতে সাহায্য করে; তোমার পরিচয় প্রকাশিত হলে তুমি অংশ নিতে পারবে।
help-ma-command =   .ma [port]                   স্থানীয় 間 runtime-এ যুক্ত হও, /status.json পড়ো, এবং .ma.ctx.* সংরক্ষণ করো
help-ma-publish =   .my.identity!publish @ma     তোমার DID নথি প্রকাশ করো, যাতে অন্যরা তোমার key ও endpoint খুঁজে পায়
help-ma-security = সবচেয়ে পরিষ্কার trust boundary হলো নিজের 間 runtime, নিজের IPFS Desktop/Kubo সহ। দূরের publisher কাজে লাগতে পারে, কিন্তু তখন তুমি অন্য কারও সেবার ওপর নির্ভর করছ।
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             কীভাবে 間 ঘরে প্রবেশ করবে

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = তোমার পরিচয় পরিচিত হলে .enter @ma তোমাকে 間-এ প্রবেশ করতে দেয়। একটি world খুঁজে নাও, তাতে ঢুকো, আর সেখান থেকে অংশ নাও।
help-ma-entry-steps = IPFS Desktop ও ma চালু করো, তারপর .ma চালাও। .my.identity!publish @ma দিয়ে প্রকাশ করো, একটি world খুঁজে নাও, এবং .enter @ma দিয়ে প্রবেশ করো।
help-ma-entry-command =   .enter @ma                  @ma runtime দিয়ে 間-এ প্রবেশ করো
help-ma-entry-toggle =   .enter                       ঘরের ফোকাস চালু বা বন্ধ করো; তোমার পরিচয় সক্রিয় থাকে
help-ma-entry-url =   ?enter=<runtime>             শেয়ার করা URL থেকে লগইনের পর প্রবেশ করো

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = উপলব্ধ ভাষা (.my.i18n: <code> দিয়ে সেট করুন):
err-lang-not-found = ভাষা পাওয়া যায়নি: { $lang }

msg-send-failed = পাঠাতে ব্যর্থ: { $e }
msg-not-logged-in = লগইন করা হয়নি

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML পার্স ত্রুটি: { $e }
yaml-not-mapping = YAML একটি ম্যাপিং (কী: মান জোড়া) হতে হবে; সাদা টেক্সট এবং স্কেলার DAG-CBOR হিসাবে সংরক্ষণ করা যাবে না
dagcbor-encode-error = DAG-CBOR এনকোড ত্রুটি: { $e }
cbor-decode-error = CBOR ডিকোড ত্রুটি: { $e }
cbor-json-error = CBOR থেকে JSON রূপান্তর ত্রুটি: { $e }
yaml-serialise-error = YAML সিরিয়ালাইজ ত্রুটি: { $e }
edit-reply-invalid = অবৈধ সম্পাদনা উত্তর
doc-publish-ipld-error = IPLD প্রকাশ ব্যর্থ: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ইনবক্স ছাঁটাই সংরক্ষণ ত্রুটি: { $e }
err-config-load = কনফিগারেশন লোড ত্রুটি: { $e }
err-lang-persist = ভাষা সংরক্ষণ ত্রুটি: { $e }
err-history-parse = ইতিহাস পার্স ত্রুটি: { $e }
err-history-load = ইতিহাস লোড ত্রুটি: { $e }
err-ipfs-reply-decode = IPFS উত্তর ডিকোড ব্যর্থ: { $e }
err-edit-cbor = CBOR সম্পাদনা ত্রুটি: { $e }
err-popup-blocked = পপআপ ব্রাউজার দ্বারা অবরুদ্ধ
status-publishing = প্রকাশিত হচ্ছে

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ত্রুটি
rpc-error-detail = ত্রুটি: { $detail }
msg-new-message = ← [{ $from }] নতুন বার্তা — { $count } ইনবক্সে
msg-chat = { $sender } বলে { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } বলে { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ঘরে ঢুকল।
room-leave = * { $name } ঘর ছেড়ে গেল।
room-drop  = * { $name } { $thing } ফেলল।
room-take  = * { $name } { $thing } তুলল।
err-edit-decode-failed = সম্পাদনা ডিকোড ব্যর্থ: { $e }
err-edit-fetch-failed = সম্পাদনা আনয়ন ব্যর্থ: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = কোনো সক্রিয় সেশন নেই — প্রোফাইল মুছে ফেলা সম্ভব নয়
profile-delete-error = প্রোফাইল মুছতে ব্যর্থ হয়েছে: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = প্রোফাইল এনক্রিপ্ট করে IPFS-এ পাঠানো হয়েছে; CID এলে DID নথি আপডেট হবে
profile-publish-done = প্রোফাইল প্রকাশিত হয়েছে — DID নথি ma.agent CID দিয়ে আপডেট হয়েছে
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = পরিচয় ইতিমধ্যেই প্রকাশিত হয়েছে — প্রোফাইল আপ টু ডেট
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = বাইনারি বিষয়বস্তু (প্রদর্শিত নয়)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (কিছু নেই)
profiles-deleted = প্রোফাইল { $name } মুছে ফেলা হয়েছে
profiles-not-found = প্রোফাইল পাওয়া যায়নি: { $name }

# -- Help topics index
help-header-topics = -- विषय -- विवरण के लिए .help/<topic> लिखें
help-topic-msg =   .help/msg                    संदेश
help-topic-ma = .help/ma                     間-স্থান, প্রকাশনা, এবং এন্ট্রি
help-topic-path = .help/path                   স্থানীয় ডট-পাথ ব্যাকরণ
help-topic-my =   .help/my                     निजी config
help-topic-inbox =   .help/inbox                  इनबॉक्स
help-topic-doc =   .help/doc                    दस्तावेज़
help-topic-actor =   .help/actor                  दूरस्थ actor
help-topic-zscheme =   .help/zscheme               ইনলাইন Scheme এক্সপ্রেশন ও নথি
help-unknown-topic =   .help/{ $topic }: अज्ञात विषय

# -- Help actor section
help-header-actor = -- दूरस्थ actor
help-actor-echo =   @actor                       हल किया DID दिखाएँ
help-actor-text = @actor[#entity]!msg|!say|!emote body         সরাসরি/চ্যাট/ইমোট বার্তা পাঠান
help-actor-ping = @actor:ping                  সজীবতা পিং
help-actor-entities =   @actor/entities              entity सूचीबद्ध करें
help-actor-entities-get = @actor/entities/<n>          সত্তা নোড পান
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity संपादित करें
help-actor-entities-del = @actor/entities/<n>:         সত্তা মুছে ফেলুন
help-actor-config-get =   @actor/config/<key>          config मान लें
help-actor-config-set =   @actor/config/<key>: val     config मान सेट करें
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL संपादित करें
help-actor-fragment =   @actor#entity                plugin को भेजें
help-actor-fragment-verb =   @actor#entity:verb [args]    plugin को RPC
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  সেশন পরিবেশে 5 উত্তর রাখুন
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    URL লিঙ্কের মাধ্যমে zion খোলা
help-topic-i18n = .help/i18n                   আপনার পরিচয়ের জন্য ভাষা পছন্দ
help-header-url = ── URL প্যারামিটার ────────────────────────────────────────────────────────────────
help-url-intro =   পূর্বভরণকৃত প্রাপকসহ zion খোলার লিঙ্ক শেয়ার করুন:
help-url-msg =   ?msg=<did>                   পূর্বভরণ: @<did>!msg (সাধারণ বার্তা)
help-url-say =   ?say=<did>                   পূর্বভরণ: @<did>!say (say ক্রিয়া)
help-url-emote =   ?emote=<did>                 পূর্বভরণ: @<did>!emote (emote ক্রিয়া)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             লগইন করার পরে রানটাইম জগতে প্রবেশ করুন
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ইনপুট পূর্বভরণ করা হয়েছে কিন্তু পাঠানো হয়নি — পাঠাতে Enter চাপুন।
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                নেটওয়ার্কে পরিচয় প্রকাশ করুন
help-header-publish = ── পরিচয় প্রকাশ ────────────────────────────────────────────────────────────
help-publish-intro = প্রকাশ করলে আপনার পরিচয় নেটওয়ার্কে খুঁজে পাওয়া যায়। অন্যরা আপনার DID অনুসন্ধান করে যোগাযোগ করতে পারবে।
help-publish-ma = প্রকাশ করতে 間 (স্থানীয় রানটাইম) ইনস্টল করা দরকার। এটি আপনার হয়ে ego-কে IPFS/IPNS-এর সাথে সংযুক্ত করে।
help-publish-steps = ধাপ: স্থানীয় ma সনাক্ত করতে '.ma [port]' চালান, তারপর '.my.identity!publish @ma'।
help-publish-without = প্রকাশ না করলে অন্যরা আপনার কাছে পৌঁছাতে পারবে না — DID জানলেও তারা আপনার endpoint খুঁজে বের করতে পারবে না।
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = একটি প্রোফাইলের নাম দিন: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = ব্যাচ সংগ্রহ করা — টাইপ কমান্ড, .batch দিয়ে শেষ করুন
batch-already-collecting = ইতিমধ্যেই একটি ব্যাচ সংগ্রহ করা হচ্ছে — প্রথমে .batch দিয়ে শেষ করুন
batch-empty = ব্যাচ খালি ছিল - চালানোর কিছু নেই
batch-running = batch चल रहा है…
batch-step-timeout = ব্যাচ ধাপ সময় শেষ

batch-done = batch { $secs }s में पूरा — { $steps } चरण
batch-done-error = batch त्रुटियों के साथ { $secs }s में पूरा — { $steps } चरण
msg-timeout = संदेश समयसीमा पार (60s में कोई उत्तर नहीं)
err-unknown-command = অজানা কমান্ড: { $path }
err-read-only-path = { $path } শুধু-পাঠযোগ্য
help-cmd-batch-async =   .batch:async / .batch        scratch दस्तावेज़ समानांतर चलाएँ


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } আনতে ব্যর্থ: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = বৈধ CID নয়: { $value }
label-runtime = মা
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = সতর্কতা: পরিচয় প্রকাশের জন্য আপনার IPNS ব্যক্তিগত কী এই রানটাইমে পাঠানো হবে। শুধুমাত্র এমন রানটাইম ব্যবহার করুন যার উপর আপনি সম্পূর্ণ বিশ্বাস রাখেন।

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme zion কমান্ডের ভিতরে থাকা Scheme এক্সপ্রেশন মূল্যায়ন করে এবং পাঠানোর আগে ফলাফলটি লাইনে বসিয়ে দেয়।
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ইনলাইন উদাহরণ; "say 7 + 5 = 12" পাঠায়
help-zscheme-define =   (define x 12)             বর্তমান লগইন সেশনে সংজ্ঞাগুলি থাকে
help-zscheme-doc = নথি: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = স্থানীয় IPFS গেটওয়ে (ব্রাউজার ব্যতিক্রম প্রয়োজন)

tab-config = সেটিংস
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
