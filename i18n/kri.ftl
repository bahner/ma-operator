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
msg-reply-sent = rɛpli don sen
msg-reply-failed = rɛpli fail: { $e }
msg-entity-publish-sent = entity { $name }: pɔblish don sen
msg-entity-publish-failed = entity pɔblish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: pɔblish don sen
msg-field-publish-failed = field pɔblish fail: { $e }
msg-acl-publish-sent = runtime ACL: pɔblish don sen
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
discover-alias-hint =   alias @間 kreate — pɔblish wit: .my.identity:publish @間
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
