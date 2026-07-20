# zion — Naijá
lang-name = Naijá

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login fɔ login
tab-new-identity = we gɛt di taytul
nyu aydentiti
tab-import-profile = bring profil komot
label-passphrase = we gɛt di taytul
pasfrɛz
label-username = we gɛt di taytul
yuz nem
label-confirm-passphrase = we gɛt di taytul
kɔnfɔm pasfrɛz
label-did = DID
label-profile-cid = profil CID
label-or-file = we gɛt di taytul
ɔ fayl
btn-login = login fɔ login
btn-export = we gɛt di taytul
ɛkspɔt
btn-generate = we gɛt di taytul
jenarayz
btn-new-endpoint = we gɛt di taytul
nyu ɛndpɔynt
btn-import-profile = bring profil komot
passphrase-warning = Lose passphrase = lose identity. E no get recovery.
import-profile-help = Bring profil komot by CID or file. Yu go need di same pasfrez wey yu yus wen yu publish.
import-profile-detected-user = Di profil na for: { $name }
status-unlocking = e dey unlock...
status-generating = e dey generate identity...
status-reading-file = e dey read file...
status-fetching-profile = dey bring profil komot for IPFS...
status-imported = imported '{ $name }' — switch go Login tab
status-importing-profile = dey bring profil komot...
profile-import-done = profil don come for '{ $name }' — { $n } key load
error-wrong-passphrase = we gɛt di taytul
rɔng pasfrɛz: 18
error-identity-not-found = identity '{ $name }' nor dey
error-username-required = we gɛt di taytul
yuz nem we dem nid
error-passphrase-required = we gɛt di taytul
pasfrɛz we dem nid
error-passphrases-no-match = passphrase dem nor match
error-profile-source-required = give CID or upload file
error-did-required = put your DID
error-profile-fetch = e no fit get profil: { $e }
error-profile-no-username = di profil no get username
error-profile-no-identity = identity '{ $name }' no dey — first bring identity komot

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = we gɛt di taytul
zion v6 — yu don log in as 34
msg-type-help = Type .help fi see list of commands.
msg-connecting = e dey connect to iroh...
msg-iroh-ready = we gɛt di taytul
iroh ɛndpɔynt rɛdi
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID don publish through local ma ({ $url })
msg-ma-connecting-matrix = e dey try connect you to di 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 don claim
msg-local-ma-already-claimed = local 間 don already claim
msg-local-ma-claim-failed = e no fit claim local 間
msg-identity-not-published = Identity no dey online — if ma don install for your side, run '.ma [port]' den '.my.identity!publish @ma'. Type '.help/publish' for details.
msg-blocked = we gɛt di taytul
⊗ we dem blok [11]: 22
msg-focus-cleared = we gɛt di taytul
fos klia
msg-focusing = we gɛt di taytul
fokus 9 as 21
msg-set = { $path }: { $value }
msg-deleted = we gɛt di taytul
dilit 8 (19 ɛntri dem)
msg-read-only = { $path } na read-only
msg-subtree-set = { $path } na subtree; refusing fi set
msg-ancestor-leaf = one ancestor of { $path } na leaf; refusing fi shadow
msg-key-not-found = key nor find: { $path }
msg-no-match = we gɛt di taytul
no mach nɔ de
msg-link-not-connected = link fetch error: e nor connected
msg-link-fetch-error = we gɛt di taytul
link fetch mistek: 18
msg-link-key-not-found = key `{ $key }` nor find inside linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name nor fit be empty
err-alias-has-dot = alias name nor fit get '.'
err-alias-has-fragment = alias name nor fit get '#'
err-alias-value-fragment = alias value fit get only one DID-URL fragment we no empty
err-alias-value-path = alias value must be did:ma:<ipns> DID or DID-URL (no path)
err-alias-not-did = we gɛt di taytul
alias valyu fɔ stat wit did:32:
err-unknown-alias = we gɛt di taytul
alias we wi nɔ no: @QXQ0XQX
err-bare-did = we gɛt di taytul
ɛkspɛkt bare 14 (nɔ fragmɛnt ɔ pat), gɛt 55

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = we gɛt di taytul
Sev am
btn-eval = Eval
btn-cancel = we gɛt di taytul
Kansel
btn-close = we gɛt di taytul
Klos
btn-reply = we gɛt di taytul
Riply
btn-publish = we gɛt di taytul
Pɔblish
btn-publish-ipld = we gɛt di taytul
Publish 8 we dem kɔl
msg-reply-sent = reply don send
msg-reply-failed = reply fail: { $e }
msg-entity-publish-sent = entity { $name }: publish don send
msg-entity-publish-failed = entity publish fail: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish don send
msg-field-publish-failed = field publish fail: { $e }
msg-acl-publish-sent = runtime ACL: publish don send
msg-crud-edit-publish-sent = { $path }: publish don send
msg-acl-publish-failed = runtime ACL publish fail: { $e }
msg-yaml-error = we gɛt di taytul
YAML mistek: 12
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review am before eval
msg-fetch-failed = we gɛt di taytul
fetch 6: 16 we yu go yuz

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nor find
inbox-no-message-id = inbox entry { $n } nor get message_id
inbox-no-verb = we gɛt di taytul
no verb 8 fɔ inbɔks ɛntrɛ 36
inbox-filter-no-arg = filter nid DID abi alias argument
inbox-filter-empty = no message dey from { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover fail for { $url }: { $e }
discover-json-error = discover fail: invalid JSON from { $url }: { $e }
discover-missing-did = discover fail: status.json dey miss required field `did`
discover-invalid-did = discover fail: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` nor dey status.json; stored DID only
discover-hint-endpoint-not-found = Hint: endpoint no dey. Check say `ma` dey show /status.json for port 5003.
discover-hint-server-error = Hint: runtime return server error. Check `ma` logs and try again.
discover-hint-network = we gɛt di taytul
Hint: nɛtwɔk/kɔnektiviti prɔblɛm. Start 40, verify localhost:5003 na richable, ɛn alaw lokal 101 akses na di brawza.
discover-hint-generic = we gɛt di taytul
Hint: verify 13 ɛn 25 Dɛsktɔp de rɔn, don tray bak 59.
discover-success = ma discovered for { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma don create — run '.my.identity!publish @ma' make you publish your identity.
claim-success = we gɛt di taytul
Runtime klem fɔ 20
claim-conflict = we gɛt di taytul
Runtime don ɔlrɛdi klem bay ɔda aydentiti
claim-already-owned = Runtime don already claim by dis identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor logged in; log in first fi claim di runtime
runtime-no-verb = we gɛt di taytul
no verb 8 fɔ 24

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = we gɛt di taytul
.my.acl riset (ful opin) .
acl-persist-error = we gɛt di taytul
persist mistek: 15
acl-no-verb = we gɛt di taytul
no verb 8 fɔ .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = we gɛt di taytul
yuz: .my.identity!publish <did-ɔ-alias>
identity-exported = Bundle don download as { $filename }
identity-export-failed = Export fail: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content dey empty
doc-save-first = { $path }.content dey empty — save am first
doc-missing-name = document name dey missing
doc-publish-usage = we gɛt di taytul
yus: .my.doc.<name>!publish <pɔblisha>
doc-publish-ipld-usage = we gɛt di taytul
yus: .my.doc.<name>!publish-ipld <pɔblisha>
doc-publish-failed = we gɛt di taytul
pablish 8: 19
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = we gɛt di taytul
log in bak so ego kin akses yu aydentiti ki
doc-publish-hint-target = we gɛt di taytul
yuz wan valid pɔblisha DID ɔ alias we de rizɔlt to bare 57
doc-publish-hint-network = we gɛt di taytul
verify 7 runtime ɛn 22 na richable, don tray bak
doc-publish-hint-resolve = we gɛt di taytul
verify se di pɔblisha DID dɔkyumɛnt don pablish ɛn i gɛt ɛndpɔynt we pɔsin kin rich
doc-publish-hint-acl = aks di pɔblisha ɔpreshɔn fɔ alaw yu DID insay 48
doc-publish-hint-runtime = we gɛt di taytul
runtime/plugin nɔ gri fɔ tek di rikwest; inspek di rizin ɛn tray bak afta yu don fiks ɛntiti/rɔntaym
doc-publish-hint-ipfs = we gɛt di taytul
chɛk lokal 12/17 wɛlbɔdi ɛn pɔblisha rɔntaym stetɔs
doc-publish-hint-unknown = we gɛt di taytul
inspek runtime logs fɔ ditayl kɔz ɛn tray bak
doc-store-sent = store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-ipld-store-sent = IPLD store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path }.content (no execute)
doc-fetch-failed = we gɛt di taytul
fetch 6: 16 we yu go yuz
doc-fetch-usage = we gɛt di taytul
yus: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = we gɛt di taytul
no verb 8 fɔ 24
path-no-verb = we gɛt di taytul
no verb 8 fɔ 24

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Languages wey dey (set am with .my.i18n: <code>):

err-lang-not-found = language nor dey: { $lang }

help-header-zion = ── zion komand dem ────────────────────────────────────────────────────────
help-header-messaging = ── mesej dem ──────────────────────────────────────────────────────────────
help-header-config = ── lokal konfig gramma ────────────────────────────────────────────────────
help-header-common = ── komon path dem ─────────────────────────────────────────────────────────
help-header-inbox = ── inbox ──────────────────────────────────────────────────────────────────
help-header-documents = ── dokument dem (.my.doc.*) ───────────────────────────────────────────────
help-header-i18n = we gɛt di taytul
── langwej ────────────────────────────── ───────────────────────────────
help-header-ma = we gɛt di taytul
── 3-spɛs ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = we gɛt di taytul
── we de go insay 間-spɛs ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis text
help-cmd-clear =   .clear                       klia terminal
help-cmd-panic =   .panic                       las resort — yus am if yu waka enter wahala
help-cmd-history =   .history                     history of command (repeat wey follow each oda don join)
help-cmd-logout =   .logout                      log owt
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch:sync / .batch         run scratch document line by line
help-msg-echo = @alias                       we gɛt di taytul
sho se dem don sɔlv DID/18 (nɔbɔdi nɔ sɛn mɛsej)
help-msg-send =   @alias!msg body / @alias:verb args           send mesej / RPC go aktor
help-msg-fragment =   @alias#fragment:verb body  send go alias wey get eksplisit DID fragment
help-msg-escape =   \@name                       literal @name (noh alias lookup)
help-config-get =   .path                        get leaf valu or list sabtri
help-config-filter =   .path value                  match kweri (filta by valu)
help-config-set = .path: value                 we gɛt di taytul
sɛt lif
help-config-delete =   .path:                       dilit leaf or sabtri
help-config-verb =   .path!verb [args]            invok lokal verb
help-my =   .my                          shoh all personal konfig
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did-url>    add/update alias (DID or DID-URL)
help-aliases-del =   .my.aliases.<name>:          rimov alias
help-runtime-discover =   .ma [port]          diskova lokal runtime and kreate @ma alias
help-runtime-claim =   .ma [port]             klaim ownashop of runtime wit yu DID
help-identity =   .my.identity                 shoh identity konfig
help-identity-did =   .my.identity.did             shoh yu own DID (read-only)
help-identity-publish =   .my.identity!publish @pub    publish yu own DID via publisher savis
help-identity-export =   .my.identity!export          download your own identity bundle
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N field dem
help-inbox-from =   .my.inbox.N.from             senda DID of entri N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (open edita if noh bodi)
help-inbox-open =   .my.inbox.N!open             open entri content read-only insyd edita
help-inbox-del =   .my.inbox.N:                 dilit entri N
help-inbox-delall =   .my.inbox:                   dilit all inbox entri dem
help-inbox-flush =   .my.inbox!flush              print all entri dem go terminal
help-inbox-filter =   .my.inbox!filter @who        show only entri from @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse senda DID dokument layzily
help-doc-edit =   .my.doc.<name>!edit           open edita wit saved content
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetsh CID, open for review only
help-doc-eval = .my.doc.<name>!eval           we gɛt di taytul
eksekutiv sev kɔntinyu layn-bay-layn
help-doc-publish = .my.doc.<name>!publish @pub   we gɛt di taytul
stoa as raw blob (ɛni kayn) .
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  store YAML as struktured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    import CID content (noh execution)
help-doc-cid =   .my.doc.<name>!cid            shoh stored CID
help-doc-del =   .my.doc.<name>:              dilit dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = we gɛt di taytul
.my.i18n de kip di langwej prɛfɛshɔn we tay to yu aydentiti.
help-i18n-set = .my.i18n: <code>             we gɛt di taytul
pik di langwej we 20 de yuz fɔ dis aydentiti
help-i18n-list = .my.i18n!list               we gɛt di taytul
list di langwej kɔd dem we de

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room na di space between 間 identities. ma dey make dose identities fit find each oda and communicate; once dem publish your identity, you fit join.
help-ma-command = .ma [port]                   we gɛt di taytul
kɔnɛkt to yu lokal 22 rɔntaym, rid /status.json, ɛn sev .QXQ1XQX.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish your DID document make odas fit resolve your keys and endpoint
help-ma-security = Di clearest trust boundary na your own ma runtime with your own IPFS Desktop/Kubo. Remote publisher fit help, but den you dey depend on anoda person service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how to enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When your identity don known, .enter @ma go let you step into 間. Find world, enter am, and join from there.
help-ma-entry-steps = Start IPFS Desktop and ma, then run .ma. Publish with .my.identity!publish @ma, find world, and enter with .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-toggle =   .enter                       turn room focus on or off; your identity dey active
help-ma-entry-url =   ?enter=<runtime>             enter after login from shared URL

msg-send-failed = send no work: { $e }
msg-not-logged-in = you no log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse wahala: { $e }
yaml-not-mapping = YAML must be mapping (key: value pair); plain text and scalar no fit store as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode wahala: { $e }
cbor-decode-error = CBOR decode wahala: { $e }
cbor-json-error = CBOR go JSON wahala: { $e }
yaml-serialize-error = YAML serialize wahala: { $e }
edit-reply-invalid = we gɛt di taytul
invalid ɛdit riply
doc-publish-ipld-error = IPLD publish no work: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox clean up save wahala: { $e }
err-config-load = config load wahala: { $e }
err-lang-persist = language save wahala: { $e }
err-history-parse = history parse wahala: { $e }
err-history-load = history load wahala: { $e }
err-ipfs-reply-decode = IPFS reply decode no work: { $e }
err-edit-cbor = edit CBOR wahala: { $e }
err-popup-blocked = browser block popup
status-publishing = dey publish

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ɛrɔ
rpc-error-detail = ɛrɔ: { $detail }
msg-new-message = ← [{ $from }] new mesej — { $count } dey inbox
msg-chat = { $sender } tok { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } tok say { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } enter di room.
room-leave = * { $name } comot di room.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } carry { $thing }.
err-edit-decode-failed = edit: decode fail: { $e }
err-edit-fetch-failed = edit: fetch fail: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no active session — e no fit delete profile
profile-delete-error = profile delete no work: { $e }
profile-wrong-user = we gɛt di taytul
nɔ kin sɛt 11 fɔ ɔda prɔfayl — na yu yon nɔmɔ
profile-wrong-user-name = we gɛt di taytul
nɔ kin sɛt 11 fɔ 19 — na yu yon prɔfayl nɔmɔ
profile-no-ma = we gɛt di taytul
no 3 rɔntaym kɔnfigyut — rɔn 31 fɔs
profile-no-cid = we gɛt di taytul
no 3 we dem don kip fɔ dis profil — rɔn 37 fɔs
profile-no-cid-in-doc = we gɛt di taytul
no profil 11 we dem fɛn na DID dɔkyumɛnt — rɔn 43 fɔs
profile-publish-sent = profile don encrypt and send go IPFS; DID document go update when CID land
profile-publish-done = profile don publish — DID document don update with ma.agent CID
profile-publish-failed = we gɛt di taytul
profil pablish nɔ wok: 24
profile-fetch-done = we gɛt di taytul
profil fetched — 18 ki dem we dem lod frɔm 43
profile-fetch-failed = profil fetch nɔ wok: 22
msg-identity-exists = we gɛt di taytul
aydentiti we dem don ɔlrɛdi pablish — prɔfayl we de ɔp to det
profile-import-exists = we gɛt di taytul
profil 8 don ɔlrɛdi de — dilit am fɔs
profile-import-wrong-user = we gɛt di taytul
fayl gɛt profil 22, we dem de ɛkspɛkt 42

# -- CID content operations
cid-op-binary = we gɛt di taytul
baynary kɔntinyu (nɔ de sho) .
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = we gɛt di taytul
fail fɔ fetch kɔntinyu: 25
cid-op-unknown = we gɛt di taytul
di kɔntinyu ɔpreshɔn we dem nɔ no: 27
cid-op-wc = we gɛt di taytul
{ $lines } layn dem 18 wɔd dem 36 chars
profiles-empty = (noting)
profiles-deleted = profile { $name } don delete
profiles-not-found = profile no dey: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    message matter
help-topic-ma = .help/ma                     we gɛt di taytul
ma-spɛs, pɔblishing, ɛn ɛntrɛ
help-topic-path = .help/path                   we gɛt di taytul
lokal dot-pat grama
help-topic-my =   .help/my                     personal setup
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    document dem
help-topic-actor =   .help/actor                  far actor
help-unknown-topic =   .help/{ $topic }: topic wey no sabi

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         we gɛt di taytul
sɛn dairekt/chat/imot mɛsej
help-actor-ping = @actor:ping                  we gɛt di taytul
layf we pɔsin kin gɛt ping
help-actor-entities =   @actor/entities              show entity dem
help-actor-entities-get = @actor/entities/<n>          we gɛt di taytul
get entiti node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   we gɛt di taytul
set entiti bay 14 rɛfrɛns
help-actor-entities-edit =   @actor/entities/<n>!edit     change entity
help-actor-entities-del = @actor/entities/<n>:         we gɛt di taytul
dilit ɛntiti
help-actor-config-get =   @actor/config/<key>          take config value
help-actor-config-set =   @actor/config/<key>: val     put config value
help-actor-acl = @actor/acl                   we gɛt di taytul
gɛt 4
help-actor-acl-edit =   @actor/acl!edit              change ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = we gɛt di taytul
── 3 aktɔ kɔl ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  we gɛt di taytul
kɔl wan ɛntiti 15 frɔm 24 ɛn wet fɔ in ansa
help-actor-head = (@actor/path)                we gɛt di taytul
fetch rimot CRUD kɔntinyu frɔm 31
help-actor-tail = (<bafy...>)                  we gɛt di taytul
inklud ɛn evalyu 21 frɔm wan 36 41
help-actor-wc = (define x (@actor:verb arg))  we gɛt di taytul
kip 5 riply dem na di sɛshɔn ɛnvayrɔmɛnt
help-actor-wc-l = .my.scheme.ma!edit           we gɛt di taytul
edit sev 11 ɛlda fɔ dis aydentiti

help-topic-url =   .help/url                    open zion through URL link
help-topic-i18n = .help/i18n                   we gɛt di taytul
langwej we yu lɛk fɔ yu aydentiti
help-header-url = ── URL parameters dem ───────────────────────────────────────────────────────────
help-url-intro =   Share link wey go open zion with di person wey don put inside:
help-url-msg =   ?msg=<did>                   put before: @<did>!msg (normal message)
help-url-say =   ?say=<did>                   put before: @<did>!say (verb say)
help-url-emote =   ?emote=<did>                 put before: @<did>!emote (verb emote)
help-url-ma = ?ma=<did-or-url>              we gɛt di taytul
prɛ-fil rɔntaym DID / 23 URL
help-url-enter = ?enter=<runtime>             enta runtime wold afta yu don login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input don fill but dem no send am — press Enter make e send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish your identity for the network
help-header-publish = ── publish identity ─────────────────────────────────────────────────────────
help-publish-intro = Publishing go make your identity findable for the network. Other people fit search your DID to reach you.
help-publish-ma = To publish, you need ma (local runtime) installed. E go connect ego to IPFS/IPNS for your side.
help-publish-steps = Steps: run '.ma [port]' to find your local ma, den '.my.identity!publish @ma'.
help-publish-without = Without publishing, other people no fit reach you — even if dem sabi your DID, dem no fit resolve your endpoint.
profile-fetch-did-resolve-failed = we gɛt di taytul
DID nɔ pablish yet — rɔn 28 fɔs, don 67 yu prɔfayl
profile-update-done = we gɛt di taytul
profil ɔpdet — 18 ki dem we dem jɔyn frɔm 43
profile-delete-needs-name = put profile name: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = we gɛt di taytul
Kɔlɛkshɔn batch — tayp kɔmand dem, don wit .batch
batch-already-collecting = we gɛt di taytul
Ɔlrɛdi de gɛda wan batch — don wit .batch fɔs
batch-empty = we gɛt di taytul
Batch bin ɛmti — natin fɔ rɔn
batch-running = Batch dey run…
batch-step-timeout = we gɛt di taytul
batch step we don taym aut

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
err-unknown-command = no sabi command: { $path }
err-read-only-path = { $path } na read-only
help-cmd-batch-async =   .batch:async / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No fit fetch CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dis CID no valid: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Warning: Yur IPNS private key go send go dis runtime to publish yur identity. Only use runtime wey you trust kpata kpata.
