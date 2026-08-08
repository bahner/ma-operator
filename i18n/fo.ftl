# zion — Føroyskt
lang-name = Føroyskt
label-nick = kelinavn
new-identity-nick-help = Vel eitt kelinavn til ma-space. Tað er bara eitt kelinavn og kann broytast nær sum helst.
error-nick-required = kelinavn krevst
error-nick-invalid = kelinavnið má ikki innihalda millumrúm ella @

# ── Innrásarsíða ──────────────────────────────────────────────────────────
tab-login = rita inn
tab-new-identity = nýggj samleika
tab-import-profile = innfør profil
label-passphrase = loyniorð
label-username = brúkaranavn
label-confirm-passphrase = staðfest loyniorð
label-did = DID
label-profile-cid = profil CID
label-or-file = ella skjal
btn-login = rita inn
btn-export = flyt út
btn-generate = skapa
btn-new-endpoint = nýggjur endapunktur
btn-import-profile = innfør profil
btn-show-qr = vís QR
btn-scan-qr = skanna QR
qr-scan-hint = Vend myndatólinum móti eini zion-profil QR-kotu.
qr-error-camera = myndatólið er ikki tøkt: { $e }
qr-error-too-large = profilurin er ov stórur til eina QR-kotu
passphrase-warning = Gloymt loyniorð = gloymur samleika. Onki endurheimtan er møgulig.
import-profile-help = Innfør eitt profil við CID ella skjal. Tú hevur brúk fyri somu lykilsetning, ið varð brúkt við útgávuna.
import-profile-detected-user = Profil tilhøyrir: { $name }
status-unlocking = loysir lás...
status-generating = skapar samleika...
status-reading-file = les fíl...
status-fetching-profile = sækir profil frá IPFS...
status-imported = flutti inn '{ $name }' — skift til Rita inn-flipa
status-importing-profile = innfører profil...
profile-import-done = profil innført fyri '{ $name }' — { $n } lyklar latiðir
error-wrong-passphrase = rangt loyniorð: { $e }
error-identity-not-found = samleikinn '{ $name }' funnist ikki
error-username-required = brúkaranavn krevst
error-passphrase-required = loyniorð krevst
error-passphrases-no-match = loyniorð stimma ikki saman
error-profile-source-required = gev eitt CID ella lað upp skjal
error-did-required = gev DID tín
error-profile-fetch = kundi ikki sækja profil: { $e }
error-profile-no-username = profil inniheldur inkje brúkaranavn
error-profile-no-identity = kennsla '{ $name }' ikki funnin — innfør kennsla fyrst

# ── Kervisboð frá terminali ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ritaður inn sum { $username }
msg-type-help = Skriva .help fyri lista av skipanum.
msg-getting-started = Royn: say Hello world, look, .help ella help.
msg-connecting = tengist iroh...
msg-iroh-ready = iroh-endapunktur er klár
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID birt við staðbundið ma ({ $url })
msg-identity-publication-propagating = Samleikapubliseringin breiðir seg enn; entry er seinkað: { $e }
msg-identity-first-publish = Publiserar samleikan fyrstu ferð. Hetta kann taka upp til { $seconds } sekund.
msg-ma-connecting-matrix = royni at binda teg til 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokalt 間 gjørt krav á
msg-local-ma-already-claimed = lokalt 間 er longu gjørt krav á
msg-local-ma-claim-failed = kundi ikki gera krav á lokalt 間
msg-identity-not-published = Samleiki finnst ikki í netinum — um ma er installerað lokalt, køyr '.ma [port]' og síðan '.my.identity!publish @ma'. Skriva '.help/publish' fyri detaljar.
msg-blocked = ⊗ stovnað [{ $cap }]: { $from }
msg-focus-cleared = fókus av
msg-left = left
msg-focusing = fókuserar { $did } sum { $prompt }
msg-set = { $path }: { $value }
msg-deleted = strikti { $path } ({ $count } færslur)
msg-read-only = { $path } er skrivavørn
msg-subtree-set = { $path } er eitt undirtré; neitar at seta
msg-ancestor-leaf = ein forfaðir til { $path } er eitt lav; neitar at skyggja
msg-key-not-found = lykil funnist ikki: { $path }
msg-link-not-connected = hentingarvillur á tengli: ikki tengt
msg-link-fetch-error = hentingarvillur á tengli: { $e }
msg-link-key-not-found = lykillinn `{ $key }` funnist ikki í tøkt skjal

# ── Samnefnis-avgerð ──────────────────────────────────────────────────────
err-alias-name-empty = samnefni kann ikki vera tómt
err-alias-has-dot = samnefni kann ikki innihalda '.'
err-alias-has-fragment = samnefni kann ikki innihalda '#'
err-alias-value-fragment = gildi á samnevni kann í mesta lagi hava eitt ikki-tómt DID-URL-brot
err-alias-value-path = gildi á samnevni má vera ein did:ma:<ipns> DID ella DID-URL (ongin leið)
err-alias-not-did = gildi á samnefni má byrja við did:ma:
err-unknown-alias = ókent samnefni: @{ $name }
err-bare-did = ventaði einans did:ma:<ipns> (einki brot ella slóð), fingu { $did }

# ── Rit-forrit ────────────────────────────────────────────────────────────
btn-save = Vista
btn-eval = Keyra
btn-cancel = Avlýs
msg-jobs-cancelled = arbeiði avlýst
btn-close = Lat aftur
btn-reply = Svar
btn-publish = Birta
btn-publish-ipld = Birta IPLD
msg-reply-sent = svar sent
msg-reply-failed = svar misluktist: { $e }
msg-entity-publish-sent = eindir { $name }: birting send
msg-entity-publish-failed = birting av eindir misluktist: { $e }
msg-kind-publish-failed = slag-útgeva mishavdi: { $e }
msg-field-publish-sent = eindir { $name }.{ $field }: birting send
msg-field-publish-failed = birting á øki misluktist: { $e }
msg-acl-publish-sent = runtime ACL: birting send
msg-crud-edit-publish-sent = { $path }: birting send
msg-acl-publish-failed = birting av runtime ACL misluktist: { $e }
msg-yaml-error = YAML-villa: { $e }
msg-editor-saved = { $path }:vista
msg-fetch-review = sótti { $cid } — far yvir áðrenn keyring
msg-fetch-failed = henting { $cid }: { $e }

# ── Sagnorð — innboks ─────────────────────────────────────────────────────
inbox-empty = innboks er tómur
inbox-entry-not-found = innboks-færslan { $n } funnist ikki
inbox-no-message-id = innboks-færslan { $n } hevur ongt message_id
inbox-no-verb = einki sagnorð `{ $verb }` fyri innboks-færslu { $n }
inbox-filter-no-arg = filtran krevur eitt DID- ella alias-argument
inbox-filter-empty = eingin boð frá { $did }

# ── Sagnorð — keyrsluumhvørvi ─────────────────────────────────────────────
discover-fetch-failed = uppgáva misluktist við { $url }: { $e }
discover-json-error = uppgáva misluktist: ógildigt JSON frá { $url }: { $e }
discover-missing-did = uppgáva misluktist: status.json manglar kravda feltið `did`
discover-invalid-did = uppgáva misluktist: ventaði `did` byrja við did:ma:, fingu `{ $did }`
discover-no-endpoint = uppgáva-ávirkan: `endpoint_id` manglar í status.json; vistað einans DID
discover-hint-endpoint-not-found = Ábending: endpoint ikki funnið. Kanna at `ma` vísir /status.json á porti 5003.
discover-hint-server-error = Ábending: runtime svaraði við tænaravillu. Kanna `ma`-loggarnar og royn aftur.
discover-hint-network = Hint: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Hint: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma funnist við { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma stovnað — køyr '.my.identity!publish @ma' fyri at birta tín samleika.
claim-success = Keyrsluumhvørvi gjørt krav á fyri { $did }
claim-conflict = Keyrsluumhvørvi longu gjørt krav á av annarri samleika
claim-already-owned = Keyrsluumhvørvi er longu gjørt krav á av hesum samleika
claim-http-failed = krøv misluktist: HTTP { $status }
claim-error = krøv misluktist: { $e }
claim-no-session = ikki ritaður inn; rita inn fyrst fyri at gera krav á keyrsluumhvørvið
runtime-no-verb = einki sagnorð `{ $verb }` fyri { $path }

# ── Sagnorð — atgonguslitsing ─────────────────────────────────────────────
acl-reset = .my.acl sett aftur (fult opinn)
acl-persist-error = vistu-villa: { $e }
acl-no-verb = einki sagnorð `{ $verb }` fyri .my.acl

# ── Sagnorð — samleiki ────────────────────────────────────────────────────
publish-usage = nýtsla: .my.identity!publish <did-ella-samnefni>
identity-exported = Pakkin niðurhlaðin sum { $filename }
identity-export-failed = Útflutningur misheppnaðist: { $e }

# ── Sagnorð — skjøl ──────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tómur
doc-save-first = { $path }.content er tómur — vista fyrst
doc-missing-name = skjalsnavn manglar
doc-publish-usage = nýtsla: .my.doc.<navn>!publish <útgevari>
doc-publish-ipld-usage = nýtsla: .my.doc.<navn>!publish-ipld <útgevari>
doc-publish-failed = birting { $path }: { $e }
doc-publish-ipld-failed = ipld-birting { $path }: { $e }
doc-publish-error-detail = birting misluktist [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = rita inn aftur so eg kann fáa atgongd til tínar samleikalyklar
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = staðfesta útgevara DID skjalið er útgivið og inniheldur eitt røkkandi endapunkt
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = koyritíð/tilskot vrakaði áheitanina; kanna orsøkina og royn aftur eftir at hava rættað eind/koyritíð
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = kanna koyritíðarloggar fyri nærri orsøk og royn aftur
doc-store-sent = vistunargrein send ({ $id }) → { $publisher }; CID kemur við RPC-svari
doc-ipld-store-sent = IPLD-vistunargrein send ({ $id }) → { $publisher }; CID kemur við RPC-svari
doc-fetch-done = sótti { $cid } → { $path }.content (ikki keyrt)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = nýtsla: .my.doc.<navn>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikki sett
doc-no-verb = einki sagnorð `{ $verb }` fyri { $path }
path-no-verb = einki sagnorð `{ $verb }` fyri { $path }

# ── Hjálpitekstur — yvirskriftir ──────────────────────────────────────────
help-header-zion = ── zion-skipanir ──────────────────────────────────────────────────────────
help-header-messaging = ── boð ───────────────────────────────────────────────────────────────────
help-header-config = ── lokal stillingar-mállæra ────────────────────────────────────────────
help-header-common = ── vanligar slóðir ───────────────────────────────────────────────────────
help-header-inbox = ── innboks ───────────────────────────────────────────────────────────────
help-header-documents = ── skjøl ─────────────────────────────────────────────────────────────────
help-header-i18n = ── mál ────────────────────────── ─────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── at koma inn í 間-rúmið ──────────────────────── ─────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        hesin tekstur
help-cmd-clear =   .clear                       reinsa terminalen
help-cmd-panic =   .panic                       seinasti ráður — nýt um tú ert í vandræðum
help-cmd-history =   .history                     skipanaferill (eftirfylgjandi endurtøkur samlagar)
help-cmd-logout =   .logout                      rita út
help-cmd-batch =   .batch                       evaluer kladdedokument parallelt
help-cmd-batch-sync =   .batch:sync / .batch         evaluer kladdedokument linje for linje

help-msg-echo =   @alias                       vís loyst DID/DID-URL (eingin boð send)
help-msg-send =   @alias!msg body / @alias:verb args           send boð / RPC til aktør
help-msg-fragment =   @alias#fragment:verb body  send til samnefni við greiniligum DID-broti
help-msg-escape =   \@name                       bókstavligur @name (ongin samnefnisleit)


help-config-get =   .path                        sók lav-gildi ella lista undirtré
help-config-set =   .path: value                 set lav
help-config-delete =   .path:                       strika lav ella undirtré
help-config-verb =   .path!verb [args]            keyra lokal sagnorð

help-my =   .my                          vís allar persónligar stillingar
help-aliases =   .my.aliases                  lista samnefni
help-aliases-set =   .my.aliases.<name>: <did-url>    legg afturat/dagfør samnevni (DID ella DID-URL)
help-aliases-del =   .my.aliases.<name>:          strika samnefni
help-runtime-discover =   .ma [port]          finn lokalt keyrsluumhvørvi og stovn @ma-samnefni
help-runtime-claim =   .ma [port]             ger krav á keyrsluumhvørvið við títt DID
help-identity =   .my.identity                 vís stillingar fyri samleika
help-identity-did =   .my.identity.did             vís egna DID (skrivavørn)
help-identity-publish =   .my.identity!publish @pub    birta egna DID í gongum útgevaraaðgerð
help-identity-export =   .my.identity!export          hlaða niður egna kennslueinkapakka
help-config-path =   .config                      vís allar .config.*-færslur

help-inbox =   .my.inbox                    lista innboks (undirtréssýni)
help-inbox-n =   .my.inbox.N                  vís øki á færslu N
help-inbox-from =   .my.inbox.N.from             avsendara-DID fyri færslu N
help-inbox-reply =   .my.inbox.N!reply [body]     send svar (opnar ritforrit uttan líkami)
help-inbox-open =   .my.inbox.N!open             opna innihald í skrivavørnum ritforrit
help-inbox-del =   .my.inbox.N:                 strika færslu N
help-inbox-delall =   .my.inbox:                   strika allar innboks-færslur
help-inbox-flush =   .my.inbox!flush              prenta allar færslur á terminalen
help-inbox-filter =   .my.inbox!filter @who        vís bert innferal frá @who
help-inbox-traverse =   .my.inbox.N.sender.<øki>    fletta DID-skjal avsendara seinkað

help-doc-edit =   .my.doc.<navn>!edit           opna ritforrit við vistað innihald
help-doc-edit-cid =   .my.doc.<navn>!edit /ipfs/<cid>     sók CID, opna til yvirkun
help-doc-eval =   .my.doc.<navn>!eval           keyra vistað innihald línu fyri línu
help-doc-publish =   .my.doc.<navn>!publish @pub   goyma sum raw blob (allar slags)
help-doc-publish-ipld =   .my.doc.<navn>!publish-ipld @pub  goyma YAML sum skipan DAG-CBOR IPLD-hnút
help-doc-fetch =   .my.doc.<navn>!fetch /ipfs/<cid>    flyt inn CID-innihald (ongin keyring)
help-doc-cid =   .my.doc.<navn>!cid            vís vistað CID
help-doc-del =   .my.doc.<navn>:              strika skjal

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n goymir málvalið, sum er knýtt at tínum samleika.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lista tøkar málkotur

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-rúmið er rúmið millum 間-samleikar. ma ger, at hesir samleikar kunnu finna hvønn annan og samskifta; tá tín samleiki er almannakunngjørdur, kanst tú luttaka.
help-ma-command =   .ma [port]                   bind til tín lokala ma-runtime, les /status.json, og goym .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     almannakunnger títt DID-skjal, so onnur kunnu finna lyklar tínar og endpoint
help-ma-security = Greiðasta álitismarkið er tín egni ma-runtime við tínum egna IPFS Desktop/Kubo. Ein fjarskotin publisher kann vera nyttigur, men tá líta tú á tænastu hjá øðrum.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hvussu tú fert inn í 間-rúmið

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Tá tín samleiki er kendur, letur .enter @ma teg stíga inn í 間. Finn tær ein heim, far inn í hann, og luttak haðani.
help-ma-entry-steps = Starta IPFS Desktop og ma, koyr síðan .ma. Almannakunnger við .my.identity!publish @ma, finn ein heim, og far inn við .enter @ma.
help-ma-entry-command =   .enter @ma                  far inn í 間 gjøgnum @ma-runtime
help-ma-entry-toggle =   .enter                       tendra ella sløkk rúmfokus; tín samleiki er framvegis virkin
help-ma-entry-url =   ?enter=<runtime>             far inn eftir innritan frá einum deildum URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tøkar mál (sett við .my.i18n: <code>):
err-lang-not-found = mál ikki funnið: { $lang }

msg-send-failed = sending mishavdi: { $e }
msg-not-logged-in = ikki innrittur

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-greiningarmistak: { $e }
yaml-not-mapping = YAML verður at vera mappingur (nykil: virðis-par); vanligur tekst og skalar kunnu ikki lagastast sum DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kóðingarmistak: { $e }
cbor-decode-error = CBOR-afkóðingarmistak: { $e }
cbor-json-error = CBOR til JSON-mistak: { $e }
yaml-serialise-error = YAML-serialiseringarmistak: { $e }
edit-reply-invalid = Ógildi redigeringsvar
doc-publish-ipld-error = IPLD-birting mistókst: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Innboks-klipping geymingarmistak: { $e }
err-config-load = Stillingsmistak við lesing: { $e }
err-lang-persist = Mállagar geymingarmistak: { $e }
err-history-parse = Søgugreiningarmistak: { $e }
err-history-load = Søgulesing mistak: { $e }
err-ipfs-reply-decode = IPFS-svar afkóðingarmistak: { $e }
err-edit-cbor = CBOR-redigeringsmistak: { $e }
err-popup-blocked = Uppsprettugluggi stoppað av vøktara
status-publishing = útgevur

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = feilur
rpc-error-detail = feilur: { $detail }
msg-new-message = ← [{ $from }] nýtt boð — { $count } í innposti
msg-chat = { $sender } sigur { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } sigur { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } gongur inn.
room-leave = * { $name } gongur út.
room-drop  = * { $name } slepper { $thing }.
room-take  = * { $name } tekur { $thing }.
err-edit-decode-failed = redigering: avkódingsfeilur: { $e }
err-edit-fetch-failed = redigering: heintingsfeilur: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = eingir virkir samgongur — profilin kann ikki slettast
profile-delete-error = profil ikki slettaður: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = vangamyndin er bronglað og send til IPFS; DID-skjalið verður dagført, tá CID kemur
profile-publish-done = vangamyndin er útgivin — DID-skjalið er dagført við ma.agent-CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = samleiki longu útgivin — profilur dagførdur
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binært innihald (ikki víst)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (einki)
profiles-deleted = profil { $name } slettaður
profiles-not-found = profil ikki funnin: { $name }

# -- Help topics index
help-header-topics = -- emner -- skriv .help/<topic> for detaljer
help-topic-msg =   .help/msg                    beskeder
help-topic-ma = .help/ma                     ma-pláss, útgáva og upptøka
help-topic-path = .help/path                   lokal prikk-slóð mállæra
help-topic-my =   .help/my                     personlig config
help-topic-inbox =   .help/inbox                  indbakke
help-topic-doc =   .help/doc                    dokumenter
help-topic-actor =   .help/actor                  fjern actor
help-topic-zscheme =   .help/zscheme               innfeld Scheme-úttrykk og skjalfesting
help-unknown-topic =   .help/{ $topic }: ukendt emne

# -- Help actor section
help-header-actor = -- fjernaktører
help-actor-echo =   @actor                       vis opløst DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         send beinleiðis/kjak/emote boð
help-actor-ping = @actor:ping                  lívsgleði ping
help-actor-entities =   @actor/entities              vis entiteter
help-actor-entities-get = @actor/entities/<n>          fá eindarknút
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     rediger entitet
help-actor-entities-del = @actor/entities/<n>:         strika eind
help-actor-config-get =   @actor/config/<key>          hent config-værdi
help-actor-config-set =   @actor/config/<key>: val     sæt config-værdi
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              rediger ACL
help-actor-fragment =   @actor#entity                send til plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC til plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  Halt 5 svar í setuumhvørvinum
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    opna zion í gegnum URL-tengil
help-topic-i18n = .help/i18n                   málval fyri tín samleika
help-header-url = ── URL-broytar ──────────────────────────────────────────────────────────────────
help-url-intro =   Del ein tengil sum opnar zion við fyritfuldum móttakara:
help-url-msg =   ?msg=<did>                   fyritfyllir: @<did>!msg (vanligt boð)
help-url-say =   ?say=<did>                   fyritfyllir: @<did>!say (sagnorð say)
help-url-emote =   ?emote=<did>                 fyritfyllir: @<did>!emote (sagnorð emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             skriva koyritíðarheimin eftir innritan
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Innritingin er fyritfyllt men ikki send — trýst á Enter fyri at senda.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                birta tín samleika í netinum
help-header-publish = ── birting av samleika ──────────────────────────────────────────────────────
help-publish-intro = Birting ger tín samleika funnarligan í netinum. Aðrir kunnu leita eftir tínum DID fyri at ná til tín.
help-publish-ma = Fyri at birta trengt tú ma (lokalt kørsluumhvørvi) installerað. Tað tengir ego við IPFS/IPNS fyri tín hønd.
help-publish-steps = Steg: køyr '.ma [port]' fyri at finna lokalt ma, síðan '.my.identity!publish @ma'.
help-publish-without = Uttan birting kunnu aðrir ikki ná til tín — jafnvel um tey kennu tín DID, kunnu tey ikki greina endepunkt tín.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = tilskila eitt vangamyndarnavn: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Savna hóp — skriva skipanir, enda við .batch
batch-already-collecting = Longu savna ein hóp — enda við .batch fyrst
batch-empty = Batch var tómt — einki at koyra
batch-running = Kører batch…
batch-step-timeout = hópstig tíðaravmarkað

batch-done = Batch færdig på { $secs }s — { $steps } trin
batch-done-error = Batch færdig med fejl på { $secs }s — { $steps } trin
msg-timeout = Beskeden fik timeout (intet svar på 60s)
err-unknown-command = ókend kommando: { $path }
err-read-only-path = { $path } er bert lesandi
help-cmd-batch-async =   .batch:async / .batch        evaluer kladdedokument parallelt


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Onnst ikki at fáa CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ógilt CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Áminning: Tín privati IPNS-lykil verður sendur til hetta keyrsluumhvørvi til at birta kennsl. Nýt bert eitt keyrsluumhvørvi tú fulliga treystir.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme metir Scheme-úttrykk, sum eru feld inn í zion-boð, og setur úrslitið inn í linjuna, áðrenn hon verður send.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    innfelt dømi; sendir "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             allýsingar verða verandi í núverandi innritaðu setu
help-zscheme-doc = Skjalfesting: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Staðbundin IPFS-gátt (krevst browsarútnamd)

tab-config = Stillingar
label-gateway = gateway
