# zion — Hrvatski
lang-name = Hrvatski

# ── Stranica za prijavu ───────────────────────────────────────────────────
tab-login = prijava
tab-new-identity = novi identitet
tab-import-profile = uvezi profil
label-passphrase = lozinka-fraza
label-username = korisničko ime
label-confirm-passphrase = potvrdi lozinku-frazu
label-did = DID
label-profile-cid = CID profila
label-or-file = ili datoteka
btn-login = prijava
btn-export = izvoz
btn-generate = generiraj
btn-new-endpoint = nova krajnja točka
btn-import-profile = uvezi profil
passphrase-warning = Izgubljena lozinka-fraza = izgubljen identitet. Oporavak nije moguć.
import-profile-help = Uvezite profil putem CID-a ili datoteke. Potrebna je ista pristupna fraza koja je korištena pri objavljivanju.
import-profile-detected-user = Profil pripada: { $name }
status-unlocking = otključavanje...
status-generating = generiranje identiteta...
status-reading-file = čitanje datoteke...
status-fetching-profile = dohvaćanje profila s IPFS-a...
status-imported = '{ $name }' uvezeno — prijeđite na karticu Prijava
status-importing-profile = uvoženje profila...
profile-import-done = profil uvezen za '{ $name }' — učitano { $n } ključeva
error-wrong-passphrase = pogrešna lozinka-fraza: { $e }
error-identity-not-found = identitet '{ $name }' nije pronađen
error-username-required = korisničko ime je obavezno
error-passphrase-required = lozinka-fraza je obavezna
error-passphrases-no-match = lozinke-fraze se ne podudaraju
error-profile-source-required = navedite CID ili prenesite datoteku
error-did-required = unesite svoj DID
error-profile-fetch = nije moguće dohvatiti profil: { $e }
error-profile-no-username = profil ne sadrži korisničko ime
error-profile-no-identity = identitet '{ $name }' nije pronađen — prvo uvezite identitet

# ── Sistemske poruke terminala ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — prijavljeni kao { $username }
msg-type-help = Unesite .help za popis naredbi.
msg-connecting = spajanje na iroh...
msg-iroh-ready = iroh krajnja točka spremna
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID objavljen putem lokalnog ma ({ $url })
msg-ma-connecting-matrix = pokušavam te spojiti na 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokalni 間 zatražen
msg-local-ma-already-claimed = lokalni 間 već je zatražen
msg-local-ma-claim-failed = nije uspjelo zatražiti lokalni 間
msg-identity-not-published = Identitet nije pronađen online — ako imaš ma instaliran lokalno, pokreni '.ma [port]' i zatim '.my.identity!publish @ma'. Upiši '.help/publish' za pojedinosti.
msg-blocked = ⊗ blokirano [{ $cap }]: { $from }
msg-focus-cleared = fokus obrisan
msg-focusing = fokusiranje na { $did } kao { $prompt }
msg-set = { $path }: { $value }
msg-deleted = obrisano { $path } ({ $count } unosa)
msg-read-only = { $path } je samo za čitanje
msg-subtree-set = { $path } je podstablo; postavljanje odbijeno
msg-ancestor-leaf = predak od { $path } je list; zasjenjivanje odbijeno
msg-key-not-found = ključ nije pronađen: { $path }
msg-no-match = nema podudaranja
msg-link-not-connected = greška pri dohvaćanju veze: nije spojeno
msg-link-fetch-error = greška pri dohvaćanju veze: { $e }
msg-link-key-not-found = ključ `{ $key }` nije pronađen u povezanom dokumentu

# ── Provjera valjanosti pseudonima ────────────────────────────────────────
err-alias-name-empty = naziv pseudonima ne smije biti prazan
err-alias-has-dot = naziv pseudonima ne smije sadržavati '.'
err-alias-has-fragment = naziv pseudonima ne smije sadržavati '#'
err-alias-value-fragment = vrijednost pseudonima smije sadržavati najviše jedan neprazan DID-URL fragment
err-alias-value-path = vrijednost pseudonima mora biti did:ma:<ipns> DID ili DID-URL (bez putanje)
err-alias-not-did = vrijednost pseudonima mora počinjati s did:ma:
err-unknown-alias = nepoznat pseudonim: @{ $name }
err-bare-did = očekivano čisto did:ma:<ipns> (bez fragmenta ili putanje), primljeno { $did }

# ── Uređivač ──────────────────────────────────────────────────────────────
btn-save = Spremi
btn-eval = Pokreni
btn-cancel = Odustani
btn-close = Zatvori
btn-reply = Odgovori
btn-publish = Objavi
btn-publish-ipld = Objavi IPLD
msg-reply-sent = odgovor poslan
msg-reply-failed = slanje odgovora nije uspjelo: { $e }
msg-entity-publish-sent = entitet { $name }: objava poslana
msg-entity-publish-failed = objavljivanje entiteta nije uspjelo: { $e }
msg-kind-publish-failed = objavljivanje vrste nije uspjelo: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: objava poslana
msg-field-publish-failed = objavljivanje polja nije uspjelo: { $e }
msg-acl-publish-sent = ACL izvođenja: objava poslana
msg-crud-edit-publish-sent = { $path }: objava poslana
msg-acl-publish-failed = objavljivanje ACL izvođenja nije uspjelo: { $e }
msg-yaml-error = greška YAML: { $e }
msg-editor-saved = { $path }:spremi
msg-fetch-review = { $cid } dohvaćeno — pregledajte prije pokretanja
msg-fetch-failed = dohvaćanje { $cid }: { $e }

# ── Glagoli — pristigla pošta ─────────────────────────────────────────────
inbox-empty = pristigla pošta je prazna
inbox-entry-not-found = unos { $n } pristigle pošte nije pronađen
inbox-no-message-id = unos { $n } pristigle pošte nema message_id
inbox-no-verb = nema glagola `{ $verb }` za unos { $n } pristigle pošte
inbox-filter-no-arg = filter zahtijeva argument DID ili alias
inbox-filter-empty = nema poruka od { $did }

# ── Glagoli — izvođenje ───────────────────────────────────────────────────
discover-fetch-failed = otkrivanje nije uspjelo na { $url }: { $e }
discover-json-error = otkrivanje nije uspjelo: nevažeći JSON od { $url }: { $e }
discover-missing-did = otkrivanje nije uspjelo: status.json nedostaje obavezno polje `did`
discover-invalid-did = otkrivanje nije uspjelo: očekivano `did` koje počinje s did:ma:, primljeno `{ $did }`
discover-no-endpoint = upozorenje otkrivanja: `endpoint_id` odsutan u status.json; pohranjen samo DID
discover-hint-endpoint-not-found = Savjet: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Savjet: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Savjet: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Savjet: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma otkriveno na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma stvoren — pokreni '.my.identity!publish @ma' za objavu svog identiteta.
claim-success = Izvođenje zatraženo za { $did }
claim-conflict = Izvođenje već zatraženo od drugog identiteta
claim-already-owned = Runtime je već zatražen od ove identitete
claim-http-failed = zahtjev nije uspio: HTTP { $status }
claim-error = zahtjev nije uspio: { $e }
claim-no-session = niste prijavljeni; prvo se prijavite za zatražiti izvođenje
runtime-no-verb = nema glagola `{ $verb }` za { $path }

# ── Glagoli — kontrola pristupa ───────────────────────────────────────────
acl-reset = .my.acl resetiran (potpuno otvoren)
acl-persist-error = greška pri spremanju: { $e }
acl-no-verb = nema glagola `{ $verb }` za .my.acl

# ── Glagoli — identitet ───────────────────────────────────────────────────
publish-usage = korištenje: .my.identity!publish <did-ili-pseudonim>
identity-exported = Paket preuzet kao { $filename }
identity-export-failed = Izvoz nije uspio: { $e }

# ── Glagoli — dokumenti ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prazno
doc-save-first = { $path }.content je prazno — prvo spremite
doc-missing-name = nedostaje naziv dokumenta
doc-publish-usage = korištenje: .my.doc.<naziv>!publish <izdavač>
doc-publish-ipld-usage = korištenje: .my.doc.<naziv>!publish-ipld <izdavač>
doc-publish-failed = objavljivanje { $path }: { $e }
doc-publish-ipld-failed = objavljivanje IPLD { $path }: { $e }
doc-publish-error-detail = objava nije uspjela [{ $code }]: { $err }
doc-publish-error-hint = Savjet: { $hint }
doc-publish-hint-session = ponovno se prijavite kako bi ego mogao pristupiti vašim identifikacijskim ključevima
doc-publish-hint-target = koristite važeći DID izdavača ili alias koji se razrješava na goli 57
doc-publish-hint-network = provjerite jesu li 7 runtime i 22 dostupni, zatim pokušajte ponovno
doc-publish-hint-resolve = provjerite je li izdavač DID dokument objavljen i sadrži dohvatljivu krajnju točku
doc-publish-hint-acl = zamolite operatera izdavača da vam dopusti DID u 48
doc-publish-hint-runtime = runtime/plugin odbio je zahtjev; provjerite razlog i pokušajte ponovno nakon popravka entiteta/vremena izvođenja
doc-publish-hint-ipfs = provjerite lokalno zdravlje 12/17 i status vremena izvođenja izdavača
doc-publish-hint-unknown = pregledajte zapisnike vremena izvođenja radi detaljnog uzroka i pokušajte ponovno
doc-store-sent = zahtjev za pohranom poslan ({ $id }) → { $publisher }; CID će stići u odgovoru RPC
doc-ipld-store-sent = zahtjev za pohranom IPLD poslan ({ $id }) → { $publisher }; CID će stići u odgovoru RPC
doc-fetch-done = { $cid } dohvaćeno → { $path }.content (nije pokrenuto)
doc-fetch-failed = dohvaćanje { $cid }: { $e }
doc-fetch-usage = korištenje: .my.doc.<naziv>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nije postavljeno
doc-no-verb = nema glagola `{ $verb }` za { $path }
path-no-verb = nema glagola `{ $verb }` za { $path }

# ── Tekst pomoći — zaglavlja ──────────────────────────────────────────────
help-header-zion = ── naredbe zion ───────────────────────────────────────────────────────────
help-header-messaging = ── poruke ────────────────────────────────────────────────────────────────
help-header-config = ── lokalna gramatika konfiguracije ───────────────────────────────────
help-header-common = ── uobičajene putanje ────────────────────────────────────────────────────
help-header-inbox = ── pristigla pošta ───────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-header-i18n = ── jezik ───────────────────────────────────────────────────────────────
help-header-ma = ── 3-razmak ─────────────────────────────────────────────────────────────────
help-header-ma-entry = ── unos 間-razmaka ───────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ovaj tekst
help-cmd-clear =   .clear                       očisti terminal
help-cmd-panic =   .panic                       zadnja mogućnost — koristite ako ste u nevolji
help-cmd-history =   .history                     povijest naredbi (uzastopni duplikati spojeni)
help-cmd-logout =   .logout                      odjava
help-cmd-batch =   .batch                       evaluiraj privremeni dokument paralelno
help-cmd-batch-sync =   .batch:sync / .batch         evaluiraj privremeni dokument red po red

help-msg-echo =   @alias                       prikaži razriješeni DID/DID-URL (poruka se ne šalje)
help-msg-send =   @alias!msg body / @alias:verb args           pošalji poruku / RPC akteru
help-msg-fragment =   @alias#fragment:verb body  pošalji na pseudonim s eksplicitnim DID fragmentom
help-msg-escape =   \@name                       doslovni @name (bez pretraživanja pseudonima)


help-config-get =   .path                        dohvati vrijednost lista ili izlistaj podstablo
help-config-filter =   .path value                  filter pretraživanja (filtriranje po vrijednosti)
help-config-set =   .path: value                 postavi list
help-config-delete =   .path:                       obriši list ili podstablo
help-config-verb =   .path!verb [args]            pokreni lokalni glagol

help-my =   .my                          prikaži cjelokupnu osobnu konfiguraciju
help-aliases =   .my.aliases                  izlistaj pseudonime
help-aliases-set =   .my.aliases.<name>: <did-url>    dodaj/ažuriraj pseudonim (DID ili DID-URL)
help-aliases-del =   .my.aliases.<name>:          ukloni pseudonim
help-runtime-discover =   .ma [port]          otkrij lokalno izvođenje i stvori pseudonim @ma
help-runtime-claim =   .ma [port]             zahtijevaj izvođenje svojim DID-om
help-identity =   .my.identity                 prikaži konfiguraciju identiteta
help-identity-did =   .my.identity.did             prikaži vlastiti DID (samo za čitanje)
help-identity-publish =   .my.identity!publish @pub    objavi vlastiti DID putem usluge izdavača
help-identity-export =   .my.identity!export          preuzmi vlastiti paket identiteta
help-config-path =   .config                      prikaži sve unose .config.*

help-inbox =   .my.inbox                    izlistaj pristiglu poštu (prikaz podstabla)
help-inbox-n =   .my.inbox.N                  prikaži polja unosa N
help-inbox-from =   .my.inbox.N.from             DID pošiljatelja za unos N
help-inbox-reply =   .my.inbox.N!reply [body]     pošalji odgovor (otvori uređivač bez tijela)
help-inbox-open =   .my.inbox.N!open             otvori sadržaj u uređivaču samo za čitanje
help-inbox-del =   .my.inbox.N:                 obriši unos N
help-inbox-delall =   .my.inbox:                   obriši sve unose pristigle pošte
help-inbox-flush =   .my.inbox!flush              ispiši sve unose u terminal
help-inbox-filter =   .my.inbox!filter @who        prikaži samo unose od @who
help-inbox-traverse =   .my.inbox.N.sender.<polje>  lijeno prolazi DID dokumentom pošiljatelja

help-doc-edit =   .my.doc.<naziv>!edit           otvori uređivač sa spremljenim sadržajem
help-doc-edit-cid =   .my.doc.<naziv>!edit /ipfs/<cid>     dohvati CID, otvori za pregled
help-doc-eval =   .my.doc.<naziv>!eval           pokreni spremljeni sadržaj redak po redak
help-doc-publish =   .my.doc.<naziv>!publish @pub   spremi kao sirovi blob (svi tipovi)
help-doc-publish-ipld =   .my.doc.<naziv>!publish-ipld @pub  spremi YAML kao strukturirani DAG-CBOR IPLD čvor
help-doc-fetch =   .my.doc.<naziv>!fetch /ipfs/<cid>    uvezi sadržaj CID (bez pokretanja)
help-doc-cid =   .my.doc.<naziv>!cid            prikaži spremljeni CID
help-doc-del =   .my.doc.<naziv>:              obriši dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n pohranjuje postavke jezika povezane s vašim identitetom.
help-i18n-set = .my.i18n: <code>             odaberite jezik koji 20 koristi za ovaj identitet
help-i18n-list = .my.i18n!list               popis dostupnih jezičnih kodova

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Soba 間 prostor je između 間 identiteta. ma omogućuje tim identitetima da se pronađu i komuniciraju; kad je tvoj identitet objavljen, možeš sudjelovati.
help-ma-command =   .ma [port]                   poveži se s lokalnim ma runtimeom, pročitaj /status.json i spremi .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     objavi svoj DID dokument kako bi drugi mogli razriješiti tvoje ključeve i endpoint
help-ma-security = Najjasnija granica povjerenja je tvoj vlastiti ma runtime s vlastitim IPFS Desktop/Kubo. Udaljeni publisher može biti koristan, ali tada se oslanjaš na tuđu uslugu.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kako ući u sobu 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kad je tvoj identitet poznat, .enter @ma omogućuje ti ulazak u 間. Pronađi svijet, uđi u njega i sudjeluj odande.
help-ma-entry-steps = Pokreni IPFS Desktop i ma, zatim pokreni .ma. Objavi s .my.identity!publish @ma, pronađi svijet i uđi s .enter @ma.
help-ma-entry-command =   .enter @ma                  uđi u 間 kroz @ma runtime
help-ma-entry-toggle =   .enter                       uključi ili isključi fokus sobe; tvoj identitet ostaje aktivan
help-ma-entry-url =   ?enter=<runtime>             uđi nakon prijave iz dijeljenog URL-a

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostupni jezici (postavi s .my.i18n: <code>):
err-lang-not-found = jezik nije pronađen: { $lang }

msg-send-failed = slanje nije uspjelo: { $e }
msg-not-logged-in = nije prijavljen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Greška pri parsiranju YAML-a: { $e }
yaml-not-mapping = YAML mora biti mapping (parovi ključ: vrijednost); obični tekst i skalari ne mogu se pohraniti kao DAG-CBOR
dagcbor-encode-error = Greška kodiranja DAG-CBOR: { $e }
cbor-decode-error = Greška dekodiranja CBOR: { $e }
cbor-json-error = Greška pretvorbe CBOR u JSON: { $e }
yaml-serialize-error = Greška serijalizacije YAML-a: { $e }
edit-reply-invalid = Nevažeći odgovor na uređivanje
doc-publish-ipld-error = Objavljivanje IPLD-a nije uspjelo: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Greška pri pohrani čišćenja pristigle pošte: { $e }
err-config-load = Greška pri učitavanju konfiguracije: { $e }
err-lang-persist = Greška pri pohrani jezika: { $e }
err-history-parse = Greška pri parsiranju povijesti: { $e }
err-history-load = Greška pri učitavanju povijesti: { $e }
err-ipfs-reply-decode = Greška dekodiranja IPFS odgovora: { $e }
err-edit-cbor = Greška uređivanja CBOR-a: { $e }
err-popup-blocked = Preglednik je blokirao skočni prozor
status-publishing = objavljujem

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = greška
rpc-error-detail = greška: { $detail }
msg-new-message = ← [{ $from }] nova poruka — { $count } u pristigloj pošti
msg-chat = { $sender } kaže { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } kaže { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ulazi u sobu.
room-leave = * { $name } napušta sobu.
room-drop  = * { $name } ispušta { $thing }.
room-take  = * { $name } podiže { $thing }.
err-edit-decode-failed = uređivanje: pogreška dekodiranja: { $e }
err-edit-fetch-failed = uređivanje: pogreška dohvata: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nema aktivne sesije — profil nije moguće izbrisati
profile-delete-error = brisanje profila nije uspjelo: { $e }
profile-wrong-user = ne možete postaviti 11 za drugi profil — samo svoj
profile-wrong-user-name = ne može postaviti 11 za 19 — samo svoj profil
profile-no-ma = nije konfigurirano vrijeme izvođenja 3 — prvo pokrenite 31
profile-no-cid = nema pohranjenih 3 za ovaj profil — prvo pokrenite 37
profile-no-cid-in-doc = nije pronađen profil 11 u DID dokumentu — prvo pokrenite 43
profile-publish-sent = profil je šifriran i poslan na IPFS; DID dokument ažurirat će se kad stigne CID
profile-publish-done = profil objavljen — DID dokument ažuriran je s ma.agent CID-om
profile-publish-failed = objava profila nije uspjela: 24
profile-fetch-done = profil dohvaćen — 18 ključevi učitani iz 43
profile-fetch-failed = dohvaćanje profila nije uspjelo: 22
msg-identity-exists = identitet već objavljen — profil ažuriran
profile-import-exists = profil 8 već postoji — prvo ga izbrišite
profile-import-wrong-user = datoteka sadrži profil 22, očekivano 42

# -- CID content operations
cid-op-binary = binarni sadržaj (nije prikazan)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = nije uspio dohvatiti sadržaj: 25
cid-op-unknown = operacija nepoznatog sadržaja: 27
cid-op-wc = { $lines } linije 18 riječi 36 znakovi
profiles-empty = (nijedan)
profiles-deleted = profil { $name } izbrisan
profiles-not-found = profil nije pronađen: { $name }

# -- Help topics index
help-header-topics = -- teme -- upišite .help/<topic> za detalje
help-topic-msg =   .help/msg                    poruke
help-topic-ma = .help/ma                     ma-prostor, izdavaštvo i unos
help-topic-path = .help/path                   lokalna gramatika staza točka
help-topic-my =   .help/my                     osobna config
help-topic-inbox =   .help/inbox                  ulazna pošta
help-topic-doc =   .help/doc                    dokumenti
help-topic-actor =   .help/actor                  udaljeni actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: nepoznata tema

# -- Help actor section
help-header-actor = -- udaljeni aktori
help-actor-echo =   @actor                       prikaži razriješeni DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         pošalji izravnu/chat/emotivnu poruku
help-actor-ping = @actor:ping                  živost ping
help-actor-entities =   @actor/entities              ispiši entitete
help-actor-entities-get = @actor/entities/<n>          dobiti čvor entiteta
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   postaviti entitet 14 referencom
help-actor-entities-edit =   @actor/entities/<n>!edit     uredi entitet
help-actor-entities-del = @actor/entities/<n>:         izbrisati entitet
help-actor-config-get =   @actor/config/<key>          dohvati config vrijednost
help-actor-config-set =   @actor/config/<key>: val     postavi config vrijednost
help-actor-acl = @actor/acl                   dobiti 4
help-actor-acl-edit =   @actor/acl!edit              uredi ACL
help-actor-fragment =   @actor#entity                pošalji pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC prema pluginu
help-header-cid-ops = ── 3 glumac zove ────────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  pozvati entitet 15 iz 24 i čekati njegov odgovor
help-actor-head = (@actor/path)                dohvaća udaljeni CRUD sadržaj od 31
help-actor-tail = (<bafy...>)                  uključi i procijeni 21 iz 36 41
help-actor-wc = (define x (@actor:verb arg))  zadržati 5 odgovore u okruženju sesije
help-actor-wc-l = .my.scheme.ma!edit           uredi spremljene 11 pomagače za ovaj identitet

help-topic-url =   .help/url                    otvaranje ziona putem URL veze
help-topic-i18n = .help/i18n                   preferencija jezika za vaš identitet
help-header-url = ── URL parametri ────────────────────────────────────────────────────────────────
help-url-intro =   Podijeli vezu koja otvara zion s unaprijed ispunjenim primateljem:
help-url-msg =   ?msg=<did>                   unaprijed ispunjava: @<did>!msg (obična poruka)
help-url-say =   ?say=<did>                   unaprijed ispunjava: @<did>!say (glagol say)
help-url-emote =   ?emote=<did>                 unaprijed ispunjava: @<did>!emote (glagol emote)
help-url-ma = ?ma=<did-or-url>              unaprijed popunjeno vrijeme izvođenja DID / 23 URL
help-url-enter = ?enter=<runtime>             uđite u runtime svijet nakon prijave
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Unos je unaprijed ispunjen ali nije poslan — pritisni Enter za slanje.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                objaviti identitet u mreži
help-header-publish = ── objava identiteta ────────────────────────────────────────────────────────
help-publish-intro = Objavljivanje čini tvoj identitet pronađljivim u mreži. Drugi mogu potražiti tvoj DID da te kontaktiraju.
help-publish-ma = Za objavu trebaš instaliran ma (lokalno izvršno okruženje). Ono povezuje ego s IPFS/IPNS u tvoje ime.
help-publish-steps = Koraci: pokreni '.ma [port]' za otkrivanje lokalnog ma, zatim '.my.identity!publish @ma'.
help-publish-without = Bez objave drugi te ne mogu doseći — čak i ako znaju tvoj DID, ne mogu razriješiti tvoj endpoint.
profile-fetch-did-resolve-failed = DID još nije objavljen — prvo pokrenite 28, a zatim 67 svoj profil
profile-update-done = profil ažuriran — 18 ključevi spojeni iz 43
profile-delete-needs-name = navedite naziv profila: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Prikupljanje serija — naredbe tipa, završavaju s .batch
batch-already-collecting = Već prikupljate seriju — prvo završite s .batch
batch-empty = Serija je bila prazna — ništa za pokretanje
batch-running = Pokrećem batch…
batch-step-timeout = paketni korak je istekao

batch-done = Batch završen za { $secs }s — { $steps } koraka
batch-done-error = Batch završen s pogreškama za { $secs }s — { $steps } koraka
msg-timeout = Poruka je istekla (nema odgovora u 60s)
err-unknown-command = nepoznata naredba: { $path }
err-read-only-path = { $path } je samo za čitanje
help-cmd-batch-async =   .batch:async / .batch        evaluiraj privremeni dokument paralelno


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Dohvaćanje CID-a { $cid } nije uspjelo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Nevažeći CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Upozorenje: Vaš privatni IPNS ključ bit će poslan ovom izvršnom okruženju radi objave identiteta. Koristite samo izvršno okruženje kojemu u potpunosti vjerujete.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
