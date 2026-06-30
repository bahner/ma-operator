# zion — Krio
lang-name = Krio

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = new identity
tab-import = import
label-passphrase = passfraze
label-username = yuza nem
label-confirm-passphrase = konfam passfraze
btn-login = login
btn-export = eksport
btn-generate = jenaret
btn-new-endpoint = nyu endpoint
passphrase-warning = Lus passfraze = lus identity. Nor get no wei fi get am bak.
import-help = Selekt wan .zion.json fail we dem eksport. Di babol go stei enkryptid.
status-unlocking = de unlok...
status-generating = de jenaret identity...
status-reading-file = de rid fail...
status-imported = import '{ $name }' — switch go Login tab
error-wrong-passphrase = rong passfraze: { $e }
error-identity-not-found = identity '{ $name }' nor fine
error-username-required = yuza nem nid
error-passphrase-required = passfraze nid
error-passphrases-no-match = passfraze dem nor match

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — login as { $username }
msg-type-help = Taip .help fi get list ɔf komand dem.
msg-connecting = de konect go iroh...
msg-iroh-ready = iroh endpoint redi
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID don pablish tru local ma ({ $url })
msg-identity-not-published = Ɔpsɛt nɔ fɔ gɛt ɔnlain — ɛf ma dɔn sɛt ɛp fo yɔ, ron '.ma!discover' den '.my.identity:publish @ma'. Rait '.help.publish' fo mɔ infɔmeshɔn.
msg-blocked = ⊗ blok [{ $cap }]: { $from }
msg-focus-cleared = fokɔs klia
msg-focusing = fokɔs { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = delete { $path } ({ $count } entri dem)
msg-read-only = { $path } na rid-only
msg-subtree-set = { $path } na wan sabtri; rifiyuz fi set am
msg-ancestor-leaf = wan ansesta ɔf { $path } na wan lif; rifiyuz fi shadɔ am
msg-key-not-found = ki nor fine: { $path }
msg-no-match = nor get match
msg-link-not-connected = link fetch ɛrɔ: nor konect
msg-link-fetch-error = link fetch ɛrɔ: { $e }
msg-link-key-not-found = ki `{ $key }` nor fine insaid di linkid dokument

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias nem nor fit bi empty
err-alias-has-dot = alias nem nor fit get '.'
err-alias-has-fragment = alias nem nor fit get '#'
err-alias-value-fragment = alias value mas bi bɛ did:ma:<ipns> (nor get fragment)
err-alias-value-path = alias value mas bi bɛ did:ma:<ipns> (nor get path)
err-alias-not-did = alias value mas stat wit did:ma:
err-unknown-alias = unkown alias: @{ $name }
err-bare-did = ekspekt bɛ did:ma:<ipns> (nor get fragment ɔ path), get { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Sev
btn-eval = Eval
btn-cancel = Kansel
btn-close = Kloz
btn-reply = Rɛpli
btn-publish = Pɔblish
btn-publish-ipld = Pɔblish IPLD
msg-reply-sent = rɛpli don sen
msg-reply-failed = rɛpli fail: { $e }
msg-entity-publish-sent = entity { $name }: pɔblish don sen
msg-entity-publish-failed = entity pɔblish fail: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: pɔblish don sen
msg-field-publish-failed = field pɔblish fail: { $e }
msg-acl-publish-sent = runtime ACL: pɔblish don sen
msg-crud-edit-publish-sent = { $path }: pɔblish don sen
msg-acl-publish-failed = runtime ACL pɔblish fail: { $e }
msg-yaml-error = YAML ɛrɔ: { $e }
msg-editor-saved = { $path }:sev
msg-fetch-review = fetch { $cid } — riview bifo eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entri { $n } nor fine
inbox-no-message-id = inbox entri { $n } nor get message_id
inbox-no-verb = nor get vɛb `{ $verb }` fɔ inbox entri { $n }
inbox-filter-no-arg = filta nid DID ɔr alias argument
inbox-filter-empty = nɔ mesej fɔm { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskɔva fail at { $url }: { $e }
discover-json-error = diskɔva fail: invalid JSON from { $url }: { $e }
discover-missing-did = diskɔva fail: status.json nor get `did` field
discover-invalid-did = diskɔva fail: ekspekt `did` fi stat wit did:ma:, get `{ $did }`
discover-no-endpoint = diskɔva waning: `endpoint_id` nor dɛ status.json; sev DID only
discover-success = ma diskɔva at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias mek — ron '.my.identity:publish @ma' fo pɔblish yu ɔpsɛt.
claim-success = Runtime claim fɔ { $did }
claim-conflict = Runtime already claim by anɔdɔ identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor login; login fɛs fi claim di runtime
runtime-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = pɛsist ɛrɔ: { $e }
acl-no-verb = nor get vɛb `{ $verb }` fɔ .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = yusij: .my.identity:publish <did-ɔ-alias>
identity-exported = Bɔndɔl dɔnlod as { $filename }
identity-export-failed = Ekspɔt fɛl: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content empty
doc-save-first = { $path }.content empty — sev fɛs
doc-missing-name = dokument nem nor dɛ
doc-publish-usage = yusij: .my.doc.<nem>:publish <pɔblisha>
doc-publish-ipld-usage = yusij: .my.doc.<nem>:publish-ipld <pɔblisha>
doc-publish-failed = pɔblish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-ipld-store-sent = IPLD stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-fetch-done = fetch { $cid } → { $path }.content (nor execute)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = yusij: .my.doc.<nem>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = nor get vɛb `{ $verb }` fɔ { $path }
path-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lenggwij dem wey dey (set wit .my.i18n: <code>):

err-lang-not-found = langwej nor fine: { $lang }

help-header-zion = ── zion komand dem ────────────────────────────────────────────────────────
help-header-messaging = ── mesej dem ──────────────────────────────────────────────────────────────
help-header-focus = ── fokus mod ──────────────────────────────────────────────────────────────
help-header-config = ── lokal konfig gramma ────────────────────────────────────────────────────
help-header-common = ── komon paf dem ──────────────────────────────────────────────────────────
help-header-inbox = ── inbox ──────────────────────────────────────────────────────────────────
help-header-documents = ── dokument dem (.my.doc.*) ───────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text
help-cmd-clear =   .clear                       klia terminal
help-cmd-panic =   .panic                       las opshen — yus if yu los yoself
help-cmd-history =   .history                     komand istri (kopi dem wey dɔn folo sɛf bia wanwan)
help-cmd-logout =   .logout                      log owt
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)
help-msg-echo =   @alias                       eko di DID wey resolve (noh mesej sent)
help-msg-send =   @alias[:verb] body           send mesej / RPC go to ator
help-msg-fragment =   @alias#fragment[:verb] body  send go to alias wid eksplisit DID fragment
help-msg-escape =   \@name                       literal @name (noh alias lukov)
help-focus-set =   .use @alias [as @name]       fokus pan ator (chenja prompt)
help-focus-clear =   .use                         klia fokus
help-config-get =   .path                        get lif valu or list sabtri
help-config-filter =   .path value                  match kweri (filta bay valu)
help-config-set =   .path: value                 set lif
help-config-delete =   .path:                       dilet lif or sabtri
help-config-verb =   .path:verb [args]            invok lokal vob
help-my =   .my                          shoh all pesonal konifig
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did>    add/update alias (ber DID, noh #fragment)
help-aliases-del =   .my.aliases.<name>:          rimov alias
help-runtime-discover =   .ma!discover          diskova lokal runtime en kreyet @ma alias
help-runtime-claim =   .ma!claim             klem runtime onashep wid yu DID
help-identity =   .my.identity                 shoh identity konifig
help-identity-did =   .my.identity.did             shoh on DID (rid onli)
help-identity-publish =   .my.identity:publish @pub    pablish on DID bifo pablisha sovic
help-identity-export =   .my.identity:export          dɔnlod yu ɔn idɛntiti bɔndɔl
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N fild dem
help-inbox-from =   .my.inbox.N.from             senda DID foh entri N
help-inbox-reply =   .my.inbox.N:reply [body]     send ripla (opin edita if noh bodi)
help-inbox-open =   .my.inbox.N:open             opin entri kontent rid-onli insay edita
help-inbox-del =   .my.inbox.N:                 dilet entri N
help-inbox-delall =   .my.inbox:                   dilet all inbox entri dem
help-inbox-flush =   .my.inbox:flush              print all entri dem go terminal
help-inbox-filter =   .my.inbox:filter @who        sho ɔnli entri fɔm @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   travos senda DID dokument layzili
help-doc-edit =   .my.doc.<name>:edit           opin edita wid seyvd kontent
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     fech CID, opin foh rivyu onli
help-doc-eval =   .my.doc.<name>:eval           eksekut seyvd kontent lin by lin
help-doc-publish =   .my.doc.<name>:publish @pub   stoh as ro blob (eni tayp)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  stoh YAML as strakchad DAG-CBOR IPLD nod
help-doc-fetch =   .my.doc.<name>:fetch <cid>    impot CID kontent (noh eksekushon)
help-doc-cid =   .my.doc.<name>:cid            shoh stohd CID
help-doc-del =   .my.doc.<name>:              dilet dokument

msg-send-failed = sen no go: { $e }
msg-not-logged-in = yu nɔ lɔg in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse ɛrɔ: { $e }
yaml-not-mapping = YAML mas bi mapping (ki: valyu pɛr); plen tɛks ɛn skɛlɛ no kɛn stor as DAG-CBOR
dagcbor-encode-error = DAG-CBOR enkod ɛrɔ: { $e }
cbor-decode-error = CBOR dɛkod ɛrɔ: { $e }
cbor-json-error = CBOR tu JSON ɛrɔ: { $e }
yaml-serialize-error = YAML sɛrialajz ɛrɔ: { $e }
edit-reply-invalid = invalid ɛdit rɛpli
doc-publish-ipld-error = IPLD pɔblish fɛl: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbɔks prune persist ɛrɔ: { $e }
err-config-load = config lod ɛrɔ: { $e }
err-lang-persist = lang persist ɛrɔ: { $e }
err-history-parse = history parse ɛrɔ: { $e }
err-history-load = history lod ɛrɔ: { $e }
err-ipfs-reply-decode = IPFS reply dɛkod fɛl: { $e }
err-edit-cbor = ɛdit CBOR ɛrɔ: { $e }
err-popup-blocked = popup bɔlɔk bai browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ɛrɔ
rpc-error-detail = ɛrɔ: { $detail }
msg-new-message = ← [{ $from }] nyù mɛsej — { $count } de insay inbox
msg-chat = { $sender } se { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } se { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kam insay.
room-leave = * { $name } go awt.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } pick op { $thing }.
err-edit-decode-failed = edit: dipkod fɛl: { $e }
err-edit-fetch-failed = edit: fɛtʃ fɛl: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no aktiv sesin — no fit delet profail
profile-delete-error = profail delet no wok: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma!discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
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
profiles-empty = (noting)
profiles-deleted = profail { $name } delet
profiles-not-found = profail no dey: { $name }

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

help-topic-url =   .help.url                    opin zion tru URL link
help-header-url = ── URL paramita dem ─────────────────────────────────────────────────────────────
help-url-intro =   Shia wan link we go opin zion wit di pɔsin aredɛ put insɛd:
help-url-msg =   ?msg=<did>                   put bifo: @<did> (simpul mɛsɛj)
help-url-say =   ?say=<did>                   put bifo: @<did>:say (vɛb say)
help-url-emote =   ?emote=<did>                 put bifo: @<did>:emote (vɛb emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Di input put bifo bɛt na sɛn yet — prɛs Enter fɔ sɛn.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                pɔblish yu ɔpsɛt ɔn di nɛtwɔk
help-header-publish = ── pɔblish ɔpsɛt ────────────────────────────────────────────────────────────
help-publish-intro = Pɔblishine mek yu ɔpsɛt fɔ fain ɔn di nɛtwɔk. Ɔda pipul kɛn luk yu DID fɔ rich yu.
help-publish-ma = Fɔ pɔblish, yu nid ma (lɔkɔl rɔntaim) sɛt ɛp. I kɔnɛkt ego wit IPFS/IPNS fɔ yu.
help-publish-steps = Stɛps: ron '.ma!discover' fɔ faind lɔkɔl ma, den '.my.identity:publish @ma'.
help-publish-without = Widaut pɔblishine, ɔda pipul kɛnnɔ rich yu — even if dɛn nɔ yu DID, dɛn kɛnnɔ sɔlv yu endpoint.
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
scheme-cid-fetch-error = No bin ebl fo get CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat no bin valid CID: { $value }
