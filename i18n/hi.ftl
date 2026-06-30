# zion — हिन्दी
lang-name = हिन्दी

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
passphrase-warning = पासफ़्रेज़ खो गया = पहचान खो गई। कोई पुनर्प्राप्ति नहीं है।
import-profile-help = CID या फ़ाइल द्वारा प्रोफ़ाइल आयात करें। प्रकाशन के समय उपयोग किया गया वही पासफ़्रेज़ आवश्यक है।
import-profile-detected-user = प्रोफ़ाइल इसकी है: { $name }
status-unlocking = अनलॉक हो रहा है...
status-generating = पहचान बन रही है...
status-reading-file = फ़ाइल पढ़ी जा रही है...
status-fetching-profile = IPFS से प्रोफ़ाइल प्राप्त हो रही है...
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
msg-connecting = iroh से कनेक्ट हो रहा है...
msg-iroh-ready = iroh एंडपॉइंट तैयार
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID स्थानीय ma ({ $url }) के माध्यम से प्रकाशित
msg-identity-not-published = पहचान ऑनलाइन नहीं मिली — अगर ma स्थानीय रूप से स्थापित है, तो '.ma [port]' फिर '.my.identity!publish @ma' चलाएं। विवरण के लिए '.help.publish' टाइप करें।
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
err-alias-has-dot = उपनाम नामों में '.' नहीं हो सकता
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
discover-success = { $url } पर ma मिला
discover-did-line = DID: { $did }
discover-alias-hint =   उपनाम @ma बनाया गया — अपनी पहचान प्रकाशित करने के लिए '.my.identity!publish @ma' चलाएं।
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
publish-usage = उपयोग: .my.identity!publish <did-या-उपनाम>
identity-exported = बंडल { $filename } के रूप में डाउनलोड हुआ
identity-export-failed = निर्यात विफल: { $e }

# ── क्रिया — दस्तावेज़ ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content खाली है
doc-save-first = { $path }.content खाली है — पहले सहेजें
doc-missing-name = दस्तावेज़ का नाम नहीं
doc-publish-usage = उपयोग: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = उपयोग: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = प्रकाशन { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-ipld-store-sent = IPLD संग्रह अनुरोध भेजा ({ $id }) → { $publisher }; CID RPC उत्तर से आएगा
doc-fetch-done = { $cid } प्राप्त → { $path }.content (चलाया नहीं गया)
doc-fetch-failed = फ़ेच { $cid }: { $e }
doc-fetch-usage = उपयोग: .my.doc.<name>!fetch <cid>
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
help-cmd-history =   .history                     आदेश इतिहास (क्रमिक दोहराव एकत्रित)
help-cmd-logout =   .logout                      लॉग आउट
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

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
help-config-verb =   .path!verb [args]            स्थानीय क्रिया बुलाएं

# ── सहायता — सामान्य पथ ──────────────────────────────────────────────────
help-my =   .my                          सभी व्यक्तिगत कॉन्फ़िग दिखाएं
help-aliases =   .my.aliases                  उपनाम सूची
help-aliases-set =   .my.aliases.<name>: <did>    उपनाम जोड़ें/अपडेट करें
help-aliases-del =   .my.aliases.<name>:          उपनाम हटाएं
help-runtime-discover =   .ma [port]          स्थानीय रनटाइम खोजें और @ma बनाएं
help-runtime-claim =   .ma [port]             अपने DID से रनटाइम का दावा करें
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
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     CID लाएं, केवल समीक्षा के लिए खोलें
help-doc-eval =   .my.doc.<name>!eval           सहेजी गई सामग्री लाइन-दर-लाइन चलाएं
help-doc-publish =   .my.doc.<name>!publish @pub   कच्चे blob के रूप में संग्रहीत करें
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML को DAG-CBOR IPLD नोड के रूप में संग्रहीत करें
help-doc-fetch =   .my.doc.<name>!fetch <cid>    CID सामग्री आयात करें (निष्पादन नहीं)
help-doc-cid =   .my.doc.<name>!cid            संग्रहीत CID दिखाएं
help-doc-del =   .my.doc.<name>:              दस्तावेज़ हटाएं

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
yaml-serialize-error = YAML सीरियलाइज़ेशन त्रुटि: { $e }
edit-reply-invalid = अमान्य संपादन उत्तर
doc-publish-ipld-error = IPLD प्रकाशन विफल: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = इनबॉक्स छँटाई सहेज त्रुटि: { $e }
err-config-load = कॉन्फ़िग लोड त्रुटि: { $e }
err-lang-persist = भाषा सहेज त्रुटि: { $e }
err-history-parse = इतिहास पार्स त्रुटि: { $e }
err-history-load = इतिहास लोड त्रुटि: { $e }
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
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
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
profiles-empty = (कोई नहीं)
profiles-deleted = प्रोफ़ाइल { $name } हटाया गया
profiles-not-found = प्रोफ़ाइल नहीं मिला: { $name }

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

help-topic-url =   .help.url                    URL लिंक के माध्यम से zion खोलना
help-header-url = ── URL पैरामीटर ─────────────────────────────────────────────────────────────────
help-url-intro =   एक लिंक साझा करें जो पूर्वभरित प्राप्तकर्ता के साथ zion खोले:
help-url-msg =   ?msg=<did>                   पूर्वभरण: @<did> (सादा संदेश)
help-url-say =   ?say=<did>                   पूर्वभरण: @<did>:say (say क्रिया)
help-url-emote =   ?emote=<did>                 पूर्वभरण: @<did>:emote (emote क्रिया)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   इनपुट पूर्वभरित है लेकिन भेजा नहीं गया — भेजने के लिए Enter दबाएं।
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                अपनी पहचान नेटवर्क पर प्रकाशित करें
help-header-publish = ── पहचान प्रकाशन ────────────────────────────────────────────────────────────
help-publish-intro = प्रकाशन आपकी पहचान को नेटवर्क पर खोजने योग्य बनाता है। अन्य लोग आप तक पहुंचने के लिए आपका DID खोज सकते हैं।
help-publish-ma = प्रकाशित करने के लिए आपको ma (स्थानीय रनटाइम) स्थापित करना होगा। यह आपकी ओर से ego को IPFS/IPNS से जोड़ता है।
help-publish-steps = चरण: स्थानीय ma खोजने के लिए '.ma [port]' चलाएं, फिर '.my.identity!publish @ma'।
help-publish-without = प्रकाशन के बिना अन्य लोग आप तक नहीं पहुंच सकते — भले ही वे आपका DID जानते हों, वे आपका endpoint नहीं सुलझा सकते।
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then ':publish' your profile
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
scheme-cid-fetch-error = CID { $cid } लाने में विफल: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = अमान्य CID: { $value }
