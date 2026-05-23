# zion — English
lang-name = English

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
passphrase-warning = Lost passphrase = lost identity. There is no recovery.
import-help = Select an exported .zion.json file. The bundle stays encrypted.
status-unlocking = unlocking...
status-generating = generating identity...
status-reading-file = reading file...
status-imported = imported '{ $name }' — switch to Login tab
error-wrong-passphrase = wrong passphrase: { $e }
error-identity-not-found = identity '{ $name }' not found
error-username-required = username required
error-passphrase-required = passphrase required
error-passphrases-no-match = passphrases do not match

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logged in as { $username }
msg-type-help = Type .help for a list of commands.
msg-connecting = connecting to iroh...
msg-iroh-ready = iroh endpoint ready
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ blocked [{ $cap }]: { $from }
msg-focus-cleared = focus cleared
msg-focusing = focusing { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = deleted { $path } ({ $count } entries)
msg-read-only = { $path } is read-only
msg-subtree-set = { $path } is a subtree; refusing to set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing to shadow
msg-key-not-found = key not found: { $path }
msg-no-match = no match
msg-link-not-connected = link fetch error: not connected
msg-link-fetch-error = link fetch error: { $e }
msg-link-key-not-found = key `{ $key }` not found in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias name cannot be empty
err-alias-has-fragment = alias names cannot contain '#'
err-alias-value-fragment = alias value must be bare did:ma:<ipns> (no fragment)
err-alias-value-path = alias value must be bare did:ma:<ipns> (no path)
err-alias-not-did = alias value must start with did:ma:
err-unknown-alias = unknown alias: @{ $name }
err-bare-did = expected bare did:ma:<ipns> (no fragment or path), got { $did }
err-lang-not-found = language not found: { $lang }

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
inbox-empty = inbox is empty
inbox-entry-not-found = inbox entry { $n } not found
inbox-no-message-id = inbox entry { $n } has no message_id
inbox-no-verb = no verb `{ $verb }` for inbox entry { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = discover failed at { $url }: { $e }
discover-json-error = discover failed: invalid JSON from { $url }: { $e }
discover-missing-did = discover failed: status.json missing required field `did`
discover-invalid-did = discover failed: expected `did` to start with did:ma:, got `{ $did }`
discover-no-endpoint = discover warning: `endpoint_id` missing in status.json; stored DID only
discover-success = ma discovered at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma created — publish with: .my.identity:publish @ma
claim-success = Runtime claimed for { $did }
claim-conflict = Runtime already claimed by another identity
claim-http-failed = claim failed: HTTP { $status }
claim-error = claim failed: { $e }
claim-no-session = not logged in; log in first to claim the runtime
runtime-no-verb = no verb `{ $verb }` for { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully open)
acl-persist-error = persist error: { $e }
acl-no-verb = no verb `{ $verb }` for .my.acl

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Available languages (set with .my.i18n: <code>):

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

# ── Help text — headers ───────────────────────────────────────────────────
help-header-zion = ── zion commands ─────────────────────────────────────────────────────────
help-header-messaging = ── messaging ────────────────────────────────────────────────────────────
help-header-focus = ── focus mode ───────────────────────────────────────────────────────────
help-header-config = ── local config grammar ─────────────────────────────────────────────────
help-header-common = ── common paths ─────────────────────────────────────────────────────────
help-header-inbox = ── inbox ────────────────────────────────────────────────────────────────
help-header-documents = ── documents (.my.doc.*) ────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Help text — zion commands ─────────────────────────────────────────────
help-cmd-help =   .help                        this text
help-cmd-clear =   .clear                       clear terminal
help-cmd-panic =   .panic                       last resort — use if you find yourself in trouble
help-cmd-logout =   .logout                      log out

# ── Help text — messaging ─────────────────────────────────────────────────
help-msg-echo =   @alias                       echo resolved DID (no message sent)
help-msg-send =   @alias[:verb] body           send message / RPC to actor
help-msg-fragment =   @alias#fragment[:verb] body  send to alias with explicit DID fragment
help-msg-escape =   \@name                       literal @name (no alias lookup)

# ── Help text — focus mode ────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       focus on actor (changes prompt)
help-focus-clear =   .use                         clear focus

# ── Help text — config grammar ────────────────────────────────────────────
help-config-get =   .path                        get leaf value or list subtree
help-config-filter =   .path value                  match query (filter by value)
help-config-set =   .path: value                 set leaf
help-config-delete =   .path:                       delete leaf or subtree
help-config-verb =   .path:verb [args]            invoke local verb

# ── Help text — common paths ──────────────────────────────────────────────
help-my =   .my                          show all personal config
help-aliases =   .my.aliases                  list aliases
help-aliases-set =   .my.aliases.<name>: <did>    add/update alias (bare DID, no #fragment)
help-aliases-del =   .my.aliases.<name>:          remove alias
help-runtime-discover =   .my.ma:discover          discover local runtime and create @ma alias
help-runtime-claim =   .my.ma:claim             claim runtime ownership with your DID
help-identity =   .my.identity                 show identity config
help-identity-did =   .my.identity.did             show own DID (read-only)
help-identity-publish =   .my.identity:publish @pub    publish own DID via publisher service
help-config-path =   .config                      show all .config.* entries

# ── Help text — inbox ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    list inbox (subtree view)
help-inbox-n =   .my.inbox.N                  show entry N fields
help-inbox-from =   .my.inbox.N.from             sender DID of entry N
help-inbox-reply =   .my.inbox.N:reply [body]     send reply (opens editor if no body)
help-inbox-open =   .my.inbox.N:open             open entry content read-only in editor
help-inbox-del =   .my.inbox.N:                 delete entry N
help-inbox-delall =   .my.inbox:                   delete all inbox entries
help-inbox-flush =   .my.inbox:flush              print all entries to terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse sender DID document lazily

# ── Help text — documents ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           open editor with saved content
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     fetch CID, open for review only
help-doc-eval =   .my.doc.<name>:eval           execute saved content line-by-line
help-doc-publish =   .my.doc.<name>:publish @pub   store as raw blob (any type)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  store YAML as structured DAG-CBOR IPLD node
help-doc-fetch =   .my.doc.<name>:fetch <cid>    import CID content (no execution)
help-doc-cid =   .my.doc.<name>:cid            show stored CID
help-doc-del =   .my.doc.<name>:              delete document
