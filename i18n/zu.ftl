# zion — isiZulu
lang-name = isiZulu

# ── Ikhasi lokungena ──────────────────────────────────────────────────────
tab-login = ngena
tab-new-identity = ubunikazi obusha
tab-import = ngenisa
label-passphrase = igama elinzulazulu
label-username = igama lomsebenzisi
label-confirm-passphrase = qinisekisa igama elinzulazulu
btn-login = ngena
btn-export = khipha
btn-generate = dala
btn-new-endpoint = indawo entsha
passphrase-warning = Ukulahlekelwa igama elinzulazulu = ukulahlekelwa ubunikazi. Akukho okubuyiswayo.
import-help = Khetha ifayela .zion.json elikhishiwe. Ithuba lihlala ligcinwe ngokuphepha.
status-unlocking = kuvulwa...
status-generating = ubunikazi budalwa...
status-reading-file = ifayela lifundwa...
status-imported = 'u{ $name }' ungenisiwe — chofoza ku-tab yokungena
error-wrong-passphrase = igama elinzulazulu alifanele: { $e }
error-identity-not-found = ubunikazi 'bu{ $name }' abufunyanwanga
error-username-required = igama lomsebenzisi liyadingeka
error-passphrase-required = igama elinzulazulu liyadingeka
error-passphrases-no-match = amagama elinzulazulu awafani

# ── Imiyalezo yesistimu ye-terminal ──────────────────────────────────────
msg-logged-in = zion v{ $version } — ungene njengo { $username }
msg-type-help = Thayipha .help ukuze uthole uhlu lwemiyalelo.
msg-connecting = ixhunywa ku-iroh...
msg-iroh-ready = i-endpoint ye-iroh ilungile
msg-iroh-failed = iroh: { $e }
msg-auto-published = I-DID ishicilelwe nge-ma yendawo ({ $url })
msg-identity-not-published = Ubunikazi abufunyanwanga ku-inthanethi — uma u-ma ufakiwe endaweni, qhuba '.my.ma:discover' bese '.my.identity:publish @ma'. Bhala '.help.publish' ngemininingwane.
msg-blocked = ⊗ kuvinjwe [{ $cap }]: { $from }
msg-focus-cleared = ukugxila kudulwe
msg-focusing = ukugxila ku-{ $did } njengo { $prompt }
msg-set = { $path }: { $value }
msg-deleted = u{ $path } ususwe ({ $count } izingeniso)
msg-read-only = u{ $path } ungafundwa kuphela
msg-subtree-set = u{ $path } iyisihlahla esincane; wenqabile ukusetha
msg-ancestor-leaf = okhokho baku-{ $path } yikhasi; wenqabile ukusithela
msg-key-not-found = ukhiye akutholakalanga: { $path }
msg-no-match = akukho okufanayo
msg-link-not-connected = iphutha lokulanda ixhumanisi: akuxhunyiwe
msg-link-fetch-error = iphutha lokulanda ixhumanisi: { $e }
msg-link-key-not-found = ukhiye `{ $key }` akutholakalanga kumstandi oxhunyiwe

# ── Ukuqinisekisa isidlaliso ──────────────────────────────────────────────
err-alias-name-empty = igama lesidlaliso alikwazi ukuba ngenalutho
err-alias-has-dot = amagama esidlaliso awakwazi ukuba ne-'.'
err-alias-has-fragment = amagama esidlaliso awakwazi ukuba ne-'#'
err-alias-value-fragment = inani lesidlaliso kufanele libe bare did:ma:<ipns> (akuna fragment)
err-alias-value-path = inani lesidlaliso kufanele libe bare did:ma:<ipns> (akuna path)
err-alias-not-did = inani lesidlaliso kufanele liqale nge-did:ma:
err-unknown-alias = isidlaliso esingaziwa: @{ $name }
err-bare-did = kulindelwe bare did:ma:<ipns> (akuna fragment noma path), kutholwe { $did }

# ── Uhlelo lokushintsha ───────────────────────────────────────────────────
btn-save = gcina
btn-eval = qalisa
btn-cancel = khansela
btn-close = vala
btn-reply = phendula
btn-publish = shicilela
btn-publish-ipld = shicilela IPLD
msg-reply-sent = impendulo ithunyelwe
msg-reply-failed = impendulo ihlulekile: { $e }
msg-entity-publish-sent = entity { $name }: ukushicilela kuthunyelwe
msg-entity-publish-failed = ukushicilela entity kuhlulekile: { $e }
msg-kind-publish-failed = ukushicilela uhlobo kwehlulekile: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ukushicilela kuthunyelwe
msg-field-publish-failed = ukushicilela insimu kuhlulekile: { $e }
msg-acl-publish-sent = runtime ACL: ukushicilela kuthunyelwe
msg-crud-edit-publish-sent = { $path }: ukushicilela kuthunyelwe
msg-acl-publish-failed = ukushicilela runtime ACL kuhlulekile: { $e }
msg-yaml-error = iphutha le-YAML: { $e }
msg-editor-saved = { $path }:gcina
msg-fetch-review = u{ $cid } ulandwe — buyekeza ngaphambi kokuqalisa
msg-fetch-failed = ukulanda u{ $cid }: { $e }

# ── Izenzo — ibhokisi lokufika ────────────────────────────────────────────
inbox-empty = ibhokisi lokufika lingenalutho
inbox-entry-not-found = ingeniso yebhokisi { $n } ayitholakalanga
inbox-no-message-id = ingeniso yebhokisi { $n } ayina message_id
inbox-no-verb = akukho senzo `{ $verb }` sengeniso yebhokisi { $n }
inbox-filter-no-arg = i-filter ifuna i-DID noma isikhulumeli
inbox-filter-empty = ayikho imilayezo evela ku { $did }

# ── Izenzo — isikhathi sokusebenza ────────────────────────────────────────
discover-fetch-failed = ukutholwa kuhlulekile ku-{ $url }: { $e }
discover-json-error = ukutholwa kuhlulekile: JSON engavumelekile evela ku-{ $url }: { $e }
discover-missing-did = ukutholwa kuhlulekile: status.json inextraa `did`
discover-invalid-did = ukutholwa kuhlulekile: `did` kufanele iqale nge-did:ma:, kutholwe `{ $did }`
discover-no-endpoint = isexwayiso sokutholwa: `endpoint_id` ayekho ku-status.json; i-DID kuphela igcinwe
discover-success = ma itholakale ku-{ $url }
discover-did-line = DID: { $did }
discover-alias-hint =   i-alias @ma idalwe — qhuba '.my.identity:publish @ma' ukushicilela ubunikazi bakho.
claim-success = i-Runtime ibonelelwe ku-{ $did }
claim-conflict = i-Runtime isicelwe obunikazi obunye
claim-http-failed = isicelo sihlulekile: HTTP { $status }
claim-error = isicelo sihlulekile: { $e }
claim-no-session = akungeniwe; ngena kuqala ukuze ucele i-runtime
runtime-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Izenzo — ACL ──────────────────────────────────────────────────────────
acl-reset = i-.my.acl isetwa kabusha (ivuliwe ngokuphelele)
acl-persist-error = iphutha lokugcina: { $e }
acl-no-verb = akukho senzo `{ $verb }` se-.my.acl

# ── Izenzo — ubunikazi ────────────────────────────────────────────────────
publish-usage = ukusetshenziswa: .my.identity:publish <did-noma-isidlaliso>
identity-exported = Iqoqo lilandisiwe njenge { $filename }
identity-export-failed = Ukuthumela ngaphandle kuhlulekile: { $e }

# ── Izenzo — imibhalo ─────────────────────────────────────────────────────
doc-content-empty = u{ $path }.content ungenalutho
doc-save-first = u{ $path }.content ungenalutho — gcina kuqala
doc-missing-name = igama lemibhalo lilahlekile
doc-publish-usage = ukusetshenziswa: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = ukusetshenziswa: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = ukushicilela u{ $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = isicelo sokugcina sithunyelwe ({ $id }) → { $publisher }; i-CID iyofika nge-RPC reply
doc-ipld-store-sent = isicelo sokugcina se-IPLD sithunyelwe ({ $id }) → { $publisher }; i-CID iyofika nge-RPC reply
doc-fetch-done = u{ $cid } ulandwe → u{ $path }.content (akuqalisiwe)
doc-fetch-failed = ukulanda u{ $cid }: { $e }
doc-fetch-usage = ukusetshenziswa: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = u{ $path }.cid akusetiwe
doc-no-verb = akukho senzo `{ $verb }` saku-{ $path }
path-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Usizo — izindlela ezikhulu ────────────────────────────────────────────
help-header-zion = ── imiyalelo ye-zion ──────────────────────────────────────────────────────
help-header-messaging = ── ukuthumela ───────────────────────────────────────────────────────────
help-header-focus = ── imodi yokugxila ───────────────────────────────────────────────────────
help-header-config = ── uhlelo lwezintela zendawo ────────────────────────────────────────────
help-header-common = ── izindlela ezisetshenziswa kakhulu ──────────────────────────────────────
help-header-inbox = ── ibhokisi lokufika ──────────────────────────────────────────────────────
help-header-documents = ── imibhalo ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Usizo — imiyalelo ye-zion ─────────────────────────────────────────────
help-cmd-help =   .help                        lo mbhalo
help-cmd-clear =   .clear                       sula i-terminal
help-cmd-panic =   .panic                       indlela yokugcina — sebenzisa uma unenkinga
help-cmd-history =   .history                     umlando wemiyalelo (izinhlobo ezifanayo ezilandelanayo zihlanganiswé)
help-cmd-logout =   .logout                      phuma

# ── Usizo — ukuthumela ────────────────────────────────────────────────────
help-msg-echo =   @alias                       bonisa i-DID esihlunywayo (akuthumelwanga imiyalezo)
help-msg-send =   @alias[:verb] body           thumela imiyalezo / RPC ku-actor
help-msg-fragment =   @alias#fragment[:verb] body  thumela nge-DID fragment ecacile
help-msg-escape =   \@name                       @name ngqo (akukho ukusesha isidlaliso)

# ── Usizo — imodi yokugxila ───────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       gxila ku-actor (ishintsha i-prompt)
help-focus-clear =   .use                         sula ukugxila

# ── Usizo — uhlelo lwezintela ─────────────────────────────────────────────
help-config-get =   .path                        thola inani lekhasi noma ubala isihlahla esincane
help-config-filter =   .path value                  lungisa umbuzo (hlunga ngenanani)
help-config-set =   .path: value                 setha ikhasi
help-config-delete =   .path:                       susa ikhasi noma isihlahla esincane
help-config-verb =   .path:verb [args]            biza isenzo sendawo

# ── Usizo — izindlela ezisetshenziswa kakhulu ────────────────────────────
help-my =   .my                          bonisa zonke izilungiselelo zobunikazi
help-aliases =   .my.aliases                  bala izidlaliso
help-aliases-set =   .my.aliases.<name>: <did>    engeza/buyekeza isidlaliso (bare DID, akuna #fragment)
help-aliases-del =   .my.aliases.<name>:          susa isidlaliso
help-runtime-discover =   .my.ma:discover          thola i-runtime yendawo futhi dala isidlaliso @ma
help-runtime-claim =   .my.ma:claim             cela ukuphatha i-runtime nge-DID yakho
help-identity =   .my.identity                 bonisa izilungiselelo zobunikazi
help-identity-did =   .my.identity.did             bonisa i-DID yakho (ukufunda kuphela)
help-identity-publish =   .my.identity:publish @pub    shicilela i-DID ngosizo lokushicilela
help-identity-export =   .my.identity:export          landisa iqoqo lakho lomphakathi
help-config-path =   .config                      bonisa zonke izingeniso ze-.config.*

# ── Usizo — ibhokisi lokufika ─────────────────────────────────────────────
help-inbox =   .my.inbox                    bala ibhokisi lokufika (ukubukwa kwesihlahla esincane)
help-inbox-n =   .my.inbox.N                  bonisa izinsimu zengeniso N
help-inbox-from =   .my.inbox.N.from             i-DID yomthumeli wengeniso N
help-inbox-reply =   .my.inbox.N:reply [body]     thumela impendulo (vula uhlelo oluguqulayo uma kungekho umzimba)
help-inbox-open =   .my.inbox.N:open             vula okuqukethwe ukufunda kuphela kuhlelo oluguqulayo
help-inbox-del =   .my.inbox.N:                 susa ingeniso N
help-inbox-delall =   .my.inbox:                   susa zonke izingeniso zebhokisi lokufika
help-inbox-flush =   .my.inbox:flush              printa zonke izingeniso ku-terminal
help-inbox-filter =   .my.inbox:filter @who        bonisa amangeniso avela ku @who kuphela
help-inbox-traverse =   .my.inbox.N.sender.<field>   hamba idokhumenti ye-DID yomthumeli kancane

# ── Usizo — imibhalo ──────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           vula uhlelo oluguqulayo nokuqukethwe okugcinwe
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     landa i-CID, vula ukubukezwa kuphela
help-doc-eval =   .my.doc.<name>:eval           qalisa okuqukethwe okugcinwe umugqa ngomugqa
help-doc-publish =   .my.doc.<name>:publish @pub   gcina njenge-blob oluhlaza (uhlobo oluluphi)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  gcina i-YAML njengendawo ye-IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    ngenisa okuqukethwe kwe-CID (akuqalisiwe)
help-doc-cid =   .my.doc.<name>:cid            bonisa i-CID egcinwe
help-doc-del =   .my.doc.<name>:              susa umbhalo

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Izilimi ezikhona (setha nge .my.i18n: <code>):
err-lang-not-found = ulimi alutholwanga: { $lang }

msg-send-failed = ukuthumela kuhlulekile: { $e }
msg-not-logged-in = awungangeni

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Iphutha lokuhlaziya i-YAML: { $e }
yaml-not-mapping = I-YAML kufanele ibe yimapping (amajozi okhiye: inani); umbhalo ojwayelekile nezisekelo azinakugcinwa njengo-DAG-CBOR
dagcbor-encode-error = Iphutha lokukhowuda i-DAG-CBOR: { $e }
cbor-decode-error = Iphutha lokuvula i-CBOR: { $e }
cbor-json-error = Iphutha lokuguqula i-CBOR ibe i-JSON: { $e }
yaml-serialize-error = Iphutha lokusereyeliza i-YAML: { $e }
edit-reply-invalid = Impendulo yokuhlela engavumelekile
doc-publish-ipld-error = Ukushicilela i-IPLD kuhlulekile: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Iphutha lokugcina ukunqanyulwa kwebhokisi lomsebenzi: { $e }
err-config-load = Iphutha lokulayisha ukucwaninga: { $e }
err-lang-persist = Iphutha lokugcina ulimi: { $e }
err-history-parse = Iphutha lokuhlaziya umlando: { $e }
err-history-load = Iphutha lokulayisha umlando: { $e }
err-ipfs-reply-decode = Ukuvula impendulo ye-IPFS kuhlulekile: { $e }
err-edit-cbor = Iphutha lokuhlela i-CBOR: { $e }
err-popup-blocked = Isiphequluli sivimbe isaziso esinye
status-publishing = ikhishwa

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = iphutha
rpc-error-detail = iphutha: { $detail }
msg-new-message = ← [{ $from }] umlayezo omutsha — { $count } ebhokisini
msg-chat = { $sender } uthi { $body }
err-edit-decode-failed = ukuhlelwa: ukuhumusha kwehlulekile: { $e }
err-edit-fetch-failed = ukuhlelwa: ukuthola kwehlulekile: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ayikho iseshini esisebenzayo — iprofile ayikwazi ukususwa
profile-delete-error = ukususa iprofile kuhlulekile: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (akunamuntu)
profiles-deleted = iprofile { $name } isusiwe
profiles-not-found = iprofile ayitholakali: { $name }

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

help-topic-url =   .help.url                    ukuvula zion ngesixhokelelwano se-URL
help-header-url = ── izinhlelo ze-URL ─────────────────────────────────────────────────────────────
help-url-intro =   Yabelana ngesixhokelelwano esivula zion enomamukeli osegcwaliswe phambilini:
help-url-msg =   ?msg=<did>                   gcwalisa phambilini: @<did> (umlayezo olula)
help-url-say =   ?say=<did>                   gcwalisa phambilini: @<did>:say (isenzo say)
help-url-emote =   ?emote=<did>                 gcwalisa phambilini: @<did>:emote (isenzo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Ukufakwa kugcwaliswe phambilini kodwa akuthunyiswanga — cindezela Enter ukuthumela.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                shicilela ubunikazi bakho kwi-network
help-header-publish = ── ukushicilela ubunikazi ────────────────────────────────────────────────────
help-publish-intro = Ukushicilela kwenza ubunikazi bakho butholakale ku-network. Abanye bangafuna i-DID yakho ukukufinyelela.
help-publish-ma = Ukushicilela, udinga u-ma (runtime yendawo) ofakiwe. Ixhuma i-ego ne-IPFS/IPNS egameni lakho.
help-publish-steps = Izinyathelo: qhuba '.my.ma:discover' ukuze uthole u-ma wendawo, bese '.my.identity:publish @ma'.
help-publish-without = Ngaphandle kokushicilela, abanye abanakukufinyelela — ngisho noma bazi i-DID yakho, abanakuxazulula i-endpoint yakho.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
