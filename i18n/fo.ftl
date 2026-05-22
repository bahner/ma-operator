# zion — Føroyskt
lang-name = Føroyskt

# ── Innrásarsíða ──────────────────────────────────────────────────────────
tab-login = rita inn
tab-new-identity = nýggj samleika
tab-import = flyt inn
label-passphrase = loyniorð
label-username = brúkaranavn
label-confirm-passphrase = staðfest loyniorð
btn-login = rita inn
btn-export = flyt út
btn-generate = skapa
passphrase-warning = Gloymt loyniorð = gloymur samleika. Onki endurheimtan er møgulig.
import-help = Vel ein útfluttan .zion.json-fíl. Pakkin verður kryptaður.
status-unlocking = loysir lás...
status-generating = skapar samleika...
status-reading-file = les fíl...
status-imported = flutti inn '{ $name }' — skift til Rita inn-flipa
error-wrong-passphrase = rangt loyniorð: { $e }
error-identity-not-found = samleikinn '{ $name }' funnist ikki
error-username-required = brúkaranavn krevst
error-passphrase-required = loyniorð krevst
error-passphrases-no-match = loyniorð stimma ikki saman

# ── Kervisboð frá terminali ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ritaður inn sum { $username }
msg-type-help = Skriva .help fyri lista av skipanum.
msg-connecting = tengist iroh...
msg-iroh-ready = iroh-endapunktur er klár
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ stovnað [{ $cap }]: { $from }
msg-focus-cleared = fókus av
msg-focusing = fókuserar { $did } sum { $prompt }
msg-set = { $path }: { $value }
msg-deleted = strikti { $path } ({ $count } færslur)
msg-read-only = { $path } er skrivavørn
msg-subtree-set = { $path } er eitt undirtré; neitar at seta
msg-ancestor-leaf = ein forfaðir til { $path } er eitt lav; neitar at skyggja
msg-key-not-found = lykil funnist ikki: { $path }
msg-no-match = einki samsvar
msg-link-not-connected = hentingarvillur á tengli: ikki tengt
msg-link-fetch-error = hentingarvillur á tengli: { $e }
msg-link-key-not-found = lykillinn `{ $key }` funnist ikki í tøkt skjal

# ── Samnefnis-avgerð ──────────────────────────────────────────────────────
err-alias-name-empty = samnefni kann ikki vera tómt
err-alias-has-fragment = samnefni kann ikki innihalda '#'
err-alias-value-fragment = gildi á samnefni má vera einans did:ma:<ipns> (einki brot)
err-alias-value-path = gildi á samnefni má vera einans did:ma:<ipns> (ongin slóð)
err-alias-not-did = gildi á samnefni má byrja við did:ma:
err-unknown-alias = ókent samnefni: @{ $name }
err-bare-did = ventaði einans did:ma:<ipns> (einki brot ella slóð), fingu { $did }

# ── Rit-forrit ────────────────────────────────────────────────────────────
btn-save = Vista
btn-eval = Keyra
btn-cancel = Avlýs
btn-close = Lat aftur
btn-reply = Svar
btn-publish = Birta
msg-reply-sent = svar sent
msg-reply-failed = svar misluktist: { $e }
msg-entity-publish-sent = eindir { $name }: birting send
msg-entity-publish-failed = birting av eindir misluktist: { $e }
msg-field-publish-sent = eindir { $name }.{ $field }: birting send
msg-field-publish-failed = birting á øki misluktist: { $e }
msg-acl-publish-sent = runtime ACL: birting send
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

# ── Sagnorð — keyrsluumhvørvi ─────────────────────────────────────────────
discover-fetch-failed = uppgáva misluktist við { $url }: { $e }
discover-json-error = uppgáva misluktist: ógildigt JSON frá { $url }: { $e }
discover-missing-did = uppgáva misluktist: status.json manglar kravda feltið `did`
discover-invalid-did = uppgáva misluktist: ventaði `did` byrja við did:ma:, fingu `{ $did }`
discover-no-endpoint = uppgáva-ávirkan: `endpoint_id` manglar í status.json; vistað einans DID
discover-success = ma funnist við { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   samnefni @間 stovnað — birta við: .my.identity:publish @間
claim-success = Keyrsluumhvørvi gjørt krav á fyri { $did }
claim-conflict = Keyrsluumhvørvi longu gjørt krav á av annarri samleika
claim-http-failed = krøv misluktist: HTTP { $status }
claim-error = krøv misluktist: { $e }
claim-no-session = ikki ritaður inn; rita inn fyrst fyri at gera krav á keyrsluumhvørvið
runtime-no-verb = einki sagnorð `{ $verb }` fyri { $path }

# ── Sagnorð — atgonguslitsing ─────────────────────────────────────────────
acl-reset = .my.acl sett aftur (fult opinn)
acl-persist-error = vistu-villa: { $e }
acl-no-verb = einki sagnorð `{ $verb }` fyri .my.acl

# ── Sagnorð — samleiki ────────────────────────────────────────────────────
publish-usage = nýtsla: .my.identity:publish <did-ella-samnefni>

# ── Sagnorð — skjøl ──────────────────────────────────────────────────────
doc-content-empty = { $path }.content er tómur
doc-save-first = { $path }.content er tómur — vista fyrst
doc-missing-name = skjalsnavn manglar
doc-publish-usage = nýtsla: .my.doc.<navn>:publish <útgevari>
doc-publish-ipld-usage = nýtsla: .my.doc.<navn>:publish-ipld <útgevari>
doc-publish-failed = birting { $path }: { $e }
doc-publish-ipld-failed = ipld-birting { $path }: { $e }
doc-store-sent = vistunargrein send ({ $id }) → { $publisher }; CID kemur við RPC-svari
doc-ipld-store-sent = IPLD-vistunargrein send ({ $id }) → { $publisher }; CID kemur við RPC-svari
doc-fetch-done = sótti { $cid } → { $path }.content (ikki keyrt)
doc-fetch-failed = henting { $cid }: { $e }
doc-fetch-usage = nýtsla: .my.doc.<navn>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid er ikki sett
doc-no-verb = einki sagnorð `{ $verb }` fyri { $path }
path-no-verb = einki sagnorð `{ $verb }` fyri { $path }

# ── Hjálpitekstur — yvirskriftir ──────────────────────────────────────────
help-header-zion = ── zion-skipanir ──────────────────────────────────────────────────────────
help-header-messaging = ── boð ───────────────────────────────────────────────────────────────────
help-header-focus = ── fókusstilling ─────────────────────────────────────────────────────────
help-header-config = ── lokal stillingar-mállæra ────────────────────────────────────────────
help-header-common = ── vanligar slóðir ───────────────────────────────────────────────────────
help-header-inbox = ── innboks ───────────────────────────────────────────────────────────────
help-header-documents = ── skjøl ─────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        hesin tekstur
help-cmd-clear =   .clear                       reinsa terminalen
help-cmd-panic =   .panic                       seinasti ráður — nýt um tú ert í vandræðum
help-cmd-logout =   .logout                      rita út

help-msg-echo =   @alias                       vís leyst DID (einki boð sent)
help-msg-send =   @alias[:verb] body           send boð / RPC til aktør
help-msg-fragment =   @alias#fragment[:verb] body  send til samnefni við greiniligum DID-broti
help-msg-escape =   \@name                       bókstavligur @name (ongin samnefnisleit)

help-focus-set =   .use @alias [as @name]       fókuser á aktør (broytir kvaðning)
help-focus-clear =   .use                         reinsa fókus

help-config-get =   .path                        sók lav-gildi ella lista undirtré
help-config-filter =   .path value                  leitar-sía (sía eftir gildi)
help-config-set =   .path: value                 set lav
help-config-delete =   .path:                       strika lav ella undirtré
help-config-verb =   .path:verb [args]            keyra lokal sagnorð

help-my =   .my                          vís allar persónligar stillingar
help-aliases =   .my.aliases                  lista samnefni
help-aliases-set =   .my.aliases.<name>: <did>    legg afturat/dagfør samnefni (einans DID, einki #brot)
help-aliases-del =   .my.aliases.<name>:          strika samnefni
help-runtime-discover =   .my.runtime:discover          finn lokalt keyrsluumhvørvi og stovn @間-samnefni
help-runtime-claim =   .my.runtime:claim             ger krav á keyrsluumhvørvið við títt DID
help-identity =   .my.identity                 vís stillingar fyri samleika
help-identity-did =   .my.identity.did             vís egna DID (skrivavørn)
help-identity-publish =   .my.identity:publish @pub    birta egna DID í gongum útgevaraaðgerð
help-config-path =   .config                      vís allar .config.*-færslur

help-inbox =   .my.inbox                    lista innboks (undirtréssýni)
help-inbox-n =   .my.inbox.N                  vís øki á færslu N
help-inbox-from =   .my.inbox.N.from             avsendara-DID fyri færslu N
help-inbox-reply =   .my.inbox.N:reply [body]     send svar (opnar ritforrit uttan líkami)
help-inbox-open =   .my.inbox.N:open             opna innihald í skrivavørnum ritforrit
help-inbox-del =   .my.inbox.N:                 strika færslu N
help-inbox-delall =   .my.inbox:                   strika allar innboks-færslur
help-inbox-flush =   .my.inbox:flush              prenta allar færslur á terminalen
help-inbox-traverse =   .my.inbox.N.sender.<øki>    fletta DID-skjal avsendara seinkað

help-doc-edit =   .my.doc.<navn>:edit           opna ritforrit við vistað innihald
help-doc-edit-cid =   .my.doc.<navn>:edit <cid>     sók CID, opna til yvirkun
help-doc-eval =   .my.doc.<navn>:eval           keyra vistað innihald línu fyri línu
help-doc-publish =   .my.doc.<navn>:publish @pub   goyma sum raw blob (allar slags)
help-doc-publish-ipld =   .my.doc.<navn>:publish-ipld @pub  goyma YAML sum skipan DAG-CBOR IPLD-hnút
help-doc-fetch =   .my.doc.<navn>:fetch <cid>    flyt inn CID-innihald (ongin keyring)
help-doc-cid =   .my.doc.<navn>:cid            vís vistað CID
help-doc-del =   .my.doc.<navn>:              strika skjal

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Tøkar mál (sett við .my.i18n: <code>):
