# zion — हिन्दी
lang-name = हिन्दी

# ── लॉगिन पृष्ठ ───────────────────────────────────────────────────────────
tab-login = लॉगिन
tab-new-identity = नई पहचान
tab-import = आयात
label-passphrase = पासफ़्रेज़
label-username = उपयोगकर्ता नाम
label-confirm-passphrase = पासफ़्रेज़ की पुष्टि करें
btn-login = लॉगिन करें
btn-export = निर्यात
btn-generate = बनाएं
passphrase-warning = पासफ़्रेज़ खो गया = पहचान खो गई। कोई पुनर्प्राप्ति नहीं है।
import-help = निर्यात किया गया .zion.json फ़ाइल चुनें। बंडल एन्क्रिप्टेड रहता है।
status-unlocking = अनलॉक हो रहा है...
status-generating = पहचान बन रही है...
status-reading-file = फ़ाइल पढ़ी जा रही है...
status-imported = '{ $name }' आयात किया गया — लॉगिन टैब पर जाएं
error-wrong-passphrase = गलत पासफ़्रेज़: { $e }
error-identity-not-found = पहचान '{ $name }' नहीं मिली
error-username-required = उपयोगकर्ता नाम आवश्यक है
error-passphrase-required = पासफ़्रेज़ आवश्यक है
error-passphrases-no-match = पासफ़्रेज़ मेल नहीं खाते

# ── टर्मिनल सिस्टम संदेश ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } के रूप में लॉग इन
msg-type-help = कमांड सूची के लिए .help टाइप करें।
msg-connecting = iroh से कनेक्ट हो रहा है...
msg-iroh-ready = iroh एंडपॉइंट तैयार
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ अवरुद्ध [{ $cap }]: { $from }
msg-focus-cleared = फ़ोकस साफ़ हुआ
msg-focusing = { $did } को { $prompt } के रूप में फ़ोकस कर रहे हैं
msg-set = { $path }: { $value }
msg-deleted = { $path } हटाया ({ $count } प्रविष्टियां)
msg-read-only = { $path } केवल पढ़ने योग्य है
msg-subtree-set = { $path } एक सबट्री है; सेट करने से मना किया
msg-ancestor-leaf = { $path } का एक पूर्वज लीफ़ है; छाया करने से मना किया
msg-key-not-found = कुंजी नहीं मिली: { $path }
msg-no-match = कोई मिलान नहीं
msg-link-not-connected = लिंक फ़ेच त्रुटि: कनेक्ट नहीं है
msg-link-fetch-error = लिंक फ़ेच त्रुटि: { $e }
msg-link-key-not-found = लिंक किए गए दस्तावेज़ में कुंजी `{ $key }` नहीं मिली

# ── उपनाम सत्यापन ─────────────────────────────────────────────────────────
err-alias-name-empty = उपनाम नाम खाली नहीं हो सकता
err-alias-has-fragment = उपनाम नामों में '#' नहीं हो सकता
err-alias-value-fragment = उपनाम मान bare did:ma:<ipns> होना चाहिए (कोई फ़्रैगमेंट नहीं)
err-alias-value-path = उपनाम मान bare did:ma:<ipns> होना चाहिए (कोई पथ नहीं)
err-alias-not-did = उपनाम मान did:ma: से शुरू होना चाहिए
err-unknown-alias = अज्ञात उपनाम: @{ $name }
err-bare-did = bare did:ma:<ipns> (कोई फ़्रैगमेंट या पथ नहीं) अपेक्षित, मिला { $did }

# ── संपादक ────────────────────────────────────────────────────────────────
btn-save = सहेजें
btn-eval = चलाएं
btn-cancel = रद्द करें
btn-close = बंद करें
btn-reply = उत्तर दें
btn-publish = प्रकाशित करें
msg-reply-sent = उत्तर भेजा गया
msg-reply-failed = उत्तर विफल: { $e }
msg-entity-publish-sent = इकाई { $name }: प्रकाशन भेजा गया
msg-entity-publish-failed = इकाई प्रकाशन विफल: { $e }
msg-field-publish-sent = इकाई { $name }.{ $field }: प्रकाशन भेजा गया
msg-field-publish-failed = फ़ील्ड प्रकाशन विफल: { $e }
msg-acl-publish-sent = रनटाइम ACL: प्रकाशन भेजा गया
msg-acl-publish-failed = रनटाइम ACL प्रकाशन विफल: { $e }
msg-yaml-error = YAML त्रुटि: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } प्राप्त हुआ — चलाने से पहले समीक्षा करें
msg-fetch-failed = फ़ेच { $cid }: { $e }

# ── क्रिया — इनबॉक्स ──────────────────────────────────────────────────────
inbox-empty = इनबॉक्स खाली है
inbox-entry-not-found = इनबॉक्स प्रविष्टि { $n } नहीं मिली
inbox-no-message-id = इनबॉक्स प्रविष्टि { $n } में message_id नहीं है
inbox-no-verb = इनबॉक्स प्रविष्टि { $n } के लिए `{ $verb }` क्रिया नहीं

# ── क्रिया — रनटाइम ───────────────────────────────────────────────────────
discover-fetch-failed = { $url } पर खोज विफल: { $e }
discover-json-error = खोज विफल: { $url } से अमान्य JSON: { $e }
discover-missing-did = खोज विफल: status.json में `did` फ़ील्ड नहीं
discover-invalid-did = खोज विफल: `did` did:ma: से शुरू होना चाहिए था, मिला `{ $did }`
discover-no-endpoint = खोज चेतावनी: status.json में `endpoint_id` नहीं; केवल DID संग्रहीत
discover-success = { $url } पर ma मिला
discover-did-line = DID: { $did }
discover-alias-hint =   उपनाम @ma बनाया गया — प्रकाशित करें: .my.identity:publish @ma
claim-success = { $did } के लिए रनटाइम का दावा किया गया
claim-conflict = रनटाइम पहले से किसी अन्य पहचान द्वारा दावा किया गया है
claim-http-failed = दावा विफल: HTTP { $status }
claim-error = दावा विफल: { $e }
claim-no-session = लॉग इन नहीं; रनटाइम का दावा करने के लिए पहले लॉग इन करें
runtime-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं

# ── क्रिया — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl रीसेट (पूरी तरह खुला)
acl-persist-error = सहेजने की त्रुटि: { $e }
acl-no-verb = .my.acl के लिए `{ $verb }` क्रिया नहीं

# ── क्रिया — पहचान ────────────────────────────────────────────────────────
publish-usage = उपयोग: .my.identity:publish <did-या-उपनाम>

# ── क्रिया — दस्तावेज़ ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content खाली है
doc-save-first = { $path }.content खाली है — पहले सहेजें
doc-missing-name = दस्तावेज़ का नाम नहीं
doc-publish-usage = उपयोग: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = उपयोग: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = प्रकाशन { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-ipld-store-sent = IPLD संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-fetch-done = { $cid } प्राप्त → { $path }.content (चलाया नहीं गया)
doc-fetch-failed = फ़ेच { $cid }: { $e }
doc-fetch-usage = उपयोग: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid सेट नहीं है
doc-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं
path-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं

# ── सहायता — शीर्षक ───────────────────────────────────────────────────────
help-header-zion = ── zion कमांड ────────────────────────────────────────────────────────────
help-header-messaging = ── संदेश ─────────────────────────────────────────────────────────────────
help-header-focus = ── फ़ोकस मोड ──────────────────────────────────────────────────────────────
help-header-config = ── स्थानीय कॉन्फ़िग व्याकरण ──────────────────────────────────────────────
help-header-common = ── सामान्य पथ ────────────────────────────────────────────────────────────
help-header-inbox = ── इनबॉक्स ───────────────────────────────────────────────────────────────
help-header-documents = ── दस्तावेज़ ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── सहायता — zion कमांड ──────────────────────────────────────────────────
help-cmd-help =   .help                        यह पाठ
help-cmd-clear =   .clear                       टर्मिनल साफ़ करें
help-cmd-panic =   .panic                       अंतिम उपाय — समस्या होने पर उपयोग करें
help-cmd-logout =   .logout                      लॉग आउट

# ── सहायता — संदेश ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       हल किया DID दिखाएं (संदेश नहीं भेजा)
help-msg-send =   @alias[:verb] body           अभिनेता को संदेश / RPC भेजें
help-msg-fragment =   @alias#fragment[:verb] body  स्पष्ट DID फ़्रैगमेंट के साथ भेजें
help-msg-escape =   \@name                       शाब्दिक @name (कोई उपनाम खोज नहीं)

# ── सहायता — फ़ोकस मोड ────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       अभिनेता पर फ़ोकस (प्रॉम्प्ट बदलता है)
help-focus-clear =   .use                         फ़ोकस हटाएं

# ── सहायता — कॉन्फ़िग व्याकरण ─────────────────────────────────────────────
help-config-get =   .path                        लीफ़ मान प्राप्त करें या सबट्री सूची
help-config-filter =   .path value                  मान से फ़िल्टर करें
help-config-set =   .path: value                 लीफ़ सेट करें
help-config-delete =   .path:                       लीफ़ या सबट्री हटाएं
help-config-verb =   .path:verb [args]            स्थानीय क्रिया बुलाएं

# ── सहायता — सामान्य पथ ──────────────────────────────────────────────────
help-my =   .my                          सभी व्यक्तिगत कॉन्फ़िग दिखाएं
help-aliases =   .my.aliases                  उपनाम सूची
help-aliases-set =   .my.aliases.<name>: <did>    उपनाम जोड़ें/अपडेट करें
help-aliases-del =   .my.aliases.<name>:          उपनाम हटाएं
help-runtime-discover =   .my.ma:discover          स्थानीय रनटाइम खोजें और @ma बनाएं
help-runtime-claim =   .my.ma:claim             अपने DID से रनटाइम का दावा करें
help-identity =   .my.identity                 पहचान कॉन्फ़िग दिखाएं
help-identity-did =   .my.identity.did             अपना DID दिखाएं (केवल पढ़ने योग्य)
help-identity-publish =   .my.identity:publish @pub    प्रकाशन सेवा द्वारा DID प्रकाशित करें
help-config-path =   .config                      सभी .config.* प्रविष्टियां दिखाएं

# ── सहायता — इनबॉक्स ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    इनबॉक्स सूची (सबट्री दृश्य)
help-inbox-n =   .my.inbox.N                  प्रविष्टि N के फ़ील्ड दिखाएं
help-inbox-from =   .my.inbox.N.from             प्रविष्टि N का प्रेषक DID
help-inbox-reply =   .my.inbox.N:reply [body]     उत्तर भेजें (बिना मुख्य भाग — संपादक खुलेगा)
help-inbox-open =   .my.inbox.N:open             सामग्री केवल पढ़ने हेतु संपादक में खोलें
help-inbox-del =   .my.inbox.N:                 प्रविष्टि N हटाएं
help-inbox-delall =   .my.inbox:                   सभी इनबॉक्स प्रविष्टियां हटाएं
help-inbox-flush =   .my.inbox:flush              सभी प्रविष्टियां टर्मिनल में प्रिंट करें
help-inbox-traverse =   .my.inbox.N.sender.<field>   प्रेषक DID दस्तावेज़ का आलसी अन्वेषण

# ── सहायता — दस्तावेज़ ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           सहेजी गई सामग्री के साथ संपादक खोलें
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID लाएं, केवल समीक्षा के लिए खोलें
help-doc-eval =   .my.doc.<name>:eval           सहेजी गई सामग्री लाइन-दर-लाइन चलाएं
help-doc-publish =   .my.doc.<name>:publish @pub   कच्चे blob के रूप में संग्रहीत करें
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML को DAG-CBOR IPLD नोड के रूप में संग्रहीत करें
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID सामग्री आयात करें (निष्पादन नहीं)
help-doc-cid =   .my.doc.<name>:cid            संग्रहीत CID दिखाएं
help-doc-del =   .my.doc.<name>:              दस्तावेज़ हटाएं

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = उपलब्ध भाषाएँ (.my.i18n: <code> से सेट करें):
err-lang-not-found = भाषा नहीं मिली: { $lang }
