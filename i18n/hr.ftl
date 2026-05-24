# zion — Hrvatski
lang-name = Hrvatski

# ── Stranica za prijavu ───────────────────────────────────────────────────
tab-login = prijava
tab-new-identity = novi identitet
tab-import = uvoz
label-passphrase = lozinka-fraza
label-username = korisničko ime
label-confirm-passphrase = potvrdi lozinku-frazu
btn-login = prijava
btn-export = izvoz
btn-generate = generiraj
passphrase-warning = Izgubljena lozinka-fraza = izgubljen identitet. Oporavak nije moguć.
import-help = Odaberite izvezenu .zion.json datoteku. Paket ostaje šifriran.
status-unlocking = otključavanje...
status-generating = generiranje identiteta...
status-reading-file = čitanje datoteke...
status-imported = '{ $name }' uvezeno — prijeđite na karticu Prijava
error-wrong-passphrase = pogrešna lozinka-fraza: { $e }
error-identity-not-found = identitet '{ $name }' nije pronađen
error-username-required = korisničko ime je obavezno
error-passphrase-required = lozinka-fraza je obavezna
error-passphrases-no-match = lozinke-fraze se ne podudaraju

# ── Sistemske poruke terminala ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — prijavljeni kao { $username }
msg-type-help = Unesite .help za popis naredbi.
msg-connecting = spajanje na iroh...
msg-iroh-ready = iroh krajnja točka spremna
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = odgovor poslan
msg-reply-failed = slanje odgovora nije uspjelo: { $e }
msg-entity-publish-sent = entitet { $name }: objava poslana
msg-entity-publish-failed = objavljivanje entiteta nije uspjelo: { $e }
msg-field-publish-sent = entitet { $name }.{ $field }: objava poslana
msg-field-publish-failed = objavljivanje polja nije uspjelo: { $e }
msg-acl-publish-sent = ACL izvođenja: objava poslana
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

# ── Glagoli — izvođenje ───────────────────────────────────────────────────
discover-fetch-failed = otkrivanje nije uspjelo na { $url }: { $e }
discover-json-error = otkrivanje nije uspjelo: nevažeći JSON od { $url }: { $e }
discover-missing-did = otkrivanje nije uspjelo: status.json nedostaje obavezno polje `did`
discover-invalid-did = otkrivanje nije uspjelo: očekivano `did` koje počinje s did:ma:, primljeno `{ $did }`
discover-no-endpoint = upozorenje otkrivanja: `endpoint_id` odsutan u status.json; pohranjen samo DID
discover-success = ma otkriveno na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   pseudonim @ma stvoren — objavite s: .my.identity:publish @ma
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
publish-usage = korištenje: .my.identity:publish <did-ili-pseudonim>

# ── Glagoli — dokumenti ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prazno
doc-save-first = { $path }.content je prazno — prvo spremite
doc-missing-name = nedostaje naziv dokumenta
doc-publish-usage = korištenje: .my.doc.<naziv>:publish <izdavač>
doc-publish-ipld-usage = korištenje: .my.doc.<naziv>:publish-ipld <izdavač>
doc-publish-failed = objavljivanje { $path }: { $e }
doc-publish-ipld-failed = objavljivanje IPLD { $path }: { $e }
doc-store-sent = zahtjev za pohranom poslan ({ $id }) → { $publisher }; CID će stići u odgovoru RPC
doc-ipld-store-sent = zahtjev za pohranom IPLD poslan ({ $id }) → { $publisher }; CID će stići u odgovoru RPC
doc-fetch-done = { $cid } dohvaćeno → { $path }.content (nije pokrenuto)
doc-fetch-failed = dohvaćanje { $cid }: { $e }
doc-fetch-usage = korištenje: .my.doc.<naziv>:fetch <cid>
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
help-cmd-logout =   .logout                      odjava

help-msg-echo =   @alias                       prikaži razriješeni DID (nije poslana poruka)
help-msg-send =   @alias[:verb] body           pošalji poruku / RPC akteru
help-msg-fragment =   @alias#fragment[:verb] body  pošalji na pseudonim s eksplicitnim DID fragmentom
help-msg-escape =   \@name                       doslovni @name (bez pretraživanja pseudonima)

help-focus-set =   .use @alias [as @name]       fokusiranje na aktera (mijenja prompt)
help-focus-clear =   .use                         obriši fokus

help-config-get =   .path                        dohvati vrijednost lista ili izlistaj podstablo
help-config-filter =   .path value                  filter pretraživanja (filtriranje po vrijednosti)
help-config-set =   .path: value                 postavi list
help-config-delete =   .path:                       obriši list ili podstablo
help-config-verb =   .path:verb [args]            pokreni lokalni glagol

help-my =   .my                          prikaži cjelokupnu osobnu konfiguraciju
help-aliases =   .my.aliases                  izlistaj pseudonime
help-aliases-set =   .my.aliases.<name>: <did>    dodaj/ažuriraj pseudonim (čist DID, bez #fragmenta)
help-aliases-del =   .my.aliases.<name>:          ukloni pseudonim
help-runtime-discover =   .my.ma:discover          otkrij lokalno izvođenje i stvori pseudonim @ma
help-runtime-claim =   .my.ma:claim             zahtijevaj izvođenje svojim DID-om
help-identity =   .my.identity                 prikaži konfiguraciju identiteta
help-identity-did =   .my.identity.did             prikaži vlastiti DID (samo za čitanje)
help-identity-publish =   .my.identity:publish @pub    objavi vlastiti DID putem usluge izdavača
help-config-path =   .config                      prikaži sve unose .config.*

help-inbox =   .my.inbox                    izlistaj pristiglu poštu (prikaz podstabla)
help-inbox-n =   .my.inbox.N                  prikaži polja unosa N
help-inbox-from =   .my.inbox.N.from             DID pošiljatelja za unos N
help-inbox-reply =   .my.inbox.N:reply [body]     pošalji odgovor (otvori uređivač bez tijela)
help-inbox-open =   .my.inbox.N:open             otvori sadržaj u uređivaču samo za čitanje
help-inbox-del =   .my.inbox.N:                 obriši unos N
help-inbox-delall =   .my.inbox:                   obriši sve unose pristigle pošte
help-inbox-flush =   .my.inbox:flush              ispiši sve unose u terminal
help-inbox-traverse =   .my.inbox.N.sender.<polje>  lijeno prolazi DID dokumentom pošiljatelja

help-doc-edit =   .my.doc.<naziv>:edit           otvori uređivač sa spremljenim sadržajem
help-doc-edit-cid =   .my.doc.<naziv>:edit <cid>     dohvati CID, otvori za pregled
help-doc-eval =   .my.doc.<naziv>:eval           pokreni spremljeni sadržaj redak po redak
help-doc-publish =   .my.doc.<naziv>:publish @pub   spremi kao sirovi blob (svi tipovi)
help-doc-publish-ipld =   .my.doc.<naziv>:publish-ipld @pub  spremi YAML kao strukturirani DAG-CBOR IPLD čvor
help-doc-fetch =   .my.doc.<naziv>:fetch <cid>    uvezi sadržaj CID (bez pokretanja)
help-doc-cid =   .my.doc.<naziv>:cid            prikaži spremljeni CID
help-doc-del =   .my.doc.<naziv>:              obriši dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostupni jezici (postavi s .my.i18n: <code>):
err-lang-not-found = jezik nije pronađen: { $lang }

msg-send-failed = slanje nije uspjelo: { $e }
msg-not-logged-in = nije prijavljen
