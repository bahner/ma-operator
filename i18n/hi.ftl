# zion — हिन्दी
lang-name = हिन्दी
label-nick = उपनाम
new-identity-nick-help = 間-space के लिए एक उपनाम चुनें। यह सिर्फ़ उपनाम है और आप इसे कभी भी बदल सकते हैं।
error-nick-required = उपनाम आवश्यक है
error-nick-invalid = उपनाम में खाली जगह या @ नहीं होना चाहिए

# ── लॉगिन पृष्ठ ───────────────────────────────────────────────────────────
tab-login = लॉगिन
tab-new-identity = नई पहचान
tab-import-profile = प्रोफ़ाइल आयात करें
label-passphrase = पासफ़्रेज़
label-username = उपयोगकर्ता नाम
label-confirm-passphrase = पासफ़्रेज़ की पुष्टि करें
label-did = DID
label-profile-cid = प्रोफ़ाइल CID
label-or-file = या फ़ाइल
btn-login = लॉगिन करें
btn-export = निर्यात
btn-generate = बनाएं
btn-new-endpoint = नया एंडपॉइंट
btn-import-profile = प्रोफ़ाइल आयात करें
btn-show-qr = QR दिखाएँ
btn-scan-qr = QR स्कैन करें
qr-scan-hint = कैमरे को zion प्रोफ़ाइल QR कोड की ओर रखें।
qr-error-camera = कैमरा उपलब्ध नहीं: { $e }
qr-error-too-large = प्रोफ़ाइल QR कोड के लिए बहुत बड़ी है
passphrase-warning = पासफ़्रेज़ खो गया = पहचान खो गई। कोई पुनर्प्राप्ति नहीं है।
import-profile-help = CID या फ़ाइल द्वारा प्रोफ़ाइल आयात करें। प्रकाशन के समय उपयोग किया गया वही पासफ़्रेज़ आवश्यक है।
import-profile-detected-user = प्रोफ़ाइल इसकी है: { $name }
status-unlocking = अनलॉक हो रहा है...
status-generating = पहचान बन रही है...
status-reading-file = फ़ाइल पढ़ी जा रही है...
status-fetching-profile = IPFS से प्रोफ़ाइल प्राप्त हो रही है...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = '{ $name }' आयात किया गया — लॉगिन टैब पर जाएं
status-importing-profile = प्रोफ़ाइल आयात हो रही है...
profile-import-done = '{ $name }' के लिए प्रोफ़ाइल आयात हुई — { $n } कुंजियाँ लोड हुईं
error-wrong-passphrase = गलत पासफ़्रेज़: { $e }
error-identity-not-found = पहचान '{ $name }' नहीं मिली
error-username-required = उपयोगकर्ता नाम आवश्यक है
error-passphrase-required = पासफ़्रेज़ आवश्यक है
error-passphrases-no-match = पासफ़्रेज़ मेल नहीं खाते
error-profile-source-required = CID दें या फ़ाइल अपलोड करें
error-did-required = अपना DID दर्ज करें
error-profile-fetch = प्रोफ़ाइल प्राप्त नहीं हो सकी: { $e }
error-profile-no-username = प्रोफ़ाइल में कोई उपयोगकर्ता नाम नहीं है
error-profile-no-identity = पहचान '{ $name }' नहीं मिली — पहले पहचान आयात करें

# ── टर्मिनल सिस्टम संदेश ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } के रूप में लॉग इन
msg-type-help = कमांड सूची के लिए .help टाइप करें।
msg-getting-started = शुरू करने के लिए आज़माएँ: say Hello world, look, .help, या help।
msg-connecting = iroh से कनेक्ट हो रहा है...
msg-iroh-ready = iroh एंडपॉइंट तैयार
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID स्थानीय 間 ({ $url }) के माध्यम से प्रकाशित
msg-identity-publication-propagating = पहचान प्रकाशन अभी भी फैल रहा है; entry विलंबित है: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = विश्वसनीय MA की खोज में { $seconds } सेकंड तक लग सकते हैं।
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = पहचान प्रकाशित की जा रही है। इसमें { $seconds } सेकंड तक लग सकते हैं।
msg-ma-connecting-matrix = आपको 間trix से जोड़ने की कोशिश हो रही है
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = स्थानीय 間 का दावा किया गया
msg-local-ma-already-claimed = स्थानीय 間 पर पहले ही दावा किया गया है
msg-local-ma-claim-failed = स्थानीय 間 का दावा नहीं हो सका
msg-identity-not-published = पहचान ऑनलाइन नहीं मिली — अगर 間 स्थानीय रूप से स्थापित है, तो '.ma: claim [port]' फिर '.my.identity!publish @ma' चलाएं। विवरण के लिए '.help/publish' टाइप करें।
msg-blocked = ⊗ अवरुद्ध [{ $cap }]: { $from }
msg-focus-cleared = फ़ोकस साफ़ हुआ
msg-left = left
msg-focusing = { $did } को { $prompt } के रूप में फ़ोकस कर रहे हैं
msg-set = { $path }: { $value }
msg-deleted = { $path } हटाया ({ $count } प्रविष्टियां)
msg-read-only = { $path } केवल पढ़ने योग्य है
msg-subtree-set = { $path } एक सबट्री है; सेट करने से मना किया
msg-ancestor-leaf = { $path } का एक पूर्वज लीफ़ है; छाया करने से मना किया
msg-key-not-found = कुंजी नहीं मिली: { $path }
msg-link-not-connected = लिंक फ़ेच त्रुटि: कनेक्ट नहीं है
msg-link-fetch-error = लिंक फ़ेच त्रुटि: { $e }
msg-link-key-not-found = लिंक किए गए दस्तावेज़ में कुंजी `{ $key }` नहीं मिली

# ── उपनाम सत्यापन ─────────────────────────────────────────────────────────
err-alias-name-empty = उपनाम नाम खाली नहीं हो सकता
err-alias-has-dot = उपनाम नामों में '.' नहीं हो सकता
err-alias-has-fragment = उपनाम नामों में '#' नहीं हो सकता
err-alias-value-fragment = उपनाम मान में अधिकतम एक गैर-रिक्त DID-URL फ़्रैगमेंट हो सकता है
err-alias-value-path = उपनाम मान did:ma:<ipns> DID या DID-URL होना चाहिए (कोई path नहीं)
err-alias-not-did = उपनाम मान did:ma: से शुरू होना चाहिए
err-unknown-alias = अज्ञात उपनाम: @{ $name }
err-bare-did = bare did:ma:<ipns> (कोई फ़्रैगमेंट या पथ नहीं) अपेक्षित, मिला { $did }

# ── संपादक ────────────────────────────────────────────────────────────────
btn-save = सहेजें
btn-eval = चलाएं
btn-cancel = रद्द करें
msg-jobs-cancelled = कार्य रद्द किए गए
btn-close = बंद करें
btn-reply = उत्तर दें
btn-publish = प्रकाशित करें
btn-publish-ipld = प्रकाशित करें IPLD
msg-reply-sent = उत्तर भेजा गया
msg-reply-failed = उत्तर विफल: { $e }
msg-entity-publish-sent = इकाई { $name }: प्रकाशन भेजा गया
msg-entity-publish-failed = इकाई प्रकाशन विफल: { $e }
msg-kind-publish-failed = kind प्रकाशन विफल: { $e }
msg-field-publish-sent = इकाई { $name }.{ $field }: प्रकाशन भेजा गया
msg-field-publish-failed = फ़ील्ड प्रकाशन विफल: { $e }
msg-acl-publish-sent = रनटाइम ACL: प्रकाशन भेजा गया
msg-crud-edit-publish-sent = { $path }: प्रकाशन भेजा गया
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
inbox-filter-no-arg = फ़िल्टर के लिए DID या उपनाम की आवश्यकता है
inbox-filter-empty = { $did } से कोई संदेश नहीं

# ── क्रिया — रनटाइम ───────────────────────────────────────────────────────
discover-fetch-failed = { $url } पर खोज विफल: { $e }
discover-json-error = खोज विफल: { $url } से अमान्य JSON: { $e }
discover-missing-did = खोज विफल: status.json में `did` फ़ील्ड नहीं
discover-invalid-did = खोज विफल: `did` did:ma: से शुरू होना चाहिए था, मिला `{ $did }`
discover-no-endpoint = खोज चेतावनी: status.json में `endpoint_id` नहीं; केवल DID संग्रहीत
discover-hint-endpoint-not-found = संकेत: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = संकेत: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = संकेत: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = संकेत: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url } पर 間 मिला
discover-did-line = DID: { $did }
discover-alias-hint =   उपनाम @ma बनाया गया — अपनी पहचान प्रकाशित करने के लिए '.my.identity!publish @ma' चलाएं।
claim-success = { $did } के लिए रनटाइम का दावा किया गया
claim-conflict = रनटाइम पहले से किसी अन्य पहचान द्वारा दावा किया गया है
claim-already-owned = रनटाइम पर पहले ही इस पहचान द्वारा दावा किया गया है
claim-http-failed = दावा विफल: HTTP { $status }
claim-error = दावा विफल: { $e }
claim-no-session = लॉग इन नहीं; रनटाइम का दावा करने के लिए पहले लॉग इन करें
runtime-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं

# ── क्रिया — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl रीसेट (पूरी तरह खुला)
err-persist = सहेजने की त्रुटि: { $e }
acl-no-verb = .my.acl के लिए `{ $verb }` क्रिया नहीं

# ── क्रिया — पहचान ────────────────────────────────────────────────────────
publish-usage = उपयोग: .my.identity!publish <did-या-उपनाम>
identity-exported = बंडल { $filename } के रूप में डाउनलोड हुआ
identity-export-failed = निर्यात विफल: { $e }

# ── क्रिया — दस्तावेज़ ─────────────────────────────────────────────────────
doc-content-empty = { $path } खाली है
doc-save-first = { $path } खाली है — पहले सहेजें
doc-missing-name = दस्तावेज़ का नाम नहीं
doc-publish-usage = उपयोग: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = उपयोग: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = प्रकाशन { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = प्रकाशन विफल [{ $code }]: { $err }
doc-publish-error-hint = संकेत: { $hint }
doc-publish-hint-session = फिर से लॉग इन करें ताकि अहंकार आपकी पहचान कुंजी तक पहुंच सके
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = सत्यापित करें कि प्रकाशक ने DID दस्तावेज़ प्रकाशित कर दिया है और इसमें एक पहुंच योग्य समापन बिंदु शामिल है
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = रनटाइम/प्लगइन ने अनुरोध अस्वीकार कर दिया; कारण का निरीक्षण करें और इकाई/रनटाइम ठीक करने के बाद पुनः प्रयास करें
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = विस्तृत कारण के लिए रनटाइम लॉग का निरीक्षण करें और पुनः प्रयास करें
doc-store-sent = संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-ipld-store-sent = IPLD संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-fetch-done = { $cid } प्राप्त → { $path } (चलाया नहीं गया)
doc-fetch-failed = फ़ेच { $cid }: { $e }
doc-fetch-usage = उपयोग: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid सेट नहीं है
doc-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं
path-no-verb = { $path } के लिए `{ $verb }` क्रिया नहीं

# ── सहायता — शीर्षक ───────────────────────────────────────────────────────
help-header-zion = ── zion कमांड ────────────────────────────────────────────────────────────
help-header-messaging = ── संदेश ─────────────────────────────────────────────────────────────────
help-header-config = ── स्थानीय कॉन्फ़िग व्याकरण ──────────────────────────────────────────────
help-header-common = ── सामान्य पथ ────────────────────────────────────────────────────────────
help-header-inbox = ── इनबॉक्स ───────────────────────────────────────────────────────────────
help-header-documents = ── दस्तावेज़ ──────────────────────────────────────────────────────────────
help-header-i18n = ── भाषा ───────────────────────────── ──────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-स्पेस में प्रवेश करना ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── सहायता — zion कमांड ──────────────────────────────────────────────────
help-cmd-help =   .help                        यह पाठ
help-cmd-clear =   .clear                       टर्मिनल साफ़ करें
help-cmd-panic =   .panic                       अंतिम उपाय — समस्या होने पर उपयोग करें
help-cmd-history =   .history [n]                 आदेश इतिहास (क्रमिक दोहराव एकत्रित); वैकल्पिक n केवल अंतिम n पंक्तियाँ दिखाता है
help-cmd-logout =   .logout                      लॉग आउट
help-cmd-batch =   .batch                       scratch दस्तावेज़ समानांतर चलाएँ
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         scratch दस्तावेज़ पंक्ति-दर-पंक्ति चलाएँ

# ── सहायता — संदेश ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       हल किया गया DID/DID-URL दिखाएँ (कोई संदेश नहीं भेजा गया)
help-msg-send =   @alias!msg body / @alias:verb args           अभिनेता को संदेश / RPC भेजें
help-msg-fragment =   @alias#fragment:verb body  स्पष्ट DID फ़्रैगमेंट के साथ भेजें
help-msg-escape =   \@name                       शाब्दिक @name (कोई उपनाम खोज नहीं)

# ── सहायता — फ़ोकस मोड ────────────────────────────────────────────────────

# ── सहायता — कॉन्फ़िग व्याकरण ─────────────────────────────────────────────
help-config-get =   .path                        लीफ़ मान प्राप्त करें या सबट्री सूची
help-config-filter =   .path [नाम]                 नाम वाले चाइल्ड कुंजी नामों की सूची
help-config-full =   .path. [नाम]                नाम वाले पूर्ण सबट्री मानों की सूची
help-config-set =   .path: value                 लीफ़ सेट करें
help-config-delete =   .path:                       लीफ़ या सबट्री हटाएं
help-config-verb =   .path!verb [args]            स्थानीय क्रिया बुलाएं

# ── सहायता — सामान्य पथ ──────────────────────────────────────────────────
help-my =   .my                          सभी व्यक्तिगत कॉन्फ़िग दिखाएं
help-aliases =   .my.aliases                  उपनाम सूची
help-aliases-set =   .my.aliases.<name>: <did-url>    उपनाम जोड़ें/अपडेट करें (DID या DID-URL)
help-aliases-del =   .my.aliases.<name>:          उपनाम हटाएं
help-runtime-discover =   .ma: claim [port]          स्थानीय रनटाइम खोजें और @ma बनाएं
help-runtime-claim =   .ma: claim [port]             अपने DID से रनटाइम का दावा करें
help-identity =   .my.identity                 पहचान कॉन्फ़िग दिखाएं
help-identity-did =   .my.identity.did             अपना DID दिखाएं (केवल पढ़ने योग्य)
help-identity-publish =   .my.identity!publish @pub    प्रकाशन सेवा द्वारा DID प्रकाशित करें
help-identity-export =   .my.identity!export          अपना पहचान बंडल डाउनलोड करें
help-config-path =   .config                      सभी .config.* प्रविष्टियां दिखाएं

# ── सहायता — इनबॉक्स ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    इनबॉक्स सूची (सबट्री दृश्य)
help-inbox-n =   .my.inbox.N                  प्रविष्टि N के फ़ील्ड दिखाएं
help-inbox-from =   .my.inbox.N.from             प्रविष्टि N का प्रेषक DID
help-inbox-reply =   .my.inbox.N!reply [body]     उत्तर भेजें (बिना मुख्य भाग — संपादक खुलेगा)
help-inbox-open =   .my.inbox.N!open             सामग्री केवल पढ़ने हेतु संपादक में खोलें
help-inbox-del =   .my.inbox.N:                 प्रविष्टि N हटाएं
help-inbox-delall =   .my.inbox:                   सभी इनबॉक्स प्रविष्टियां हटाएं
help-inbox-flush =   .my.inbox!flush              सभी प्रविष्टियां टर्मिनल में प्रिंट करें
help-inbox-filter =   .my.inbox!filter @who        केवल @who से प्रविष्टियाँ दिखाएं
help-inbox-traverse =   .my.inbox.N.sender.<field>   प्रेषक DID दस्तावेज़ का आलसी अन्वेषण

# ── सहायता — दस्तावेज़ ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           सहेजी गई सामग्री के साथ संपादक खोलें
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID लाएं, केवल समीक्षा के लिए खोलें
help-doc-eval =   .my.doc.<name>!eval           सहेजी गई सामग्री लाइन-दर-लाइन चलाएं
help-doc-publish =   .my.doc.<name>!publish @pub   कच्चे blob के रूप में संग्रहीत करें
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML को DAG-CBOR IPLD नोड के रूप में संग्रहीत करें
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID सामग्री आयात करें (निष्पादन नहीं)
help-doc-cid =   .my.doc.<name>!cid            संग्रहीत CID दिखाएं
help-doc-del =   .my.doc.<name>:              दस्तावेज़ हटाएं

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n आपकी पहचान से जुड़ी भाषा प्राथमिकता को संग्रहीत करता है।
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               उपलब्ध भाषा कोडों की सूची बनाएं

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 कमरा 間 पहचानों के बीच की जगह है। ma इन पहचानों को एक-दूसरे को खोजने और संवाद करने देता है; जब तुम्हारी पहचान प्रकाशित हो जाती है, तो तुम भाग ले सकते हो।
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   अपने स्थानीय 間 runtime से जुड़ो, /status.json पढ़ो, और .ma.ctx.* सहेजो
help-ma-publish =   .my.identity!publish @ma     अपना DID दस्तावेज़ प्रकाशित करो ताकि दूसरे तुम्हारी कुंजियाँ और endpoint हल कर सकें
help-ma-security = सबसे स्पष्ट trust boundary तुम्हारा अपना 間 runtime है, अपने IPFS Desktop/Kubo के साथ। दूरस्थ publisher उपयोगी हो सकता है, लेकिन तब तुम किसी और की सेवा पर निर्भर होते हो।
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 कमरे में कैसे प्रवेश करें

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = जब तुम्हारी पहचान जानी जाती है, .enter @ma तुम्हें 間 में कदम रखने देता है। कोई world खोजो, उसमें प्रवेश करो, और वहीं से भाग लो।
help-ma-entry-steps = IPFS Desktop और ma शुरू करो, फिर .ma चलाओ। .my.identity!publish @ma से प्रकाशित करो, कोई world खोजो, और .enter @ma से प्रवेश करो।
help-ma-entry-command =   .enter @ma                  @ma runtime के माध्यम से 間 में प्रवेश करो
help-ma-entry-toggle =   .enter                       कमरे का फ़ोकस चालू या बंद करो; तुम्हारी पहचान सक्रिय रहती है
help-ma-entry-url =   ?enter=<runtime>             साझा URL से login के बाद प्रवेश करो

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = उपलब्ध भाषाएँ (.my.i18n: <code> से सेट करें):
err-lang-not-found = भाषा नहीं मिली: { $lang }

msg-send-failed = भेजना विफल: { $e }
msg-not-logged-in = लॉग इन नहीं

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML पार्स त्रुटि: { $e }
yaml-not-mapping = YAML एक mapping (कुंजी: मान युग्म) होना चाहिए; सादा पाठ और सरल स्केलर DAG-CBOR के रूप में संग्रहीत नहीं किए जा सकते
dagcbor-encode-error = DAG-CBOR एन्कोड त्रुटि: { $e }
cbor-decode-error = CBOR डिकोड त्रुटि: { $e }
cbor-json-error = CBOR से JSON त्रुटि: { $e }
yaml-serialise-error = YAML सीरियलाइज़ेशन त्रुटि: { $e }
edit-reply-invalid = अमान्य संपादन उत्तर
doc-publish-ipld-error = IPLD प्रकाशन विफल: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = इनबॉक्स छँटाई सहेज त्रुटि: { $e }
err-config-load = कॉन्फ़िग लोड त्रुटि: { $e }
err-lang-persist = भाषा सहेज त्रुटि: { $e }
err-history-parse = इतिहास पार्स त्रुटि: { $e }
err-history-load = इतिहास लोड त्रुटि: { $e }
err-history-count-invalid = इतिहास की संख्या एक धनात्मक पूर्णांक होनी चाहिए
err-ipfs-reply-decode = IPFS उत्तर डिकोड विफल: { $e }
err-edit-cbor = CBOR संपादन त्रुटि: { $e }
err-popup-blocked = पॉपअप ब्राउज़र द्वारा अवरुद्ध
status-publishing = प्रकाशित हो रहा

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = त्रुटि
rpc-error-detail = त्रुटि: { $detail }
msg-new-message = ← [{ $from }] नया संदेश — { $count } इनबॉक्स में
msg-chat = { $sender } कहता है { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } कहते हैं { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } कमरे में आए।
room-leave = * { $name } कमरे से गए।
room-drop  = * { $name } ने { $thing } गिराया।
room-take  = * { $name } ने { $thing } उठाया।
err-edit-decode-failed = संपादन: डीकोड विफल: { $e }
err-edit-fetch-failed = संपादन: लाना विफल: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = कोई सक्रिय सत्र नहीं — प्रोफ़ाइल हटाना संभव नहीं
profile-delete-error = प्रोफ़ाइल हटाने में विफल: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = प्रोफ़ाइल एन्क्रिप्ट करके IPFS को भेजी गई; CID आने पर DID दस्तावेज़ अपडेट होगा
profile-publish-done = प्रोफ़ाइल प्रकाशित — DID दस्तावेज़ ma.agent CID के साथ अपडेट हुआ
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = पहचान पहले ही प्रकाशित हो चुकी है - प्रोफ़ाइल अद्यतित है
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = बाइनरी सामग्री (प्रदर्शित नहीं)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (कोई नहीं)
profiles-deleted = प्रोफ़ाइल { $name } हटाया गया
profiles-not-found = प्रोफ़ाइल नहीं मिला: { $name }

# -- Help topics index
help-header-topics = -- विषय -- विवरण के लिए .help/<topic> लिखें
help-topic-msg =   .help/msg                    संदेश
help-topic-ma = .help/ma                     間-स्पेस, प्रकाशन, और प्रविष्टि
help-topic-path = .help/path                   स्थानीय बिंदु-पथ व्याकरण
help-topic-my =   .help/my                     निजी config
help-topic-inbox =   .help/inbox                  इनबॉक्स
help-topic-doc =   .help/doc                    दस्तावेज़
help-topic-actor =   .help/actor                  दूरस्थ actor
help-topic-z =   .help/z                      सार्वजनिक और निजी Scheme सामग्री
help-topic-zscheme =   .help/zscheme               इनलाइन Scheme अभिव्यक्तियाँ और दस्तावेज़
help-unknown-topic =   .help/{ $topic }: अज्ञात विषय

# -- Help actor section
help-header-actor = -- दूरस्थ actor
help-actor-echo =   @actor                       हल किया DID दिखाएँ
help-actor-text = @actor[#entity]!msg|!say|!emote body         प्रत्यक्ष/चैट/भावनात्मक संदेश भेजें
help-actor-ping = @actor:ping                  सजीवता पिंग
help-actor-entities =   @actor/entities              entity सूचीबद्ध करें
help-actor-entities-get = @actor/entities/<n>          इकाई नोड प्राप्त करें
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity संपादित करें
help-actor-entities-del = @actor/entities/<n>:         इकाई हटाएँ
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
help-actor-wc = (define x (@actor:verb arg))  5 उत्तरों को सत्र परिवेश में रखें

help-topic-url =   .help/url                    URL लिंक के माध्यम से zion खोलना
help-topic-i18n = .help/i18n                   आपकी पहचान के लिए भाषा प्राथमिकता
help-header-url = ── URL पैरामीटर ─────────────────────────────────────────────────────────────────
help-url-intro =   एक लिंक साझा करें जो पूर्वभरित प्राप्तकर्ता के साथ zion खोले:
help-url-msg =   ?msg=<did>                   पूर्वभरण: @<did>!msg (सादा संदेश)
help-url-say =   ?say=<did>                   पूर्वभरण: @<did>!say (say क्रिया)
help-url-emote =   ?emote=<did>                 पूर्वभरण: @<did>!emote (emote क्रिया)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             लॉगिन के बाद रनटाइम वर्ल्ड दर्ज करें
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   इनपुट पूर्वभरित है लेकिन भेजा नहीं गया — भेजने के लिए Enter दबाएं।
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                अपनी पहचान नेटवर्क पर प्रकाशित करें
help-header-publish = ── पहचान प्रकाशन ────────────────────────────────────────────────────────────
help-publish-intro = प्रकाशन आपकी पहचान को नेटवर्क पर खोजने योग्य बनाता है। अन्य लोग आप तक पहुंचने के लिए आपका DID खोज सकते हैं।
help-publish-ma = प्रकाशित करने के लिए आपको 間 (स्थानीय रनटाइम) स्थापित करना होगा। यह आपकी ओर से ego को IPFS/IPNS से जोड़ता है।
help-publish-steps = चरण: स्थानीय ma खोजने के लिए '.ma: claim [port]' चलाएं, फिर '.my.identity!publish @ma'।
help-publish-without = प्रकाशन के बिना अन्य लोग आप तक नहीं पहुंच सकते — भले ही वे आपका DID जानते हों, वे आपका endpoint नहीं सुलझा सकते।
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = प्रोफ़ाइल नाम दें: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = बैच एकत्रित करना - कमांड टाइप करें, .batch के साथ समाप्त करें
batch-already-collecting = पहले से ही एक बैच एकत्र कर रहा है - पहले .batch के साथ समाप्त करें
batch-empty = बैच खाली था - चलाने के लिए कुछ भी नहीं
batch-running = batch चल रहा है…
batch-step-timeout = बैच चरण का समय समाप्त हो गया

batch-done = batch { $secs }s में पूरा — { $steps } चरण
batch-done-error = batch त्रुटियों के साथ { $secs }s में पूरा — { $steps } चरण
msg-timeout = संदेश समयसीमा पार (60s में कोई उत्तर नहीं)
msg-outbox-open-timeout = अभिनेता { $target } तक पहुंच नहीं है — कनेक्शन { $ms }ms बाद समयसीमा पार हो गया
msg-outbox-send-timeout = { $target } को भेजना { $ms }ms बाद समयसीमा पार हो गया — कनेक्शन टूट गया हो सकता है
err-unknown-command = अज्ञात कमांड: { $path }
err-read-only-path = { $path } केवल पढ़ने योग्य है
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        scratch दस्तावेज़ समानांतर चलाएँ


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } लाने में विफल: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = अमान्य CID: { $value }
label-runtime = मा
label-runtime-placeholder = did:ma:...
warning-remote-runtime = चेतावनी: आपकी IPNS निजी कुंजी इस रनटाइम को पहचान प्रकाशित करने के लिए भेजी जाएगी। केवल उस रनटाइम का उपयोग करें जिस पर आप पूरी तरह भरोसा करते हैं।

# -- Help text -- z and my

help-header-z = ── .z और .my ──────────────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       सार्वजनिक या प्रकाशन योग्य सामग्री; यहाँ रहस्य संग्रहित न करें
help-z-scheme =   .z.scheme                  Scheme स्क्रिप्ट जो स्टार्टअप पर लोड और मूल्यांकित की जाती है
help-z-control =   .z.scheme                 स्टार्टअप स्क्रिप्ट की सामग्री को आप स्वयं नियंत्रित करते हैं
help-z-private =   .my.*                     निजी स्थानीय कॉन्फ़िगरेशन; Scheme को यहाँ भी संग्रहीत किया जा सकता है
help-z-choice =   .z.* / .my.*               सार्वजनिक Scheme के लिए .z.* और निजी Scheme के लिए .my.* का उपयोग करें

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme zion आदेशों में जुड़ी Scheme अभिव्यक्तियों का मूल्यांकन करता है और भेजने से पहले परिणाम को उसी पंक्ति में जोड़ देता है।
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    इनलाइन उदाहरण; "say 7 + 5 = 12" भेजता है
help-zscheme-define =   (define x 12)             परिभाषाएँ मौजूदा लॉगिन सत्र में बनी रहती हैं
help-zscheme-doc = दस्तावेज़: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = स्थानीय IPFS गेटवे (ब्राउज़र अपवाद आवश्यक)

tab-config = सेटिंग्स
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
