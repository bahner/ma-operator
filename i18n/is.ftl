# zion — Íslenska
lang-name = Íslenska

# ── Innskráningarsíða ─────────────────────────────────────────────────────
tab-login = skrá inn
tab-new-identity = ný auðkenni
tab-import = flytja inn
label-passphrase = lykilsetning
label-username = notandanafn
label-confirm-passphrase = staðfesta lykilsetningu
btn-login = skrá inn
btn-export = flytja út
btn-generate = búa til
passphrase-warning = Gleymd lykilsetning = glatað auðkenni. Engin endurheimting er möguleg.
import-help = Veldu útflutta .zion.json-skrá. Pakkinn helst dulkóðaður.
status-unlocking = opnar lás...
status-generating = býr til auðkenni...
status-reading-file = les skrá...
status-imported = flutti inn '{ $name }' — skiptu yfir á Innskráningarflipa
error-wrong-passphrase = röng lykilsetning: { $e }
error-identity-not-found = auðkenni '{ $name }' fannst ekki
error-username-required = notandanafn er nauðsynlegt
error-passphrase-required = lykilsetning er nauðsynleg
error-passphrases-no-match = lykilsetningar passa ekki saman

# ── Kerfisskilaboð útstöðvar ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — innskráður sem { $username }
msg-type-help = Sláðu inn .help til að sjá lista yfir skipanir.
msg-connecting = tengist iroh...
msg-iroh-ready = iroh-endapunktur tilbúinn
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ lokað á [{ $cap }]: { $from }
msg-focus-cleared = fókus hreinsaður
msg-focusing = beinir athygli að { $did } sem { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eyddi { $path } ({ $count } færslur)
msg-read-only = { $path } er læst fyrir skrift
msg-subtree-set = { $path } er undirtré; neitar að stilla
msg-ancestor-leaf = forfaðir { $path } er lauf; neitar að skyggja
msg-key-not-found = lykill finnst ekki: { $path }
msg-no-match = engin samsvörun
msg-link-not-connected = hlekkur sóttist ekki: ekki tengt
msg-link-fetch-error = hlekkur sóttist ekki: { $e }
msg-link-key-not-found = lykillinn `{ $key }` finnst ekki í tengdu skjali

# ── Staðfesting á samnefnum ───────────────────────────────────────────────
err-alias-name-empty = samnefnið má ekki vera tómt
err-alias-has-fragment = samnefni má ekki innihalda '#'
err-alias-value-fragment = gildi samnefnis verður að vera hreint did:ma:<ipns> (ekkert brot)
err-alias-value-path = gildi samnefnis verður að vera hreint did:ma:<ipns> (engin slóð)
err-alias-not-did = gildi samnefnis verður að byrja á did:ma:
err-unknown-alias = óþekkt samnefni: @{ $name }
err-bare-did = bjóst við hreinu did:ma:<ipns> (ekkert brot eða slóð), fékk { $did }

# ── Ritill ────────────────────────────────────────────────────────────────
btn-save = Vista
btn-eval = Keyra
btn-cancel = Hætta við
btn-close = Loka
btn-reply = Svara
btn-publish = Birta
btn-publish-ipld = Birta IPLD
msg-reply-sent = svar sent
msg-reply-failed = svar mistókst: { $e }
msg-entity-publish-sent = eining { $name }: birting send
msg-entity-publish-failed = birting einingar mistókst: { $e }
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

# ── Sagnir — keyrsluumhverfi ──────────────────────────────────────────────
discover-fetch-failed = uppgötvun mistókst við { $url }: { $e }
discover-json-error = uppgötvun mistókst: ógilt JSON frá { $url }: { $e }
discover-missing-did = uppgötvun mistókst: status.json vantar nauðsynlegt svæði `did`
discover-invalid-did = uppgötvun mistókst: bjóst við að `did` byrjaði á did:ma:, fékk `{ $did }`
discover-no-endpoint = viðvörun uppgötvunar: `endpoint_id` vantar í status.json; vistuðum aðeins DID
discover-success = ma uppgötvað við { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   samnefni @ma búið til — birtið með: .my.identity:publish @ma
claim-success = Keyrsluumhverfi gert tilkall til fyrir { $did }
claim-conflict = Keyrsluumhverfi þegar gert tilkall til af annarri auðkenni
claim-http-failed = tilkall mistókst: HTTP { $status }
claim-error = tilkall mistókst: { $e }
claim-no-session = ekki innskráður; skráðu þig inn fyrst til að gera tilkall til keyrsluumhverfis
runtime-no-verb = engin sögn `{ $verb }` fyrir { $path }

# ── Sagnir — aðgangsstýring ───────────────────────────────────────────────
acl-reset = .my.acl endurstillt (fullkomlega opið)
acl-persist-error = vistunarvillu: { $e }
acl-no-verb = engin sögn `{ $verb }` fyrir .my.acl

# ── Sagnir — auðkenni ────────────────────────────────────────────────────
publish-usage = notkun: .my.identity:publish <did-eða-samnefni>

# ── Sagnir — skjöl ───────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tómt
doc-save-first = { $path }.content er tómt — vistaðu fyrst
doc-missing-name = skjalsheiti vantar
doc-publish-usage = notkun: .my.doc.<nafn>:publish <útgefandi>
doc-publish-ipld-usage = notkun: .my.doc.<nafn>:publish-ipld <útgefandi>
doc-publish-failed = birting { $path }: { $e }
doc-publish-ipld-failed = ipld-birting { $path }: { $e }
doc-store-sent = geymslugrein send ({ $id }) → { $publisher }; CID kemur með RPC-svari
doc-ipld-store-sent = IPLD-geymslugrein send ({ $id }) → { $publisher }; CID kemur með RPC-svari
doc-fetch-done = sótti { $cid } → { $path }.content (ekki keyrt)
doc-fetch-failed = sókn { $cid }: { $e }
doc-fetch-usage = notkun: .my.doc.<nafn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ekki stillt
doc-no-verb = engin sögn `{ $verb }` fyrir { $path }
path-no-verb = engin sögn `{ $verb }` fyrir { $path }

# ── Hjálpartexti — fyrirsagnir ────────────────────────────────────────────
help-header-zion = ── zion-skipanir ──────────────────────────────────────────────────────────
help-header-messaging = ── skilaboð ──────────────────────────────────────────────────────────────
help-header-focus = ── fókusstilling ─────────────────────────────────────────────────────────
help-header-config = ── staðbundin stillingarfræðikerfis ─────────────────────────────────────
help-header-common = ── algengar slóðir ───────────────────────────────────────────────────────
help-header-inbox = ── pósthólf ──────────────────────────────────────────────────────────────
help-header-documents = ── skjöl ─────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        þessi texti
help-cmd-clear =   .clear                       hreinsa útstöðina
help-cmd-panic =   .panic                       síðasta úrræði — notaðu ef þú ert í vandræðum
help-cmd-logout =   .logout                      skrá út

help-msg-echo =   @alias                       sýna leyst DID (engin skilaboð send)
help-msg-send =   @alias[:verb] body           senda skilaboð / RPC til leikara
help-msg-fragment =   @alias#fragment[:verb] body  senda til samnefnis með skýrum DID-broti
help-msg-escape =   \@name                       bókstaflegur @name (engin samnefnileit)

help-focus-set =   .use @alias [as @name]       fókusera á leikara (breytir kvaðningu)
help-focus-clear =   .use                         hreinsa fókus

help-config-get =   .path                        sækja laufsgildi eða lista undirtré
help-config-filter =   .path value                  leitarsía (sía eftir gildi)
help-config-set =   .path: value                 stilla lauf
help-config-delete =   .path:                       eyða laufi eða undirtré
help-config-verb =   .path:verb [args]            keyra staðbundna sögn

help-my =   .my                          sýna alla persónulega stillingu
help-aliases =   .my.aliases                  lista samnefni
help-aliases-set =   .my.aliases.<name>: <did>    bæta við/uppfæra samnefni (hreint DID, ekkert #brot)
help-aliases-del =   .my.aliases.<name>:          fjarlægja samnefni
help-runtime-discover =   .my.ma:discover          uppgötva staðbundið keyrsluumhverfi og búa til @ma-samnefni
help-runtime-claim =   .my.ma:claim             gera tilkall til keyrsluumhverfis með þínu DID
help-identity =   .my.identity                 sýna stillingu auðkennis
help-identity-did =   .my.identity.did             sýna eigið DID (læst fyrir skrift)
help-identity-publish =   .my.identity:publish @pub    birta eigið DID í gegnum útgefendasþjónustu
help-config-path =   .config                      sýna allar .config.*-færslur

help-inbox =   .my.inbox                    lista pósthólf (undirtréssýn)
help-inbox-n =   .my.inbox.N                  sýna reiti færslu N
help-inbox-from =   .my.inbox.N.from             DID sendanda fyrir færslu N
help-inbox-reply =   .my.inbox.N:reply [body]     senda svar (opnar ritil án meginmáls)
help-inbox-open =   .my.inbox.N:open             opna efni í ritli læstum fyrir skrift
help-inbox-del =   .my.inbox.N:                 eyða færslu N
help-inbox-delall =   .my.inbox:                   eyða öllum pósthólffærslum
help-inbox-flush =   .my.inbox:flush              prenta allar færslur á útstöðina
help-inbox-traverse =   .my.inbox.N.sender.<svæði>  fletta upp DID-skjali sendanda seinkað

help-doc-edit =   .my.doc.<nafn>:edit           opna ritil með vistað efni
help-doc-edit-cid =   .my.doc.<nafn>:edit <cid>     sækja CID, opna til yfirferðar
help-doc-eval =   .my.doc.<nafn>:eval           keyra vistað efni línu fyrir línu
help-doc-publish =   .my.doc.<nafn>:publish @pub   geyma sem hrá blob (allar gerðir)
help-doc-publish-ipld =   .my.doc.<nafn>:publish-ipld @pub  geyma YAML sem skipulagða DAG-CBOR IPLD-hnút
help-doc-fetch =   .my.doc.<nafn>:fetch <cid>    flytja inn CID-efni (engin keyrsla)
help-doc-cid =   .my.doc.<nafn>:cid            sýna vistað CID
help-doc-del =   .my.doc.<nafn>:              eyða skjali

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
yaml-serialize-error = YAML-raðgreiningarvilla: { $e }
edit-reply-invalid = Ógilt breytingarsvar
doc-publish-ipld-error = IPLD-birting mistókst: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Innhólf-hreinsun geymingarvilla: { $e }
err-config-load = Stillinga hleðsluvilla: { $e }
err-lang-persist = Tungumáls geymingarvilla: { $e }
err-history-parse = Söguþáttunarvilla: { $e }
err-history-load = Sögu hleðsluvilla: { $e }
err-ipfs-reply-decode = IPFS-svar afkóðunarvilla: { $e }
err-edit-cbor = CBOR-breytingarvilla: { $e }
err-popup-blocked = Vafrinn lokaði á sprettiglugga
status-publishing = gefur út

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = villa
rpc-error-detail = villa: { $detail }
msg-new-message = ← [{ $from }] ný skilaboð — { $count } í pósthólfi
err-edit-decode-failed = ritvinnsla: afkóðunarvilla: { $e }
err-edit-fetch-failed = ritvinnsla: sækingarvilla: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = engin virk lota — ekki hægt að eyða notandaprófíl
profile-delete-error = eyðing notandaprófíls mistókst: { $e }
profile-no-verb = .my.profile: óþekkt skipun: { $verb }
