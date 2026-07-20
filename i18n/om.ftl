# zion — Afaan Oromoo
lang-name = Afaan Oromoo

# ── Fuula seensaa ─────────────────────────────────────────────────────────
tab-login = seeni
tab-new-identity = eenyummaa haaraa
tab-import-profile = profaayilii galchi
label-passphrase = jecha icciitii
label-username = maqaa fayyadamaa
label-confirm-passphrase = jecha icciitii mirkaneessi
label-did = DID
label-profile-cid = profaayilii CID
label-or-file = yookaan faayilii
btn-login = seeni
btn-export = baasi
btn-generate = uumi
btn-new-endpoint = dhibcaha haaraa
btn-import-profile = profaayilii galchi
passphrase-warning = Jecha icciitii dhabuu = eenyummaa dhabuu. Deebii hin jiru.
import-profile-help = Profaayilii CID yookaan faayiliidhaan galchi. Paaswardii maxxansaaf fayyadamame waliigala barbaadama.
import-profile-detected-user = Profaayiliin kan: { $name }
status-unlocking = banamaa jira...
status-generating = eenyummaa uumamaa jira...
status-reading-file = faayilii dubbifamaa jira...
status-fetching-profile = profaayilii IPFS irraa fudhachaa...
status-imported = '{ $name }' galame — gara taabii seensaatti deebi'i
status-importing-profile = profaayilii galchinaa...
profile-import-done = profaayiliin '{ $name }' galche — bitootee { $n } fe'ame
error-wrong-passphrase = jecha icciitii dogoggore: { $e }
error-identity-not-found = eenyummaan '{ $name }' hin argamne
error-username-required = maqaa fayyadamaa barbaachisaa dha
error-passphrase-required = jecha icciitii barbaachisaa dha
error-passphrases-no-match = jechoonni icciitii wal hin simne
error-profile-source-required = CID kenni yookaan faayilii galchi
error-did-required = DID kee galchi
error-profile-fetch = profaayilii argachuu hin dandeenye: { $e }
error-profile-no-username = profaayiliin maqaa fayyadamaa hin qabu
error-profile-no-identity = eenummaa '{ $name }' argame hin jiru — duraan eenummaa galchi

# ── Ergaalee sirna terminal ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — akka { $username }tti seenameera
msg-type-help = Tarree ajajootaaf .help barreessi.
msg-connecting = iroh walitti hidhamaa...
msg-iroh-ready = xumura iroh qophaa'eera
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID ma naannoo ({ $url }) tiin maxxanfame
msg-ma-connecting-matrix = gara 間trix si hidhuu yaalama
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 naannoo fudhatame
msg-local-ma-already-claimed = 間 naannoo duraan fudhatameera
msg-local-ma-claim-failed = 間 naannoo fudhachuun hin milkoofne
msg-identity-not-published = Eenyummaan interneetii irraa hin argamne — yoo ma naannoo irratti fe'ame, '.ma [port]' itti aansuun '.my.identity!publish @ma' oofaa. Bal'ina argachuuf '.help/publish' barreessi.
msg-blocked = ⊗ uggurame [{ $cap }]: { $from }
msg-focus-cleared = xiyyeeffannoon qulqullaa'e
msg-focusing = { $did } gara { $prompt }tti xiyyeeffachaa jira
msg-set = { $path }: { $value }
msg-deleted = { $path } haaqame ({ $count } galmeewwan)
msg-read-only = { $path } dubbisuu qofa
msg-subtree-set = { $path } imitee dha; kaa'uu diduu
msg-ancestor-leaf = abbaa haadha { $path } dahoo dha; haguuguu diduu
msg-key-not-found = furtuun hin argamne: { $path }
msg-no-match = walfakkaataan hin jiru
msg-link-not-connected = dogoggora harkifannaa liinkii: walitti hin hidhamne
msg-link-fetch-error = dogoggora harkifannaa liinkii: { $e }
msg-link-key-not-found = furtuun `{ $key }` galmee walitti hidhametti hin argamne

# ── Mirkaneessaa moggaasa ─────────────────────────────────────────────────
err-alias-name-empty = maqaan moggaasaa duwwaa ta'uu hin danda'u
err-alias-has-dot = maqaalee moggaasaa '.' qabaachuu hin danda'an
err-alias-has-fragment = maqaalee moggaasaa '#' qabaachuu hin danda'an
err-alias-value-fragment = gatiin moggaasaa yoo baay’ate fragment DID-URL tokko duwwaa hin taane qabaachuu danda’a
err-alias-value-path = gatiin moggaasaa did:ma:<ipns> DID yookaan DID-URL ta’uu qaba (path hin qabu)
err-alias-not-did = gatiin moggaasaa did:ma: irraa eegaluu qaba
err-unknown-alias = moggaasi beekamu hin jiru: @{ $name }
err-bare-did = bare did:ma:<ipns> eegama ture (fragment ykn path hin qabu), { $did } argame

# ── Sirreessaa ────────────────────────────────────────────────────────────
btn-save = olkaa'i
btn-eval = raawwadhu
btn-cancel = dhiisi
btn-close = cufii
btn-reply = deebisi
btn-publish = maxxansi
btn-publish-ipld = maxxansi IPLD
msg-reply-sent = deebiin ergameera
msg-reply-failed = deebiin hin milkaa'ne: { $e }
msg-entity-publish-sent = entity { $name }: maxxansiin ergameera
msg-entity-publish-failed = maxxansiin entity hin milkaa'ne: { $e }
msg-kind-publish-failed = maxxansi gosa kufe: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: maxxansiin ergameera
msg-field-publish-failed = maxxansiin dirree hin milkaa'ne: { $e }
msg-acl-publish-sent = runtime ACL: maxxansiin ergameera
msg-crud-edit-publish-sent = { $path }: maxxansiin ergameera
msg-acl-publish-failed = maxxansiin runtime ACL hin milkaa'ne: { $e }
msg-yaml-error = dogoggora YAML: { $e }
msg-editor-saved = { $path }:olkaa'i
msg-fetch-review = { $cid } fiddame — raawwachuu dura ilaali
msg-fetch-failed = { $cid } fiduu: { $e }

# ── Gochaalee — fuudhaa ergaa ─────────────────────────────────────────────
inbox-empty = fuudhaa ergaan duwwaadha
inbox-entry-not-found = galmeen fuudhaa ergaa { $n } hin argamne
inbox-no-message-id = galmeen fuudhaa ergaa { $n } message_id hin qabu
inbox-no-verb = gochan `{ $verb }` galmee fuudhaa ergaa { $n }f hin jiru
inbox-filter-no-arg = filtarrichi DID ykn alias barbaada
inbox-filter-empty = ergaan { $did } irraa hin jiru

# ── Gochaalee — yeroo hojii ───────────────────────────────────────────────
discover-fetch-failed = argannoon { $url }: { $e } irratti hin milkaa'ne
discover-json-error = argannoon hin milkaa'ne: JSON dogongoraa { $url }: { $e } irraa
discover-missing-did = argannoon hin milkaa'ne: status.json dirree `did` hin qabu
discover-invalid-did = argannoon hin milkaa'ne: `did` did:ma: irraa eegaluu qaba, `{ $did }` argame
discover-no-endpoint = gorsa argannoo: `endpoint_id` status.json keessa hin jiru; DID qofa kuufame
discover-hint-endpoint-not-found = Yaadachiisa: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Yaadachiisa: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Yaadachiisa: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Yaadachiisa: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma { $url } irratti argame
discover-did-line = DID: { $did }
discover-alias-hint =   maqaa gorsaa @ma uumame — eenyummaa kee maxxansuuf '.my.identity!publish @ma' oofaa.
claim-success = Runtime { $did }f fudhatame
claim-conflict = Runtime eenyummaa biroon duraan fudhatameera
claim-already-owned = Runtime eenyummaa kanaan duraan fudhatameera
claim-http-failed = fudhachuu hin milkaa'ne: HTTP { $status }
claim-error = fudhachuu hin milkaa'ne: { $e }
claim-no-session = hin seenne; runtime fudhachuuf jalqaba seeni
runtime-no-verb = gochan `{ $verb }` { $path }f hin jiru

# ── Gochaalee — ACL ───────────────────────────────────────────────────────
acl-reset = .my.acl deebi'ee qindaa'e (guutummaatti banaa)
acl-persist-error = dogoggora kuusaa: { $e }
acl-no-verb = gochan `{ $verb }` .my.aclf hin jiru

# ── Gochaalee — eenyummaa ─────────────────────────────────────────────────
publish-usage = fayyadamuu: .my.identity!publish <did-ykn-moggaasa>
identity-exported = Bundle garagalche { $filename }
identity-export-failed = Baasuun hin dandeenye: { $e }

# ── Gochaalee — galmeelee ─────────────────────────────────────────────────
doc-content-empty = { $path }.content duwwaadha
doc-save-first = { $path }.content duwwaadha — jalqaba olkaa'i
doc-missing-name = maqaan galmee hin jiru
doc-publish-usage = fayyadamuu: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = fayyadamuu: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = maxxansuu { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = maxxansiisu hin milkoofne [{ $code }]: { $err }
doc-publish-error-hint = Yaadachiisa: { $hint }
doc-publish-hint-session = ammas seena kanaaf ego furtuu eenyummaa keessan argachuu danda'a
doc-publish-hint-target = jedhamuun beekama
DID maxxansaa sirrii ykn maqaa biraa kan 57 qullaa furgu fayyadami
doc-publish-hint-network = jedhamuun beekama
yeroo gaggeeffama 7 fi 22 dhaqqabamaa ta'uu isaanii mirkaneessi, sana booda irra deebi'ii yaali
doc-publish-hint-resolve = jedhamuun beekama
maxxansituu galmeen DID maxxanfamee fi qabxii xumuraa dhaqqabamaa ta'e of keessaa qabaachuu isaa mirkaneessi
doc-publish-hint-acl = jedhamuun beekama
Opereetara maxxansaa DID kee 48 keessatti akka hayyamu gaafadhu
doc-publish-hint-runtime = jedhamuun beekama
runtime/plugin gaaffii sana dide; sababa sakatta'ii erga qaama/yeroo gaggeeffamaa sirreessitee booda irra deebi'ii yaali
doc-publish-hint-ipfs = jedhamuun beekama
haala yeroo gaggeeffama fayyaa fi maxxansaa 12/17 naannoo ilaali
doc-publish-hint-unknown = jedhamuun beekama
sababa bal'aa galmeewwan yeroo gaggeeffamaa sakatta'ii irra deebi'ii yaali
doc-store-sent = gaaffiin kuusaa ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-ipld-store-sent = gaaffiin kuusaa IPLD ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-fetch-done = { $cid } fiddame → { $path }.content (raawwatamuu dide)
doc-fetch-failed = { $cid } fiduu: { $e }
doc-fetch-usage = fayyadamuu: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid hin qindaa'ne
doc-no-verb = gochan `{ $verb }` { $path }f hin jiru
path-no-verb = gochan `{ $verb }` { $path }f hin jiru

# ── Gargaarsa — mataa dureelee ────────────────────────────────────────────
help-header-zion = ── ajajoota zion ──────────────────────────────────────────────────────────
help-header-messaging = ── ergaa erguuf ──────────────────────────────────────────────────────────
help-header-config = ── giiraama qindaa'ina naannoo ──────────────────────────────────────────
help-header-common = ── karaalee waliigalaa ────────────────────────────────────────────────────
help-header-inbox = ── fuudhaa ergaa ───────────────────────────────────────────────────────────
help-header-documents = ── galmeelee ────────────────────────────────────────────────────────────
help-header-i18n = jedhamuun beekama
── afaan ────────────────────────────── ──────────────────────────────
help-header-ma = jedhamuun beekama
── 3-bakka ────────────────────────────── ──────────────────────────────
help-header-ma-entry = jedhamuun beekama
── 間-bakka seenuu ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Gargaarsa — ajajoota zion ─────────────────────────────────────────────
help-cmd-help =   .help                        barruu kana
help-cmd-clear =   .clear                       terminal qulqulleessi
help-cmd-panic =   .panic                       karaa dhumaa — rakkoo yoo mudateef fayyadami
help-cmd-history =   .history                     seenaa ajajaa (irra deddeebi'iinsa walitti-aanaa walitti-qabame)
help-cmd-logout =   .logout                      bahu
help-cmd-batch =   .batch                       ጊዜያዊ ሰነድ ገምግም (በትይዩ)
help-cmd-batch-sync =   .batch:sync / .batch         ጊዜያዊ ሰነድ መስመር በመስመር ገምግም

# ── Gargaarsa — ergaa erguuf ──────────────────────────────────────────────
help-msg-echo =   @alias                       DID/DID-URL furame agarsiisi (ergaan hin ergamu)
help-msg-send =   @alias!msg body / @alias:verb args           ergaa / RPC ergaan seera taphataan
help-msg-fragment =   @alias#fragment:verb body  fragment DID ifaa wajjin ergi
help-msg-escape =   \@name                       @name dhugaa (moggaasni hin barbaadamu)

# ── Gargaarsa — moodii xiyyeeffannoo ─────────────────────────────────────

# ── Gargaarsa — giiraama qindaa'inaa ─────────────────────────────────────
help-config-get =   .path                        gatii dahoo argadhu ykn imitee tarreessi
help-config-filter =   .path value                  gaaffii deebisi (gatiidhaan shaakali)
help-config-set =   .path: value                 dahoo qindi'i
help-config-delete =   .path:                       dahoo ykn imitee haaqama
help-config-verb =   .path!verb [args]            gochaa naannoo waami

# ── Gargaarsa — karaalee waliigalaa ──────────────────────────────────────
help-my =   .my                          qindaa'ina dhuunfaa hunda agarsiisi
help-aliases =   .my.aliases                  moggaasalee tarreessi
help-aliases-set =   .my.aliases.<name>: <did-url> moggaasa ida’i/haaromsi (DID yookaan DID-URL)
help-aliases-del =   .my.aliases.<name>:          moggaasa haaqami
help-runtime-discover =   .ma [port]          runtime naannoo argadhu kaanis moggaasa @ma uumi
help-runtime-claim =   .ma [port]             DID keetiin runtime fudhadhu
help-identity =   .my.identity                 qindaa'ina eenyummaa agarsiisi
help-identity-did =   .my.identity.did             DID kee agarsiisi (dubbisuu qofa)
help-identity-publish =   .my.identity!publish @pub    tajaajiila maxxansaa dhaan DID maxxansi
help-identity-export =   .my.identity!export          bundle eenyummaa kee buufadhu
help-config-path =   .config                      galmeewwan .config.* hunda agarsiisi

# ── Gargaarsa — fuudhaa ergaa ─────────────────────────────────────────────
help-inbox =   .my.inbox                    fuudhaa ergaa tarreessi (mul'ata imitee)
help-inbox-n =   .my.inbox.N                  dirreelee galmee N agarsiisi
help-inbox-from =   .my.inbox.N.from             DID ergaa galmee N
help-inbox-reply =   .my.inbox.N!reply [body]     deebii ergi (qaamni hin jiru yoo ta'e sirreessaan banama)
help-inbox-open =   .my.inbox.N!open             qabiyyee dubbisuu qofa sirreessaatti bani
help-inbox-del =   .my.inbox.N:                 galmee N haaqami
help-inbox-delall =   .my.inbox:                   galmeewwan fuudhaa ergaa hunda haaqami
help-inbox-flush =   .my.inbox!flush              galmeewwan hunda terminalitti maxxansi
help-inbox-filter =   .my.inbox!filter @who        galmeewwan @who irraa qofa agarsiisi
help-inbox-traverse =   .my.inbox.N.sender.<field>   galmee DID ergaa erganii lolasaan saagi

# ── Gargaarsa — galmeelee ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           sirreessaa qabiyyee kuufameen bani
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID fidii, ilaluuf qofa bani
help-doc-eval =   .my.doc.<name>!eval           qabiyyee kuufame sareen raawwadhu
help-doc-publish =   .my.doc.<name>!publish @pub   blob hin safaramin ta'uun kuufi (gosa kamiyyuu)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML huccuu IPLD DAG-CBOR ta'uun kuufi
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    qabiyyee CID galchi (raawwachuu hin dandaa'u)
help-doc-cid =   .my.doc.<name>!cid            CID kuufame agarsiisi
help-doc-del =   .my.doc.<name>:              galmee haaqami

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = jedhamuun beekama
.my.i18n filannoo afaanii eenyummaa kee waliin hidhamee kuufata.
help-i18n-set = .my.i18n: <code>             jedhamuun beekama
afaan 20 eenyummaa kanaaf fayyadamu filadhu
help-i18n-list = .my.i18n!list               jedhamuun beekama
koodii afaanii jiran tarreessi

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Kutaan 間 iddoo eenyummaa 間 gidduu jiru dha. ma eenyummaa kana akka wal arganii fi waliif qunnamaniif gargaara; eenyummaan kee erga maxxanfamee booda hirmaachuu dandeessa.
help-ma-command =   .ma [port]                   ma runtime naannoo kee waliin wal qunnami, /status.json dubbisi, .ma.ctx.* immoo kuusi
help-ma-publish =   .my.identity!publish @ma     galmee DID kee maxxansi, namoonni biroon furtuu fi endpoint kee akka argatan
help-ma-security = Daangaan amantaa ifa ta’e ma runtime kee mataa keetii fi IPFS Desktop/Kubo kee mataa keetii dha. Publisher fagoo ni fayyada ta’a, garuu yeroo sana tajaajila nama biraa irratti hirkata.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             akkamitti kutaa 間 seenuu akka danda’amu

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Eenyummaan kee yoo beekame, .enter @ma gara 間 akka seentu si taasisa. Addunyaa barbaadi, itti seeni, achirraa hirmaadhu.
help-ma-entry-steps = IPFS Desktop fi ma jalqabi, achiin .ma hojjedhu. .my.identity!publish @ma tiin maxxansi, addunyaa barbaadi, .enter @ma tiin seeni.
help-ma-entry-command =   .enter @ma                  @ma runtime keessa gara 間 seeni
help-ma-entry-toggle =   .enter                       xiyyeeffannoo kutaa bani yookaan cufi; eenyummaan kee hojiirra jiraata
help-ma-entry-url =   ?enter=<runtime>             URL qoodame irraa login booda seeni

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Afaanota jiran (.my.i18n: <code> tiin qabi):
err-lang-not-found = afaan hin argamne: { $lang }

msg-send-failed = ergaa erguun hin milkoofne: { $e }
msg-not-logged-in = seenee hin jiru

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Dogoggora YAML: { $e }
yaml-not-mapping = YAML mapping (pair furtuun: gatii) ta'uu qaba; barreeffama duwwaa fi scalar DAG-CBOR ta'ee kuusuu hin danda'u
dagcbor-encode-error = Dogoggora DAG-CBOR: { $e }
cbor-decode-error = Dogoggora CBOR: { $e }
cbor-json-error = Dogoggora CBOR gara JSON: { $e }
yaml-serialize-error = Dogoggora serialization YAML: { $e }
edit-reply-invalid = Deebii gulaala dogoggoraa
doc-publish-ipld-error = Maxxansuu IPLD kufe: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Dogoggora galmeessuu inbox: { $e }
err-config-load = Dogoggora fe'umsaa: { $e }
err-lang-persist = Dogoggora qusachuu afaan: { $e }
err-history-parse = Dogoggora falanqaynta seenaa: { $e }
err-history-load = Dogoggora fe'umsaa seenaa: { $e }
err-ipfs-reply-decode = Deebii IPFS decode kufe: { $e }
err-edit-cbor = Dogoggora gulaala CBOR: { $e }
err-popup-blocked = Popup daldhaame birauzaraan
status-publishing = maxxansuu

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = dogoggora
rpc-error-detail = dogoggora: { $detail }
msg-new-message = ← [{ $from }] ergaa haaraa — { $count } sanduuqa
msg-chat = { $sender } jedha { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } jedha { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } gara kutaa seene.
room-leave = * { $name } kutaa gadhiise.
room-drop  = * { $name } { $thing } harkaa buuse.
room-take  = * { $name } { $thing } fudhate.
err-edit-decode-failed = gulaala: dogoggora hiikuu: { $e }
err-edit-fetch-failed = gulaala: dogoggora fida: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = waltajjii hojii hin jiru — profaayilii haaquu hin danda'amu
profile-delete-error = haaquun profaayilii hin milkoofne: { $e }
profile-wrong-user = jedhamuun beekama
11 piroofaayilii biraatiif saaguu hin danda'u — kan kee qofa
profile-wrong-user-name = jedhamuun beekama
11 19 tiif saaguu hin danda'u — piroofaayilii mataa keetii qofa
profile-no-ma = jedhamuun beekama
yeroon gaggeeffama 3 hin qindaa'e — dursa 31 hojjedhu
profile-no-cid = jedhamuun beekama
3 piroofaayilii kanaaf kuufame hin jiru — dursa 37 hojjedhu
profile-no-cid-in-doc = jedhamuun beekama
piroofaayilii 11 galmee DID keessatti hin argamne — dursa 43 hojjedhu
profile-publish-sent = piroofaayiliin iccitii gara IPFS ergame; galmeen DID yeroo CID dhufu ni haaromfama
profile-publish-done = piroofaayiliin maxxanfame — galmeen DID ma.agent CID tiin haaromfame
profile-publish-failed = jedhamuun beekama
piroofaayilii maxxansuun hin milkoofne: 24
profile-fetch-done = jedhamuun beekama
piroofaayilii fudhatame — furtuuwwan 18 43 irraa fe'aman
profile-fetch-failed = jedhamuun beekama
piroofaayilii fiduun hin milkoofne: 22
msg-identity-exists = jedhamuun beekama
eenyummaa duraan maxxanfame — piroofaayilii yeroo ammaa
profile-import-exists = jedhamuun beekama
profile 8 duraan jira — dursitee haqi
profile-import-wrong-user = faayilii piroofaayilii 22 of keessaa qaba, 42 eegama

# -- CID content operations
cid-op-binary = jedhamuun beekama
qabiyyee baayinarii (hin agarsiifamne) .
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = jedhamuun beekama
qabiyyee fiduu hin dandeenye: 25
cid-op-unknown = jedhamuun beekama
hojii qabiyyee hin beekamne: 27
cid-op-wc = jedhamuun beekama
Sararoota { $lines } 18 jechoota 36 chars
profiles-empty = (hin jiru)
profiles-deleted = profaayilii { $name } haqame
profiles-not-found = profaayilii hin argamne: { $name }

# -- Help topics index
help-header-topics = -- ርዕሶች -- ዝርዝር ለማየት .help/<topic> ይተይቡ
help-topic-msg =   .help/msg                    መልዕክት
help-topic-ma = .help/ma                     jedhamuun beekama
ma-bakka, maxxansaa, fi galtee
help-topic-path = .help/path                   jedhamuun beekama
caasluga daandii tuqaa naannoo
help-topic-my =   .help/my                     የግል config
help-topic-inbox =   .help/inbox                  ገቢ መልዕክት
help-topic-doc =   .help/doc                    ሰነዶች
help-topic-actor =   .help/actor                  ርቀት actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: ያልታወቀ ርዕስ

# -- Help actor section
help-header-actor = -- ርቀት ተዋናዮች
help-actor-echo =   @actor                       DID ፍቺን አሳይ
help-actor-text = @actor[#entity]!msg|!say|!emote body         jedhamuun beekama
ergaa kallattiin/chat/emote erguu
help-actor-ping = @actor:ping                  jedhamuun beekama
jiraachuu ping
help-actor-entities =   @actor/entities              entitiy ዘርዝር
help-actor-entities-get = @actor/entities/<n>          jedhamuun beekama
noodi qaama argachuu
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   jedhamuun beekama
qaama wabii 14 tiin saagi
help-actor-entities-edit =   @actor/entities/<n>!edit     entity አርትዕ
help-actor-entities-del = @actor/entities/<n>:         jedhamuun beekama
qaama haquu
help-actor-config-get =   @actor/config/<key>          config እሴት አግኝ
help-actor-config-set =   @actor/config/<key>: val     config እሴት አዘጋጅ
help-actor-acl = @actor/acl                   jedhamuun beekama
4 argachuu
help-actor-acl-edit =   @actor/acl!edit              ACL አርትዕ
help-actor-fragment =   @actor#entity                ወደ plugin ላክ
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ወደ plugin
help-header-cid-ops = jedhamuun beekama
── 3 taphatichi bilbila ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  jedhamuun beekama
qaama 15 24 irraa bilbiliitii deebii isaa eegi
help-actor-head = (@actor/path)                jedhamuun beekama
qabiyyee CRUD fagoo 31 irraa fiduu
help-actor-tail = (<bafy...>)                  jedhamuun beekama
21 36 41 irraa hammachuu fi madaaluu
help-actor-wc = (define x (@actor:verb arg))  jedhamuun beekama
deebii 5 naannoo turtii keessatti eeguu
help-actor-wc-l = .my.scheme.ma!edit           jedhamuun beekama
gargaartota 11 saagaman eenyummaa kanaaf gulaali

help-topic-url =   .help/url                    zion URL link tiin banuu
help-topic-i18n = .help/i18n                   jedhamuun beekama
filannoo afaanii eenyummaa keetiif
help-header-url = ── ulaagalee URL ────────────────────────────────────────────────────────────────
help-url-intro =   Fuullee itti sirraa'e wajjin zion banu link qoodi:
help-url-msg =   ?msg=<did>                   dursee guuti: @<did>!msg (ergaa salphaa)
help-url-say =   ?say=<did>                   dursee guuti: @<did>!say (jechi say)
help-url-emote =   ?emote=<did>                 dursee guuti: @<did>!emote (jechi emote)
help-url-ma = ?ma=<did-or-url>              jedhamuun beekama
yeroo gaggeeffama dursee guutuu DID / 23 URL
help-url-enter = ?enter=<runtime>             jedhamuun beekama
erga seentee booda addunyaa yeroo gaggeeffamaa galchi
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Galchi guutameera garuu hin ergamne — erguu Enter tuqi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                eenyummaa kee networki irratti maxxansi
help-header-publish = ── eenyummaa maxxansuu ──────────────────────────────────────────────────────
help-publish-intro = Maxxansuun eenyummaa kee networki irratti argamuu danda'u taasisa. Namoota biroo DID kee barbaaduun si argachuu danda'u.
help-publish-ma = Maxxansuuf, ma (runtime naannoo) fe'amuu qaba. Ego fi IPFS/IPNS si bakka buusee walitti hidha.
help-publish-steps = Tartiiba: ma naannoo argachuuf '.ma [port]' oofaa, itti aansuun '.my.identity!publish @ma'.
help-publish-without = Maxxansuu malee namooni biroon si dhaqqabuu hin danda'an — DID kee beekaniiyyuu endpoint kee furuuf dandeetii hin qaban.
profile-fetch-did-resolve-failed = jedhamuun beekama
DID ammallee hin maxxanfamne — dursa 28 hojjedhu, sana booda 67 piroofaayilii kee
profile-update-done = jedhamuun beekama
piroofaayilii haaromfame — furtuuwwan 18 43 irraa walitti makaman
profile-delete-needs-name = maqaa piroofaayilii ibsi: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Tuuta walitti qabuu — ajajoota akaakuu, .batch waliin xumura
batch-already-collecting = jedhamuun beekama
Duraanis batch walitti qabuu — dursa .batch waliin xumura
batch-empty = jedhamuun beekama
Batch duwwaa ture — waan fiigu hin turre
batch-running = batch በሂደት ላይ…
batch-step-timeout = jedhamuun beekama
tarkaanfii batch yeroon isaa darbe

batch-done = Batch በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
batch-done-error = Batch ከስህተቶች ጋር በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
msg-timeout = መልዕክቱ ጊዜው አልፏል (በ60s ምላሽ የለም)
err-unknown-command = ajaja hin beekamne: { $path }
err-read-only-path = { $path } dubbisuu qofa
help-cmd-batch-async =   .batch:async / .batch        ጊዜያዊ ሰነድ ገምግም (በትይዩ)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } fudhatuu dadhabame: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID sirrii miti: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Gorgorsiisa: Furtuun IPNS dhuunfaa keessan runtime kanaatti ergama eenyummaa maxxansuu. Fuula runtime amannu qofa fayyadamaa.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
