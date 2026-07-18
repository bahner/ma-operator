# zion — मराठी
lang-name = मराठी

# ── लॉगिन पृष्ठ ───────────────────────────────────────────────────────────
tab-login = लॉगिन
tab-new-identity = नवीन ओळख
tab-import-profile = प्रोफाइल आयात करा
label-passphrase = पासफ्रेज
label-username = वापरकर्तानाव
label-confirm-passphrase = पासफ्रेज पुष्टी करा
label-did = DID
label-profile-cid = प्रोफाइल CID
label-or-file = किंवा फाइल
btn-login = लॉगिन करा
btn-export = निर्यात
btn-generate = तयार करा
btn-new-endpoint = नवीन एंडपॉइंट
btn-import-profile = प्रोफाइल आयात करा
passphrase-warning = पासफ्रेज गेले = ओळख गेली. कोणतीही पुनर्प्राप्ती नाही.
import-profile-help = CID किंवा फाइलद्वारे प्रोफाइल आयात करा. प्रकाशनाच्या वेळी वापरलेली तीच पासफ्रेझ आवश्यक आहे.
import-profile-detected-user = प्रोफाइल संबंधित आहे: { $name }
status-unlocking = अनलॉक होत आहे...
status-generating = ओळख तयार होत आहे...
status-reading-file = फाइल वाचली जात आहे...
status-fetching-profile = IPFS मधून प्रोफाइल आणत आहे...
status-imported = '{ $name }' आयात केले — लॉगिन टॅबवर जा
status-importing-profile = प्रोफाइल आयात होत आहे...
profile-import-done = '{ $name }' साठी प्रोफाइल आयात झाले — { $n } की लोड झाल्या
error-wrong-passphrase = चुकीचे पासफ्रेज: { $e }
error-identity-not-found = ओळख '{ $name }' सापडली नाही
error-username-required = वापरकर्तानाव आवश्यक आहे
error-passphrase-required = पासफ्रेज आवश्यक आहे
error-passphrases-no-match = पासफ्रेज जुळत नाहीत
error-profile-source-required = CID द्या किंवा फाइल अपलोड करा
error-did-required = तुमचा DID टाका
error-profile-fetch = प्रोफाइल मिळवता आले नाही: { $e }
error-profile-no-username = प्रोफाइलमध्ये वापरकर्तानाव नाही
error-profile-no-identity = ओळख '{ $name }' आढळली नाही — प्रथम ओळख आयात करा

# ── टर्मिनल प्रणाली संदेश ────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } म्हणून लॉग इन केले
msg-type-help = आदेश सूचीसाठी .help टाइप करा.
msg-connecting = iroh ला जोडले जात आहे...
msg-iroh-ready = iroh एंडपॉइंट तयार
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID स्थानिक ma ({ $url }) द्वारे प्रकाशित झाला
msg-identity-not-published = ओळख ऑनलाइन सापडली नाही — जर ma स्थानिकपणे स्थापित असेल, तर '.ma [port]' नंतर '.my.identity!publish @ma' चालवा। तपशीलांसाठी '.help/publish' टाइप करा।
msg-blocked = ⊗ अवरोधित [{ $cap }]: { $from }
msg-focus-cleared = फोकस साफ केले
msg-focusing = { $did } ला { $prompt } म्हणून फोकस केले जात आहे
msg-set = { $path }: { $value }
msg-deleted = { $path } हटवले ({ $count } नोंदी)
msg-read-only = { $path } फक्त वाचनीय आहे
msg-subtree-set = { $path } उपवृक्ष आहे; सेट करण्यास नकार
msg-ancestor-leaf = { $path } चा एक पूर्वज पान आहे; छाया करण्यास नकार
msg-key-not-found = की सापडली नाही: { $path }
msg-no-match = कोणतेही जुळणे नाही
msg-link-not-connected = दुवा आणण्यात त्रुटी: जोडलेले नाही
msg-link-fetch-error = दुवा आणण्यात त्रुटी: { $e }
msg-link-key-not-found = जोडलेल्या दस्तऐवजात की `{ $key }` सापडली नाही

# ── टोपणनाव सत्यापन ───────────────────────────────────────────────────────
err-alias-name-empty = टोपणनाव रिकामे असू शकत नाही
err-alias-has-dot = टोपणनावांमध्ये '.' असू शकत नाही
err-alias-has-fragment = टोपणनावांमध्ये '#' असू शकत नाही
err-alias-value-fragment = टोपणनावाचे मूल्य bare did:ma:<ipns> असणे आवश्यक आहे (कोणतेही तुकडे नाही)
err-alias-value-path = टोपणनावाचे मूल्य bare did:ma:<ipns> असणे आवश्यक आहे (कोणताही मार्ग नाही)
err-alias-not-did = टोपणनावाचे मूल्य did:ma: ने सुरू होणे आवश्यक आहे
err-unknown-alias = अज्ञात टोपणनाव: @{ $name }
err-bare-did = bare did:ma:<ipns> (कोणताही तुकडा किंवा मार्ग नाही) अपेक्षित, मिळाले { $did }

# ── संपादक ────────────────────────────────────────────────────────────────
btn-save = जतन करा
btn-eval = चालवा
btn-cancel = रद्द करा
btn-close = बंद करा
btn-reply = उत्तर द्या
btn-publish = प्रकाशित करा
btn-publish-ipld = प्रकाशित करा IPLD
msg-reply-sent = उत्तर पाठवले
msg-reply-failed = उत्तर अयशस्वी: { $e }
msg-entity-publish-sent = घटक { $name }: प्रकाशन पाठवले
msg-entity-publish-failed = घटक प्रकाशन अयशस्वी: { $e }
msg-kind-publish-failed = kind प्रकाशन अयशस्वी: { $e }
msg-field-publish-sent = घटक { $name }.{ $field }: प्रकाशन पाठवले
msg-field-publish-failed = फील्ड प्रकाशन अयशस्वी: { $e }
msg-acl-publish-sent = रनटाइम ACL: प्रकाशन पाठवले
msg-crud-edit-publish-sent = { $path }: प्रकाशन पाठवले
msg-acl-publish-failed = रनटाइम ACL प्रकाशन अयशस्वी: { $e }
msg-yaml-error = YAML त्रुटी: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } आणले — चालवण्यापूर्वी पुनरावलोकन करा
msg-fetch-failed = आणा { $cid }: { $e }

# ── क्रिया — इनबॉक्स ─────────────────────────────────────────────────────
inbox-empty = इनबॉक्स रिकामा आहे
inbox-entry-not-found = इनबॉक्स नोंद { $n } सापडली नाही
inbox-no-message-id = इनबॉक्स नोंद { $n } मध्ये message_id नाही
inbox-no-verb = इनबॉक्स नोंद { $n } साठी `{ $verb }` क्रिया नाही
inbox-filter-no-arg = फिल्टरला DID किंवा उपनामाचे युक्तिवाद आवश्यक आहे
inbox-filter-empty = { $did } कडून कोणतेही संदेश नाहीत

# ── क्रिया — रनटाइम ───────────────────────────────────────────────────────
discover-fetch-failed = { $url } वर शोध अयशस्वी: { $e }
discover-json-error = शोध अयशस्वी: { $url } कडून अवैध JSON: { $e }
discover-missing-did = शोध अयशस्वी: status.json मध्ये `did` फील्ड नाही
discover-invalid-did = शोध अयशस्वी: `did` did:ma: ने सुरू होणे अपेक्षित होते, मिळाले `{ $did }`
discover-no-endpoint = शोध चेतावणी: status.json मध्ये `endpoint_id` नाही; फक्त DID संग्रहित
discover-hint-endpoint-not-found = सूचना: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = सूचना: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = सूचना: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = सूचना: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url } वर ma सापडला
discover-did-line = DID: { $did }
discover-alias-hint =   टोपणनाव @ma तयार केले — आपली ओळख प्रकाशित करण्यासाठी '.my.identity!publish @ma' चालवा।
claim-success = { $did } साठी रनटाइम दाखल केला
claim-conflict = रनटाइम आधीच दुसऱ्या ओळखीने दाखल केला आहे
claim-http-failed = दाखल करणे अयशस्वी: HTTP { $status }
claim-error = दाखल करणे अयशस्वी: { $e }
claim-no-session = लॉग इन नाही; रनटाइम दाखल करण्यासाठी आधी लॉग इन करा
runtime-no-verb = { $path } साठी `{ $verb }` क्रिया नाही

# ── क्रिया — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl रीसेट केला (पूर्णपणे खुला)
acl-persist-error = जतन त्रुटी: { $e }
acl-no-verb = .my.acl साठी `{ $verb }` क्रिया नाही

# ── क्रिया — ओळख ──────────────────────────────────────────────────────────
publish-usage = वापर: .my.identity!publish <did-किंवा-टोपणनाव>
identity-exported = { $filename } म्हणून बंडल डाउनलोड झाले
identity-export-failed = निर्यात अयशस्वी: { $e }

# ── क्रिया — दस्तऐवज ──────────────────────────────────────────────────────
doc-content-empty = { $path }.content रिकामे आहे
doc-save-first = { $path }.content रिकामे आहे — आधी जतन करा
doc-missing-name = दस्तऐवजाचे नाव नाही
doc-publish-usage = वापर: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = वापर: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = प्रकाशन { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = प्रकाशन अयशस्वी [{ $code }]: { $err }
doc-publish-error-hint = सूचना: { $hint }
doc-publish-hint-session = log in again so ego can access your identity keys
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verify the publisher DID document is published and contains a reachable endpoint
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = संग्रह विनंती पाठवली ({ $id }) → { $publisher }; CID RPC उत्तरामार्फत येईल
doc-ipld-store-sent = IPLD संग्रह विनंती पाठवली ({ $id }) → { $publisher }; CID RPC उत्तरामार्फत येईल
doc-fetch-done = { $cid } आणले → { $path }.content (चालवले नाही)
doc-fetch-failed = आणा { $cid }: { $e }
doc-fetch-usage = वापर: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid सेट केलेले नाही
doc-no-verb = { $path } साठी `{ $verb }` क्रिया नाही
path-no-verb = { $path } साठी `{ $verb }` क्रिया नाही

# ── मदत — शीर्षके ─────────────────────────────────────────────────────────
help-header-zion = ── zion आदेश ────────────────────────────────────────────────────────────
help-header-messaging = ── संदेशन ─────────────────────────────────────────────────────────────────
help-header-config = ── स्थानिक कॉन्फिग व्याकरण ──────────────────────────────────────────────
help-header-common = ── सामान्य मार्ग ──────────────────────────────────────────────────────────
help-header-inbox = ── इनबॉक्स ───────────────────────────────────────────────────────────────
help-header-documents = ── दस्तऐवज ───────────────────────────────────────────────────────────────
help-header-i18n = ── language ─────────────────────────────────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entering 間-space ─────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── मदत — zion आदेश ───────────────────────────────────────────────────────
help-cmd-help =   .help                        हा मजकूर
help-cmd-clear =   .clear                       टर्मिनल साफ करा
help-cmd-panic =   .panic                       शेवटचा उपाय — समस्या असल्यास वापरा
help-cmd-history =   .history                     आदेश इतिहास (क्रमिक डुप्लिकेट एकत्रित)
help-cmd-logout =   .logout                      लॉग आउट
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)

# ── मदत — संदेशन ──────────────────────────────────────────────────────────
help-msg-echo =   @alias                       निराकरण केलेले DID दाखवा (संदेश पाठवला नाही)
help-msg-send =   @alias!msg body / @alias:verb args           अभिनेत्याला संदेश / RPC पाठवा
help-msg-fragment =   @alias#fragment:verb body  स्पष्ट DID तुकड्यासह पाठवा
help-msg-escape =   \@name                       शब्दशः @name (कोणता टोपणनाव शोध नाही)

# ── मदत — फोकस मोड ────────────────────────────────────────────────────────

# ── मदत — कॉन्फिग व्याकरण ────────────────────────────────────────────────
help-config-get =   .path                        पानाचे मूल्य मिळवा किंवा उपवृक्ष सूची
help-config-filter =   .path value                  मूल्याने फिल्टर करा
help-config-set =   .path: value                 पान सेट करा
help-config-delete =   .path:                       पान किंवा उपवृक्ष हटवा
help-config-verb =   .path!verb [args]            स्थानिक क्रिया कॉल करा

# ── मदत — सामान्य मार्ग ───────────────────────────────────────────────────
help-my =   .my                          सर्व वैयक्तिक कॉन्फिग दाखवा
help-aliases =   .my.aliases                  टोपणनावांची यादी
help-aliases-set =   .my.aliases.<name>: <did>    टोपणनाव जोडा/अपडेट करा
help-aliases-del =   .my.aliases.<name>:          टोपणनाव काढा
help-runtime-discover =   .ma [port]          स्थानिक रनटाइम शोधा आणि @ma तयार करा
help-runtime-claim =   .ma [port]             तुमच्या DID ने रनटाइम दाखल करा
help-identity =   .my.identity                 ओळख कॉन्फिग दाखवा
help-identity-did =   .my.identity.did             स्वतःचे DID दाखवा (फक्त वाचनीय)
help-identity-publish =   .my.identity!publish @pub    प्रकाशन सेवेद्वारे DID प्रकाशित करा
help-identity-export =   .my.identity!export          स्वतःचे ओळख बंडल डाउनलोड करा
help-config-path =   .config                      सर्व .config.* नोंदी दाखवा

# ── मदत — इनबॉक्स ────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    इनबॉक्स यादी (उपवृक्ष दृश्य)
help-inbox-n =   .my.inbox.N                  नोंद N चे फील्ड दाखवा
help-inbox-from =   .my.inbox.N.from             नोंद N चा प्रेषक DID
help-inbox-reply =   .my.inbox.N!reply [body]     उत्तर पाठवा (मुख्य भाग नाही — संपादक उघडतो)
help-inbox-open =   .my.inbox.N!open             फक्त वाचण्यासाठी संपादकात सामग्री उघडा
help-inbox-del =   .my.inbox.N:                 नोंद N हटवा
help-inbox-delall =   .my.inbox:                   सर्व इनबॉक्स नोंदी हटवा
help-inbox-flush =   .my.inbox!flush              सर्व नोंदी टर्मिनलला प्रिंट करा
help-inbox-filter =   .my.inbox!filter @who        फक्त @who कडून नोंदी दाखवा
help-inbox-traverse =   .my.inbox.N.sender.<field>   प्रेषक DID दस्तऐवज आळशीपणे शोधा

# ── मदत — दस्तऐवज ────────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           जतन केलेल्या सामग्रीसह संपादक उघडा
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID आणा, फक्त पुनरावलोकनासाठी उघडा
help-doc-eval =   .my.doc.<name>!eval           जतन केलेली सामग्री ओळीनुसार चालवा
help-doc-publish =   .my.doc.<name>!publish @pub   कच्चा blob म्हणून संग्रहित करा
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML ला DAG-CBOR IPLD नोड म्हणून संग्रहित करा
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID सामग्री आयात करा (चालवत नाही)
help-doc-cid =   .my.doc.<name>!cid            संग्रहित CID दाखवा
help-doc-del =   .my.doc.<name>:              दस्तऐवज हटवा

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro =   .my.i18n stores the language preference tied to your identity.
help-i18n-set =   .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list =   .my.i18n!list               list available language codes

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 खोली ही 間 ओळखींच्या मधली जागा आहे. ma या ओळखी एकमेकींना शोधू शकतील आणि संवाद साधू शकतील अशी व्यवस्था करते; तुझी ओळख प्रकाशित झाल्यावर तू सहभागी होऊ शकतोस.
help-ma-command =   .ma [port]                   स्थानिक ma runtime शी जोड, /status.json वाच, आणि .ma.ctx.* जतन कर
help-ma-publish =   .my.identity!publish @ma     तुझे DID दस्तऐवज प्रकाशित कर, जेणेकरून इतरांना तुझे keys आणि endpoint सापडतील
help-ma-security = सर्वात स्पष्ट trust boundary म्हणजे तुझे स्वतःचे ma runtime आणि स्वतःचे IPFS Desktop/Kubo. दूरचा publisher उपयोगी ठरू शकतो, पण मग तू दुसऱ्याच्या सेवेला अवलंबून असतोस.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 खोलीत कसे प्रवेश करायचे

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = तुझी ओळख ज्ञात झाल्यावर .enter @ma तुला 間 मध्ये पाऊल ठेवू देते. एखादे जग शोध, त्यात प्रवेश कर, आणि तिथून सहभागी हो.
help-ma-entry-steps = IPFS Desktop आणि ma सुरू कर, मग .ma चालव. .my.identity!publish @ma ने प्रकाशित कर, एखादे जग शोध, आणि .enter @ma ने प्रवेश कर.
help-ma-entry-command =   .enter @ma                  @ma runtime मार्गे 間 मध्ये प्रवेश कर
help-ma-entry-leave =   .leave                       खोलीतून बाहेर पड; तुझी ओळख सक्रिय राहते आणि तू logged in राहतोस
help-ma-entry-url =   ?enter=<runtime>             सामायिक URL वरून login केल्यानंतर प्रवेश कर

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = उपलब्ध भाषा (.my.i18n: <code> ने सेट करा):
err-lang-not-found = भाषा आढळली नाही: { $lang }

msg-send-failed = पाठवणे अयशस्वी: { $e }
msg-not-logged-in = लॉग इन नाही

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML पार्स त्रुटी: { $e }
yaml-not-mapping = YAML हे mapping (की: मूल्य जोड्या) असणे आवश्यक आहे; साधा मजकूर आणि स्केलर DAG-CBOR म्हणून संग्रहित करता येत नाहीत
dagcbor-encode-error = DAG-CBOR एन्कोड त्रुटी: { $e }
cbor-decode-error = CBOR डिकोड त्रुटी: { $e }
cbor-json-error = CBOR ते JSON त्रुटी: { $e }
yaml-serialize-error = YAML सिरियलायझेशन त्रुटी: { $e }
edit-reply-invalid = अवैध संपादन उत्तर
doc-publish-ipld-error = IPLD प्रकाशन अयशस्वी: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = इनबॉक्स छाटणी जतन त्रुटी: { $e }
err-config-load = कॉन्फिग लोड त्रुटी: { $e }
err-lang-persist = भाषा जतन त्रुटी: { $e }
err-history-parse = इतिहास पार्स त्रुटी: { $e }
err-history-load = इतिहास लोड त्रुटी: { $e }
err-ipfs-reply-decode = IPFS उत्तर डिकोड अयशस्वी: { $e }
err-edit-cbor = CBOR संपादन त्रुटी: { $e }
err-popup-blocked = ब्राउझरने पॉपअप अवरोधित केले
status-publishing = प्रकाशित करत आहे

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = त्रुटी
rpc-error-detail = त्रुटी: { $detail }
msg-new-message = ← [{ $from }] नवीन संदेश — { $count } इनबॉक्समध्ये
msg-chat = { $sender } म्हणतो { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } म्हणतो { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } खोलीत आले।
room-leave = * { $name } खोलीतून गेले।
room-drop  = * { $name } ने { $thing } टाकले।
room-take  = * { $name } ने { $thing } उचलले।
err-edit-decode-failed = संपादन: डीकोड अयशस्वी: { $e }
err-edit-fetch-failed = संपादन: आणणे अयशस्वी: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = कोणताही सक्रिय सत्र नाही — प्रोफाइल हटवता येत नाही
profile-delete-error = प्रोफाइल हटविण्यात अयशस्वी: { $e }
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
profiles-empty = (काहीही नाही)
profiles-deleted = प्रोफाइल { $name } हटवले
profiles-not-found = प्रोफाइल सापडले नाही: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-ma =   .help/ma                     ma-space, publishing, and entry
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list entities
help-actor-entities-get =   @actor/entities/<n>          get entity node
help-actor-entities-set =   @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat =   (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head =   (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail =   (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc =   (define x (@actor:verb arg))  keep RPC replies in the session environment
help-actor-wc-l =   .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    URL दुव्याद्वारे zion उघडणे
help-topic-i18n =   .help/i18n                   language preference for your identity
help-header-url = ── URL पॅरामीटर ─────────────────────────────────────────────────────────────────
help-url-intro =   पूर्व-भरलेल्या प्राप्तकर्त्यासह zion उघडणारी लिंक शेअर करा:
help-url-msg =   ?msg=<did>                   पूर्व-भरणे: @<did>!msg (साधा संदेश)
help-url-say =   ?say=<did>                   पूर्व-भरणे: @<did>!say (say क्रियापद)
help-url-emote =   ?emote=<did>                 पूर्व-भरणे: @<did>!emote (emote क्रियापद)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter =   ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   इनपुट पूर्व-भरलेले आहे पण पाठवले नाही — पाठवण्यासाठी Enter दाबा.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                नेटवर्कवर ओळख प्रकाशित करा
help-header-publish = ── ओळख प्रकाशन ──────────────────────────────────────────────────────────────
help-publish-intro = प्रकाशन आपली ओळख नेटवर्कवर शोधण्यायोग्य बनवते। इतर आपला DID शोधून तुमच्याशी संपर्क साधू शकतात।
help-publish-ma = प्रकाशित करण्यासाठी ma (स्थानिक रनटाइम) स्थापित करणे आवश्यक आहे. ते आपल्या वतीने ego ला IPFS/IPNS शी जोडते।
help-publish-steps = पायऱ्या: स्थानिक ma शोधण्यासाठी '.ma [port]' चालवा, नंतर '.my.identity!publish @ma'।
help-publish-without = प्रकाशनाशिवाय इतर तुमच्यापर्यंत पोहोचू शकत नाहीत — तुमचा DID माहीत असला तरी ते तुमचा endpoint सोडवू शकत नाहीत।
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
scheme-cid-fetch-error = CID { $cid } मिळवणे अयशस्वी: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = अवैध CID: { $value }
label-runtime = मा
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = सावधान: आपली IPNS खाजगी किल्ली ओळख प्रकाशनासाठी या रनटाइमला पाठवली जाईल. फक्त अशा रनटाइमचा वापर करा ज्यावर तुमचा पूर्ण विश्वास आहे.
