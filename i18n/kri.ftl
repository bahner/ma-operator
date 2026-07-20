# zion — Krio
lang-name = Krio

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login fɔ login
tab-new-identity = we gɛt di taytul
nyu aydentiti
tab-import-profile = bring profayl kɔmɔt
label-passphrase = passfraze
label-username = yuza nem
label-confirm-passphrase = konfam passfraze
label-did = DID
label-profile-cid = profayl CID
label-or-file = ɔ fayl
btn-login = login fɔ login
btn-export = eksport
btn-generate = jenaret
btn-new-endpoint = nyu endpoint
btn-import-profile = bring profayl kɔmɔt
passphrase-warning = Lus passfraze = lus identity. Nor get no wei fi get am bak.
import-profile-help = Bring profayl kɔmɔt bay CID ɔ fayl. Yu nid di sem pasfrez we yu yuz wen yu pɔblish.
import-profile-detected-user = Di profayl bɛlɔŋ tu: { $name }
status-unlocking = de unlok...
status-generating = de jenaret identity...
status-reading-file = de rid fail...
status-fetching-profile = dɛn bring profayl kɔmɔt na IPFS...
status-imported = import '{ $name }' — switch go Login tab
status-importing-profile = dɛn bring profayl kɔmɔt...
profile-import-done = profayl bring kɔmɔt fɔ '{ $name }' — { $n } ki lod
error-wrong-passphrase = rong passfraze: { $e }
error-identity-not-found = identity '{ $name }' nor fine
error-username-required = yuza nem nid
error-passphrase-required = passfraze nid
error-passphrases-no-match = passfraze dem nor match
error-profile-source-required = giv CID ɔ ɔplod fayl
error-did-required = put DID yu
error-profile-fetch = nɔ pɔsɔbul fɔ gɛt profayl: { $e }
error-profile-no-username = di profayl nɔ gɛt yuzɔnem
error-profile-no-identity = aydɛntɪti '{ $name }' nɔ fɔnd — bring aydɛntɪti kɔmɔt fɔs

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — login as { $username }
msg-type-help = Taip .help fi get list ɔf komand dem.
msg-connecting = de konect go iroh...
msg-iroh-ready = iroh endpoint redi
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID don pablish tru local ma ({ $url })
msg-ma-connecting-matrix = de tray fo konekt yu go di 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 dɔn claim
msg-local-ma-already-claimed = local 間 dɔn claim bifo
msg-local-ma-claim-failed = nɔ bin able claim local 間
msg-identity-not-published = Ɔpsɛt nɔ fɔ gɛt ɔnlain — ɛf ma dɔn sɛt ɛp fo yɔ, ron '.ma [port]' den '.my.identity!publish @ma'. Rait '.help/publish' fo mɔ infɔmeshɔn.
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
err-alias-value-fragment = alias value kin get at mos wan DID-URL fragment we noh empty
err-alias-value-path = alias value mas bi did:ma:<ipns> DID ɔ DID-URL (noh path)
err-alias-not-did = alias value mas stat wit did:ma:
err-unknown-alias = unkown alias: @{ $name }
err-bare-did = ekspekt bɛ did:ma:<ipns> (nor get fragment ɔ path), get { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Sev
btn-eval = we gɛt di taytul
Eval
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
msg-fetch-failed = we gɛt di taytul
fetch 6: 16 we yu go yuz

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
discover-hint-endpoint-not-found = Hint: endpoint no de. Check say `ma` dey show /status.json pan port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check `ma` log dem en try bak.
discover-hint-network = we gɛt di taytul
Hint: nɛtwɔk/kɔnektiviti prɔblɛm. Start 40, verify localhost:5003 na richable, ɛn alaw lokal 101 akses na di brawza.
discover-hint-generic = we gɛt di taytul
Hint: verify 13 ɛn 25 Dɛsktɔp de rɔn, dɔn tray bak 59.
discover-success = ma diskɔva at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias mek — ron '.my.identity!publish @ma' fo pɔblish yu ɔpsɛt.
claim-success = Runtime claim fɔ { $did }
claim-conflict = Runtime already claim by anɔdɔ identity
claim-already-owned = Runtime dɔn claim by dis identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor login; login fɛs fi claim di runtime
runtime-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = we gɛt di taytul
.my.acl riset (ful opin) .
acl-persist-error = pɛsist ɛrɔ: { $e }
acl-no-verb = nor get vɛb `{ $verb }` fɔ .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = yusij: .my.identity!publish <did-ɔ-alias>
identity-exported = Bɔndɔl dɔnlod as { $filename }
identity-export-failed = Ekspɔt fɛl: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content empty
doc-save-first = { $path }.content empty — sev fɛs
doc-missing-name = dokument nem nor dɛ
doc-publish-usage = yusij: .my.doc.<nem>!publish <pɔblisha>
doc-publish-ipld-usage = yusij: .my.doc.<nem>!publish-ipld <pɔblisha>
doc-publish-failed = pɔblish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = pɔblish fail [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = we gɛt di taytul
log in bak so ego kin akses yu aydentiti ki
doc-publish-hint-target = we gɛt di taytul
yuz wan valid pɔblisha DID ɔ alias we de rizɔlt to bare 57
doc-publish-hint-network = we gɛt di taytul
verify 7 runtime ɛn 22 na richable, dɔn tray bak
doc-publish-hint-resolve = we gɛt di taytul
verify se di pɔblisha DID dɔkyumɛnt dɔn pablish ɛn i gɛt ɛndpɔynt we pɔsin kin rich
doc-publish-hint-acl = we gɛt di taytul
aks di pɔblisha ɔpreshɔn fɔ alaw yu DID insay 48
doc-publish-hint-runtime = we gɛt di taytul
runtime/plugin nɔ gri fɔ tek di rikwest; inspek di rizin ɛn tray bak afta yu dɔn fiks ɛntiti/rɔntaym
doc-publish-hint-ipfs = we gɛt di taytul
chɛk lokal 12/17 wɛlbɔdi ɛn pɔblisha rɔntaym stetɔs
doc-publish-hint-unknown = we gɛt di taytul
inspek runtime logs fɔ ditayl kɔz ɛn tray bak
doc-store-sent = stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-ipld-store-sent = IPLD stɔ rikwest don sen ({ $id }) → { $publisher }; CID go kam via RPC rɛpli
doc-fetch-done = fetch { $cid } → { $path }.content (nor execute)
doc-fetch-failed = we gɛt di taytul
fetch 6: 16 we yu go yuz
doc-fetch-usage = yusij: .my.doc.<nem>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = nor get vɛb `{ $verb }` fɔ { $path }
path-no-verb = nor get vɛb `{ $verb }` fɔ { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lenggwij dem wey dey (set wit .my.i18n: <code>):

err-lang-not-found = langwej nor fine: { $lang }

help-header-zion = ── zion komand dem ────────────────────────────────────────────────────────
help-header-messaging = ── mesej dem ──────────────────────────────────────────────────────────────
help-header-config = ── lokal konfig gramma ────────────────────────────────────────────────────
help-header-common = ── komon paf dem ──────────────────────────────────────────────────────────
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
help-cmd-panic =   .panic                       las opshen — yus if yu los yoself
help-cmd-history =   .history                     komand istri (kopi dem wey dɔn folo sɛf bia wanwan)
help-cmd-logout =   .logout                      log owt
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch:sync / .batch         run scratch document line by line
help-msg-echo =   @alias                       sho resolved DID/DID-URL (noh send message)
help-msg-send =   @alias!msg body / @alias:verb args           send mesej / RPC go to ator
help-msg-fragment =   @alias#fragment:verb body  send go to alias wid eksplisit DID fragment
help-msg-escape =   \@name                       literal @name (noh alias lukov)
help-config-get =   .path                        get lif valu or list sabtri
help-config-filter =   .path value                  match kweri (filta bay valu)
help-config-set =   .path: value                 set lif
help-config-delete =   .path:                       dilet lif or sabtri
help-config-verb =   .path!verb [args]            invok lokal vob
help-my =   .my                          shoh all pesonal konifig
help-aliases =   .my.aliases                  list alias dem
help-aliases-set =   .my.aliases.<name>: <did-url> mek/update alias (DID ɔ DID-URL)
help-aliases-del =   .my.aliases.<name>:          rimov alias
help-runtime-discover =   .ma [port]          diskova lokal runtime en kreyet @ma alias
help-runtime-claim =   .ma [port]             klem runtime onashep wid yu DID
help-identity =   .my.identity                 shoh identity konifig
help-identity-did =   .my.identity.did             shoh on DID (rid onli)
help-identity-publish =   .my.identity!publish @pub    pablish on DID bifo pablisha sovic
help-identity-export =   .my.identity!export          dɔnlod yu ɔn idɛntiti bɔndɔl
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N fild dem
help-inbox-from =   .my.inbox.N.from             senda DID foh entri N
help-inbox-reply =   .my.inbox.N!reply [body]     send ripla (opin edita if noh bodi)
help-inbox-open =   .my.inbox.N!open             opin entri kontent rid-onli insay edita
help-inbox-del =   .my.inbox.N:                 dilet entri N
help-inbox-delall =   .my.inbox:                   dilet all inbox entri dem
help-inbox-flush =   .my.inbox!flush              print all entri dem go terminal
help-inbox-filter =   .my.inbox!filter @who        sho ɔnli entri fɔm @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   travos senda DID dokument layzili
help-doc-edit =   .my.doc.<name>!edit           opin edita wid seyvd kontent
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fech CID, opin foh rivyu onli
help-doc-eval =   .my.doc.<name>!eval           eksekut seyvd kontent lin by lin
help-doc-publish =   .my.doc.<name>!publish @pub   stoh as ro blob (eni tayp)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  stoh YAML as strakchad DAG-CBOR IPLD nod
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    impot CID kontent (noh eksekushon)
help-doc-cid =   .my.doc.<name>!cid            shoh stohd CID
help-doc-del =   .my.doc.<name>:              dilet dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = we gɛt di taytul
.my.i18n de kip di langwej prɛfɛshɔn we tay to yu aydentiti.
help-i18n-set = .my.i18n: <code>             we gɛt di taytul
pik di langwej we 20 de yuz fɔ dis aydentiti
help-i18n-list = .my.i18n!list               we gɛt di taytul
list di langwej kɔd dɛn we de

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 rum na di ples bitwin 間 identity dem. ma mek dem identity fɛn wan anɔda an tɔk; afta yu identity dɔn publish, yu kin jɔin.
help-ma-command =   .ma [port]                   kɔnɛkt to yu lokal ma runtime, rid /status.json, ɛn sev .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yu DID dɔkyumɛnt so ɔda pipul kin resolve yu keys ɛn endpoint
help-ma-security = Di klia trust boundary na yu yon ma runtime wit yu yon IPFS Desktop/Kubo. Rimot publisher fit ɛp, bɔt den yu de dipɛn pan ɔda pɔsin savis.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             aw fo ɛnta di 間 rum

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Wɛn pipul sabi yu identity, .enter @ma go mek yu step insay 間. Fɛn wan wɔld, ɛnta am, ɛn jɔin frɔm de.
help-ma-entry-steps = Stat IPFS Desktop ɛn ma, den rɔn .ma. Publish wit .my.identity!publish @ma, fɛn wan wɔld, ɛn ɛnta wit .enter @ma.
help-ma-entry-command =   .enter @ma                  ɛnta 間 tru di @ma runtime
help-ma-entry-toggle =   .enter                       tɔn di rum focus ɔn ɔf ɔf; yu identity stil active
help-ma-entry-url =   ?enter=<runtime>             ɛnta afta login frɔm shared URL

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
profile-wrong-user = we gɛt di taytul
nɔ kin sɛt 11 fɔ ɔda prɔfayl — na yu yon nɔmɔ
profile-wrong-user-name = we gɛt di taytul
nɔ kin sɛt 11 fɔ 19 — na yu yon prɔfayl nɔmɔ
profile-no-ma = we gɛt di taytul
no 3 rɔntaym kɔnfigyut — rɔn 31 fɔs
profile-no-cid = no 3 we dɛn dɔn kip fɔ dis profayl — rɔn 37 fɔs
profile-no-cid-in-doc = we gɛt di taytul
no profayl 11 we dɛn fɛn na DID dɔkyumɛnt — rɔn 43 fɔs
profile-publish-sent = dem lok profayl en send am to IPFS; DID dokyument go update wen CID kam
profile-publish-done = profayl publish — DID dokyument update wit ma.agent CID
profile-publish-failed = we gɛt di taytul
profayl pablish nɔ wok: 24
profile-fetch-done = we gɛt di taytul
profayl fetched — 18 ki dɛn we dɛn lod frɔm 43
profile-fetch-failed = we gɛt di taytul
profayl fetch nɔ wok: 22
msg-identity-exists = we gɛt di taytul
aydentiti we dɛn dɔn ɔlrɛdi pablish — prɔfayl we de ɔp to det
profile-import-exists = we gɛt di taytul
profayl 8 dɔn ɔlrɛdi de — dilit am fɔs
profile-import-wrong-user = we gɛt di taytul
fayl gɛt profayl 22, we dɛn de ɛkspɛkt 42

# -- CID content operations
cid-op-binary = we gɛt di taytul
baynary kɔntinyu (nɔ de sho) .
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = we gɛt di taytul
fail fɔ fetch kɔntinyu: 25
cid-op-unknown = we gɛt di taytul
di kɔntinyu ɔpreshɔn we dɛn nɔ no: 27
cid-op-wc = we gɛt di taytul
{ $lines } layn dɛn 18 wɔd dɛn 36 chars
profiles-empty = (noting)
profiles-deleted = profail { $name } delet
profiles-not-found = profail no dey: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    mesaj dem
help-topic-ma = .help/ma                     we gɛt di taytul
ma-spɛs, pɔblishing, ɛn ɛntrɛ
help-topic-path = .help/path                   we gɛt di taytul
lokal dot-pat grama
help-topic-my =   .help/my                     persnal config
help-topic-inbox =   .help/inbox                  inbox box
help-topic-doc =   .help/doc                    dokyument dem
help-topic-actor =   .help/actor                  far actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: topic no sabi

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         we gɛt di taytul
sɛn dairekt/chat/imot mɛsej
help-actor-ping = @actor:ping                  we gɛt di taytul
layf we pɔsin kin gɛt ping
help-actor-entities =   @actor/entities              sho entity dem
help-actor-entities-get = @actor/entities/<n>          we gɛt di taytul
get entiti node
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   we gɛt di taytul
set entiti bay 14 rɛfrɛns
help-actor-entities-edit =   @actor/entities/<n>!edit     chenj entity
help-actor-entities-del = @actor/entities/<n>:         we gɛt di taytul
dilit ɛntiti
help-actor-config-get =   @actor/config/<key>          tek config valyu
help-actor-config-set =   @actor/config/<key>: val     put config valyu
help-actor-acl = @actor/acl                   we gɛt di taytul
gɛt 4
help-actor-acl-edit =   @actor/acl!edit              chenj ACL
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
help-actor-wc = (define x (@actor:verb arg))  kip 5 riply dɛn na di sɛshɔn ɛnvayrɔmɛnt
help-actor-wc-l = .my.scheme.ma!edit           we gɛt di taytul
edit sev 11 ɛlda fɔ dis aydentiti

help-topic-url =   .help/url                    opin zion tru URL link
help-topic-i18n = .help/i18n                   we gɛt di taytul
langwej we yu lɛk fɔ yu aydentiti
help-header-url = ── URL paramita dem ─────────────────────────────────────────────────────────────
help-url-intro =   Shia wan link we go opin zion wit di pɔsin aredɛ put insɛd:
help-url-msg =   ?msg=<did>                   put bifo: @<did>!msg (simpul mɛsɛj)
help-url-say =   ?say=<did>                   put bifo: @<did>!say (vɛb say)
help-url-emote =   ?emote=<did>                 put bifo: @<did>!emote (vɛb emote)
help-url-ma = ?ma=<did-or-url>              we gɛt di taytul
prɛ-fil rɔntaym DID / 23 URL
help-url-enter = ?enter=<runtime>             we gɛt di taytul
enta runtime wold afta yu don login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input put bifo bɛt na sɛn yet — prɛs Enter fɔ sɛn.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pɔblish yu ɔpsɛt ɔn di nɛtwɔk
help-header-publish = ── pɔblish ɔpsɛt ────────────────────────────────────────────────────────────
help-publish-intro = Pɔblishine mek yu ɔpsɛt fɔ fain ɔn di nɛtwɔk. Ɔda pipul kɛn luk yu DID fɔ rich yu.
help-publish-ma = Fɔ pɔblish, yu nid ma (lɔkɔl rɔntaim) sɛt ɛp. I kɔnɛkt ego wit IPFS/IPNS fɔ yu.
help-publish-steps = Stɛps: ron '.ma [port]' fɔ faind lɔkɔl ma, den '.my.identity!publish @ma'.
help-publish-without = Widaut pɔblishine, ɔda pipul kɛnnɔ rich yu — even if dɛn nɔ yu DID, dɛn kɛnnɔ sɔlv yu endpoint.
profile-fetch-did-resolve-failed = we gɛt di taytul
DID nɔ pablish yet — rɔn 28 fɔs, dɔn 67 yu prɔfayl
profile-update-done = we gɛt di taytul
profayl ɔpdet — 18 ki dɛn we dɛn jɔyn frɔm 43
profile-delete-needs-name = put profayl nem: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = we gɛt di taytul
Kɔlɛkshɔn batch — tayp kɔmand dɛn, dɔn wit .batch
batch-already-collecting = we gɛt di taytul
Ɔlrɛdi de gɛda wan batch — dɔn wit .batch fɔs
batch-empty = we gɛt di taytul
Batch bin ɛmti — natin fɔ rɔn
batch-running = Batch dey run…
batch-step-timeout = we gɛt di taytul
batch step we dɔn taym aut

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
err-unknown-command = no sabi koman: { $path }
err-read-only-path = { $path } na for rid nomo
help-cmd-batch-async =   .batch:async / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No bin ebl fo get CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat no bin valid CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Wanin: Yu IPNS praivet ki go sen go dis runtime fo pablish yu adentiti. Yon-li yuz wan runtime we yu trit im.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
