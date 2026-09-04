# zion — isiXhosa
lang-name = isiXhosa
label-nick = isiteketiso
new-identity-nick-help = Khetha isiteketiso se-間-space. Sisiteketiso nje, kwaye ungasitshintsha nanini na.
error-nick-required = isiteketiso siyafuneka
error-nick-invalid = isiteketiso masingabi nezithuba okanye @

# ── Iphepha lokungena ─────────────────────────────────────────────────────
tab-login = ngena
tab-new-identity = ubunjani obutsha
tab-import-profile = ngenisa iprofayili
label-passphrase = igama elinzulazulu
label-username = igama lomsebenzisi
label-confirm-passphrase = qinisekisa igama elinzulazulu
label-did = DID
label-profile-cid = i-CID yeprofayili
label-or-file = okanye ifayile
btn-login = ngena
btn-export = khipha
btn-generate = yila
btn-new-endpoint = indawo entsha
btn-import-profile = ngenisa iprofayili
btn-show-qr = bonisa i-QR
btn-scan-qr = skena i-QR
qr-scan-hint = Jolisa ikhamera kwikhowudi ye-QR yeprofayili ye-zion.
qr-error-camera = ikhamera ayifumaneki: { $e }
qr-error-too-large = iprofayili inkulu kakhulu kwikhowudi ye-QR
passphrase-warning = Ukulahlekelwa ligama elinzulazulu = ukulahlekelwa ubunjani. Akukho buyiselwa.
import-profile-help = Ngenisa iprofayili nge-CID okanye ifayile. Ufuna igama elinye lokufikelela okusetyenziswe xa wawusasaza.
import-profile-detected-user = Iprofayili yeyika: { $name }
status-unlocking = ivulwa...
status-generating = ubunjani buyilwa...
status-reading-file = ifayile ifundwa...
status-fetching-profile = kufunyanwa iprofayili kwi-IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = '{ $name }' ingenisiwe — jika kwithebhu yokungena
status-importing-profile = kufakwa iprofayili...
profile-import-done = iprofayili ingenisiwe ngo '{ $name }' — { $n } izitshixo zifakiwe
error-wrong-passphrase = igama elinzulazulu aliho: { $e }
error-identity-not-found = ubunjani '{ $name }' bufumanekanga
error-username-required = igama lomsebenzisi liyafuneka
error-passphrase-required = igama elinzulazulu liyafuneka
error-passphrases-no-match = amagama elinzulazulu awafani
error-profile-source-required = nikela CID okanye layisha ifayile
error-did-required = ngenisa i-DID yakho
error-profile-fetch = ayikwazanga ukufumana iprofayili: { $e }
error-profile-no-username = iprofayili ayinagama lomsebenzisi
error-profile-no-identity = isazisi '{ $name }' ayifunyanwanga — ngenisa isazisi kuqala

# ── Imiyalezo yenkqubo ye-terminal ────────────────────────────────────────
msg-logged-in = zion v{ $version } — ungene njengo { $username }
msg-type-help = Chwetheza .help ukufumana uluhlu lwemiyalelo.
msg-getting-started = Zama: say Hello world, look, .help, okanye help.
msg-connecting = iyaxhuma ku-iroh...
msg-iroh-ready = i-endpoint ye-iroh ilungele
msg-iroh-failed = iroh: { $e }
msg-auto-published = I-DID ipapashiwe nge-間 yendawo ({ $url })
msg-identity-publication-propagating = Upapasho lwesazisi lusasasazeka; entry ilibazisekile: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = Ukukhangela kwe-MA ethenjwayo kungathatha ukuya kuthi ga kwimizuzwana eyi-{ $seconds }.
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Kupapashwa isazisi. Oku kungathatha ukuya kuthi ga kwimizuzwana eyi-{ $seconds }.
msg-ma-connecting-matrix = sizama ukukudibanisa ne-間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = i-間 yendawo ibisiwe
msg-local-ma-already-claimed = i-間 yendawo sele ibisiwe
msg-local-ma-claim-failed = akuphumelelanga ukubisa i-間 yendawo
msg-identity-not-published = Ubuzwe abufumanisekanga ku-intanethi — ukuba u-間 ufakiwe endaweni, qhuba '.ma: claim [port]' wulandelise '.my.identity!publish @ma'. Bhala '.help/publish' ngenkcazelo.
msg-blocked = ⊗ ivalelwe [{ $cap }]: { $from }
msg-focus-cleared = ukugxila kucinyiwe
msg-left = left
msg-focusing = ukugxila ku-{ $did } njengo { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } icinyiwe ({ $count } iingeniso)
msg-read-only = { $path } ifundwa kuphela
msg-subtree-set = { $path } yisihlahla; ikhanyele ukusetha
msg-ancestor-leaf = okhokho base-{ $path } ligqabi; ikhanyele ukugquma
msg-key-not-found = isitshixo safumaneka: { $path }
msg-link-not-connected = impazamo yokulanda ixhuma: akuxhunyiwe
msg-link-fetch-error = impazamo yokulanda ixhuma: { $e }
msg-link-key-not-found = isitshixo `{ $key }` safumaneka kwimveliso yexhumaniso

# ── Ukuqinisekiswa kwegama eligunyaziweyo ─────────────────────────────────
err-alias-name-empty = igama legama elikhawulezayo alikwazi ukuba ngenaluto
err-alias-has-dot = amagama amafutshane awakwazi ukuba ne-'.'
err-alias-has-fragment = amagama amafutshane awakwazi ukuba ne-'#'
err-alias-value-fragment = ixabiso legama elikhawulezayo linokuba ne-fragment ye-DID-URL enye kuphela engagcwalanga
err-alias-value-path = ixabiso legama elikhawulezayo kufuneka libe yi-did:ma:<ipns> DID okanye DID-URL (akukho path)
err-alias-not-did = ixabiso legama elikhawulezayo kufuneka liqale nge-did:ma:
err-unknown-alias = igama elikhawulezayo elingaziwa: @{ $name }
err-bare-did = kulindele bare did:ma:<ipns> (ngaphandle kwe-fragment okanye path), ifumene { $did }

# ── Umhleli ───────────────────────────────────────────────────────────────
btn-save = gcina
btn-eval = yenza
btn-cancel = rhoxisa
msg-jobs-cancelled = imisebenzi irhoxisiwe
btn-close = vala
btn-reply = phendula
btn-publish = shicilela
btn-publish-ipld = shicilela IPLD
msg-reply-sent = impendulo ithunyelwe
msg-reply-failed = impendulo yehlulekile: { $e }
msg-entity-publish-sent = entity { $name }: ukushicilela kuthunyelwe
msg-entity-publish-failed = ukushicilela i-entity kuhlulekile: { $e }
msg-kind-publish-failed = ukupapasha uhlobo kwiseluleko: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ukushicilela kuthunyelwe
msg-field-publish-failed = ukushicilela intsimi kuhlulekile: { $e }
msg-acl-publish-sent = runtime ACL: ukushicilela kuthunyelwe
msg-crud-edit-publish-sent = { $path }: ukushicilela kuthunyelwe
msg-acl-publish-failed = ukushicilela runtime ACL kuhlulekile: { $e }
msg-yaml-error = impazamo ye-YAML: { $e }
msg-editor-saved = { $path }:gcina
msg-fetch-review = { $cid } ilandwe — phinda ujolise ngaphambi kokuyenza
msg-fetch-failed = ukupheka { $cid }: { $e }

# ── Izenzo — isibhengezo sokufika ─────────────────────────────────────────
inbox-empty = isibhengezo sokufika singenaluto
inbox-entry-not-found = ingeniso yesibhengezo { $n } ayifumaneki
inbox-no-message-id = ingeniso yesibhengezo { $n } ayinayo message_id
inbox-no-verb = akukho senzo `{ $verb }` sengeniso yesibhengezo { $n }
inbox-filter-no-arg = i-filter ifuna isikhalazo se-DID okanye alias
inbox-filter-empty = akukho myalezo ovela ku { $did }

# ── Izenzo — ixesha lokusebenza ───────────────────────────────────────────
discover-fetch-failed = ukubona kuhluleke ku-{ $url }: { $e }
discover-json-error = ukubona kuhluleke: JSON engalunganga evela ku-{ $url }: { $e }
discover-missing-did = ukubona kuhluleke: status.json inzahluko `did` ingekho
discover-invalid-did = ukubona kuhluleke: `did` kufuneka iqale nge-did:ma:, ifumene `{ $did }`
discover-no-endpoint = isexwayiso sokubona: `endpoint_id` ayikho ku-status.json; DID kuphela igciniwe
discover-hint-endpoint-not-found = Icebiso: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Icebiso: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Icebiso: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Icebiso: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 ifunyenwe ku-{ $url }
discover-did-line = DID: { $did }
discover-alias-hint =   i-alias @ma yenziwe — qhuba '.my.identity!publish @ma' ukupapasha ubuzwe bakho.
claim-success = Runtime ibiselwe ku-{ $did }
claim-conflict = Runtime isebiselwe ubunjani obuphela
claim-already-owned = Runtime sele ibisiwe sesi sazisi
claim-http-failed = isicelo sihlulekile: HTTP { $status }
claim-error = isicelo sihlulekile: { $e }
claim-no-session = akungeniwe; ngena kuqala ukufumana i-runtime
runtime-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Izenzo — ACL ──────────────────────────────────────────────────────────
acl-reset = i-.my.acl isetwe kabusha (ivuliwe ngokupheleleyo)
err-persist = impazamo yokugcina: { $e }
acl-no-verb = akukho senzo `{ $verb }` se-.my.acl

# ── Izenzo — ubunjani ─────────────────────────────────────────────────────
publish-usage = ukusetyenziswa: .my.identity!publish <did-okanye-igama-elikhawulezayo>
identity-exported = Ibundle ikhutshelwe njengo { $filename }
identity-export-failed = Ukuthumela ngaphandle kuhlulekile: { $e }

# ── Izenzo — imibhalo ─────────────────────────────────────────────────────
doc-content-empty = { $path } ingenaluto
doc-save-first = { $path } ingenaluto — gcina kuqala
doc-missing-name = igama lemibhalo lilahlekile
doc-publish-usage = ukusetyenziswa: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = ukusetyenziswa: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ukushicilela { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = upapasho lusilele [{ $code }]: { $err }
doc-publish-error-hint = Icebiso: { $hint }
doc-publish-hint-session = ngena kwakhona ukuze i-ego ikwazi ukufikelela izitshixo zakho zesazisi
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = qinisekisa ukuba uxwebhu lweDID lompapashi lupapashiwe kwaye luqulethe isiphelo esifikelelekayo
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = ixesha lokusebenza/i-plugin yaliwe isicelo; hlola isizathu kwaye uzame kwakhona emva kokulungisa iziko/ixesha lokusebenza
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = NONE
doc-store-sent = isicelo sokugcina sithunyelwe ({ $id }) → { $publisher }; CID iyofika nge- reply
doc-ipld-store-sent = isicelo sokugcina se-IPLD sithunyelwe ({ $id }) → { $publisher }; CID iyofika nge- reply
doc-fetch-done = { $cid } ilandwe → { $path } (ayenziwanga)
doc-fetch-failed = ukupheka { $cid }: { $e }
doc-fetch-usage = ukusetyenziswa: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ayisetiwe
doc-no-verb = akukho senzo `{ $verb }` saku-{ $path }
path-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Uncedo — iintloko ─────────────────────────────────────────────────────
help-header-zion = ── imiyalelo ye-zion ────────────────────────────────────────────────────────
help-header-messaging = ── ukuthumela ───────────────────────────────────────────────────────────
help-header-config = ── inkqubo yokuphatha indawo ─────────────────────────────────────────────
help-header-common = ── iindlela ezisetshenziswa kakhulu ───────────────────────────────────────
help-header-inbox = ── isibhengezo sokufika ──────────────────────────────────────────────────
help-header-documents = ── imibhalo ─────────────────────────────────────────────────────────────
help-header-i18n = ── ulwimi ──────────────────────────── ──────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── ukungena 間-isithuba ───────────────────────── ─────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Uncedo — imiyalelo ye-zion ────────────────────────────────────────────
help-cmd-help =   .help                        lo mbhalo
help-cmd-clear =   .clear                       coca i-terminal
help-cmd-panic =   .panic                       indlela yokugqibela — sebenzisa xa uneengxaki
help-cmd-history =   .history [n]                 imbali yemiyalelo (izinto eziphindwayo ezilandelanayo zidityanisiwe); u-n ozikhethelayo ubonisa kuphela imigca engu-n yokugqibela
help-cmd-logout =   .logout                      phuma
help-cmd-batch =   .batch                       hlola idokhumenti ye-scratch ngokuhambisana
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         hlola idokhumenti ye-scratch umugqa nomugqa

# ── Uncedo — ukuthumela ───────────────────────────────────────────────────
help-msg-echo =   @alias                       bonisa i-DID/DID-URL esonjululiweyo (akuthunyelwa myalezo)
help-msg-send = @alias!msg body @alias:verb args thumela imiyalezo ku-actor
help-msg-fragment =   @alias#fragment:verb body  thumela nge-DID fragment ecacileyo
help-msg-escape =   \@name                       @name ngokunyaniseka (akukho uphendulo lwegama elikhawulezayo)

# ── Uncedo — imodi yokugxila ─────────────────────────────────────────────

# ── Uncedo — inkqubo yokuphatha ──────────────────────────────────────────
help-config-get =   .path                        fumana ixabiso legqabi okanye uluhlu lwesihlahla
help-config-filter =   .path [igama]                dwelisa amagama ezitshixo zabantwana aqulethe igama
help-config-full =   .path. [igama]               dwelisa amaxabiso apheleleyo omthi aqulethe igama
help-config-set =   .path: value                 setha igqabi
help-config-delete =   .path:                       cima igqabi okanye isihlahla
help-config-verb =   .path!verb [args]            biza isenzo sendawo

# ── Uncedo — iindlela ezisetshenziswa kakhulu ────────────────────────────
help-my =   .my                          bonisa zonke izikhokelo zobunjani
help-aliases =   .my.aliases                  bala amagama amafutshane
help-aliases-set =   .my.aliases.<name>: <did-url>    yongeza/buyekeza igama elikhawulezayo (DID okanye DID-URL)
help-aliases-del =   .my.aliases.<name>:          susa igama elikhawulezayo
help-runtime-discover =   .ma: claim [port]          fumana i-runtime yendawo yile kwaye yila igama elikhawulezayo @ma
help-runtime-claim =   .ma: claim [port]             zimisele nge-runtime nge-DID yakho
help-identity =   .my.identity                 bonisa izikhokelo zobunjani
help-identity-did =   .my.identity.did             bonisa i-DID yakho (ukufunda kuphela)
help-identity-publish =   .my.identity!publish @pub    shicilela i-DID ngosizo lweshishino loshicilelo
help-identity-export =   .my.identity!export          khutshelwa ibundle yakho yesazisi
help-config-path =   .config                      bonisa zonke iingeniso ze-.config.*

# ── Uncedo — isibhengezo sokufika ────────────────────────────────────────
help-inbox =   .my.inbox                    bala isibhengezo sokufika (ukujonga isihlahla)
help-inbox-n =   .my.inbox.N                  bonisa iintsimi zengeniso N
help-inbox-from =   .my.inbox.N.from             DID yomthumeli wengeniso N
help-inbox-reply =   .my.inbox.N!reply [body]     thumela impendulo (vula umhleli xa kungekho mzimba)
help-inbox-open =   .my.inbox.N!open             vula okuqukethweyo ukufunda kuphela kumhleli
help-inbox-del =   .my.inbox.N:                 cima ingeniso N
help-inbox-delall =   .my.inbox:                   cima zonke iingeniso zesibhengezo
help-inbox-flush =   .my.inbox!flush              printa zonke iingeniso ku-terminal
help-inbox-filter =   .my.inbox!filter @who        bonisa amangeniso avela @who kuphela
help-inbox-traverse =   .my.inbox.N.sender.<field>   hamba imveliso ye-DID yomthumeli ngobulumko

# ── Uncedo — imibhalo ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           vula umhleli nokuqukethweyo okugciniweyo
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     landa i-CID, vula ukujonga kuphela
help-doc-eval =   .my.doc.<name>!eval           yenza okuqukethweyo okugciniweyo umgca ngomgca
help-doc-publish =   .my.doc.<name>!publish @pub   gcina njenge-blob engashintshiwe (uhlobo oluluphi)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  gcina i-YAML njenge-node ye-IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    ngenisa okuqukethweyo kwe-CID (ayenziwanga)
help-doc-cid =   .my.doc.<name>!cid            bonisa i-CID egciniweyo
help-doc-del =   .my.doc.<name>:              cima umbhalo

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = I-.my.i18n igcina ulwimi olukhethwayo olubotshelelwe kwisazisi sakho.
help-i18n-set = .my.i18n: <code>             khetha ulwimi olusetyenziswa ngu20 kolu phawu
help-i18n-list = .my.i18n!list               dwelisa iikhowudi zolwimi ezikhoyo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Igumbi le-間 yindawo ephakathi kwezazisi ze-間. ma yenza ezo zazisi zifumanane kwaye zinxibelelane; xa isazisi sakho sipapashiwe, ungathatha inxaxheba.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   qhagamshela kwi 間 runtime yasekuhlaleni, funda /status.json, uze ugcine .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     papasha uxwebhu lwakho lwe-DID ukuze abanye bafumane izitshixo zakho ne-endpoint yakho
help-ma-security = Umda wokuthembela ocacileyo ngowakho 間 runtime kunye ne-IPFS Desktop/Kubo yakho. I-publisher ekude inganceda, kodwa ngoko uxhomekeke kwinkonzo yomnye umntu.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             indlela yokungena kwigumbi le-間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Xa isazisi sakho sisaziwa, .enter @ma ikuvumela ungene ku-間. Fumana ihlabathi, ungene kulo, uze uthathe inxaxheba apho.
help-ma-entry-steps = Qalisa IPFS Desktop kunye ne ma, emva koko sebenzisa .ma. Papasha ngo .my.identity!publish @ma, fumana ihlabathi, ungene ngo .enter @ma.
help-ma-entry-command =   .enter @ma                  ngena ku-間 nge @ma runtime
help-ma-entry-toggle =   .enter                       vula okanye ucime ugxininiso lwegumbi; isazisi sakho sihlala sisebenza
help-ma-entry-url =   ?enter=<runtime>             ngena emva kwe-login kwi-URL ekwabelwana ngayo

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Iilwimi ezikhona (seta nge .my.i18n: <code>):
err-lang-not-found = ulwimi alufumanekanga: { $lang }

msg-send-failed = ukuthumela kuhlulekile: { $e }
msg-not-logged-in = ungangeni

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Impazamo yokuhlalutya i-YAML: { $e }
yaml-not-mapping = I-YAML kufuneka ibe yimapping (amaqela okhiye: ixabiso); isicatshulwa esiqhelekileyo nazo izisekelo azinakugcinwa njengo-DAG-CBOR
dagcbor-encode-error = Impazamo yokubhala i-DAG-CBOR: { $e }
cbor-decode-error = Impazamo yokuvula i-CBOR: { $e }
cbor-json-error = Impazamo yokuguqula i-CBOR ibe yi-JSON: { $e }
yaml-serialise-error = Impazamo yokuthengisa i-YAML: { $e }
edit-reply-invalid = Impendulo yokuhlela engafanelekanga
doc-publish-ipld-error = Ukupapasha i-IPLD kuhlulekile: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Impazamo yokugcina ukucocwa kwebhokisi lomsebenzi: { $e }
err-config-load = Impazamo yokulouda ukucwangciswa: { $e }
err-lang-persist = Impazamo yokugcina ulwimi: { $e }
err-history-parse = Impazamo yokuhlalutya imbali: { $e }
err-history-load = Impazamo yokulouda imbali: { $e }
err-history-count-invalid = inani lembali kufuneka libe yinombolo epheleleyo entle
err-ipfs-reply-decode = Ukuvula impendulo ye-IPFS kuhlulekile: { $e }
err-edit-cbor = Impazamo yokuhlela i-CBOR: { $e }
err-popup-blocked = Isiphequluli sivimba isaziso esivela
status-publishing = ikhuphulelwa

# ── redigering ─────────────────────────────────────────────────────
term-error = impazamo
term-error-detail = impazamo: { $detail }
msg-new-message = ← [{ $from }] umyalezo omtsha — { $count } kwibhokisi
msg-chat = { $sender } uthi { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } athi { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ungene egumbini.
room-leave = * { $name } uphume egumbini.
room-drop  = * { $name } uwisile { $thing }.
room-take  = * { $name } uthathile { $thing }.
err-edit-decode-failed = uyilelo: ukulingisa akuphumelelanga: { $e }
err-edit-fetch-failed = uyilelo: ukufumana akuphumelelanga: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = akukho iseshoni esiyenzekayo — ayinakususwa iprofayile
profile-delete-error = ukususa iprofayile kuhlulekile: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = iprofayile ifihliwe yaza yathunyelwa kwi-IPFS; uxwebhu lwe-DID luza kuhlaziywa xa i-CID ifika
profile-publish-done = iprofayile ipapashiwe — uxwebhu lwe-DID luhlaziywe nge-ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = isazisi sele sipapashiwe — iprofayile isexesheni
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = umxholo wokubini (awuboniswanga)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (akukho)
profiles-deleted = iprofayile { $name } isusiwe
profiles-not-found = iprofayile ayifumanekanga: { $name }

# -- Help topics index
help-header-topics = -- izihloko -- thayipha .help/<topic> ukuze uthole imininingwane
help-topic-msg = .help/msg imiyalezo
help-topic-ma = .help/ma                     間-isithuba, upapasho, kunye nokungena
help-topic-path = .help/path                   igramma ye-dot-path yendawo
help-topic-my =   .help/my                     config yomuntu siqu
help-topic-inbox =   .help/inbox                  ibhokisi lokungenayo
help-topic-doc =   .help/doc                    amadokhumenti
help-topic-actor =   .help/actor                  actor ekude
help-topic-z =   .help/z                      umxholo we-Scheme woluntu nowabucala
help-topic-zscheme =   .help/zscheme               iintetho ze-Scheme emgceni namaxwebhu
help-unknown-topic =   .help/{ $topic }: isihloko esingaziwa

# -- Help actor section
help-header-actor = -- ama-actor akude
help-actor-echo =   @actor                       bonisa i-DID exazululiwe
help-actor-text = @actor[#entity]!msg|!say|!emote body         thumela umyalezo othe ngqo/incoko/emowuti
help-actor-ping = @actor:ping                  ukuphila ping
help-actor-entities =   @actor/entities              bala ama-entity
help-actor-entities-get = @actor/entities/<n>          fumana indawo yequmrhu
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     hlela i-entity
help-actor-entities-del = @actor/entities/<n>:         cima into
help-actor-config-get =   @actor/config/<key>          thola inani le-config
help-actor-config-set =   @actor/config/<key>: val     setha inani le-config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              hlela i-ACL
help-actor-fragment =   @actor#entity                thumela ku-plugin
help-actor-fragment-verb = @actor#entity:verb [args] ku-plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...) call an entity from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg)) gcina iimpendulo ze-5 kwindawo yeseshoni

help-topic-url =   .help/url                    ukuvula zion ngosixokelelwano lwe-URL
help-topic-i18n = .help/i18n                   ulwimi olukhethayo kwisazisi sakho
help-header-url = ── izihlomelo ze-URL ────────────────────────────────────────────────────────────
help-url-intro =   Yabelana ngosixokelelwano esivula zion onomakenke obhaliwe ngaphambili:
help-url-msg =   ?msg=<did>                   gcwalisa ngaphambili: @<did>!msg (umyalezo olula)
help-url-say =   ?say=<did>                   gcwalisa ngaphambili: @<did>!say (isenzo say)
help-url-emote =   ?emote=<did>                 gcwalisa ngaphambili: @<did>!emote (isenzo emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             ngenisa ixesha lehlabathi emva kokungena
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ingeniso igcwaliswe ngaphambili kodwa ayithunywanga — cofa Enter ukuthumela.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                papasha ubuzwe bakho kwi-network
help-header-publish = ── ukupapasha ubuzwe ────────────────────────────────────────────────────────
help-publish-intro = Ukupapasha kwenza ubuzwe bakho bube nokufunyanwa kwi-network. Abanye banokufuna i-DID yakho ukukufikelela.
help-publish-ma = Ukupapasha, ufuna u-間 (runtime yendawo) ofakiwe. Ixhuma i-ego ne-IPFS/IPNS egameni lakho.
help-publish-steps = Amanyathelo: qhuba '.ma: claim [port]' ukufumana u-ma wendawo, wulandelise '.my.identity!publish @ma'.
help-publish-without = Ngaphandle kokupapasha, abanye abanakufikelela kuwe — nangona bazi i-DID yakho, abanakuyisombulula i-endpoint yakho.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = chaza igama leprofayile: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Ukuqokelela ibhetshi — chwetheza imiyalelo, iphele ngo.batch
batch-already-collecting = Sele uqokelele ibhetshi — gqiba nge.batch kuqala
batch-empty = Ibhetshi yayingenanto - akukho nto inokubaleka
batch-running = I-batch iyasebenza…
batch-step-timeout = Inyathelo lebhetshi liphelelwe lixesha

batch-done = I-batch iphelile ngo-{ $secs }s — { $steps } izinyathelo
batch-done-error = I-batch iphelile ngamaphutha ngo-{ $secs }s — { $steps } izinyathelo
msg-timeout = Umlayezo uphelelwe isikhathi (akukho mpendulo ku-60s)
msg-outbox-open-timeout = umlingisi { $target } akafikeleleki — uqhagamshelwano luphelelwe lixesha emva kwe { $ms }ms
msg-outbox-send-timeout = ukuthumela ku { $target } kuphelelwe lixesha emva kwe { $ms }ms — uqhagamshelwano lusenokuba luqhawukile
err-unknown-command = umyalelo ongaziwayo: { $path }
err-read-only-path = { $path } yeyokufunda kuphela
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        hlola idokhumenti ye-scratch ngokuhambisana


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Akukwazekanga ukufumana CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ayilunganga: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Isilumkiso: Isitshixo sakho sanasese se-IPNS siya-thunyelwa kwi-runtime ukuze kupapashwe ubunyani. Sebenzisa kuphela i-runtime oyithembayo ngokupheleleyo.

# -- Help text -- z and my
help-header-z = ── .z no .my ───────────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       umxholo woluntu okanye opapashekayo; musa ukugcina iimfihlo apha
help-z-scheme =   .z.scheme                  iskripti ye-Scheme esifakwa kwaye sihlolwe ekuqaleni
help-z-control =   .z.scheme                 wena ngokwakho ulawula umxholo weskripti sokuqalisa
help-z-private =   .my.*                     ukucwangciswa kwasekuhlaleni okuyimfihlo; i-Scheme ingagcinwa apha ngokunjalo
help-z-choice =   .z.* / .my.*               sebenzisa .z.* ye-Scheme yoluntu kwaye .my.* ye-Scheme yabucala

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme ivavanya iintetho ze-Scheme ezifakwe kwimiyalelo ye-zion ize ifake isiphumo emgceni phambi kokuthumela.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    umzekelo osemgceni; ithumela "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             iinkcazelo zihlala kwiseshoni yokungena yangoku
help-zscheme-doc = Amaxwebhu: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = I-gateway ye-IPFS yasekhaya (idinga ukuphuma kwe-browser)

tab-config = Iinqalelo
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
