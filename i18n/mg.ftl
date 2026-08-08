# zion — Malagasy
lang-name = Malagasy
label-nick = anaram-bositra
new-identity-nick-help = Misafidiana anaram-bositra ho an'ny 間-space. Anaram-bositra fotsiny io ary azo ovaina na oviana na oviana.
error-nick-required = ilaina ny anaram-bositra
error-nick-invalid = tsy mahazo misy elanelana na @ ny anaram-bositra

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
btn-show-qr = asehoy ny QR
btn-scan-qr = jereo ny QR
qr-scan-hint = Atodiho amin'ny kaody QR profily zion ny fakan-tsary.
qr-error-camera = tsy misy fakan-tsary: { $e }
qr-error-too-large = lehibe loatra ho an'ny kaody QR ny profily
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
msg-getting-started = Andramo: say Hello world, look, .help, na help.
msg-connecting = mampifandray amin'ny iroh...
msg-iroh-ready = vonona ny endpoint iroh
msg-iroh-failed = iroh: { $e }
msg-auto-published = Navoaka ny DID amin'alalan'ny 間 eo an-toerana ({ $url })
msg-identity-publication-propagating = Mbola miparitaka ny famoahana ny identity; nahemotra ny entry: { $e }
msg-identity-first-publish = Mamoaka identity voalohany. Mety haharitra hatramin'ny { $seconds } segondra izany.
msg-ma-connecting-matrix = manandrana mampifandray anao amin'ny 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = nalaina ny 間 eo an-toerana
msg-local-ma-already-claimed = efa nalaina ny 間 eo an-toerana
msg-local-ma-claim-failed = tsy nahomby ny fakana ny 間 eo an-toerana
msg-identity-not-published = Tsy hita ny mombamomba amin'ny internet — raha efa napetraka ny 間 eo an-toerana, ampiasao '.ma [port]' ary '.my.identity!publish @ma'. Soraty '.help/publish' ho an'ny antsipiriany.
msg-blocked = ⊗ voasakana [{ $cap }]: { $from }
msg-focus-cleared = voafafa ny sain-toerana
msg-left = left
msg-focusing = manamarika { $did } ho { $prompt }
msg-set = { $path }: { $value }
msg-deleted = voafafa { $path } ({ $count } fidirana)
msg-read-only = { $path } dia famakiana ihany
msg-subtree-set = { $path } dia hazo kely; nandà ny hametraka
msg-ancestor-leaf = razamben'ny { $path } dia ravin-kazo; nandà ny hanapoka
msg-key-not-found = tsy hita ny fanalahidy: { $path }
msg-link-not-connected = hadisoana fetching rohy: tsy mifandray
msg-link-fetch-error = hadisoana fetching rohy: { $e }
msg-link-key-not-found = tsy hita ny fanalahidy `{ $key }` ao amin'ny antontan-taratasy mifandray

# ── Fanamarinana anarana fanampiny ─────────────────────────────────────────
err-alias-name-empty = tsy afaka ho foana ny anarana fanampiny
err-alias-has-dot = ny anarana fanampiny dia tsy afaka misy '.'
err-alias-has-fragment = ny anarana fanampiny dia tsy afaka misy '#'
err-alias-value-fragment = ny sanda fanampiny dia afaka manana fragment DID-URL iray tsy foana farafahabetsany
err-alias-value-path = ny sanda fanampiny dia tsy maintsy did:ma:<ipns> DID na DID-URL (tsy misy path)
err-alias-not-did = ny sanda fanampiny dia tsy maintsy manomboka amin'ny did:ma:
err-unknown-alias = anarana fanampiny tsy fantatra: @{ $name }
err-bare-did = nandry bare did:ma:<ipns> (tsy misy fragment na path), nahazo { $did }

# ── Mpandrindra ───────────────────────────────────────────────────────────
btn-save = tehirizo
btn-eval = alao
btn-cancel = foano
msg-jobs-cancelled = nofoanana ny asa
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
discover-hint-endpoint-not-found = Torohevitra: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Torohevitra: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Torohevitra: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Torohevitra: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 hita tao amin'ny { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   voaforona ny alias @ma — ampiasao '.my.identity!publish @ma' hamoaka ny mombamombao.
claim-success = Runtime nalainy ho an'ny { $did }
claim-conflict = Runtime efa nalainy mombamomba hafa
claim-already-owned = Efa nalain'ity mombamomba ity ny Runtime
claim-http-failed = fangatahana tsy nahomby: HTTP { $status }
claim-error = fangatahana tsy nahomby: { $e }
claim-no-session = tsy niditra; miditra aloha mba halainy runtime
runtime-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }

# ── Fiasa — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl novàna (misokatra tanteraka)
acl-persist-error = hadisoana fitahirizana: { $e }
acl-no-verb = tsy misy fiasa `{ $verb }` ho an'ny .my.acl

# ── Fiasa — mombamomba ────────────────────────────────────────────────────
publish-usage = fampiasana: .my.identity!publish <did-na-anarana-fanampiny>
identity-exported = Nampidina ny vondrona ho { $filename }
identity-export-failed = Tsy nahomby ny fanondranana: { $e }

# ── Fiasa — antontan-taratasy ─────────────────────────────────────────────
doc-content-empty = { $path }.content foana
doc-save-first = { $path }.content foana — tehirizo aloha
doc-missing-name = anarana antontan-taratasy tsy hita
doc-publish-usage = fampiasana: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = fampiasana: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = famoahana { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = famoahana tsy nahomby [{ $code }]: { $err }
doc-publish-error-hint = Torohevitra: { $hint }
doc-publish-hint-session = midira indray mba ahafahan'i ego miditra amin'ny fanalahidin'ny mombamomba anao
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = manamarina fa navoaka ny antontan-taratasin'ny mpanonta DID ary misy teboka farany azo tratrarina
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = Nolavin'ny runtime/plugin ny fangatahana; diniho ny antony ary andramo indray aorian'ny fanamboarana ny entity / runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = jereo ny diarin'ny fotoam-pivoriana mba hahitana antony amin'ny antsipiriany ary andramo indray
doc-store-sent = fangatahana fitahirizana nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-ipld-store-sent = fangatahana fitahirizana IPLD nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-fetch-done = voaaka { $cid } → { $path }.content (tsy naosina)
doc-fetch-failed = fetching { $cid }: { $e }
doc-fetch-usage = fampiasana: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid tsy voapetraka
doc-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }
path-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }

# ── Fanampiana — lohateny ─────────────────────────────────────────────────
help-header-zion = ── baiko zion ─────────────────────────────────────────────────────────────
help-header-messaging = ── hafatra ───────────────────────────────────────────────────────────────
help-header-config = ── fitsipi-teny fikajiana toerana ────────────────────────────────────────
help-header-common = ── lalan-kely mahazatra ──────────────────────────────────────────────────
help-header-inbox = ── boaty fidirana ──────────────────────────────────────────────────────────
help-header-documents = ── antontan-taratasy ────────────────────────────────────────────────────
help-header-i18n = ── fiteny ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── miditra 間-space ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Fanampiana — baiko zion ───────────────────────────────────────────────
help-cmd-help =   .help                        lahatsoratra ity
help-cmd-clear =   .clear                       manadio terminal
help-cmd-panic =   .panic                       fanalana farany — ampiasao raha ahitana olana
help-cmd-history =   .history                     tantaran'ny baiko (kopy mifandimby voaangona)
help-cmd-logout =   .logout                      mivoaka
help-cmd-batch =   .batch                       évaluer le document brouillon en parallèle
help-cmd-batch-sync =   .batch:sync / .batch         évaluer le document brouillon ligne par ligne

# ── Fanampiana — hafatra ──────────────────────────────────────────────────
help-msg-echo =   @alias                       asehoy DID/DID-URL voavaha (tsy misy hafatra alefa)
help-msg-send =   @alias!msg body / @alias:verb args           alefa hafatra / RPC any amin'ny mpilalao
help-msg-fragment =   @alias#fragment:verb body  alefa misy DID fragment mazava
help-msg-escape =   \@name                       @name ara-bakiteny (tsy mikaroka anarana fanampiny)

# ── Fanampiana — fomba sain-toerana ──────────────────────────────────────

# ── Fanampiana — fitsipi-teny fikajiana ───────────────────────────────────
help-config-get =   .path                        alao ny sanda ravin-kazo na lisitry ny hazo kely
help-config-set =   .path: value                 apetraho ny ravin-kazo
help-config-delete =   .path:                       fafao ny ravin-kazo na hazo kely
help-config-verb =   .path!verb [args]            antsoy ny fiasa toerana

# ── Fanampiana — lalan-kely mahazatra ────────────────────────────────────
help-my =   .my                          asehoy ny fikajiana manokana rehetra
help-aliases =   .my.aliases                  lisitra anarana fanampiny
help-aliases-set =   .my.aliases.<name>: <did-url>    ampiana/havaozina anarana fanampiny (DID na DID-URL)
help-aliases-del =   .my.aliases.<name>:          esorina ny anarana fanampiny
help-runtime-discover =   .ma [port]          ahitana runtime toerana ary mamorona anarana fanampiny @ma
help-runtime-claim =   .ma [port]             alao runtime amin'ny DID anao
help-identity =   .my.identity                 asehoy fikajiana mombamomba
help-identity-did =   .my.identity.did             asehoy ny DID anao (famakiana ihany)
help-identity-publish =   .my.identity!publish @pub    avoaka DID amin'ny serivisy famoahana
help-identity-export =   .my.identity!export          omioty ny vondrona maha-izy ny anao
help-config-path =   .config                      asehoy ny fidirana .config.* rehetra

# ── Fanampiana — boaty fidirana ───────────────────────────────────────────
help-inbox =   .my.inbox                    lisitra boaty fidirana (fijery hazo kely)
help-inbox-n =   .my.inbox.N                  asehoy ny sahan'ny fidirana N
help-inbox-from =   .my.inbox.N.from             DID mpandefitra fidirana N
help-inbox-reply =   .my.inbox.N!reply [body]     alefa valim-pitoriana (misokatra mpandrindra raha tsy misy vatana)
help-inbox-open =   .my.inbox.N!open             misokatra sainy famakiana ihany amin'ny mpandrindra
help-inbox-del =   .my.inbox.N:                 fafao fidirana N
help-inbox-delall =   .my.inbox:                   fafao ny fidirana boaty rehetra
help-inbox-flush =   .my.inbox!flush              ataovy printy fidirana rehetra amin'ny terminal
help-inbox-filter =   .my.inbox!filter @who        asehoy ireo sokajy avy amin'ny @who fotsiny
help-inbox-traverse =   .my.inbox.N.sender.<field>   mandeha antontan-taratasy DID mpandefitra mora moramora

# ── Fanampiana — antontan-taratasy ───────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           misokatra mpandrindra misy sainy voatahiry
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     mamoaka CID, misokatra famakiana ihany
help-doc-eval =   .my.doc.<name>!eval           alao ny sainy voatahiry andalana-andro
help-doc-publish =   .my.doc.<name>!publish @pub   tehirizo ho blob tsy voaohatra (karazana rehetra)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  tehirizo YAML ho node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    ampidino sainy CID (tsy naosina)
help-doc-cid =   .my.doc.<name>!cid            asehoy CID voatahiry
help-doc-del =   .my.doc.<name>:              fafao antontan-taratasy

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n dia mitahiry ny safidin'ny fiteny mifamatotra amin'ny mombamomba anao.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               mitanisa kaody fiteny misy

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Ny efitra 間 dia habaka eo anelanelan’ny maha-izy 間. ma no mampifandray ireo maha-izy ireo sy mampiresaka azy; rehefa voapetraka ampahibemaso ny maha-izy anao dia afaka mandray anjara ianao.
help-ma-command =   .ma [port]                   mifandraisa amin’ny 間 runtime eo an-toerana, vakio /status.json, ary tehirizo .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     avoahy ny antontan-taratasy DID-nao mba hahitan’ny hafa ny fanalahidy sy endpoint-nao
help-ma-security = Ny sisin’ny fitokisana mazava indrindra dia ny 間 runtime anao manokana miaraka amin’ny IPFS Desktop/Kubo anao. Mety hanampy ny publisher lavitra, saingy miankina amin’ny serivisin’olon-kafa ianao amin’izay.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             fomba hidirana ao amin’ny efitra 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Rehefa fantatra ny maha-izy anao, .enter @ma dia mamela anao hiditra ao amin’ny 間. Mitadiava tontolo, midira ao, ary mandraisa anjara avy eo.
help-ma-entry-steps = Alefaso IPFS Desktop sy ma, avy eo alefaso .ma. Avoahy amin’ny .my.identity!publish @ma, mitadiava tontolo, ary midira amin’ny .enter @ma.
help-ma-entry-command =   .enter @ma                  midira ao amin’ny 間 amin’ny alalan’ny @ma runtime
help-ma-entry-toggle =   .enter                       alefaso na vonoy ny fifantohana amin’ny efitra; mbola mavitrika ny maha-izy anao
help-ma-entry-url =   ?enter=<runtime>             midira aorian’ny login avy amin’ny URL nozaraina

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Fiteny azo ampiasaina (apetraho amin'ny .my.i18n: <code>):
err-lang-not-found = tsy hita ny teny: { $lang }

msg-send-failed = tsy nahomby ny fandefasana: { $e }
msg-not-logged-in = tsy niditra

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Hadisoana YAML: { $e }
yaml-not-mapping = YAML tsy maintsy mapping (sanda: valeur-pair); teny tsotra sy scalar tsy azo voatahiry ho DAG-CBOR
dagcbor-encode-error = Hadisoana DAG-CBOR: { $e }
cbor-decode-error = Hadisoana CBOR: { $e }
cbor-json-error = Hadisoana CBOR→JSON: { $e }
yaml-serialise-error = Hadisoana serialisation YAML: { $e }
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
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = nafenina ny profil ary nalefa tany amin'ny IPFS; havaozina ny antontan-taratasy DID rehefa tonga ny CID
profile-publish-done = navoaka ny profil — nohavaozina tamin'ny ma.agent CID ny antontan-taratasy DID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = efa navoaka ny mombamomba azy — ny mombamomba azy hatramin'izao
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = atiny binary (tsy aseho)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (tsy misy)
profiles-deleted = profily { $name } nafafa
profiles-not-found = tsy hita ny profily: { $name }

# -- Help topics index
help-header-topics = -- sujets -- tapez .help/<topic> pour les détails
help-topic-msg =   .help/msg                    messagerie
help-topic-ma = .help/ma                     間-space, famoahana ary fidirana
help-topic-path = .help/path                   fitsipi-pitenenana teboka-dalana eo an-toerana
help-topic-my =   .help/my                     config personnelle
help-topic-inbox =   .help/inbox                  boîte de réception
help-topic-doc =   .help/doc                    antontan-taratasy
help-topic-actor =   .help/actor                  acteur distant
help-topic-zscheme =   .help/zscheme               fanehoana Scheme anaty andalana sy tahiry
help-unknown-topic =   .help/{ $topic }: sujet inconnu

# -- Help actor section
help-header-actor = -- acteurs distants
help-actor-echo =   @actor                       afficher le DID résolu
help-actor-text = @actor[#entity]!msg|!say|!emote body         mandefa hafatra mivantana/chat/emote
help-actor-ping = @actor:ping                  fiainana ping
help-actor-entities =   @actor/entities              lister les entités
help-actor-entities-get = @actor/entities/<n>          mahazo node entity
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     modifier l’entité
help-actor-entities-del = @actor/entities/<n>:         vonoy entity
help-actor-config-get =   @actor/config/<key>          obtenir la valeur de config
help-actor-config-set =   @actor/config/<key>: val     définir la valeur de config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              modifier ACL
help-actor-fragment =   @actor#entity                envoyer au plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC vers le plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  mitazona valiny 5 ao amin'ny tontolon'ny session
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    fanokafana zion amin'ny rohy URL
help-topic-i18n = .help/i18n                   safidin'ny fiteny amin'ny maha-ianao anao
help-header-url = ── ampahany URL ─────────────────────────────────────────────────────────────────
help-url-intro =   Zarao rohy hanokafana zion miaraka amin'ny mpandray efa voatondro:
help-url-msg =   ?msg=<did>                   fenoina mialoha: @<did>!msg (hafatra tsotra)
help-url-say =   ?say=<did>                   fenoina mialoha: @<did>!say (matoanteny say)
help-url-emote =   ?emote=<did>                 fenoina mialoha: @<did>!emote (matoanteny emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             miditra ny tontolon'ny runtime aorian'ny fidirana
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Fenoina mialoha ny sondrana fa tsy nalefa — tsindrio Enter handefa.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                famoahana ny mombamombao eo amin'ny tambajotra
help-header-publish = ── famoahana mombamomba ─────────────────────────────────────────────────────
help-publish-intro = Ny famoahana dia mahatonga ny mombamombao ho hita eo amin'ny tambajotra. Ny hafa dia afaka mitady ny DID-nao hahafantarany anao.
help-publish-ma = Mba hamoahana, mila ny 間 (runtime eo an-toerana) natomboka. Mampifandray ny ego amin'ny IPFS/IPNS ho anao izany.
help-publish-steps = Dingana: ampiasao '.ma [port]' hikaroana ny ma eo an-toerana, ary '.my.identity!publish @ma'.
help-publish-without = Raha tsy voavoaka, tsy afaka mahatratra anao ny hafa — na dia mahalala ny DID-nao aza izy ireo, tsy afaka mamaha ny endpoint-nao.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = lazao ny anaran'ny profil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Manangona batch — karazana baiko, mifarana amin'ny .batch
batch-already-collecting = Efa nanangona andiany iray — faranana amin'ny .batch aloha
batch-empty = Foana ny batch — tsy misy azo atao
batch-running = Exécution du batch…
batch-step-timeout = lany ny dingana batch

batch-done = Batch terminé en { $secs }s — { $steps } étapes
batch-done-error = Batch terminé avec erreurs en { $secs }s — { $steps } étapes
msg-timeout = Message expiré (aucune réponse en 60s)
err-unknown-command = baiko tsy fantatra: { $path }
err-read-only-path = { $path } dia vakiana fotsiny
help-cmd-batch-async =   .batch:async / .batch        évaluer le document brouillon en parallèle


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Tsy nahomby ny fandraisana CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID tsy mety: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Fampitandremana: Ny fanalahidinao tsiambaratelon'ny IPNS hateriny amin'ity runtime ity hamoaham-pankamantatra. Ampiasao fotsiny runtime izay itokianao tanteraka.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme manombana fanehoana Scheme tafiditra ao amin’ny baikon’i zion ary mampiditra ny valiny ao amin’ilay andalana alohan’ny handefasana azy.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ohatra anaty andalana; mandefa "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             mitoetra mandritra ny fidirana ankehitriny ny famaritana
help-zscheme-doc = Tahiry: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Gateway IPFS eo an-toerana (mila fanamelohana browser)

tab-config = Filaminana
label-gateway = gateway
