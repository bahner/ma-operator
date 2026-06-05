# zion — Slovenščina
lang-name = Slovenščina

# ── Stran za prijavo ──────────────────────────────────────────────────────
tab-login = prijava
tab-new-identity = nova identiteta
tab-import = uvoz
label-passphrase = geslo-fraza
label-username = uporabniško ime
label-confirm-passphrase = potrdi geslo-frazo
btn-login = prijava
btn-export = izvoz
btn-generate = ustvari
btn-new-endpoint = nova končna točka
passphrase-warning = Izgubljeno geslo-fraza = izgubljena identiteta. Obnova ni mogoča.
import-help = Izberite izvoženo datoteko .zion.json. Paket ostane šifriran.
status-unlocking = odklepanje...
status-generating = ustvarjanje identitete...
status-reading-file = branje datoteke...
status-imported = '{ $name }' uvoženo — pojdite na zavihek Prijava
error-wrong-passphrase = napačno geslo-fraza: { $e }
error-identity-not-found = identiteta '{ $name }' ni najdena
error-username-required = uporabniško ime je obvezno
error-passphrase-required = geslo-fraza je obvezna
error-passphrases-no-match = gesli-frazi se ne ujemata

# ── Sistemska sporočila terminala ─────────────────────────────────────────
msg-logged-in = zion v{ $version } — prijavljeni kot { $username }
msg-type-help = Vnesite .help za seznam ukazov.
msg-connecting = vzpostavljanje povezave z iroh...
msg-iroh-ready = iroh končna točka je pripravljena
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID objavljeno prek lokalnega ma ({ $url })
msg-identity-not-published = Identiteta ni najdena v omrežju — če imaš ma nameščen lokalno, poženi '.my.ma:discover', nato '.my.identity:publish @ma'. Vtipkaj '.help.publish' za podrobnosti.
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
err-alias-value-fragment = vrednost vzdevka mora biti čisti did:ma:<ipns> (brez fragmenta)
err-alias-value-path = vrednost vzdevka mora biti čisti did:ma:<ipns> (brez poti)
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
discover-success = ma odkrito na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   vzdevek @ma ustvarjen — poženi '.my.identity:publish @ma' za objavo svoje identitete.
claim-success = Izvajanje zahtevano za { $did }
claim-conflict = Izvajanje že zahtevano od druge identitete
claim-http-failed = zahteva ni uspela: HTTP { $status }
claim-error = zahteva ni uspela: { $e }
claim-no-session = niste prijavljeni; najprej se prijavite za zahtevo izvajanja
runtime-no-verb = ni glagola `{ $verb }` za { $path }

# ── Glagoli — nadzor dostopa ──────────────────────────────────────────────
acl-reset = .my.acl ponastavljen (popolnoma odprt)
acl-persist-error = napaka pri shranjevanju: { $e }
acl-no-verb = ni glagola `{ $verb }` za .my.acl

# ── Glagoli — identiteta ──────────────────────────────────────────────────
publish-usage = uporaba: .my.identity:publish <did-ali-vzdevek>
identity-exported = Paket prenesen kot { $filename }
identity-export-failed = Izvoz ni uspel: { $e }

# ── Glagoli — dokumenti ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prazno
doc-save-first = { $path }.content je prazno — najprej shranite
doc-missing-name = manjka ime dokumenta
doc-publish-usage = uporaba: .my.doc.<ime>:publish <založnik>
doc-publish-ipld-usage = uporaba: .my.doc.<ime>:publish-ipld <založnik>
doc-publish-failed = objavljanje { $path }: { $e }
doc-publish-ipld-failed = objavljanje IPLD { $path }: { $e }
doc-store-sent = zahteva za shranjevanje poslana ({ $id }) → { $publisher }; CID bo prišel v odgovoru RPC
doc-ipld-store-sent = zahteva za shranjevanje IPLD poslana ({ $id }) → { $publisher }; CID bo prišel v odgovoru RPC
doc-fetch-done = { $cid } pridobljeno → { $path }.content (ni zagnano)
doc-fetch-failed = pridobivanje { $cid }: { $e }
doc-fetch-usage = uporaba: .my.doc.<ime>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ni nastavljeno
doc-no-verb = ni glagola `{ $verb }` za { $path }
path-no-verb = ni glagola `{ $verb }` za { $path }

# ── Besedilo pomoči — glave ───────────────────────────────────────────────
help-header-zion = ── ukazi zion ────────────────────────────────────────────────────────────
help-header-messaging = ── sporočanje ────────────────────────────────────────────────────────────
help-header-focus = ── način fokusa ──────────────────────────────────────────────────────────
help-header-config = ── lokalna slovnica konfiguracije ────────────────────────────────────
help-header-common = ── pogoste poti ──────────────────────────────────────────────────────────
help-header-inbox = ── prejeta pošta ─────────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        to besedilo
help-cmd-clear =   .clear                       počisti terminal
help-cmd-panic =   .panic                       zadnja možnost — uporabite, če ste v težavah
help-cmd-history =   .history                     zgodovina ukazov (zaporedni dvojniki združeni)
help-cmd-logout =   .logout                      odjava

help-msg-echo =   @alias                       prikaži razrešeni DID (ni poslano sporočilo)
help-msg-send =   @alias[:verb] body           pošlji sporočilo / RPC akterju
help-msg-fragment =   @alias#fragment[:verb] body  pošlji na vzdevek z eksplicitnim DID fragmentom
help-msg-escape =   \@name                       dobesedni @name (brez iskanja vzdevkov)

help-focus-set =   .use @alias [as @name]       fokusiraj na akterja (spremeni poziv)
help-focus-clear =   .use                         počisti fokus

help-config-get =   .path                        pridobi vrednost lista ali izpiši poddrevo
help-config-filter =   .path value                  filter iskanja (filtriranje po vrednosti)
help-config-set =   .path: value                 nastavi list
help-config-delete =   .path:                       izbriši list ali poddrevo
help-config-verb =   .path:verb [args]            zaženi lokalni glagol

help-my =   .my                          prikaži vso osebno konfiguracijo
help-aliases =   .my.aliases                  izpiši vzdevke
help-aliases-set =   .my.aliases.<name>: <did>    dodaj/posodobi vzdevek (čisti DID, brez #fragmenta)
help-aliases-del =   .my.aliases.<name>:          odstrani vzdevek
help-runtime-discover =   .my.ma:discover          odkrij lokalno izvajanje in ustvari vzdevek @ma
help-runtime-claim =   .my.ma:claim             zahtevaj izvajanje s svojim DID-om
help-identity =   .my.identity                 prikaži konfiguracijo identitete
help-identity-did =   .my.identity.did             prikaži lasten DID (samo za branje)
help-identity-publish =   .my.identity:publish @pub    objavi lasten DID prek storitve založnika
help-identity-export =   .my.identity:export          prenesi lastni paket identitete
help-config-path =   .config                      prikaži vse vnose .config.*

help-inbox =   .my.inbox                    izpiši prejeto pošto (pogled poddrevesa)
help-inbox-n =   .my.inbox.N                  prikaži polja vnosa N
help-inbox-from =   .my.inbox.N.from             DID pošiljatelja za vnos N
help-inbox-reply =   .my.inbox.N:reply [body]     pošlji odgovor (odpre urejevalnik brez vsebine)
help-inbox-open =   .my.inbox.N:open             odpri vsebino v urejevalniku samo za branje
help-inbox-del =   .my.inbox.N:                 izbriši vnos N
help-inbox-delall =   .my.inbox:                   izbriši vse vnose prejete pošte
help-inbox-flush =   .my.inbox:flush              izpiši vse vnose v terminal
help-inbox-filter =   .my.inbox:filter @who        prikaži samo vnose od @who
help-inbox-traverse =   .my.inbox.N.sender.<polje>  leno prehodi DID dokument pošiljatelja

help-doc-edit =   .my.doc.<ime>:edit           odpri urejevalnik s shranjeno vsebino
help-doc-edit-cid =   .my.doc.<ime>:edit <cid>     pridobi CID, odpri za pregled
help-doc-eval =   .my.doc.<ime>:eval           zaženi shranjeno vsebino vrstico za vrstico
help-doc-publish =   .my.doc.<ime>:publish @pub   shrani kot surovi blob (vse vrste)
help-doc-publish-ipld =   .my.doc.<ime>:publish-ipld @pub  shrani YAML kot strukturiran DAG-CBOR IPLD vozlišče
help-doc-fetch =   .my.doc.<ime>:fetch <cid>    uvozi vsebino CID (brez zagona)
help-doc-cid =   .my.doc.<ime>:cid            prikaži shranjeni CID
help-doc-del =   .my.doc.<ime>:              izbriši dokument

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
err-edit-decode-failed = urejanje: napaka pri dekodiranju: { $e }
err-edit-fetch-failed = urejanje: napaka pri nalaganju: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ni aktivne seje — profila ni mogoče izbrisati
profile-delete-error = brisanje profila ni uspelo: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys merged from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (noben)
profiles-deleted = profil { $name } izbrisan
profiles-not-found = profil ni najden: { $name }

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

help-topic-url =   .help.url                    odpiranje zion prek URL povezave
help-header-url = ── URL parametri ────────────────────────────────────────────────────────────────
help-url-intro =   Deli povezavo, ki odpre zion z vnaprej izpolnjenim prejemnikom:
help-url-msg =   ?msg=<did>                   vnaprej izpolni: @<did> (navadno sporočilo)
help-url-say =   ?say=<did>                   vnaprej izpolni: @<did>:say (glagol say)
help-url-emote =   ?emote=<did>                 vnaprej izpolni: @<did>:emote (glagol emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Vnosno polje je vnaprej izpolnjeno, a ni poslano — pritisni Enter za pošiljanje.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                objava identitete v omrežju
help-header-publish = ── objava identitete ────────────────────────────────────────────────────────
help-publish-intro = Objava naredi tvojo identiteto vidno v omrežju. Drugi lahko poiščejo tvoj DID, da te dosežejo.
help-publish-ma = Za objavo potrebuješ nameščen ma (lokalno izvajalno okolje). Poveže ego z IPFS/IPNS v tvojem imenu.
help-publish-steps = Koraki: poženi '.my.ma:discover' za zaznavo lokalnega ma, nato '.my.identity:publish @ma'.
help-publish-without = Brez objave te drugi ne morejo doseči — čeprav poznajo tvoj DID, ne morejo razrešiti tvojega endpointa.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
