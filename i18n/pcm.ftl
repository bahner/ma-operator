# zion — Naijá
lang-name = Naijá

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = new identity
tab-import = import
label-passphrase = passphrase
label-username = username
label-confirm-passphrase = confirm passphrase
btn-login = login
btn-export = export
btn-generate = generate
passphrase-warning = Lose passphrase = lose identity. E no get recovery.
import-help = Select one exported .zion.json file. Di bundle go stay encrypted.
status-unlocking = e dey unlock...
status-generating = e dey generate identity...
status-reading-file = e dey read file...
status-imported = imported '{ $name }' — switch go Login tab
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' nor dey
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrase dem nor match

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help fi see list of commands.
msg-connecting = e dey connect to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } na read-only
msg-subtree-set = { $path } na subtree; refusing fi set
msg-ancestor-leaf = one ancestor of { $path } na leaf; refusing fi shadow
msg-key-not-found = key nor find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch error: e nor connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` nor find inside linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name nor fit be empty
err-alias-has-fragment = alias name nor fit get '#'
err-alias-value-fragment = alias value must be bare did:ma:<ipns> (no fragment)
err-alias-value-path = alias value must be bare did:ma:<ipns> (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Save
btn-eval = Eval
btn-cancel = Cancel
btn-close = Close
btn-reply = Reply
btn-publish = Publish
msg-reply-sent = reply don send
msg-reply-failed = reply fail: { $e }
msg-entity-publish-sent = entity { $name }: publish don send
msg-entity-publish-failed = entity publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish don send
msg-field-publish-failed = field publish fail: { $e }
msg-acl-publish-sent = runtime ACL: publish don send
msg-acl-publish-failed = runtime ACL publish fail: { $e }
msg-yaml-error = YAML error: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review am before eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nor find
inbox-no-message-id = inbox entry { $n } nor get message_id
inbox-no-verb = no verb `{ $verb }` for inbox entry { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover fail for { $url }: { $e }
discover-json-error = discover fail: invalid JSON from { $url }: { $e }
discover-missing-did = discover fail: status.json dey miss required field `did`
discover-invalid-did = discover fail: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` nor dey status.json; stored DID only
discover-success = ma discovered for { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 created — publish with: .my.identity:publish @間
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-http-failed = claim fail: HTTP { $status }
claim-error = claim fail: { $e }
claim-no-session = nor logged in; log in first fi claim di runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = usage: .my.identity:publish <did-or-alias>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content dey empty
doc-save-first = { $path }.content dey empty — save am first
doc-missing-name = document name dey missing
doc-publish-usage = usage: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = usage: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = publish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-ipld-store-sent = IPLD store request send ({ $id }) → { $publisher }; CID go arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path }.content (no execute)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = usage: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nor set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Languages wey dey (set am with .my.i18n: <code>):
