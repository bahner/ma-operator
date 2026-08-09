# zion — አማርኛ
lang-name = አማርኛ
label-nick = ቅጽል ስም
new-identity-nick-help = ለma-space ቅጽል ስም ይምረጡ። ቅጽል ስም ብቻ ነው፣ በማንኛውም ጊዜ መቀየር ይችላሉ።
error-nick-required = ቅጽል ስም ያስፈልጋል
error-nick-invalid = ቅጽል ስሙ ባዶ ቦታ ወይም @ መያዝ የለበትም

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
btn-show-qr = QR አሳይ
btn-scan-qr = QR ቃኝ
qr-scan-hint = ካሜራውን ወደ zion ፕሮፋይል QR ኮድ ያመልክቱ።
qr-error-camera = ካሜራ አይገኝም: { $e }
qr-error-too-large = ፕሮፋይሉ ለ QR ኮድ በጣም ትልቅ ነው
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
msg-getting-started = ለመጀመር ይሞክሩ፦ say Hello world, look, .help, ወይም help።
msg-connecting = ወደ iroh እየተገናኘ...
msg-iroh-ready = iroh ማጠናቀቂያ ዝግጁ ነው
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID በአካባቢ 間 ({ $url }) አማካኝነት ታትሟል
msg-identity-publication-propagating = የመታወቂያ ህትመት አሁንም እየተሰራጨ ነው; entry ተዘግዷል: { $e }
msg-identity-first-publish = መታወቂያን ለመጀመሪያ ጊዜ እያተምን ነው። ይህ እስከ { $seconds } ሰከንዶች ሊወስድ ይችላል።
msg-ma-connecting-matrix = ወደ 間trix ልናገናኝዎ እየሞከርን ነው
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = አካባቢያዊ 間 ተጠይቋል
msg-local-ma-already-claimed = አካባቢያዊ 間 አስቀድሞ ተጠይቋል
msg-local-ma-claim-failed = አካባቢያዊ 間 መጠየቅ አልተሳካም
msg-identity-not-published = ህሊና ኦንላይን አልተገኘም — 間 በአካባቢ ከተጫነ፣ '.ma [port]' ከዚያም '.my.identity!publish @ma' ያሂዱ። ዝርዝር ለማየት '.help/publish' ይጻፉ።
msg-blocked = ⊗ ታግዷል [{ $cap }]: { $from }
msg-focus-cleared = ትኩረት ጠፋ
msg-left = left
msg-focusing = { $did } እንደ { $prompt } ላይ ትኩረት እያደረገ
msg-set = { $path }: { $value }
msg-deleted = { $path } ተሰርዟል ({ $count } ግቤቶች)
msg-read-only = { $path } ለማንበብ ብቻ ነው
msg-subtree-set = { $path } ንዑስ ዛፍ ነው; ማዘጋጀትን ተቃወመ
msg-ancestor-leaf = የ{ $path } ቅድመ አያት ቅጠል ነው; መሸፈንን ተቃወመ
msg-key-not-found = ቁልፍ አልተገኘም: { $path }
msg-link-not-connected = የአገናኝ ማምጣት ስህተት: አልተገናኘም
msg-link-fetch-error = የአገናኝ ማምጣት ስህተት: { $e }
msg-link-key-not-found = ቁልፍ `{ $key }` በተያያዘው ሰነድ ውስጥ አልተገኘም

# ── የቅፅል ስም ማረጋገጫ ───────────────────────────────────────────────────────
err-alias-name-empty = የቅፅል ስም ባዶ ሊሆን አይችልም
err-alias-has-dot = የቅፅል ስሞች '.' ሊይዙ አይችሉም
err-alias-has-fragment = የቅፅል ስሞች '#' ሊይዙ አይችሉም
err-alias-value-fragment = የቅፅል ስም ዋጋ ቢበዛ አንድ ባዶ ያልሆነ DID-URL fragment ሊኖረው ይችላል
err-alias-value-path = የቅፅል ስም ዋጋ did:ma:<ipns> DID ወይም DID-URL መሆን አለበት (path የለም)
err-alias-not-did = የቅፅል ስም ዋጋ did:ma: ለ መጀምር አለበት
err-unknown-alias = ያልታወቀ ቅፅል ስም: @{ $name }
err-bare-did = bare did:ma:<ipns> ይጠበቅ ነበር (fragment ወይም path የለም), { $did } ተገኘ

# ── አርታኢ ─────────────────────────────────────────────────────────────────
btn-save = አስቀምጥ
btn-eval = አሂድ
btn-cancel = ሰርዝ
msg-jobs-cancelled = ስራዎች ተሰርዘዋል
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
discover-hint-endpoint-not-found = ፍንጭ: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = ፍንጭ: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = ፍንጭ: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = ፍንጭ: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 { $url } ላይ ተገኘ
discover-did-line = DID: { $did }
discover-alias-hint =   ቅጽል ስም @ma ተፈጠረ — ህሊናዎን ለማሳተም '.my.identity!publish @ma' ያሂዱ።
claim-success = Runtime ለ{ $did } ተጠየቀ
claim-conflict = Runtime ቀደም ሲል በሌላ ማንነት ተጠይቋል
claim-already-owned = Runtime በዚህ ማንነት አስቀድሞ ተጠይቋል
claim-http-failed = ጥያቄ አልተሰራም: HTTP { $status }
claim-error = ጥያቄ አልተሰራም: { $e }
claim-no-session = አልገቡም; runtime ለመጠየቅ መጀመሪያ ይግቡ
runtime-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም

# ── ተግባራት — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl ዳግም ተቀናጅቷል (ሙሉ በሙሉ ክፍት)
acl-persist-error = የማስቀመጥ ስህተት: { $e }
acl-no-verb = ለ.my.acl `{ $verb }` ተግባር የለም

# ── ተግባራት — ማንነት ────────────────────────────────────────────────────────
publish-usage = አጠቃቀም: .my.identity!publish <did-ወይም-ቅፅል-ስም>
identity-exported = ቅጅ እንደ { $filename } ወርዷል
identity-export-failed = ወደ ውጪ ማስቀረት አልተሳካም: { $e }

# ── ተግባራት — ሰነዶች ───────────────────────────────────────────────────────
doc-content-empty = { $path } ባዶ ነው
doc-save-first = { $path } ባዶ ነው — መጀመሪያ ያስቀምጡ
doc-missing-name = የሰነድ ስም ጎደለ
doc-publish-usage = አጠቃቀም: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = አጠቃቀም: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = { $path } ማተም: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = ማተም አልተሳካም [{ $code }]: { $err }
doc-publish-error-hint = ፍንጭ: { $hint }
doc-publish-hint-session = ኢጎ የማንነት ቁልፎችዎን መድረስ እንዲችል እንደገና ይግቡ
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = የአሳታሚው ዲአይዲ ሰነድ መታተሙን እና ሊደረስበት የሚችል የመጨረሻ ነጥብ እንዳለው ያረጋግጡ
doc-publish-hint-acl = በ48 ውስጥ የእርስዎን DID እንዲፈቅድ የአታሚውን ኦፕሬተር ይጠይቁ
doc-publish-hint-runtime = Runtime/plugin ጥያቄውን ውድቅ አደረገው; ምክንያቱን ይመርምሩ እና ህጋዊውን / የአሂድ ጊዜን ካስተካከሉ በኋላ እንደገና ይሞክሩ
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = ለዝርዝር ምክንያት የሩጫ ጊዜ መዝገቦችን ይፈትሹ እና እንደገና ይሞክሩ
doc-store-sent = የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-ipld-store-sent = IPLD የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-fetch-done = { $cid } ተሰብስቧል → { $path } (አልተሰራም)
doc-fetch-failed = { $cid } ማምጣት: { $e }
doc-fetch-usage = አጠቃቀም: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid አልተዘጋጀም
doc-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም
path-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም

# ── እርዳታ — ርዕሶች ─────────────────────────────────────────────────────────
help-header-zion = ── zion ትዕዛዞች ─────────────────────────────────────────────────────────
help-header-messaging = ── መልዕክት ──────────────────────────────────────────────────────────────
help-header-config = ── የአካባቢ ቅርጸት ሰዋስው ─────────────────────────────────────────────────
help-header-common = ── ተሎ ጥቅም ላይ የሚዋሉ ዱካዎች ──────────────────────────────────────────
help-header-inbox = ── የገቢ ሳጥን ────────────────────────────────────────────────────────────
help-header-documents = ── ሰነዶች ─────────────────────────────────────────────────────────────
help-header-i18n = ── ቋንቋ ───────────── ─────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = 間-ቦታ በመግባት ላይ ──────────── ─────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── እርዳታ — zion ትዕዛዞች ──────────────────────────────────────────────────
help-cmd-help =   .help                        ይህ ጽሑፍ
help-cmd-clear =   .clear                       terminal ያጽዱ
help-cmd-panic =   .panic                       የመጨረሻ ምርጫ — ችግር ሲያጋጥምዎ ይጠቀሙ
help-cmd-history =   .history                     የትዕዛዝ ታሪክ (ተከታታይ ዳግምዎች ተዋህደዋል)
help-cmd-logout =   .logout                      ይውጡ
help-cmd-batch =   .batch                       ጊዜያዊ ሰነድ ገምግም (በትይዩ)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         ጊዜያዊ ሰነድ መስመር በመስመር ገምግም

# ── እርዳታ — መልዕክት ────────────────────────────────────────────────────────
help-msg-echo =   @alias                       የተፈታ DID/DID-URL አሳይ (መልዕክት አይላክም)
help-msg-send =   @alias!msg body / @alias:verb args           ወደ ተዋናይ መልዕክት / RPC ይላኩ
help-msg-fragment =   @alias#fragment:verb body  ግልጽ DID fragment ባለው ቅፅል ስም ይላኩ
help-msg-escape =   \@name                       ቃል @name (ቅፅል ስም ፍለጋ የለም)

# ── እርዳታ — የትኩረት ሁናቴ ──────────────────────────────────────────────────

# ── እርዳታ — ቅርጸት ሰዋስው ──────────────────────────────────────────────────
help-config-get =   .path                        የቅጠሉን ዋጋ ያግኙ ወይም ንዑስ ዛፍ ዘርዝሩ
help-config-filter =   .path [ስም]                  ስሙን የያዙ የልጅ ቁልፎችን ዘርዝሩ
help-config-full =   .path. [ስም]                 ስሙን የያዙ የሙሉ ንዑስ ዛፍ እሴቶችን ዘርዝሩ
help-config-set =   .path: value                 ቅጠሉን ያዘጋጁ
help-config-delete =   .path:                       ቅጠሉን ወይም ንዑስ ዛፍ ይሰርዙ
help-config-verb =   .path!verb [args]            ሁናቴ ተግባር ይጥሩ

# ── እርዳታ — ተሎ ጥቅም ላይ የሚዋሉ ─────────────────────────────────────────
help-my =   .my                          ሁሉንም የግል ቅንብሮች አሳይ
help-aliases =   .my.aliases                  ቅፅል ስሞችን ዘርዝር
help-aliases-set =   .my.aliases.<name>: <did-url> ቅፅል ስም ጨምር/አዘምን (DID ወይም DID-URL)
help-aliases-del =   .my.aliases.<name>:          ቅፅል ስም አስወግድ
help-runtime-discover =   .ma [port]          ሁናቴ runtime ፈልግ እና ቅፅል ስም @ma ፍጠር
help-runtime-claim =   .ma [port]             DIDዎ በ runtime ባለቤትነት ጠይቁ
help-identity =   .my.identity                 የማንነት ቅንብሮችን አሳይ
help-identity-did =   .my.identity.did             ራስዎ DID አሳይ (ለማንበብ ብቻ)
help-identity-publish =   .my.identity!publish @pub    DID በ publishing service ያሳትሙ
help-identity-export =   .my.identity!export          የራስ የማንነት ቅጅ አውርድ
help-config-path =   .config                      ሁሉንም .config.* ግቤቶች አሳይ

# ── እርዳታ — የገቢ ሳጥን ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    የገቢ ሳጥን ዘርዝር (ንዑስ ዛፍ እይታ)
help-inbox-n =   .my.inbox.N                  የ N ግቤት መስኮች አሳይ
help-inbox-from =   .my.inbox.N.from             የ N ግቤት ላኪ DID
help-inbox-reply =   .my.inbox.N!reply [body]     ምላሽ ይላኩ (ጽሑፍ ከሌለ አርታኢ ይከፈታል)
help-inbox-open =   .my.inbox.N!open             ይዘቱን ለማንበብ ብቻ አርታኢ ውስጥ ይክፈቱ
help-inbox-del =   .my.inbox.N:                 ግቤት N ሰርዝ
help-inbox-delall =   .my.inbox:                   ሁሉንም የገቢ ሳጥን ግቤቶች ሰርዝ
help-inbox-flush =   .my.inbox!flush              ሁሉንም ግቤቶች ወደ terminal አትም
help-inbox-filter =   .my.inbox!filter @who        ከ @who ብቻ ያሉ ልኮዎችን አሳይ
help-inbox-traverse =   .my.inbox.N.sender.<field>   የላኪ DID ሰነድ በዝግታ ያስሱ

# ── እርዳታ — ሰነዶች ────────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           ከተቀመጠ ይዘት ጋር አርታኢ ይክፈቱ
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID ያምጡ, ለፍተሻ ብቻ ይክፈቱ
help-doc-eval =   .my.doc.<name>!eval           የተቀመጠ ይዘት ሰረዝ-ሰረዝ ያሂዱ
help-doc-publish =   .my.doc.<name>!publish @pub   እንደ ጥሬ blob ያስቀምጡ (ማናቸውም አይነት)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML እንደ IPLD DAG-CBOR ሲስተም ያስቀምጡ
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID ይዘት ያስገቡ (አልተሰራም)
help-doc-cid =   .my.doc.<name>!cid            የተቀመጠ CID አሳይ
help-doc-del =   .my.doc.<name>:              ሰነዱን ሰርዝ

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n ከማንነትዎ ጋር የተያያዘውን የቋንቋ ምርጫ ያከማቻል።
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               የሚገኙ የቋንቋ ኮዶችን ይዘርዝሩ

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = የ間 ክፍል በ間 ማንነቶች መካከል ያለው ቦታ ነው። ma እነዚህ ማንነቶች እርስ በርስ እንዲገናኙ እና እንዲነጋገሩ ያደርጋል፤ ማንነትህ ከታተመ በኋላ መሳተፍ ትችላለህ።
help-ma-command =   .ma [port]                   ከአካባቢያዊ 間 runtime ጋር ተገናኝ፣ /status.json አንብብ፣ እና .ma.ctx.* አስቀምጥ
help-ma-publish =   .my.identity!publish @ma     DID ሰነድህን አትም፣ ሌሎች ቁልፎችህን እና endpoint እንዲያገኙ
help-ma-security = በጣም ግልጽ የመተማመን ድንበር የራስህ 間 runtime ከራስህ IPFS Desktop/Kubo ጋር ነው። የርቀት publisher ሊጠቅም ይችላል፣ ግን በዚያ ጊዜ በሌላ ሰው አገልግሎት ላይ ትመካለህ።
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             ወደ 間 ክፍል እንዴት መግባት እንደሚቻል

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = ማንነትህ ከታወቀ በኋላ፣ .enter @ma ወደ 間 እንድትገባ ያስችልሃል። ዓለም ፈልግ፣ ወደዚያ ግባ፣ እና ከዚያ ተሳተፍ።
help-ma-entry-steps = IPFS Desktop እና ma ጀምር፣ ከዚያ .ma አስኪድ። በ .my.identity!publish @ma አትም፣ ዓለም ፈልግ፣ እና በ .enter @ma ግባ።
help-ma-entry-command =   .enter @ma                  በ @ma runtime በኩል ወደ 間 ግባ
help-ma-entry-toggle =   .enter                       የክፍል ትኩረትን አብራ ወይም አጥፋ፤ ማንነትህ ንቁ ይቆያል
help-ma-entry-url =   ?enter=<runtime>             ከተጋራ URL ከገባህ በኋላ ግባ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = ያሉ ቋንቋዎች (.my.i18n: <ኮድ> ለማዘጋጀት):
err-lang-not-found = ቋንቋ አልተገኘም: { $lang }

msg-send-failed = መላኩ አልተሳካም: { $e }
msg-not-logged-in = አልገባም

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML ትንታኔ ስህተት፡ { $e }
yaml-not-mapping = YAML mapping (ቁልፍ፡ እሴት ጥንዶች) መሆን አለበት፤ ሸክ ጽሑፍ እና ቀላል ስካሎች እንደ DAG-CBOR ሊቀመጡ አይችሉም
dagcbor-encode-error = DAG-CBOR ምስጠራ ስህተት፡ { $e }
cbor-decode-error = CBOR ፍቺ ስህተት፡ { $e }
cbor-json-error = CBOR ወደ JSON ስህተት፡ { $e }
yaml-serialise-error = YAML ተጨጭ ስህተት፡ { $e }
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
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = መገለጫው ተመስጥሮ ወደ IPFS ተልኳል፤ CID ሲመጣ DID ሰነዱ ይዘምናል
profile-publish-done = መገለጫው ታትሟል — DID ሰነዱ በ ma.agent CID ተዘምኗል
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = ማንነት አስቀድሞ ታትሟል - የዘመነ መገለጫ
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = ሁለትዮሽ ይዘት (አይታይም)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ምንም)
profiles-deleted = ፕሮፋይል { $name } ተሰርዟል
profiles-not-found = ፕሮፋይል አልተገኘም: { $name }

# -- Help topics index
help-header-topics = -- ርዕሶች -- ዝርዝር ለማየት .help/<topic> ይተይቡ
help-topic-msg =   .help/msg                    መልዕክት
help-topic-ma = .help/ma                     間-ቦታ፣ ማተም እና መግባት
help-topic-path = .help/path                   የአካባቢ ነጥብ-መንገድ ሰዋሰው
help-topic-my =   .help/my                     የግል config
help-topic-inbox =   .help/inbox                  ገቢ መልዕክት
help-topic-doc =   .help/doc                    ሰነዶች
help-topic-actor =   .help/actor                  ርቀት actor
help-topic-zscheme =   .help/zscheme               የScheme መግለጫዎች በመስመር ውስጥ እና ሰነዶች
help-unknown-topic =   .help/{ $topic }: ያልታወቀ ርዕስ

# -- Help actor section
help-header-actor = -- ርቀት ተዋናዮች
help-actor-echo =   @actor                       DID ፍቺን አሳይ
help-actor-text = @actor[#entity]!msg|!say|!emote body         ቀጥተኛ/ቻት/የማሳየት መልእክት ላክ
help-actor-ping = @actor:ping                  ሕያውነት ፒንግ
help-actor-entities =   @actor/entities              entitiy ዘርዝር
help-actor-entities-get = @actor/entities/<n>          አካል መስቀለኛ መንገድ ያግኙ
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity አርትዕ
help-actor-entities-del = @actor/entities/<n>:         አካል ሰርዝ
help-actor-config-get =   @actor/config/<key>          config እሴት አግኝ
help-actor-config-set =   @actor/config/<key>: val     config እሴት አዘጋጅ
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL አርትዕ
help-actor-fragment =   @actor#entity                ወደ plugin ላክ
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ወደ plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                የርቀት CRUD ይዘትን ከ31 ያግኙ
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  የ5 ምላሾችን በክፍለ-ጊዜው ውስጥ ያቆዩ
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    zionን በURL አገናኝ ቁልፍ መክፈት
help-topic-i18n = .help/i18n                   ለማንነትዎ የቋንቋ ምርጫ
help-header-url = ── የURL መለኪያዎች ───────────────────────────────────────────────────────────────────
help-url-intro =   zionን ሊከፍት የሚችል አገናኝ ያካፍሉ — ተቀባዩ አስቀድሞ ይሞላል:
help-url-msg =   ?msg=<did>                   ቀልዱ ሞሉ: @<did>!msg (ቀላል መልዕክት)
help-url-say =   ?say=<did>                   ቀልዱ ሞሉ: @<did>!say (say ቃሉ)
help-url-emote =   ?emote=<did>                 ቀልዱ ሞሉ: @<did>!emote (emote ቃሉ)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             ከገቡ በኋላ ወደ ሩጫው ዓለም ይግቡ
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ግቤቱ አስቀድሞ ተሞልቷል ግን አልተላከም — ለመላክ Enter ይጫኑ።
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                ህሊናዎን ወደ ኔትወርክ ያሳትሙ
help-header-publish = ── ህሊና ማሳተም ────────────────────────────────────────────────────────────────
help-publish-intro = ማሳተም ህሊናዎን በኔትወርክ ላይ ሊፈለግ የሚችል ያደርጋል። ሌሎች DID ዎን ፈልገው ሊያገኙዎ ይችላሉ።
help-publish-ma = ለማሳተም 間 (አካባቢያዊ runtime) ተጭኖ መሆን አለበት። ego ን ከ IPFS/IPNS ጋር ይሳስራል።
help-publish-steps = ደረጃዎች: አካባቢያዊ ma ለማግኘት '.ma [port]' ያሂዱ፣ ከዚያም '.my.identity!publish @ma'።
help-publish-without = ሳያሳትሙ ሌሎች ሊደርሱዎ አይችሉም — DID ዎን ቢያውቁም የርስዎን endpoint መፍታት አይችሉም።
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = የመገለጫ ስም ይግለጹ፦ .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = ባች መሰብሰብ — ትዕዛዞችን ይተይቡ፣ በ.batch ያበቃል
batch-already-collecting = አንድን ስብስብ እየሰበሰብኩ ነው - መጀመሪያ በ.batch ጨርስ
batch-empty = ባች ባዶ ነበር - ምንም የሚሮጥ የለም።
batch-running = batch በሂደት ላይ…
batch-step-timeout = የምድብ እርምጃ ጊዜው አልፎበታል።

batch-done = Batch በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
batch-done-error = Batch ከስህተቶች ጋር በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
msg-timeout = መልዕክቱ ጊዜው አልፏል (በ60s ምላሽ የለም)
err-unknown-command = ያልታወቀ ትእዛዝ፦ { $path }
err-read-only-path = { $path } ለንባብ ብቻ ነው
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        ጊዜያዊ ሰነድ ገምግም (በትይዩ)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } ማምጣት አልተሳካም፡ { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = የሚሰራ CID አይደለም፡ { $value }
label-runtime = ማ
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = ማስጠንቀቂያ፡ የእርስዎ IPNS የግል ቁልፍ ለማንነት ህትመት ወደ ይህ runtime ይላካል። ሙሉ በሙሉ የሚያምኑትን runtime ብቻ ይጠቀሙ።

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme በzion ትእዛዞች ውስጥ የተካተቱ የScheme መግለጫዎችን ይገምግማል፣ ከመላኩም በፊት ውጤቱን በመስመሩ ውስጥ ያስገባል።
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    የመስመር ውስጥ ምሳሌ፤ "say 7 + 5 = 12" ይልካል
help-zscheme-define =   (define x 12)             መግለጫዎች ለአሁኑ የመግቢያ ክፍለ ጊዜ ይቆያሉ
help-zscheme-doc = ሰነድ: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = ቦታዊ IPFS gateway (የሳፕሩ ፈቃድ ያስፈልጋል)

tab-config = ቅንብሮች
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
