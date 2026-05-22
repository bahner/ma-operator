# zion — Iyaric
lang-name = Iyaric

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = enter Zion
tab-new-identity = new identity
tab-import = bring in
label-passphrase = pass phrase
label-username = I-name
label-confirm-passphrase = confirm pass phrase
btn-login = enter
btn-export = carry out
btn-generate = manifest
passphrase-warning = Lose pass phrase = lose identity. There is no recovery in Babylon.
import-help = Select an exported .zion.json file. Di bundle stay irie and encrypted.
status-unlocking = opening...
status-generating = manifesting identity...
status-reading-file = reading file...
status-imported = brought in '{ $name }' — switch to Enter tab
error-wrong-passphrase = wrong pass phrase: { $e }
error-identity-not-found = I-dentity '{ $name }' nuh find
error-username-required = I-name required
error-passphrase-required = pass phrase required
error-passphrases-no-match = pass phrases nuh match

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — entered as { $username }
msg-type-help = Type .help fi a list of livity commands.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint irie
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ blocked by Zion [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = removed { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch: nuh connected
msg-link-fetch-error = link fetch: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias I-name cyan be empty
err-alias-has-fragment = alias I-name cyan contain '#'
err-alias-value-fragment = alias value must be bare did:ma:<ipns> (no fragment)
err-alias-value-path = alias value must be bare did:ma:<ipns> (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Keep
btn-eval = Livity
btn-cancel = Cancel
btn-close = Close
btn-reply = Answer
btn-publish = Manifest
msg-reply-sent = answer forward
msg-reply-failed = answer fall: { $e }
msg-entity-publish-sent = entity { $name }: manifest forward
msg-entity-publish-failed = entity manifest fall: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: manifest forward
msg-field-publish-failed = field manifest fall: { $e }
msg-acl-publish-sent = runtime ACL: manifest forward
msg-acl-publish-failed = runtime ACL manifest fall: { $e }
msg-yaml-error = YAML trouble: { $e }
msg-editor-saved = { $path }:kept
msg-fetch-review = brought { $cid } — overstand it before livity
msg-fetch-failed = bringing { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox empty
inbox-entry-not-found = inbox entry { $n } nuh find
inbox-no-message-id = inbox entry { $n } nuh have message_id
inbox-no-verb = no verb `{ $verb }` fi inbox entry { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = seeking fall at { $url }: { $e }
discover-json-error = seeking fall: no irie JSON from { $url }: { $e }
discover-missing-did = seeking fall: status.json missing required field `did`
discover-invalid-did = seeking fall: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = seeking notice: `endpoint_id` missing in status.json; kept DID only
discover-success = ma found at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 manifest — forward with: .my.identity:publish @間
claim-success = Runtime claim for { $did } in Iration
claim-conflict = Runtime already claim by another I-dentity
claim-http-failed = claim fall: HTTP { $status }
claim-error = claim fall: { $e }
claim-no-session = nuh entered; enter first fi claim di runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully irie and open)
acl-persist-error = keeping trouble: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = livity: .my.identity:publish <did-or-alias>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content empty
doc-save-first = { $path }.content empty — keep it first
doc-missing-name = document I-name missing
doc-publish-usage = livity: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = livity: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = manifest { $path }: { $e }
doc-publish-ipld-failed = manifest-ipld { $path }: { $e }
doc-store-sent = store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-ipld-store-sent = IPLD store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-fetch-done = brought { $cid } → { $path }.content (not livity)
doc-fetch-failed = bringing { $cid }: { $e }
doc-fetch-usage = livity: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid not set
doc-no-verb = no verb `{ $verb }` for { $path }
path-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Irie languages in Zion (set with .my.i18n: <code>):
