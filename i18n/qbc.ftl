# zion — lang belta (Belter Creole)
lang-name = Lang Belta
# From The Expanse, constructed by linguist Nick Farmer.
# ISO 639-3: qbc (local/private use code)

# ── Pej ingang ────────────────────────────────────────────────────────────
tab-login = ingang
tab-new-identity = nyu selfmang
tab-import = bringin
label-passphrase = sekrit-lang
label-username = mang-nim
label-confirm-passphrase = sikkina sekrit-lang
btn-login = ingang
btn-export = tekout
btn-generate = mek
passphrase-warning = Losh sekrit-lang = losh selfmang. Na du finyish wit nating.
import-help = Saf .zion.json fayl. Fonosing im hol sekrit gut.
status-unlocking = uddering...
status-generating = mekking nyu selfmang...
status-reading-file = lit fayl...
status-imported = '{ $name }' bringin — go ingang tab
error-wrong-passphrase = sekrit-lang da no gut: { $e }
error-identity-not-found = selfmang '{ $name }' na finyish wit
error-username-required = mang-nim gonya kom
error-passphrase-required = sekrit-lang gonya kom
error-passphrases-no-match = sekrit-lang du na kopeng

# ── Sistem koments terminal ────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ingangé wit { $username }
msg-type-help = Showxa .help fo kowl komands.
msg-connecting = konekting to iroh...
msg-iroh-ready = iroh endpoint gútegow
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ hamma [{ $cap }]: { $from }
msg-focus-cleared = fokus na du
msg-focusing = fokus { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } na du ({ $count } tenye)
msg-read-only = { $path } lit-seng oyedeng
msg-subtree-set = { $path } im gova-kopeng; na du seting
msg-ancestor-leaf = { $path } gova im lef; na du dabali
msg-key-not-found = ki na finyish wit: { $path }
msg-no-match = nating kopeng
msg-link-not-connected = hámfalla du fech link: na konekt
msg-link-fetch-error = hámfalla du fech link: { $e }
msg-link-key-not-found = ki `{ $key }` na finyish wit im link-dok

# ── Alias falaare ─────────────────────────────────────────────────────────
err-alias-name-empty = alias nim na owkwa im nating
err-alias-has-fragment = alias nim na tenye '#'
err-alias-value-fragment = alias sanda gonya bare did:ma:<ipns> (na wit fragment)
err-alias-value-path = alias sanda gonya bare did:ma:<ipns> (na wit path)
err-alias-not-did = alias sanda gonya showxa did:ma: diching
err-unknown-alias = alias na sasa: @{ $name }
err-bare-did = bare did:ma:<ipns> kolowda (na wit fragment oyedeng path), towa { $did }

# ── Editow ────────────────────────────────────────────────────────────────
btn-save = hol
btn-eval = du
btn-cancel = na-du
btn-close = tek-out
btn-reply = bek-showxa
btn-publish = sendowt
msg-reply-sent = bek-showxa gonya kom
msg-reply-failed = bek-showxa hámfalla: { $e }
msg-entity-publish-sent = entity { $name }: sendowt gonya kom
msg-entity-publish-failed = sendowt entity hámfalla: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: sendowt gonya kom
msg-field-publish-failed = sendowt fild hámfalla: { $e }
msg-acl-publish-sent = runtime ACL: sendowt gonya kom
msg-acl-publish-failed = sendowt runtime ACL hámfalla: { $e }
msg-yaml-error = YAML hámfalla: { $e }
msg-editor-saved = { $path }:hol
msg-fetch-review = { $cid } fech finyish — pensa kowl bifo du
msg-fetch-failed = feching { $cid }: { $e }

# ── Du — inbox ────────────────────────────────────────────────────────────
inbox-empty = inbox im nating
inbox-entry-not-found = inbox tenye { $n } na finyish wit
inbox-no-message-id = inbox tenye { $n } na tenye message_id
inbox-no-verb = na du `{ $verb }` fo inbox tenye { $n }

# ── Du — runtime ──────────────────────────────────────────────────────────
discover-fetch-failed = diskova hámfalla wit { $url }: { $e }
discover-json-error = diskova hámfalla: mal JSON from { $url }: { $e }
discover-missing-did = diskova hámfalla: status.json na tenye `did`
discover-invalid-did = diskova hámfalla: `did` gonya showxa did:ma: diching, towa `{ $did }`
discover-no-endpoint = diskova beleti: `endpoint_id` na finyish wit status.json; DID oyedeng hol
discover-success = ma diskova at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma mek finyish — sendowt wit: .my.identity:publish @ma
claim-success = Runtime klaim fo { $did }
claim-conflict = Runtime ta klaim by bifo selfmang
claim-http-failed = kolowda hámfalla: HTTP { $status }
claim-error = kolowda hámfalla: { $e }
claim-no-session = na ingang; ingang diching fo klaim runtime
runtime-no-verb = na du `{ $verb }` fo { $path }

# ── Du — ACL ──────────────────────────────────────────────────────────────
acl-reset = .my.acl reset finyish (udda kowl-wit)
acl-persist-error = hámfalla hol: { $e }
acl-no-verb = na du `{ $verb }` fo .my.acl

# ── Du — selfmang ─────────────────────────────────────────────────────────
publish-usage = showxa: .my.identity:publish <did-oyedeng-alias>

# ── Du — dokuments ────────────────────────────────────────────────────────
doc-content-empty = { $path }.content im nating
doc-save-first = { $path }.content im nating — hol diching
doc-missing-name = dokument nim na finyish
doc-publish-usage = showxa: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = showxa: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = sendowt { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-ipld-store-sent = IPLD hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-fetch-done = { $cid } fech finyish → { $path }.content (na du-im)
doc-fetch-failed = feching { $cid }: { $e }
doc-fetch-usage = showxa: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid na hol
doc-no-verb = na du `{ $verb }` fo { $path }
path-no-verb = na du `{ $verb }` fo { $path }

# ── Halp — gova ──────────────────────────────────────────────────────────
help-header-zion = ── zion komands ────────────────────────────────────────────────────────────
help-header-messaging = ── showxa ───────────────────────────────────────────────────────────────
help-header-focus = ── fokus mod ────────────────────────────────────────────────────────────
help-header-config = ── konfig naxwe ──────────────────────────────────────────────────────────
help-header-common = ── kowl paj du ──────────────────────────────────────────────────────────
help-header-inbox = ── inbox ────────────────────────────────────────────────────────────────
help-header-documents = ── dokuments ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Halp — zion komands ───────────────────────────────────────────────────
help-cmd-help =   .help                        dis lit-pej
help-cmd-clear =   .clear                       kel terminal
help-cmd-panic =   .panic                       owkwa keting — du wit problem
help-cmd-logout =   .logout                      tek-out

# ── Halp — showxa ─────────────────────────────────────────────────────────
help-msg-echo =   @alias                       lit DID im (na showxa message)
help-msg-send =   @alias[:verb] body           showxa message / RPC fo actor
help-msg-fragment =   @alias#fragment[:verb] body  showxa wit DID fragment cler
help-msg-escape =   \@name                       @name leshi (na du alias)

# ── Halp — fokus mod ──────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokus actor (prompt gonya bek)
help-focus-clear =   .use                         na-du fokus

# ── Halp — konfig naxwe ───────────────────────────────────────────────────
help-config-get =   .path                        sasa lef sanda oyedeng lit gova-kopeng
help-config-filter =   .path value                  kolowda (hamma wit sanda)
help-config-set =   .path: value                 set lef
help-config-delete =   .path:                       na-du lef oyedeng gova-kopeng
help-config-verb =   .path:verb [args]            kol lokal verb

# ── Halp — kowl paj du ───────────────────────────────────────────────────
help-my =   .my                          lit kowl selfmang konfig
help-aliases =   .my.aliases                  lit alias kowl
help-aliases-set =   .my.aliases.<name>: <did>    mek/update alias (bare DID, na wit #fragment)
help-aliases-del =   .my.aliases.<name>:          na-du alias
help-runtime-discover =   .my.ma:discover          diskova lokal runtime unte mek @ma alias
help-runtime-claim =   .my.ma:claim             klaim runtime wit yu DID
help-identity =   .my.identity                 lit selfmang konfig
help-identity-did =   .my.identity.did             lit yu DID (lit-seng oyedeng)
help-identity-publish =   .my.identity:publish @pub    sendowt DID wit publishe
help-config-path =   .config                      lit kowl .config.* tenye

# ── Halp — inbox ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lit inbox (gova-kopeng lit)
help-inbox-n =   .my.inbox.N                  lit tenye N fild kowl
help-inbox-from =   .my.inbox.N.from             DID showxa-mang tenye N
help-inbox-reply =   .my.inbox.N:reply [body]     showxa bek-showxa (editow udda na wit body)
help-inbox-open =   .my.inbox.N:open             udda mbeɗe lit-seng editow
help-inbox-del =   .my.inbox.N:                 na-du tenye N
help-inbox-delall =   .my.inbox:                   na-du kowl inbox tenye
help-inbox-flush =   .my.inbox:flush              lit kowl tenye terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   mali-du DID dok showxa-mang

# ── Halp — dokuments ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           udda editow wit hol mbeɗe
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     fech CID, udda lit-seng oyedeng
help-doc-eval =   .my.doc.<name>:eval           du hol mbeɗe lain-wit-lain
help-doc-publish =   .my.doc.<name>:publish @pub   hol as raw blob (kowl tip)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  hol YAML as IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>:fetch <cid>    bringin CID mbeɗe (na du-im)
help-doc-cid =   .my.doc.<name>:cid            lit hol CID
help-doc-del =   .my.doc.<name>:              na-du dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Belter languages (.my.i18n: <code> fo set):
err-lang-not-found = langue introuvable : { $lang }
