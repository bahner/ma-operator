# operator — తెలుగు
lang-name = తెలుగు
label-nick = ముద్దుపేరు
new-identity-nick-help = 間-space కోసం ఒక ముద్దుపేరు ఎంచుకోండి. ఇది కేవలం ముద్దుపేరు మాత్రమే; ఎప్పుడైనా మార్చుకోవచ్చు.
error-nick-required = ముద్దుపేరు అవసరం
error-nick-invalid = ముద్దుపేరులో ఖాళీలు లేదా @ ఉండకూడదు

# ── లాగిన్ పేజీ ───────────────────────────────────────────────────────────
tab-login = లాగిన్
tab-new-identity = కొత్త గుర్తింపు
tab-import-profile = ప్రొఫైల్ దిగుమతి
label-passphrase = పాస్‌ఫ్రేజ్
label-username = వినియోగదారు పేరు
label-confirm-passphrase = పాస్‌ఫ్రేజ్ నిర్ధారించండి
label-did = DID
label-profile-cid = ప్రొఫైల్ CID
label-or-file = లేదా ఫైల్
btn-login = లాగిన్ చేయండి
btn-export = ఎగుమతి
btn-generate = తయారు చేయండి
btn-new-endpoint = కొత్త ముగింపు
btn-import-profile = ప్రొఫైల్ దిగుమతి
btn-show-qr = QR చూపించు
btn-scan-qr = QR స్కాన్ చేయి
qr-scan-hint = కెమెరాను operator ప్రొఫైల్ QR కోడ్ వైపు చూపండి.
qr-error-camera = కెమెరా అందుబాటులో లేదు: { $e }
qr-error-too-large = QR కోడ్ కోసం ప్రొఫైల్ చాలా పెద్దది
passphrase-warning = పాస్‌ఫ్రేజ్ పోయింది = గుర్తింపు పోయింది. పునరుద్ధరణ సాధ్యం కాదు.
import-profile-help = CID లేదా ఫైల్ ద్వారా ప్రొఫైల్ దిగుమతి చేయండి. ప్రచురించినప్పుడు ఉపయోగించిన అదే పాస్‌ఫ్రేజ్ అవసరం.
import-profile-detected-user = ప్రొఫైల్ సొంతదారు: { $name }
status-unlocking = అన్‌లాక్ అవుతోంది...
status-generating = గుర్తింపు తయారవుతోంది...
status-reading-file = ఫైల్ చదువుతోంది...
status-fetching-profile = IPFS నుండి ప్రొఫైల్ తీసుకుంటోంది...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = '{ $name }' దిగుమతి చేయబడింది — లాగిన్ ట్యాబ్‌కు వెళ్ళండి
status-importing-profile = ప్రొఫైల్ దిగుమతి అవుతోంది...
profile-import-done = '{ $name }' కోసం ప్రొఫైల్ దిగుమతి అయింది — { $n } కీలు లోడ్ అయ్యాయి
error-wrong-passphrase = తప్పు పాస్‌ఫ్రేజ్: { $e }
error-identity-not-found = గుర్తింపు '{ $name }' కనుగొనబడలేదు
error-username-required = వినియోగదారు పేరు అవసరం
error-passphrase-required = పాస్‌ఫ్రేజ్ అవసరం
error-passphrases-no-match = పాస్‌ఫ్రేజ్‌లు సరిపోలలేదు
error-profile-source-required = CID అందించండి లేదా ఫైల్ అప్‌లోడ్ చేయండి
error-did-required = మీ DID నమోదు చేయండి
error-profile-fetch = ప్రొఫైల్ తీసుకోలేకపోయాం: { $e }
error-profile-no-username = ప్రొఫైల్‌లో వినియోగదారు పేరు లేదు
error-profile-no-identity = గుర్తింపు '{ $name }' కనుగొనబడలేదు — మొదట గుర్తింపు దిగుమతి చేయండి

# ── టెర్మినల్ సిస్టమ్ సందేశాలు ─────────────────────────────────────────
msg-logged-in = operator v{ $version } — { $username } గా లాగిన్ అయ్యారు
msg-type-help = ఆదేశాల జాబితా కోసం .help అని టైప్ చేయండి.
msg-getting-started = ప్రారంభించడానికి ప్రయత్నించండి: say Hello world, look, .help, లేదా help.
msg-connecting = iroh కి కనెక్ట్ అవుతోంది...
msg-iroh-ready = iroh ఎండ్‌పాయింట్ సిద్ధంగా ఉంది
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID స్థానిక 間 ({ $url }) ద్వారా ప్రచురించబడింది
msg-identity-publication-propagating = గుర్తింపు ప్రచురణ ఇంకా వ్యాపిస్తోంది; entry ఆలస్యమైంది: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = నమ్మదగిన MA శోధన గరిష్ఠంగా { $seconds } సెకన్లు పట్టవచ్చు.
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = గుర్తింపును ప్రచురిస్తోంది. ఇది గరిష్ఠంగా { $seconds } సెకన్లు పట్టవచ్చు.
msg-ma-connecting-matrix = మిమ్మల్ని 間trix కి కనెక్ట్ చేయడానికి ప్రయత్నిస్తోంది
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = స్థానిక 間 క్లెయిమ్ చేయబడింది
msg-local-ma-already-claimed = స్థానిక 間 ఇప్పటికే క్లెయిమ్ చేయబడింది
msg-local-ma-claim-failed = స్థానిక 間 క్లెయిమ్ చేయలేకపోయింది
msg-identity-not-published = గుర్తింపు ఆన్‌లైన్‌లో కనుగొనబడలేదు — 間 స్థానికంగా ఇన్‌స్టాల్ అయి ఉంటే, '.ma: claim [port]' అప్పుడు '.my.identity!publish @ma' అమలు చేయండి. వివరాల కోసం '.help/publish' టైప్ చేయండి.
msg-blocked = ⊗ నిరోధించబడింది [{ $cap }]: { $from }
msg-focus-cleared = ఫోకస్ తొలగించబడింది
msg-left = left
msg-focusing = { $did } ని { $prompt } గా ఫోకస్ చేస్తోంది
msg-set = { $path }: { $value }
msg-deleted = { $path } తొలగించబడింది ({ $count } నమోదులు)
msg-read-only = { $path } చదవడానికి మాత్రమే
msg-subtree-set = { $path } సబ్‌ట్రీ; సెట్ చేయడానికి నిరాకరించింది
msg-ancestor-leaf = { $path } యొక్క పూర్వీకుడు లీఫ్; నీడ చేయడానికి నిరాకరించింది
msg-key-not-found = కీ కనుగొనబడలేదు: { $path }
msg-link-not-connected = లింక్ పొందడంలో లోపం: కనెక్ట్ కాలేదు
msg-link-fetch-error = లింక్ పొందడంలో లోపం: { $e }
msg-link-key-not-found = లింక్ చేసిన డాక్యుమెంట్‌లో కీ `{ $key }` కనుగొనబడలేదు

# ── మారుపేరు ధృవీకరణ ─────────────────────────────────────────────────────
err-alias-name-empty = మారుపేరు ఖాళీగా ఉండకూడదు
err-alias-has-dot = మారుపేర్లలో '.' ఉండకూడదు
err-alias-has-fragment = మారుపేర్లలో '#' ఉండకూడదు
err-alias-value-fragment = మారుపేరు విలువలో గరిష్ఠంగా ఒక ఖాళీ కాని DID-URL ఫ్రాగ్మెంట్ ఉండవచ్చు
err-alias-value-path = మారుపేరు విలువ did:ma:<ipns> DID లేదా DID-URL అయి ఉండాలి (path లేదు)
err-alias-not-did = మారుపేరు విలువ did:ma: తో మొదలవ్వాలి
err-unknown-alias = తెలియని మారుపేరు: @{ $name }
err-bare-did = bare did:ma:<ipns> (ఫ్రాగ్మెంట్ లేదా పాత్ లేదు) అపేక్షించబడింది, పొందింది { $did }

# ── ఎడిటర్ ────────────────────────────────────────────────────────────────
btn-save = సేవ్ చేయండి
btn-eval = అమలు చేయండి
btn-cancel = రద్దు చేయండి
msg-jobs-cancelled = పనులు రద్దయ్యాయి
btn-close = మూసివేయండి
btn-reply = జవాబివ్వండి
btn-publish = ప్రచురించండి
btn-publish-ipld = ప్రచురించండి IPLD
msg-reply-sent = జవాబు పంపబడింది
msg-reply-failed = జవాబు విఫలమైంది: { $e }
msg-entity-publish-sent = ఎంటిటీ { $name }: ప్రచురణ పంపబడింది
msg-entity-publish-failed = ఎంటిటీ ప్రచురణ విఫలమైంది: { $e }
msg-kind-publish-failed = రకం ప్రచురణ విఫలమైంది: { $e }
msg-field-publish-sent = ఎంటిటీ { $name }.{ $field }: ప్రచురణ పంపబడింది
msg-field-publish-failed = ఫీల్డ్ ప్రచురణ విఫలమైంది: { $e }
msg-acl-publish-sent = రన్‌టైమ్ ACL: ప్రచురణ పంపబడింది
msg-crud-edit-publish-sent = { $path }: ప్రచురణ పంపబడింది
msg-acl-publish-failed = రన్‌టైమ్ ACL ప్రచురణ విఫలమైంది: { $e }
msg-yaml-error = YAML లోపం: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } తెచ్చబడింది — అమలుకు ముందు సమీక్షించండి
msg-fetch-failed = పొందు { $cid }: { $e }

# ── క్రియలు — ఇన్‌బాక్స్ ──────────────────────────────────────────────────
inbox-empty = ఇన్‌బాక్స్ ఖాళీగా ఉంది
inbox-entry-not-found = ఇన్‌బాక్స్ నమోదు { $n } కనుగొనబడలేదు
inbox-no-message-id = ఇన్‌బాక్స్ నమోదు { $n } కి message_id లేదు
inbox-no-verb = ఇన్‌బాక్స్ నమోదు { $n } కోసం `{ $verb }` క్రియ లేదు
inbox-filter-no-arg = ఫిల్టర్‌కు DID లేదా మారుపేరు వాదన అవసరం
inbox-filter-empty = { $did } నుండి సందేశాలు లేవు

# ── క్రియలు — రన్‌టైమ్ ────────────────────────────────────────────────────
discover-fetch-failed = { $url } వద్ద డిస్కవర్ విఫలమైంది: { $e }
discover-json-error = డిస్కవర్ విఫలమైంది: { $url } నుండి చెల్లని JSON: { $e }
discover-missing-did = డిస్కవర్ విఫలమైంది: status.json లో `did` ఫీల్డ్ లేదు
discover-invalid-did = డిస్కవర్ విఫలమైంది: `did` did:ma: తో మొదలవ్వాలని ఆశించారు, పొందింది `{ $did }`
discover-no-endpoint = డిస్కవర్ హెచ్చరిక: status.json లో `endpoint_id` లేదు; DID మాత్రమే సేవ్ అయింది
discover-hint-endpoint-not-found = సూచన: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = సూచన: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = సూచన: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = సూచన: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url } వద్ద 間 కనుగొనబడింది
discover-did-line = DID: { $did }
discover-alias-hint =   మారుపేరు @ma సృష్టించబడింది — మీ గుర్తింపు ప్రచురించడానికి '.my.identity!publish @ma' అమలు చేయండి.
claim-success = { $did } కోసం రన్‌టైమ్ క్లెయిమ్ చేయబడింది
claim-conflict = రన్‌టైమ్ ఇప్పటికే మరొక గుర్తింపు ద్వారా క్లెయిమ్ చేయబడింది
claim-already-owned = Runtime ఇప్పటికే ఈ గుర్తింపు ద్వారా క్లెయిమ్ చేయబడింది
claim-http-failed = క్లెయిమ్ విఫలమైంది: HTTP { $status }
claim-error = క్లెయిమ్ విఫలమైంది: { $e }
claim-no-session = లాగిన్ కాలేదు; రన్‌టైమ్ క్లెయిమ్ చేయడానికి ముందు లాగిన్ చేయండి
runtime-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు

# ── క్రియలు — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl రీసెట్ చేయబడింది (పూర్తిగా తెరవబడింది)
err-persist = సేవ్ లోపం: { $e }
acl-no-verb = .my.acl కోసం `{ $verb }` క్రియ లేదు

# ── క్రియలు — గుర్తింపు ──────────────────────────────────────────────────
publish-usage = వాడకం: .my.identity!publish <did-లేదా-మారుపేరు>
identity-exported = బండిల్ { $filename } గా డౌన్‌లోడ్ అయింది
identity-export-failed = ఎగుమతి విఫలమైంది: { $e }

# ── క్రియలు — డాక్యుమెంట్‌లు ────────────────────────────────────────────
doc-content-empty = { $path } ఖాళీగా ఉంది
doc-save-first = { $path } ఖాళీగా ఉంది — ముందు సేవ్ చేయండి
doc-missing-name = డాక్యుమెంట్ పేరు లేదు
doc-publish-usage = వాడకం: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = వాడకం: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ప్రచురణ { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = ప్రచురణ విఫలమైంది [{ $code }]: { $err }
doc-publish-error-hint = సూచన: { $hint }
doc-publish-hint-session = మళ్లీ లాగిన్ అవ్వండి, తద్వారా అహం మీ గుర్తింపు కీలను యాక్సెస్ చేయగలదు
doc-publish-hint-target = చెల్లుబాటు అయ్యే పబ్లిషర్ DIDని లేదా అలియాస్‌ని బేర్ 57ని పరిష్కరిస్తుంది
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = ప్రచురణకర్త DID పత్రం ప్రచురించబడిందని మరియు చేరుకోగల ముగింపు బిందువును కలిగి ఉందని ధృవీకరించండి
doc-publish-hint-acl = 48లో మీ DIDని అనుమతించమని ప్రచురణకర్త ఆపరేటర్‌ని అడగండి
doc-publish-hint-runtime = రన్‌టైమ్/ప్లగ్ఇన్ అభ్యర్థనను తిరస్కరించింది; కారణాన్ని పరిశీలించి, ఎంటిటీ/రన్‌టైమ్‌ని పరిష్కరించిన తర్వాత మళ్లీ ప్రయత్నించండి
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = వివరణాత్మక కారణం కోసం రన్‌టైమ్ లాగ్‌లను తనిఖీ చేసి, మళ్లీ ప్రయత్నించండి
doc-store-sent = స్టోర్ అభ్యర్థన పంపబడింది ({ $id }) → { $publisher }; CID జవాబు ద్వారా వస్తుంది
doc-ipld-store-sent = IPLD స్టోర్ అభ్యర్థన పంపబడింది ({ $id }) → { $publisher }; CID జవాబు ద్వారా వస్తుంది
doc-fetch-done = { $cid } తెచ్చబడింది → { $path } (అమలు చేయలేదు)
doc-fetch-failed = పొందు { $cid }: { $e }
doc-fetch-usage = వాడకం: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid సెట్ చేయలేదు
doc-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు
path-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు

# ── సహాయం — శీర్షికలు ─────────────────────────────────────────────────────
help-header-operator = ── operator ఆదేశాలు ─────────────────────────────────────────────────────────
help-header-messaging = ── సందేశం ─────────────────────────────────────────────────────────────────
help-header-config = ── స్థానిక కాన్ఫిగ్ వ్యాకరణం ──────────────────────────────────────────────
help-header-common = ── సాధారణ మార్గాలు ──────────────────────────────────────────────────────────
help-header-inbox = ── ఇన్‌బాక్స్ ────────────────────────────────────────────────────────────────
help-header-documents = ── డాక్యుమెంట్‌లు ──────────────────────────────────────────────────────────
help-header-i18n = ── భాష ───────────────────────────── ──────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-స్పేస్‌లోకి ప్రవేశిస్తోంది ───────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── సహాయం — operator ఆదేశాలు ────────────────────────────────────────────────
help-cmd-help =   .help                        ఈ టెక్స్ట్
help-cmd-clear =   .clear                       టెర్మినల్ క్లియర్ చేయండి
help-cmd-panic =   .panic                       చివరి మార్గం — సమస్య వస్తే వాడండి
help-cmd-history =   .history [n]                 ఆదేశ చరిత్ర (వరుస నకళ్ళు విలీనమయ్యాయి); ఐచ్ఛిక n చివరి n పంక్తులను మాత్రమే చూపిస్తుంది
help-cmd-logout =   .logout                      లాగ్ అవుట్
help-cmd-batch =   .batch                       scratch పత్రాన్ని సమాంతరంగా అమలు చేయి
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         scratch పత్రాన్ని పంక్తి పంక్తిగా అమలు చేయి

# ── సహాయం — సందేశం ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       పరిష్కరించిన DID/DID-URL చూపించు (సందేశం పంపబడదు)
help-msg-send = @alias!msg body @alias:verb args నటుడికి సందేశం పంపండి
help-msg-fragment =   @alias#fragment:verb body  స్పష్టమైన DID ఫ్రాగ్మెంట్‌తో పంపండి
help-msg-escape =   \@name                       అక్షరార్థ @name (మారుపేరు శోధన లేదు)

# ── సహాయం — ఫోకస్ మోడ్ ───────────────────────────────────────────────────

# ── సహాయం — కాన్ఫిగ్ వ్యాకరణం ────────────────────────────────────────────
help-config-get =   .path                        లీఫ్ విలువ పొందండి లేదా సబ్‌ట్రీ జాబితా చేయండి
help-config-filter =   .path [పేరు]                 పేరు ఉన్న చైల్డ్ కీ పేర్లను జాబితా చేయండి
help-config-full =   .path. [పేరు]                పేరు ఉన్న పూర్తి సబ్‌ట్రీ విలువలను జాబితా చేయండి
help-config-set =   .path: value                 లీఫ్ సెట్ చేయండి
help-config-delete =   .path:                       లీఫ్ లేదా సబ్‌ట్రీ తొలగించండి
help-config-verb =   .path!verb [args]            స్థానిక క్రియ కాల్ చేయండి

# ── సహాయం — సాధారణ మార్గాలు ──────────────────────────────────────────────
help-my =   .my                          అన్ని వ్యక్తిగత కాన్ఫిగ్ చూపించు
help-aliases =   .my.aliases                  మారుపేర్ల జాబితా
help-aliases-set =   .my.aliases.<name>: <did-url>    మారుపేరు జోడించు/నవీకరించు (DID లేదా DID-URL)
help-aliases-del =   .my.aliases.<name>:          మారుపేరు తొలగించు
help-runtime-discover =   .ma: claim [port]          స్థానిక రన్‌టైమ్ కనుగొనండి మరియు @ma సృష్టించండి
help-runtime-claim =   .ma: claim [port]             మీ DID తో రన్‌టైమ్ క్లెయిమ్ చేయండి
help-identity =   .my.identity                 గుర్తింపు కాన్ఫిగ్ చూపించు
help-identity-did =   .my.identity.did             మీ DID చూపించు (చదవడానికి మాత్రమే)
help-identity-publish =   .my.identity!publish @pub    ప్రచురణ సేవ ద్వారా DID ప్రచురించండి
help-identity-export =   .my.identity!export          మీ గుర్తింపు బండిల్ డౌన్‌లోడ్ చేయండి
help-config-path =   .config                      అన్ని .config.* నమోదులు చూపించు

# ── సహాయం — ఇన్‌బాక్స్ ────────────────────────────────────────────────────
help-inbox =   .my.inbox                    ఇన్‌బాక్స్ జాబితా (సబ్‌ట్రీ వీక్షణ)
help-inbox-n =   .my.inbox.N                  నమోదు N యొక్క ఫీల్డ్‌లు చూపించు
help-inbox-from =   .my.inbox.N.from             నమోదు N యొక్క పంపినవారి DID
help-inbox-reply =   .my.inbox.N!reply [body]     జవాబు పంపండి (బాడీ లేదు — ఎడిటర్ తెరుచుకుంటుంది)
help-inbox-open =   .my.inbox.N!open             చదవడానికి మాత్రమే ఎడిటర్‌లో కంటెంట్ తెరవండి
help-inbox-del =   .my.inbox.N:                 నమోదు N తొలగించు
help-inbox-delall =   .my.inbox:                   అన్ని ఇన్‌బాక్స్ నమోదులు తొలగించు
help-inbox-flush =   .my.inbox!flush              అన్ని నమోదులు టెర్మినల్‌కు ప్రింట్ చేయి
help-inbox-filter =   .my.inbox!filter @who        @who నుండి మాత్రమే ఎంట్రీలు చూపించు
help-inbox-traverse =   .my.inbox.N.sender.<field>   పంపినవారి DID డాక్యుమెంట్‌ను సోమరిగా అన్వేషించు

# ── సహాయం — డాక్యుమెంట్‌లు ─────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           సేవ్ చేసిన కంటెంట్‌తో ఎడిటర్ తెరవండి
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID తెచ్చి, సమీక్ష కోసం మాత్రమే తెరవండి
help-doc-eval =   .my.doc.<name>!eval           సేవ్ చేసిన కంటెంట్‌ను లైన్-బై-లైన్ అమలు చేయండి
help-doc-publish =   .my.doc.<name>!publish @pub   రా blob గా స్టోర్ చేయండి (ఏ రకమైనా)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML ని DAG-CBOR IPLD నోడ్‌గా స్టోర్ చేయండి
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID కంటెంట్ దిగుమతి చేయండి (అమలు కాదు)
help-doc-cid =   .my.doc.<name>!cid            స్టోర్ చేసిన CID చూపించు
help-doc-del =   .my.doc.<name>:              డాక్యుమెంట్ తొలగించు

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n మీ గుర్తింపుతో ముడిపడి ఉన్న భాషా ప్రాధాన్యతను నిల్వ చేస్తుంది.
help-i18n-set = .my.i18n: <code>             choose the language operator uses for this identity
help-i18n-list = .my.i18n!list               అందుబాటులో ఉన్న భాషా కోడ్‌లను జాబితా చేయండి

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 గది అనేది 間 గుర్తింపుల మధ్య ఉన్న స్థలం. ma ఆ గుర్తింపులు ఒకదానిని ఒకటి కనుగొని మాట్లాడుకునేలా చేస్తుంది; నీ గుర్తింపు ప్రచురించబడిన తర్వాత నీవు పాల్గొనవచ్చు.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   స్థానిక 間 runtime కు కలుపుకో, /status.json చదువు, .ma.ctx.* భద్రపరచు
help-ma-publish =   .my.identity!publish @ma     ఇతరులు నీ keys మరియు endpoint కనుగొనడానికి నీ DID పత్రాన్ని ప్రచురించు
help-ma-security = స్పష్టమైన trust boundary అంటే నీ స్వంత IPFS Desktop/Kubo తో నీ స్వంత 間 runtime. దూర publisher ఉపయోగపడవచ్చు, కానీ అప్పుడు నీవు వేరెవరి సేవపై ఆధారపడుతున్నావు.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 గదిలోకి ఎలా ప్రవేశించాలి

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = నీ గుర్తింపు తెలిసిన తర్వాత, .enter @ma నిన్ను 間 లోకి అడుగుపెట్టనిస్తుంది. ఒక world కనుగొని దానిలోకి ప్రవేశించి, అక్కడి నుంచి పాల్గొను.
help-ma-entry-steps = IPFS Desktop మరియు ma ప్రారంభించు, ఆపై .ma నడుపు. .my.identity!publish @ma తో ప్రచురించు, ఒక world కనుగొను, .enter @ma తో ప్రవేశించు.
help-ma-entry-command =   .enter @ma                  @ma runtime ద్వారా 間 లోకి ప్రవేశించు
help-ma-entry-toggle =   .enter                       గది ఫోకస్‌ను ఆన్ లేదా ఆఫ్ చేయి; నీ గుర్తింపు సక్రియంగానే ఉంటుంది
help-ma-entry-url =   ?enter=<runtime>             పంచుకున్న URL నుండి login తరువాత ప్రవేశించు

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = అందుబాటులో ఉన్న భాషలు (.my.i18n: <code> తో సెట్ చేయండి):
err-lang-not-found = భాష కనుగొనబడలేదు: { $lang }

msg-send-failed = పంపడం విఫలమైంది: { $e }
msg-not-logged-in = లాగిన్ అవ్వలేదు

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML పార్సింగ్ లోపం: { $e }
yaml-not-mapping = YAML తప్పనిసరిగా mapping (కీ: విలువ జంటలు) అయి ఉండాలి; సాధారణ టెక్స్ట్ మరియు స్కేలర్లు DAG-CBOR గా నిల్వ చేయబడవు
dagcbor-encode-error = DAG-CBOR ఎన్‌కోడ్ లోపం: { $e }
cbor-decode-error = CBOR డీకోడ్ లోపం: { $e }
cbor-json-error = CBOR నుండి JSON లోపం: { $e }
yaml-serialise-error = YAML సీరియలైజేషన్ లోపం: { $e }
edit-reply-invalid = చెల్లని సవరణ జవాబు
doc-publish-ipld-error = IPLD ప్రచురణ విఫలమైంది: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ఇన్‌బాక్స్ తగ్గింపు నిల్వ లోపం: { $e }
err-config-load = కాన్ఫిగ్ లోడ్ లోపం: { $e }
err-lang-persist = భాష నిల్వ లోపం: { $e }
err-history-parse = చరిత్ర పార్సింగ్ లోపం: { $e }
err-history-load = చరిత్ర లోడ్ లోపం: { $e }
err-history-count-invalid = చరిత్ర సంఖ్య తప్పనిసరిగా ధనాత్మక పూర్ణాంకం అయి ఉండాలి
err-ipfs-reply-decode = IPFS జవాబు డీకోడ్ విఫలమైంది: { $e }
err-edit-cbor = CBOR సవరణ లోపం: { $e }
err-popup-blocked = బ్రౌజర్ పాప్‌అప్‌ను బ్లాక్ చేసింది
status-publishing = ప్రచురిస్తోంది

# ── redigering ─────────────────────────────────────────────────────
term-error = లోపం
term-error-detail = లోపం: { $detail }
msg-new-message = ← [{ $from }] కొత్త సందేశం — { $count } ఇన్‌బాక్స్‌లో
msg-chat = { $sender } అంటారు { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } అంటున్నారు { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } గదిలోకి వచ్చారు.
room-leave = * { $name } గది వదిలి వెళ్ళారు.
room-drop  = * { $name } { $thing } వదిలారు.
room-take  = * { $name } { $thing } తీసారు.
err-edit-decode-failed = సవరణ: డీకోడ్ విఫలమైంది: { $e }
err-edit-fetch-failed = సవరణ: పొందడం విఫలమైంది: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = క్రియాశీల సెషన్ లేదు — ప్రొఫైల్ తొలగించడం సాధ్యం కాదు
profile-delete-error = ప్రొఫైల్ తొలగింపు విఫలమైంది: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = ప్రొఫైల్ గుప్తీకరించి IPFS కు పంపబడింది; CID వచ్చినప్పుడు DID పత్రం నవీకరించబడుతుంది
profile-publish-done = ప్రొఫైల్ ప్రచురించబడింది — DID పత్రం ma.agent CID తో నవీకరించబడింది
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = గుర్తింపు ఇప్పటికే ప్రచురించబడింది — ప్రొఫైల్ తాజాగా ఉంది
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = బైనరీ కంటెంట్ (ప్రదర్శించబడలేదు)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ఏదీ లేదు)
profiles-deleted = ప్రొఫైల్ { $name } తొలగించబడింది
profiles-not-found = ప్రొఫైల్ కనుగొనబడలేదు: { $name }

# -- Help topics index
help-header-topics = -- విషయాలు -- వివరాలకు .help/<topic> టైప్ చేయండి
help-topic-msg = .help/msg సందేశాలు
help-topic-ma = .help/ma                     間-స్పేస్, పబ్లిషింగ్ మరియు ఎంట్రీ
help-topic-path = .help/path                   స్థానిక డాట్-పాత్ వ్యాకరణం
help-topic-my =   .help/my                     వ్యక్తిగత config
help-topic-inbox =   .help/inbox                  ఇన్‌బాక్స్
help-topic-doc =   .help/doc                    పత్రాలు
help-topic-actor =   .help/actor                  దూర actor
help-topic-z =   .help/z                      పబ్లిక్ మరియు ప్రైవేట్ Scheme కంటెంట్
help-topic-zscheme =   .help/zscheme               ఇన్‌లైన్ Scheme వ్యక్తీకరణలు మరియు పత్రాలు
help-unknown-topic =   .help/{ $topic }: తెలియని విషయం

# -- Help actor section
help-header-actor = -- దూర actorలు
help-actor-echo =   @actor                       పరిష్కరించిన DID చూపు
help-actor-text = @actor[#entity]!msg|!say|!emote body         డైరెక్ట్/చాట్/ఎమోట్ మెసేజ్ పంపండి
help-actor-ping = @actor:ping                  సజీవత పింగ్
help-actor-entities =   @actor/entities              entityలను జాబితా చేయి
help-actor-entities-get = @actor/entities/<n>          ఎంటిటీ నోడ్‌ని పొందండి
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entityని సవరించు
help-actor-entities-del = @actor/entities/<n>:         ఎంటిటీని తొలగించండి
help-actor-config-get =   @actor/config/<key>          config విలువను తెచ్చు
help-actor-config-set =   @actor/config/<key>: val     config విలువను సెట్ చేయి
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL సవరించు
help-actor-fragment =   @actor#entity                pluginకు పంపు
help-actor-fragment-verb = @actor#entity:verb [args] pluginకు
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...) call an entity from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg)) సెషన్ వాతావరణంలో 5 ప్రత్యుత్తరాలను ఉంచండి

help-topic-url =   .help/url                    URL లింక్ ద్వారా operator తెరవడం
help-topic-i18n = .help/i18n                   మీ గుర్తింపు కోసం భాష ప్రాధాన్యత
help-header-url = ── URL పారామీటర్లు ──────────────────────────────────────────────────────────────
help-url-intro =   ముందే నింపిన గ్రాహకుడితో operator తెరిచే లింక్ పంచుకోండి:
help-url-msg =   ?msg=<did>                   ముందే నింపుతుంది: @<did>!msg (సాధారణ సందేశం)
help-url-say =   ?say=<did>                   ముందే నింపుతుంది: @<did>!say (say క్రియ)
help-url-emote =   ?emote=<did>                 ముందే నింపుతుంది: @<did>!emote (emote క్రియ)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             లాగిన్ అయిన తర్వాత రన్‌టైమ్ ప్రపంచాన్ని నమోదు చేయండి
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ఇన్‌పుట్ ముందే నింపబడింది కానీ పంపబడలేదు — పంపడానికి Enter నొక్కండి.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                నెట్‌వర్క్‌లో మీ గుర్తింపు ప్రచురించండి
help-header-publish = ── గుర్తింపు ప్రచురణ ────────────────────────────────────────────────────────
help-publish-intro = ప్రచురణ మీ గుర్తింపును నెట్‌వర్క్‌లో కనుగొనగలిగేలా చేస్తుంది. ఇతరులు మీ DID వెతికి మిమ్మల్ని చేరుకోవచ్చు.
help-publish-ma = ప్రచురించడానికి 間 (స్థానిక రన్‌టైమ్) ఇన్‌స్టాల్ అయి ఉండాలి. ఇది మీ తరపున operator ని IPFS/IPNS తో అనుసంధానిస్తుంది.
help-publish-steps = దశలు: స్థానిక ma కనుగొనడానికి '.ma: claim [port]' అమలు చేయండి, తర్వాత '.my.identity!publish @ma'.
help-publish-without = ప్రచురణ లేకుండా ఇతరులు మీకు చేరుకోలేరు — మీ DID తెలిసినా మీ endpoint పరిష్కరించలేరు.
profile-fetch-did-resolve-failed = ఇంకా ప్రచురించబడలేదు — ముందుగా 28ని అమలు చేయండి, ఆపై మీ ప్రొఫైల్ 67ని అమలు చేయండి
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = ప్రొఫైల్ పేరును పేర్కొనండి: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = కలెక్టింగ్ బ్యాచ్ — టైప్ ఆదేశాలు, .batchతో ముగుస్తుంది
batch-already-collecting = ఇప్పటికే బ్యాచ్‌ని సేకరిస్తోంది — ముందుగా .batchతో ముగించండి
batch-empty = బ్యాచ్ ఖాళీగా ఉంది - అమలు చేయడానికి ఏమీ లేదు
batch-running = batch నడుస్తోంది…
batch-step-timeout = బ్యాచ్ దశ సమయం ముగిసింది

batch-done = batch { $secs }sలో పూర్తయింది — { $steps } దశలు
batch-done-error = batch లోపాలతో { $secs }sలో పూర్తయింది — { $steps } దశలు
msg-timeout = సందేశం గడువు ముగిసింది (60sలో ప్రత్యుత్తరం లేదు)
msg-outbox-open-timeout = నటుడు { $target } అందుబాటులో లేడు — { $ms }ms తర్వాత కనెక్షన్ గడువు ముగిసింది
msg-outbox-send-timeout = { $target }కి పంపడం { $ms }ms తర్వాత గడువు ముగిసింది — కనెక్షన్ తెగిపోయి ఉండవచ్చు
err-unknown-command = తెలియని ఆదేశం: { $path }
err-read-only-path = { $path } చదవడానికి మాత్రమే
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        scratch పత్రాన్ని సమాంతరంగా అమలు చేయి


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } తీసుకురావడం విఫలమైంది: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = చెల్లని CID: { $value }
label-runtime = మా
label-runtime-placeholder = did:ma:...
warning-remote-runtime = హెచ్చరిక: మీ IPNS ప్రైవేట్ కీ గుర్తింపు ప్రచురణ కోసం ఈ రన్‌టైమ్‌కు పంపబడుతుంది. మీరు పూర్తిగా విశ్వసించే రన్‌టైమ్‌ మాత్రమే ఉపయోగించండి.

# -- Help text -- z and my
help-header-z = ── .z మరియు .my ─────────────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       పొతు లేదా ప్రకటించత్తకు అనువు కంటెంట్; ఇక్కడ రహస్యాలను నిల్వ చేయకండి
help-z-scheme =   .z.scheme                  ప్రారంభంలో లోడ్ చేసి మూల్యాంకనం చేయబడే Scheme స్క్రిప్ట్
help-z-control =   .z.scheme                 ప్రారంభ స్క్రిప్ట్ కంటెంట్ను మీరే నియంత్రిస్తారు
help-z-private =   .my.*                     ప్రైవేట్ లోకల్ కాన్ఫిగరేషన్; Scheme ఇక్కడ కూడా నిల్వ చేయవచ్చు
help-z-choice =   .z.* / .my.*               పొతు Schemeకు .z.* మరియు ప్రైవేట్ Schemeకు .my.* ఉపయోగించండి

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme operator ఆదేశాల్లో చొప్పించిన Scheme వ్యక్తీకరణలను మూల్యాంకనం చేసి, పంపే ముందు ఫలితాన్ని అదే పంక్తిలో చేర్చుతుంది.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ఇన్‌లైన్ ఉదాహరణ; "say 7 + 5 = 12" పంపుతుంది
help-zscheme-define =   (define x 12)             నిర్వచనలు ప్రస్తుత లాగిన్ సెషన్‌లో కొనసాగుతాయి
help-zscheme-doc = పత్రాలు: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = స్థానిక IPFS గేట్‌వే (బ్రౌజర్ మినహాయింపు అవసరం)

tab-config = సెట్టింగ్‌లు
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
