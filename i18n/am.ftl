# zion — አማርኛ
lang-name = አማርኛ

# ── የመግቢያ ገጽ ─────────────────────────────────────────────────────────────
tab-login = ግባ
tab-new-identity = አዲስ ማንነት
tab-import-profile = ፕሮፋይል አስመጣ
label-passphrase = ሚስጥራዊ ሐረግ
label-username = የተጠቃሚ ስም
label-confirm-passphrase = ሚስጥራዊ ሐረግ አረጋግጥ
label-did = DID
label-profile-cid = ፕሮፋይል CID
label-or-file = ወይም ፋይል
btn-login = ግባ
btn-export = አውጣ
btn-generate = ፍጠር
btn-new-endpoint = አዲስ ነጥብ
btn-import-profile = ፕሮፋይል አስመጣ
passphrase-warning = ሚስጥራዊ ሐረጉን ማጣት = ማንነትን ማጣት። ምንም ማስታወሻ የለም።
import-profile-help = ፕሮፋይልን በ CID ወይም ፋይል ያስመጡ። ሲያትሙ የተጠቀሙትን ተመሳሳይ ፓስፍሬዝ ያስፈልጋል።
import-profile-detected-user = ፕሮፋይሉ የሚሆነው: { $name }
status-unlocking = እየተከፈተ...
status-generating = ማንነት እየተፈጠረ...
status-reading-file = ፋይል እየተነበበ...
status-fetching-profile = ፕሮፋይል ከ IPFS በማምጣት ላይ...
status-imported = '{ $name }' ገብቷል — ወደ መግቢያ ትር ይቀይሩ
status-importing-profile = ፕሮፋይል በማስመጣት ላይ...
profile-import-done = ፕሮፋይሉ ለ '{ $name }' ተጠናቋል — { $n } ቁልፎች ተጭነዋል
error-wrong-passphrase = ሚስጥራዊ ሐረጉ ስህተት ነው: { $e }
error-identity-not-found = ማንነቱ '{ $name }' አልተገኘም
error-username-required = የተጠቃሚ ስም ያስፈልጋል
error-passphrase-required = ሚስጥራዊ ሐረግ ያስፈልጋል
error-passphrases-no-match = ሚስጥራዊ ሐረጎቹ አይዛመዱም
error-profile-source-required = CID ያቅርቡ ወይም ፋይል ይስቀሉ
error-did-required = DID ያስገቡ
error-profile-fetch = ፕሮፋይልን ማግኘት አልተቻለም: { $e }
error-profile-no-username = ፕሮፋይሉ ስም አይይዝም
error-profile-no-identity = ማንነት '{ $name }' አልተገኘም — መጀመሪያ ማንነት ያስመጡ

# ── የ terminal ስርዓት መልዕክቶች ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — እንደ { $username } ገብተዋል
msg-type-help = የትዕዛዞች ዝርዝር ለማየት .help ይተይቡ።
msg-connecting = ወደ iroh እየተገናኘ...
msg-iroh-ready = iroh ማጠናቀቂያ ዝግጁ ነው
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID በአካባቢ ma ({ $url }) አማካኝነት ታትሟል
msg-identity-not-published = ህሊና ኦንላይን አልተገኘም — ma በአካባቢ ከተጫነ፣ '.ma [port]' ከዚያም '/my/identity!publish @ma' ያሂዱ። ዝርዝር ለማየት '.help.publish' ይጻፉ።
msg-blocked = ⊗ ታግዷል [{ $cap }]: { $from }
msg-focus-cleared = ትኩረት ጠፋ
msg-focusing = { $did } እንደ { $prompt } ላይ ትኩረት እያደረገ
msg-set = { $path }: { $value }
msg-deleted = { $path } ተሰርዟል ({ $count } ግቤቶች)
msg-read-only = { $path } ለማንበብ ብቻ ነው
msg-subtree-set = { $path } ንዑስ ዛፍ ነው; ማዘጋጀትን ተቃወመ
msg-ancestor-leaf = የ{ $path } ቅድመ አያት ቅጠል ነው; መሸፈንን ተቃወመ
msg-key-not-found = ቁልፍ አልተገኘም: { $path }
msg-no-match = ምንም ተዛምዶ የለም
msg-link-not-connected = የአገናኝ ማምጣት ስህተት: አልተገናኘም
msg-link-fetch-error = የአገናኝ ማምጣት ስህተት: { $e }
msg-link-key-not-found = ቁልፍ `{ $key }` በተያያዘው ሰነድ ውስጥ አልተገኘም

# ── የቅፅል ስም ማረጋገጫ ───────────────────────────────────────────────────────
err-alias-name-empty = የቅፅል ስም ባዶ ሊሆን አይችልም
err-alias-has-dot = የቅፅል ስሞች '.' ሊይዙ አይችሉም
err-alias-has-fragment = የቅፅል ስሞች '#' ሊይዙ አይችሉም
err-alias-value-fragment = የቅፅል ስም ዋጋ bare did:ma:<ipns> መሆን አለበት (fragment የለም)
err-alias-value-path = የቅፅል ስም ዋጋ bare did:ma:<ipns> መሆን አለበት (path የለም)
err-alias-not-did = የቅፅል ስም ዋጋ did:ma: ለ መጀምር አለበት
err-unknown-alias = ያልታወቀ ቅፅል ስም: @{ $name }
err-bare-did = bare did:ma:<ipns> ይጠበቅ ነበር (fragment ወይም path የለም), { $did } ተገኘ

# ── አርታኢ ─────────────────────────────────────────────────────────────────
btn-save = አስቀምጥ
btn-eval = አሂድ
btn-cancel = ሰርዝ
btn-close = ዝጋ
btn-reply = ምላሽ ስጥ
btn-publish = አሳትም
btn-publish-ipld = አሳትም IPLD
msg-reply-sent = ምላሽ ተልኳል
msg-reply-failed = ምላሽ አልተሰራም: { $e }
msg-entity-publish-sent = entity { $name }: ማተም ተልኳል
msg-entity-publish-failed = entity ማተም አልተሰራም: { $e }
msg-kind-publish-failed = የ kind ህትመት ተቋርጧል: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ማተም ተልኳል
msg-field-publish-failed = ሜዳ ማተም አልተሰራም: { $e }
msg-acl-publish-sent = runtime ACL: ማተም ተልኳል
msg-crud-edit-publish-sent = { $path }: ማተም ተልኳል
msg-acl-publish-failed = runtime ACL ማተም አልተሰራም: { $e }
msg-yaml-error = YAML ስህተት: { $e }
msg-editor-saved = { $path }:አስቀምጥ
msg-fetch-review = { $cid } ተሰብስቧል — ከማሂድ በፊት ይከልሱ
msg-fetch-failed = { $cid } ማምጣት: { $e }

# ── ተግባራት — የገቢ ሳጥን ─────────────────────────────────────────────────────
inbox-empty = የገቢ ሳጥኑ ባዶ ነው
inbox-entry-not-found = የገቢ ሳጥን ግቤት { $n } አልተገኘም
inbox-no-message-id = የገቢ ሳጥን ግቤት { $n } message_id የለውም
inbox-no-verb = ለየገቢ ሳጥን ግቤት { $n } `{ $verb }` ተግባር የለም
inbox-filter-no-arg = ፊልተር DID ወይም ሃሳብ ስም ያስፈልጋቸዋል
inbox-filter-empty = ከ { $did } መልዕክቶች የሉም

# ── ተግባራት — የስራ ሰዓት ─────────────────────────────────────────────────────
discover-fetch-failed = ፍለጋ { $url } ላይ አልተሰራም: { $e }
discover-json-error = ፍለጋ አልተሰራም: ከ{ $url } ያልተሟላ JSON: { $e }
discover-missing-did = ፍለጋ አልተሰራም: status.json የ`did` ሜዳ ጎደለ
discover-invalid-did = ፍለጋ አልተሰራም: `did` did:ma: ለ መጀምር ይጠበቃል, `{ $did }` ተገኘ
discover-no-endpoint = የፍለጋ ማስጠንቀቂያ: `endpoint_id` status.json ውስጥ ጎደለ; DID ብቻ ተቀምጧል
discover-success = ma { $url } ላይ ተገኘ
discover-did-line = DID: { $did }
discover-alias-hint =   ቅጽል ስም @ma ተፈጠረ — ህሊናዎን ለማሳተም '/my/identity!publish @ma' ያሂዱ።
claim-success = Runtime ለ{ $did } ተጠየቀ
claim-conflict = Runtime ቀደም ሲል በሌላ ማንነት ተጠይቋል
claim-http-failed = ጥያቄ አልተሰራም: HTTP { $status }
claim-error = ጥያቄ አልተሰራም: { $e }
claim-no-session = አልገቡም; runtime ለመጠየቅ መጀመሪያ ይግቡ
runtime-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም

# ── ተግባራት — ACL ──────────────────────────────────────────────────────────
acl-reset = /my/acl ዳግም ተቀናጅቷል (ሙሉ በሙሉ ክፍት)
acl-persist-error = የማስቀመጥ ስህተት: { $e }
acl-no-verb = ለ/my/acl `{ $verb }` ተግባር የለም

# ── ተግባራት — ማንነት ────────────────────────────────────────────────────────
publish-usage = አጠቃቀም: /my/identity!publish <did-ወይም-ቅፅል-ስም>
identity-exported = ቅጅ እንደ { $filename } ወርዷል
identity-export-failed = ወደ ውጪ ማስቀረት አልተሳካም: { $e }

# ── ተግባራት — ሰነዶች ───────────────────────────────────────────────────────
doc-content-empty = { $path }/content ባዶ ነው
doc-save-first = { $path }/content ባዶ ነው — መጀመሪያ ያስቀምጡ
doc-missing-name = የሰነድ ስም ጎደለ
doc-publish-usage = አጠቃቀም: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = አጠቃቀም: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = { $path } ማተም: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-ipld-store-sent = IPLD የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-fetch-done = { $cid } ተሰብስቧል → { $path }/content (አልተሰራም)
doc-fetch-failed = { $cid } ማምጣት: { $e }
doc-fetch-usage = አጠቃቀም: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid አልተዘጋጀም
doc-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም
path-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም

# ── እርዳታ — ርዕሶች ─────────────────────────────────────────────────────────
help-header-zion = ── zion ትዕዛዞች ─────────────────────────────────────────────────────────
help-header-messaging = ── መልዕክት ──────────────────────────────────────────────────────────────
help-header-focus = ── የትኩረት ሁናቴ ──────────────────────────────────────────────────────────
help-header-config = ── የአካባቢ ቅርጸት ሰዋስው ─────────────────────────────────────────────────
help-header-common = ── ተሎ ጥቅም ላይ የሚዋሉ ዱካዎች ──────────────────────────────────────────
help-header-inbox = ── የገቢ ሳጥን ────────────────────────────────────────────────────────────
help-header-documents = ── ሰነዶች ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── እርዳታ — zion ትዕዛዞች ──────────────────────────────────────────────────
help-cmd-help =   .help                        ይህ ጽሑፍ
help-cmd-clear =   .clear                       terminal ያጽዱ
help-cmd-panic =   .panic                       የመጨረሻ ምርጫ — ችግር ሲያጋጥምዎ ይጠቀሙ
help-cmd-history =   .history                     የትዕዛዝ ታሪክ (ተከታታይ ዳግምዎች ተዋህደዋል)
help-cmd-logout =   .logout                      ይውጡ
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── እርዳታ — መልዕክት ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       የተፈታ DID አሳይ (ምንም መልዕክት አልተላከም)
help-msg-send =   @alias[:verb] body           ወደ ተዋናይ መልዕክት / RPC ይላኩ
help-msg-fragment =   @alias#fragment[:verb] body  ግልጽ DID fragment ባለው ቅፅል ስም ይላኩ
help-msg-escape =   \@name                       ቃል @name (ቅፅል ስም ፍለጋ የለም)

# ── እርዳታ — የትኩረት ሁናቴ ──────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       ተዋናይ ላይ ትኩረት (prompt ይቀያይራል)
help-focus-clear =   .use                         ትኩረት ያጥፉ

# ── እርዳታ — ቅርጸት ሰዋስው ──────────────────────────────────────────────────
help-config-get =   .path                        የቅጠሉን ዋጋ ያግኙ ወይም ንዑስ ዛፍ ዘርዝሩ
help-config-filter =   .path value                  ጥያቄ ያዛምዱ (በዋጋ ያጣሩ)
help-config-set =   .path: value                 ቅጠሉን ያዘጋጁ
help-config-delete =   .path:                       ቅጠሉን ወይም ንዑስ ዛፍ ይሰርዙ
help-config-verb =   .path!verb [args]            ሁናቴ ተግባር ይጥሩ

# ── እርዳታ — ተሎ ጥቅም ላይ የሚዋሉ ─────────────────────────────────────────
help-my =   /my                          ሁሉንም የግል ቅንብሮች አሳይ
help-aliases =   /my/aliases                  ቅፅል ስሞችን ዘርዝር
help-aliases-set =   /my/aliases/<name>: <did>    ቅፅል ስም ጨምር/አዘምን (bare DID, #fragment የለም)
help-aliases-del =   /my/aliases/<name>:          ቅፅል ስም አስወግድ
help-runtime-discover =   .ma [port]          ሁናቴ runtime ፈልግ እና ቅፅል ስም @ma ፍጠር
help-runtime-claim =   .ma [port]             DIDዎ በ runtime ባለቤትነት ጠይቁ
help-identity =   /my/identity                 የማንነት ቅንብሮችን አሳይ
help-identity-did =   /my/identity/did             ራስዎ DID አሳይ (ለማንበብ ብቻ)
help-identity-publish =   /my/identity!publish @pub    DID በ publishing service ያሳትሙ
help-identity-export =   /my/identity!export          የራስ የማንነት ቅጅ አውርድ
help-config-path =   .config                      ሁሉንም .config.* ግቤቶች አሳይ

# ── እርዳታ — የገቢ ሳጥን ─────────────────────────────────────────────────────
help-inbox =   /my/inbox                    የገቢ ሳጥን ዘርዝር (ንዑስ ዛፍ እይታ)
help-inbox-n =   /my/inbox/N                  የ N ግቤት መስኮች አሳይ
help-inbox-from =   /my/inbox/N/from             የ N ግቤት ላኪ DID
help-inbox-reply =   /my/inbox/N!reply [body]     ምላሽ ይላኩ (ጽሑፍ ከሌለ አርታኢ ይከፈታል)
help-inbox-open =   /my/inbox/N!open             ይዘቱን ለማንበብ ብቻ አርታኢ ውስጥ ይክፈቱ
help-inbox-del =   /my/inbox/N:                 ግቤት N ሰርዝ
help-inbox-delall =   /my/inbox:                   ሁሉንም የገቢ ሳጥን ግቤቶች ሰርዝ
help-inbox-flush =   /my/inbox!flush              ሁሉንም ግቤቶች ወደ terminal አትም
help-inbox-filter =   /my/inbox!filter @who        ከ @who ብቻ ያሉ ልኮዎችን አሳይ
help-inbox-traverse =   /my/inbox/N/sender/<field>   የላኪ DID ሰነድ በዝግታ ያስሱ

# ── እርዳታ — ሰነዶች ────────────────────────────────────────────────────────
help-doc-edit =   /my/doc/<name>!edit           ከተቀመጠ ይዘት ጋር አርታኢ ይክፈቱ
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     CID ያምጡ, ለፍተሻ ብቻ ይክፈቱ
help-doc-eval =   /my/doc/<name>!eval           የተቀመጠ ይዘት ሰረዝ-ሰረዝ ያሂዱ
help-doc-publish =   /my/doc/<name>!publish @pub   እንደ ጥሬ blob ያስቀምጡ (ማናቸውም አይነት)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  YAML እንደ IPLD DAG-CBOR ሲስተም ያስቀምጡ
help-doc-fetch =   /my/doc/<name>!fetch <cid>    CID ይዘት ያስገቡ (አልተሰራም)
help-doc-cid =   /my/doc/<name>!cid            የተቀመጠ CID አሳይ
help-doc-del =   /my/doc/<name>:              ሰነዱን ሰርዝ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = ያሉ ቋንቋዎች (/my/i18n: <ኮድ> ለማዘጋጀት):
err-lang-not-found = ቋንቋ አልተገኘም: { $lang }

msg-send-failed = መላኩ አልተሳካም: { $e }
msg-not-logged-in = አልገባም

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML ትንታኔ ስህተት፡ { $e }
yaml-not-mapping = YAML mapping (ቁልፍ፡ እሴት ጥንዶች) መሆን አለበት፤ ሸክ ጽሑፍ እና ቀላል ስካሎች እንደ DAG-CBOR ሊቀመጡ አይችሉም
dagcbor-encode-error = DAG-CBOR ምስጠራ ስህተት፡ { $e }
cbor-decode-error = CBOR ፍቺ ስህተት፡ { $e }
cbor-json-error = CBOR ወደ JSON ስህተት፡ { $e }
yaml-serialize-error = YAML ተጨጭ ስህተት፡ { $e }
edit-reply-invalid = ልክ ያልሆነ የማረሚያ ምላሽ
doc-publish-ipld-error = IPLD መሰቀያ ያልተሳካ: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = የፖስታ ሳጥን ማጽጃ አስቀምጥ ስህተት፡ { $e }
err-config-load = ውቅር ጫን ስህተት፡ { $e }
err-lang-persist = ቋንቋ አስቀምጥ ስህተት፡ { $e }
err-history-parse = ታሪክ ፍቺ ስህተት፡ { $e }
err-history-load = ታሪክ ጫን ስህተት፡ { $e }
err-ipfs-reply-decode = IPFS ምላሽ ፍቺ ስህተት፡ { $e }
err-edit-cbor = CBOR ማረሚያ ስህተት፡ { $e }
err-popup-blocked = ፖፕ-አፕ በአሳሽ ታግዷል
status-publishing = እያሳተሙ

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ስህተት
rpc-error-detail = ስህተት: { $detail }
msg-new-message = ← [{ $from }] አዲስ መልዕክት — { $count } ወደ ሳጥን ደረሰ
msg-chat = { $sender } ይላል { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ይላሉ { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ወደ ክፍሉ ገቡ።
room-leave = * { $name } ወጡ።
room-drop  = * { $name } { $thing } ጣሉ።
room-take  = * { $name } { $thing } አነሱ።
err-edit-decode-failed = ማርትዕ: ዲኮድ አልተሳካም: { $e }
err-edit-fetch-failed = ማርትዕ: ማምጣት አልተሳካም: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ንቁ ክፍለ ጊዜ የለም — ፕሮፋይልን መሰረዝ አይቻልም
profile-delete-error = ፕሮፋይልን መሰረዝ አልተሳካም: { $e }
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
profiles-empty = (ምንም)
profiles-deleted = ፕሮፋይል { $name } ተሰርዟል
profiles-not-found = ፕሮፋይል አልተገኘም: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
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
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
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

help-topic-url =   .help.url                    zionን በURL አገናኝ ቁልፍ መክፈት
help-header-url = ── የURL መለኪያዎች ───────────────────────────────────────────────────────────────────
help-url-intro =   zionን ሊከፍት የሚችል አገናኝ ያካፍሉ — ተቀባዩ አስቀድሞ ይሞላል:
help-url-msg =   ?msg=<did>                   ቀልዱ ሞሉ: @<did> (ቀላል መልዕክት)
help-url-say =   ?say=<did>                   ቀልዱ ሞሉ: @<did>:say (say ቃሉ)
help-url-emote =   ?emote=<did>                 ቀልዱ ሞሉ: @<did>:emote (emote ቃሉ)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   ግቤቱ አስቀድሞ ተሞልቷል ግን አልተላከም — ለመላክ Enter ይጫኑ።
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                ህሊናዎን ወደ ኔትወርክ ያሳትሙ
help-header-publish = ── ህሊና ማሳተም ────────────────────────────────────────────────────────────────
help-publish-intro = ማሳተም ህሊናዎን በኔትወርክ ላይ ሊፈለግ የሚችል ያደርጋል። ሌሎች DID ዎን ፈልገው ሊያገኙዎ ይችላሉ።
help-publish-ma = ለማሳተም ma (አካባቢያዊ runtime) ተጭኖ መሆን አለበት። ego ን ከ IPFS/IPNS ጋር ይሳስራል።
help-publish-steps = ደረጃዎች: አካባቢያዊ ma ለማግኘት '.ma [port]' ያሂዱ፣ ከዚያም '/my/identity!publish @ma'።
help-publish-without = ሳያሳትሙ ሌሎች ሊደርሱዎ አይችሉም — DID ዎን ቢያውቁም የርስዎን endpoint መፍታት አይችሉም።
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = CID { $cid } ማምጣት አልተሳካም፡ { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = የሚሰራ CID አይደለም፡ { $value }
label-runtime = ማ
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = ማስጠንቀቂያ፡ የእርስዎ IPNS የግል ቁልፍ ለማንነት ህትመት ወደ ይህ runtime ይላካል። ሙሉ በሙሉ የሚያምኑትን runtime ብቻ ይጠቀሙ።
