# zion — Hausa
lang-name = Hausa
label-nick = lakabi
new-identity-nick-help = Zaɓi lakabi don 間-space. Lakabi ne kawai, kuma za ka iya canza shi a kowane lokaci.
error-nick-required = ana buƙatar lakabi
error-nick-invalid = lakabi kada ya ƙunshi sarari ko @

# ── Shafin shiga ──────────────────────────────────────────────────────────
tab-login = shiga
tab-new-identity = sabon asali
tab-import-profile = shigo da bayanan martaba
label-passphrase = kalmar sirri
label-username = sunan mai amfani
label-confirm-passphrase = tabbatar da kalmar sirri
label-did = DID
label-profile-cid = CID na martaba
label-or-file = ko fayil
btn-login = shiga
btn-export = fitar da
btn-generate = samar
btn-new-endpoint = sabon ƙarshe
btn-import-profile = shigo da bayanan martaba
btn-show-qr = nuna QR
btn-scan-qr = duba QR
qr-scan-hint = Nuna kyamara zuwa lambar QR ta bayanan martaba na zion.
qr-error-camera = babu kyamara: { $e }
qr-error-too-large = bayanan martaba sun yi girma da yawa ga lambar QR
passphrase-warning = Rasa kalmar sirri = rasa asali. Babu dawo.
import-profile-help = Shigo da martabar ta CID ko fayil. Kana bukata kalmar sirri ɗaya da aka yi amfani da ita yayin buga.
import-profile-detected-user = Martabar ta: { $name }
status-unlocking = ana buɗewa...
status-generating = ana samar da asali...
status-reading-file = ana karanta fayil...
status-fetching-profile = ana neman martaba daga IPFS...
status-imported = an shigar da '{ $name }' — je zuwa shafin shiga
status-importing-profile = shigar da martaba...
profile-import-done = an shigo da martabar '{ $name }' — an loda makullin { $n }
error-wrong-passphrase = kalmar sirri ba daidai ba: { $e }
error-identity-not-found = ba a samu asalin '{ $name }' ba
error-username-required = ana buƙatar sunan mai amfani
error-passphrase-required = ana buƙatar kalmar sirri
error-passphrases-no-match = kalmomin sirri ba su dace ba
error-profile-source-required = ba da CID ko loda fayil
error-did-required = shigar DID ɗin ka
error-profile-fetch = ba a iya samun martaba: { $e }
error-profile-no-username = martabar ba ta ƙunshi sunan mai amfani
error-profile-no-identity = asali '{ $name }' ba a samu — fara shigo da asali

# ── Saƙonnin tsarin terminal ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — an shiga a matsayin { $username }
msg-type-help = Rubuta .help don jerin umarni.
msg-getting-started = Gwada: say Hello world, look, .help, ko help.
msg-connecting = ana haɗawa da iroh...
msg-iroh-ready = ƙarshen iroh ya shirya
msg-iroh-failed = iroh: { $e }
msg-auto-published = An buga DID ta hanyar 間 na gida ({ $url })
msg-identity-publication-propagating = Buga shaidar kai har yanzu yana yaduwa; entry ta jinkirta: { $e }
msg-identity-first-publish = Ana buga shaidar kai. Wannan na iya ɗaukar har zuwa daƙiƙa { $seconds }.
msg-ma-connecting-matrix = ana ƙoƙarin haɗa ka da 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = an ɗauki 間 na gida
msg-local-ma-already-claimed = an riga an ɗauki 間 na gida
msg-local-ma-claim-failed = an kasa ɗaukar 間 na gida
msg-identity-not-published = Ba a sami ainihi kan layi ba — idan an shigar da 間 cikin gida, gudanar da '.ma: claim [port]' sannan '.my.identity!publish @ma'. Rubuta '.help/publish' don cikakken bayani.
msg-blocked = ⊗ an toshe [{ $cap }]: { $from }
msg-focus-cleared = an share mai da hankali
msg-left = left
msg-focusing = ana mai da hankali { $did } a matsayin { $prompt }
msg-set = { $path }: { $value }
msg-deleted = an goge { $path } ({ $count } shigarwa)
msg-read-only = { $path } don karatu kawai
msg-subtree-set = { $path } reshe ne; ƙin saita
msg-ancestor-leaf = kakannin { $path } ganye ne; ƙin rufe
msg-key-not-found = ba a samu maɓalli ba: { $path }
msg-link-not-connected = kuskuren ɗaukar hanyar haɗin: ba a haɗa ba
msg-link-fetch-error = kuskuren ɗaukar hanyar haɗin: { $e }
msg-link-key-not-found = ba a samu maɓalli `{ $key }` a cikin takarda da aka haɗa ba

# ── Tabbatar da laƙabi ────────────────────────────────────────────────────
err-alias-name-empty = sunan laƙabi ba zai iya zama fanko ba
err-alias-has-dot = sunayen laƙabi ba su iya ƙunsar '.' ba
err-alias-has-fragment = sunayen laƙabi ba su iya ƙunsar '#' ba
err-alias-value-fragment = ƙimar laƙabi na iya ƙunsar fragment DID-URL guda ɗaya mara komai aƙalla
err-alias-value-path = ƙimar laƙabi dole ne ta kasance did:ma:<ipns> DID ko DID-URL (babu path)
err-alias-not-did = ƙimar laƙabi dole ne ta fara da did:ma:
err-unknown-alias = laƙabi da ba a sani ba: @{ $name }
err-bare-did = ana tsammanin bare did:ma:<ipns> (babu fragment ko path), an samu { $did }

# ── Mai gyara ─────────────────────────────────────────────────────────────
btn-save = ajiye
btn-eval = gudanar
btn-cancel = soke
msg-jobs-cancelled = an soke ayyuka
btn-close = rufe
btn-reply = amsa
btn-publish = wallafa
btn-publish-ipld = wallafa IPLD
msg-reply-sent = an aika amsa
msg-reply-failed = amsa ta kasa: { $e }
msg-entity-publish-sent = entity { $name }: an aika wallafa
msg-entity-publish-failed = wallafar entity ta kasa: { $e }
msg-kind-publish-failed = buga nau'in ya kasa: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: an aika wallafa
msg-field-publish-failed = wallafar filin ta kasa: { $e }
msg-acl-publish-sent = runtime ACL: an aika wallafa
msg-crud-edit-publish-sent = { $path }: an aika wallafa
msg-acl-publish-failed = wallafar runtime ACL ta kasa: { $e }
msg-yaml-error = kuskuren YAML: { $e }
msg-editor-saved = { $path }:ajiye
msg-fetch-review = an ɗauko { $cid } — duba kafin gudanarwa
msg-fetch-failed = ɗaukar { $cid }: { $e }

# ── Aikatau — akwatin wasiku ──────────────────────────────────────────────
inbox-empty = akwatin wasiku fanko ne
inbox-entry-not-found = ba a samu shigarwar akwatin wasiku { $n } ba
inbox-no-message-id = shigarwar akwatin wasiku { $n } ba ta da message_id
inbox-no-verb = babu aikatau `{ $verb }` don shigarwar akwatin wasiku { $n }
inbox-filter-no-arg = tace tana buƙatar jayayya ta DID ko alias
inbox-filter-empty = babu saƙonnin daga { $did }

# ── Aikatau — lokacin gudana ──────────────────────────────────────────────
discover-fetch-failed = bincike ya kasa a { $url }: { $e }
discover-json-error = bincike ya kasa: JSON mara inganci daga { $url }: { $e }
discover-missing-did = bincike ya kasa: status.json yana rasa filin `did`
discover-invalid-did = bincike ya kasa: `did` dole ne ya fara da did:ma:, an samu `{ $did }`
discover-no-endpoint = gargadin bincike: `endpoint_id` yana rasa a status.json; an ajiye DID kawai
discover-hint-endpoint-not-found = Alama: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Alama: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Alama: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Alama: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = an gano 間 a { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   an ƙirƙiri laƙabi @ma — gudanar da '.my.identity!publish @ma' don wallafa ainihinku.
claim-success = an ɗauki Runtime don { $did }
claim-conflict = wani asali ya riga ya ɗauki Runtime
claim-already-owned = wannan asali ya riga ya ɗauki Runtime
claim-http-failed = ɗaukar ya kasa: HTTP { $status }
claim-error = ɗaukar ya kasa: { $e }
claim-no-session = ba a shiga ba; shiga da farko don ɗaukar runtime
runtime-no-verb = babu aikatau `{ $verb }` don { $path }

# ── Aikatau — ACL ─────────────────────────────────────────────────────────
acl-reset = an sake saita .my.acl (buɗe gaba ɗaya)
err-persist = kuskuren ajiye: { $e }
acl-no-verb = babu aikatau `{ $verb }` don .my.acl

# ── Aikatau — asali ───────────────────────────────────────────────────────
publish-usage = amfani: .my.identity!publish <did-ko-laƙabi>
identity-exported = An sauke ƙunshin a matsayin { $filename }
identity-export-failed = Fitarwa ta kasa: { $e }

# ── Aikatau — takardu ─────────────────────────────────────────────────────
doc-content-empty = { $path } fanko ne
doc-save-first = { $path } fanko ne — ajiye da farko
doc-missing-name = suna na takarda ya ɓace
doc-publish-usage = amfani: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = amfani: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = wallafa { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = wallafawa ta kasa [{ $code }]: { $err }
doc-publish-error-hint = Alama: { $hint }
doc-publish-hint-session = sake shiga don samun damar samun damar maɓallan shaidar ku
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = tabbatar da cewa an buga daftarin aiki na DID kuma ya ƙunshi wurin da za a iya kaiwa ga ƙarshe
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = Runtime/plugin sun ƙi buƙatar; duba dalilin kuma sake gwadawa bayan gyara mahalli/lokacin aiki
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = duba rajistan ayyukan lokaci don cikakken dalili kuma sake gwadawa
doc-store-sent = an aika buƙatar ajiye ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-ipld-store-sent = an aika buƙatar ajiye IPLD ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-fetch-done = an ɗauko { $cid } → { $path } (ba a gudanar ba)
doc-fetch-failed = ɗaukar { $cid }: { $e }
doc-fetch-usage = amfani: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = ba a saita { $path }.cid ba
doc-no-verb = babu aikatau `{ $verb }` don { $path }
path-no-verb = babu aikatau `{ $verb }` don { $path }

# ── Rubutun taimako — taken ───────────────────────────────────────────────
help-header-zion = ── umarnan zion ───────────────────────────────────────────────────────────
help-header-messaging = ── aikawasiku ───────────────────────────────────────────────────────────
help-header-config = ── nahawun saitunan gida ─────────────────────────────────────────────────
help-header-common = ── hanyoyin gama gari ────────────────────────────────────────────────────
help-header-inbox = ── akwatin wasiku ────────────────────────────────────────────────────────
help-header-documents = ── takardu ──────────────────────────────────────────────────────────────
help-header-i18n = ── harshe ────────────────── ─────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── shiga 間-sarari ───────────────── ──────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Rubutun taimako — umarnan zion ────────────────────────────────────────
help-cmd-help =   .help                        wannan rubutu
help-cmd-clear =   .clear                       share terminal
help-cmd-panic =   .panic                       mafita ta ƙarshe — yi amfani idan akwai matsala
help-cmd-history =   .history [n]                 tarihin umarni (maimaita masu jere sun haɗu); n na zaɓi yana nuna layuka n na ƙarshe kaɗai
help-cmd-logout =   .logout                      fita
help-cmd-batch =   .batch                       ጊዜያዊ ሰነድ ገምግም (በትይዩ)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         ጊዜያዊ ሰነድ መስመር በመስመር ገምግም

# ── Rubutun taimako — aikawasiku ──────────────────────────────────────────
help-msg-echo =   @alias                       nuna DID/DID-URL da aka warware (ba a aika saƙo ba)
help-msg-send =   @alias!msg body / @alias:verb args           aika saƙo / RPC zuwa ɗan wasa
help-msg-fragment =   @alias#fragment:verb body  aika da fragment DID bayyananne
help-msg-escape =   \@name                       @name na zahiri (babu binciken laƙabi)

# ── Rubutun taimako — yanayin mai da hankali ─────────────────────────────

# ── Rubutun taimako — nahawun saitunan ───────────────────────────────────
help-config-get =   .path                        sami ƙimar ganye ko jera ƙananan reshe
help-config-filter =   .path [suna]                 jera sunayen maɓallan yara masu ɗauke da suna
help-config-full =   .path. [suna]                jera cikakkun ƙimomin ƙananan reshe masu ɗauke da suna
help-config-set =   .path: value                 saita ganye
help-config-delete =   .path:                       goge ganye ko ƙananan reshe
help-config-verb =   .path!verb [args]            kira aikatau gida

# ── Rubutun taimako — hanyoyin gama gari ─────────────────────────────────
help-my =   .my                          nuna duk saitunan sirri
help-aliases =   .my.aliases                  jera laƙabai
help-aliases-set =   .my.aliases.<name>: <did-url>    ƙara/sabunta laƙabi (DID ko DID-URL)
help-aliases-del =   .my.aliases.<name>:          cire laƙabi
help-runtime-discover =   .ma: claim [port]          gano runtime na gida kuma samar da laƙabi @ma
help-runtime-claim =   .ma: claim [port]             ɗauki mallakar runtime da DID ɗinka
help-identity =   .my.identity                 nuna saitunan asali
help-identity-did =   .my.identity.did             nuna DID ɗinka (karatu kawai)
help-identity-publish =   .my.identity!publish @pub    wallafa DID ta hanyar sabis na wallafa
help-identity-export =   .my.identity!export          sauke ƙunshin shaida naka
help-config-path =   .config                      nuna duk shigarwar .config.*

# ── Rubutun taimako — akwatin wasiku ─────────────────────────────────────
help-inbox =   .my.inbox                    jera akwatin wasiku (kallon ƙananan reshe)
help-inbox-n =   .my.inbox.N                  nuna filayen shigarwa N
help-inbox-from =   .my.inbox.N.from             DID mai aika shigarwa N
help-inbox-reply =   .my.inbox.N!reply [body]     aika amsa (buɗa mai gyara idan babu jikin saƙo)
help-inbox-open =   .my.inbox.N!open             buɗa abun ciki don karatu kawai a mai gyara
help-inbox-del =   .my.inbox.N:                 goge shigarwa N
help-inbox-delall =   .my.inbox:                   goge duk shigarwar akwatin wasiku
help-inbox-flush =   .my.inbox!flush              buga duk shigarwa zuwa terminal
help-inbox-filter =   .my.inbox!filter @who        nuna shigarwa daga @who kawai
help-inbox-traverse =   .my.inbox.N.sender.<field>   bincika takarda DID mai aika a hankali

# ── Rubutun taimako — takardu ─────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           buɗa mai gyara tare da abun ciki da aka ajiye
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     ɗauko CID, buɗa don duba kawai
help-doc-eval =   .my.doc.<name>!eval           gudanar da abun ciki da aka ajiye layi-balayi
help-doc-publish =   .my.doc.<name>!publish @pub   ajiye a matsayin blob ɗin da ba a sarrafa ba (kowane nau'i)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  ajiye YAML a matsayin kumbun IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    shigo da abun CID (babu gudanarwa)
help-doc-cid =   .my.doc.<name>!cid            nuna CID da aka ajiye
help-doc-del =   .my.doc.<name>:              goge takarda

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n yana adana zaɓin harshen da ke da alaƙa da ainihin ku.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               jera lambobin yare masu samuwa

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Dakin 間 shi ne fili tsakanin shaidun 間. ma yana sa waɗannan shaidu su samu juna su kuma yi sadarwa; idan an wallafa shaidarka, za ka iya shiga.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   haɗa da 間 runtime na gida, karanta /status.json, kuma ajiye .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     wallafa takardar DID ɗinka domin wasu su gano maɓallanka da endpoint ɗinka
help-ma-security = Iyakar amincewa mafi bayyana ita ce 間 runtime naka tare da IPFS Desktop/Kubo naka. Publisher na nesa na iya amfani, amma a lokacin kana dogaro da sabis na wani.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             yadda ake shiga ɗakin 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Idan an san shaidarka, .enter @ma zai baka damar shiga 間. Nemo duniya, shiga cikinta, ka kuma shiga daga can.
help-ma-entry-steps = Fara IPFS Desktop da ma, sannan ka gudanar da .ma. Wallafa da .my.identity!publish @ma, nemo duniya, ka shiga da .enter @ma.
help-ma-entry-command =   .enter @ma                  shiga 間 ta @ma runtime
help-ma-entry-toggle =   .enter                       kunna ko kashe mayar da hankali ga ɗaki; shaidarka tana nan a kunne
help-ma-entry-url =   ?enter=<runtime>             shiga bayan login daga URL da aka raba

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Yarukan da ake da su (saita ta .my.i18n: <code>):
err-lang-not-found = harshe ba a sami ba: { $lang }

msg-send-failed = aika aika: { $e }
msg-not-logged-in = ba a shiga ba

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Kuskure na YAML: { $e }
yaml-not-mapping = YAML dole ya kasance mapping (ma'aunin maɓalli: ƙima); rubutun talaka da sauƙaƙu ba za a iya adana su a matsayin DAG-CBOR ba
dagcbor-encode-error = Kuskuren lissafin DAG-CBOR: { $e }
cbor-decode-error = Kuskuren lalata CBOR: { $e }
cbor-json-error = Kuskuren juyawa CBOR zuwa JSON: { $e }
yaml-serialise-error = Kuskuren jerin YAML: { $e }
edit-reply-invalid = Amsa gyara mara inganci
doc-publish-ipld-error = Bugawa IPLD ta kasa: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kuskuren adana tsabtace akwatin shiga: { $e }
err-config-load = Kuskuren loda saita: { $e }
err-lang-persist = Kuskuren adana yare: { $e }
err-history-parse = Kuskuren binciken tarihi: { $e }
err-history-load = Kuskuren loda tarihi: { $e }
err-history-count-invalid = adadin tarihin dole ne ya zama lamba mai kyau
err-ipfs-reply-decode = Rashin lalata amsar IPFS: { $e }
err-edit-cbor = Kuskuren gyara CBOR: { $e }
err-popup-blocked = Popup ta toshe ta browser
status-publishing = wallafawa

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = kuskure
rpc-error-detail = kuskure: { $detail }
msg-new-message = ← [{ $from }] saƙo sabon — { $count } a akwatin karɓa
msg-chat = { $sender } yana cewa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ya ce { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ya shiga daki.
room-leave = * { $name } ya bar daki.
room-drop  = * { $name } ya jefa { $thing }.
room-take  = * { $name } ya ɗauki { $thing }.
err-edit-decode-failed = gyara: kuskuren fassara: { $e }
err-edit-fetch-failed = gyara: kuskuren nemo: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = babu takardar izni mai aiki — ba za a iya goge bayanan martaba ba
profile-delete-error = gogewa bayanan martaba ta ci tura: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = an rufaffen bayanin martaba an aika shi zuwa IPFS; za a sabunta takardar DID idan CID ya zo
profile-publish-done = an wallafa bayanin martaba — an sabunta takardar DID da ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = ainihi da aka riga aka buga - bayanin martaba har zuwa yau
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = abun ciki na binary (ba a nuna ba)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (babu)
profiles-deleted = an goge bayanan martaba { $name }
profiles-not-found = ba a samu bayanan martaba ba: { $name }

# -- Help topics index
help-header-topics = -- ርዕሶች -- ዝርዝር ለማየት .help/<topic> ይተይቡ
help-topic-msg =   .help/msg                    መልዕክት
help-topic-ma = .help/ma                     間-sarari, bugu, da shigarwa
help-topic-path = .help/path                   nahawu mai digon gida
help-topic-my =   .help/my                     የግል config
help-topic-inbox =   .help/inbox                  ገቢ መልዕክት
help-topic-doc =   .help/doc                    ሰነዶች
help-topic-actor =   .help/actor                  ርቀት actor
help-topic-zscheme =   .help/zscheme               magangan Scheme a cikin layi da takardu
help-unknown-topic =   .help/{ $topic }: ያልታወቀ ርዕስ

# -- Help actor section
help-header-actor = -- ርቀት ተዋናዮች
help-actor-echo =   @actor                       DID ፍቺን አሳይ
help-actor-text = @actor[#entity]!msg|!say|!emote body         aika saƙon kai tsaye/taɗi/emote
help-actor-ping = @actor:ping                  rayuwa ping
help-actor-entities =   @actor/entities              entitiy ዘርዝር
help-actor-entities-get = @actor/entities/<n>          samun kumburin mahalli
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity አርትዕ
help-actor-entities-del = @actor/entities/<n>:         share mahaluži
help-actor-config-get =   @actor/config/<key>          config እሴት አግኝ
help-actor-config-set =   @actor/config/<key>: val     config እሴት አዘጋጅ
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL አርትዕ
help-actor-fragment =   @actor#entity                ወደ plugin ላክ
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ወደ plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  kiyaye martanin 5 a cikin yanayin zama
help-actor-wc-l = .z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    buɗe zion ta hanyar URL link
help-topic-i18n = .help/i18n                   zaɓin harshe don ainihin ku
help-header-url = ── sharuɗɗan URL ─────────────────────────────────────────────────────────────────
help-url-intro =   Raba hanyar haɗin zion tare da mai karɓa da aka shigar da shi a gaba:
help-url-msg =   ?msg=<did>                   cika a gaba: @<did>!msg (saƙon rubutu)
help-url-say =   ?say=<did>                   cika a gaba: @<did>!say (fi'ili say)
help-url-emote =   ?emote=<did>                 cika a gaba: @<did>!emote (fi'ili emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             shigar da runtime duniya bayan login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Shigarwar an cika a gaba amma ba a aika ba — danna Enter don aika.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                wallafa ainihinku a cikin hanyar sadarwa
help-header-publish = ── wallafa ainihi ───────────────────────────────────────────────────────────
help-publish-intro = Wallafawa yana sa ainihinku ya zama abin samu a cikin hanyar sadarwa. Wasu na iya neman DID ɗinku don tuntubarku.
help-publish-ma = Don wallafawa, kuna buƙatar 間 (runtime na cikin gida) da aka shigar. Yana haɗa ego da IPFS/IPNS a madadin ku.
help-publish-steps = Matakan: gudanar da '.ma: claim [port]' don gano ma na cikin gida, sannan '.my.identity!publish @ma'.
help-publish-without = Ba tare da wallafawa ba, wasu ba za su iya kaiwa gare ka ba — ko da sun san DID ɗinka, ba za su iya warware endpoint ɗinka ba.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = saka sunan bayanin martaba: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Tattara tsari - nau'in umarni, ƙare tare da .batch
batch-already-collecting = Tuni ana tattara tsari - ƙare da .batch farko
batch-empty = Batch ya kasance fanko - babu abin da zai gudana
batch-running = batch በሂደት ላይ…
batch-step-timeout = mataki mataki ya ƙare

batch-done = Batch በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
batch-done-error = Batch ከስህተቶች ጋር በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
msg-timeout = መልዕክቱ ጊዜው አልፏል (በ60s ምላሽ የለም)
err-unknown-command = umarni da ba a sani ba: { $path }
err-read-only-path = { $path } na karantawa kawai ne
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        ጊዜያዊ ሰነድ ገምግም (በትይዩ)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Kuskure wajen ɗaukar CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ba ingantaccen CID ba: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Gargaɗi: Makullin IPNS ɗin ku na sirri zai aika zuwa wannan runtime don wallafa shaida. Yi amfani da runtime da kuka amince da shi gaba ɗaya ne kaɗai.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme yana kimanta maganganun Scheme da aka saka cikin umarnin zion, sannan ya saka sakamakon cikin layin kafin a aika.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    misalin cikin layi; yana aika "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             ma’anoni suna ci gaba a zaman shiga na yanzu
help-zscheme-doc = Takardu: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Gateway IPFS na gida (yana buƙatar izni na browser)

tab-config = Saitin
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
