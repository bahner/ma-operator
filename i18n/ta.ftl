# zion — தமிழ்
lang-name = தமிழ்

# ── உள்நுழைவு பக்கம் ─────────────────────────────────────────────────────
tab-login = உள்நுழைவு
tab-new-identity = புதிய அடையாளம்
tab-import = இறக்குமதி
label-passphrase = கடவுச்சொற்றொடர்
label-username = பயனர்பெயர்
label-confirm-passphrase = கடவுச்சொற்றொடரை உறுதிப்படுத்தவும்
btn-login = உள்நுழையவும்
btn-export = ஏற்றுமதி
btn-generate = உருவாக்கவும்
btn-new-endpoint = புதிய இறுதிப்புள்ளி
passphrase-warning = கடவுச்சொற்றொடர் தொலைந்தால் அடையாளம் தொலையும். மீட்பு இல்லை.
import-help = ஏற்றுமதி செய்யப்பட்ட .zion.json கோப்பைத் தேர்ந்தெடுக்கவும். தொகுப்பு மறைகுறியாக்கப்பட்டு இருக்கும்.
status-unlocking = திறக்கப்படுகிறது...
status-generating = அடையாளம் உருவாக்கப்படுகிறது...
status-reading-file = கோப்பு படிக்கப்படுகிறது...
status-imported = '{ $name }' இறக்குமதி செய்யப்பட்டது — உள்நுழைவு தாவலுக்குச் செல்லவும்
error-wrong-passphrase = தவறான கடவுச்சொற்றொடர்: { $e }
error-identity-not-found = அடையாளம் '{ $name }' கிடைக்கவில்லை
error-username-required = பயனர்பெயர் தேவை
error-passphrase-required = கடவுச்சொற்றொடர் தேவை
error-passphrases-no-match = கடவுச்சொற்றொடர்கள் பொருந்தவில்லை

# ── முனையம் கணினி செய்திகள் ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } ஆக உள்நுழைந்தீர்கள்
msg-type-help = கட்டளைகளின் பட்டியலுக்கு .help தட்டச்சு செய்யவும்.
msg-connecting = iroh உடன் இணைக்கப்படுகிறது...
msg-iroh-ready = iroh இறுதிப்புள்ளி தயார்
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID உள்ளூர் ma ({ $url }) வழியாக வெளியிடப்பட்டது
msg-identity-not-published = அடையாளம் இணையத்தில் காணப்படவில்லை — ma உள்நாட்டில் நிறுவப்பட்டிருந்தால், '.my.ma:discover' பின்னர் '.my.identity:publish @ma' இயக்கவும். விவரங்களுக்கு '.help.publish' தட்டச்சு செய்யவும்.
msg-blocked = ⊗ தடுக்கப்பட்டது [{ $cap }]: { $from }
msg-focus-cleared = கவனம் அழிக்கப்பட்டது
msg-focusing = { $did } ஐ { $prompt } ஆக கவனம் செலுத்துகிறது
msg-set = { $path }: { $value }
msg-deleted = { $path } நீக்கப்பட்டது ({ $count } உள்ளீடுகள்)
msg-read-only = { $path } படிக்க மட்டுமே
msg-subtree-set = { $path } ஒரு துணைமரம்; அமைக்க மறுக்கப்பட்டது
msg-ancestor-leaf = { $path } இன் ஒரு மூதாதையர் இலை; நிழலிட மறுக்கப்பட்டது
msg-key-not-found = திறவுச்சொல் கிடைக்கவில்லை: { $path }
msg-no-match = பொருத்தம் இல்லை
msg-link-not-connected = இணைப்பு பெறுவதில் பிழை: இணைக்கப்படவில்லை
msg-link-fetch-error = இணைப்பு பெறுவதில் பிழை: { $e }
msg-link-key-not-found = இணைக்கப்பட்ட ஆவணத்தில் திறவுச்சொல் `{ $key }` கிடைக்கவில்லை

# ── புனைப்பெயர் சரிபார்ப்பு ──────────────────────────────────────────────
err-alias-name-empty = புனைப்பெயர் வெறுமையாக இருக்க முடியாது
err-alias-has-dot = புனைப்பெயர்களில் '.' இருக்க முடியாது
err-alias-has-fragment = புனைப்பெயர்களில் '#' இருக்க முடியாது
err-alias-value-fragment = புனைப்பெயர் மதிப்பு bare did:ma:<ipns> ஆக இருக்க வேண்டும் (துண்டு இல்லை)
err-alias-value-path = புனைப்பெயர் மதிப்பு bare did:ma:<ipns> ஆக இருக்க வேண்டும் (பாதை இல்லை)
err-alias-not-did = புனைப்பெயர் மதிப்பு did:ma: உடன் தொடங்க வேண்டும்
err-unknown-alias = அறியப்படாத புனைப்பெயர்: @{ $name }
err-bare-did = bare did:ma:<ipns> (துண்டு அல்லது பாதை இல்லாமல்) எதிர்பார்க்கப்பட்டது, கிடைத்தது { $did }

# ── திருத்தி ──────────────────────────────────────────────────────────────
btn-save = சேமி
btn-eval = இயக்கவும்
btn-cancel = ரத்து செய்
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
discover-success = { $url } இல் ma கண்டுபிடிக்கப்பட்டது
discover-did-line = DID: { $did }
discover-alias-hint =   புனைப்பெயர் @ma உருவாக்கப்பட்டது — உங்கள் அடையாளத்தை வெளியிட '.my.identity:publish @ma' இயக்கவும்.
claim-success = { $did } க்கு இயக்க நேரம் கோரப்பட்டது
claim-conflict = இயக்க நேரம் ஏற்கனவே மற்றொரு அடையாளத்தால் கோரப்பட்டுள்ளது
claim-http-failed = கோரிக்கை தோல்வியடைந்தது: HTTP { $status }
claim-error = கோரிக்கை தோல்வியடைந்தது: { $e }
claim-no-session = உள்நுழையவில்லை; இயக்க நேரம் கோர முதலில் உள்நுழையவும்
runtime-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── வினைச்சொற்கள் — ACL ──────────────────────────────────────────────────
acl-reset = .my.acl மீட்டமைக்கப்பட்டது (முழுமையாக திறந்தது)
acl-persist-error = சேமிப்பு பிழை: { $e }
acl-no-verb = .my.acl க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── வினைச்சொற்கள் — அடையாளம் ──────────────────────────────────────────
publish-usage = பயன்பாடு: .my.identity:publish <did-அல்லது-புனைப்பெயர்>
identity-exported = தொகுப்பு { $filename } என பதிவிறக்கப்பட்டது
identity-export-failed = ஏற்றுமதி தோல்வி: { $e }

# ── வினைச்சொற்கள் — ஆவணங்கள் ───────────────────────────────────────────
doc-content-empty = { $path }.content காலியாக உள்ளது
doc-save-first = { $path }.content காலியாக உள்ளது — முதலில் சேமிக்கவும்
doc-missing-name = ஆவணப் பெயர் இல்லை
doc-publish-usage = பயன்பாடு: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = பயன்பாடு: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = வெளியீடு { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = சேமிப்பு கோரிக்கை அனுப்பப்பட்டது ({ $id }) → { $publisher }; CID RPC பதில் வழியாக வரும்
doc-ipld-store-sent = IPLD சேமிப்பு கோரிக்கை அனுப்பப்பட்டது ({ $id }) → { $publisher }; CID RPC பதில் வழியாக வரும்
doc-fetch-done = { $cid } பெறப்பட்டது → { $path }.content (இயக்கப்படவில்லை)
doc-fetch-failed = பெறு { $cid }: { $e }
doc-fetch-usage = பயன்பாடு: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid அமைக்கப்படவில்லை
doc-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை
path-no-verb = { $path } க்கு `{ $verb }` வினைச்சொல் இல்லை

# ── உதவி — தலைப்புகள் ─────────────────────────────────────────────────────
help-header-zion = ── zion கட்டளைகள் ───────────────────────────────────────────────────────
help-header-messaging = ── செய்தியிடல் ──────────────────────────────────────────────────────────
help-header-focus = ── கவன முறை ─────────────────────────────────────────────────────────────
help-header-config = ── உள்ளூர் அமைவு இலக்கணம் ────────────────────────────────────────────────
help-header-common = ── பொதுவான பாதைகள் ──────────────────────────────────────────────────────
help-header-inbox = ── உள்வரவு ──────────────────────────────────────────────────────────────
help-header-documents = ── ஆவணங்கள் ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── உதவி — zion கட்டளைகள் ────────────────────────────────────────────────
help-cmd-help =   .help                        இந்த உரை
help-cmd-clear =   .clear                       முனையம் அழிக்கவும்
help-cmd-panic =   .panic                       கடைசி வழி — சிக்கலில் பயன்படுத்தவும்
help-cmd-history =   .history                     கட்டளை வரலாறு (தொடர்ச்சியான நகல்கள் இணைக்கப்பட்டன)
help-cmd-logout =   .logout                      வெளியேறவும்
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── உதவி — செய்தியிடல் ──────────────────────────────────────────────────
help-msg-echo =   @alias                       தீர்க்கப்பட்ட DID காட்டு (செய்தி இல்லை)
help-msg-send =   @alias[:verb] body           நடிகருக்கு செய்தி / RPC அனுப்பவும்
help-msg-fragment =   @alias#fragment[:verb] body  வெளிப்படையான DID துண்டுடன் அனுப்பவும்
help-msg-escape =   \@name                       நேரடி @name (புனைப்பெயர் தேடல் இல்லை)

# ── உதவி — கவன முறை ──────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       நடிகரில் கவனம் செலுத்தவும் (வரியுரை மாறும்)
help-focus-clear =   .use                         கவனம் அழிக்கவும்

# ── உதவி — அமைவு இலக்கணம் ────────────────────────────────────────────────
help-config-get =   .path                        இலை மதிப்பு பெறவும் அல்லது துணைமரம் பட்டியலிடவும்
help-config-filter =   .path value                  மதிப்பால் வடிகட்டவும்
help-config-set =   .path: value                 இலை அமைக்கவும்
help-config-delete =   .path:                       இலை அல்லது துணைமரம் நீக்கவும்
help-config-verb =   .path:verb [args]            உள்ளூர் வினைச்சொல் அழைக்கவும்

# ── உதவி — பொதுவான பாதைகள் ──────────────────────────────────────────────
help-my =   .my                          அனைத்து தனிப்பட்ட அமைவுகளை காட்டவும்
help-aliases =   .my.aliases                  புனைப்பெயர்கள் பட்டியல்
help-aliases-set =   .my.aliases.<name>: <did>    புனைப்பெயர் சேர்/புதுப்பிக்கவும்
help-aliases-del =   .my.aliases.<name>:          புனைப்பெயர் நீக்கவும்
help-runtime-discover =   .my.ma:discover          உள்ளூர் இயக்க நேரம் கண்டுபிடிக்கவும் மற்றும் @ma உருவாக்கவும்
help-runtime-claim =   .my.ma:claim             உங்கள் DID உடன் இயக்க நேரம் கோரவும்
help-identity =   .my.identity                 அடையாள அமைவு காட்டவும்
help-identity-did =   .my.identity.did             உங்கள் DID காட்டவும் (படிக்க மட்டும்)
help-identity-publish =   .my.identity:publish @pub    வெளியீட்டு சேவை மூலம் DID வெளியிடவும்
help-identity-export =   .my.identity:export          உங்கள் அடையாள தொகுப்பை பதிவிறக்கவும்
help-config-path =   .config                      அனைத்து .config.* உள்ளீடுகளை காட்டவும்

# ── உதவி — உள்வரவு ───────────────────────────────────────────────────────
help-inbox =   .my.inbox                    உள்வரவு பட்டியல் (துணைமர காட்சி)
help-inbox-n =   .my.inbox.N                  உள்ளீடு N இன் புலங்கள் காட்டவும்
help-inbox-from =   .my.inbox.N.from             உள்ளீடு N இன் அனுப்புவோர் DID
help-inbox-reply =   .my.inbox.N:reply [body]     பதில் அனுப்பவும் (உள்ளடக்கம் இல்லை — திருத்தி திறக்கும்)
help-inbox-open =   .my.inbox.N:open             படிக்க மட்டும் திருத்தியில் உள்ளடக்கம் திறக்கவும்
help-inbox-del =   .my.inbox.N:                 உள்ளீடு N நீக்கவும்
help-inbox-delall =   .my.inbox:                   அனைத்து உள்வரவு உள்ளீடுகளை நீக்கவும்
help-inbox-flush =   .my.inbox:flush              அனைத்து உள்ளீடுகளை முனையத்தில் அச்சிடவும்
help-inbox-filter =   .my.inbox:filter @who        @who இலிருந்து மட்டும் உள்ளீடுகள் காட்டு
help-inbox-traverse =   .my.inbox.N.sender.<field>   அனுப்புவோர் DID ஆவணத்தை சோம்பலாக ஆராயவும்

# ── உதவி — ஆவணங்கள் ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           சேமித்த உள்ளடக்கத்துடன் திருத்தி திறக்கவும்
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID பெற்று, மதிப்பாய்வுக்கு மட்டும் திறக்கவும்
help-doc-eval =   .my.doc.<name>:eval           சேமித்த உள்ளடக்கத்தை வரிவரியாக இயக்கவும்
help-doc-publish =   .my.doc.<name>:publish @pub   கச்சா blob ஆக சேமிக்கவும் (எந்த வகையும்)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML ஐ DAG-CBOR IPLD முனையாக சேமிக்கவும்
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID உள்ளடக்கம் இறக்குமதி செய்யவும் (இயக்கம் இல்லை)
help-doc-cid =   .my.doc.<name>:cid            சேமித்த CID காட்டவும்
help-doc-del =   .my.doc.<name>:              ஆவணம் நீக்கவும்

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
yaml-serialize-error = YAML தொடர்வரிசைப்படுத்தல் பிழை: { $e }
edit-reply-invalid = செல்லாத திருத்த பதில்
doc-publish-ipld-error = IPLD வெளியீடு தோல்வியடைந்தது: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = உள்வரும் பெட்டி வெட்டுதல் சேமிப்பு பிழை: { $e }
err-config-load = கட்டமைப்பு ஏற்றல் பிழை: { $e }
err-lang-persist = மொழி சேமிப்பு பிழை: { $e }
err-history-parse = வரலாறு பாகுபடுத்தல் பிழை: { $e }
err-history-load = வரலாறு ஏற்றல் பிழை: { $e }
err-ipfs-reply-decode = IPFS பதில் மறைகுறியாக்கல் தோல்வி: { $e }
err-edit-cbor = CBOR திருத்தல் பிழை: { $e }
err-popup-blocked = உலாவி பாப்அப்பை தடுத்தது
status-publishing = வெளியிடுகிறது

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = பிழை
rpc-error-detail = பிழை: { $detail }
msg-new-message = ← [{ $from }] புதிய செய்தி — { $count } இன்பாக்ஸில்
msg-chat = { $sender } சொல்கிறார் { $body }
err-edit-decode-failed = திருத்தம்: டிகோட் தோல்வி: { $e }
err-edit-fetch-failed = திருத்தம்: பெறுவதில் தோல்வி: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = செயலில் உள்ள அமர்வு இல்லை — சுயவிவரத்தை நீக்க முடியாது
profile-delete-error = சுயவிவர நீக்கம் தோல்வியடைந்தது: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (எதுவுமில்லை)
profiles-deleted = சுயவிவரம் { $name } நீக்கப்பட்டது
profiles-not-found = சுயவிவரம் கிடைக்கவில்லை: { $name }

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
help-actor-entities =   @actor:entities              list entities
help-actor-entities-get =   @actor:entities.<n>          get entity
help-actor-entities-set =   @actor:entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor:entities.<n>:edit     edit entity
help-actor-entities-del =   @actor:entities.<n>:         delete entity
help-actor-config-get =   @actor:config.<key>          get config value
help-actor-config-set =   @actor:config.<key>: val     set config value
help-actor-acl =   @actor:acl                   get ACL
help-actor-acl-edit =   @actor:acl:edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    URL இணைப்பு வழியாக zion திறக்க
help-header-url = ── URL அளவுருக்கள் ───────────────────────────────────────────────────────────────
help-url-intro =   முன்னரே நிரப்பப்பட்ட பெறுநருடன் zion திறக்கும் இணைப்பை பகிரவும்:
help-url-msg =   ?msg=<did>                   முன்னரே நிரப்புகிறது: @<did> (எளிய செய்தி)
help-url-say =   ?say=<did>                   முன்னரே நிரப்புகிறது: @<did>:say (say வினை)
help-url-emote =   ?emote=<did>                 முன்னரே நிரப்புகிறது: @<did>:emote (emote வினை)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   உள்ளீடு முன்னரே நிரப்பப்பட்டது ஆனால் அனுப்பப்படவில்லை — அனுப்ப Enter அழுத்தவும்.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                நெட்வொர்க்கில் உங்கள் அடையாளத்தை வெளியிடுங்கள்
help-header-publish = ── அடையாள வெளியீடு ──────────────────────────────────────────────────────────
help-publish-intro = வெளியீடு உங்கள் அடையாளத்தை நெட்வொர்க்கில் கண்டறியக்கூடியதாக செய்கிறது. மற்றவர்கள் உங்கள் DID தேடி உங்களை அடையலாம்.
help-publish-ma = வெளியிட ma (உள்ளூர் இயக்க நேரம்) நிறுவப்பட்டிருக்க வேண்டும். அது உங்களுக்காக ego ஐ IPFS/IPNS உடன் இணைக்கிறது.
help-publish-steps = படிகள்: உள்ளூர் ma கண்டறிய '.my.ma:discover' இயக்கவும், பின்னர் '.my.identity:publish @ma'.
help-publish-without = வெளியிடாமல் இருந்தால் மற்றவர்கள் உங்களை அடைய முடியாது — DID தெரிந்தாலும் உங்கள் endpoint ஐ கண்டறிய இயலாது.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
