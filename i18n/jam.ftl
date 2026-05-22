# zion — Patwa
lang-name = Patwa

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
passphrase-warning = Lase passphrase = lase identity. Nuh have no recovery.
import-help = Select wan exported .zion.json file. Di bundle stay encrypted.
status-unlocking = unlocking...
status-generating = generating identity...
status-reading-file = reading file...
status-imported = imported '{ $name }' — switch to Login tab
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' nuh find
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrase dem nuh match

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help fi get a list of commands.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch error: nuh connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name cyan be empty
err-alias-has-fragment = alias name cyan contain '#'
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
msg-reply-sent = reply sent
msg-reply-failed = reply failed: { $e }
msg-entity-publish-sent = entity { $name }: publish sent
msg-entity-publish-failed = entity publish failed: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: publish sent
msg-field-publish-failed = field publish failed: { $e }
msg-acl-publish-sent = runtime ACL: publish sent
msg-acl-publish-failed = runtime ACL publish failed: { $e }
msg-yaml-error = YAML error: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = fetched { $cid } — review before eval
msg-fetch-failed = fetch { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nuh find
inbox-no-message-id = inbox entry { $n } nuh have message_id
inbox-no-verb = no verb `{ $verb }` fi inbox entry { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover failed at { $url }: { $e }
discover-json-error = discover failed: invalid JSON from { $url }: { $e }
discover-missing-did = discover failed: status.json missing required field `did`
discover-invalid-did = discover failed: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` missing in status.json; stored DID only
discover-success = ma discovered at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 created — publish with: .my.identity:publish @間
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-http-failed = claim failed: HTTP { $status }
claim-error = claim failed: { $e }
claim-no-session = nuh logged in; log in first fi claim the runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = usage: .my.identity:publish <did-or-alias>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content is empty
doc-save-first = { $path }.content is empty — save first
doc-missing-name = missing document name
doc-publish-usage = usage: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = usage: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = publish { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-ipld-store-sent = IPLD store request sent ({ $id }) → { $publisher }; CID will arrive via RPC reply
doc-fetch-done = fetched { $cid } → { $path }.content (not executed)
doc-fetch-failed = fetch { $cid }: { $e }
doc-fetch-usage = usage: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid is not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Languages available (set with .my.i18n: <code>):
