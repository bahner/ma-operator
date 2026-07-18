# zion — తెలుగు
lang-name = తెలుగు

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
passphrase-warning = పాస్‌ఫ్రేజ్ పోయింది = గుర్తింపు పోయింది. పునరుద్ధరణ సాధ్యం కాదు.
import-profile-help = CID లేదా ఫైల్ ద్వారా ప్రొఫైల్ దిగుమతి చేయండి. ప్రచురించినప్పుడు ఉపయోగించిన అదే పాస్‌ఫ్రేజ్ అవసరం.
import-profile-detected-user = ప్రొఫైల్ సొంతదారు: { $name }
status-unlocking = అన్‌లాక్ అవుతోంది...
status-generating = గుర్తింపు తయారవుతోంది...
status-reading-file = ఫైల్ చదువుతోంది...
status-fetching-profile = IPFS నుండి ప్రొఫైల్ తీసుకుంటోంది...
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
msg-logged-in = zion v{ $version } — { $username } గా లాగిన్ అయ్యారు
msg-type-help = ఆదేశాల జాబితా కోసం .help అని టైప్ చేయండి.
msg-connecting = iroh కి కనెక్ట్ అవుతోంది...
msg-iroh-ready = iroh ఎండ్‌పాయింట్ సిద్ధంగా ఉంది
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID స్థానిక ma ({ $url }) ద్వారా ప్రచురించబడింది
msg-identity-not-published = గుర్తింపు ఆన్‌లైన్‌లో కనుగొనబడలేదు — ma స్థానికంగా ఇన్‌స్టాల్ అయి ఉంటే, '.ma [port]' అప్పుడు '.my.identity!publish @ma' అమలు చేయండి. వివరాల కోసం '.help/publish' టైప్ చేయండి.
msg-blocked = ⊗ నిరోధించబడింది [{ $cap }]: { $from }
msg-focus-cleared = ఫోకస్ తొలగించబడింది
msg-focusing = { $did } ని { $prompt } గా ఫోకస్ చేస్తోంది
msg-set = { $path }: { $value }
msg-deleted = { $path } తొలగించబడింది ({ $count } నమోదులు)
msg-read-only = { $path } చదవడానికి మాత్రమే
msg-subtree-set = { $path } సబ్‌ట్రీ; సెట్ చేయడానికి నిరాకరించింది
msg-ancestor-leaf = { $path } యొక్క పూర్వీకుడు లీఫ్; నీడ చేయడానికి నిరాకరించింది
msg-key-not-found = కీ కనుగొనబడలేదు: { $path }
msg-no-match = సరిపోలిక లేదు
msg-link-not-connected = లింక్ పొందడంలో లోపం: కనెక్ట్ కాలేదు
msg-link-fetch-error = లింక్ పొందడంలో లోపం: { $e }
msg-link-key-not-found = లింక్ చేసిన డాక్యుమెంట్‌లో కీ `{ $key }` కనుగొనబడలేదు

# ── మారుపేరు ధృవీకరణ ─────────────────────────────────────────────────────
err-alias-name-empty = మారుపేరు ఖాళీగా ఉండకూడదు
err-alias-has-dot = మారుపేర్లలో '.' ఉండకూడదు
err-alias-has-fragment = మారుపేర్లలో '#' ఉండకూడదు
err-alias-value-fragment = మారుపేరు విలువ bare did:ma:<ipns> అయి ఉండాలి (ఫ్రాగ్మెంట్ లేదు)
err-alias-value-path = మారుపేరు విలువ bare did:ma:<ipns> అయి ఉండాలి (పాత్ లేదు)
err-alias-not-did = మారుపేరు విలువ did:ma: తో మొదలవ్వాలి
err-unknown-alias = తెలియని మారుపేరు: @{ $name }
err-bare-did = bare did:ma:<ipns> (ఫ్రాగ్మెంట్ లేదా పాత్ లేదు) అపేక్షించబడింది, పొందింది { $did }

# ── ఎడిటర్ ────────────────────────────────────────────────────────────────
btn-save = సేవ్ చేయండి
btn-eval = అమలు చేయండి
btn-cancel = రద్దు చేయండి
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
discover-success = { $url } వద్ద ma కనుగొనబడింది
discover-did-line = DID: { $did }
discover-alias-hint =   మారుపేరు @ma సృష్టించబడింది — మీ గుర్తింపు ప్రచురించడానికి '.my.identity!publish @ma' అమలు చేయండి.
claim-success = { $did } కోసం రన్‌టైమ్ క్లెయిమ్ చేయబడింది
claim-conflict = రన్‌టైమ్ ఇప్పటికే మరొక గుర్తింపు ద్వారా క్లెయిమ్ చేయబడింది
claim-http-failed = క్లెయిమ్ విఫలమైంది: HTTP { $status }
claim-error = క్లెయిమ్ విఫలమైంది: { $e }
claim-no-session = లాగిన్ కాలేదు; రన్‌టైమ్ క్లెయిమ్ చేయడానికి ముందు లాగిన్ చేయండి
runtime-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు

# ── క్రియలు — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl రీసెట్ చేయబడింది (పూర్తిగా తెరవబడింది)
acl-persist-error = సేవ్ లోపం: { $e }
acl-no-verb = .my.acl కోసం `{ $verb }` క్రియ లేదు

# ── క్రియలు — గుర్తింపు ──────────────────────────────────────────────────
publish-usage = వాడకం: .my.identity!publish <did-లేదా-మారుపేరు>
identity-exported = బండిల్ { $filename } గా డౌన్‌లోడ్ అయింది
identity-export-failed = ఎగుమతి విఫలమైంది: { $e }

# ── క్రియలు — డాక్యుమెంట్‌లు ────────────────────────────────────────────
doc-content-empty = { $path }.content ఖాళీగా ఉంది
doc-save-first = { $path }.content ఖాళీగా ఉంది — ముందు సేవ్ చేయండి
doc-missing-name = డాక్యుమెంట్ పేరు లేదు
doc-publish-usage = వాడకం: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = వాడకం: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ప్రచురణ { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = స్టోర్ అభ్యర్థన పంపబడింది ({ $id }) → { $publisher }; CID RPC జవాబు ద్వారా వస్తుంది
doc-ipld-store-sent = IPLD స్టోర్ అభ్యర్థన పంపబడింది ({ $id }) → { $publisher }; CID RPC జవాబు ద్వారా వస్తుంది
doc-fetch-done = { $cid } తెచ్చబడింది → { $path }.content (అమలు చేయలేదు)
doc-fetch-failed = పొందు { $cid }: { $e }
doc-fetch-usage = వాడకం: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid సెట్ చేయలేదు
doc-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు
path-no-verb = { $path } కోసం `{ $verb }` క్రియ లేదు

# ── సహాయం — శీర్షికలు ─────────────────────────────────────────────────────
help-header-zion = ── zion ఆదేశాలు ─────────────────────────────────────────────────────────
help-header-messaging = ── సందేశం ─────────────────────────────────────────────────────────────────
help-header-focus = ── ఫోకస్ మోడ్ ─────────────────────────────────────────────────────────────
help-header-config = ── స్థానిక కాన్ఫిగ్ వ్యాకరణం ──────────────────────────────────────────────
help-header-common = ── సాధారణ మార్గాలు ──────────────────────────────────────────────────────────
help-header-inbox = ── ఇన్‌బాక్స్ ────────────────────────────────────────────────────────────────
help-header-documents = ── డాక్యుమెంట్‌లు ──────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── సహాయం — zion ఆదేశాలు ────────────────────────────────────────────────
help-cmd-help =   .help                        ఈ టెక్స్ట్
help-cmd-clear =   .clear                       టెర్మినల్ క్లియర్ చేయండి
help-cmd-panic =   .panic                       చివరి మార్గం — సమస్య వస్తే వాడండి
help-cmd-history =   .history                     ఆదేశ చరిత్ర (వరుస నకళ్ళు విలీనమయ్యాయి)
help-cmd-logout =   .logout                      లాగ్ అవుట్
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)

# ── సహాయం — సందేశం ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       పరిష్కరించిన DID చూపించు (సందేశం పంపలేదు)
help-msg-send =   @alias!msg body / @alias:verb args           నటుడికి సందేశం / RPC పంపండి
help-msg-fragment =   @alias#fragment:verb body  స్పష్టమైన DID ఫ్రాగ్మెంట్‌తో పంపండి
help-msg-escape =   \@name                       అక్షరార్థ @name (మారుపేరు శోధన లేదు)

# ── సహాయం — ఫోకస్ మోడ్ ───────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       నటుడిపై ఫోకస్ చేయండి (ప్రాంప్ట్ మారుతుంది)
help-focus-clear =   .use                         ఫోకస్ తొలగించండి

# ── సహాయం — కాన్ఫిగ్ వ్యాకరణం ────────────────────────────────────────────
help-config-get =   .path                        లీఫ్ విలువ పొందండి లేదా సబ్‌ట్రీ జాబితా చేయండి
help-config-filter =   .path value                  విలువతో ఫిల్టర్ చేయండి
help-config-set =   .path: value                 లీఫ్ సెట్ చేయండి
help-config-delete =   .path:                       లీఫ్ లేదా సబ్‌ట్రీ తొలగించండి
help-config-verb =   .path!verb [args]            స్థానిక క్రియ కాల్ చేయండి

# ── సహాయం — సాధారణ మార్గాలు ──────────────────────────────────────────────
help-my =   .my                          అన్ని వ్యక్తిగత కాన్ఫిగ్ చూపించు
help-aliases =   .my.aliases                  మారుపేర్ల జాబితా
help-aliases-set =   .my.aliases.<name>: <did>    మారుపేరు జోడించు/అప్‌డేట్ చేయి
help-aliases-del =   .my.aliases.<name>:          మారుపేరు తొలగించు
help-runtime-discover =   .ma [port]          స్థానిక రన్‌టైమ్ కనుగొనండి మరియు @ma సృష్టించండి
help-runtime-claim =   .ma [port]             మీ DID తో రన్‌టైమ్ క్లెయిమ్ చేయండి
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
yaml-serialize-error = YAML సీరియలైజేషన్ లోపం: { $e }
edit-reply-invalid = చెల్లని సవరణ జవాబు
doc-publish-ipld-error = IPLD ప్రచురణ విఫలమైంది: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ఇన్‌బాక్స్ తగ్గింపు నిల్వ లోపం: { $e }
err-config-load = కాన్ఫిగ్ లోడ్ లోపం: { $e }
err-lang-persist = భాష నిల్వ లోపం: { $e }
err-history-parse = చరిత్ర పార్సింగ్ లోపం: { $e }
err-history-load = చరిత్ర లోడ్ లోపం: { $e }
err-ipfs-reply-decode = IPFS జవాబు డీకోడ్ విఫలమైంది: { $e }
err-edit-cbor = CBOR సవరణ లోపం: { $e }
err-popup-blocked = బ్రౌజర్ పాప్‌అప్‌ను బ్లాక్ చేసింది
status-publishing = ప్రచురిస్తోంది

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = లోపం
rpc-error-detail = లోపం: { $detail }
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
profiles-empty = (ఏదీ లేదు)
profiles-deleted = ప్రొఫైల్ { $name } తొలగించబడింది
profiles-not-found = ప్రొఫైల్ కనుగొనబడలేదు: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
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
help-actor-entities-get =   @actor/entities/<n>          get entity
help-actor-entities-set =   @actor/entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help/url                    URL లింక్ ద్వారా zion తెరవడం
help-header-url = ── URL పారామీటర్లు ──────────────────────────────────────────────────────────────
help-url-intro =   ముందే నింపిన గ్రాహకుడితో zion తెరిచే లింక్ పంచుకోండి:
help-url-msg =   ?msg=<did>                   ముందే నింపుతుంది: @<did>!msg (సాధారణ సందేశం)
help-url-say =   ?say=<did>                   ముందే నింపుతుంది: @<did>!say (say క్రియ)
help-url-emote =   ?emote=<did>                 ముందే నింపుతుంది: @<did>!emote (emote క్రియ)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-ctx =   ?ctx=<actor[#entity]>         auto-focus actor/entity after login
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   ఇన్‌పుట్ ముందే నింపబడింది కానీ పంపబడలేదు — పంపడానికి Enter నొక్కండి.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                నెట్‌వర్క్‌లో మీ గుర్తింపు ప్రచురించండి
help-header-publish = ── గుర్తింపు ప్రచురణ ────────────────────────────────────────────────────────
help-publish-intro = ప్రచురణ మీ గుర్తింపును నెట్‌వర్క్‌లో కనుగొనగలిగేలా చేస్తుంది. ఇతరులు మీ DID వెతికి మిమ్మల్ని చేరుకోవచ్చు.
help-publish-ma = ప్రచురించడానికి ma (స్థానిక రన్‌టైమ్) ఇన్‌స్టాల్ అయి ఉండాలి. ఇది మీ తరపున ego ని IPFS/IPNS తో అనుసంధానిస్తుంది.
help-publish-steps = దశలు: స్థానిక ma కనుగొనడానికి '.ma [port]' అమలు చేయండి, తర్వాత '.my.identity!publish @ma'.
help-publish-without = ప్రచురణ లేకుండా ఇతరులు మీకు చేరుకోలేరు — మీ DID తెలిసినా మీ endpoint పరిష్కరించలేరు.
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
scheme-cid-fetch-error = CID { $cid } తీసుకురావడం విఫలమైంది: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = చెల్లని CID: { $value }
label-runtime = మా
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = హెచ్చరిక: మీ IPNS ప్రైవేట్ కీ గుర్తింపు ప్రచురణ కోసం ఈ రన్‌టైమ్‌కు పంపబడుతుంది. మీరు పూర్తిగా విశ్వసించే రన్‌టైమ్‌ మాత్రమే ఉపయోగించండి.
