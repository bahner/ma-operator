# zion — Malagasy
lang-name = Malagasy

# ── Pejy fidirana ─────────────────────────────────────────────────────────
tab-login = miditra
tab-new-identity = mombamomba vaovao
tab-import = mampiditra
label-passphrase = teny miafina
label-username = anarana mpampiasa
label-confirm-passphrase = hamafiso ny teny miafina
btn-login = miditra
btn-export = mamoaka
btn-generate = mamorona
passphrase-warning = Very ny teny miafina = very ny mombamomba. Tsy misy famerenana.
import-help = Safidio ny rakitra .zion.json novoahina. Ny fonosana dia mitoetra voamboasakana.
status-unlocking = mivoha...
status-generating = mamorona mombamomba...
status-reading-file = mamaky rakitra...
status-imported = nampidirina '{ $name }' — mifindra amin'ny tab fidirana
error-wrong-passphrase = teny miafina diso: { $e }
error-identity-not-found = tsy hita ny mombamomba '{ $name }'
error-username-required = anarana mpampiasa ilaina
error-passphrase-required = teny miafina ilaina
error-passphrases-no-match = ny teny miafina roa dia tsy mitovy

# ── Hafatry ny rafitra terminal ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — niditra amin'ny { $username }
msg-type-help = Soraty .help mba hahazo lisitry ny baiko.
msg-connecting = mampifandray amin'ny iroh...
msg-iroh-ready = vonona ny endpoint iroh
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = valim-pitoriana nalefa
msg-reply-failed = valim-pitoriana tsy nahomby: { $e }
msg-entity-publish-sent = entity { $name }: nalefa ny famoahana
msg-entity-publish-failed = famoahana entity tsy nahomby: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: nalefa ny famoahana
msg-field-publish-failed = famoahana sahan-kevitra tsy nahomby: { $e }
msg-acl-publish-sent = runtime ACL: nalefa ny famoahana
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

# ── Fiasa — fotoana fiasan'ny runtime ─────────────────────────────────────
discover-fetch-failed = tsy nahomby ny fikarohana tao amin'ny { $url }: { $e }
discover-json-error = tsy nahomby ny fikarohana: JSON diso avy amin'ny { $url }: { $e }
discover-missing-did = tsy nahomby ny fikarohana: status.json tsy manana saha `did`
discover-invalid-did = tsy nahomby ny fikarohana: `did` dia tsy maintsy manomboka amin'ny did:ma:, nahazo `{ $did }`
discover-no-endpoint = fampitandremana fikarohana: `endpoint_id` tsy hita ao amin'ny status.json; DID ihany no voatahiry
discover-success = ma hita tao amin'ny { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   anarana fanampiny @ma noforonina — havoaka amin'ny: .my.identity:publish @ma
claim-success = Runtime nalainy ho an'ny { $did }
claim-conflict = Runtime efa nalainy mombamomba hafa
claim-http-failed = fangatahana tsy nahomby: HTTP { $status }
claim-error = fangatahana tsy nahomby: { $e }
claim-no-session = tsy niditra; miditra aloha mba halainy runtime
runtime-no-verb = tsy misy fiasa `{ $verb }` ho an'ny { $path }

# ── Fiasa — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl novàna (misokatra tanteraka)
acl-persist-error = hadisoana fitahirizana: { $e }
acl-no-verb = tsy misy fiasa `{ $verb }` ho an'ny .my.acl

# ── Fiasa — mombamomba ────────────────────────────────────────────────────
publish-usage = fampiasana: .my.identity:publish <did-na-anarana-fanampiny>

# ── Fiasa — antontan-taratasy ─────────────────────────────────────────────
doc-content-empty = { $path }.content foana
doc-save-first = { $path }.content foana — tehirizo aloha
doc-missing-name = anarana antontan-taratasy tsy hita
doc-publish-usage = fampiasana: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = fampiasana: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = famoahana { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = fangatahana fitahirizana nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-ipld-store-sent = fangatahana fitahirizana IPLD nalefa ({ $id }) → { $publisher }; CID ho tonga amin'ny valim-pitoriana RPC
doc-fetch-done = voaaka { $cid } → { $path }.content (tsy naosina)
doc-fetch-failed = fetching { $cid }: { $e }
doc-fetch-usage = fampiasana: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid tsy voapetraka
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
help-cmd-logout =   .logout                      mivoaka

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
help-config-verb =   .path:verb [args]            antsoy ny fiasa toerana

# ── Fanampiana — lalan-kely mahazatra ────────────────────────────────────
help-my =   .my                          asehoy ny fikajiana manokana rehetra
help-aliases =   .my.aliases                  lisitra anarana fanampiny
help-aliases-set =   .my.aliases.<name>: <did>    ampiana/havaozina anarana fanampiny (bare DID, tsy misy #fragment)
help-aliases-del =   .my.aliases.<name>:          esorina ny anarana fanampiny
help-runtime-discover =   .my.ma:discover          ahitana runtime toerana ary mamorona anarana fanampiny @ma
help-runtime-claim =   .my.ma:claim             alao runtime amin'ny DID anao
help-identity =   .my.identity                 asehoy fikajiana mombamomba
help-identity-did =   .my.identity.did             asehoy ny DID anao (famakiana ihany)
help-identity-publish =   .my.identity:publish @pub    avoaka DID amin'ny serivisy famoahana
help-config-path =   .config                      asehoy ny fidirana .config.* rehetra

# ── Fanampiana — boaty fidirana ───────────────────────────────────────────
help-inbox =   .my.inbox                    lisitra boaty fidirana (fijery hazo kely)
help-inbox-n =   .my.inbox.N                  asehoy ny sahan'ny fidirana N
help-inbox-from =   .my.inbox.N.from             DID mpandefitra fidirana N
help-inbox-reply =   .my.inbox.N:reply [body]     alefa valim-pitoriana (misokatra mpandrindra raha tsy misy vatana)
help-inbox-open =   .my.inbox.N:open             misokatra sainy famakiana ihany amin'ny mpandrindra
help-inbox-del =   .my.inbox.N:                 fafao fidirana N
help-inbox-delall =   .my.inbox:                   fafao ny fidirana boaty rehetra
help-inbox-flush =   .my.inbox:flush              ataovy printy fidirana rehetra amin'ny terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   mandeha antontan-taratasy DID mpandefitra mora moramora

# ── Fanampiana — antontan-taratasy ───────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           misokatra mpandrindra misy sainy voatahiry
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     mamoaka CID, misokatra famakiana ihany
help-doc-eval =   .my.doc.<name>:eval           alao ny sainy voatahiry andalana-andro
help-doc-publish =   .my.doc.<name>:publish @pub   tehirizo ho blob tsy voaohatra (karazana rehetra)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  tehirizo YAML ho node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    ampidino sainy CID (tsy naosina)
help-doc-cid =   .my.doc.<name>:cid            asehoy CID voatahiry
help-doc-del =   .my.doc.<name>:              fafao antontan-taratasy

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Fiteny azo ampiasaina (apetraho amin'ny .my.i18n: <code>):
err-lang-not-found = tsy hita ny teny: { $lang }
