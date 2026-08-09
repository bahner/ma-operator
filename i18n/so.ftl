# zion — Soomaaliga
lang-name = Soomaali
label-nick = naanays
new-identity-nick-help = Dooro naanays loogu talagalay 間-space. Waa naanays keliya, waadna beddeli kartaa goor kasta.
error-nick-required = naanays ayaa loo baahan yahay
error-nick-invalid = naanaysku ma lahaan karo meel bannaan ama @

# ── Bogga gelitaanka ──────────────────────────────────────────────────────
tab-login = gal
tab-new-identity = aqoonsi cusub
tab-import-profile = keen xogta shakhsiga
label-passphrase = ereyga sirta
label-username = magaca isticmaalaha
label-confirm-passphrase = xaqiiji ereyga sirta
label-did = DID
label-profile-cid = CID shakhsiga
label-or-file = ama fayl
btn-login = gal
btn-export = soo saar
btn-generate = abuur
btn-new-endpoint = xidid cusub
btn-import-profile = keen xogta shakhsiga
btn-show-qr = muuji QR
btn-scan-qr = iskaan QR
qr-scan-hint = Kamaradda ku toosi koodhka QR ee xogta shakhsiga zion.
qr-error-camera = kamarad lama helayo: { $e }
qr-error-too-large = xogta shakhsigu aad bay u weyn tahay koodhka QR
passphrase-warning = Luminta ereyga sirta = luminta aqoonsigu. Soo noqosho ma jirto.
import-profile-help = Keen xogta shakhsiga adiga CID ama fayl. Waxaad u baahan tahay isla erayga sirta ee la isticmaalay markii la daabacaayay.
import-profile-detected-user = Xogta shakhsiga waa kan: { $name }
status-unlocking = la furayo...
status-generating = aqoonsiga la abuurayo...
status-reading-file = faylka la akhriyayo...
status-fetching-profile = waxaa la keenayaa xogta shakhsiga IPFS...
status-imported = '{ $name }' ayaa la keenay — u beddel taabka gelitaanka
status-importing-profile = waxaa la keenayaa xogta shakhsiga...
profile-import-done = xogta shakhsiga la keenay '{ $name }' — { $n } furayaal la raray
error-wrong-passphrase = ereyga sirta waa khalad: { $e }
error-identity-not-found = aqoonsiga '{ $name }' lama helin
error-username-required = magaca isticmaalaha ayaa loo baahan yahay
error-passphrase-required = ereyga sirta ayaa loo baahan yahay
error-passphrases-no-match = ereyada sirta kuma habboona
error-profile-source-required = sii CID ama soo gali fayl
error-did-required = geli DID-kaaga
error-profile-fetch = lama heli karin xogta shakhsiga: { $e }
error-profile-no-username = xogta shakhsiga kuma jirto magac isticmaale
error-profile-no-identity = aqoonsiga '{ $name }' lama helin — marka hore keen aqoonsiga

# ── Fariimaha nidaamka terminal ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — waad galeen ahaan { $username }
msg-type-help = Qor .help si aad u hesho liiska amarka.
msg-getting-started = Isku day: say Hello world, look, .help, ama help.
msg-connecting = iroh lagula xidhanayo...
msg-iroh-ready = dhamaadka iroh ayaa diyaar ah
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID lagu daabacay 間 maxalliga ({ $url })
msg-identity-publication-propagating = Daabacaadda aqoonsigu wali way faafaysaa; entry waa dib u dhacay: { $e }
msg-identity-first-publish = Aqoonsiga ayaa markii ugu horreysay la daabacayaa. Tani waxay qaadan kartaa ilaa { $seconds } ilbiriqsi.
msg-ma-connecting-matrix = waxaan isku dayeynaa inaan kugu xirno 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 maxalli ah waa la hantiyay
msg-local-ma-already-claimed = 間 maxalli ah hore ayaa loo hantiyay
msg-local-ma-claim-failed = lama hanti karin 間 maxalli ah
msg-identity-not-published = Aqoonsigii lama helin onlayn — haddii 間 la rakibay gudaha, orod '.ma [port]' ka dibna '.my.identity!publish @ma'. Qor '.help/publish' faahfaahin.
msg-blocked = ⊗ la xiday [{ $cap }]: { $from }
msg-focus-cleared = xushmadda la tirtiray
msg-left = left
msg-focusing = xushmadda { $did } ahaan { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } la tirtirtay ({ $count } gelitaan)
msg-read-only = { $path } waxaa loo akhrin karaa oo keliya
msg-subtree-set = { $path } geed yar ah; diiday in la dhigo
msg-ancestor-leaf = awoowayaasha { $path } caleenta ah; diiday in la dabooло
msg-key-not-found = furaha lama helin: { $path }
msg-link-not-connected = khaladka qaadashada xidhmada: lama xidhin
msg-link-fetch-error = khaladka qaadashada xidhmada: { $e }
msg-link-key-not-found = furaha `{ $key }` dokumantigii la xidhay lama helin

# ── Xaqiijinta magaca kale ────────────────────────────────────────────────
err-alias-name-empty = magaca magaca kale ma noqon karo mid maran
err-alias-has-dot = magacyada kale kuma jiri karaan '.'
err-alias-has-fragment = magacyada kale kuma jiri karaan '#'
err-alias-value-fragment = qiimaha magaca kale wuxuu yeelan karaa ugu badnaan hal fragment DID-URL oo aan madhnayn
err-alias-value-path = qiimaha magaca kale waa inuu noqdaa did:ma:<ipns> DID ama DID-URL (path la’aan)
err-alias-not-did = qiimaha magaca kale waa inuu ku billowdo did:ma:
err-unknown-alias = magaca kale aan la garanin: @{ $name }
err-bare-did = bare did:ma:<ipns> ayaa la filaayay (fragment ama path la'aan), { $did } ayaa la helay

# ── Tifatiraha ────────────────────────────────────────────────────────────
btn-save = keydi
btn-eval = socodsii
btn-cancel = jooji
msg-jobs-cancelled = shaqooyinkii waa la joojiyey
btn-close = xidh
btn-reply = jawaab
btn-publish = daabac
btn-publish-ipld = daabac IPLD
msg-reply-sent = jawaabta la diray
msg-reply-failed = jawaabtu ku guuldareysatay: { $e }
msg-entity-publish-sent = entity { $name }: daabacaadda la diray
msg-entity-publish-failed = daabacaadda entity ku guuldareysatay: { $e }
msg-kind-publish-failed = daabacaadda nooca waxay ku guuldarraystay: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: daabacaadda la diray
msg-field-publish-failed = daabacaadda goobta ku guuldareysatay: { $e }
msg-acl-publish-sent = runtime ACL: daabacaadda la diray
msg-crud-edit-publish-sent = { $path }: daabacaadda la diray
msg-acl-publish-failed = daabacaadda runtime ACL ku guuldareysatay: { $e }
msg-yaml-error = khaladka YAML: { $e }
msg-editor-saved = { $path }:keydi
msg-fetch-review = { $cid } la soo qaatay — dib u eeg ka hor socodsiinta
msg-fetch-failed = qaadashada { $cid }: { $e }

# ── Ficilada — sanduuqa gelitaanka ────────────────────────────────────────
inbox-empty = sanduuqa gelitaanku wuu maran yahay
inbox-entry-not-found = gelitaanka sanduuqa { $n } lama helin
inbox-no-message-id = gelitaanka sanduuqa { $n } message_id ma laha
inbox-no-verb = ficil `{ $verb }` gelitaanka sanduuqa { $n } ma jiro
inbox-filter-no-arg = shaandhaynaasha waxay u baahan yihiin DID ama magacgalnida doodda
inbox-filter-empty = wax farriin ah kuma jirin { $did }

# ── Ficilada — wakhtiga shaqada ───────────────────────────────────────────
discover-fetch-failed = ogaanshaha ku guuldareystay { $url }: { $e }
discover-json-error = ogaanshaha ku guuldareystay: JSON khalad ah oo ka timid { $url }: { $e }
discover-missing-did = ogaanshaha ku guuldareystay: status.json goobta `did` waad ka maqan tahay
discover-invalid-did = ogaanshaha ku guuldareystay: `did` waa inuu ku billowdo did:ma:, `{ $did }` la helay
discover-no-endpoint = digniin ogaanshaha: `endpoint_id` ka maqan status.json; DID oo keliya la keydiay
discover-hint-endpoint-not-found = Tilmaan: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Tilmaan: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Tilmaan: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tilmaan: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 laga ogaaday { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   magac-beelka @ma ayaa la abuuray — orod '.my.identity!publish @ma' si aad u baahiso aqoonsikaaga.
claim-success = Runtime waxaa loo hantiyay { $did }
claim-conflict = Runtime aqoonsi kale ayaa hore u hantiyay
claim-already-owned = Runtime aqoonsigan ayaa hore u hantiyay
claim-http-failed = codsigii ku guuldareystay: HTTP { $status }
claim-error = codsigii ku guuldareystay: { $e }
claim-no-session = lama gelin; gal horta si aad u hantido runtime
runtime-no-verb = ficil `{ $verb }` { $path } ma jiro

# ── Ficilada — ACL ────────────────────────────────────────────────────────
acl-reset = .my.acl dib loo dejiyay (si buuxda u furan)
acl-persist-error = khaladka keydinта: { $e }
acl-no-verb = ficil `{ $verb }` .my.acl ma jiro

# ── Ficilada — aqoonsiga ──────────────────────────────────────────────────
publish-usage = isticmaalka: .my.identity!publish <did-ama-magaca-kale>
identity-exported = Bundle-ka waxaa loo dejisay { $filename }
identity-export-failed = Dhoofinta waxay la kulmeen: { $e }

# ── Ficilada — dokumantigyada ─────────────────────────────────────────────
doc-content-empty = { $path } wuu maran yahay
doc-save-first = { $path } wuu maran yahay — horta keydi
doc-missing-name = magaca dokumantigga waa la waayay
doc-publish-usage = isticmaalka: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = isticmaalka: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = daabacaadda { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = daabacaaddu way fashilantay [{ $code }]: { $err }
doc-publish-error-hint = Tilmaan: { $hint }
doc-publish-hint-session = mar kale gal si ego uu u galo furayaasha aqoonsigaga
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = xaqiiji in daabacaha DID dukumeentiga la daabacay oo ka kooban yahay barta dhamaadka la gaari karo
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = Runtime/plugin ayaa diiday codsiga; kormeer sababta oo isku day dib u hagaajinta goobta/waqtiga runtu tahay
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = baadh diiwaanka runtime sababta faahfaahsan oo dib u tijaabi
doc-store-sent = codsiga kaydinta la diray ({ $id }) → { $publisher }; CID waxay ku imaanaysaa jawaabta RPC
doc-ipld-store-sent = codsiga kaydinta IPLD la diray ({ $id }) → { $publisher }; CID waxay ku imaanaysaa jawaabta RPC
doc-fetch-done = { $cid } la soo qaatay → { $path } (lama socodsiin)
doc-fetch-failed = qaadashada { $cid }: { $e }
doc-fetch-usage = isticmaalka: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid lama dejin
doc-no-verb = ficil `{ $verb }` { $path } ma jiro
path-no-verb = ficil `{ $verb }` { $path } ma jiro

# ── Gargaarku — cinwaanada ────────────────────────────────────────────────
help-header-zion = ── amarka zion ────────────────────────────────────────────────────────────
help-header-messaging = ── farriin diridda ───────────────────────────────────────────────────────
help-header-config = ── naxwaha dejinta deegaanka ─────────────────────────────────────────────
help-header-common = ── wadooyinka caadiga ah ─────────────────────────────────────────────────
help-header-inbox = ── sanduuqa gelitaanka ────────────────────────────────────────────────────
help-header-documents = ── dokumantigyada ────────────────────────────────────────────────────────
help-header-i18n = ── luqadda ──────────────── ────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ─ gelitaanka 間-space ──────────────── ────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Gargaarku — amarka zion ───────────────────────────────────────────────
help-cmd-help =   .help                        qoraalkan
help-cmd-clear =   .clear                       nadiifi terminal
help-cmd-panic =   .panic                       xallinta ugu dambeysa — isticmaal haddaad dhibaato ku jirto
help-cmd-history =   .history                     taariikhda amarrada (nuqulaha xiriirka biirtay)
help-cmd-logout =   .logout                      ka bax
help-cmd-batch =   .batch                       ጊዜያዊ ሰነድ ገምግም (በትይዩ)
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         ጊዜያዊ ሰነድ መስመር በመስመር ገምግም

# ── Gargaarku — farriin diridda ───────────────────────────────────────────
help-msg-echo =   @alias                       muuji DID/DID-URL la xaliyay (farriin lama diro)
help-msg-send =   @alias!msg body / @alias:verb args           dir farriin / RPC u sheegto actor
help-msg-fragment =   @alias#fragment:verb body  dir xidhmad leh DID fragment cad
help-msg-escape =   \@name                       @name dhab ah (raadinta magaca kale ma jirto)

# ── Gargaarku — xaaladda xushmadda ───────────────────────────────────────

# ── Gargaarku — naxwaha dejinta ───────────────────────────────────────────
help-config-get =   .path                        hel qiimaha caleenta ama liiska geedka yar
help-config-filter =   .path [magac]                tax magacyada furayaasha carruurta ee magac ku jira
help-config-full =   .path. [magac]               tax qiimayaasha geedka yar oo dhan ee magac ku jira
help-config-set =   .path: value                 dejiso caleenta
help-config-delete =   .path:                       tirtir caleenta ama geedka yar
help-config-verb =   .path!verb [args]            wac ficilka deegaanka

# ── Gargaarku — wadooyinka caadiga ah ────────────────────────────────────
help-my =   .my                          tus dhammaan dejintada shakhsiga
help-aliases =   .my.aliases                  liisko magacyada kale
help-aliases-set =   .my.aliases.<name>: <did-url>    ku dar/cusbooneysii magaca kale (DID ama DID-URL)
help-aliases-del =   .my.aliases.<name>:          ka saar magaca kale
help-runtime-discover =   .ma [port]          ogaw runtime deegaanka oo abuur magaca kale @ma
help-runtime-claim =   .ma [port]             hantida runtime DID-kaagana
help-identity =   .my.identity                 tus dejinta aqoonsiga
help-identity-did =   .my.identity.did             tus DID-kaaga (akhrin oo keliya)
help-identity-publish =   .my.identity!publish @pub    DID u daabac adeegga daabacaadda
help-identity-export =   .my.identity!export          soo dajiso bundle-ka aqoonsigaaga
help-config-path =   .config                      tus dhammaan gelitaanada .config.*

# ── Gargaarku — sanduuqa gelitaanka ──────────────────────────────────────
help-inbox =   .my.inbox                    liisko sanduuqa gelitaanka (aragtida geedka yar)
help-inbox-n =   .my.inbox.N                  tus goobaha gelitaanka N
help-inbox-from =   .my.inbox.N.from             DID wariyaha gelitaanka N
help-inbox-reply =   .my.inbox.N!reply [body]     dir jawaab (fur tifatiraha haddaan jiraan jirka)
help-inbox-open =   .my.inbox.N!open             fur waxa ku jira si loo akhriyo oo keliya tifatiraha
help-inbox-del =   .my.inbox.N:                 tirtir gelitaanka N
help-inbox-delall =   .my.inbox:                   tirtir dhammaan gelitaanada sanduuqa
help-inbox-flush =   .my.inbox!flush              daabac dhammaan gelitaanada terminal
help-inbox-filter =   .my.inbox!filter @who        muuji kaliya qeybaha ka yimid @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   orod dokumantigga DID wariyaha si tartiib ah

# ── Gargaarku — dokumantigyada ────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           fur tifatiraha leh waxa la keydiay
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     qaado CID, fur dib-u-eegista oo keliya
help-doc-eval =   .my.doc.<name>!eval           soccodsii waxa la keydiay sadar-sadar
help-doc-publish =   .my.doc.<name>!publish @pub   keydi ahaan blob cuur ah (nooc kasta)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  keydi YAML ahaan node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    soo geliso waxa CID ka jira (lama socodsiin)
help-doc-cid =   .my.doc.<name>!cid            tus CID la keydiay
help-doc-del =   .my.doc.<name>:              tirtir dokumantigga

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n waxay kaydisaa doorashada luqadda ee ku xidhan aqoonsigaaga.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               qor kood luqadeed ee la heli karo

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Qolka 間 waa meesha u dhaxaysa aqoonsiyada 間. ma waxay aqoonsiyadaas ka caawisaa inay is helaan oo wada xiriiraan; marka aqoonsigaagu la daabaco, waad ka qayb qaadan kartaa.
help-ma-command =   .ma [port]                   ku xir 間 runtime-kaaga maxalliga ah, akhri /status.json, kuna kaydi .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     daabac dukumentigaaga DID si kuwa kale u heli karaan furayaashaada iyo endpoint-kaaga
help-ma-security = Xadka kalsoonida ugu cad waa 間 runtime-kaaga adiga kuu gaar ah oo wata IPFS Desktop/Kubo-kaaga. Publisher fog wuu faa’iido yeelan karaa, laakiin markaas waxaad ku tiirsan tahay adeeg qof kale.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             sida loo galo qolka 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Marka aqoonsigaaga la yaqaan, .enter @ma wuxuu kuu oggolaanayaa inaad gasho 間. Hel adduun, geli, kana qayb qaado halkaas.
help-ma-entry-steps = Bilow IPFS Desktop iyo ma, kadib orod .ma. Ku daabac .my.identity!publish @ma, hel adduun, kuna gal .enter @ma.
help-ma-entry-command =   .enter @ma                  gal 間 adigoo maraya @ma runtime
help-ma-entry-toggle =   .enter                       shid ama dami diiradda qolka; aqoonsigaagu wuu sii shaqaynayaa
help-ma-entry-url =   ?enter=<runtime>             gal kadib login laga soo galay URL la wadaagay

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Luqadaha la heli karo (ku dejiso .my.i18n: <code>):
err-lang-not-found = luqadda lama helin: { $lang }

msg-send-failed = dirista way fashilaatay: { $e }
msg-not-logged-in = lama gelin

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Khalad falanqaynta YAML: { $e }
yaml-not-mapping = YAML waa inay tahay mapping (labojibbaar furaha: qiimaha); qoraalka caadiga ah iyo qiimaynta kuma kaydi kartid DAG-CBOR
dagcbor-encode-error = Khalad koodiyeynta DAG-CBOR: { $e }
cbor-decode-error = Khalad koodka-goynta CBOR: { $e }
cbor-json-error = Khalad CBOR→JSON: { $e }
yaml-serialise-error = Khalad taxnada YAML: { $e }
edit-reply-invalid = Jawaab tafatirka ah oo aan saxnayn
doc-publish-ipld-error = Daabacaadda IPLD waxay ku guuldarreysatay: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Khalad kaydinta nadiifinta sanduuqa galitaanka: { $e }
err-config-load = Khalad dejinta habaynta: { $e }
err-lang-persist = Khalad kaydinta luqadda: { $e }
err-history-parse = Khalad falanqaynta tariikhdda: { $e }
err-history-load = Khalad dejinta tariikhdda: { $e }
err-ipfs-reply-decode = Khalad koodka-goynta jawaabta IPFS: { $e }
err-edit-cbor = Khalad tafatirka CBOR: { $e }
err-popup-blocked = Daaqadda pop-up waxaa xidday daaweynaha
status-publishing = daabacaad

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = khalad
rpc-error-detail = khalad: { $detail }
msg-new-message = ← [{ $from }] fariin cusub — { $count } sanduuqa
msg-chat = { $sender } yiri { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } yidhi { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } wuxuu galay qolka.
room-leave = * { $name } wuxuu ka baxay qolka.
room-drop  = * { $name } wuu dhigay { $thing }.
room-take  = * { $name } wuu qaatay { $thing }.
err-edit-decode-failed = tafatirka: khalad sharraxaad: { $e }
err-edit-fetch-failed = tafatirka: khalad keenista: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = 間 jirto fadhiga firfircoon — liiska ma la tirsan karo
profile-delete-error = tirirka liiska wuu guul-dareystay: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = astaanta waa la siray oo loo diray IPFS; dukumentiga DID waa la cusboonaysiin doonaa marka CID yimaado
profile-publish-done = astaanta waa la daabacay — dukumentiga DID waxaa lagu cusboonaysiiyay ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = aqoonsiga mar hore la daabacay - profile ilaa hadda
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = nuxurka binary (aan la soo bandhigin)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (midna)
profiles-deleted = liiska { $name } la tiriyey
profiles-not-found = liiska lama helin: { $name }

# -- Help topics index
help-header-topics = -- ርዕሶች -- ዝርዝር ለማየት .help/<topic> ይተይቡ
help-topic-msg =   .help/msg                    መልዕክት
help-topic-ma = .help/ma                     間-meel, daabacaad, iyo gelid
help-topic-path = .help/path                   naxwaha dhibco-dariiqa maxaliga ah
help-topic-my =   .help/my                     የግል config
help-topic-inbox =   .help/inbox                  ገቢ መልዕክት
help-topic-doc =   .help/doc                    ሰነዶች
help-topic-actor =   .help/actor                  ርቀት actor
help-topic-zscheme =   .help/zscheme               weedho Scheme oo safka ku jira iyo dukumenti
help-unknown-topic =   .help/{ $topic }: ያልታወቀ ርዕስ

# -- Help actor section
help-header-actor = -- ርቀት ተዋናዮች
help-actor-echo =   @actor                       DID ፍቺን አሳይ
help-actor-text = @actor[#entity]!msg|!say|!emote body         dir toos ah/sheekeysi/ fariin dareen leh
help-actor-ping = @actor:ping                  ping noolaanshaha
help-actor-entities =   @actor/entities              entitiy ዘርዝር
help-actor-entities-get = @actor/entities/<n>          hel node-ka xubinta
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity አርትዕ
help-actor-entities-del = @actor/entities/<n>:         meesha tirtirto
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
help-actor-wc = (define x (@actor:verb arg))  Ku hay jawaabaha 5 ee jawiga fadhiga
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    furista zion adeegsiga xiriirka URL
help-topic-i18n = .help/i18n                   doorashada luqadda ee aqoonsigaaga
help-header-url = ── cabbirada URL ─────────────────────────────────────────────────────────────────
help-url-intro =   La wadaag xiriir si loo furo zion oo leh qofka la xiriira ee hore loo buuxiyey:
help-url-msg =   ?msg=<did>                   hore u buuxi: @<did>!msg (fariin fudud)
help-url-say =   ?say=<did>                   hore u buuxi: @<did>!say (fal say)
help-url-emote =   ?emote=<did>                 hore u buuxi: @<did>!emote (fal emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             gal runtime world ka dib login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Gelinta waa la buuxiyey laakiin lama dirin — riix Enter si aad u dirto.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                ku baahiso aqoonsikaaga shabakadda
help-header-publish = ── baahinta aqoonsiga ───────────────────────────────────────────────────────
help-publish-intro = Baahinta waxay aqoonsikaaga ka dhigtaa mid laga heli karo shabakadda. Dadka kaleba waxay raadsan karaan DID-kaaga si ay kugu soo dhawaadaan.
help-publish-ma = Si aad u baahiso, waxaad u baahan tahay 間 (runtime gudaha ah) oo la rakibay. Waxay ego ku xidaa IPFS/IPNS adiga beddelkaada.
help-publish-steps = Tallaabooyinka: orod '.ma [port]' si aad u ogaato ma gudaha ah, ka dibna '.my.identity!publish @ma'.
help-publish-without = La'aanta baahinta, dadka kale kuma gaadhi karaan — xitaa hadday garanayeen DID-kaaga, ma xallin karaan endpoint-kaaga.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = sheeg magaca astaanta: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Dufcaddii ururinta - nooca amarrada, ku dhammaada .batch
batch-already-collecting = Durba ururinta dufcaddii — ku dhammayso .batch marka hore
batch-empty = Dufcaddii way madhnayd - wax la ordo ma jirto
batch-running = batch በሂደት ላይ…
batch-step-timeout = Dufcaddii tillaabada waqtigeedu dhammaaday

batch-done = Batch በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
batch-done-error = Batch ከስህተቶች ጋር በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
msg-timeout = መልዕክቱ ጊዜው አልፏል (በ60s ምላሽ የለም)
err-unknown-command = amar aan la aqoon: { $path }
err-read-only-path = { $path } waa akhris-kaliya
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        ጊዜያዊ ሰነድ ገምግም (በትይዩ)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Keenista CID { $cid } ku guuldarreysatay: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID aan saxnayn: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Digniin: Furahaada sirta ah ee IPNS waxaa loo diri doonaa runtime-kan si lagu daabaco aqoonsiga. Waxaad isticmaali kartaa oo keliya runtime aad si buuxda u aaminsan tahay.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme wuxuu qiimeeyaa weedhaha Scheme ee ku dhex jira amarada zion, kadibna natiijada ayuu safka ku daraa ka hor dirista.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    tusaale safka ku jira; wuxuu diraa "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             qeexitaannadu way sii jiraan inta lagu jiro fadhiga gelitaanka hadda
help-zscheme-doc = Dukumenti: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Gateway IPFS maxalliga ah (u baahan oggolaanshaha browser)

tab-config = Xaaladaha
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
