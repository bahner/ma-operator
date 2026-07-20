# zion — isiZulu
lang-name = isiZulu

# ── Ikhasi lokungena ──────────────────────────────────────────────────────
tab-login = ngena
tab-new-identity = ubunikazi obusha
tab-import-profile = ngenisa iphrofayela
label-passphrase = igama elinzulazulu
label-username = igama lomsebenzisi
label-confirm-passphrase = qinisekisa igama elinzulazulu
label-did = DID
label-profile-cid = i-CID yephrofayela
label-or-file = noma ifayela
btn-login = ngena
btn-export = khipha
btn-generate = dala
btn-new-endpoint = indawo entsha
btn-import-profile = ngenisa iphrofayela
passphrase-warning = Ukulahlekelwa igama elinzulazulu = ukulahlekelwa ubunikazi. Akukho okubuyiswayo.
import-profile-help = Ngenisa iphrofayela nge-CID noma ifayela. Udinga igama elifanayo lamabhizinisi alisebenzisa ngesikhathi sokushicilela.
import-profile-detected-user = Iphrofayela ingeyaka: { $name }
status-unlocking = kuvulwa...
status-generating = ubunikazi budalwa...
status-reading-file = ifayela lifundwa...
status-fetching-profile = kuthathwa iphrofayela ku-IPFS...
status-imported = 'u{ $name }' ungenisiwe — chofoza ku-tab yokungena
status-importing-profile = ifakwa iphrofayela...
profile-import-done = iphrofayela ingenisiwe ngo '{ $name }' — { $n } izikhiye zilayishiwe
error-wrong-passphrase = igama elinzulazulu alifanele: { $e }
error-identity-not-found = ubunikazi 'bu{ $name }' abufunyanwanga
error-username-required = igama lomsebenzisi liyadingeka
error-passphrase-required = igama elinzulazulu liyadingeka
error-passphrases-no-match = amagama elinzulazulu awafani
error-profile-source-required = nikela i-CID noma layisha ifayela
error-did-required = faka i-DID yakho
error-profile-fetch = ayikwazanga ukuthola iphrofayela: { $e }
error-profile-no-username = iphrofayela alinalo igama lomsebenzisi
error-profile-no-identity = isazisi '{ $name }' asitholakananga — ngenisa isazisi kuqala

# ── Imiyalezo yesistimu ye-terminal ──────────────────────────────────────
msg-logged-in = zion v{ $version } — ungene njengo { $username }
msg-type-help = Thayipha .help ukuze uthole uhlu lwemiyalelo.
msg-connecting = ixhunywa ku-iroh...
msg-iroh-ready = i-endpoint ye-iroh ilungile
msg-iroh-failed = iroh: { $e }
msg-auto-published = I-DID ishicilelwe nge-ma yendawo ({ $url })
msg-ma-connecting-matrix = sizama ukukuxhuma ku-間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = i-間 yendawo isiceliwe
msg-local-ma-already-claimed = i-間 yendawo isivele isiceliwe
msg-local-ma-claim-failed = kwehlulekile ukucela i-間 yendawo
msg-identity-not-published = Ubunikazi abufunyanwanga ku-inthanethi — uma u-ma ufakiwe endaweni, qhuba '.ma [port]' bese '.my.identity!publish @ma'. Bhala '.help/publish' ngemininingwane.
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
err-alias-value-fragment = inani lesidlaliso lingaba ne-fragment eyodwa kuphela ye-DID-URL engagcwalanga
err-alias-value-path = inani lesidlaliso kufanele libe yi-did:ma:<ipns> DID noma DID-URL (akuna path)
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
discover-hint-endpoint-not-found = Icebiso: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Icebiso: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Icebiso: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Icebiso: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma itholakale ku-{ $url }
discover-did-line = DID: { $did }
discover-alias-hint =   i-alias @ma idalwe — qhuba '.my.identity!publish @ma' ukushicilela ubunikazi bakho.
claim-success = i-Runtime ibonelelwe ku-{ $did }
claim-conflict = i-Runtime isicelwe obunikazi obunye
claim-already-owned = Runtime isivele isicelwe yilobu bunikazi
claim-http-failed = isicelo sihlulekile: HTTP { $status }
claim-error = isicelo sihlulekile: { $e }
claim-no-session = akungeniwe; ngena kuqala ukuze ucele i-runtime
runtime-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Izenzo — ACL ──────────────────────────────────────────────────────────
acl-reset = i-.my.acl isetwa kabusha (ivuliwe ngokuphelele)
acl-persist-error = iphutha lokugcina: { $e }
acl-no-verb = akukho senzo `{ $verb }` se-.my.acl

# ── Izenzo — ubunikazi ────────────────────────────────────────────────────
publish-usage = ukusetshenziswa: .my.identity!publish <did-noma-isidlaliso>
identity-exported = Iqoqo lilandisiwe njenge { $filename }
identity-export-failed = Ukuthumela ngaphandle kuhlulekile: { $e }

# ── Izenzo — imibhalo ─────────────────────────────────────────────────────
doc-content-empty = u{ $path }.content ungenalutho
doc-save-first = u{ $path }.content ungenalutho — gcina kuqala
doc-missing-name = igama lemibhalo lilahlekile
doc-publish-usage = ukusetshenziswa: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = ukusetshenziswa: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ukushicilela u{ $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = ukushicilela kuhlulekile [{ $code }]: { $err }
doc-publish-error-hint = Icebiso: { $hint }
doc-publish-hint-session = ngena futhi ukuze i-ego ikwazi ukufinyelela okhiye bakho kamazisi
doc-publish-hint-target = sebenzisa i-DID yomshicileli evumelekile noma isibizo esinquma ukuphumela obala nge-57
doc-publish-hint-network = qinisekisa ukuthi i-7 isikhathi sokusebenza kanye ne-22 iyafinyeleleka, bese uyazama futhi
doc-publish-hint-resolve = qinisekisa ukuthi idokhumenti ye-DID yomshicileli ishicilelwe futhi iqukethe isiphetho esifinyelelekayo
doc-publish-hint-acl = cela u-opharetha womshicileli ukuthi avumele i-DID yakho ku-48
doc-publish-hint-runtime = isikhathi sokusebenza/i-plugin inqabe isicelo; hlola isizathu bese uzama futhi ngemva kokulungisa ibhizinisi/isikhathi sokusebenza
doc-publish-hint-ipfs = hlola impilo ye-12/17 yendawo kanye nesimo sesikhathi sokusebenza somshicileli
doc-publish-hint-unknown = hlola amalogi esikhathi sokusebenza ukuze uthole imbangela enemininingwane bese uzama futhi
doc-store-sent = isicelo sokugcina sithunyelwe ({ $id }) → { $publisher }; i-CID iyofika nge-RPC reply
doc-ipld-store-sent = isicelo sokugcina se-IPLD sithunyelwe ({ $id }) → { $publisher }; i-CID iyofika nge-RPC reply
doc-fetch-done = u{ $cid } ulandwe → u{ $path }.content (akuqalisiwe)
doc-fetch-failed = ukulanda u{ $cid }: { $e }
doc-fetch-usage = ukusetshenziswa: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = u{ $path }.cid akusetiwe
doc-no-verb = akukho senzo `{ $verb }` saku-{ $path }
path-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Usizo — izindlela ezikhulu ────────────────────────────────────────────
help-header-zion = ── imiyalelo ye-zion ──────────────────────────────────────────────────────
help-header-messaging = ── ukuthumela ───────────────────────────────────────────────────────────
help-header-config = ── uhlelo lwezintela zendawo ────────────────────────────────────────────
help-header-common = ── izindlela ezisetshenziswa kakhulu ──────────────────────────────────────
help-header-inbox = ── ibhokisi lokufika ──────────────────────────────────────────────────────
help-header-documents = ── imibhalo ──────────────────────────────────────────────────────────────
help-header-i18n = ── ulimi ───────────────────────────── ──────────────────────────────
help-header-ma = ── 3-isikhala ────────────────────────────── ──────────────────────────────
help-header-ma-entry = ── ingena 間-space ───────────────────────── ──────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Usizo — imiyalelo ye-zion ─────────────────────────────────────────────
help-cmd-help =   .help                        lo mbhalo
help-cmd-clear =   .clear                       sula i-terminal
help-cmd-panic =   .panic                       indlela yokugcina — sebenzisa uma unenkinga
help-cmd-history =   .history                     umlando wemiyalelo (izinhlobo ezifanayo ezilandelanayo zihlanganiswé)
help-cmd-logout =   .logout                      phuma
help-cmd-batch =   .batch                       hlola idokhumenti ye-scratch ngokuhambisana
help-cmd-batch-sync =   .batch:sync / .batch         hlola idokhumenti ye-scratch umugqa nomugqa

# ── Usizo — ukuthumela ────────────────────────────────────────────────────
help-msg-echo =   @alias                       bonisa i-DID/DID-URL exazululiwe (akuthunyelwa mlayezo)
help-msg-send =   @alias!msg body / @alias:verb args           thumela imiyalezo / RPC ku-actor
help-msg-fragment =   @alias#fragment:verb body  thumela nge-DID fragment ecacile
help-msg-escape =   \@name                       @name ngqo (akukho ukusesha isidlaliso)

# ── Usizo — imodi yokugxila ───────────────────────────────────────────────

# ── Usizo — uhlelo lwezintela ─────────────────────────────────────────────
help-config-get =   .path                        thola inani lekhasi noma ubala isihlahla esincane
help-config-filter =   .path value                  lungisa umbuzo (hlunga ngenanani)
help-config-set =   .path: value                 setha ikhasi
help-config-delete =   .path:                       susa ikhasi noma isihlahla esincane
help-config-verb =   .path!verb [args]            biza isenzo sendawo

# ── Usizo — izindlela ezisetshenziswa kakhulu ────────────────────────────
help-my =   .my                          bonisa zonke izilungiselelo zobunikazi
help-aliases =   .my.aliases                  bala izidlaliso
help-aliases-set =   .my.aliases.<name>: <did-url>    engeza/buyekeza isidlaliso (DID noma DID-URL)
help-aliases-del =   .my.aliases.<name>:          susa isidlaliso
help-runtime-discover =   .ma [port]          thola i-runtime yendawo futhi dala isidlaliso @ma
help-runtime-claim =   .ma [port]             cela ukuphatha i-runtime nge-DID yakho
help-identity =   .my.identity                 bonisa izilungiselelo zobunikazi
help-identity-did =   .my.identity.did             bonisa i-DID yakho (ukufunda kuphela)
help-identity-publish =   .my.identity!publish @pub    shicilela i-DID ngosizo lokushicilela
help-identity-export =   .my.identity!export          landisa iqoqo lakho lomphakathi
help-config-path =   .config                      bonisa zonke izingeniso ze-.config.*

# ── Usizo — ibhokisi lokufika ─────────────────────────────────────────────
help-inbox =   .my.inbox                    bala ibhokisi lokufika (ukubukwa kwesihlahla esincane)
help-inbox-n =   .my.inbox.N                  bonisa izinsimu zengeniso N
help-inbox-from =   .my.inbox.N.from             i-DID yomthumeli wengeniso N
help-inbox-reply =   .my.inbox.N!reply [body]     thumela impendulo (vula uhlelo oluguqulayo uma kungekho umzimba)
help-inbox-open =   .my.inbox.N!open             vula okuqukethwe ukufunda kuphela kuhlelo oluguqulayo
help-inbox-del =   .my.inbox.N:                 susa ingeniso N
help-inbox-delall =   .my.inbox:                   susa zonke izingeniso zebhokisi lokufika
help-inbox-flush =   .my.inbox!flush              printa zonke izingeniso ku-terminal
help-inbox-filter =   .my.inbox!filter @who        bonisa amangeniso avela ku @who kuphela
help-inbox-traverse =   .my.inbox.N.sender.<field>   hamba idokhumenti ye-DID yomthumeli kancane

# ── Usizo — imibhalo ──────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           vula uhlelo oluguqulayo nokuqukethwe okugcinwe
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     landa i-CID, vula ukubukezwa kuphela
help-doc-eval =   .my.doc.<name>!eval           qalisa okuqukethwe okugcinwe umugqa ngomugqa
help-doc-publish =   .my.doc.<name>!publish @pub   gcina njenge-blob oluhlaza (uhlobo oluluphi)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  gcina i-YAML njengendawo ye-IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    ngenisa okuqukethwe kwe-CID (akuqalisiwe)
help-doc-cid =   .my.doc.<name>!cid            bonisa i-CID egcinwe
help-doc-del =   .my.doc.<name>:              susa umbhalo

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = I-.my.i18n igcina izintandokazi zolimi eziboshelwe kubunikazi bakho.
help-i18n-set = .my.i18n: <code>             khetha ulimi olusetshenziswa yi-20 kulobu bunikazi
help-i18n-list = .my.i18n!list               bhala amakhodi olimi atholakalayo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Igumbi le-間 liyisikhala phakathi kobunikazi be-間. ma yenza labo bunikazi batholane futhi baxhumane; uma ubunikazi bakho sebushicilelwe, ungabamba iqhaza.
help-ma-command =   .ma [port]                   xhuma ku-ma runtime yasendaweni, funda /status.json, bese ulondoloza .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     shicilela idokhumenti yakho ye-DID ukuze abanye bathole okhiye bakho ne-endpoint yakho
help-ma-security = Umngcele wokuthembana ocace kakhulu yi-ma runtime yakho kanye ne-IPFS Desktop/Kubo yakho. Publisher ekude ingasiza, kodwa lapho uncika enkonzweni yomunye umuntu.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             indlela yokungena egumbini le-間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Uma ubunikazi bakho sebuziwa, .enter @ma ikuvumela ungene ku-間. Thola umhlaba, ungene kuwo, bese ubamba iqhaza lapho.
help-ma-entry-steps = Qalisa IPFS Desktop ne ma, bese ugijima .ma. Shicilela ngo .my.identity!publish @ma, thola umhlaba, ungene ngo .enter @ma.
help-ma-entry-command =   .enter @ma                  ngena ku-間 nge @ma runtime
help-ma-entry-toggle =   .enter                       vula noma uvale ukugxila kwegumbi; ubunikazi bakho buhlala busebenza
help-ma-entry-url =   ?enter=<runtime>             ngena ngemva kwe-login kusuka ku-URL eyabiwe

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

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } athi { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ungene ekamelweni.
room-leave = * { $name } uphume ekamelweni.
room-drop  = * { $name } uwise { $thing }.
room-take  = * { $name } uthatha { $thing }.
err-edit-decode-failed = ukuhlelwa: ukuhumusha kwehlulekile: { $e }
err-edit-fetch-failed = ukuhlelwa: ukuthola kwehlulekile: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ayikho iseshini esisebenzayo — iprofile ayikwazi ukususwa
profile-delete-error = ukususa iprofile kuhlulekile: { $e }
profile-wrong-user = ayikwazi ukusetha i-11 kwenye iphrofayela — eyakho kuphela
profile-wrong-user-name = ayikwazi ukusetha i-11 ye-19 — iphrofayela yakho kuphela
profile-no-ma = asikho isikhathi sokusebenza se-3 esimisiwe — sebenzisa i-31 kuqala
profile-no-cid = ayikho i-3 egcinelwe le phrofayela — sebenzisa i-37 kuqala
profile-no-cid-in-doc = ayikho iphrofayela 11 etholwe kudokhumenti ye-DID — sebenzisa i-43 kuqala
profile-publish-sent = iphrofayela ibethelwe yathunyelwa ku-IPFS; idokhumenti ye-DID izobuyekezwa lapho i-CID ifika
profile-publish-done = iphrofayela ishicilelwe — idokhumenti ye-DID ibuyekezwe nge-ma.agent CID
profile-publish-failed = ukushicilelwa kwephrofayela kwehlulekile: 24
profile-fetch-done = Iphrofayili ilandiwe — okhiye be-18 balayishwe ku-43
profile-fetch-failed = ukulanda kwephrofayela kuhlulekile: 22
msg-identity-exists = umazisi usuvele ushicilelwe — iphrofayili isesikhathini samanje
profile-import-exists = Iphrofayili ethi 8 isivele ikhona — yisuse kuqala
profile-import-wrong-user = ifayela liqukethe iphrofayela 22, okulindelekile 42

# -- CID content operations
cid-op-binary = okuqukethwe kanambambili (akubonisiwe)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = yehlulekile ukulanda okuqukethwe: 25
cid-op-unknown = ukusebenza kokuqukethwe okungaziwa: 27
cid-op-wc = Imigqa ye-{ $lines } 18 amagama 36 amashadi
profiles-empty = (akunamuntu)
profiles-deleted = iprofile { $name } isusiwe
profiles-not-found = iprofile ayitholakali: { $name }

# -- Help topics index
help-header-topics = -- izihloko -- thayipha .help/<topic> ukuze uthole imininingwane
help-topic-msg =   .help/msg                    imiyalezo
help-topic-ma = .help/ma                     ma-isikhala, ukushicilela, nokungena
help-topic-path = .help/path                   uhlelo lolimi lwendawo yamachashazi
help-topic-my =   .help/my                     config yomuntu siqu
help-topic-inbox =   .help/inbox                  ibhokisi lokungenayo
help-topic-doc =   .help/doc                    amadokhumenti
help-topic-actor =   .help/actor                  actor ekude
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: isihloko esingaziwa

# -- Help actor section
help-header-actor = -- ama-actor akude
help-actor-echo =   @actor                       bonisa i-DID exazululiwe
help-actor-text = @actor[#entity]!msg|!say|!emote body         thumela umlayezo oqondile/wengxoxo/okhungathekile
help-actor-ping = @actor:ping                  ukuphila ping
help-actor-entities =   @actor/entities              bala ama-entity
help-actor-entities-get = @actor/entities/<n>          thola i-node yebhizinisi
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   setha ibhizinisi ngereferensi ye-14
help-actor-entities-edit =   @actor/entities/<n>!edit     hlela i-entity
help-actor-entities-del = @actor/entities/<n>:         susa ibhizinisi
help-actor-config-get =   @actor/config/<key>          thola inani le-config
help-actor-config-set =   @actor/config/<key>: val     setha inani le-config
help-actor-acl = @actor/acl                   Thola i-4
help-actor-acl-edit =   @actor/acl!edit              hlela i-ACL
help-actor-fragment =   @actor#entity                thumela ku-plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ku-plugin
help-header-cid-ops = ── 3 umlingisi izingcingo ──────────────────────── ─────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  shayela ibhizinisi i-15 kusuka ku-24 bese ulinda impendulo yalo
help-actor-head = (@actor/path)                landa okuqukethwe kwe-CRUD okukude ku-31
help-actor-tail = (<bafy...>)                  faka futhi uhlole i-21 kusuka ku-36 41
help-actor-wc = (define x (@actor:verb arg))  gcina izimpendulo ze-5 endaweni yeseshini
help-actor-wc-l = .my.scheme.ma!edit           hlela abasizi be-11 abalondoloziwe kulobu bunikazi

help-topic-url =   .help/url                    ukuvula zion ngesixhokelelwano se-URL
help-topic-i18n = .help/i18n                   ulimi oluncamelayo ngobuwena
help-header-url = ── izinhlelo ze-URL ─────────────────────────────────────────────────────────────
help-url-intro =   Yabelana ngesixhokelelwano esivula zion enomamukeli osegcwaliswe phambilini:
help-url-msg =   ?msg=<did>                   gcwalisa phambilini: @<did>!msg (umlayezo olula)
help-url-say =   ?say=<did>                   gcwalisa phambilini: @<did>!say (isenzo say)
help-url-emote =   ?emote=<did>                 gcwalisa phambilini: @<did>!emote (isenzo emote)
help-url-ma = ?ma=<did-or-url>              gcwalisa ngaphambili isikhathi sokusebenza se-DID / 23 URL
help-url-enter = ?enter=<runtime>             faka umhlaba wesikhathi sokusebenza ngemuva kokungena ngemvume
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ukufakwa kugcwaliswe phambilini kodwa akuthunyiswanga — cindezela Enter ukuthumela.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                shicilela ubunikazi bakho kwi-network
help-header-publish = ── ukushicilela ubunikazi ────────────────────────────────────────────────────
help-publish-intro = Ukushicilela kwenza ubunikazi bakho butholakale ku-network. Abanye bangafuna i-DID yakho ukukufinyelela.
help-publish-ma = Ukushicilela, udinga u-ma (runtime yendawo) ofakiwe. Ixhuma i-ego ne-IPFS/IPNS egameni lakho.
help-publish-steps = Izinyathelo: qhuba '.ma [port]' ukuze uthole u-ma wendawo, bese '.my.identity!publish @ma'.
help-publish-without = Ngaphandle kokushicilela, abanye abanakukufinyelela — ngisho noma bazi i-DID yakho, abanakuxazulula i-endpoint yakho.
profile-fetch-did-resolve-failed = Ayikashicilelwa okwamanje — sebenzisa i-28 kuqala, bese u-67 iphrofayela yakho
profile-update-done = iphrofayili ibuyekeziwe — okhiye be-18 bahlanganiswe kusuka ku-43
profile-delete-needs-name = cacisa igama lephrofayela: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Ukuqoqa iqoqo — thayipha imiyalo, gcina ngo-.batch
batch-already-collecting = Usuvele uqoqa iqoqo — gcina ngo-.batch kuqala
batch-empty = Iqoqo lalingenalutho - akukho okwakungenziwa
batch-running = I-batch iyasebenza…
batch-step-timeout = Isinyathelo seqoqo siphelelwe yisikhathi

batch-done = I-batch iphelile ngo-{ $secs }s — { $steps } izinyathelo
batch-done-error = I-batch iphelile ngamaphutha ngo-{ $secs }s — { $steps } izinyathelo
msg-timeout = Umlayezo uphelelwe isikhathi (akukho mpendulo ku-60s)
err-unknown-command = umyalo ongaziwa: { $path }
err-read-only-path = { $path } ifundeka kuphela
help-cmd-batch-async =   .batch:async / .batch        hlola idokhumenti ye-scratch ngokuhambisana


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Yehlulekile ukuthola CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ayilungile: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Isexwayiso: Ikhiye yakho yimfihlo ye-IPNS iyothumelwa ku-runtime ukuze ishicilelwe isinakiso. Sebenzisa kuphela i-runtime oyethembayo ngokugcwele.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
