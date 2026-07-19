# art-x-lyaric — Dread Talk / Lyaric (Rasta)
# Rastafarian Lyaric dialect, also known as Dread Talk or Lyaric.
# BCP-47 private-use tag: art-x-lyaric
lang-name = Lyaric

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = enter Zion
tab-new-identity = nouvo I-dentity
tab-import-profile = bring in I-profile
label-passphrase = pass phrase
label-username = I-name
label-confirm-passphrase = confirm pass phrase
label-did = DID
label-profile-cid = I-profile CID
label-or-file = oswa dosye
btn-login = enter
btn-export = carry out
btn-generate = manifest
btn-new-endpoint = new overstanding
btn-import-profile = bring in I-profile
passphrase-warning = Lose pass phrase = lose identity. There is no recovery in Babylon.
import-profile-help = Bring in I-profile by CID or file. Same pass phrase used when publishing needed, seen?
import-profile-detected-user = I-profile belong to: { $name }
status-unlocking = opening...
status-generating = manifesting identity...
status-reading-file = lekti dosye...
status-fetching-profile = fetchin I-profile from IPFS...
status-imported = brought in '{ $name }' — switch to Enter tab
status-importing-profile = bringing in I-profile...
profile-import-done = I-profile brought in for '{ $name }' — { $n } keys loaded, irie
error-wrong-passphrase = wrong pass phrase: { $e }
error-identity-not-found = I-dentity '{ $name }' nuh find
error-username-required = I-name required
error-passphrase-required = pass phrase required
error-passphrases-no-match = pass phrases nuh match
error-profile-source-required = give CID or upload file, seen?
error-did-required = give InI DID, seen?
error-profile-fetch = could not fetch I-profile: { $e }
error-profile-no-username = I-profile nuh have InI-name
error-profile-no-identity = I-dentity '{ $name }' nuh find — bring in I-dentity first

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — entered as { $username }
msg-type-help = Type .help fi a list of livity commands.
msg-connecting = konekte ak 14...
msg-iroh-ready = iroh endpoint irie
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID published through I-an-I local ma ({ $url })
msg-ma-connecting-matrix = I-an-I a try connect yuh to di 間trix
msg-local-ma-claimed = local 間 claim done
msg-local-ma-already-claimed = local 間 already claim
msg-local-ma-claim-failed = local 間 claim fall down
msg-identity-not-published = Ites not inna di web — if ma install inna di machine, run '.ma [port]' den '.my.identity!publish @ma'. Write '.help/publish' fi di details.
msg-blocked = ⊗ blocked by Zion [{ $cap }]: { $from }
msg-focus-cleared = konsantre klè
msg-focusing = konsantre 9 kòm 21
msg-set = { $path }: { $value }
msg-deleted = removed { $path } ({ $count } entries)
msg-read-only = { $path } se lekti sèlman
msg-subtree-set = { $path } is a subtree; refusing fi set
msg-ancestor-leaf = an ancestor of { $path } is a leaf; refusing fi shadow
msg-key-not-found = key nuh find: { $path }
msg-no-match = pa gen match
msg-link-not-connected = link fetch: nuh connected
msg-link-fetch-error = link fetch: { $e }
msg-link-key-not-found = key `{ $key }` nuh find in linked document

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = alias I-name cyan be empty
err-alias-has-dot = alias I-name cyan contain '.'
err-alias-has-fragment = alias I-name cyan contain '#'
err-alias-value-fragment = valè alyas ka genyen omwen yon fragman 46 ki pa vid
err-alias-value-path = valè alyas dwe yon 22 DID oswa 37 (pa gen okenn chemen)
err-alias-not-did = valè alyas dwe kòmanse ak did:32:
err-unknown-alias = alyas enkoni: @QXQ0XQX
err-bare-did = espere bare 14 (pa gen okenn fragman oswa chemen), te resevwa 55

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Keep
btn-eval = Livity
btn-cancel = Anile
btn-close = Fèmen
btn-reply = Answer
btn-publish = Manifest
btn-publish-ipld = Manifest IPLD
msg-reply-sent = answer forward
msg-reply-failed = answer fall: { $e }
msg-entity-publish-sent = entity { $name }: manifest forward
msg-entity-publish-failed = entity manifest fall: { $e }
msg-kind-publish-failed = Kind publish bun up: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: manifest forward
msg-field-publish-failed = field manifest fall: { $e }
msg-acl-publish-sent = runtime ACL: manifest forward
msg-crud-edit-publish-sent = { $path }: manifest forward
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
inbox-filter-no-arg = filter need DID or alias argument
inbox-filter-empty = no message from { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = seeking fall at { $url }: { $e }
discover-json-error = seeking fall: no irie JSON from { $url }: { $e }
discover-missing-did = seeking fall: status.json missing required field `did`
discover-invalid-did = seeking fall: expected `did` fi start with did:ma:, got `{ $did }`
discover-no-endpoint = seeking notice: `endpoint_id` missing in status.json; kept DID only
discover-hint-endpoint-not-found = Hint: endpoint no found. Check seh `ma` expose /status.json pon port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check `ma` log dem and try again.
discover-hint-network = Sijesyon: pwoblèm network/koneksyon. Kòmanse 40, verifye localhost:5003 ou ka jwenn, epi pèmèt lokal 101 aksè nan navigatè a.
discover-hint-generic = Sijesyon: verifye 13 ak 25 Desktop ap fonksyone, apresa reesye 59.
discover-success = ma found at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma create — run '.my.identity!publish @ma' fi publish di ites.
claim-success = Runtime claim for { $did } in Iration
claim-conflict = Runtime already claim by another I-dentity
claim-already-owned = Runtime already claim by dis I-dentity
claim-http-failed = claim fall: HTTP { $status }
claim-error = claim fall: { $e }
claim-no-session = nuh entered; enter first fi claim di runtime
runtime-no-verb = pa gen okenn vèb 8 pou 24

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reset (fully irie and open)
acl-persist-error = keeping trouble: { $e }
acl-no-verb = pa gen okenn vèb 8 pou .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = livity: .my.identity!publish <did-or-alias>
identity-exported = Bundle downpressed as { $filename }
identity-export-failed = Export nah work: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content empty
doc-save-first = { $path }.content empty — keep it first
doc-missing-name = document I-name missing
doc-publish-usage = livity: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = livity: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = manifest { $path }: { $e }
doc-publish-ipld-failed = manifest-ipld { $path }: { $e }
doc-publish-error-detail = publish fall [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = konekte ankò pou ego ka jwenn aksè nan kle I-dentity w yo
doc-publish-hint-target = sèvi ak yon piblikatè valab DID oswa alyas ki networkud nan bare 57
doc-publish-hint-network = verifye 7 ègzekutabl ak 22 yo ka jwenn, Lè sa a, reesye
doc-publish-hint-resolve = verifye dokiman DID piblikatè a manifest epi li gen yon pwen final ki ka jwenn
doc-publish-hint-acl = mande operatè piblikatè a pou pèmèt DID ou nan 48
doc-publish-hint-runtime = runtime/plugin te rejte demann lan; enspekte networkn an epi eseye refè apre ranje antite / ègzekutabl
doc-publish-hint-ipfs = tcheke sante lokal 12/17 ak estati egzekite Piblikatè
doc-publish-hint-unknown = enspekte mòso bwa pou egzekite kòz detaye epi eseye eseye ankò
doc-store-sent = store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-ipld-store-sent = IPLD store request forward ({ $id }) → { $publisher }; CID will arrive via RPC
doc-fetch-done = brought { $cid } → { $path }.content (not livity)
doc-fetch-failed = bringing { $cid }: { $e }
doc-fetch-usage = livity: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid not set
doc-no-verb = pa gen okenn vèb 8 pou 24
path-no-verb = pa gen okenn vèb 8 pou 24

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Irie languages in Zion (set with .my.i18n: <code>):

err-lang-not-found = I-language nuh find: { $lang }

help-header-zion = ── zion commands — Irie ───────────────────────────────────────────────────
help-header-messaging = ── I-messages ─────────────────────────────────────────────────────────────
help-header-config = ── I-config grammar ───────────────────────────────────────────────────────
help-header-common = ── I-paths ────────────────────────────────────────────────────────────────
help-header-inbox = ── I-box ──────────────────────────────────────────────────────────────────
help-header-documents = ── I-writings (.my.doc.*) ─────────────────────────────────────────────────
help-header-i18n = ── lang ────────────────────────────── ───────────────────────────────
help-header-ma = ── 3-espas ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── k ap antre nan 間-espas ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        dis I-text
help-cmd-clear =   .clear                       clear di terminal
help-cmd-panic =   .panic                       last resort — use if I-self find trouble in Babylon
help-cmd-history =   .history                     I-command history (consecutive repeats mash inna one)
help-cmd-logout =   .logout                      depart from Zion
help-cmd-batch =   .batch                       eval scratch dakiment parallel
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch dakiment lain bai lain
help-msg-echo = @alias                       montre networkud DID/18 (pa gen okenn mesaj voye)
help-msg-send =   @alias!msg body / @alias:verb args           send message / RPC to I-dren
help-msg-fragment =   @alias#fragment:verb body  send to I-name wid explicit DID fragment
help-msg-escape =   \@name                       literal @name (no I-name search)
help-config-get =   .path                        sight leaf value or list subtree
help-config-filter = .path value                  matche rechèch (filtre pa valè)
help-config-set = .path: value                 mete fèy
help-config-delete =   .path:                       remove leaf or subtree
help-config-verb =   .path!verb [args]            invoke I-local verb
help-my =   .my                          sight all personal I-config
help-aliases =   .my.aliases                  list I-names
help-aliases-set = .my.aliases.<name>: <did-url> ajoute/mete ajou alyas (DID oswa 55)
help-aliases-del =   .my.aliases.<name>:          remove I-name
help-runtime-discover =   .ma [port]          discover local runtime and manifest @ma I-name
help-runtime-claim =   .ma [port]             claim runtime ownership with I and I DID
help-identity =   .my.identity                 sight I and I identity config
help-identity-did =   .my.identity.did             sight I and I DID (I-sight only)
help-identity-publish =   .my.identity!publish @pub    publish I and I DID via publisher
help-identity-export =   .my.identity!export          download I-and-I identity bundle
help-config-path =   .config                      sight all .config.* entries
help-inbox =   .my.inbox                    sight I-box (subtree view)
help-inbox-n =   .my.inbox.N                  sight entry N fields
help-inbox-from = .my.inbox.N.from             moun k ap voye DID antre N
help-inbox-reply =   .my.inbox.N!reply [body]     send reply (opens editor if nuh body)
help-inbox-open =   .my.inbox.N!open             open entry in I-sight only in editor
help-inbox-del =   .my.inbox.N:                 remove entry N
help-inbox-delall =   .my.inbox:                   remove all I-box entries
help-inbox-flush =   .my.inbox!flush              manifest all entries to terminal
help-inbox-filter =   .my.inbox!filter @who        sight only I-box from @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traverse sender DID document in I-time
help-doc-edit =   .my.doc.<name>!edit           open editor with saved I-writing
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fetch CID, open for I-sight only
help-doc-eval =   .my.doc.<name>!eval           execute saved I-writing line by line
help-doc-publish = .my.doc.<name>!publish @pub   magazen kòm blob anvan tout koreksyon (nenpòt kalite)
help-doc-publish-ipld = .my.doc.<name>!publish-ipld @pub  magazen 6 kòm estrikti 25 34 ne
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bring in CID content (no execution)
help-doc-cid =   .my.doc.<name>!cid            sight stored CID
help-doc-del =   .my.doc.<name>:              remove I-writing from Zion

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n estoke preferans lang ki asosye ak I-dentity w.
help-i18n-set = .my.i18n: <code>             chwazi lang 20 itilize pou I-dentity sa a
help-i18n-list = .my.i18n!list               lis kòd lang ki disponib yo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Di 間 room a di space between 間 identity dem. ma mek dem identity deh find one anedda an reason; when yuh identity publish, yuh can tek part.
help-ma-command =   .ma [port]                   link to yuh local ma runtime, read /status.json, an save .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publish yuh DID document so odda can resolve yuh key dem an endpoint
help-ma-security = Di clearest trust boundary a yuh own ma runtime wid yuh own IPFS Desktop/Kubo. A remote publisher can help, but den yuh lean pon somebody else service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how fi enter di 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When yuh identity known, .enter @ma mek yuh step into 間. Find a world, enter it, an tek part from deh.
help-ma-entry-steps = Start IPFS Desktop an ma, den run .ma. Publish wid .my.identity!publish @ma, find a world, an enter wid .enter @ma.
help-ma-entry-command =   .enter @ma                  enter 間 through di @ma runtime
help-ma-entry-leave =   .leave                       leave di room; yuh identity stay active, an yuh remain logged in
help-ma-entry-url = ?enter=<runtime>             antre apre ou fin konekte nan yon URL pataje

msg-send-failed = send nuh forward: { $e }
msg-not-logged-in = I an I nuh log in, seen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML analiz erè: 18
yaml-not-mapping = YAML dwe yon kat (kle: pè valè); tèks klè ak eskalatè vid yo pa ka estoke kòm 91
dagcbor-encode-error = DAG-CBOR kode erè: 23
cbor-decode-error = CBOR dekode erè: 19
cbor-json-error = Erè CBOR pou 8: 20
yaml-serialize-error = YAML seri erè: 22
edit-reply-invalid = repons modifye pa valab
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = bwat resepsyon taye pèsiste: 21
err-config-load = erè chaj konfigirasyon: 19
err-lang-persist = lang pèsiste: 14
err-history-parse = erè analiz istwa: 21
err-history-load = erè chaj istwa: 20
err-ipfs-reply-decode = Dekode repons IPFS echwe: 26
err-edit-cbor = modifye erè 5: 17
err-popup-blocked = popup block by di browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = iration failin
rpc-error-detail = iration failin: { $detail }
msg-new-message = ← [{ $from }] new word come — { $count } inna di box
msg-chat = { $sender } seh { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } seh { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } enter di room.
room-leave = * { $name } lef di room.
room-drop  = * { $name } drop { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit decode fail: { $e }
err-edit-fetch-failed = edit fetch fail: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no livity session — caan delete profile
profile-delete-error = profile deletion fail up: { $e }
profile-wrong-user = pa ka mete 11 pou yon lòt I-profile - sèlman pwòp ou a
profile-wrong-user-name = pa ka mete 11 pou 19 — sèlman pwòp I-profile ou
profile-no-ma = pa gen 3 ègzekutabl konfigirasyon - kouri 31 an premye
profile-no-cid = pa gen 3 ki estoke pou I-profile sa a — kouri 37 an premye
profile-no-cid-in-doc = pa gen okenn I-profile 11 yo jwenn nan dokiman DID — kouri 43 an premye
profile-publish-sent = profile lock up an send to IPFS; DID document a go update when CID come
profile-publish-done = profile publish — DID document update wid ma.agent CID
profile-publish-failed = I-profile manifest echwe: 24
profile-fetch-done = I-profile chache — kle 18 chaje soti nan 43
profile-fetch-failed = chache I-profile echwe: 22
msg-identity-exists = I-dentity deja manifest - I-profile jiska dat
profile-import-exists = I-profile 8 deja egziste — efase li an premye
profile-import-wrong-user = dosye gen I-profile 22, espere 42

# -- CID content operations
cid-op-binary = kontni binè (pa parèt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = echwe pou jwenn kontni: 25
cid-op-unknown = operasyon kontni enkoni: 27
cid-op-wc = { $lines } liy 18 mo 36 karaktè
profiles-empty = (okenn)
profiles-deleted = profile { $name } gone
profiles-not-found = profile nuh deh: { $name }

# -- Help topics index
help-header-topics = -- taapik -- taip .help/<topic> fi di ditael
help-topic-msg =   .help/msg                    message dem
help-topic-ma = .help/ma                     ma-espas, manifest, ak antre
help-topic-path = .help/path                   gramè lokal dot-chemen
help-topic-my =   .help/my                     personal settings
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    dakiment dem
help-topic-actor =   .help/actor                  far actor
help-unknown-topic =   .help/{ $topic }: topic no known

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       shuo di DID weh rizalv
help-actor-text = @actor[#entity]!msg|!say|!emote body         voye mesaj dirèk/chat/emote
help-actor-ping = @actor:ping                  lavi ping
help-actor-entities =   @actor/entities              lis entity dem
help-actor-entities-get = @actor/entities/<n>          jwenn node antite
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   mete antite pa referans 14
help-actor-entities-edit =   @actor/entities/<n>!edit     edit di entity
help-actor-entities-del = @actor/entities/<n>:         efase antite
help-actor-config-get =   @actor/config/<key>          get config valyu
help-actor-config-set =   @actor/config/<key>: val     set config valyu
help-actor-acl = @actor/acl                   jwenn 4
help-actor-acl-edit =   @actor/acl!edit              fix ACL
help-actor-fragment =   @actor#entity                sen go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── 3 aktè rele ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  rele yon antite 15 soti nan 24 epi tann repons li
help-actor-head = (@actor/path)                chache kontni CRUD aleka nan 31
help-actor-tail = (<bafy...>)                  enkli ak evalye 21 soti nan yon 36 41
help-actor-wc = (define x (@actor:verb arg))  kenbe repons 5 nan anviwònman sesyon an
help-actor-wc-l = .my.scheme.ma!edit           edite ki te sove 11 asistan yo pou I-dentity sa a

help-topic-url =   .help/url                    open Zion tru a URL link
help-topic-i18n = .help/i18n                   preferans lang pou I-dentity w
help-header-url = ── URL I-parameters ─────────────────────────────────────────────────────────────
help-url-intro =   Share a link fi open Zion wid a I-recipient ready fill:
help-url-msg =   ?msg=<did>                   fill up: @<did>!msg (I-message)
help-url-say =   ?say=<did>                   fill up: @<did>!say (say verb)
help-url-emote =   ?emote=<did>                 fill up: @<did>!emote (emote verb)
help-url-ma = ?ma=<did-or-url>              pre-ranpli ègzekutabl DID / 23 URL
help-url-enter = ?enter=<runtime>             antre nan mond lan apre konekte
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di I-input fill up but not send — press Enter fi send.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publish di ites pon di network
help-header-publish = ── publish di ites ──────────────────────────────────────────────────────────
help-publish-intro = Publishing mek di ites findable pon di network. Odda ones can search di DID fi reach.
help-publish-ma = Fi publish, InI need ma (local runtime) install. It bridge ego to IPFS/IPNS pon di behalf.
help-publish-steps = Steps: run '.ma [port]' fi find di local ma, den '.my.identity!publish @ma'.
help-publish-without = Without publishing, odda ones cannot reach — even knowing di DID, dem cannot resolve di endpoint.
profile-fetch-did-resolve-failed = DID pa manifest ankò — kouri 28 an premye, apre sa 67 I-profile ou a
profile-update-done = I-profile mete ajou - kle 18 fizyone soti nan 43
profile-delete-needs-name = name di profile: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolekte pakèt - tape kòmandman, fini ak .batch
batch-already-collecting = Deja kolekte yon pakèt - fini ak .batch an premye
batch-empty = Pakèt te vid - pa gen anyen yo kouri
batch-running = Batch a ron…
batch-step-timeout = etap pakèt kwonometre soti

batch-done = Batch don inna { $secs }s — { $steps } step
batch-done-error = Batch don wid error inna { $secs }s — { $steps } step
msg-timeout = Message taim out (no reply inna 60s)
err-unknown-command = command no known: { $path }
err-read-only-path = { $path } a read-only
help-cmd-batch-async =   .batch:async / .batch        eval scratch dakiment parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } cyaan fetch: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = No real CID dis: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Watchout: Yuh IPNS private key ago sen to dis runtime fi publish yuh livity. Only use a runtime yuh fully trust, Iyah.
