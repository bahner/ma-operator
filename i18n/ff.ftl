# zion — Pulaar / Fulfulde
lang-name = Fulfulde
label-nick = innde jamiroore
new-identity-nick-help = Suɓo innde jamiroore ngam ma-space. Ko innde jamiroore tan, aɗa waawi waylude nde kala.
error-nick-required = innde jamiroore ena waɗɗii
error-nick-invalid = innde jamiroore hoto waɗu boowal walla @

# ── Hello ngenndan ────────────────────────────────────────────────────────
tab-login = naatna
tab-new-identity = ɗemngal keso
tab-import-profile = naatnirgol profil
label-passphrase = daande sirlu
label-username = innde jeyɗo
label-confirm-passphrase = sikkina daande sirlu
label-did = DID
label-profile-cid = CID profil
label-or-file = walla fayle
btn-login = naatna
btn-export = yaltina
btn-generate = hobbaade
btn-new-endpoint = tele yimre
btn-import-profile = naatnirgol profil
passphrase-warning = Janfude daande sirlu = janfude ɗemngal. Taa ɗon rewaade.
import-profile-help = Naatnirgol profil e CID walla fayle. Feewnitiiɗon parol waɗde ko nawnugol.
import-profile-detected-user = Profil oo ko: { $name }
status-unlocking = uddude...
status-generating = hobbaade ɗemngal...
status-reading-file = jannude fayle...
status-fetching-profile = e naatnugol profil e IPFS...
status-imported = '{ $name }' nawtoɗo — yah e tab naatna
status-importing-profile = e naatnirgol profil...
profile-import-done = profil naatinaa '{ $name }' — { $n } maale culɗi
error-wrong-passphrase = daande sirlu haalii ko haanaaka: { $e }
error-identity-not-found = ɗemngal '{ $name }' tawaaka
error-username-required = innde jeyɗo waɗii ko haanaaka
error-passphrase-required = daande sirlu waɗii ko haanaaka
error-passphrases-no-match = daanɗe sirlu ɗiɗi ɗen njeytaaki
error-profile-source-required = hokkam CID walla naatnu fayle
error-did-required = hokkam DID maa
error-profile-fetch = teeŋtaali naatnugol profil: { $e }
error-profile-no-username = profil oo alaa innde joomiiɗo
error-profile-no-identity = caaktoyɓe '{ $name }' alaa — naatni caaktoyɓe adande

# ── Koɗe nii'am terminal ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — naatɗo ko { $username }
msg-type-help = Winndita .help tawa hisɗaa dabaaji yimɓe.
msg-getting-started = Eto: say Hello world, look, .help walla help.
msg-connecting = wonde iroh...
msg-iroh-ready = iroh endpoint hebii
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID hollitaama e nder ma ({ $url })
msg-identity-publication-propagating = Jaɓɓingol innde ngol ena woni e saraade tawo; naatgol leeltinaama: { $e }
msg-identity-first-publish = Ena jaɓɓina innde ndee laawol aranol. Ɗum waawi ɓamde haa sekund { $seconds }.
msg-ma-connecting-matrix = amin etagol maa e 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 nokku ɗaɓɓaama
msg-local-ma-already-claimed = 間 nokku ɗaɓɓaama kisa
msg-local-ma-claim-failed = ɗaɓɓude 間 nokku woorii
msg-identity-not-published = Ko tigi alaa woyowoyii dow — so ma sappidi dow, laato '.ma [port]' ɓe '.my.identity!publish @ma'. Windu '.help/publish' ngam tabitinde.
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
err-alias-value-fragment = njamu hesbu ena waawi jogaade ko ɓuri gooto fragment DID-URL mo wonaa meho
err-alias-value-path = njamu hesbu ena foti wonde did:ma:<ipns> DID walla DID-URL (alaa laawol)
err-alias-not-did = njamu hesbu fotde fuɗɗoraade did:ma:
err-unknown-alias = hesbu ɓurnataa: @{ $name }
err-bare-did = bare did:ma:<ipns> laanaama (yimɓe fragment walla path), tawi { $did }

# ── Winndirɗe ─────────────────────────────────────────────────────────────
btn-save = mooftu
btn-eval = hoore
btn-cancel = yooro
msg-jobs-cancelled = golluuji mbaylaama
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
inbox-filter-no-arg = filtiru ina bukata DID walla teddungal
inbox-filter-empty = alaa maande firo { $did }

# ── Baɗe — sahaa runtime ──────────────────────────────────────────────────
discover-fetch-failed = yiytaade haaɗaaka e { $url }: { $e }
discover-json-error = yiytaade haaɗaaka: JSON ɓurii haa ko woɗɗi e { $url }: { $e }
discover-missing-did = yiytaade haaɗaaka: status.json alaa `did`
discover-invalid-did = yiytaade haaɗaaka: `did` fotde fuɗɗoraade did:ma:, tawi `{ $did }`
discover-no-endpoint = kaaɗto yiytaade: `endpoint_id` tawaaka e status.json; DID tan mooftaama
discover-hint-endpoint-not-found = Tinndinoore: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Tinndinoore: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Tinndinoore: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tinndinoore: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma yiytaama e { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   tinndi @ma ɓe — laato '.my.identity!publish @ma' ngam jaatugol tigiraaɗe maa.
claim-success = Runtime ɗaɓɓaama ko { $did }
claim-conflict = Runtime ɗaɓɓaa ko ɗemngal goɗngal
claim-already-owned = Runtime ɗaɓɓaama kisa e oo innde
claim-http-failed = gollal haaɗaaka: HTTP { $status }
claim-error = gollal haaɗaaka: { $e }
claim-no-session = naataaka wano; naatna ɓaawo ɗaɓɓude runtime
runtime-no-verb = baɗe `{ $verb }` { $path } alaa

# ── Baɗe — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl happaama caggal (udditaa haa timmi)
acl-persist-error = juumre mooftude: { $e }
acl-no-verb = baɗe `{ $verb }` .my.acl alaa

# ── Baɗe — ɗemngal ───────────────────────────────────────────────────────
publish-usage = golle: .my.identity!publish <did-walla-hesbu>
identity-exported = Paake ɗownlooday haa { $filename }
identity-export-failed = Ɗaɓɓude rewaani: { $e }

# ── Baɗe — takka ─────────────────────────────────────────────────────────
doc-content-empty = { $path }.content luuɗi
doc-save-first = { $path }.content luuɗi — mooftu ɓaawo
doc-missing-name = innde takka tawaaka
doc-publish-usage = golle: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = golle: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = yettinde { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = bayyingol woorii [{ $code }]: { $err }
doc-publish-error-hint = Tinndinoore: { $hint }
doc-publish-hint-session = log in kadi ngam ego waawa heɓde coktirgal maa
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = hoolkiso winndannde DID bayyinoowo ndee yaltinaama kadi ina waɗi toɓɓere joofnirde yettotoonde
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin jaɓaani ɗaɓɓaande ndee; ƴeewto sabaabu oo e ƴeewtaade caggal nde feewnitaa entitee/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = ƴeewto binndanɗe runtime ngam humpitaade sabaabu laaɓtuɗo e ƴeewtaade
doc-store-sent = gollal mooftude nawnaaɗo ({ $id }) → { $publisher }; CID ara e jaabiri RPC
doc-ipld-store-sent = gollal mooftude IPLD nawnaaɗo ({ $id }) → { $publisher }; CID ara e jaabiri RPC
doc-fetch-done = { $cid } heɓaama → { $path }.content (hooraaka)
doc-fetch-failed = heɓtude { $cid }: { $e }
doc-fetch-usage = golle: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid mooɓtaaka
doc-no-verb = baɗe `{ $verb }` { $path } alaa
path-no-verb = baɗe `{ $verb }` { $path } alaa

# ── Ballal — kanngol ──────────────────────────────────────────────────────
help-header-zion = ── dabaaji zion ────────────────────────────────────────────────────────────
help-header-messaging = ── winnditaade ───────────────────────────────────────────────────────────
help-header-config = ── naawre-daande tiiɗnde ──────────────────────────────────────────────────
help-header-common = ── laabi caggal ──────────────────────────────────────────────────────────
help-header-inbox = ── burro naatna ───────────────────────────────────────────────────────────
help-header-documents = ── takka ────────────────────────────────────────────────────────────────
help-header-i18n = ── ɗemngal ─────────────────────────── ─────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── naatde e 間- nokku ──────────────────────── ─────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Ballal — dabaaji zion ─────────────────────────────────────────────────
help-cmd-help =   .help                        deftere ndee
help-cmd-clear =   .clear                       yaltina terminal
help-cmd-panic =   .panic                       laawol ɓurno — faala e nder nafoore
help-cmd-history =   .history                     taariki juurde (laawol dow dow ɗiɗi nde fiilata)
help-cmd-logout =   .logout                      yalta
help-cmd-batch =   .batch                       évaluer le document brouillon en parallèle
help-cmd-batch-sync =   .batch:sync / .batch         évaluer le document brouillon ligne par ligne

# ── Ballal — winnditaade ──────────────────────────────────────────────────
help-msg-echo =   @alias                       hollu DID/DID-URL ɗaaɓtunde (ɓatakuru neldaaka)
help-msg-send =   @alias!msg body / @alias:verb args           nawtu koɗe / RPC e actor
help-msg-fragment =   @alias#fragment:verb body  nawtu e DID fragment baɗaaɗo
help-msg-escape =   \@name                       @name haqiiqaajo (yiytude hesbu alaa)

# ── Ballal — nelaandu ─────────────────────────────────────────────────────

# ── Ballal — naawre-daande ────────────────────────────────────────────────
help-config-get =   .path                        heɓ njamu leehol walla listal aawre
help-config-filter =   .path value                  gollal muɓɓinɗe (yiytude e njamu)
help-config-set =   .path: value                 weel leehol
help-config-delete =   .path:                       yaltina leehol walla aawre
help-config-verb =   .path!verb [args]            noddu baɗe tiiɗnde

# ── Ballal — laabi caggal ─────────────────────────────────────────────────
help-my =   .my                          hollu poti fikaji neɗɗaagu
help-aliases =   .my.aliases                  listal hesbu
help-aliases-set =   .my.aliases.<name>: <did-url> tottiri/hollintu hesbu (DID walla DID-URL)
help-aliases-del =   .my.aliases.<name>:          yaltina hesbu
help-runtime-discover =   .ma [port]          yiytude runtime tiiɗnde e hobbaade hesbu @ma
help-runtime-claim =   .ma [port]             ɗaɓɓude runtime DID maa
help-identity =   .my.identity                 hollu fikaji neɗɗaagu
help-identity-did =   .my.identity.did             hollu DID maa (jannde tan)
help-identity-publish =   .my.identity!publish @pub    yettin DID e batu yettindengal
help-identity-export =   .my.identity!export          ɗownlooda paake maa aan maa
help-config-path =   .config                      hollu jottaadi .config.* fof

# ── Ballal — burro naatna ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    listal burro naatna (hollirde aawre)
help-inbox-n =   .my.inbox.N                  hollu leehol jottaandi N
help-inbox-from =   .my.inbox.N.from             DID nawnooɗo jottaandi N
help-inbox-reply =   .my.inbox.N!reply [body]     nawtu jaabiri (uddita winndirde so alaa gollal)
help-inbox-open =   .my.inbox.N!open             uddita mbeɗe jannde tan e winndirde
help-inbox-del =   .my.inbox.N:                 yaltina jottaandi N
help-inbox-delall =   .my.inbox:                   yaltina jottaandi burro fof
help-inbox-flush =   .my.inbox!flush              winndita jottaandi fof e terminal
help-inbox-filter =   .my.inbox!filter @who        yiiɗo ko @who heɓi tan
help-inbox-traverse =   .my.inbox.N.sender.<field>   laato takka DID nawnooɗo garol garol

# ── Ballal — takka ───────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           uddita winndirde e mbeɗe mooƒtaaɗo
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     heɓta CID, uddita jannde tan
help-doc-eval =   .my.doc.<name>!eval           hoora mbeɗe mooƒtaaɗo saɗeere e saɗeere
help-doc-publish =   .my.doc.<name>!publish @pub   mooftu wano blob daneewal (kala sifordu)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  mooftu YAML wano node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    keɓta mbeɗe CID (hooraaka)
help-doc-cid =   .my.doc.<name>!cid            hollu CID mooƒtaaɗo
help-doc-del =   .my.doc.<name>:              yaltina takka

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n ina moofta ɓural ɗemngal jokkondirngal e mbaydi maa.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               limtu kode ɗemɗe keɓaaɗe

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Suudu 間 ko woni hakkunde innde-identiteede 間. ma walla ɗee identiteede ngam yiytugol e jokkondirde; so identite maa jaɓɓinaama, a waawi seŋaade.
help-ma-command =   .ma [port]                   seŋo e local ma runtime maa, jang /status.json, tee danndu .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     jaɓɓin DID document maa ngam woɗɓe mbaawa yiytude key maa e endpoint maa
help-ma-security = Ɗo ɓuri laaɓde e koolnol ko ma runtime maa tigi e IPFS Desktop/Kubo maa tigi. Remote publisher ena waawi wallude, kono ɗuum noon ko huutorto-ɗaa sarwiis goɗɗo.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hol no naatirta e suudu 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = So identite maa anndaama, .enter @ma maa yamira naatde e 間. Yiylo aduna, naatu ɗo, tee seŋo ɗoon.
help-ma-entry-steps = Hurmin IPFS Desktop e ma, caggal mum dogin .ma. Jaɓɓin e .my.identity!publish @ma, yiylo aduna, tee naat e .enter @ma.
help-ma-entry-command =   .enter @ma                  naat e 間 rewde @ma runtime
help-ma-entry-toggle =   .enter                       hurmin walla ñifin hakkille suudu; identite maa heddii hurminnde
help-ma-entry-url =   ?enter=<runtime>             naat caggal login iwde e URL lollinaango

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
yaml-serialise-error = Juulnde YAML: { $e }
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
msg-chat = { $sender } wi'i { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } wi'i { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } wari e suudu.
room-leave = * { $name } yalti suudu.
room-drop  = * { $name } yolii { $thing }.
room-take  = * { $name } heɓii { $thing }.
err-edit-decode-failed = taƴre: juumre waɗde welngo: { $e }
err-edit-fetch-failed = taƴre: juumre heɓde: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = alaa setoore jeyaare — profil waawataa jooɓaade
profile-delete-error = feccere profil walaa: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = heftinirde nde suuɗinaama tee neldaama to IPFS; winndere DID maa hesɗitine nde CID arii
profile-publish-done = heftinirde nde bayyinaama — winndere DID hesɗitinaama e ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identité yaltinaama tawo — nate haa jooni
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = loowdi binndol (hollittaaka)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (hay)
profiles-deleted = profil { $name } jooɓaama
profiles-not-found = profil {$name} walaa: { $name }

# -- Help topics index
help-header-topics = -- sujets -- tapez .help/<topic> pour les détails
help-topic-msg =   .help/msg                    messagerie
help-topic-ma = .help/ma                     ma-nokku, baylugol, e naatgol
help-topic-path = .help/path                   grammar laawol toɓɓere nokkuure
help-topic-my =   .help/my                     config personnelle
help-topic-inbox =   .help/inbox                  boîte de réception
help-topic-doc =   .help/doc                    binndanɗe
help-topic-actor =   .help/actor                  acteur distant
help-topic-zscheme =   .help/zscheme               konngol Scheme e nder gorol e ɗereeji
help-unknown-topic =   .help/{ $topic }: sujet inconnu

# -- Help actor section
help-header-actor = -- acteurs distants
help-actor-echo =   @actor                       afficher le DID résolu
help-actor-text = @actor[#entity]!msg|!say|!emote body         neldu mesaas toowɗo/yeewtere/emote
help-actor-ping = @actor:ping                  nguurndam ping
help-actor-entities =   @actor/entities              lister les entités
help-actor-entities-get = @actor/entities/<n>          heɓde noddaango entitee
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     modifier l’entité
help-actor-entities-del = @actor/entities/<n>:         momtude huunde
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
help-actor-wc = (define x (@actor:verb arg))  jogaade jaabawuuli 5 e nder nokku jonnde
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    udditde zion e nder togol URL
help-topic-i18n = .help/i18n                   ɗemngal ɓurngal welde ngam anndinde ma
help-header-url = ── kaaɗe URL ────────────────────────────────────────────────────────────────────
help-url-intro =   Neltir togol udditde zion e jibinirde njemiraande:
help-url-msg =   ?msg=<did>                   ara-ɓulla: @<did>!msg (tiiɗnde yooltii)
help-url-say =   ?say=<did>                   ara-ɓulla: @<did>!say (haala say)
help-url-emote =   ?emote=<did>                 ara-ɓulla: @<did>!emote (haala emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             naatde e aduna runtime caggal nde naati
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ɓeydugol ɗum hollitii kono alaa ko neltaama — nannga Enter ngam neltude.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                jaatugol tigi maa to laawol
help-header-publish = ── jaatugol tigi ────────────────────────────────────────────────────────────
help-publish-intro = Jaatugol waɗa tigi maa woɗɗitaago dow laawol. Woɗɓe mbaawi yiylaade DID maa ngam tawtaade.
help-publish-ma = Ngam jaatugol, a haani ma (runtime laawol) sappidi. O hokkitoo ego e IPFS/IPNS ɗum faa maa.
help-publish-steps = Laaɓol: laato '.ma [port]' ngam yiyde ma laawol, ɓe '.my.identity!publish @ma'.
help-publish-without = Saa'i jaatugol alaa, woɗɓe ngalaa e nder naatgol — haa DID maa ngarataa, e nder endpoint maa ngalaa.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = joɓɓin innde heftinirde: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Moftude batte — winndu yamiroore, joofna e .batch
batch-already-collecting = Ko adii fof ko mooftude battane — joofna e .batch ko adii
batch-empty = Batch wonnoo ko meere — alaa ko dogata
batch-running = Exécution du batch…
batch-step-timeout = batch step timmi

batch-done = Batch terminé en { $secs }s — { $steps } étapes
batch-done-error = Batch terminé avec erreurs en { $secs }s — { $steps } étapes
msg-timeout = Message expiré (aucune réponse en 60s)
err-unknown-command = yamiroore anndaaka: { $path }
err-read-only-path = { $path } ko janngorde tan
help-cmd-batch-async =   .batch:async / .batch        évaluer le document brouillon en parallèle


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Waawaa CID { $cid } heɓude: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ɓurɗo fewdo: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Tiitoore: Furdu maa IPNS e innde maa waɗete e ɗoo runtime ngam winndude dewgal maa. Huutoro tan runtime mo njinnaaɗaa haa timmi.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme ƴeewtata konngol Scheme gonngol e nder jamirooje zion, so ɓeyda njaltudi ndi e gorol hade ko neldaa.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    yeru e nder gorol; nelda "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             cifagol ina heddii e oo naatgol jooni
help-zscheme-doc = Ɗereeji: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = IPFS-gateway lokkal (ina haajde tinnde browser)
