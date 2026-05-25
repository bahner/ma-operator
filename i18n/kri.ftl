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

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskɔva fail at { $url }: { $e }
discover-json-error = diskɔva fail: invalid JSON from { $url }: { $e }
discover-missing-did = diskɔva fail: status.json nor get `did` field
discover-invalid-did = diskɔva fail: ekspekt `did` fi stat wit did:ma:, get `{ $did }`
discover-no-endpoint = diskɔva waning: `endpoint_id` nor dɛ status.json; sev DID only
discover-success = ma diskɔva at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma kreate — pɔblish wit: .my.identity:publish @ma
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
help-cmd-logout =   .logout                      log owt
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
help-runtime-discover =   .my.ma:discover          diskova lokal runtime en kreyet @ma alias
help-runtime-claim =   .my.ma:claim             klem runtime onashep wid yu DID
help-identity =   .my.identity                 shoh identity konifig
help-identity-did =   .my.identity.did             shoh on DID (rid onli)
help-identity-publish =   .my.identity:publish @pub    pablish on DID bifo pablisha sovic
help-config-path =   .config                      shoh all .config.* entri dem
help-inbox =   .my.inbox                    list inbox (sabtri vyu)
help-inbox-n =   .my.inbox.N                  shoh entri N fild dem
help-inbox-from =   .my.inbox.N.from             senda DID foh entri N
help-inbox-reply =   .my.inbox.N:reply [body]     send ripla (opin edita if noh bodi)
help-inbox-open =   .my.inbox.N:open             opin entri kontent rid-onli insay edita
help-inbox-del =   .my.inbox.N:                 dilet entri N
help-inbox-delall =   .my.inbox:                   dilet all inbox entri dem
help-inbox-flush =   .my.inbox:flush              print all entri dem go terminal
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
err-edit-decode-failed = edit: dipkod fɛl: { $e }
err-edit-fetch-failed = edit: fɛtʃ fɛl: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no aktiv sesin — no fit delet profail
profile-delete-error = profail delet no wok: { $e }
profile-no-verb = .my.profile: yu no sabi dis wod: { $verb }
