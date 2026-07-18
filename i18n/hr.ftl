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
err-alias-value-fragment = vrijednost pseudonima mora biti čist did:ma:<ipns> (bez fragmenta)
err-alias-value-path = vrijednost pseudonima mora biti čist did:ma:<ipns> (bez putanje)
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
discover-success = ma otkriveno na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma stvoren — pokreni '.my.identity!publish @ma' za objavu svog identiteta.
claim-success = Izvođenje zatraženo za { $did }
claim-conflict = Izvođenje već zatraženo od drugog identiteta
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
help-header-focus = ── način fokusa ──────────────────────────────────────────────────────────
help-header-config = ── lokalna gramatika konfiguracije ───────────────────────────────────
help-header-common = ── uobičajene putanje ────────────────────────────────────────────────────
help-header-inbox = ── pristigla pošta ───────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ovaj tekst
help-cmd-clear =   .clear                       očisti terminal
help-cmd-panic =   .panic                       zadnja mogućnost — koristite ako ste u nevolji
help-cmd-history =   .history                     povijest naredbi (uzastopni duplikati spojeni)
help-cmd-logout =   .logout                      odjava
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:sync / .batch         eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       prikaži razriješeni DID (nije poslana poruka)
help-msg-send =   @alias!msg body / @alias:verb args           pošalji poruku / RPC akteru
help-msg-fragment =   @alias#fragment:verb body  pošalji na pseudonim s eksplicitnim DID fragmentom
help-msg-escape =   \@name                       doslovni @name (bez pretraživanja pseudonima)

help-focus-set =   .use @alias [as @name]       fokusiranje na aktera (mijenja prompt)
help-focus-clear =   .use                         obriši fokus

help-config-get =   .path                        dohvati vrijednost lista ili izlistaj podstablo
help-config-filter =   .path value                  filter pretraživanja (filtriranje po vrijednosti)
help-config-set =   .path: value                 postavi list
help-config-delete =   .path:                       obriši list ili podstablo
help-config-verb =   .path!verb [args]            pokreni lokalni glagol

help-my =   .my                          prikaži cjelokupnu osobnu konfiguraciju
help-aliases =   .my.aliases                  izlistaj pseudonime
help-aliases-set =   .my.aliases.<name>: <did>    dodaj/ažuriraj pseudonim (čist DID, bez #fragmenta)
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
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nijedan)
profiles-deleted = profil { $name } izbrisan
profiles-not-found = profil nije pronađen: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor[#entity]!msg|!say|!emote body         send direct/chat/emote message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor/entities              list entities
help-actor-entities-get =   @actor/entities/<n>          get entity
help-actor-entities-set =   @actor/entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entity
help-actor-entities-del =   @actor/entities/<n>:         delete entity
help-actor-config-get =   @actor/config/<key>          get config value
help-actor-config-set =   @actor/config/<key>: val     set config value
help-actor-acl =   @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help/url                    otvaranje ziona putem URL veze
help-header-url = ── URL parametri ────────────────────────────────────────────────────────────────
help-url-intro =   Podijeli vezu koja otvara zion s unaprijed ispunjenim primateljem:
help-url-msg =   ?msg=<did>                   unaprijed ispunjava: @<did>!msg (obična poruka)
help-url-say =   ?say=<did>                   unaprijed ispunjava: @<did>!say (glagol say)
help-url-emote =   ?emote=<did>                 unaprijed ispunjava: @<did>!emote (glagol emote)
help-url-ma =   ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-ctx =   ?ctx=<actor[#entity]>         auto-focus actor/entity after login
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Unos je unaprijed ispunjen ali nije poslan — pritisni Enter za slanje.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                objaviti identitet u mreži
help-header-publish = ── objava identiteta ────────────────────────────────────────────────────────
help-publish-intro = Objavljivanje čini tvoj identitet pronađljivim u mreži. Drugi mogu potražiti tvoj DID da te kontaktiraju.
help-publish-ma = Za objavu trebaš instaliran ma (lokalno izvršno okruženje). Ono povezuje ego s IPFS/IPNS u tvoje ime.
help-publish-steps = Koraci: pokreni '.ma [port]' za otkrivanje lokalnog ma, zatim '.my.identity!publish @ma'.
help-publish-without = Bez objave drugi te ne mogu doseći — čak i ako znaju tvoj DID, ne mogu razriješiti tvoj endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
batch-step-timeout = batch step timed out

batch-done = batch-done
batch-done-error = batch-done-error
msg-timeout = msg-timeout
help-cmd-batch-async = help-cmd-batch-async


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Dohvaćanje CID-a { $cid } nije uspjelo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Nevažeći CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Upozorenje: Vaš privatni IPNS ključ bit će poslan ovom izvršnom okruženju radi objave identiteta. Koristite samo izvršno okruženje kojemu u potpunosti vjerujete.
