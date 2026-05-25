# zion — አማርኛ
lang-name = አማርኛ

# ── የመግቢያ ገጽ ─────────────────────────────────────────────────────────────
tab-login = ግባ
tab-new-identity = አዲስ ማንነት
tab-import = አስገባ
label-passphrase = ሚስጥራዊ ሐረግ
label-username = የተጠቃሚ ስም
label-confirm-passphrase = ሚስጥራዊ ሐረግ አረጋግጥ
btn-login = ግባ
btn-export = አውጣ
btn-generate = ፍጠር
passphrase-warning = ሚስጥራዊ ሐረጉን ማጣት = ማንነትን ማጣት። ምንም ማስታወሻ የለም።
import-help = የተወጣ .zion.json ፋይል ይምረጡ። ጥቅሉ ምስጠራ ሆኖ ይቆያል።
status-unlocking = እየተከፈተ...
status-generating = ማንነት እየተፈጠረ...
status-reading-file = ፋይል እየተነበበ...
status-imported = '{ $name }' ገብቷል — ወደ መግቢያ ትር ይቀይሩ
error-wrong-passphrase = ሚስጥራዊ ሐረጉ ስህተት ነው: { $e }
error-identity-not-found = ማንነቱ '{ $name }' አልተገኘም
error-username-required = የተጠቃሚ ስም ያስፈልጋል
error-passphrase-required = ሚስጥራዊ ሐረግ ያስፈልጋል
error-passphrases-no-match = ሚስጥራዊ ሐረጎቹ አይዛመዱም

# ── የ terminal ስርዓት መልዕክቶች ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — እንደ { $username } ገብተዋል
msg-type-help = የትዕዛዞች ዝርዝር ለማየት .help ይተይቡ።
msg-connecting = ወደ iroh እየተገናኘ...
msg-iroh-ready = iroh ማጠናቀቂያ ዝግጁ ነው
msg-iroh-failed = iroh: { $e }
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

# ── ተግባራት — የስራ ሰዓት ─────────────────────────────────────────────────────
discover-fetch-failed = ፍለጋ { $url } ላይ አልተሰራም: { $e }
discover-json-error = ፍለጋ አልተሰራም: ከ{ $url } ያልተሟላ JSON: { $e }
discover-missing-did = ፍለጋ አልተሰራም: status.json የ`did` ሜዳ ጎደለ
discover-invalid-did = ፍለጋ አልተሰራም: `did` did:ma: ለ መጀምር ይጠበቃል, `{ $did }` ተገኘ
discover-no-endpoint = የፍለጋ ማስጠንቀቂያ: `endpoint_id` status.json ውስጥ ጎደለ; DID ብቻ ተቀምጧል
discover-success = ma { $url } ላይ ተገኘ
discover-did-line = DID: { $did }
discover-alias-hint =   ቅፅል ስም @ma ተፈጠረ — ያትሙ: .my.identity:publish @ma
claim-success = Runtime ለ{ $did } ተጠየቀ
claim-conflict = Runtime ቀደም ሲል በሌላ ማንነት ተጠይቋል
claim-http-failed = ጥያቄ አልተሰራም: HTTP { $status }
claim-error = ጥያቄ አልተሰራም: { $e }
claim-no-session = አልገቡም; runtime ለመጠየቅ መጀመሪያ ይግቡ
runtime-no-verb = ለ{ $path } `{ $verb }` ተግባር የለም

# ── ተግባራት — ACL ──────────────────────────────────────────────────────────
acl-reset = .my.acl ዳግም ተቀናጅቷል (ሙሉ በሙሉ ክፍት)
acl-persist-error = የማስቀመጥ ስህተት: { $e }
acl-no-verb = ለ.my.acl `{ $verb }` ተግባር የለም

# ── ተግባራት — ማንነት ────────────────────────────────────────────────────────
publish-usage = አጠቃቀም: .my.identity:publish <did-ወይም-ቅፅል-ስም>

# ── ተግባራት — ሰነዶች ───────────────────────────────────────────────────────
doc-content-empty = { $path }.content ባዶ ነው
doc-save-first = { $path }.content ባዶ ነው — መጀመሪያ ያስቀምጡ
doc-missing-name = የሰነድ ስም ጎደለ
doc-publish-usage = አጠቃቀም: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = አጠቃቀም: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = { $path } ማተም: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-ipld-store-sent = IPLD የማስቀመጥ ጥያቄ ተልኳል ({ $id }) → { $publisher }; CID በ RPC ምላሽ ይደርሳል
doc-fetch-done = { $cid } ተሰብስቧል → { $path }.content (አልተሰራም)
doc-fetch-failed = { $cid } ማምጣት: { $e }
doc-fetch-usage = አጠቃቀም: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid አልተዘጋጀም
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
help-cmd-logout =   .logout                      ይውጡ

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
help-config-verb =   .path:verb [args]            ሁናቴ ተግባር ይጥሩ

# ── እርዳታ — ተሎ ጥቅም ላይ የሚዋሉ ─────────────────────────────────────────
help-my =   .my                          ሁሉንም የግል ቅንብሮች አሳይ
help-aliases =   .my.aliases                  ቅፅል ስሞችን ዘርዝር
help-aliases-set =   .my.aliases.<name>: <did>    ቅፅል ስም ጨምር/አዘምን (bare DID, #fragment የለም)
help-aliases-del =   .my.aliases.<name>:          ቅፅል ስም አስወግድ
help-runtime-discover =   .my.ma:discover          ሁናቴ runtime ፈልግ እና ቅፅል ስም @ma ፍጠር
help-runtime-claim =   .my.ma:claim             DIDዎ በ runtime ባለቤትነት ጠይቁ
help-identity =   .my.identity                 የማንነት ቅንብሮችን አሳይ
help-identity-did =   .my.identity.did             ራስዎ DID አሳይ (ለማንበብ ብቻ)
help-identity-publish =   .my.identity:publish @pub    DID በ publishing service ያሳትሙ
help-config-path =   .config                      ሁሉንም .config.* ግቤቶች አሳይ

# ── እርዳታ — የገቢ ሳጥን ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    የገቢ ሳጥን ዘርዝር (ንዑስ ዛፍ እይታ)
help-inbox-n =   .my.inbox.N                  የ N ግቤት መስኮች አሳይ
help-inbox-from =   .my.inbox.N.from             የ N ግቤት ላኪ DID
help-inbox-reply =   .my.inbox.N:reply [body]     ምላሽ ይላኩ (ጽሑፍ ከሌለ አርታኢ ይከፈታል)
help-inbox-open =   .my.inbox.N:open             ይዘቱን ለማንበብ ብቻ አርታኢ ውስጥ ይክፈቱ
help-inbox-del =   .my.inbox.N:                 ግቤት N ሰርዝ
help-inbox-delall =   .my.inbox:                   ሁሉንም የገቢ ሳጥን ግቤቶች ሰርዝ
help-inbox-flush =   .my.inbox:flush              ሁሉንም ግቤቶች ወደ terminal አትም
help-inbox-traverse =   .my.inbox.N.sender.<field>   የላኪ DID ሰነድ በዝግታ ያስሱ

# ── እርዳታ — ሰነዶች ────────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           ከተቀመጠ ይዘት ጋር አርታኢ ይክፈቱ
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID ያምጡ, ለፍተሻ ብቻ ይክፈቱ
help-doc-eval =   .my.doc.<name>:eval           የተቀመጠ ይዘት ሰረዝ-ሰረዝ ያሂዱ
help-doc-publish =   .my.doc.<name>:publish @pub   እንደ ጥሬ blob ያስቀምጡ (ማናቸውም አይነት)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML እንደ IPLD DAG-CBOR ሲስተም ያስቀምጡ
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID ይዘት ያስገቡ (አልተሰራም)
help-doc-cid =   .my.doc.<name>:cid            የተቀመጠ CID አሳይ
help-doc-del =   .my.doc.<name>:              ሰነዱን ሰርዝ

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
err-edit-decode-failed = ማርትዕ: ዲኮድ አልተሳካም: { $e }
err-edit-fetch-failed = ማርትዕ: ማምጣት አልተሳካም: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ንቁ ክፍለ ጊዜ የለም — ፕሮፋይልን መሰረዝ አይቻልም
profile-delete-error = ፕሮፋይልን መሰረዝ አልተሳካም: { $e }
profile-no-verb = .my.profile: ያልታወቀ ትዕዛዝ: { $verb }
