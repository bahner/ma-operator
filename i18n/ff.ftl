# zion — Pulaar / Fulfulde
lang-name = Fulfulde

# ── Hello ngenndan ────────────────────────────────────────────────────────
tab-login = naatna
tab-new-identity = ɗemngal keso
tab-import = nawtu dow
label-passphrase = daande sirlu
label-username = innde jeyɗo
label-confirm-passphrase = sikkina daande sirlu
btn-login = naatna
btn-export = yaltina
btn-generate = hobbaade
passphrase-warning = Janfude daande sirlu = janfude ɗemngal. Taa ɗon rewaade.
import-help = Suɓo fayle .zion.json yi'aaɗo. Fonosandi foti hesɓinde sirlu.
status-unlocking = uddude...
status-generating = hobbaade ɗemngal...
status-reading-file = jannude fayle...
status-imported = '{ $name }' nawtoɗo — yah e tab naatna
error-wrong-passphrase = daande sirlu haalii ko haanaaka: { $e }
error-identity-not-found = ɗemngal '{ $name }' tawaaka
error-username-required = innde jeyɗo waɗii ko haanaaka
error-passphrase-required = daande sirlu waɗii ko haanaaka
error-passphrases-no-match = daanɗe sirlu ɗiɗi ɗen njeytaaki

# ── Koɗe nii'am terminal ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — naatɗo ko { $username }
msg-type-help = Winndita .help tawa hisɗaa dabaaji yimɓe.
msg-connecting = wonde iroh...
msg-iroh-ready = iroh endpoint hebii
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Mum jeyaa ko yahi e wuro ka jokkondiri — waddu '.my.identity:publish @ma' nde ngon kaaɗitii.
msg-blocked = ⊗ haɗaa [{ $cap }]: { $from }
msg-focus-cleared = nelaande dellaama
msg-focusing = nelitaade { $did } haa { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } dellaama ({ $count } jottaandi)
msg-read-only = { $path } e jannde tan
msg-subtree-set = { $path } aawre; haɗaa mbelaade
msg-ancestor-leaf = woɗɓe { $path } ko leehol; haɗaa naatde dow
msg-key-not-found = keblal tawaaka: { $path }
msg-no-match = huunde eɓitaaki
msg-link-not-connected = juumre downloading ɗannol: wondaaka
msg-link-fetch-error = juumre downloading ɗannol: { $e }
msg-link-key-not-found = keblal `{ $key }` tawaaka e takka ɗannol

# ── Falaare ɗemngal ───────────────────────────────────────────────────────
err-alias-name-empty = innde hesbu taa fotde luuro
err-alias-has-dot = innde hesbu taa fotde '.'
err-alias-has-fragment = innde hesbu taa fotde '#'
err-alias-value-fragment = njamu hesbu fotde bare did:ma:<ipns> (yimɓe fragment)
err-alias-value-path = njamu hesbu fotde bare did:ma:<ipns> (yimɓe path)
err-alias-not-did = njamu hesbu fotde fuɗɗoraade did:ma:
err-unknown-alias = hesbu ɓurnataa: @{ $name }
err-bare-did = bare did:ma:<ipns> laanaama (yimɓe fragment walla path), tawi { $did }

# ── Winndirɗe ─────────────────────────────────────────────────────────────
btn-save = mooftu
btn-eval = hoore
btn-cancel = yooro
btn-close = uddude
btn-reply = jaabii
btn-publish = yettin
btn-publish-ipld = yettin IPLD
msg-reply-sent = jaabiri nawnaaɗo
msg-reply-failed = jaabiri haaɗaaka: { $e }
msg-entity-publish-sent = entity { $name }: yettinde nawnaaɗo
msg-entity-publish-failed = yettinde entity haaɗaaka: { $e }
msg-kind-publish-failed = juuɗe ngal waaɓaani: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: yettinde nawnaaɗo
msg-field-publish-failed = yettinde leehol haaɗaaka: { $e }
msg-acl-publish-sent = runtime ACL: yettinde nawnaaɗo
msg-crud-edit-publish-sent = { $path }: yettinde nawnaaɗo
msg-acl-publish-failed = yettinde runtime ACL haaɗaaka: { $e }
msg-yaml-error = juumre YAML: { $e }
msg-editor-saved = { $path }:mooftu
msg-fetch-review = { $cid } heɓaama — en neɓɓoo ɓaawo yannde
msg-fetch-failed = heɓtude { $cid }: { $e }

# ── Baɗe — burro naatna ───────────────────────────────────────────────────
inbox-empty = burro naatna luuɗi
inbox-entry-not-found = jottaandi burro { $n } tawaaka
inbox-no-message-id = jottaandi burro { $n } alaa message_id
inbox-no-verb = baɗe `{ $verb }` jottaandi burro { $n } alaa

# ── Baɗe — sahaa runtime ──────────────────────────────────────────────────
discover-fetch-failed = yiytaade haaɗaaka e { $url }: { $e }
discover-json-error = yiytaade haaɗaaka: JSON ɓurii haa ko woɗɗi e { $url }: { $e }
discover-missing-did = yiytaade haaɗaaka: status.json alaa `did`
discover-invalid-did = yiytaade haaɗaaka: `did` fotde fuɗɗoraade did:ma:, tawi `{ $did }`
discover-no-endpoint = kaaɗto yiytaade: `endpoint_id` tawaaka e status.json; DID tan mooftaama
discover-success = ma yiytaama e { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   hesbu @ma hobbinaama — yettin e: .my.identity:publish @ma
claim-success = Runtime ɗaɓɓaama ko { $did }
claim-conflict = Runtime ɗaɓɓaa ko ɗemngal goɗngal
claim-http-failed = gollal haaɗaaka: HTTP { $status }
claim-error = gollal haaɗaaka: { $e }
claim-no-session = naataaka wano; naatna ɓaawo ɗaɓɓude runtime
runtime-no-verb = baɗe `{ $verb }` { $path } alaa

# ── Baɗe — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl happaama caggal (udditaa haa timmi)
acl-persist-error = juumre mooftude: { $e }
acl-no-verb = baɗe `{ $verb }` .my.acl alaa

# ── Baɗe — ɗemngal ───────────────────────────────────────────────────────
publish-usage = golle: .my.identity:publish <did-walla-hesbu>

# ── Baɗe — takka ─────────────────────────────────────────────────────────
doc-content-empty = { $path }.content luuɗi
doc-save-first = { $path }.content luuɗi — mooftu ɓaawo
doc-missing-name = innde takka tawaaka
doc-publish-usage = golle: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = golle: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = yettinde { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = gollal mooftude nawnaaɗo ({ $id }) → { $publisher }; CID ara e jaabiri RPC
doc-ipld-store-sent = gollal mooftude IPLD nawnaaɗo ({ $id }) → { $publisher }; CID ara e jaabiri RPC
doc-fetch-done = { $cid } heɓaama → { $path }.content (hooraaka)
doc-fetch-failed = heɓtude { $cid }: { $e }
doc-fetch-usage = golle: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid mooɓtaaka
doc-no-verb = baɗe `{ $verb }` { $path } alaa
path-no-verb = baɗe `{ $verb }` { $path } alaa

# ── Ballal — kanngol ──────────────────────────────────────────────────────
help-header-zion = ── dabaaji zion ────────────────────────────────────────────────────────────
help-header-messaging = ── winnditaade ───────────────────────────────────────────────────────────
help-header-focus = ── nelaandu ──────────────────────────────────────────────────────────────
help-header-config = ── naawre-daande tiiɗnde ──────────────────────────────────────────────────
help-header-common = ── laabi caggal ──────────────────────────────────────────────────────────
help-header-inbox = ── burro naatna ───────────────────────────────────────────────────────────
help-header-documents = ── takka ────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Ballal — dabaaji zion ─────────────────────────────────────────────────
help-cmd-help =   .help                        deftere ndee
help-cmd-clear =   .clear                       yaltina terminal
help-cmd-panic =   .panic                       laawol ɓurno — faala e nder nafoore
help-cmd-history =   .history                     taariki juurde (laawol dow dow ɗiɗi nde fiilata)
help-cmd-logout =   .logout                      yalta

# ── Ballal — winnditaade ──────────────────────────────────────────────────
help-msg-echo =   @alias                       hollu DID tuugniingal (koɗe nanndinkaaka)
help-msg-send =   @alias[:verb] body           nawtu koɗe / RPC e actor
help-msg-fragment =   @alias#fragment[:verb] body  nawtu e DID fragment baɗaaɗo
help-msg-escape =   \@name                       @name haqiiqaajo (yiytude hesbu alaa)

# ── Ballal — nelaandu ─────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       nelita actor (prompt ɓettoto)
help-focus-clear =   .use                         yaltina nelaandu

# ── Ballal — naawre-daande ────────────────────────────────────────────────
help-config-get =   .path                        heɓ njamu leehol walla listal aawre
help-config-filter =   .path value                  gollal muɓɓinɗe (yiytude e njamu)
help-config-set =   .path: value                 weel leehol
help-config-delete =   .path:                       yaltina leehol walla aawre
help-config-verb =   .path:verb [args]            noddu baɗe tiiɗnde

# ── Ballal — laabi caggal ─────────────────────────────────────────────────
help-my =   .my                          hollu poti fikaji neɗɗaagu
help-aliases =   .my.aliases                  listal hesbu
help-aliases-set =   .my.aliases.<name>: <did>    tottiri/hollintu hesbu (bare DID, alaa #fragment)
help-aliases-del =   .my.aliases.<name>:          yaltina hesbu
help-runtime-discover =   .my.ma:discover          yiytude runtime tiiɗnde e hobbaade hesbu @ma
help-runtime-claim =   .my.ma:claim             ɗaɓɓude runtime DID maa
help-identity =   .my.identity                 hollu fikaji neɗɗaagu
help-identity-did =   .my.identity.did             hollu DID maa (jannde tan)
help-identity-publish =   .my.identity:publish @pub    yettin DID e batu yettindengal
help-config-path =   .config                      hollu jottaadi .config.* fof

# ── Ballal — burro naatna ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    listal burro naatna (hollirde aawre)
help-inbox-n =   .my.inbox.N                  hollu leehol jottaandi N
help-inbox-from =   .my.inbox.N.from             DID nawnooɗo jottaandi N
help-inbox-reply =   .my.inbox.N:reply [body]     nawtu jaabiri (uddita winndirde so alaa gollal)
help-inbox-open =   .my.inbox.N:open             uddita mbeɗe jannde tan e winndirde
help-inbox-del =   .my.inbox.N:                 yaltina jottaandi N
help-inbox-delall =   .my.inbox:                   yaltina jottaandi burro fof
help-inbox-flush =   .my.inbox:flush              winndita jottaandi fof e terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   laato takka DID nawnooɗo garol garol

# ── Ballal — takka ───────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           uddita winndirde e mbeɗe mooƒtaaɗo
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     heɓta CID, uddita jannde tan
help-doc-eval =   .my.doc.<name>:eval           hoora mbeɗe mooƒtaaɗo saɗeere e saɗeere
help-doc-publish =   .my.doc.<name>:publish @pub   mooftu wano blob daneewal (kala sifordu)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  mooftu YAML wano node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    keɓta mbeɗe CID (hooraaka)
help-doc-cid =   .my.doc.<name>:cid            hollu CID mooƒtaaɗo
help-doc-del =   .my.doc.<name>:              yaltina takka

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Haɓɓe ndiyam goɗɗi (sett na .my.i18n: <code>):
err-lang-not-found = hakkunde yolaani: { $lang }

msg-send-failed = neldungal walaa: { $e }
msg-not-logged-in = naatnaaki

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Juulnde YAML: { $e }
yaml-not-mapping = YAML waawi jeyeede mapping (keɓi: maanotooɓe); maango fof woo kulol DAG-CBOR
dagcbor-encode-error = Juulnde DAG-CBOR: { $e }
cbor-decode-error = Juulnde CBOR: { $e }
cbor-json-error = Juulnde CBOR→JSON: { $e }
yaml-serialize-error = Juulnde YAML: { $e }
edit-reply-invalid = Jaabu winndi feewi
doc-publish-ipld-error = Winndude IPLD ñaawonaaki: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Juulnde innde gooto: { $e }
err-config-load = Juulnde heɓtude: { $e }
err-lang-persist = Juulnde wolde: { $e }
err-history-parse = Juulnde taariika: { $e }
err-history-load = Juulnde heɓtude taariika: { $e }
err-ipfs-reply-decode = Juulnde IPFS: { $e }
err-edit-cbor = Juulnde CBOR: { $e }
err-popup-blocked = Wannde ñalaaɗe jaabii
status-publishing = fallude

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = juumre
rpc-error-detail = juumre: { $detail }
msg-new-message = ← [{ $from }] tinndi kesu — { $count } e ndema
err-edit-decode-failed = taƴre: juumre waɗde welngo: { $e }
err-edit-fetch-failed = taƴre: juumre heɓde: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = alaa setoore jeyaare — profil waawataa jooɓaade
profile-delete-error = feccere profil walaa: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (hay)
profiles-deleted = profil { $name } jooɓaama
profiles-not-found = profil {$name} walaa: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor:entities              list entities
help-actor-entities-get =   @actor:entities.<n>          get entity
help-actor-entities-set =   @actor:entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor:entities.<n>:edit     edit entity
help-actor-entities-del =   @actor:entities.<n>:         delete entity
help-actor-config-get =   @actor:config.<key>          get config value
help-actor-config-set =   @actor:config.<key>: val     set config value
help-actor-acl =   @actor:acl                   get ACL
help-actor-acl-edit =   @actor:acl:edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    udditde zion e nder togol URL
help-header-url = ── kaaɗe URL ────────────────────────────────────────────────────────────────────
help-url-intro =   Neltir togol udditde zion e jibinirde njemiraande:
help-url-msg =   ?msg=<did>                   ara-ɓulla: @<did> (tiiɗnde yooltii)
help-url-say =   ?say=<did>                   ara-ɓulla: @<did>:say (haala say)
help-url-emote =   ?emote=<did>                 ara-ɓulla: @<did>:emote (haala emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Ɓeydugol ɗum hollitii kono alaa ko neltaama — nannga Enter ngam neltude.
