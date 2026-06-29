# zion — Igbo
lang-name = Igbo

# ── Ibe ịbanye ────────────────────────────────────────────────────────────
tab-login = banye
tab-new-identity = njirimara ọhụrụ
tab-import = tinye
label-passphrase = okwu nzuzo
label-username = aha onye ọrụ
label-confirm-passphrase = gosi okwu nzuzo
btn-login = banye
btn-export = pụta
btn-generate = mepụta
btn-new-endpoint = ọnụ ụzọ ọhụrụ
passphrase-warning = Ịhapụ okwu nzuzo = ịhapụ njirimara. Ọ dịghị iweghachi.
import-help = Họrọ faịlụ .zion.json etinyere. Bundle ahụ ka dị na nzuzo.
status-unlocking = na-emeghe...
status-generating = na-emepụta njirimara...
status-reading-file = na-agụ faịlụ...
status-imported = atinyere '{ $name }' — gaa tab ịbanye
error-wrong-passphrase = okwu nzuzo ezighi ezi: { $e }
error-identity-not-found = achịghị njirimara '{ $name }'
error-username-required = aha onye ọrụ dị mkpa
error-passphrase-required = okwu nzuzo dị mkpa
error-passphrases-no-match = okwu nzuzo abụọ adabaghị

# ── Ozi sistemụ terminal ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — abanyela dị ka { $username }
msg-type-help = Pịnye .help maka ndepụta iwu.
msg-connecting = na-ejikọ na iroh...
msg-iroh-ready = ọhere iroh dị njikere
msg-iroh-failed = iroh: { $e }
msg-auto-published = Ebipụtara DID site na ma mpaghara ({ $url })
msg-identity-not-published = Atụfuọla njirimara n'ịntanetị — ọ bụrụ na ma edepụtara n'ebe obibi, bido '.my.ma:discover' wee mee '.my.identity:publish @ma'. Dee '.help.publish' maka nkọwa.
msg-blocked = ⊗ ewepụtara [{ $cap }]: { $from }
msg-focus-cleared = ewepụtara ntụleanya
msg-focusing = na-etinye uche na { $did } dị ka { $prompt }
msg-set = { $path }: { $value }
msg-deleted = ehichapụrụ { $path } ({ $count } ndepụta)
msg-read-only = { $path } bụ maka ịgụ naanị
msg-subtree-set = { $path } bụ alaka; ọ jụrụ ịtọ
msg-ancestor-leaf = nna nna { $path } bụ ọhụrụ; ọ jụrụ ikpuchi
msg-key-not-found = achịghị igodo: { $path }
msg-no-match = enweghị ihe dabara
msg-link-not-connected = njehie ịnweta njikọ: ejikọghị
msg-link-fetch-error = njehie ịnweta njikọ: { $e }
msg-link-key-not-found = achịghị igodo `{ $key }` n'akwụkwọ ejikọrọ

# ── Nkwado aha nchọkwa ─────────────────────────────────────────────────────
err-alias-name-empty = aha nchọkwa enweghị ike ịbụ efu
err-alias-has-dot = aha nchọkwa enweghị ike inwe '.'
err-alias-has-fragment = aha nchọkwa enweghị ike inwe '#'
err-alias-value-fragment = uru nchọkwa ga-abụ bare did:ma:<ipns> (enweghị fragment)
err-alias-value-path = uru nchọkwa ga-abụ bare did:ma:<ipns> (enweghị path)
err-alias-not-did = uru nchọkwa ga-amalite na did:ma:
err-unknown-alias = nchọkwa amaghị: @{ $name }
err-bare-did = a tọọ bare did:ma:<ipns> (enweghị fragment ma ọ bụ path), nwetara { $did }

# ── Onye ndezi ────────────────────────────────────────────────────────────
btn-save = chekwaa
btn-eval = rụọ ọrụ
btn-cancel = kagbuo
btn-close = mechie
btn-reply = zaghachi
btn-publish = bipụta
btn-publish-ipld = bipụta IPLD
msg-reply-sent = ezitela ọzaghachi
msg-reply-failed = ọzaghachi erughị: { $e }
msg-entity-publish-sent = entity { $name }: ezitela ịbipụta
msg-entity-publish-failed = ịbipụta entity erughị: { $e }
msg-kind-publish-failed = ịpụta ụdị dara ada: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ezitela ịbipụta
msg-field-publish-failed = ịbipụta ngalaba erughị: { $e }
msg-acl-publish-sent = runtime ACL: ezitela ịbipụta
msg-crud-edit-publish-sent = { $path }: ezitela ịbipụta
msg-acl-publish-failed = ịbipụta runtime ACL erughị: { $e }
msg-yaml-error = njehie YAML: { $e }
msg-editor-saved = { $path }:chekwaa
msg-fetch-review = enwetara { $cid } — lelee tupu ịrụ ọrụ
msg-fetch-failed = ịnweta { $cid }: { $e }

# ── Ọrụ — igbe ozi ────────────────────────────────────────────────────────
inbox-empty = igbe ozi di efu
inbox-entry-not-found = achịghị ndepụta igbe ozi { $n }
inbox-no-message-id = ndepụta igbe ozi { $n } enweghị message_id
inbox-no-verb = enweghị ọrụ `{ $verb }` maka ndepụta igbe ozi { $n }
inbox-filter-no-arg = filter chọrọ arụmụka DID ma ọ bụ alias
inbox-filter-empty = enweghị ozi sitere na { $did }

# ── Ọrụ — oge ọrụ ─────────────────────────────────────────────────────────
discover-fetch-failed = nchọpụta erughị na { $url }: { $e }
discover-json-error = nchọpụta erughị: JSON na-ezighị ezi si { $url }: { $e }
discover-missing-did = nchọpụta erughị: status.json enweghị ngalaba `did`
discover-invalid-did = nchọpụta erughị: `did` ga-amalite na did:ma:, nwetara `{ $did }`
discover-no-endpoint = ọdịmara nchọpụta: `endpoint_id` dịghị na status.json; echekwara DID naanị
discover-success = achọpụtara ma na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   emepụtara alias @ma — mee '.my.identity:publish @ma' iji bipute njirimara gị.
claim-success = akwụtara Runtime maka { $did }
claim-conflict = njirimara ọzọ akwụtara Runtime otu oge
claim-http-failed = ikwu akwụ erughị: HTTP { $status }
claim-error = ikwu akwụ erughị: { $e }
claim-no-session = abanyeghị; banye ka ọ bụrụ nke mbụ iji kwu akwụ runtime
runtime-no-verb = enweghị ọrụ `{ $verb }` maka { $path }

# ── Ọrụ — ACL ─────────────────────────────────────────────────────────────
acl-reset = etọghachiri .my.acl (mepee kpamkpam)
acl-persist-error = njehie echekwa: { $e }
acl-no-verb = enweghị ọrụ `{ $verb }` maka .my.acl

# ── Ọrụ — njirimara ───────────────────────────────────────────────────────
publish-usage = ojiji: .my.identity:publish <did-ma-ọ-bụ-nchọkwa>
identity-exported = A budata bundle dị ka { $filename }
identity-export-failed = Nbupu enweghị ike: { $e }

# ── Ọrụ — akwụkwọ ────────────────────────────────────────────────────────
doc-content-empty = { $path }.content di efu
doc-save-first = { $path }.content di efu — chekwaa ka ọ bụrụ nke mbụ
doc-missing-name = aha akwụkwọ hapụrụ
doc-publish-usage = ojiji: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = ojiji: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = ịbipụta { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = ezitela arịrịọ echekwa ({ $id }) → { $publisher }; CID ga-abịa site na ọzaghachi RPC
doc-ipld-store-sent = ezitela arịrịọ echekwa IPLD ({ $id }) → { $publisher }; CID ga-abịa site na ọzaghachi RPC
doc-fetch-done = enwetara { $cid } → { $path }.content (arụghị ọrụ)
doc-fetch-failed = ịnweta { $cid }: { $e }
doc-fetch-usage = ojiji: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = atọghị { $path }.cid
doc-no-verb = enweghị ọrụ `{ $verb }` maka { $path }
path-no-verb = enweghị ọrụ `{ $verb }` maka { $path }

# ── Enyemaka — isi ────────────────────────────────────────────────────────
help-header-zion = ── iwu zion ──────────────────────────────────────────────────────────────
help-header-messaging = ── ịziga ozi ─────────────────────────────────────────────────────────────
help-header-focus = ── ọnọdụ ntụleanya ──────────────────────────────────────────────────────
help-header-config = ── nhazi grammar ebe obibi ──────────────────────────────────────────────
help-header-common = ── ụzọ a na-ejikarị ─────────────────────────────────────────────────────
help-header-inbox = ── igbe ozi ─────────────────────────────────────────────────────────────
help-header-documents = ── akwụkwọ ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Enyemaka — iwu zion ───────────────────────────────────────────────────
help-cmd-help =   .help                        ederede a
help-cmd-clear =   .clear                       kpochaa terminal
help-cmd-panic =   .panic                       ụzọ ikpeazụ — jiri ya mgbe ị nọ n'nsogbu
help-cmd-history =   .history                     akụkọ ihe mere (ndị mwepụta n'usoro jikọtara)
help-cmd-logout =   .logout                      pụọ
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Enyemaka — ịziga ozi ──────────────────────────────────────────────────
help-msg-echo =   @alias                       gosi DID ezatara (ezitaraghị ozi)
help-msg-send =   @alias[:verb] body           ziga ozi / RPC na onye na-eme ihe
help-msg-fragment =   @alias#fragment[:verb] body  ziga na nchọkwa nwere fragment DID ọkụkọ
help-msg-escape =   \@name                       @name n'okwu n'okwu (ọ chọghị nchọkwa)

# ── Enyemaka — ọnọdụ ntụleanya ───────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       tụlee uche na onye na-eme ihe (gbanwee prompt)
help-focus-clear =   .use                         hichapụ ntụleanya

# ── Enyemaka — nhazi grammar ──────────────────────────────────────────────
help-config-get =   .path                        nweta uru ọhụrụ ma ọ bụ depụta alaka
help-config-filter =   .path value                  dakọta arịrịọ (isi n'uru)
help-config-set =   .path: value                 tọ ọhụrụ
help-config-delete =   .path:                       hichapụ ọhụrụ ma ọ bụ alaka
help-config-verb =   .path:verb [args]            kpọọ ọrụ obibi

# ── Enyemaka — ụzọ a na-ejikarị ──────────────────────────────────────────
help-my =   .my                          gosi nhazi nke onwe gị niile
help-aliases =   .my.aliases                  depụta nchọkwa
help-aliases-set =   .my.aliases.<name>: <did>    tinye/mezigharị nchọkwa (bare DID, enweghị #fragment)
help-aliases-del =   .my.aliases.<name>:          wepu nchọkwa
help-runtime-discover =   .my.ma:discover          chọpụta runtime obibi ma mepụtakwa nchọkwa @ma
help-runtime-claim =   .my.ma:claim             kwụa akwụ runtime site na DID gị
help-identity =   .my.identity                 gosi nhazi njirimara
help-identity-did =   .my.identity.did             gosi DID gị (ịgụ naanị)
help-identity-publish =   .my.identity:publish @pub    bipụta DID site na ọrụ ịbipụta
help-identity-export =   .my.identity:export          budata bundle identity gị
help-config-path =   .config                      gosi ndepụta .config.* niile

# ── Enyemaka — igbe ozi ──────────────────────────────────────────────────
help-inbox =   .my.inbox                    depụta igbe ozi (nlele alaka)
help-inbox-n =   .my.inbox.N                  gosi ngalaba ndepụta N
help-inbox-from =   .my.inbox.N.from             DID onye zigara ndepụta N
help-inbox-reply =   .my.inbox.N:reply [body]     ziga ọzaghachi (meghe onye ndezi ọ bụrụ na ọ dịghị ahụ)
help-inbox-open =   .my.inbox.N:open             mepee ọdịnaya maka ịgụ naanị n'onye ndezi
help-inbox-del =   .my.inbox.N:                 hichapụ ndepụta N
help-inbox-delall =   .my.inbox:                   hichapụ ndepụta igbe ozi niile
help-inbox-flush =   .my.inbox:flush              bipụta ndepụta niile na terminal
help-inbox-filter =   .my.inbox:filter @who        gosi naanị ndepụta site na @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   gafee akwụkwọ DID onye zigara n'ụzọ nwayọọ

# ── Enyemaka — akwụkwọ ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           mepee onye ndezi nwere ọdịnaya echekwara
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     nweta CID, mepee maka nlele naanị
help-doc-eval =   .my.doc.<name>:eval           rụọ ọdịnaya echekwara akara n'akara
help-doc-publish =   .my.doc.<name>:publish @pub   chekwaa dị ka blob ọhụrụ (ụdị ọ bụla)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  chekwaa YAML dị ka ọkpụrụkpụ IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    bawanye ọdịnaya CID (arụghị ọrụ)
help-doc-cid =   .my.doc.<name>:cid            gosi CID echekwara
help-doc-del =   .my.doc.<name>:              hichapụ akwụkwọ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Asụsụ ndị dị (.my.i18n: <code> were tọọ):
err-lang-not-found = asụsụ ahụ achọtaghị: { $lang }

msg-send-failed = izipu dara ada: { $e }
msg-not-logged-in = abanye ọ bụghị

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Njehie YAML: { $e }
yaml-not-mapping = YAML ga-abụ mapping (ọpọ igodo: ọnọdụ); edemede nkịtị na scalar enweghị ike idobe ya dị ka DAG-CBOR
dagcbor-encode-error = Njehie ndenye DAG-CBOR: { $e }
cbor-decode-error = Njehie denye CBOR: { $e }
cbor-json-error = Njehie CBOR→JSON: { $e }
yaml-serialize-error = Njehie serialization YAML: { $e }
edit-reply-invalid = Nzaghachi mmezi na-arụ ọrụ
doc-publish-ipld-error = Nkwuputa IPLD dara: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Njehie chekwa inbox: { $e }
err-config-load = Njehie nbudata nhazi: { $e }
err-lang-persist = Njehie chekwa asụsụ: { $e }
err-history-parse = Njehie nyochaa akụkọ ihe mere eme: { $e }
err-history-load = Njehie nbudata akụkọ ihe mere eme: { $e }
err-ipfs-reply-decode = Njehie denye azịza IPFS: { $e }
err-edit-cbor = Njehie mmezi CBOR: { $e }
err-popup-blocked = Browser egbochi popup
status-publishing = nkwupụta

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = njehie
rpc-error-detail = njehie: { $detail }
msg-new-message = ← [{ $from }] ozi ọhụrụ — { $count } n'igbe ozi
msg-chat = { $sender } si { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } kwuru { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } banyere n'ọnụ ụlọ.
room-leave = * { $name } pụọ n'ọnụ ụlọ.
room-drop  = * { $name } tụfuo { $thing }.
room-take  = * { $name } were { $thing }.
err-edit-decode-failed = dezie: ọdịda ntụgharị: { $e }
err-edit-fetch-failed = dezie: ọdịda nweta: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = enweghị nnọọ nọọọ — enweghị ike ihichapụ profaịlụ
profile-delete-error = ihichapụ profaịlụ dara ada: { $e }
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
profiles-empty = (ọ dịghị)
profiles-deleted = profaịlụ { $name } ahichapụrụ
profiles-not-found = profaịlụ ahụghị: { $name }

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

help-topic-url =   .help.url                    mepee zion site na njikọ URL
help-header-url = ── ihe mmezi URL ────────────────────────────────────────────────────────────────
help-url-intro =   Kesaa njikọ imepee zion nwere onye nnata edebere:
help-url-msg =   ?msg=<did>                   deeye tupu: @<did> (ozi dị mfe)
help-url-say =   ?say=<did>                   deeye tupu: @<did>:say (ngwa ọrụ say)
help-url-emote =   ?emote=<did>                 deeye tupu: @<did>:emote (ngwa ọrụ emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Ntinye edebere ọzọ ma ọ bụ na ezigheziela — pịa Enter ịziga.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                bipute njirimara gị na netwọk
help-header-publish = ── ibiputa njirimara ─────────────────────────────────────────────────────────
help-publish-intro = Ibibiputa na-eme ka a nọchie njirimara gị na netwọk. Ndị ọzọ nwere ike ịchọ DID gị iji kpọtụrụ gị.
help-publish-ma = Iji bipute, ọ dị mkpa ịnwe ma (runtime nke mpaghara) edepụtara. Ọ na-ejikọta ego na IPFS/IPNS n'aha gị.
help-publish-steps = Usoro: bido '.my.ma:discover' iji chọpụta ma nke mpaghara, wee mee '.my.identity:publish @ma'.
help-publish-without = Na-enweghị ibiputa, ndị ọzọ enweghị ike iru gị — ọ bụrụn'ọ ha mata DID gị, ha enweghị ike idozi endpoint gị.
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


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Ịnweta CID { $cid } enweghị ike: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID na-adịghị mma: { $value }
