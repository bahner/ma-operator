# zion — Slovenščina
lang-name = Slovenščina

# ── Stran za prijavo ──────────────────────────────────────────────────────
tab-login = prijava
tab-new-identity = nova identiteta
tab-import-profile = uvozi profil
label-passphrase = geslo-fraza
label-username = uporabniško ime
label-confirm-passphrase = potrdi geslo-frazo
label-did = DID
label-profile-cid = CID profila
label-or-file = ali datoteka
btn-login = prijava
btn-export = izvoz
btn-generate = ustvari
btn-new-endpoint = nova končna točka
btn-import-profile = uvozi profil
passphrase-warning = Izgubljeno geslo-fraza = izgubljena identiteta. Obnova ni mogoča.
import-profile-help = Uvozite profil prek CID ali datoteke. Potrebujete isto geslo, ki je bilo uporabljeno pri objavljanju.
import-profile-detected-user = Profil pripada: { $name }
status-unlocking = odklepanje...
status-generating = ustvarjanje identitete...
status-reading-file = branje datoteke...
status-fetching-profile = pridobivanje profila iz IPFS...
status-imported = '{ $name }' uvoženo — pojdite na zavihek Prijava
status-importing-profile = uvažanje profila...
profile-import-done = profil uvožen za '{ $name }' — naloženih { $n } ključev
error-wrong-passphrase = napačno geslo-fraza: { $e }
error-identity-not-found = identiteta '{ $name }' ni najdena
error-username-required = uporabniško ime je obvezno
error-passphrase-required = geslo-fraza je obvezna
error-passphrases-no-match = gesli-frazi se ne ujemata
error-profile-source-required = navedite CID ali naložite datoteko
error-did-required = vnesite vaš DID
error-profile-fetch = ni bilo mogoče pridobiti profila: { $e }
error-profile-no-username = profil ne vsebuje uporabniškega imena
error-profile-no-identity = identiteta '{ $name }' ni bila najdena — najprej uvozite identiteto

# ── Sistemska sporočila terminala ─────────────────────────────────────────
msg-logged-in = zion v{ $version } — prijavljeni kot { $username }
msg-type-help = Vnesite .help za seznam ukazov.
msg-connecting = vzpostavljanje povezave z iroh...
msg-iroh-ready = iroh končna točka je pripravljena
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID objavljeno prek lokalnega ma ({ $url })
msg-ma-connecting-matrix = poskušam te povezati z 間trixom
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokalni 間 zahtevan
msg-local-ma-already-claimed = lokalni 間 je že zahtevan
msg-local-ma-claim-failed = lokalnega 間 ni bilo mogoče zahtevati
msg-identity-not-published = Identiteta ni najdena v omrežju — če imaš ma nameščen lokalno, poženi '.ma [port]', nato '.my.identity!publish @ma'. Vtipkaj '.help/publish' za podrobnosti.
msg-blocked = ⊗ blokirano [{ $cap }]: { $from }
msg-focus-cleared = fokus izbrisan
msg-focusing = fokusiranje na { $did } kot { $prompt }
msg-set = { $path }: { $value }
msg-deleted = izbrisano { $path } ({ $count } vnosov)
msg-read-only = { $path } je samo za branje
msg-subtree-set = { $path } je poddrevo; nastavitev zavrnjena
msg-ancestor-leaf = predhodnik od { $path } je list; senčenje zavrnjeno
msg-key-not-found = ključ ni najden: { $path }
msg-no-match = ni ujemanja
msg-link-not-connected = napaka pri pridobivanju povezave: ni povezano
msg-link-fetch-error = napaka pri pridobivanju povezave: { $e }
msg-link-key-not-found = ključ `{ $key }` ni najden v povezanem dokumentu

# ── Preverjanje vzdevkov ──────────────────────────────────────────────────
err-alias-name-empty = ime vzdevka ne sme biti prazno
err-alias-has-dot = ime vzdevka ne sme vsebovati '.'
err-alias-has-fragment = ime vzdevka ne sme vsebovati '#'
err-alias-value-fragment = vrednost vzdevka lahko vsebuje največ en neprazen fragment DID-URL
err-alias-value-path = vrednost vzdevka mora biti did:ma:<ipns> DID ali DID-URL (brez poti)
err-alias-not-did = vrednost vzdevka mora začeti z did:ma:
err-unknown-alias = neznan vzdevek: @{ $name }
err-bare-did = pričakovan čisti did:ma:<ipns> (brez fragmenta ali poti), prejeto { $did }

# ── Urejevalnik ───────────────────────────────────────────────────────────
btn-save = Shrani
btn-eval = Zaženi
btn-cancel = Prekliči
btn-close = Zapri
btn-reply = Odgovori
btn-publish = Objavi
btn-publish-ipld = Objavi IPLD
msg-reply-sent = odgovor poslan
msg-reply-failed = pošiljanje odgovora ni uspelo: { $e }
msg-entity-publish-sent = entiteta { $name }: objava poslana
msg-entity-publish-failed = objavljanje entitete ni uspelo: { $e }
msg-kind-publish-failed = objava vrste ni uspela: { $e }
msg-field-publish-sent = entiteta { $name }.{ $field }: objava poslana
msg-field-publish-failed = objavljanje polja ni uspelo: { $e }
msg-acl-publish-sent = ACL izvajanja: objava poslana
msg-crud-edit-publish-sent = { $path }: objava poslana
msg-acl-publish-failed = objavljanje ACL izvajanja ni uspelo: { $e }
msg-yaml-error = napaka YAML: { $e }
msg-editor-saved = { $path }:shrani
msg-fetch-review = { $cid } pridobljeno — preverite pred zagonom
msg-fetch-failed = pridobivanje { $cid }: { $e }

# ── Glagoli — prejeta pošta ───────────────────────────────────────────────
inbox-empty = prejeta pošta je prazna
inbox-entry-not-found = vnos { $n } prejete pošte ni najden
inbox-no-message-id = vnos { $n } prejete pošte nima message_id
inbox-no-verb = ni glagola `{ $verb }` za vnos { $n } prejete pošte
inbox-filter-no-arg = filter zahteva argument DID ali vzdevka
inbox-filter-empty = ni sporočil od { $did }

# ── Glagoli — izvajanje ───────────────────────────────────────────────────
discover-fetch-failed = odkrivanje ni uspelo na { $url }: { $e }
discover-json-error = odkrivanje ni uspelo: neveljavna JSON z { $url }: { $e }
discover-missing-did = odkrivanje ni uspelo: status.json manjka obvezno polje `did`
discover-invalid-did = odkrivanje ni uspelo: pričakovan `did` ki se začne z did:ma:, prejeto `{ $did }`
discover-no-endpoint = opozorilo odkrivanja: `endpoint_id` manjka v status.json; shranjen samo DID
discover-hint-endpoint-not-found = Namig: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Namig: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Namig: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Namig: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma odkrito na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   vzdevek @ma ustvarjen — poženi '.my.identity!publish @ma' za objavo svoje identitete.
claim-success = Izvajanje zahtevano za { $did }
claim-conflict = Izvajanje že zahtevano od druge identitete
claim-already-owned = Runtime je že zahtevala ta identiteta
claim-http-failed = zahteva ni uspela: HTTP { $status }
claim-error = zahteva ni uspela: { $e }
claim-no-session = niste prijavljeni; najprej se prijavite za zahtevo izvajanja
runtime-no-verb = ni glagola `{ $verb }` za { $path }

# ── Glagoli — nadzor dostopa ──────────────────────────────────────────────
acl-reset = .my.acl ponastavljen (popolnoma odprt)
acl-persist-error = napaka pri shranjevanju: { $e }
acl-no-verb = ni glagola `{ $verb }` za .my.acl

# ── Glagoli — identiteta ──────────────────────────────────────────────────
publish-usage = uporaba: .my.identity!publish <did-ali-vzdevek>
identity-exported = Paket prenesen kot { $filename }
identity-export-failed = Izvoz ni uspel: { $e }

# ── Glagoli — dokumenti ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prazno
doc-save-first = { $path }.content je prazno — najprej shranite
doc-missing-name = manjka ime dokumenta
doc-publish-usage = uporaba: .my.doc.<ime>!publish <založnik>
doc-publish-ipld-usage = uporaba: .my.doc.<ime>!publish-ipld <založnik>
doc-publish-failed = objavljanje { $path }: { $e }
doc-publish-ipld-failed = objavljanje IPLD { $path }: { $e }
doc-publish-error-detail = objava ni uspela [{ $code }]: { $err }
doc-publish-error-hint = Namig: { $hint }
doc-publish-hint-session = znova se prijavite, da bo lahko ego dostopal do vaših identifikacijskih ključev
doc-publish-hint-target = uporabite veljaven DID založnika ali vzdevek, ki se razreši na golo 57
doc-publish-hint-network = preverite, ali sta izvajalni čas 7 in 22 dosegljiva, nato poskusite znova
doc-publish-hint-resolve = preverite, ali je dokument izdajatelja DID objavljen in vsebuje dosegljivo končno točko
doc-publish-hint-acl = prosite operaterja izdajatelja, da dovoli vaš DID v 48
doc-publish-hint-runtime = runtime/plugin je zavrnil zahtevo; preglejte razlog in poskusite znova, ko popravite entiteto/izvajalni čas
doc-publish-hint-ipfs = preveri lokalno zdravje 12/17 in stanje izvajalnega časa izdajatelja
doc-publish-hint-unknown = preglejte dnevnike izvajalnega časa za podroben vzrok in poskusite znova
doc-store-sent = zahteva za shranjevanje poslana ({ $id }) → { $publisher }; CID bo prišel v odgovoru RPC
doc-ipld-store-sent = zahteva za shranjevanje IPLD poslana ({ $id }) → { $publisher }; CID bo prišel v odgovoru RPC
doc-fetch-done = { $cid } pridobljeno → { $path }.content (ni zagnano)
doc-fetch-failed = pridobivanje { $cid }: { $e }
doc-fetch-usage = uporaba: .my.doc.<ime>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ni nastavljeno
doc-no-verb = ni glagola `{ $verb }` za { $path }
path-no-verb = ni glagola `{ $verb }` za { $path }

# ── Besedilo pomoči — glave ───────────────────────────────────────────────
help-header-zion = ── ukazi zion ────────────────────────────────────────────────────────────
help-header-messaging = ── sporočanje ────────────────────────────────────────────────────────────
help-header-config = ── lokalna slovnica konfiguracije ────────────────────────────────────
help-header-common = ── pogoste poti ──────────────────────────────────────────────────────────
help-header-inbox = ── prejeta pošta ─────────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-header-i18n = ── jezik ────────────────────────────────────────────────────────────────
help-header-ma = ── 3-presledek ─────────────────────────────────────────────────────────────────
help-header-ma-entry = ── vnos 間-presledka ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        to besedilo
help-cmd-clear =   .clear                       počisti terminal
help-cmd-panic =   .panic                       zadnja možnost — uporabite, če ste v težavah
help-cmd-history =   .history                     zgodovina ukazov (zaporedni dvojniki združeni)
help-cmd-logout =   .logout                      odjava
help-cmd-batch =   .batch                       evaluiraj privremeni dokument paralelno
help-cmd-batch-sync =   .batch:sync / .batch         evaluiraj privremeni dokument red po red

help-msg-echo =   @alias                       prikaži razrešeni DID/DID-URL (sporočilo se ne pošlje)
help-msg-send =   @alias!msg body / @alias:verb args           pošlji sporočilo / RPC akterju
help-msg-fragment =   @alias#fragment:verb body  pošlji na vzdevek z eksplicitnim DID fragmentom
help-msg-escape =   \@name                       dobesedni @name (brez iskanja vzdevkov)


help-config-get =   .path                        pridobi vrednost lista ali izpiši poddrevo
help-config-filter =   .path value                  filter iskanja (filtriranje po vrednosti)
help-config-set =   .path: value                 nastavi list
help-config-delete =   .path:                       izbriši list ali poddrevo
help-config-verb =   .path!verb [args]            zaženi lokalni glagol

help-my =   .my                          prikaži vso osebno konfiguracijo
help-aliases =   .my.aliases                  izpiši vzdevke
help-aliases-set =   .my.aliases.<name>: <did-url>    dodaj/posodobi vzdevek (DID ali DID-URL)
help-aliases-del =   .my.aliases.<name>:          odstrani vzdevek
help-runtime-discover =   .ma [port]          odkrij lokalno izvajanje in ustvari vzdevek @ma
help-runtime-claim =   .ma [port]             zahtevaj izvajanje s svojim DID-om
help-identity =   .my.identity                 prikaži konfiguracijo identitete
help-identity-did =   .my.identity.did             prikaži lasten DID (samo za branje)
help-identity-publish =   .my.identity!publish @pub    objavi lasten DID prek storitve založnika
help-identity-export =   .my.identity!export          prenesi lastni paket identitete
help-config-path =   .config                      prikaži vse vnose .config.*

help-inbox =   .my.inbox                    izpiši prejeto pošto (pogled poddrevesa)
help-inbox-n =   .my.inbox.N                  prikaži polja vnosa N
help-inbox-from =   .my.inbox.N.from             DID pošiljatelja za vnos N
help-inbox-reply =   .my.inbox.N!reply [body]     pošlji odgovor (odpre urejevalnik brez vsebine)
help-inbox-open =   .my.inbox.N!open             odpri vsebino v urejevalniku samo za branje
help-inbox-del =   .my.inbox.N:                 izbriši vnos N
help-inbox-delall =   .my.inbox:                   izbriši vse vnose prejete pošte
help-inbox-flush =   .my.inbox!flush              izpiši vse vnose v terminal
help-inbox-filter =   .my.inbox!filter @who        prikaži samo vnose od @who
help-inbox-traverse =   .my.inbox.N.sender.<polje>  leno prehodi DID dokument pošiljatelja

help-doc-edit =   .my.doc.<ime>!edit           odpri urejevalnik s shranjeno vsebino
help-doc-edit-cid =   .my.doc.<ime>!edit /ipfs/<cid>     pridobi CID, odpri za pregled
help-doc-eval =   .my.doc.<ime>!eval           zaženi shranjeno vsebino vrstico za vrstico
help-doc-publish =   .my.doc.<ime>!publish @pub   shrani kot surovi blob (vse vrste)
help-doc-publish-ipld =   .my.doc.<ime>!publish-ipld @pub  shrani YAML kot strukturiran DAG-CBOR IPLD vozlišče
help-doc-fetch =   .my.doc.<ime>!fetch /ipfs/<cid>    uvozi vsebino CID (brez zagona)
help-doc-cid =   .my.doc.<ime>!cid            prikaži shranjeni CID
help-doc-del =   .my.doc.<ime>:              izbriši dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n shrani jezikovne nastavitve, povezane z vašo identiteto.
help-i18n-set = .my.i18n: <code>             izberite jezik, ki ga 20 uporablja za to identiteto
help-i18n-list = .my.i18n!list               seznam razpoložljivih jezikovnih kod

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Soba 間 je prostor med identitetami 間. ma tem identitetam omogoča, da se najdejo in komunicirajo; ko je tvoja identiteta objavljena, lahko sodeluješ.
help-ma-command =   .ma [port]                   poveži se z lokalnim ma runtime, preberi /status.json in shrani .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     objavi svoj dokument DID, da lahko drugi razrešijo tvoje ključe in endpoint
help-ma-security = Najjasnejša meja zaupanja je tvoj lastni ma runtime z lastnim IPFS Desktop/Kubo. Oddaljeni publisher je lahko koristen, vendar se takrat zanašaš na storitev nekoga drugega.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kako vstopiti v sobo 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Ko je tvoja identiteta znana, ti .enter @ma omogoči vstop v 間. Poišči svet, vstopi vanj in sodeluj od tam.
help-ma-entry-steps = Zaženi IPFS Desktop in ma, nato zaženi .ma. Objavi z .my.identity!publish @ma, poišči svet in vstopi z .enter @ma.
help-ma-entry-command =   .enter @ma                  vstopi v 間 prek runtime @ma
help-ma-entry-toggle =   .enter                       vklopi ali izklopi fokus sobe; tvoja identiteta ostane aktivna
help-ma-entry-url =   ?enter=<runtime>             vstop po prijavi iz deljene URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Razpoložljivi jeziki (nastavi z .my.i18n: <code>):
err-lang-not-found = jezik ni najden: { $lang }

msg-send-failed = pošiljanje ni uspelo: { $e }
msg-not-logged-in = ni prijavljen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Napaka pri razčlenjevanju YAML: { $e }
yaml-not-mapping = YAML mora biti mapping (pari ključ: vrednost); navadno besedilo in skalari ne morejo biti shranjeni kot DAG-CBOR
dagcbor-encode-error = Napaka pri kodiranju DAG-CBOR: { $e }
cbor-decode-error = Napaka pri dekodiranju CBOR: { $e }
cbor-json-error = Napaka CBOR v JSON: { $e }
yaml-serialize-error = Napaka pri serializaciji YAML: { $e }
edit-reply-invalid = Neveljavni odgovor urejanja
doc-publish-ipld-error = Objava IPLD ni uspela: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Napaka pri shranjevanju čiščenja nabiralnika: { $e }
err-config-load = Napaka pri nalaganju konfiguracije: { $e }
err-lang-persist = Napaka pri shranjevanju jezika: { $e }
err-history-parse = Napaka pri razčlenjevanju zgodovine: { $e }
err-history-load = Napaka pri nalaganju zgodovine: { $e }
err-ipfs-reply-decode = Napaka pri dekodiranju odgovora IPFS: { $e }
err-edit-cbor = Napaka pri urejanju CBOR: { $e }
err-popup-blocked = Brskalnik je blokiral pojavno okno
status-publishing = objavljanje

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = napaka
rpc-error-detail = napaka: { $detail }
msg-new-message = ← [{ $from }] novo sporočilo — { $count } v dohodnem predalu
msg-chat = { $sender } pravi { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } pravi { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } vstopi v sobo.
room-leave = * { $name } zapusti sobo.
room-drop  = * { $name } spusti { $thing }.
room-take  = * { $name } dvigne { $thing }.
err-edit-decode-failed = urejanje: napaka pri dekodiranju: { $e }
err-edit-fetch-failed = urejanje: napaka pri nalaganju: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ni aktivne seje — profila ni mogoče izbrisati
profile-delete-error = brisanje profila ni uspelo: { $e }
profile-wrong-user = ne morete nastaviti 11 za drug profil — samo za svojega
profile-wrong-user-name = ne more nastaviti 11 za 19 — samo svoj profil
profile-no-ma = ni konfiguriranega izvajalnega okolja 3 — najprej zaženite 31
profile-no-cid = za ta profil ni shranjen 3 — najprej zaženite 37
profile-no-cid-in-doc = v dokumentu DID ni najden profil 11 — najprej zaženite 43
profile-publish-sent = profil je šifriran in poslan v IPFS; dokument DID bo posodobljen, ko prispe CID
profile-publish-done = profil objavljen — dokument DID posodobljen z ma.agent CID
profile-publish-failed = objava profila ni uspela: 24
profile-fetch-done = profil pridobljen — ključi 18 naloženi iz 43
profile-fetch-failed = pridobivanje profila ni uspelo: 22
msg-identity-exists = identiteta že objavljena — profil posodobljen
profile-import-exists = profil 8 že obstaja — najprej ga izbrišite
profile-import-wrong-user = datoteka vsebuje profil 22, pričakovano 42

# -- CID content operations
cid-op-binary = binarna vsebina (ni prikazana)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = ni uspelo pridobiti vsebine: 25
cid-op-unknown = operacija neznane vsebine: 27
cid-op-wc = { $lines } vrstice 18 besede 36 znaki
profiles-empty = (noben)
profiles-deleted = profil { $name } izbrisan
profiles-not-found = profil ni najden: { $name }

# -- Help topics index
help-header-topics = -- teme -- upišite .help/<topic> za detalje
help-topic-msg =   .help/msg                    poruke
help-topic-ma = .help/ma                     ma-prostor, založništvo in vstop
help-topic-path = .help/path                   lokalna slovnica dot-path
help-topic-my =   .help/my                     osobna config
help-topic-inbox =   .help/inbox                  ulazna pošta
help-topic-doc =   .help/doc                    dokumenti
help-topic-actor =   .help/actor                  udaljeni actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: nepoznata tema

# -- Help actor section
help-header-actor = -- udaljeni aktori
help-actor-echo =   @actor                       prikaži razriješeni DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         pošlji neposredno/klepetalno/čustveno sporočilo
help-actor-ping = @actor:ping                  živahnost ping
help-actor-entities =   @actor/entities              ispiši entitete
help-actor-entities-get = @actor/entities/<n>          pridobi vozlišče entitete
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   nastavite entiteto s sklicem 14
help-actor-entities-edit =   @actor/entities/<n>!edit     uredi entitet
help-actor-entities-del = @actor/entities/<n>:         izbriši entiteto
help-actor-config-get =   @actor/config/<key>          dohvati config vrijednost
help-actor-config-set =   @actor/config/<key>: val     postavi config vrijednost
help-actor-acl = @actor/acl                   pridobi 4
help-actor-acl-edit =   @actor/acl!edit              uredi ACL
help-actor-fragment =   @actor#entity                pošalji pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC prema pluginu
help-header-cid-ops = ── 3 igralec kliče ────────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  pokličite entiteto 15 iz 24 in počakajte na njen odgovor
help-actor-head = (@actor/path)                pridobi oddaljeno vsebino CRUD iz 31
help-actor-tail = (<bafy...>)                  vključi in ovrednoti 21 iz 36 41
help-actor-wc = (define x (@actor:verb arg))  obdrži odgovore 5 v okolju seje
help-actor-wc-l = .my.scheme.ma!edit           uredi shranjene pomočnike 11 za to identiteto

help-topic-url =   .help/url                    odpiranje zion prek URL povezave
help-topic-i18n = .help/i18n                   nastavitev jezika za vašo identiteto
help-header-url = ── URL parametri ────────────────────────────────────────────────────────────────
help-url-intro =   Deli povezavo, ki odpre zion z vnaprej izpolnjenim prejemnikom:
help-url-msg =   ?msg=<did>                   vnaprej izpolni: @<did>!msg (navadno sporočilo)
help-url-say =   ?say=<did>                   vnaprej izpolni: @<did>!say (glagol say)
help-url-emote =   ?emote=<did>                 vnaprej izpolni: @<did>!emote (glagol emote)
help-url-ma = ?ma=<did-or-url>              predizpolnjevanje izvajalnega časa DID / 23 URL
help-url-enter = ?enter=<runtime>             vstopite v svet izvajanja po prijavi
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Vnosno polje je vnaprej izpolnjeno, a ni poslano — pritisni Enter za pošiljanje.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                objava identitete v omrežju
help-header-publish = ── objava identitete ────────────────────────────────────────────────────────
help-publish-intro = Objava naredi tvojo identiteto vidno v omrežju. Drugi lahko poiščejo tvoj DID, da te dosežejo.
help-publish-ma = Za objavo potrebuješ nameščen ma (lokalno izvajalno okolje). Poveže ego z IPFS/IPNS v tvojem imenu.
help-publish-steps = Koraki: poženi '.ma [port]' za zaznavo lokalnega ma, nato '.my.identity!publish @ma'.
help-publish-without = Brez objave te drugi ne morejo doseči — čeprav poznajo tvoj DID, ne morejo razrešiti tvojega endpointa.
profile-fetch-did-resolve-failed = DID še ni objavljen — najprej zaženite 28, nato pa 67 svoj profil
profile-update-done = profil posodobljen — ključi 18 združeni iz 43
profile-delete-needs-name = navedite ime profila: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Zbiranje batch — tip ukazov, ki se končajo z .batch
batch-already-collecting = Serijo že zbirate — najprej končajte s .batch
batch-empty = Paket je bil prazen — nič za zagon
batch-running = Pokrećem batch…
batch-step-timeout = paketni korak je potekel

batch-done = Batch završen za { $secs }s — { $steps } koraka
batch-done-error = Batch završen s pogreškama za { $secs }s — { $steps } koraka
msg-timeout = Poruka je istekla (nema odgovora u 60s)
err-unknown-command = neznan ukaz: { $path }
err-read-only-path = { $path } je samo za branje
help-cmd-batch-async =   .batch:async / .batch        evaluiraj privremeni dokument paralelno


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Pridobivanje CID { $cid } ni uspelo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Neveljaven CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Opozorilo: Vaš zasebni ključ IPNS bo poslan v to izvajalno okolje za objavo identitete. Uporabljajte samo izvajalno okolje, ki mu popolnoma zaupate.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
