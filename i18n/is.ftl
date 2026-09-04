# zion — Íslenska
lang-name = Íslenska
label-nick = gælunafn
new-identity-nick-help = Veldu gælunafn fyrir 間-rými. Það er bara gælunafn og þú getur breytt því hvenær sem er.
error-nick-required = gælunafn er nauðsynlegt
error-nick-invalid = gælunafnið má ekki innihalda bil eða @

# ── Innskráningarsíða ─────────────────────────────────────────────────────
tab-login = skrá inn
tab-new-identity = ný auðkenni
tab-import-profile = flytja inn prófíl
label-passphrase = lykilsetning
label-username = notandanafn
label-confirm-passphrase = staðfesta lykilsetningu
label-did = DID
label-profile-cid = prófíl CID
label-or-file = eða skrá
btn-login = skrá inn
btn-export = flytja út
btn-generate = búa til
btn-new-endpoint = nýr endapunktur
btn-import-profile = flytja inn prófíl
btn-show-qr = sýna QR
btn-scan-qr = skanna QR
qr-scan-hint = Beindu myndavélinni að QR-kóða zion-prófíls.
qr-error-camera = myndavél ekki tiltæk: { $e }
qr-error-too-large = prófíllinn er of stór fyrir QR-kóða
passphrase-warning = Gleymd lykilsetning = glatað auðkenni. Engin endurheimting er möguleg.
import-profile-help = Flytja inn prófíl með CID eða skrá. Þú þarft sömu aðgangssetningu og notuð var við útgáfu.
import-profile-detected-user = Prófíll tilheyrir: { $name }
status-unlocking = opnar lás...
status-generating = býr til auðkenni...
status-reading-file = les skrá...
status-fetching-profile = sækir prófíl frá IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = flutti inn '{ $name }' — skiptu yfir á Innskráningarflipa
status-importing-profile = flytur inn prófíl...
profile-import-done = prófíll fluttur inn fyrir '{ $name }' — { $n } lyklar hlaðnir
error-wrong-passphrase = röng lykilsetning: { $e }
error-identity-not-found = auðkenni '{ $name }' fannst ekki
error-username-required = notandanafn er nauðsynlegt
error-passphrase-required = lykilsetning er nauðsynleg
error-passphrases-no-match = lykilsetningar passa ekki saman
error-profile-source-required = gefðu upp CID eða hladdu upp skrá
error-did-required = sláðu inn DID þitt
error-profile-fetch = tókst ekki að sækja prófíl: { $e }
error-profile-no-username = prófíll inniheldur ekkert notandanafn
error-profile-no-identity = auðkenni '{ $name }' fannst ekki — flytja inn auðkenni fyrst

# ── Kerfisskilaboð útstöðvar ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — innskráður sem { $username }
msg-type-help = Sláðu inn .help til að sjá lista yfir skipanir.
msg-getting-started = Prófaðu: say Hello world, look, .help eða help.
msg-connecting = tengist iroh...
msg-iroh-ready = iroh-endapunktur tilbúinn
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID birt í gegnum staðbundið 間 ({ $url })
msg-identity-publication-propagating = Útgáfa auðkennisins er enn að breiðast út; entry seinkar: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = Leit að traustum MA getur tekið allt að { $seconds } sekúndur.
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Birti auðkenni. Þetta getur tekið allt að { $seconds } sekúndur.
msg-ma-connecting-matrix = reyni að tengja þig við 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = staðbundið 間 gert tilkall til
msg-local-ma-already-claimed = staðbundið 間 er þegar gert tilkall til
msg-local-ma-claim-failed = tókst ekki að gera tilkall til staðbundins 間
msg-identity-not-published = Auðkenni finnst ekki á netinu — ef 間 er uppsett á þessum tölvu, keyrðu '.ma: claim [port]' og svo '.my.identity!publish @ma'. Skrifaðu '.help/publish' fyrir frekari upplýsingar.
msg-blocked = ⊗ lokað á [{ $cap }]: { $from }
msg-focus-cleared = fókus hreinsaður
msg-left = left
msg-focusing = beinir athygli að { $did } sem { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eyddi { $path } ({ $count } færslur)
msg-read-only = { $path } er læst fyrir skrift
msg-subtree-set = { $path } er undirtré; neitar að stilla
msg-ancestor-leaf = forfaðir { $path } er lauf; neitar að skyggja
msg-key-not-found = lykill finnst ekki: { $path }
msg-link-not-connected = hlekkur sóttist ekki: ekki tengt
msg-link-fetch-error = hlekkur sóttist ekki: { $e }
msg-link-key-not-found = lykillinn `{ $key }` finnst ekki í tengdu skjali

# ── Staðfesting á samnefnum ───────────────────────────────────────────────
err-alias-name-empty = samnefnið má ekki vera tómt
err-alias-has-dot = samnefni má ekki innihalda '.'
err-alias-has-fragment = samnefni má ekki innihalda '#'
err-alias-value-fragment = gildi samnefnis má innihalda í mesta lagi eitt ekki-tómt DID-URL-brot
err-alias-value-path = gildi samnefnis verður að vera did:ma:<ipns> DID eða DID-URL (engin slóð)
err-alias-not-did = gildi samnefnis verður að byrja á did:ma:
err-unknown-alias = óþekkt samnefni: @{ $name }
err-bare-did = bjóst við hreinu did:ma:<ipns> (ekkert brot eða slóð), fékk { $did }

# ── Ritill ────────────────────────────────────────────────────────────────
btn-save = Vista
btn-eval = Keyra
btn-cancel = Hætta við
msg-jobs-cancelled = verk stöðvuð
btn-close = Loka
btn-reply = Svara
btn-publish = Birta
btn-publish-ipld = Birta IPLD
msg-reply-sent = svar sent
msg-reply-failed = svar mistókst: { $e }
msg-entity-publish-sent = eining { $name }: birting send
msg-entity-publish-failed = birting einingar mistókst: { $e }
msg-kind-publish-failed = útgáfa tegundar mistókst: { $e }
msg-field-publish-sent = eining { $name }.{ $field }: birting send
msg-field-publish-failed = birting reits mistókst: { $e }
msg-acl-publish-sent = keyrsluumhverfi ACL: birting send
msg-crud-edit-publish-sent = { $path }: birting send
msg-acl-publish-failed = birting keyrsluumhverfis ACL mistókst: { $e }
msg-yaml-error = YAML-villa: { $e }
msg-editor-saved = { $path }:vista
msg-fetch-review = sótti { $cid } — farðu yfir áður en þú keyrir
msg-fetch-failed = sókn { $cid }: { $e }

# ── Sagnir — pósthólf ────────────────────────────────────────────────────
inbox-empty = pósthólf er tómt
inbox-entry-not-found = færsla { $n } í pósthólfi finnst ekki
inbox-no-message-id = færsla { $n } í pósthólfi hefur ekkert message_id
inbox-no-verb = engin sögn `{ $verb }` fyrir færslu { $n } í pósthólfi
inbox-filter-no-arg = sía þarf DID- eða samnefnisrök
inbox-filter-empty = engin skilaboð frá { $did }

# ── Sagnir — keyrsluumhverfi ──────────────────────────────────────────────
discover-fetch-failed = uppgötvun mistókst við { $url }: { $e }
discover-json-error = uppgötvun mistókst: ógilt JSON frá { $url }: { $e }
discover-missing-did = uppgötvun mistókst: status.json vantar nauðsynlegt svæði `did`
discover-invalid-did = uppgötvun mistókst: bjóst við að `did` byrjaði á did:ma:, fékk `{ $did }`
discover-no-endpoint = viðvörun uppgötvunar: `endpoint_id` vantar í status.json; vistuðum aðeins DID
discover-hint-endpoint-not-found = Ábending: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Ábending: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Ábending: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Ábending: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 uppgötvað við { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   gælunafn @ma búið til — keyrðu '.my.identity!publish @ma' til að birta auðkenni þitt.
claim-success = Keyrsluumhverfi gert tilkall til fyrir { $did }
claim-conflict = Keyrsluumhverfi þegar gert tilkall til af annarri auðkenni
claim-already-owned = Runtime hefur þegar verið gert tilkall til af þessu auðkenni
claim-http-failed = tilkall mistókst: HTTP { $status }
claim-error = tilkall mistókst: { $e }
claim-no-session = ekki innskráður; skráðu þig inn fyrst til að gera tilkall til keyrsluumhverfis
runtime-no-verb = engin sögn `{ $verb }` fyrir { $path }

# ── Sagnir — aðgangsstýring ───────────────────────────────────────────────
acl-reset = .my.acl endurstillt (fullkomlega opið)
err-persist = vistunarvillu: { $e }
acl-no-verb = engin sögn `{ $verb }` fyrir .my.acl

# ── Sagnir — auðkenni ────────────────────────────────────────────────────
publish-usage = notkun: .my.identity!publish <did-eða-samnefni>
identity-exported = Búnt niðurhlað sem { $filename }
identity-export-failed = Útflutningur mistókst: { $e }

# ── Sagnir — skjöl ───────────────────────────────────────────────────────
doc-content-empty = { $path } er tómt
doc-save-first = { $path } er tómt — vistaðu fyrst
doc-missing-name = skjalsheiti vantar
doc-publish-usage = notkun: .my.doc.<nafn>!publish <útgefandi>
doc-publish-ipld-usage = notkun: .my.doc.<nafn>!publish-ipld <útgefandi>
doc-publish-failed = birting { $path }: { $e }
doc-publish-ipld-failed = ipld-birting { $path }: { $e }
doc-publish-error-detail = birting mistókst [{ $code }]: { $err }
doc-publish-error-hint = Ábending: { $hint }
doc-publish-hint-session = skráðu þig inn aftur svo egó geti nálgast auðkennislyklana þína
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = staðfestu að DID skjal útgefanda sé birt og inniheldur endapunkt sem hægt er að ná til
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin hafnaði beiðninni; skoðaðu ástæðuna og reyndu aftur eftir að eining/keyrslutími hefur verið lagaður
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = skoðaðu runtime logs fyrir nákvæmar orsakir og reyndu aftur
doc-store-sent = geymslugrein send ({ $id }) → { $publisher }; CID kemur með -svari
doc-ipld-store-sent = IPLD-geymslugrein send ({ $id }) → { $publisher }; CID kemur með -svari
doc-fetch-done = sótti { $cid } → { $path } (ekki keyrt)
doc-fetch-failed = sókn { $cid }: { $e }
doc-fetch-usage = notkun: .my.doc.<nafn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ekki stillt
doc-no-verb = engin sögn `{ $verb }` fyrir { $path }
path-no-verb = engin sögn `{ $verb }` fyrir { $path }

# ── Hjálpartexti — fyrirsagnir ────────────────────────────────────────────
help-header-zion = ── zion-skipanir ──────────────────────────────────────────────────────────
help-header-messaging = ── skilaboð ──────────────────────────────────────────────────────────────
help-header-config = ── staðbundin stillingarfræðikerfis ─────────────────────────────────────
help-header-common = ── algengar slóðir ───────────────────────────────────────────────────────
help-header-inbox = ── pósthólf ──────────────────────────────────────────────────────────────
help-header-documents = ── skjöl ─────────────────────────────────────────────────────────────────
help-header-i18n = ── tungumál ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-rými ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── inn í 間-rými ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        þessi texti
help-cmd-clear =   .clear                       hreinsa útstöðina
help-cmd-panic =   .panic                       síðasta úrræði — notaðu ef þú ert í vandræðum
help-cmd-history =   .history [n]                 skipanasaga (samhliða endurtekningar sameinaðar); valfrjálst n sýnir aðeins síðustu n línur
help-cmd-logout =   .logout                      skrá út
help-cmd-batch =   .batch                       evaluer kladdedokument parallelt
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         evaluer kladdedokument linje for linje

help-msg-echo =   @alias                       sýna leyst DID/DID-URL (engin skilaboð send)
help-msg-send = @alias!msg body @alias:verb args senda skilaboð til leikara
help-msg-fragment =   @alias#fragment:verb body  senda til samnefnis með skýrum DID-broti
help-msg-escape =   \@name                       bókstaflegur @name (engin samnefnileit)


help-config-get =   .path                        sækja laufsgildi eða lista undirtré
help-config-filter =   .path [nafn]                 lista nöfn undirlykla sem innihalda nafn
help-config-full =   .path. [nafn]                lista öll gildi undirtrés sem innihalda nafn
help-config-set =   .path: value                 stilla lauf
help-config-delete =   .path:                       eyða laufi eða undirtré
help-config-verb =   .path!verb [args]            keyra staðbundna sögn

help-my =   .my                          sýna alla persónulega stillingu
help-aliases =   .my.aliases                  lista samnefni
help-aliases-set =   .my.aliases.<name>: <did-url>    bæta við/uppfæra samnefni (DID eða DID-URL)
help-aliases-del =   .my.aliases.<name>:          fjarlægja samnefni
help-runtime-discover =   .ma: claim [port]          uppgötva staðbundið keyrsluumhverfi og búa til @ma-samnefni
help-runtime-claim =   .ma: claim [port]             gera tilkall til keyrsluumhverfis með þínu DID
help-identity =   .my.identity                 sýna stillingu auðkennis
help-identity-did =   .my.identity.did             sýna eigið DID (læst fyrir skrift)
help-identity-publish =   .my.identity!publish @pub    birta eigið DID í gegnum útgefendasþjónustu
help-identity-export =   .my.identity!export          hlaða niður eigin auðkennisbúnt
help-config-path =   .config                      sýna allar .config.*-færslur

help-inbox =   .my.inbox                    lista pósthólf (undirtréssýn)
help-inbox-n =   .my.inbox.N                  sýna reiti færslu N
help-inbox-from =   .my.inbox.N.from             DID sendanda fyrir færslu N
help-inbox-reply =   .my.inbox.N!reply [body]     senda svar (opnar ritil án meginmáls)
help-inbox-open =   .my.inbox.N!open             opna efni í ritli læstum fyrir skrift
help-inbox-del =   .my.inbox.N:                 eyða færslu N
help-inbox-delall =   .my.inbox:                   eyða öllum pósthólffærslum
help-inbox-flush =   .my.inbox!flush              prenta allar færslur á útstöðina
help-inbox-filter =   .my.inbox!filter @who        sýna aðeins færslur frá @who
help-inbox-traverse =   .my.inbox.N.sender.<svæði>  fletta upp DID-skjali sendanda seinkað

help-doc-edit =   .my.doc.<nafn>!edit           opna ritil með vistað efni
help-doc-edit-cid =   .my.doc.<nafn>!edit /ipfs/<cid>     sækja CID, opna til yfirferðar
help-doc-eval =   .my.doc.<nafn>!eval           keyra vistað efni línu fyrir línu
help-doc-publish =   .my.doc.<nafn>!publish @pub   geyma sem hrá blob (allar gerðir)
help-doc-publish-ipld =   .my.doc.<nafn>!publish-ipld @pub  geyma YAML sem skipulagða DAG-CBOR IPLD-hnút
help-doc-fetch =   .my.doc.<nafn>!fetch /ipfs/<cid>    flytja inn CID-efni (engin keyrsla)
help-doc-cid =   .my.doc.<nafn>!cid            sýna vistað CID
help-doc-del =   .my.doc.<nafn>:              eyða skjali

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n geymir tungumálavalið sem tengist auðkenni þínu.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               listi tiltæka tungumálakóða

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-herbergið er rýmið á milli 間-auðkenna. ma sér til þess að þessi auðkenni geti fundið hvert annað og átt samskipti; þegar auðkennið þitt hefur verið birt geturðu tekið þátt.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   tengjast staðbundnu 間-runtime, lesa /status.json og vista .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     birta DID-skjalið þitt svo aðrir geti fundið lykla þína og endpoint
help-ma-security = Skýrasta traustmörkin eru þitt eigið 間-runtime með þínu eigin IPFS Desktop/Kubo. Fjarlægur publisher getur verið gagnlegur, en þá reiðirðu þig á þjónustu einhvers annars.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hvernig á að ganga inn í 間-herbergið

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Þegar auðkennið þitt er þekkt leyfir .enter @ma þér að stíga inn í 間. Finndu þér heim, farðu inn í hann og taktu þátt þaðan.
help-ma-entry-steps = Ræstu IPFS Desktop og ma, keyrðu síðan .ma. Birtu með .my.identity!publish @ma, finndu heim og farðu inn með .enter @ma.
help-ma-entry-command =   .enter @ma                  ganga inn í 間 í gegnum @ma-runtime
help-ma-entry-toggle =   .enter                       kveiktu eða slökktu á herbergisfókus; auðkennið þitt er áfram virkt
help-ma-entry-url =   ?enter=<runtime>             ganga inn eftir innskráningu frá deildri URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tiltæk tungumál (stilla með .my.i18n: <code>):
err-lang-not-found = tungumál fannst ekki: { $lang }

msg-send-failed = sending mistókst: { $e }
msg-not-logged-in = ekki innskráður

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-þáttunarvilla: { $e }
yaml-not-mapping = YAML verður að vera mapping (lykill: gildis-par); venjulegt texta og skalar geta ekki verið geymt sem DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kóðunarvilla: { $e }
cbor-decode-error = CBOR-afkóðunarvilla: { $e }
cbor-json-error = CBOR í JSON-villa: { $e }
yaml-serialise-error = YAML-raðgreiningarvilla: { $e }
edit-reply-invalid = Ógilt breytingarsvar
doc-publish-ipld-error = IPLD-birting mistókst: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Innhólf-hreinsun geymingarvilla: { $e }
err-config-load = Stillinga hleðsluvilla: { $e }
err-lang-persist = Tungumáls geymingarvilla: { $e }
err-history-parse = Söguþáttunarvilla: { $e }
err-history-load = Sögu hleðsluvilla: { $e }
err-history-count-invalid = sögutalan verður að vera jákvæð heiltala
err-ipfs-reply-decode = IPFS-svar afkóðunarvilla: { $e }
err-edit-cbor = CBOR-breytingarvilla: { $e }
err-popup-blocked = Vafrinn lokaði á sprettiglugga
status-publishing = gefur út

# ── redigering ─────────────────────────────────────────────────────
term-error = villa
term-error-detail = villa: { $detail }
msg-new-message = ← [{ $from }] ný skilaboð — { $count } í pósthólfi
msg-chat = { $sender } segir { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } segir { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } gengur inn.
room-leave = * { $name } gengur út.
room-drop  = * { $name } sleppir { $thing }.
room-take  = * { $name } tekur { $thing }.
err-edit-decode-failed = ritvinnsla: afkóðunarvilla: { $e }
err-edit-fetch-failed = ritvinnsla: sækingarvilla: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = engin virk lota — ekki hægt að eyða notandaprófíl
profile-delete-error = eyðing notandaprófíls mistókst: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = prófíll dulkóðaður og sendur til IPFS; DID-skjalið verður uppfært þegar CID berst
profile-publish-done = prófíll birtur — DID-skjal uppfært með ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = auðkenni þegar birt — prófíllinn uppfærður
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = tvöfalt efni (ekki birt)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ekkert)
profiles-deleted = notandaprófíll { $name } eytt
profiles-not-found = notandaprófíll finnst ekki: { $name }

# -- Help topics index
help-header-topics = -- emner -- skriv .help/<topic> for detaljer
help-topic-msg = .help/msg beskeder
help-topic-ma = .help/ma                     間-rými, útgáfa og innganga
help-topic-path = .help/path                   staðbundin punktabrautarmálfræði
help-topic-my =   .help/my                     personlig config
help-topic-inbox =   .help/inbox                  indbakke
help-topic-doc =   .help/doc                    dokumenter
help-topic-actor =   .help/actor                  fjern actor
help-topic-z =   .help/z                      opinbert og einka Scheme-efni
help-topic-zscheme =   .help/zscheme               innfelld Scheme-segð og skjölun
help-unknown-topic =   .help/{ $topic }: ukendt emne

# -- Help actor section
help-header-actor = -- fjernaktører
help-actor-echo =   @actor                       vis opløst DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         senda bein/spjall/emote skilaboð
help-actor-ping = @actor:ping                  lífleika ping
help-actor-entities =   @actor/entities              vis entiteter
help-actor-entities-get = @actor/entities/<n>          fá einingarhnút
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     rediger entitet
help-actor-entities-del = @actor/entities/<n>:         eyða einingu
help-actor-config-get =   @actor/config/<key>          hent config-værdi
help-actor-config-set =   @actor/config/<key>: val     sæt config-værdi
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              rediger ACL
help-actor-fragment =   @actor#entity                send til plugin
help-actor-fragment-verb = @actor#entity:verb [args] til plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...) call an entity from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg)) haltu 5 svörum í lotuumhverfinu

help-topic-url =   .help/url                    opna zion í gegnum URL-tengil
help-topic-i18n = .help/i18n                   tungumálaval fyrir sjálfsmynd þína
help-header-url = ── URL-breytur ──────────────────────────────────────────────────────────────────
help-url-intro =   Deildu tengli sem opnar zion með fyrirfram fylltan viðtakanda:
help-url-msg =   ?msg=<did>                   fyllir fyrirfram: @<did>!msg (venjuleg skilaboð)
help-url-say =   ?say=<did>                   fyllir fyrirfram: @<did>!say (sagnorð say)
help-url-emote =   ?emote=<did>                 fyllir fyrirfram: @<did>!emote (sagnorð emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             sláðu inn runtime heim eftir innskráningu
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Inntakið er fyrirfram fyllt en ekki sent — ýttu á Enter til að senda.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                birta auðkenni þitt á netinu
help-header-publish = ── birting auðkennis ────────────────────────────────────────────────────────
help-publish-intro = Birting gerir auðkenni þitt leitanlegt á netinu. Aðrir geta leitað að DID þínu til að ná í þig.
help-publish-ma = Til að birta þarftu 間 (staðbundið keyrsluumhverfi) uppsett. Það tengir ego við IPFS/IPNS fyrir þína hönd.
help-publish-steps = Skref: keyrðu '.ma: claim [port]' til að finna staðbundið ma, síðan '.my.identity!publish @ma'.
help-publish-without = Án birtingar geta aðrir ekki náð í þig — jafnvel þótt þeir þekki DID þitt geta þeir ekki leyst upp endpoint þinn.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = tilgreindu heiti prófíls: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Safna lotu — sláðu inn skipanir, endaðu með .batch
batch-already-collecting = Þegar verið er að safna lotu - enda með .batch fyrst
batch-empty = Lotan var tóm - ekkert að keyra
batch-running = Kører batch…
batch-step-timeout = lotuskref rann út

batch-done = Batch færdig på { $secs }s — { $steps } trin
batch-done-error = Batch færdig med fejl på { $secs }s — { $steps } trin
msg-timeout = Beskeden fik timeout (intet svar på 60s)
msg-outbox-open-timeout = ekki næst í { $target } — tengingin rann út á tíma eftir { $ms }ms
msg-outbox-send-timeout = sending til { $target } rann út á tíma eftir { $ms }ms — tengingin gæti hafa rofnað
err-unknown-command = óþekkt skipun: { $path }
err-read-only-path = { $path } er aðeins til lestrar
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        evaluer kladdedokument parallelt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Tókst ekki að sækja CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ógilt CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Viðvörun: Einkalykill IPNS þinn verður sendur á þennan keyrslutengil til útgáfu á auðkenningu. Notaðu eingöngu keyrslutengil sem þú treystir að fullu.

# -- Help text -- z and my
help-header-z = ── .z og .my ────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       opinbert eða birtanlegt efni; geymið ekki leyniráð hér
help-z-scheme =   .z.scheme                  Scheme-handritinu sem höndluð er og metið við rásingu
help-z-control =   .z.scheme                 þú stjórnar innihaldi rásingarhandritsins sjálfur
help-z-private =   .my.*                     einka staðbundin stillingar; Scheme getur einnig geymt hér
help-z-choice =   .z.* / .my.*               notaðu .z.* fyrir opinbert Scheme og .my.* fyrir einka Scheme

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme metur Scheme-segðir sem eru felldar inn í zion-skipanir og setur niðurstöðuna inn í línuna áður en hún er send.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    innfellt dæmi; sendir "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             skilgreiningar haldast í núverandi innskráningarlotu
help-zscheme-doc = Skjölun: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Staðbundinn IPFS-gátt (krefst undantekningar í vafra)

tab-config = Stillingar
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
