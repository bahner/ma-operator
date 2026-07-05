# zion — Malagasy
lang-name = Malagasy

# ── Pejy fidirana ─────────────────────────────────────────────────────────
tab-login = miditra
tab-new-identity = mombamomba vaovao
tab-import-profile = ampidira profily
label-passphrase = teny miafina
label-username = anarana mpampiasa
label-confirm-passphrase = hamafiso ny teny miafina
label-did = DID
label-profile-cid = CID ny profily
label-or-file = na rakitra
btn-login = miditra
btn-export = mamoaka
btn-generate = mamorona
btn-new-endpoint = fanombohana vaovao
btn-import-profile = ampidira profily
passphrase-warning = Very ny teny miafina = very ny mombamomba. Tsy misy famerenana.
import-profile-help = Ampidira profily amin'ny alalan'ny CID na rakitra. Ilainao ny teny miafina nanaovana ny fanontana.
import-profile-detected-user = Ny profily an': { $name }
status-unlocking = mivoha...
status-generating = mamorona mombamomba...
status-reading-file = mamaky rakitra...
status-fetching-profile = alaina ny profily avy amin'ny IPFS...
status-imported = nampidirina '{ $name }' — mifindra amin'ny tab fidirana
status-importing-profile = ampidirina ny profily...
profile-import-done = profily nampidirina ho an'ny '{ $name }' — { $n } fanalahidy nalaina
error-wrong-passphrase = teny miafina diso: { $e }
error-identity-not-found = tsy hita ny mombamomba '{ $name }'
error-username-required = anarana mpampiasa ilaina
error-passphrase-required = teny miafina ilaina
error-passphrases-no-match = ny teny miafina roa dia tsy mitovy
error-profile-source-required = omeo CID na hametraka rakitra
error-did-required = ampidiro ny DID
error-profile-fetch = tsy azo alaina ny profily: { $e }
error-profile-no-username = tsy misy anarana mpampiasa ao amin'ny profily
error-profile-no-identity = ny mombamomba '{ $name }' tsy hita — ampidira mombamomba aloha

# ── Hafatry ny rafitra terminal ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — niditra amin'ny { $username }
msg-type-help = Soraty .help mba hahazo lisitry ny baiko.
msg-connecting = mampifandray amin'ny iroh...
msg-iroh-ready = vonona ny endpoint iroh
msg-iroh-failed = iroh: { $e }
msg-auto-published = Navoaka ny DID amin'alalan'ny ma eo an-toerana ({ $url })
msg-identity-not-published = Tsy hita ny mombamomba amin'ny internet — raha efa napetraka ny ma eo an-toerana, ampiasao '.ma [port]' ary '/my/identity!publish @ma'. Soraty '.help/publish' ho an'ny antsipiriany.
msg-blocked = ⊗ voasakana [{ $cap }]: { $from }
msg-focus-cleared = voafafa ny sain-toerana
msg-focusing = manamarika { $did } ho { $prompt }
msg-set = { $path }: { $value }
msg-deleted = voafafa { $path } ({ $count } fidirana)
msg-read-only = { $path } dia famakiana ihany
msg-subtree-set = { $path } dia hazo kely; nandà ny hametraka
msg-ancestor-leaf = razamben'ny { $path } dia ravin-kazo; nandà ny hanapoka
msg-key-not-found = tsy hita ny fanalahidy: { $path }
msg-no-match = tsy misy mitovy
msg-link-not-connected = hadisoana fetching rohy: tsy mifandray
msg-link-fetch-error = hadisoana fetching rohy: { $e }
msg-link-key-not-found = tsy hita ny fanalahidy `{ $key }` ao amin'ny antontan-taratasy mifandray

# ── Fanamarinana anarana fanampiny ─────────────────────────────────────────
err-alias-name-empty = tsy afaka ho foana ny anarana fanampiny
err-alias-has-dot = ny anarana fanampiny dia tsy afaka misy '.'
err-alias-has-fragment = ny anarana fanampiny dia tsy afaka misy '#'
err-alias-value-fragment = ny sanda fanampiny dia tsy maintsy bare did:ma:<ipns> (tsy misy fragment)
err-alias-value-path = ny sanda fanampiny dia tsy maintsy bare did:ma:<ipns> (tsy misy path)
err-alias-not-did = ny sanda fanampiny dia tsy maintsy manomboka amin'ny did:ma:
err-unknown-alias = anarana fanampiny tsy fantatra: @{ $name }
err-bare-did = nandry bare did:ma:<ipns> (tsy misy fragment na path), nahazo { $did }

# ── Mpandrindra ───────────────────────────────────────────────────────────
btn-save = tehirizo
btn-eval = alao
btn-cancel = foano
btn-close = akatony
btn-reply = valiana
btn-publish = havoaka
btn-publish-ipld = havoaka IPLD
msg-reply-sent = valim-pitoriana nalefa
msg-reply-failed = valim-pitoriana tsy nahomby: { $e }
msg-entity-publish-sent = entity { $name }: nalefa ny famoahana
msg-entity-publish-failed = famoahana entity tsy nahomby: { $e }
msg-kind-publish-failed = tsy nahomby ny namoaka karazana: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: nalefa ny famoahana
msg-field-publish-failed = famoahana sahan-kevitra tsy nahomby: { $e }
msg-acl-publish-sent = runtime ACL: nalefa ny famoahana
msg-crud-edit-publish-sent = { $path }: nalefa ny famoahana
msg-acl-publish-failed = famoahana runtime ACL tsy nahomby: { $e }
msg-yaml-error = hadisoana YAML: { $e }
msg-editor-saved = { $path }:tehirizo
msg-fetch-review = voaaka { $cid } — jereo alohan'ny alao
msg-fetch-failed = fetching { $cid }: { $e }

# ── Fiasa — boaty fidirana ─────────────────────────────────────────────────
inbox-empty = boaty fidirana foana
inbox-entry-not-found = tsy hita ny fidirana boaty { $n }
inbox-no-message-id = ny fidirana boaty { $n } dia tsy manana message_id
inbox-no-verb = tsy misy fiasa `{ $verb }` ho an'ny fidirana boaty { $n }
inbox-filter-no-arg = ny filtra mitaky DID na alias
inbox-filter-empty = tsy misy hafatra avy amin'ny { $did }

# ── Fiasa — fotoana fiasan'ny runtime ─────────────────────────────────────
discover-fetch-failed = tsy nahomby ny fikarohana tao amin'ny { $url }: { $e }
discover-json-error = tsy nahomby ny fikarohana: JSON diso avy amin'ny { $url }: { $e }
discover-missing-did = tsy nahomby ny fikarohana: status.json tsy manana saha `did`
discover-invalid-did = tsy nahomby ny fikarohana: `did` dia tsy maintsy manomboka amin'ny did:ma:, nahazo `{ $did }`
discover-no-endpoint = fampitandremana fikarohana: `endpoint_id` tsy hita ao amin'ny status.json; DID ihany no voatahiry
discover-success = ma hita tao amin'ny { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   voaforona ny alias @ma — ampiasao '/my/identity!publish @ma' hamoaka ny mombamombao.
claim-success = Runtime nalainy ho an'ny { $did }
claim-conflict = Runtime efa nalainy mombamomba hafa
claim-http-failed = fangatahana tsy nahomby: HTTP { $status }
claim-error = fangatahana tsy nahomby: { $e }
claim-no-session = tsy niditra; miditra aloha mba halainy runtime
runtime-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }

# ── Fiasa — ACL ───────────────────────────────────────────────────────────
acl-reset = /my/acl novàna (misokatra tanteraka)
acl-persist-error = hadisoana fitahirizana: { $e }
acl-no-verb = tsy misy fiasa `{ $verb }` ho an'ny /my/acl

# ── Fiasa — mombamomba ────────────────────────────────────────────────────
publish-usage = fampiasana: /my/identity!publish <did-na-anarana-fanampiny>
identity-exported = Nampidina ny vondrona ho { $filename }
identity-export-failed = Tsy nahomby ny fanondranana: { $e }

# ── Fiasa — antontan-taratasy ─────────────────────────────────────────────
doc-content-empty = { $path }/content foana
doc-save-first = { $path }/content foana — tehirizo aloha
doc-missing-name = anarana antontan-taratasy tsy hita
doc-publish-usage = fampiasana: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = fampiasana: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = famoahana { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = fangatahana fitahirizana nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-ipld-store-sent = fangatahana fitahirizana IPLD nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-fetch-done = voaaka { $cid } → { $path }/content (tsy naosina)
doc-fetch-failed = fetching { $cid }: { $e }
doc-fetch-usage = fampiasana: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid tsy voapetraka
doc-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }
path-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }

# ── Fanampiana — lohateny ─────────────────────────────────────────────────
help-header-zion = ── baiko zion ─────────────────────────────────────────────────────────────
help-header-messaging = ── hafatra ───────────────────────────────────────────────────────────────
help-header-focus = ── fomba sain-toerana ────────────────────────────────────────────────────
help-header-config = ── fitsipi-teny fikajiana toerana ────────────────────────────────────────
help-header-common = ── lalan-kely mahazatra ──────────────────────────────────────────────────
help-header-inbox = ── boaty fidirana ──────────────────────────────────────────────────────────
help-header-documents = ── antontan-taratasy ────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Fanampiana — baiko zion ───────────────────────────────────────────────
help-cmd-help =   .help                        lahatsoratra ity
help-cmd-clear =   .clear                       manadio terminal
help-cmd-panic =   .panic                       fanalana farany — ampiasao raha ahitana olana
help-cmd-history =   .history                     tantaran'ny baiko (kopy mifandimby voaangona)
help-cmd-logout =   .logout                      mivoaka
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Fanampiana — hafatra ──────────────────────────────────────────────────
help-msg-echo =   @alias                       asehoy DID nonadihina (tsy nalefa hafatra)
help-msg-send =   @alias[:verb] body           alefa hafatra / RPC any amin'ny mpilalao
help-msg-fragment =   @alias#fragment[:verb] body  alefa misy DID fragment mazava
help-msg-escape =   \@name                       @name ara-bakiteny (tsy mikaroka anarana fanampiny)

# ── Fanampiana — fomba sain-toerana ──────────────────────────────────────
help-focus-set =   .use @alias [as @name]       manamarika amin'ny mpilalao (manova prompt)
help-focus-clear =   .use                         manala sain-toerana

# ── Fanampiana — fitsipi-teny fikajiana ───────────────────────────────────
help-config-get =   .path                        alao ny sanda ravin-kazo na lisitry ny hazo kely
help-config-filter =   .path value                  efaso fanontaniana (sisivo amin'ny sanda)
help-config-set =   .path: value                 apetraho ny ravin-kazo
help-config-delete =   .path:                       fafao ny ravin-kazo na hazo kely
help-config-verb =   .path!verb [args]            antsoy ny fiasa toerana

# ── Fanampiana — lalan-kely mahazatra ────────────────────────────────────
help-my =   /my                          asehoy ny fikajiana manokana rehetra
help-aliases =   /my/aliases                  lisitra anarana fanampiny
help-aliases-set =   /my/aliases/<name>: <did>    ampiana/havaozina anarana fanampiny (bare DID, tsy misy #fragment)
help-aliases-del =   /my/aliases/<name>:          esorina ny anarana fanampiny
help-runtime-discover =   .ma [port]          ahitana runtime toerana ary mamorona anarana fanampiny @ma
help-runtime-claim =   .ma [port]             alao runtime amin'ny DID anao
help-identity =   /my/identity                 asehoy fikajiana mombamomba
help-identity-did =   /my/identity/did             asehoy ny DID anao (famakiana ihany)
help-identity-publish =   /my/identity!publish @pub    avoaka DID amin'ny serivisy famoahana
help-identity-export =   /my/identity!export          omioty ny vondrona maha-izy ny anao
help-config-path =   .config                      asehoy ny fidirana .config.* rehetra

# ── Fanampiana — boaty fidirana ───────────────────────────────────────────
help-inbox =   /my/inbox                    lisitra boaty fidirana (fijery hazo kely)
help-inbox-n =   /my/inbox/N                  asehoy ny sahan'ny fidirana N
help-inbox-from =   /my/inbox/N/from             DID mpandefitra fidirana N
help-inbox-reply =   /my/inbox/N!reply [body]     alefa valim-pitoriana (misokatra mpandrindra raha tsy misy vatana)
help-inbox-open =   /my/inbox/N!open             misokatra sainy famakiana ihany amin'ny mpandrindra
help-inbox-del =   /my/inbox/N:                 fafao fidirana N
help-inbox-delall =   /my/inbox:                   fafao ny fidirana boaty rehetra
help-inbox-flush =   /my/inbox!flush              ataovy printy fidirana rehetra amin'ny terminal
help-inbox-filter =   /my/inbox!filter @who        asehoy ireo sokajy avy amin'ny @who fotsiny
help-inbox-traverse =   /my/inbox/N/sender/<field>   mandeha antontan-taratasy DID mpandefitra mora moramora

# ── Fanampiana — antontan-taratasy ───────────────────────────────────────
help-doc-edit =   /my/doc/<name>!edit           misokatra mpandrindra misy sainy voatahiry
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     mamoaka CID, misokatra famakiana ihany
help-doc-eval =   /my/doc/<name>!eval           alao ny sainy voatahiry andalana-andro
help-doc-publish =   /my/doc/<name>!publish @pub   tehirizo ho blob tsy voaohatra (karazana rehetra)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  tehirizo YAML ho node IPLD DAG-CBOR
help-doc-fetch =   /my/doc/<name>!fetch <cid>    ampidino sainy CID (tsy naosina)
help-doc-cid =   /my/doc/<name>!cid            asehoy CID voatahiry
help-doc-del =   /my/doc/<name>:              fafao antontan-taratasy

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Fiteny azo ampiasaina (apetraho amin'ny /my/i18n: <code>):
err-lang-not-found = tsy hita ny teny: { $lang }

msg-send-failed = tsy nahomby ny fandefasana: { $e }
msg-not-logged-in = tsy niditra

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Hadisoana YAML: { $e }
yaml-not-mapping = YAML tsy maintsy mapping (sanda: valeur-pair); teny tsotra sy scalar tsy azo voatahiry ho DAG-CBOR
dagcbor-encode-error = Hadisoana DAG-CBOR: { $e }
cbor-decode-error = Hadisoana CBOR: { $e }
cbor-json-error = Hadisoana CBOR→JSON: { $e }
yaml-serialize-error = Hadisoana serialization YAML: { $e }
edit-reply-invalid = Valiny fanavaozana tsy azo
doc-publish-ipld-error = Tsy nisy fivoaran'ny IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Hadisoana fitehirizana fanadiovana mailaka: { $e }
err-config-load = Hadisoana fampidirana: { $e }
err-lang-persist = Hadisoana fitehirizana fiteny: { $e }
err-history-parse = Hadisoana famakiana tantara: { $e }
err-history-load = Hadisoana fampidirana tantara: { $e }
err-ipfs-reply-decode = Tsy nisy fivoaran'ny valiny IPFS: { $e }
err-edit-cbor = Hadisoana CBOR fanavaozana: { $e }
err-popup-blocked = Voasakan'ny navigateur ny popup
status-publishing = mamoaka

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = hadisoana
rpc-error-detail = hadisoana: { $detail }
msg-new-message = ← [{ $from }] hafatra vaovao — { $count } ao amin'ny boaty
msg-chat = { $sender } milaza { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } miteny { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } miditra ao amin'ny efi-trano.
room-leave = * { $name } mivoaka.
room-drop  = * { $name } mamela { $thing } ho lavo.
room-take  = * { $name } mandray { $thing }.
err-edit-decode-failed = fanandramana: tsy nahomby ny fanakambanana: { $e }
err-edit-fetch-failed = fanandramana: tsy nahomby ny faka: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = tsy misy fotoana miasa — tsy azo fafana ny profily
profile-delete-error = tsy nahomby ny famafana profily: { $e }
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
profiles-empty = (tsy misy)
profiles-deleted = profily { $name } nafafa
profiles-not-found = tsy hita ny profily: { $name }

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
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help/url                    fanokafana zion amin'ny rohy URL
help-header-url = ── ampahany URL ─────────────────────────────────────────────────────────────────
help-url-intro =   Zarao rohy hanokafana zion miaraka amin'ny mpandray efa voatondro:
help-url-msg =   ?msg=<did>                   fenoina mialoha: @<did> (hafatra tsotra)
help-url-say =   ?say=<did>                   fenoina mialoha: @<did>:say (matoanteny say)
help-url-emote =   ?emote=<did>                 fenoina mialoha: @<did>:emote (matoanteny emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Fenoina mialoha ny sondrana fa tsy nalefa — tsindrio Enter handefa.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                famoahana ny mombamombao eo amin'ny tambajotra
help-header-publish = ── famoahana mombamomba ─────────────────────────────────────────────────────
help-publish-intro = Ny famoahana dia mahatonga ny mombamombao ho hita eo amin'ny tambajotra. Ny hafa dia afaka mitady ny DID-nao hahafantarany anao.
help-publish-ma = Mba hamoahana, mila ny ma (runtime eo an-toerana) natomboka. Mampifandray ny ego amin'ny IPFS/IPNS ho anao izany.
help-publish-steps = Dingana: ampiasao '.ma [port]' hikaroana ny ma eo an-toerana, ary '/my/identity!publish @ma'.
help-publish-without = Raha tsy voavoaka, tsy afaka mahatratra anao ny hafa — na dia mahalala ny DID-nao aza izy ireo, tsy afaka mamaha ny endpoint-nao.
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = Tsy nahomby ny fandraisana CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID tsy mety: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Fampitandremana: Ny fanalahidinao tsiambaratelon'ny IPNS hateriny amin'ity runtime ity hamoaham-pankamantatra. Ampiasao fotsiny runtime izay itokianao tanteraka.
