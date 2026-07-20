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
msg-ma-connecting-matrix = तुम्हाला 間trix शी जोडण्याचा प्रयत्न होत आहे
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = स्थानिक 間 दाखल केला
msg-local-ma-already-claimed = स्थानिक 間 आधीच दाखल केला आहे
msg-local-ma-claim-failed = स्थानिक 間 दाखल करता आला नाही
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
err-alias-value-fragment = टोपणनावाच्या मूल्यात जास्तीत जास्त एक रिकामा नसलेला DID-URL तुकडा असू शकतो
err-alias-value-path = टोपणनावाचे मूल्य did:ma:<ipns> DID किंवा DID-URL असणे आवश्यक आहे (path नाही)
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
claim-already-owned = Runtime आधीच या ओळखीने दाखल केला आहे
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
doc-publish-hint-session = पुन्हा लॉग इन करा जेणेकरुन अहंकार तुमच्या आयडेंटिटी की ऍक्सेस करू शकेल
doc-publish-hint-target = एक वैध प्रकाशक DID किंवा उपनाव वापरा जो बेअर 57 चे निराकरण करतो
doc-publish-hint-network = 7 रनटाइम आणि 22 पोहोचण्यायोग्य असल्याचे सत्यापित करा, नंतर पुन्हा प्रयत्न करा
doc-publish-hint-resolve = प्रकाशक डीआयडी दस्तऐवज प्रकाशित झाला आहे आणि त्यात पोहोचण्यायोग्य एंडपॉइंट आहे याची पडताळणी करा
doc-publish-hint-acl = प्रकाशक ऑपरेटरला 48 मध्ये तुमच्या DID ला परवानगी देण्यास सांगा
doc-publish-hint-runtime = रनटाइम/प्लगइनने विनंती नाकारली; कारण तपासा आणि घटक/रनटाइम निश्चित केल्यानंतर पुन्हा प्रयत्न करा
doc-publish-hint-ipfs = स्थानिक 12/17 आरोग्य आणि प्रकाशक रनटाइम स्थिती तपासा
doc-publish-hint-unknown = तपशीलवार कारणासाठी रनटाइम लॉगची तपासणी करा आणि पुन्हा प्रयत्न करा
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
help-header-i18n = ── भाषा ───────────────────────────────── ──────────────────────────────────
help-header-ma = ── 3-स्पेस ────────────────────────────────── ──────────────────────────────────
help-header-ma-entry = ── 間-स्पेसमध्ये प्रवेश करत आहे ────────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── मदत — zion आदेश ───────────────────────────────────────────────────────
help-cmd-help =   .help                        हा मजकूर
help-cmd-clear =   .clear                       टर्मिनल साफ करा
help-cmd-panic =   .panic                       शेवटचा उपाय — समस्या असल्यास वापरा
help-cmd-history =   .history                     आदेश इतिहास (क्रमिक डुप्लिकेट एकत्रित)
help-cmd-logout =   .logout                      लॉग आउट
help-cmd-batch =   .batch                       scratch दस्तावेज़ समानांतर चलाएँ
help-cmd-batch-sync =   .batch:sync / .batch         scratch दस्तावेज़ पंक्ति-दर-पंक्ति चलाएँ

# ── मदत — संदेशन ──────────────────────────────────────────────────────────
help-msg-echo =   @alias                       सोडवलेला DID/DID-URL दाखवा (संदेश पाठवला जात नाही)
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
help-aliases-set =   .my.aliases.<name>: <did-url>    टोपणनाव जोडा/अद्यतनित करा (DID किंवा DID-URL)
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
help-i18n-intro = .my.i18n तुमच्या ओळखीशी जोडलेली भाषा प्राधान्य संग्रहित करते.
help-i18n-set = .my.i18n: <code>             या ओळखीसाठी 20 वापरत असलेली भाषा निवडा
help-i18n-list = .my.i18n!list               उपलब्ध भाषा कोडची यादी करा

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
help-ma-entry-toggle =   .enter                       खोलीचा फोकस चालू किंवा बंद कर; तुझी ओळख सक्रिय राहते
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
profile-wrong-user = दुसऱ्या प्रोफाइलसाठी 11 सेट करू शकत नाही — फक्त तुमच्या स्वतःच्या
profile-wrong-user-name = 19 साठी 11 सेट करू शकत नाही — फक्त तुमचे स्वतःचे प्रोफाइल
profile-no-ma = 3 रनटाइम कॉन्फिगर केलेला नाही — प्रथम 31 चालवा
profile-no-cid = या प्रोफाइलसाठी कोणतेही 3 संचयित केलेले नाही — प्रथम 37 चालवा
profile-no-cid-in-doc = DID दस्तऐवजात 11 प्रोफाइल आढळले नाही — प्रथम 43 चालवा
profile-publish-sent = प्रोफाइल एन्क्रिप्ट करून IPFS कडे पाठवले; CID आल्यावर DID दस्तऐवज अद्ययावत होईल
profile-publish-done = प्रोफाइल प्रकाशित — DID दस्तऐवज ma.agent CID ने अद्ययावत झाला
profile-publish-failed = प्रोफाइल प्रकाशित अयशस्वी: 24
profile-fetch-done = प्रोफाइल आणले — 18 की 43 वरून लोड केल्या
profile-fetch-failed = प्रोफाइल आणणे अयशस्वी: 22
msg-identity-exists = ओळख आधीच प्रकाशित आहे — प्रोफाइल अद्ययावत
profile-import-exists = प्रोफाइल 8 आधीपासून अस्तित्वात आहे — प्रथम ते हटवा
profile-import-wrong-user = फाइलमध्ये प्रोफाईल 22, अपेक्षित 42 आहे

# -- CID content operations
cid-op-binary = बायनरी सामग्री (प्रदर्शित नाही)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = सामग्री आणण्यात अयशस्वी: 25
cid-op-unknown = अज्ञात सामग्री ऑपरेशन: 27
cid-op-wc = { $lines } ओळी 18 शब्द 36 वर्ण
profiles-empty = (काहीही नाही)
profiles-deleted = प्रोफाइल { $name } हटवले
profiles-not-found = प्रोफाइल सापडले नाही: { $name }

# -- Help topics index
help-header-topics = -- विषय -- विवरण के लिए .help/<topic> लिखें
help-topic-msg =   .help/msg                    संदेश
help-topic-ma = .help/ma                     ma-स्पेस, प्रकाशन आणि प्रवेश
help-topic-path = .help/path                   स्थानिक डॉट-पाथ व्याकरण
help-topic-my =   .help/my                     निजी config
help-topic-inbox =   .help/inbox                  इनबॉक्स
help-topic-doc =   .help/doc                    दस्तावेज़
help-topic-actor =   .help/actor                  दूरस्थ actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: अज्ञात विषय

# -- Help actor section
help-header-actor = -- दूरस्थ actor
help-actor-echo =   @actor                       हल किया DID दिखाएँ
help-actor-text = @actor[#entity]!msg|!say|!emote body         थेट/चॅट/भावना संदेश पाठवा
help-actor-ping = @actor:ping                  जिवंतपणा पिंग
help-actor-entities =   @actor/entities              entity सूचीबद्ध करें
help-actor-entities-get = @actor/entities/<n>          अस्तित्व नोड मिळवा
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   14 संदर्भाद्वारे अस्तित्व सेट करा
help-actor-entities-edit =   @actor/entities/<n>!edit     entity संपादित करें
help-actor-entities-del = @actor/entities/<n>:         अस्तित्व हटवा
help-actor-config-get =   @actor/config/<key>          config मान लें
help-actor-config-set =   @actor/config/<key>: val     config मान सेट करें
help-actor-acl = @actor/acl                   4 मिळवा
help-actor-acl-edit =   @actor/acl!edit              ACL संपादित करें
help-actor-fragment =   @actor#entity                plugin को भेजें
help-actor-fragment-verb =   @actor#entity:verb [args]    plugin को RPC
help-header-cid-ops = ── 3 अभिनेता कॉल करतो ──────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  24 वरून 15 एंटिटीला कॉल करा आणि त्याच्या उत्तराची प्रतीक्षा करा
help-actor-head = (@actor/path)                31 वरून रिमोट CRUD सामग्री आणा
help-actor-tail = (<bafy...>)                  36 41 वरून 21 समाविष्ट करा आणि मूल्यांकन करा
help-actor-wc = (define x (@actor:verb arg))  सत्र वातावरणात 5 उत्तरे ठेवा
help-actor-wc-l = .my.scheme.ma!edit           या ओळखीसाठी जतन केलेले 11 मदतनीस संपादित करा

help-topic-url =   .help/url                    URL दुव्याद्वारे zion उघडणे
help-topic-i18n = .help/i18n                   तुमच्या ओळखीसाठी भाषा प्राधान्य
help-header-url = ── URL पॅरामीटर ─────────────────────────────────────────────────────────────────
help-url-intro =   पूर्व-भरलेल्या प्राप्तकर्त्यासह zion उघडणारी लिंक शेअर करा:
help-url-msg =   ?msg=<did>                   पूर्व-भरणे: @<did>!msg (साधा संदेश)
help-url-say =   ?say=<did>                   पूर्व-भरणे: @<did>!say (say क्रियापद)
help-url-emote =   ?emote=<did>                 पूर्व-भरणे: @<did>!emote (emote क्रियापद)
help-url-ma = ?ma=<did-or-url>              रनटाइम DID / 23 URL पूर्व-भरा
help-url-enter = ?enter=<runtime>             लॉग इन केल्यानंतर रनटाइम जगात प्रवेश करा
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   इनपुट पूर्व-भरलेले आहे पण पाठवले नाही — पाठवण्यासाठी Enter दाबा.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                नेटवर्कवर ओळख प्रकाशित करा
help-header-publish = ── ओळख प्रकाशन ──────────────────────────────────────────────────────────────
help-publish-intro = प्रकाशन आपली ओळख नेटवर्कवर शोधण्यायोग्य बनवते। इतर आपला DID शोधून तुमच्याशी संपर्क साधू शकतात।
help-publish-ma = प्रकाशित करण्यासाठी ma (स्थानिक रनटाइम) स्थापित करणे आवश्यक आहे. ते आपल्या वतीने ego ला IPFS/IPNS शी जोडते।
help-publish-steps = पायऱ्या: स्थानिक ma शोधण्यासाठी '.ma [port]' चालवा, नंतर '.my.identity!publish @ma'।
help-publish-without = प्रकाशनाशिवाय इतर तुमच्यापर्यंत पोहोचू शकत नाहीत — तुमचा DID माहीत असला तरी ते तुमचा endpoint सोडवू शकत नाहीत।
profile-fetch-did-resolve-failed = अद्याप प्रकाशित केले नाही — प्रथम 28 चालवा, नंतर 67 तुमचे प्रोफाइल
profile-update-done = प्रोफाइल अपडेट केले — 18 की 43 वरून विलीन केल्या
profile-delete-needs-name = प्रोफाइल नाव द्या: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = बॅच गोळा करणे — कमांड टाइप करा, .batch ने समाप्त करा
batch-already-collecting = आधीच बॅच गोळा करत आहे — प्रथम .batch ने समाप्त करा
batch-empty = बॅच रिकामी होती — चालवण्यासाठी काहीही नाही
batch-running = batch चल रहा है…
batch-step-timeout = बॅच चरण कालबाह्य झाले

batch-done = batch { $secs }s में पूरा — { $steps } चरण
batch-done-error = batch त्रुटियों के साथ { $secs }s में पूरा — { $steps } चरण
msg-timeout = संदेश समयसीमा पार (60s में कोई उत्तर नहीं)
err-unknown-command = अज्ञात आदेश: { $path }
err-read-only-path = { $path } फक्त-वाचनीय आहे
help-cmd-batch-async =   .batch:async / .batch        scratch दस्तावेज़ समानांतर चलाएँ


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } मिळवणे अयशस्वी: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = अवैध CID: { $value }
label-runtime = मा
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = सावधान: आपली IPNS खाजगी किल्ली ओळख प्रकाशनासाठी या रनटाइमला पाठवली जाईल. फक्त अशा रनटाइमचा वापर करा ज्यावर तुमचा पूर्ण विश्वास आहे.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
