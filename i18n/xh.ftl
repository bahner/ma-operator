# zion — isiXhosa
lang-name = isiXhosa

# ── Iphepha lokungena ─────────────────────────────────────────────────────
tab-login = ngena
tab-new-identity = ubunjani obutsha
tab-import = ngenisa
label-passphrase = igama elinzulazulu
label-username = igama lomsebenzisi
label-confirm-passphrase = qinisekisa igama elinzulazulu
btn-login = ngena
btn-export = khipha
btn-generate = yila
btn-new-endpoint = indawo entsha
passphrase-warning = Ukulahlekelwa ligama elinzulazulu = ukulahlekelwa ubunjani. Akukho buyiselwa.
import-help = Khetha ifayile .zion.json ekhishiweyo. Iphakheji igciniwe ngokhuselo.
status-unlocking = ivulwa...
status-generating = ubunjani buyilwa...
status-reading-file = ifayile ifundwa...
status-imported = '{ $name }' ingenisiwe — jika kwithebhu yokungena
error-wrong-passphrase = igama elinzulazulu aliho: { $e }
error-identity-not-found = ubunjani '{ $name }' bufumanekanga
error-username-required = igama lomsebenzisi liyafuneka
error-passphrase-required = igama elinzulazulu liyafuneka
error-passphrases-no-match = amagama elinzulazulu awafani

# ── Imiyalezo yenkqubo ye-terminal ────────────────────────────────────────
msg-logged-in = zion v{ $version } — ungene njengo { $username }
msg-type-help = Chwetheza .help ukufumana uluhlu lwemiyalelo.
msg-connecting = iyaxhuma ku-iroh...
msg-iroh-ready = i-endpoint ye-iroh ilungele
msg-iroh-failed = iroh: { $e }
msg-auto-published = I-DID ipapashiwe nge-ma yendawo ({ $url })
msg-identity-not-published = Ubuzwe abufumanisekanga ku-intanethi — ukuba u-ma ufakiwe endaweni, qhuba '.my.ma:discover' wulandelise '.my.identity:publish @ma'. Bhala '.help.publish' ngenkcazelo.
msg-blocked = ⊗ ivalelwe [{ $cap }]: { $from }
msg-focus-cleared = ukugxila kucinyiwe
msg-focusing = ukugxila ku-{ $did } njengo { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } icinyiwe ({ $count } iingeniso)
msg-read-only = { $path } ifundwa kuphela
msg-subtree-set = { $path } yisihlahla; ikhanyele ukusetha
msg-ancestor-leaf = okhokho base-{ $path } ligqabi; ikhanyele ukugquma
msg-key-not-found = isitshixo safumaneka: { $path }
msg-no-match = akukho ofanayo
msg-link-not-connected = impazamo yokulanda ixhuma: akuxhunyiwe
msg-link-fetch-error = impazamo yokulanda ixhuma: { $e }
msg-link-key-not-found = isitshixo `{ $key }` safumaneka kwimveliso yexhumaniso

# ── Ukuqinisekiswa kwegama eligunyaziweyo ─────────────────────────────────
err-alias-name-empty = igama legama elikhawulezayo alikwazi ukuba ngenaluto
err-alias-has-dot = amagama amafutshane awakwazi ukuba ne-'.'
err-alias-has-fragment = amagama amafutshane awakwazi ukuba ne-'#'
err-alias-value-fragment = ixabiso legama elikhawulezayo kufuneka libe bare did:ma:<ipns> (ngaphandle kwe-fragment)
err-alias-value-path = ixabiso legama elikhawulezayo kufuneka libe bare did:ma:<ipns> (ngaphandle kwepath)
err-alias-not-did = ixabiso legama elikhawulezayo kufuneka liqale nge-did:ma:
err-unknown-alias = igama elikhawulezayo elingaziwa: @{ $name }
err-bare-did = kulindele bare did:ma:<ipns> (ngaphandle kwe-fragment okanye path), ifumene { $did }

# ── Umhleli ───────────────────────────────────────────────────────────────
btn-save = gcina
btn-eval = yenza
btn-cancel = rhoxisa
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
discover-success = ma ifunyenwe ku-{ $url }
discover-did-line = DID: { $did }
discover-alias-hint =   i-alias @ma yenziwe — qhuba '.my.identity:publish @ma' ukupapasha ubuzwe bakho.
claim-success = Runtime ibiselwe ku-{ $did }
claim-conflict = Runtime isebiselwe ubunjani obuphela
claim-http-failed = isicelo sihlulekile: HTTP { $status }
claim-error = isicelo sihlulekile: { $e }
claim-no-session = akungeniwe; ngena kuqala ukufumana i-runtime
runtime-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Izenzo — ACL ──────────────────────────────────────────────────────────
acl-reset = i-.my.acl isetwe kabusha (ivuliwe ngokupheleleyo)
acl-persist-error = impazamo yokugcina: { $e }
acl-no-verb = akukho senzo `{ $verb }` se-.my.acl

# ── Izenzo — ubunjani ─────────────────────────────────────────────────────
publish-usage = ukusetyenziswa: .my.identity:publish <did-okanye-igama-elikhawulezayo>
identity-exported = Ibundle ikhutshelwe njengo { $filename }
identity-export-failed = Ukuthumela ngaphandle kuhlulekile: { $e }

# ── Izenzo — imibhalo ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content ingenaluto
doc-save-first = { $path }.content ingenaluto — gcina kuqala
doc-missing-name = igama lemibhalo lilahlekile
doc-publish-usage = ukusetyenziswa: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = ukusetyenziswa: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = ukushicilela { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = isicelo sokugcina sithunyelwe ({ $id }) → { $publisher }; CID iyofika nge-RPC reply
doc-ipld-store-sent = isicelo sokugcina se-IPLD sithunyelwe ({ $id }) → { $publisher }; CID iyofika nge-RPC reply
doc-fetch-done = { $cid } ilandwe → { $path }.content (ayenziwanga)
doc-fetch-failed = ukupheka { $cid }: { $e }
doc-fetch-usage = ukusetyenziswa: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ayisetiwe
doc-no-verb = akukho senzo `{ $verb }` saku-{ $path }
path-no-verb = akukho senzo `{ $verb }` saku-{ $path }

# ── Uncedo — iintloko ─────────────────────────────────────────────────────
help-header-zion = ── imiyalelo ye-zion ────────────────────────────────────────────────────────
help-header-messaging = ── ukuthumela ───────────────────────────────────────────────────────────
help-header-focus = ── imodi yokugxila ───────────────────────────────────────────────────────
help-header-config = ── inkqubo yokuphatha indawo ─────────────────────────────────────────────
help-header-common = ── iindlela ezisetshenziswa kakhulu ───────────────────────────────────────
help-header-inbox = ── isibhengezo sokufika ──────────────────────────────────────────────────
help-header-documents = ── imibhalo ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Uncedo — imiyalelo ye-zion ────────────────────────────────────────────
help-cmd-help =   .help                        lo mbhalo
help-cmd-clear =   .clear                       coca i-terminal
help-cmd-panic =   .panic                       indlela yokugqibela — sebenzisa xa uneengxaki
help-cmd-history =   .history                     imbali yemiyalelo (izinto eziphindwayo ezilandelanayo zidityanisiwe)
help-cmd-logout =   .logout                      phuma
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Uncedo — ukuthumela ───────────────────────────────────────────────────
help-msg-echo =   @alias                       bonisa DID ephumliwe (akukho imiyalezo ithunyelwayo)
help-msg-send =   @alias[:verb] body           thumela imiyalezo / RPC ku-actor
help-msg-fragment =   @alias#fragment[:verb] body  thumela nge-DID fragment ecacileyo
help-msg-escape =   \@name                       @name ngokunyaniseka (akukho uphendulo lwegama elikhawulezayo)

# ── Uncedo — imodi yokugxila ─────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       gxila ku-actor (iguqula i-prompt)
help-focus-clear =   .use                         susa ukugxila

# ── Uncedo — inkqubo yokuphatha ──────────────────────────────────────────
help-config-get =   .path                        fumana ixabiso legqabi okanye uluhlu lwesihlahla
help-config-filter =   .path value                  cela impendulo (hlunga ngenanani)
help-config-set =   .path: value                 setha igqabi
help-config-delete =   .path:                       cima igqabi okanye isihlahla
help-config-verb =   .path:verb [args]            biza isenzo sendawo

# ── Uncedo — iindlela ezisetshenziswa kakhulu ────────────────────────────
help-my =   .my                          bonisa zonke izikhokelo zobunjani
help-aliases =   .my.aliases                  bala amagama amafutshane
help-aliases-set =   .my.aliases.<name>: <did>    yongeza/buyekeza igama elikhawulezayo (bare DID, ngaphandle kwe-#fragment)
help-aliases-del =   .my.aliases.<name>:          susa igama elikhawulezayo
help-runtime-discover =   .my.ma:discover          fumana i-runtime yendawo yile kwaye yila igama elikhawulezayo @ma
help-runtime-claim =   .my.ma:claim             zimisele nge-runtime nge-DID yakho
help-identity =   .my.identity                 bonisa izikhokelo zobunjani
help-identity-did =   .my.identity.did             bonisa i-DID yakho (ukufunda kuphela)
help-identity-publish =   .my.identity:publish @pub    shicilela i-DID ngosizo lweshishino loshicilelo
help-identity-export =   .my.identity:export          khutshelwa ibundle yakho yesazisi
help-config-path =   .config                      bonisa zonke iingeniso ze-.config.*

# ── Uncedo — isibhengezo sokufika ────────────────────────────────────────
help-inbox =   .my.inbox                    bala isibhengezo sokufika (ukujonga isihlahla)
help-inbox-n =   .my.inbox.N                  bonisa iintsimi zengeniso N
help-inbox-from =   .my.inbox.N.from             DID yomthumeli wengeniso N
help-inbox-reply =   .my.inbox.N:reply [body]     thumela impendulo (vula umhleli xa kungekho mzimba)
help-inbox-open =   .my.inbox.N:open             vula okuqukethweyo ukufunda kuphela kumhleli
help-inbox-del =   .my.inbox.N:                 cima ingeniso N
help-inbox-delall =   .my.inbox:                   cima zonke iingeniso zesibhengezo
help-inbox-flush =   .my.inbox:flush              printa zonke iingeniso ku-terminal
help-inbox-filter =   .my.inbox:filter @who        bonisa amangeniso avela @who kuphela
help-inbox-traverse =   .my.inbox.N.sender.<field>   hamba imveliso ye-DID yomthumeli ngobulumko

# ── Uncedo — imibhalo ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           vula umhleli nokuqukethweyo okugciniweyo
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     landa i-CID, vula ukujonga kuphela
help-doc-eval =   .my.doc.<name>:eval           yenza okuqukethweyo okugciniweyo umgca ngomgca
help-doc-publish =   .my.doc.<name>:publish @pub   gcina njenge-blob engashintshiwe (uhlobo oluluphi)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  gcina i-YAML njenge-node ye-IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    ngenisa okuqukethweyo kwe-CID (ayenziwanga)
help-doc-cid =   .my.doc.<name>:cid            bonisa i-CID egciniweyo
help-doc-del =   .my.doc.<name>:              cima umbhalo

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
yaml-serialize-error = Impazamo yokuthengisa i-YAML: { $e }
edit-reply-invalid = Impendulo yokuhlela engafanelekanga
doc-publish-ipld-error = Ukupapasha i-IPLD kuhlulekile: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Impazamo yokugcina ukucocwa kwebhokisi lomsebenzi: { $e }
err-config-load = Impazamo yokulouda ukucwangciswa: { $e }
err-lang-persist = Impazamo yokugcina ulwimi: { $e }
err-history-parse = Impazamo yokuhlalutya imbali: { $e }
err-history-load = Impazamo yokulouda imbali: { $e }
err-ipfs-reply-decode = Ukuvula impendulo ye-IPFS kuhlulekile: { $e }
err-edit-cbor = Impazamo yokuhlela i-CBOR: { $e }
err-popup-blocked = Isiphequluli sivimba isaziso esivela
status-publishing = ikhuphulelwa

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = impazamo
rpc-error-detail = impazamo: { $detail }
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
profiles-empty = (akukho)
profiles-deleted = iprofayile { $name } isusiwe
profiles-not-found = iprofayile ayifumanekanga: { $name }

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

help-topic-url =   .help.url                    ukuvula zion ngosixokelelwano lwe-URL
help-header-url = ── izihlomelo ze-URL ────────────────────────────────────────────────────────────
help-url-intro =   Yabelana ngosixokelelwano esivula zion onomakenke obhaliwe ngaphambili:
help-url-msg =   ?msg=<did>                   gcwalisa ngaphambili: @<did> (umyalezo olula)
help-url-say =   ?say=<did>                   gcwalisa ngaphambili: @<did>:say (isenzo say)
help-url-emote =   ?emote=<did>                 gcwalisa ngaphambili: @<did>:emote (isenzo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Ingeniso igcwaliswe ngaphambili kodwa ayithunywanga — cofa Enter ukuthumela.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                papasha ubuzwe bakho kwi-network
help-header-publish = ── ukupapasha ubuzwe ────────────────────────────────────────────────────────
help-publish-intro = Ukupapasha kwenza ubuzwe bakho bube nokufunyanwa kwi-network. Abanye banokufuna i-DID yakho ukukufikelela.
help-publish-ma = Ukupapasha, ufuna u-ma (runtime yendawo) ofakiwe. Ixhuma i-ego ne-IPFS/IPNS egameni lakho.
help-publish-steps = Amanyathelo: qhuba '.my.ma:discover' ukufumana u-ma wendawo, wulandelise '.my.identity:publish @ma'.
help-publish-without = Ngaphandle kokupapasha, abanye abanakufikelela kuwe — nangona bazi i-DID yakho, abanakuyisombulula i-endpoint yakho.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
scheme-cid-fetch-error = Akukwazekanga ukufumana CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ayilunganga: { $value }
