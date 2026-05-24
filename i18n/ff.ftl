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
msg-reply-sent = jaabiri nawnaaɗo
msg-reply-failed = jaabiri haaɗaaka: { $e }
msg-entity-publish-sent = entity { $name }: yettinde nawnaaɗo
msg-entity-publish-failed = yettinde entity haaɗaaka: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: yettinde nawnaaɗo
msg-field-publish-failed = yettinde leehol haaɗaaka: { $e }
msg-acl-publish-sent = runtime ACL: yettinde nawnaaɗo
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
