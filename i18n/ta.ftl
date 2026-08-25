# zion — தமிழ்
lang-name = தமிழ்
label-nick = செல்லப்பெயர்
new-identity-nick-help = 間-space க்கான செல்லப்பெயரைத் தேர்வுசெய்க. அது ஒரு செல்லப்பெயர் மட்டுமே; எப்போது வேண்டுமானாலும் மாற்றலாம்.
error-nick-required = செல்லப்பெயர் தேவை
error-nick-invalid = செல்லப்பெயரில் இடைவெளி அல்லது @ இருக்கக் கூடாது

# ── உள்நுழைவு பக்கம் ─────────────────────────────────────────────────────
tab-login = உள்நுழைவு
tab-new-identity = புதிய அடையாளம்
tab-import-profile = சுயவிவரம் இறக்கு
label-passphrase = கடவுச்சொற்றொடர்
label-username = பயனர்பெயர்
label-confirm-passphrase = கடவுச்சொற்றொடரை உறுதிப்படுத்தவும்
label-did = DID
label-profile-cid = சுயவிவர CID
label-or-file = அல்லது கோப்பு
btn-login = உள்நுழையவும்
btn-export = ஏற்றுமதி
btn-generate = உருவாக்கவும்
btn-new-endpoint = புதிய இறுதிப்புள்ளி
btn-import-profile = சுயவிவரம் இறக்கு
btn-show-qr = QR காட்டு
btn-scan-qr = QR ஸ்கேன் செய்
qr-scan-hint = கேமராவை zion சுயவிவர QR குறியீட்டின் பக்கம் திருப்புங்கள்.
qr-error-camera = கேமரா கிடைக்கவில்லை: { $e }
qr-error-too-large = QR குறியீட்டுக்கு சுயவிவரம் மிகப் பெரியது
passphrase-warning = கடவுச்சொற்றொடர் தொலைந்தால் அடையாளம் தொலையும். மீட்பு இல்லை.
import-profile-help = CID அல்லது கோப்பின் மூலம் சுயவிவரம் இறக்குங்கள். வெளியிடும்போது பயன்படுத்திய அதே கடவுச்சொல் தேவை.
import-profile-detected-user = சுயவிவரம் இதற்கு சொந்தமானது: { $name }
status-unlocking = திறக்கப்படுகிறது...
status-generating = அடையாளம் உருவாக்கப்படுகிறது...
status-reading-file = கோப்பு படிக்கப்படுகிறது...
status-fetching-profile = IPFS இலிருந்து சுயவிவரம் பெறுகிறது...
status-imported = '{ $name }' இறக்குமதி செய்யப்பட்டது — உள்நுழைவு தாவலுக்குச் செல்லவும்
status-importing-profile = சுயவிவரம் இறக்குகிறது...
profile-import-done = '{ $name }' க்காக சுயவிவரம் இறக்கப்பட்டது — { $n } விசைகள் ஏற்றப்பட்டன
error-wrong-passphrase = தவறான கடவுச்சொற்றொடர்: { $e }
error-identity-not-found = அடையாளம் '{ $name }' கிடைக்கவில்லை
error-username-required = பயனர்பெயர் தேவை
error-passphrase-required = கடவுச்சொற்றொடர் தேவை
error-passphrases-no-match = கடவுச்சொற்றொடர்கள் பொருந்தவில்லை
error-profile-source-required = CID கொடுங்கள் அல்லது கோப்பு பதிவேற்றுங்கள்
error-did-required = உங்கள் DID ஐ உள்ளிடவும்
error-profile-fetch = சுயவிவரம் பெற முடியவில்லை: { $e }
error-profile-no-username = சுயவிவரத்தில் பயனர்பெயர் இல்லை
error-profile-no-identity = அடையாளம் '{ $name }' கண்டுபிடிக்கவில்லை — முதலில் அடையாளம் இறக்குங்கள்

# ── முனையம் கணினி செய்திகள் ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } ஆக உள்நுழைந்தீர்கள்
msg-type-help = கட்டளைகளின் பட்டியலுக்கு .help தட்டச்சு செய்யவும்.
msg-getting-started = தொடங்க முயலுங்கள்: say Hello world, look, .help, அல்லது help.
msg-connecting = iroh உடன் இணைக்கப்படுகிறது...
msg-iroh-ready = iroh இறுதிப்புள்ளி தயார்
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID உள்ளூர் 間 ({ $url }) வழியாக வெளியிடப்பட்டது
msg-identity-publication-propagating = அடையாள வெளியீடு இன்னும் பரவி வருகிறது; entry தாமதமாகிறது: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = அடையாளம் வெளியிடப்படுகிறது. இது அதிகபட்சம் { $seconds } விநாடிகள் ஆகலாம்.
msg-ma-connecting-matrix = உங்களை 間trix உடன் இணைக்க முயல்கிறது
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = உள்ளூர் 間 கோரப்பட்டது
msg-local-ma-already-claimed = உள்ளூர் 間 ஏற்கனவே கோரப்பட்டுள்ளது
msg-local-ma-claim-failed = உள்ளூர் 間 கோர முடியவில்லை
msg-identity-not-published = அடையாளம் இணையத்தில் காணப்படவில்லை — 間 உள்நாட்டில் நிறுவப்பட்டிருந்தால், '.ma: claim [port]' பின்னர் '.my.identity!publish @ma' இயக்கவும். விவரங்களுக்கு '.help/publish' தட்டச்சு செய்யவும்.
msg-blocked = ⊗ தடுக்கப்பட்டது [{ $cap }]: { $from }
msg-focus-cleared = கவனம் அழிக்கப்பட்டது
msg-left = left
msg-focusing = { $did } ஐ { $prompt } ஆக கவனம் செலுத்துகிறது
msg-set = { $path }: { $value }
msg-deleted = { $path } நீக்கப்பட்டது ({ $count } உள்ளீடுகள்)
msg-read-only = { $path } படிக்க மட்டுமே
msg-subtree-set = { $path } ஒரு துணைமரம்; அமைக்க மறுக்கப்பட்டது
msg-ancestor-leaf = { $path } இன் ஒரு மூதாதையர் இலை; நிழலிட மறுக்கப்பட்டது
msg-key-not-found = திறவுச்சொல் கிடைக்கவில்லை: { $path }
msg-link-not-connected = இணைப்பு பெறுவதில் பிழை: இணைக்கப்படவில்லை
msg-link-fetch-error = இணைப்பு பெறுவதில் பிழை: { $e }
msg-link-key-not-found = இணைக்கப்பட்ட ஆவணத்தில் திறவுச்சொல் `{ $key }` கிடைக்கவில்லை

# ── புனைப்பெயர் சரிபார்ப்பு ──────────────────────────────────────────────
err-alias-name-empty = புனைப்பெயர் வெறுமையாக இருக்க முடியாது
err-alias-has-dot = புனைப்பெயர்களில் '.' இருக்க முடியாது
err-alias-has-fragment = புனைப்பெயர்களில் '#' இருக்க முடியாது
err-alias-value-fragment = புனைப்பெயர் மதிப்பில் அதிகபட்சம் ஒரு காலியாகாத DID-URL துண்டு இருக்கலாம்
err-alias-value-path = புனைப்பெயர் மதிப்பு did:ma:<ipns> DID அல்லது DID-URL ஆக இருக்க வேண்டும் (path இல்லை)
err-alias-not-did = புனைப்பெயர் மதிப்பு did:ma: உடன் தொடங்க வேண்டும்
err-unknown-alias = அறியப்படாத புனைப்பெயர்: @{ $name }
err-bare-did = bare did:ma:<ipns> (துண்டு அல்லது பாதை இல்லாமல்) எதிர்பார்க்கப்பட்டது, கிடைத்தது { $did }

# ── திருத்தி ──────────────────────────────────────────────────────────────
btn-save = சேமி
btn-eval = இயக்கவும்
btn-cancel = ரத்து செய்
msg-jobs-cancelled = பணிகள் ரத்து செய்யப்பட்டன
btn-close = மூடவும்
btn-reply = பதிலளிக்கவும்
btn-publish = வெளியிடவும்
btn-publish-ipld = வெளியிடவும் IPLD
msg-reply-sent = பதில் அனுப்பப்பட்டது
msg-reply-failed = பதில் தோல்வியடைந்தது: { $e }
msg-entity-publish-sent = நிறுவனம் { $name }: வெளியீடு அனுப்பப்பட்டது
msg-entity-publish-failed = நிறுவன வெளியீடு தோல்வியடைந்தது: { $e }
msg-kind-publish-failed = வகை வெளியீடு தோல்வியுற்றது: { $e }
msg-field-publish-sent = நிறுவனம் { $name }.{ $field }: வெளியீடு அனுப்பப்பட்டது
msg-field-publish-failed = புலம் வெளியீடு தோல்வியடைந்தது: { $e }
msg-acl-publish-sent = இயக்க நேர ACL: வெளியீடு அனுப்பப்பட்டது
msg-crud-edit-publish-sent = { $path }: வெளியீடு அனுப்பப்பட்டது
msg-acl-publish-failed = இயக்க நேர ACL வெளியீடு தோல்வியடைந்தது: { $e }
msg-yaml-error = YAML பிழை: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } பெறப்பட்டது — இயக்குவதற்கு முன் மதிப்பாய்வு செய்யவும்
msg-fetch-failed = பெறு { $cid }: { $e }

# ── வினைச்சொற்கள் — உள்வரவு ─────────────────────────────────────────────
inbox-empty = உள்வரவு காலியாக உள்ளது
inbox-entry-not-found = உள்வரவு உள்ளீடு { $n } கிடைக்கவில்லை
inbox-no-message-id = உள்வரவு உள்ளீடு { $n } க்கு message_id இல்லை
inbox-no-verb = உள்வரவு உள்ளீடு { $n } க்கு `{ $verb }` வினைச்சொல் இல்லை
inbox-filter-no-arg = வடிகட்டிக்கு DID அல்லது புனைப்பெயர் வாதம் தேவை
inbox-filter-empty = { $did } இலிருந்து செய்திகள் இல்லை

# ── வினைச்சொற்கள் — இயக்க நேரம் ─────────────────────────────────────────
discover-fetch-failed = { $url } இல் கண்டுபிடித்தல் தோல்வியடைந்தது: { $e }
discover-json-error = கண்டுபிடித்தல் தோல்வியடைந்தது: { $url } இலிருந்து தவறான JSON: { $e }
discover-missing-did = கண்டுபிடித்தல் தோல்வியடைந்தது: status.json இல் `did` புலம் இல்லை
discover-invalid-did = கண்டுபிடித்தல் தோல்வியடைந்தது: `did` did:ma: உடன் தொடங்க வேண்டும், கிடைத்தது `{ $did }`
discover-no-endpoint = கண்டுபிடித்தல் எச்சரிக்கை: status.json இல் `endpoint_id` இல்லை; DID மட்டும் சேமிக்கப்பட்டது
discover-hint-endpoint-not-found = குறிப்பு: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = குறிப்பு: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = குறிப்பு: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = குறிப்பு: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = { $url } இல் 間 கண்டுபிடிக்கப்பட்டது
discover-did-line = DID: { $did }
discover-alias-hint =   புனைப்பெயர் @ma உருவாக்கப்பட்டது — உங்கள் அடையாளத்தை வெளியிட '.my.identity!publish @ma' இயக்கவும்.
claim-success = { $did } க்கு இயக்க நேரம் கோரப்பட்டது
claim-conflict = இயக்க நேரம் ஏற்கனவே மற்றொரு அடையாளத்தால் கோரப்பட்டுள்ளது
claim-already-owned = இந்த அடையாளம் Runtime-ஐ ஏற்கனவே கோரியுள்ளது
claim-http-failed = கோரிக்கை தோல்வியடைந்தது: HTTP { $status }
claim-error = கோரிக்கை தோல்வியடைந்தது: { $e }
claim-no-session = உள்நுழையவில்லை; இயக்க நேரம் கோர முதலில் உள்நுழையவும்
runtime-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── வினைச்சொற்கள் — ACL ──────────────────────────────────────────────────
acl-reset = .my.acl மீட்டமைக்கப்பட்டது (முழுமையாக திறந்தது)
err-persist = சேமிப்பு பிழை: { $e }
acl-no-verb = .my.acl க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── வினைச்சொற்கள் — அடையாளம் ──────────────────────────────────────────
publish-usage = பயன்பாடு: .my.identity!publish <did-அல்லது-புனைப்பெயர்>
identity-exported = தொகுப்பு { $filename } என பதிவிறக்கப்பட்டது
identity-export-failed = ஏற்றுமதி தோல்வி: { $e }

# ── வினைச்சொற்கள் — ஆவணங்கள் ───────────────────────────────────────────
doc-content-empty = { $path } காலியாக உள்ளது
doc-save-first = { $path } காலியாக உள்ளது — முதலில் சேமிக்கவும்
doc-missing-name = ஆவணப் பெயர் இல்லை
doc-publish-usage = பயன்பாடு: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = பயன்பாடு: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = வெளியீடு { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = வெளியிடல் தோல்வியடைந்தது [{ $code }]: { $err }
doc-publish-error-hint = குறிப்பு: { $hint }
doc-publish-hint-session = மீண்டும் உள்நுழைக, அதனால் ஈகோ உங்கள் அடையாள விசைகளை அணுக முடியும்
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = வெளியீட்டாளர் DID ஆவணம் வெளியிடப்பட்டது மற்றும் அடையக்கூடிய இறுதிப் புள்ளியைக் கொண்டுள்ளது என்பதைச் சரிபார்க்கவும்
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = இயக்க நேரம்/சொருகி கோரிக்கையை நிராகரித்தது; காரணத்தை சரிபார்த்து, நிறுவனம்/இயக்க நேரத்தை சரிசெய்த பிறகு மீண்டும் முயற்சிக்கவும்
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = விரிவான காரணத்திற்காக இயக்க நேர பதிவுகளை ஆய்வு செய்து மீண்டும் முயற்சிக்கவும்
doc-store-sent = சேமிப்பு கோரிக்கை அனுப்பப்பட்டது ({ $id }) → { $publisher }; CID RPC பதில் வழியாக வரும்
doc-ipld-store-sent = IPLD சேமிப்பு கோரிக்கை அனுப்பப்பட்டது ({ $id }) → { $publisher }; CID RPC பதில் வழியாக வரும்
doc-fetch-done = { $cid } பெறப்பட்டது → { $path } (இயக்கப்படவில்லை)
doc-fetch-failed = பெறு { $cid }: { $e }
doc-fetch-usage = பயன்பாடு: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid அமைக்கப்படவில்லை
doc-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை
path-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── உதவி — தலைப்புகள் ─────────────────────────────────────────────────────
help-header-zion = ── zion கட்டளைகள் ───────────────────────────────────────────────────────
help-header-messaging = ── செய்தியிடல் ──────────────────────────────────────────────────────────
help-header-config = ── உள்ளூர் அமைவு இலக்கணம் ────────────────────────────────────────────────
help-header-common = ── பொதுவான பாதைகள் ──────────────────────────────────────────────────────
help-header-inbox = ── உள்வரவு ──────────────────────────────────────────────────────────────
help-header-documents = ── ஆவணங்கள் ────────────────────────────────────────────────────────────
help-header-i18n = ── மொழி ──────────────────────────── ─────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-வெளியில் நுழைகிறது ───────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── உதவி — zion கட்டளைகள் ────────────────────────────────────────────────
help-cmd-help =   .help                        இந்த உரை
help-cmd-clear =   .clear                       முனையம் அழிக்கவும்
help-cmd-panic =   .panic                       கடைசி வழி — சிக்கலில் பயன்படுத்தவும்
help-cmd-history =   .history [n]                 கட்டளை வரலாறு (தொடர்ச்சியான நகல்கள் இணைக்கப்பட்டன); விருப்பமான n கடைசி ந வரிகளை மட்டும் காட்டும்
help-cmd-logout =   .logout                      வெளியேறவும்
help-cmd-batch =   .batch                       scratch ஆவணத்தை இணையாக மதிப்பிடு
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         scratch ஆவணத்தை வரி வரியாக மதிப்பிடு

# ── உதவி — செய்தியிடல் ──────────────────────────────────────────────────
help-msg-echo =   @alias                       தீர்க்கப்பட்ட DID/DID-URL காட்டு (செய்தி அனுப்பப்படாது)
help-msg-send =   @alias!msg body / @alias:verb args           நடிகருக்கு செய்தி / RPC அனுப்பவும்
help-msg-fragment =   @alias#fragment:verb body  வெளிப்படையான DID துண்டுடன் அனுப்பவும்
help-msg-escape =   \@name                       நேரடி @name (புனைப்பெயர் தேடல் இல்லை)

# ── உதவி — கவன முறை ──────────────────────────────────────────────────────

# ── உதவி — அமைவு இலக்கணம் ────────────────────────────────────────────────
help-config-get =   .path                        இலை மதிப்பு பெறவும் அல்லது துணைமரம் பட்டியலிடவும்
help-config-filter =   .path [பெயர்]                 பெயரைக் கொண்ட குழந்தை விசைப் பெயர்களைப் பட்டியலிடவும்
help-config-full =   .path. [பெயர்]                பெயரைக் கொண்ட முழு துணைமர மதிப்புகளைப் பட்டியலிடவும்
help-config-set =   .path: value                 இலை அமைக்கவும்
help-config-delete =   .path:                       இலை அல்லது துணைமரம் நீக்கவும்
help-config-verb =   .path!verb [args]            உள்ளூர் வினைச்சொல் அழைக்கவும்

# ── உதவி — பொதுவான பாதைகள் ──────────────────────────────────────────────
help-my =   .my                          அனைத்து தனிப்பட்ட அமைவுகளை காட்டவும்
help-aliases =   .my.aliases                  புனைப்பெயர்கள் பட்டியல்
help-aliases-set =   .my.aliases.<name>: <did-url>    புனைப்பெயரை சேர்/புதுப்பி (DID அல்லது DID-URL)
help-aliases-del =   .my.aliases.<name>:          புனைப்பெயர் நீக்கவும்
help-runtime-discover =   .ma: claim [port]          உள்ளூர் இயக்க நேரம் கண்டுபிடிக்கவும் மற்றும் @ma உருவாக்கவும்
help-runtime-claim =   .ma: claim [port]             உங்கள் DID உடன் இயக்க நேரம் கோரவும்
help-identity =   .my.identity                 அடையாள அமைவு காட்டவும்
help-identity-did =   .my.identity.did             உங்கள் DID காட்டவும் (படிக்க மட்டும்)
help-identity-publish =   .my.identity!publish @pub    வெளியீட்டு சேவை மூலம் DID வெளியிடவும்
help-identity-export =   .my.identity!export          உங்கள் அடையாள தொகுப்பை பதிவிறக்கவும்
help-config-path =   .config                      அனைத்து .config.* உள்ளீடுகளை காட்டவும்

# ── உதவி — உள்வரவு ───────────────────────────────────────────────────────
help-inbox =   .my.inbox                    உள்வரவு பட்டியல் (துணைமர காட்சி)
help-inbox-n =   .my.inbox.N                  உள்ளீடு N இன் புலங்கள் காட்டவும்
help-inbox-from =   .my.inbox.N.from             உள்ளீடு N இன் அனுப்புவோர் DID
help-inbox-reply =   .my.inbox.N!reply [body]     பதில் அனுப்பவும் (உள்ளடக்கம் இல்லை — திருத்தி திறக்கும்)
help-inbox-open =   .my.inbox.N!open             படிக்க மட்டும் திருத்தியில் உள்ளடக்கம் திறக்கவும்
help-inbox-del =   .my.inbox.N:                 உள்ளீடு N நீக்கவும்
help-inbox-delall =   .my.inbox:                   அனைத்து உள்வரவு உள்ளீடுகளை நீக்கவும்
help-inbox-flush =   .my.inbox!flush              அனைத்து உள்ளீடுகளை முனையத்தில் அச்சிடவும்
help-inbox-filter =   .my.inbox!filter @who        @who இலிருந்து மட்டும் உள்ளீடுகள் காட்டு
help-inbox-traverse =   .my.inbox.N.sender.<field>   அனுப்புவோர் DID ஆவணத்தை சோம்பலாக ஆராயவும்

# ── உதவி — ஆவணங்கள் ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           சேமித்த உள்ளடக்கத்துடன் திருத்தி திறக்கவும்
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID பெற்று, மதிப்பாய்வுக்கு மட்டும் திறக்கவும்
help-doc-eval =   .my.doc.<name>!eval           சேமித்த உள்ளடக்கத்தை வரிவரியாக இயக்கவும்
help-doc-publish =   .my.doc.<name>!publish @pub   கச்சா blob ஆக சேமிக்கவும் (எந்த வகையும்)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML ஐ DAG-CBOR IPLD முனையாக சேமிக்கவும்
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID உள்ளடக்கம் இறக்குமதி செய்யவும் (இயக்கம் இல்லை)
help-doc-cid =   .my.doc.<name>!cid            சேமித்த CID காட்டவும்
help-doc-del =   .my.doc.<name>:              ஆவணம் நீக்கவும்

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n உங்கள் அடையாளத்துடன் இணைக்கப்பட்ட மொழி விருப்பத்தை சேமிக்கிறது.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               கிடைக்கக்கூடிய மொழி குறியீடுகளை பட்டியலிடுங்கள்

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 அறை என்பது 間 அடையாளங்களுக்கிடையிலான இடம். ma அவை ஒன்றையொன்று கண்டுபிடித்து தொடர்பு கொள்ள உதவுகிறது; உங்கள் அடையாளம் வெளியிடப்பட்டதும் நீங்கள் பங்கேற்கலாம்.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   உள்ளூர் 間 runtime-இற்கு இணை, /status.json படி, .ma.ctx.* சேமி
help-ma-publish =   .my.identity!publish @ma     மற்றவர்கள் உங்கள் keys மற்றும் endpoint-ஐ கண்டறிய உங்கள் DID ஆவணத்தை வெளியிடு
help-ma-security = மிகத் தெளிவான நம்பிக்கை எல்லை, உங்கள் சொந்த IPFS Desktop/Kubo உடன் உங்கள் சொந்த 間 runtime ஆகும். தொலை publisher உதவலாம், ஆனால் அப்போது நீங்கள் வேறு ஒருவரின் சேவையை நம்புகிறீர்கள்.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 அறைக்குள் எப்படி நுழைவது

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = உங்கள் அடையாளம் அறியப்பட்டதும், .enter @ma உங்களை 間-க்குள் செல்ல விடும். ஒரு world-ஐ கண்டுபிடித்து அதில் நுழைந்து, அங்கிருந்து பங்கேற்குங்கள்.
help-ma-entry-steps = IPFS Desktop மற்றும் ma தொடங்கு, பின்னர் .ma இயக்கு. .my.identity!publish @ma மூலம் வெளியிடு, ஒரு world-ஐ கண்டுபிடி, .enter @ma மூலம் நுழை.
help-ma-entry-command =   .enter @ma                  @ma runtime வழியாக 間-க்குள் நுழை
help-ma-entry-toggle =   .enter                       அறை கவனத்தை இயக்கவும் அல்லது அணைக்கவும்; உங்கள் அடையாளம் செயலில் இருக்கும்
help-ma-entry-url =   ?enter=<runtime>             பகிரப்பட்ட URL-இல் login ஆன பின் நுழை

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = கிடைக்கும் மொழிகள் (.my.i18n: <code> உடன் அமைக்கவும்):
err-lang-not-found = மொழி கண்டுபிடிக்கப்படவில்லை: { $lang }

msg-send-failed = அனுப்புதல் தோல்வி: { $e }
msg-not-logged-in = உள்நுழைக்கவில்லை

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML பாகுபடுத்தல் பிழை: { $e }
yaml-not-mapping = YAML ஒரு மேப்பிங் (விசை: மதிப்பு ஜோடிகள்) ஆக இருக்க வேண்டும்; சாதாரண உரையும் ஸ்கேலர்களும் DAG-CBOR ஆக சேமிக்க முடியாது
dagcbor-encode-error = DAG-CBOR குறியாக்கல் பிழை: { $e }
cbor-decode-error = CBOR மறைகுறியாக்கல் பிழை: { $e }
cbor-json-error = CBOR முதல் JSON பிழை: { $e }
yaml-serialise-error = YAML தொடர்வரிசைப்படுத்தல் பிழை: { $e }
edit-reply-invalid = செல்லாத திருத்த பதில்
doc-publish-ipld-error = IPLD வெளியீடு தோல்வியடைந்தது: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = உள்வரும் பெட்டி வெட்டுதல் சேமிப்பு பிழை: { $e }
err-config-load = கட்டமைப்பு ஏற்றல் பிழை: { $e }
err-lang-persist = மொழி சேமிப்பு பிழை: { $e }
err-history-parse = வரலாறு பாகுபடுத்தல் பிழை: { $e }
err-history-load = வரலாறு ஏற்றல் பிழை: { $e }
err-history-count-invalid = வரலாற்று எண் ஒரு நேர்மறை முழு எண்ணாக இருக்க வேண்டும்
err-ipfs-reply-decode = IPFS பதில் மறைகுறியாக்கல் தோல்வி: { $e }
err-edit-cbor = CBOR திருத்தல் பிழை: { $e }
err-popup-blocked = உலாவி பாப்அப்பை தடுத்தது
status-publishing = வெளியிடுகிறது

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = பிழை
rpc-error-detail = பிழை: { $detail }
msg-new-message = ← [{ $from }] புதிய செய்தி — { $count } இன்பாக்ஸில்
msg-chat = { $sender } சொல்கிறார் { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } சொல்கிறார் { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } அறைக்கு நுழைந்தார்.
room-leave = * { $name } அறையை விட்டு வெளியேறினார்.
room-drop  = * { $name } { $thing }-ஐ கீழே போட்டார்.
room-take  = * { $name } { $thing }-ஐ எடுத்தார்.
err-edit-decode-failed = திருத்தம்: டிகோட் தோல்வி: { $e }
err-edit-fetch-failed = திருத்தம்: பெறுவதில் தோல்வி: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = செயலில் உள்ள அமர்வு இல்லை — சுயவிவரத்தை நீக்க முடியாது
profile-delete-error = சுயவிவர நீக்கம் தோல்வியடைந்தது: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = சுயவிவரம் குறியாக்கப்பட்டு IPFS-க்கு அனுப்பப்பட்டது; CID வந்ததும் DID ஆவணம் புதுப்பிக்கப்படும்
profile-publish-done = சுயவிவரம் வெளியிடப்பட்டது — DID ஆவணம் ma.agent CID உடன் புதுப்பிக்கப்பட்டது
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = அடையாளம் ஏற்கனவே வெளியிடப்பட்டது - புதுப்பித்த சுயவிவரம்
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = பைனரி உள்ளடக்கம் (காட்டப்படவில்லை)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (எதுவுமில்லை)
profiles-deleted = சுயவிவரம் { $name } நீக்கப்பட்டது
profiles-not-found = சுயவிவரம் கிடைக்கவில்லை: { $name }

# -- Help topics index
help-header-topics = -- தலைப்புகள் -- விவரங்களுக்கு .help/<topic> தட்டச்சிடவும்
help-topic-msg =   .help/msg                    செய்திகள்
help-topic-ma = .help/ma                     間-இடம், வெளியீடு மற்றும் நுழைவு
help-topic-path = .help/path                   உள்ளூர் புள்ளி-பாதை இலக்கணம்
help-topic-my =   .help/my                     தனிப்பட்ட config
help-topic-inbox =   .help/inbox                  உள்வரவு
help-topic-doc =   .help/doc                    ஆவணங்கள்
help-topic-actor =   .help/actor                  தொலை actor
help-topic-zscheme =   .help/zscheme               வரிக்குள் Scheme வெளிப்பாடுகள் மற்றும் ஆவணங்கள்
help-unknown-topic =   .help/{ $topic }: தெரியாத தலைப்பு

# -- Help actor section
help-header-actor = -- தொலை actor-கள்
help-actor-echo =   @actor                       தீர்க்கப்பட்ட DID ஐ காட்டு
help-actor-text = @actor[#entity]!msg|!say|!emote body         நேரடி/அரட்டை/எமோட் செய்தியை அனுப்பவும்
help-actor-ping = @actor:ping                  உயிரோட்டம் பிங்
help-actor-entities =   @actor/entities              entity-களை பட்டியலிடு
help-actor-entities-get = @actor/entities/<n>          நிறுவன முனையைப் பெறுங்கள்
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity-ஐ திருத்து
help-actor-entities-del = @actor/entities/<n>:         நிறுவனத்தை நீக்கு
help-actor-config-get =   @actor/config/<key>          config மதிப்பைப் பெறு
help-actor-config-set =   @actor/config/<key>: val     config மதிப்பை அமை
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL திருத்து
help-actor-fragment =   @actor#entity                plugin-க்கு அனுப்பு
help-actor-fragment-verb =   @actor#entity:verb [args]    plugin-க்கு RPC
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  அமர்வு சூழலில் 5 பதில்களை வைத்திருங்கள்

help-topic-url =   .help/url                    URL இணைப்பு வழியாக zion திறக்க
help-topic-i18n = .help/i18n                   உங்கள் அடையாளத்திற்கான மொழி விருப்பம்
help-header-url = ── URL அளவுருக்கள் ───────────────────────────────────────────────────────────────
help-url-intro =   முன்னரே நிரப்பப்பட்ட பெறுநருடன் zion திறக்கும் இணைப்பை பகிரவும்:
help-url-msg =   ?msg=<did>                   முன்னரே நிரப்புகிறது: @<did>!msg (எளிய செய்தி)
help-url-say =   ?say=<did>                   முன்னரே நிரப்புகிறது: @<did>!say (say வினை)
help-url-emote =   ?emote=<did>                 முன்னரே நிரப்புகிறது: @<did>!emote (emote வினை)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             உள்நுழைந்த பிறகு இயக்க உலகத்தை உள்ளிடவும்
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   உள்ளீடு முன்னரே நிரப்பப்பட்டது ஆனால் அனுப்பப்படவில்லை — அனுப்ப Enter அழுத்தவும்.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                நெட்வொர்க்கில் உங்கள் அடையாளத்தை வெளியிடுங்கள்
help-header-publish = ── அடையாள வெளியீடு ──────────────────────────────────────────────────────────
help-publish-intro = வெளியீடு உங்கள் அடையாளத்தை நெட்வொர்க்கில் கண்டறியக்கூடியதாக செய்கிறது. மற்றவர்கள் உங்கள் DID தேடி உங்களை அடையலாம்.
help-publish-ma = வெளியிட 間 (உள்ளூர் இயக்க நேரம்) நிறுவப்பட்டிருக்க வேண்டும். அது உங்களுக்காக ego ஐ IPFS/IPNS உடன் இணைக்கிறது.
help-publish-steps = படிகள்: உள்ளூர் ma கண்டறிய '.ma: claim [port]' இயக்கவும், பின்னர் '.my.identity!publish @ma'.
help-publish-without = வெளியிடாமல் இருந்தால் மற்றவர்கள் உங்களை அடைய முடியாது — DID தெரிந்தாலும் உங்கள் endpoint ஐ கண்டறிய இயலாது.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = சுயவிவரப் பெயரை குறிப்பிடவும்: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = கலெக்டிங் பேட்ச் — வகை கட்டளைகள், .batch உடன் முடிவடையும்
batch-already-collecting = ஏற்கனவே ஒரு தொகுதியை சேகரித்து வருகிறது — முதலில் .batch உடன் முடிக்கவும்
batch-empty = தொகுதி காலியாக இருந்தது - இயக்க எதுவும் இல்லை
batch-running = batch இயங்குகிறது…
batch-step-timeout = தொகுதி படி நேரம் முடிந்தது

batch-done = batch { $secs }s-ல் முடிந்தது — { $steps } படிகள்
batch-done-error = batch பிழைகளுடன் { $secs }s-ல் முடிந்தது — { $steps } படிகள்
msg-timeout = செய்தி நேரம் முடிந்தது (60s-ல் பதில் இல்லை)
err-unknown-command = தெரியாத கட்டளை: { $path }
err-read-only-path = { $path } வாசிக்க மட்டும்
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        scratch ஆவணத்தை இணையாக மதிப்பிடு


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } பெற முடியவில்லை: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = செல்லுபடியாகாத CID: { $value }
label-runtime = மா
label-runtime-placeholder = did:ma:...
warning-remote-runtime = எச்சரிக்கை: உங்கள் IPNS தனியார் விசை அடையாளத்தை வெளியிட இந்த இயக்க நேர சேவைக்கு அனுப்பப்படும். நீங்கள் முழுமையாக நம்பும் இயக்க நேர சேவையை மட்டுமே பயன்படுத்துங்கள்.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme zion கட்டளைகளில் உள்ள Scheme வெளிப்பாடுகளை மதிப்பிட்டு, அனுப்புவதற்கு முன் முடிவை அந்த வரிக்குள் சேர்க்கிறது.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    வரிக்குள் எடுத்துக்காட்டு; "say 7 + 5 = 12" அனுப்பும்
help-zscheme-define =   (define x 12)             வரையறைகள் தற்போதைய உள்நுழைவு அமர்வில் தொடரும்
help-zscheme-doc = ஆவணங்கள்: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = உள்ளூர் IPFS நுழைவாயில் (உலாவி விதிவிலக்கு தேவை)

tab-config = அமைப்புகள்
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
