# zion — বাংলা
lang-name = বাংলা

# ── লগইন পাতা ─────────────────────────────────────────────────────────────
tab-login = লগ ইন
tab-new-identity = নতুন পরিচয়
tab-import = আমদানি
label-passphrase = পাসফ্রেজ
label-username = ব্যবহারকারীর নাম
label-confirm-passphrase = পাসফ্রেজ নিশ্চিত করুন
btn-login = লগ ইন করুন
btn-export = রপ্তানি
btn-generate = তৈরি করুন
passphrase-warning = পাসফ্রেজ হারিয়ে গেলে পরিচয় হারিয়ে যাবে। পুনরুদ্ধার সম্ভব নয়।
import-help = রপ্তানি করা .zion.json ফাইলটি বেছে নিন। বান্ডেল এনক্রিপ্টেড থাকবে।
status-unlocking = আনলক হচ্ছে...
status-generating = পরিচয় তৈরি হচ্ছে...
status-reading-file = ফাইল পড়া হচ্ছে...
status-imported = '{ $name }' আমদানি করা হয়েছে — লগইন ট্যাবে যান
error-wrong-passphrase = ভুল পাসফ্রেজ: { $e }
error-identity-not-found = পরিচয় '{ $name }' পাওয়া যায়নি
error-username-required = ব্যবহারকারীর নাম প্রয়োজন
error-passphrase-required = পাসফ্রেজ প্রয়োজন
error-passphrases-no-match = পাসফ্রেজ মিলছে না

# ── টার্মিনাল সিস্টেম বার্তা ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } হিসেবে লগ ইন করা হয়েছে
msg-type-help = কমান্ড তালিকার জন্য .help টাইপ করুন।
msg-connecting = iroh-এ সংযুক্ত হচ্ছে...
msg-iroh-ready = iroh এন্ডপয়েন্ট প্রস্তুত
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ অবরুদ্ধ [{ $cap }]: { $from }
msg-focus-cleared = ফোকাস সরানো হয়েছে
msg-focusing = { $did }-কে { $prompt } হিসেবে ফোকাস করা হচ্ছে
msg-set = { $path }: { $value }
msg-deleted = { $path } মুছে ফেলা হয়েছে ({ $count } এন্ট্রি)
msg-read-only = { $path } শুধুমাত্র পঠনযোগ্য
msg-subtree-set = { $path } একটি সাবট্রি; সেট করতে অস্বীকার করা হয়েছে
msg-ancestor-leaf = { $path }-এর একটি পূর্বপুরুষ লিফ; ছায়া দিতে অস্বীকার করা হয়েছে
msg-key-not-found = কী পাওয়া যায়নি: { $path }
msg-no-match = কোনো মিল নেই
msg-link-not-connected = লিঙ্ক ফেচ ত্রুটি: সংযুক্ত নেই
msg-link-fetch-error = লিঙ্ক ফেচ ত্রুটি: { $e }
msg-link-key-not-found = লিঙ্ক করা ডকুমেন্টে `{ $key }` কী পাওয়া যায়নি

# ── উপনাম যাচাইকরণ ────────────────────────────────────────────────────────
err-alias-name-empty = উপনামের নাম খালি হতে পারবে না
err-alias-has-fragment = উপনামে '#' থাকতে পারবে না
err-alias-value-fragment = উপনামের মান bare did:ma:<ipns> হতে হবে (কোনো ফ্র্যাগমেন্ট নেই)
err-alias-value-path = উপনামের মান bare did:ma:<ipns> হতে হবে (কোনো পথ নেই)
err-alias-not-did = উপনামের মান did:ma: দিয়ে শুরু হতে হবে
err-unknown-alias = অজানা উপনাম: @{ $name }
err-bare-did = bare did:ma:<ipns> (কোনো ফ্র্যাগমেন্ট বা পথ নেই) প্রত্যাশিত, পাওয়া গেছে { $did }

# ── সম্পাদক ───────────────────────────────────────────────────────────────
btn-save = সংরক্ষণ
btn-eval = চালান
btn-cancel = বাতিল
btn-close = বন্ধ করুন
btn-reply = উত্তর দিন
btn-publish = প্রকাশ করুন
btn-publish-ipld = প্রকাশ করুন IPLD
msg-reply-sent = উত্তর পাঠানো হয়েছে
msg-reply-failed = উত্তর ব্যর্থ: { $e }
msg-entity-publish-sent = সত্তা { $name }: প্রকাশনা পাঠানো হয়েছে
msg-entity-publish-failed = সত্তা প্রকাশনা ব্যর্থ: { $e }
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

# ── ক্রিয়া — রানটাইম ─────────────────────────────────────────────────────
discover-fetch-failed = { $url }-এ আবিষ্কার ব্যর্থ: { $e }
discover-json-error = আবিষ্কার ব্যর্থ: { $url } থেকে অবৈধ JSON: { $e }
discover-missing-did = আবিষ্কার ব্যর্থ: status.json-এ `did` ফিল্ড নেই
discover-invalid-did = আবিষ্কার ব্যর্থ: `did` did:ma: দিয়ে শুরু হওয়ার প্রত্যাশা ছিল, পাওয়া গেছে `{ $did }`
discover-no-endpoint = আবিষ্কার সতর্কতা: status.json-এ `endpoint_id` নেই; শুধুমাত্র DID সংরক্ষিত
discover-success = { $url }-এ ma আবিষ্কৃত হয়েছে
discover-did-line = DID: { $did }
discover-alias-hint =   উপনাম @ma তৈরি হয়েছে — প্রকাশ করুন: .my.identity:publish @ma
claim-success = { $did }-এর জন্য রানটাইম দাবি করা হয়েছে
claim-conflict = রানটাইম ইতিমধ্যে অন্য পরিচয় দ্বারা দাবি করা হয়েছে
claim-http-failed = দাবি ব্যর্থ: HTTP { $status }
claim-error = দাবি ব্যর্থ: { $e }
claim-no-session = লগ ইন করা নেই; রানটাইম দাবি করতে আগে লগ ইন করুন
runtime-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── ক্রিয়া — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl রিসেট করা হয়েছে (সম্পূর্ণ খোলা)
acl-persist-error = সংরক্ষণ ত্রুটি: { $e }
acl-no-verb = .my.acl-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── ক্রিয়া — পরিচয় ───────────────────────────────────────────────────────
publish-usage = ব্যবহার: .my.identity:publish <did-বা-উপনাম>

# ── ক্রিয়া — ডকুমেন্ট ────────────────────────────────────────────────────
doc-content-empty = { $path }.content খালি
doc-save-first = { $path }.content খালি — আগে সংরক্ষণ করুন
doc-missing-name = ডকুমেন্টের নাম নেই
doc-publish-usage = ব্যবহার: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = ব্যবহার: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = প্রকাশনা { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = সংরক্ষণ অনুরোধ পাঠানো হয়েছে ({ $id }) → { $publisher }; CID RPC উত্তরের মাধ্যমে আসবে
doc-ipld-store-sent = IPLD সংরক্ষণ অনুরোধ পাঠানো হয়েছে ({ $id }) → { $publisher }; CID RPC উত্তরের মাধ্যমে আসবে
doc-fetch-done = { $cid } আনা হয়েছে → { $path }.content (চালানো হয়নি)
doc-fetch-failed = ফেচ { $cid }: { $e }
doc-fetch-usage = ব্যবহার: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid সেট করা নেই
doc-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই
path-no-verb = { $path }-এর জন্য `{ $verb }` ক্রিয়া নেই

# ── সহায়তা — শিরোনাম ─────────────────────────────────────────────────────
help-header-zion = ── zion কমান্ড ────────────────────────────────────────────────────────────
help-header-messaging = ── বার্তাপ্রেরণ ────────────────────────────────────────────────────────────
help-header-focus = ── ফোকাস মোড ──────────────────────────────────────────────────────────────
help-header-config = ── স্থানীয় কনফিগ ব্যাকরণ ──────────────────────────────────────────────
help-header-common = ── সাধারণ পথ ─────────────────────────────────────────────────────────────
help-header-inbox = ── ইনবক্স ────────────────────────────────────────────────────────────────
help-header-documents = ── ডকুমেন্ট ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── সহায়তা — zion কমান্ড ─────────────────────────────────────────────────
help-cmd-help =   .help                        এই পাঠ্য
help-cmd-clear =   .clear                       টার্মিনাল পরিষ্কার করুন
help-cmd-panic =   .panic                       শেষ অবলম্বন — সমস্যায় ব্যবহার করুন
help-cmd-logout =   .logout                      লগ আউট

# ── সহায়তা — বার্তাপ্রেরণ ────────────────────────────────────────────────
help-msg-echo =   @alias                       সমাধান করা DID দেখান (কোনো বার্তা পাঠানো হয় না)
help-msg-send =   @alias[:verb] body           অভিনেতাকে বার্তা / RPC পাঠান
help-msg-fragment =   @alias#fragment[:verb] body  স্পষ্ট DID ফ্র্যাগমেন্ট সহ পাঠান
help-msg-escape =   \@name                       আক্ষরিক @name (কোনো উপনাম অনুসন্ধান নেই)

# ── সহায়তা — ফোকাস মোড ───────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       অভিনেতায় ফোকাস করুন (প্রম্পট পরিবর্তন হয়)
help-focus-clear =   .use                         ফোকাস সরান

# ── সহায়তা — কনফিগ ব্যাকরণ ──────────────────────────────────────────────
help-config-get =   .path                        লিফ মান পান বা সাবট্রি তালিকা করুন
help-config-filter =   .path value                  মান দিয়ে ফিল্টার করুন
help-config-set =   .path: value                 লিফ সেট করুন
help-config-delete =   .path:                       লিফ বা সাবট্রি মুছুন
help-config-verb =   .path:verb [args]            স্থানীয় ক্রিয়া কল করুন

# ── সহায়তা — সাধারণ পথ ───────────────────────────────────────────────────
help-my =   .my                          সমস্ত ব্যক্তিগত কনফিগ দেখান
help-aliases =   .my.aliases                  উপনামের তালিকা
help-aliases-set =   .my.aliases.<name>: <did>    উপনাম যোগ/আপডেট করুন
help-aliases-del =   .my.aliases.<name>:          উপনাম মুছুন
help-runtime-discover =   .my.ma:discover          স্থানীয় রানটাইম আবিষ্কার করুন এবং @ma তৈরি করুন
help-runtime-claim =   .my.ma:claim             আপনার DID দিয়ে রানটাইম দাবি করুন
help-identity =   .my.identity                 পরিচয় কনফিগ দেখান
help-identity-did =   .my.identity.did             নিজের DID দেখান (শুধুমাত্র পঠনযোগ্য)
help-identity-publish =   .my.identity:publish @pub    প্রকাশনা সেবার মাধ্যমে DID প্রকাশ করুন
help-config-path =   .config                      সমস্ত .config.* এন্ট্রি দেখান

# ── সহায়তা — ইনবক্স ──────────────────────────────────────────────────────
help-inbox =   .my.inbox                    ইনবক্সের তালিকা (সাবট্রি দৃশ্য)
help-inbox-n =   .my.inbox.N                  এন্ট্রি N-এর ফিল্ড দেখান
help-inbox-from =   .my.inbox.N.from             এন্ট্রি N-এর প্রেরক DID
help-inbox-reply =   .my.inbox.N:reply [body]     উত্তর পাঠান (কোনো মূল অংশ নেই — সম্পাদক খোলে)
help-inbox-open =   .my.inbox.N:open             শুধুমাত্র পড়ার জন্য সম্পাদকে বিষয়বস্তু খুলুন
help-inbox-del =   .my.inbox.N:                 এন্ট্রি N মুছুন
help-inbox-delall =   .my.inbox:                   সমস্ত ইনবক্স এন্ট্রি মুছুন
help-inbox-flush =   .my.inbox:flush              সমস্ত এন্ট্রি টার্মিনালে প্রিন্ট করুন
help-inbox-traverse =   .my.inbox.N.sender.<field>   প্রেরক DID ডকুমেন্ট অলস অন্বেষণ

# ── সহায়তা — ডকুমেন্ট ───────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           সংরক্ষিত বিষয়বস্তু দিয়ে সম্পাদক খুলুন
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID আনুন, শুধুমাত্র পর্যালোচনার জন্য খুলুন
help-doc-eval =   .my.doc.<name>:eval           সংরক্ষিত বিষয়বস্তু লাইন-বাই-লাইন চালান
help-doc-publish =   .my.doc.<name>:publish @pub   কাঁচা blob হিসেবে সংরক্ষণ করুন
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML-কে DAG-CBOR IPLD নোড হিসেবে সংরক্ষণ করুন
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID বিষয়বস্তু আমদানি করুন (চালানো হয় না)
help-doc-cid =   .my.doc.<name>:cid            সংরক্ষিত CID দেখান
help-doc-del =   .my.doc.<name>:              ডকুমেন্ট মুছুন

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
yaml-serialize-error = YAML সিরিয়ালাইজ ত্রুটি: { $e }
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
err-edit-decode-failed = সম্পাদনা ডিকোড ব্যর্থ: { $e }
err-edit-fetch-failed = সম্পাদনা আনয়ন ব্যর্থ: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = কোনো সক্রিয় সেশন নেই — প্রোফাইল মুছে ফেলা সম্ভব নয়
profile-delete-error = প্রোফাইল মুছতে ব্যর্থ হয়েছে: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (কিছু নেই)
profiles-deleted = প্রোফাইল { $name } মুছে ফেলা হয়েছে
profiles-not-found = প্রোফাইল পাওয়া যায়নি: { $name }
