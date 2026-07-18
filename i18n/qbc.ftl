# zion — lang belta (Belter Creole)
lang-name = Lang Belta
# From The Expanse, constructed by linguist Nick Farmer.
# ISO 639-3: qbc (local/private use code)

# ── Pej ingang ────────────────────────────────────────────────────────────
tab-login = ingang
tab-new-identity = nyu selfmang
tab-import-profile = bringin profayel
label-passphrase = sekrit-lang
label-username = mang-nim
label-confirm-passphrase = sikkina sekrit-lang
label-did = DID
label-profile-cid = profayel CID
label-or-file = o fayl
btn-login = ingang
btn-export = tekout
btn-generate = mek
btn-new-endpoint = nyu boneway
btn-import-profile = bringin profayel
passphrase-warning = Losh sekrit-lang = losh selfmang. Na du finyish wit nating.
import-profile-help = Bringin profayel wit CID o fayl. Im gonya sekrit-lang kopeng fo pablikesim.
import-profile-detected-user = Profayel da fo: { $name }
status-unlocking = uddering...
status-generating = mekking nyu selfmang...
status-reading-file = lit fayl...
status-fetching-profile = dey bring profayel koming IPFS...
status-imported = '{ $name }' bringin — go ingang tab
status-importing-profile = bringinéfosho profayel...
profile-import-done = profayel bringin fo '{ $name }' — { $n } ki loding
error-wrong-passphrase = sekrit-lang da no gut: { $e }
error-identity-not-found = selfmang '{ $name }' na finyish wit
error-username-required = mang-nim gonya kom
error-passphrase-required = sekrit-lang gonya kom
error-passphrases-no-match = sekrit-lang du na kopeng
error-profile-source-required = tekout CID o upfayel fayl
error-did-required = put in DID fo yu
error-profile-fetch = nating kom fo profayel: { $e }
error-profile-no-username = profayel na hesh mang-nim
error-profile-no-identity = selfmang '{ $name }' na finyish wit — bringin selfmang fosh

# ── Sistem koments terminal ────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ingangé wit { $username }
msg-type-help = Showxa .help fo kowl komands.
msg-connecting = konekting to iroh...
msg-iroh-ready = iroh endpoint gútegow
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID push out, local ma ({ $url })
msg-identity-not-published = Inyalowda pashang nowit kewe na la tube — si ma besh da gut, run '.ma [port]' den '.my.identity!publish @ma'. Slip '.help/publish' fo detay.
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
err-alias-has-dot = alias nim na tenye '.'
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
btn-publish-ipld = sendowt IPLD
msg-reply-sent = bek-showxa gonya kom
msg-reply-failed = bek-showxa hámfalla: { $e }
msg-entity-publish-sent = entity { $name }: sendowt gonya kom
msg-entity-publish-failed = sendowt entity hámfalla: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: sendowt gonya kom
msg-field-publish-failed = sendowt fild hámfalla: { $e }
msg-acl-publish-sent = runtime ACL: sendowt gonya kom
msg-crud-edit-publish-sent = { $path }: sendowt gonya kom
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
inbox-filter-no-arg = filtew nid DID wa alias argument
inbox-filter-empty = nating showxa fom { $did }

# ── Du — runtime ──────────────────────────────────────────────────────────
discover-fetch-failed = diskova hámfalla wit { $url }: { $e }
discover-json-error = diskova hámfalla: mal JSON from { $url }: { $e }
discover-missing-did = diskova hámfalla: status.json na tenye `did`
discover-invalid-did = diskova hámfalla: `did` gonya showxa did:ma: diching, towa `{ $did }`
discover-no-endpoint = diskova beleti: `endpoint_id` na finyish wit status.json; DID oyedeng hol
discover-success = ma diskova at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias kowl da — run '.my.identity!publish @ma' fo pashang inyalowda setara.
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
publish-usage = showxa: .my.identity!publish <did-oyedeng-alias>
identity-exported = Bundle downye as { $filename }
identity-export-failed = Export bombauch: { $e }

# ── Du — dokuments ────────────────────────────────────────────────────────
doc-content-empty = { $path }.content im nating
doc-save-first = { $path }.content im nating — hol diching
doc-missing-name = dokument nim na finyish
doc-publish-usage = showxa: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = showxa: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = sendowt { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-ipld-store-sent = IPLD hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-fetch-done = { $cid } fech finyish → { $path }.content (na du-im)
doc-fetch-failed = feching { $cid }: { $e }
doc-fetch-usage = showxa: .my.doc.<name>!fetch /ipfs/<cid>
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
help-cmd-history =   .history                     komand histori (sekwens duplikat mash bikik)
help-cmd-logout =   .logout                      tek-out
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)

# ── Halp — showxa ─────────────────────────────────────────────────────────
help-msg-echo =   @alias                       lit DID im (na showxa message)
help-msg-send =   @alias!msg body / @alias:verb args           showxa message / RPC fo actor
help-msg-fragment =   @alias#fragment:verb body  showxa wit DID fragment cler
help-msg-escape =   \@name                       @name leshi (na du alias)

# ── Halp — fokus mod ──────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokus actor (prompt gonya bek)
help-focus-clear =   .use                         na-du fokus

# ── Halp — konfig naxwe ───────────────────────────────────────────────────
help-config-get =   .path                        sasa lef sanda oyedeng lit gova-kopeng
help-config-filter =   .path value                  kolowda (hamma wit sanda)
help-config-set =   .path: value                 set lef
help-config-delete =   .path:                       na-du lef oyedeng gova-kopeng
help-config-verb =   .path!verb [args]            kol lokal verb

# ── Halp — kowl paj du ───────────────────────────────────────────────────
help-my =   .my                          lit kowl selfmang konfig
help-aliases =   .my.aliases                  lit alias kowl
help-aliases-set =   .my.aliases.<name>: <did>    mek/update alias (bare DID, na wit #fragment)
help-aliases-del =   .my.aliases.<name>:          na-du alias
help-runtime-discover =   .ma [port]          diskova lokal runtime unte mek @ma alias
help-runtime-claim =   .ma [port]             klaim runtime wit yu DID
help-identity =   .my.identity                 lit selfmang konfig
help-identity-did =   .my.identity.did             lit yu DID (lit-seng oyedeng)
help-identity-publish =   .my.identity!publish @pub    sendowt DID wit publishe
help-identity-export =   .my.identity!export          downye yu owp identity bundle
help-config-path =   .config                      lit kowl .config.* tenye

# ── Halp — inbox ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lit inbox (gova-kopeng lit)
help-inbox-n =   .my.inbox.N                  lit tenye N fild kowl
help-inbox-from =   .my.inbox.N.from             DID showxa-mang tenye N
help-inbox-reply =   .my.inbox.N!reply [body]     showxa bek-showxa (editow udda na wit body)
help-inbox-open =   .my.inbox.N!open             udda mbeɗe lit-seng editow
help-inbox-del =   .my.inbox.N:                 na-du tenye N
help-inbox-delall =   .my.inbox:                   na-du kowl inbox tenye
help-inbox-flush =   .my.inbox!flush              lit kowl tenye terminal
help-inbox-filter =   .my.inbox!filter @who        lit kowl tenye fom @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   mali-du DID dok showxa-mang

# ── Halp — dokuments ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           udda editow wit hol mbeɗe
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fech CID, udda lit-seng oyedeng
help-doc-eval =   .my.doc.<name>!eval           du hol mbeɗe lain-wit-lain
help-doc-publish =   .my.doc.<name>!publish @pub   hol as raw blob (kowl tip)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  hol YAML as IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bringin CID mbeɗe (na du-im)
help-doc-cid =   .my.doc.<name>!cid            lit hol CID
help-doc-del =   .my.doc.<name>:              na-du dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Belter languages (.my.i18n: <code> fo set):
err-lang-not-found = langue introuvable : { $lang }

msg-send-failed = sako nah bringin: { $e }
msg-not-logged-in = inyalowda nah owkwa

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML parse error: { $e }
yaml-not-mapping = YAML mus bi mapping (keya: valyu pɛr); plen tèks an skalas no kɛn bi stòrd as DAG-CBOR
dagcbor-encode-error = DAG-CBOR encode error: { $e }
cbor-decode-error = CBOR decode error: { $e }
cbor-json-error = CBOR to JSON error: { $e }
yaml-serialize-error = YAML serialize error: { $e }
edit-reply-invalid = invalid edit reply
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = inbox prune persist: { $e }
err-config-load = config load error: { $e }
err-lang-persist = lang persist: { $e }
err-history-parse = history parse error: { $e }
err-history-load = history load error: { $e }
err-ipfs-reply-decode = IPFS reply decode failed: { $e }
err-edit-cbor = edit CBOR error: { $e }
err-popup-blocked = popup block by browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = keng ando gonya
rpc-error-detail = fot: { $detail }
msg-new-message = ← [{ $from }] nyú mesej — { $count } in de boks
msg-chat = { $sender } sa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } go sabe { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kopeng insid.
room-leave = * { $name } go owt.
room-drop  = * { $name } drip { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit: fot decode: { $e }
err-edit-fetch-failed = edit: fot fetch: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no session kopeng — no pensa dele profil
profile-delete-error = profil dele bek no go: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
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
profiles-empty = (none)
profiles-deleted = profil { $name } dele go
profiles-not-found = profil no found: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list entities
help-actor-entities-get =   @actor/entities/<n>          get entity
help-actor-entities-set =   @actor/entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help/url                    open zion tru URL peng
help-header-url = ── URL pamitim ──────────────────────────────────────────────────────────────────
help-url-intro =   Fo peng fo open zion wit belter wating already fill:
help-url-msg =   ?msg=<did>                   fill befo: @<did>!msg (basic palabras)
help-url-say =   ?say=<did>                   fill befo: @<did>!say (say verd)
help-url-emote =   ?emote=<did>                 fill befo: @<did>!emote (emote verd)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-ctx =   ?ctx=<actor[#entity]>         auto-focus actor/entity after login
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Di input fill but no sen — peng Enter fo sen.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pashang inyalowda setara to da ring
help-header-publish = ── pashang setara ───────────────────────────────────────────────────────────
help-publish-intro = Pashang da setara tube-kewe na la ring. Felota mang DID inyalowda setara fo da kontak.
help-publish-ma = Fo pashang, ma (local runtime) besh da gut. Im kang ego wit IPFS/IPNS fo inyalowda.
help-publish-steps = Stap: run '.ma [port]' fo find local ma, den '.my.identity!publish @ma'.
help-publish-without = Wit no pashang, felota no kang reach you — even si dem know you DID, dem no kang solve you endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = Pensa CID { $cid } na kang: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat na proper CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Belte wok: Da IPNS priv-key du senye go na dis runtime fo pashang identity. Kowl yuse runtime du fulding trust, walowda.
