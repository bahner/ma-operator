# zion — Română
lang-name = Română
label-nick = poreclă
new-identity-nick-help = Alegeți o poreclă pentru ma-space. Este doar o poreclă și o puteți schimba oricând.
error-nick-required = porecla este obligatorie
error-nick-invalid = porecla nu trebuie să conțină spații sau @

# ── Pagina de autentificare ───────────────────────────────────────────────
tab-login = autentificare
tab-new-identity = identitate nouă
tab-import-profile = importare profil
label-passphrase = frază de acces
label-username = nume de utilizator
label-confirm-passphrase = confirmați fraza de acces
label-did = DID
label-profile-cid = CID profil
label-or-file = sau fișier
btn-login = autentificare
btn-export = exportare
btn-generate = generare
btn-new-endpoint = punct nou de acces
btn-import-profile = importare profil
passphrase-warning = Fraza de acces pierdută = identitate pierdută. Recuperarea nu este posibilă.
import-profile-help = Importați un profil prin CID sau fișier. Aveți nevoie de aceeași frază de acces utilizată la publicare.
import-profile-detected-user = Profilul aparține lui: { $name }
status-unlocking = deblocare...
status-generating = generare identitate...
status-reading-file = citire fișier...
status-fetching-profile = preluare profil din IPFS...
status-imported = '{ $name }' importat — treceți la fila Autentificare
status-importing-profile = import profil în curs...
profile-import-done = profil importat pentru '{ $name }' — { $n } chei încărcate
error-wrong-passphrase = frază de acces incorectă: { $e }
error-identity-not-found = identitatea '{ $name }' nu a fost găsită
error-username-required = numele de utilizator este obligatoriu
error-passphrase-required = fraza de acces este obligatorie
error-passphrases-no-match = frazele de acces nu se potrivesc
error-profile-source-required = furnizați un CID sau încărcați un fișier
error-did-required = introduceți DID-ul dvs.
error-profile-fetch = nu s-a putut prelua profilul: { $e }
error-profile-no-username = profilul nu conține un nume de utilizator
error-profile-no-identity = identitatea '{ $name }' nu a fost găsită — importați mai întâi identitatea

# ── Mesaje de sistem ale terminalului ────────────────────────────────────
msg-logged-in = zion v{ $version } — autentificat ca { $username }
msg-type-help = Tastați .help pentru o listă de comenzi.
msg-getting-started = Încercați: say Hello world, look, .help sau help.
msg-connecting = conectare la iroh...
msg-iroh-ready = punct final iroh pregătit
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicat prin ma local ({ $url })
msg-identity-publication-propagating = Publicarea identității încă se propagă; intrarea este întârziată: { $e }
msg-identity-first-publish = Se publică identitatea pentru prima dată. Acest lucru poate dura până la { $seconds } secunde.
msg-ma-connecting-matrix = încercăm să te conectăm la 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 local revendicat
msg-local-ma-already-claimed = 間 local deja revendicat
msg-local-ma-claim-failed = nu s-a putut revendica 間 local
msg-identity-not-published = Identitate negăsită online — dacă ai ma instalat local, rulează '.ma [port]' apoi '.my.identity!publish @ma'. Tastează '.help/publish' pentru detalii.
msg-blocked = ⊗ blocat [{ $cap }]: { $from }
msg-focus-cleared = focus șters
msg-focusing = focalizare pe { $did } ca { $prompt }
msg-set = { $path }: { $value }
msg-deleted = șters { $path } ({ $count } intrări)
msg-read-only = { $path } este doar citire
msg-subtree-set = { $path } este un subarbore; setare refuzată
msg-ancestor-leaf = un strămoș al lui { $path } este o frunză; umbrire refuzată
msg-key-not-found = cheie negăsită: { $path }
msg-no-match = nicio potrivire
msg-link-not-connected = eroare la obținerea legăturii: neconectat
msg-link-fetch-error = eroare la obținerea legăturii: { $e }
msg-link-key-not-found = cheia `{ $key }` nu a fost găsită în documentul legat

# ── Validarea aliasurilor ─────────────────────────────────────────────────
err-alias-name-empty = numele aliasului nu poate fi gol
err-alias-has-dot = numele aliasului nu poate conține '.'
err-alias-has-fragment = numele aliasului nu poate conține '#'
err-alias-value-fragment = valoarea aliasului poate conține cel mult un fragment DID-URL nevid
err-alias-value-path = valoarea aliasului trebuie să fie un DID did:ma:<ipns> sau DID-URL (fără cale)
err-alias-not-did = valoarea aliasului trebuie să înceapă cu did:ma:
err-unknown-alias = alias necunoscut: @{ $name }
err-bare-did = așteptat did:ma:<ipns> pur (fără fragment sau cale), primit { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Salvare
btn-eval = Executare
btn-cancel = Anulare
btn-close = Închidere
btn-reply = Răspuns
btn-publish = Publicare
btn-publish-ipld = Publicare IPLD
msg-reply-sent = răspuns trimis
msg-reply-failed = trimiterea răspunsului a eșuat: { $e }
msg-entity-publish-sent = entitatea { $name }: publicare trimisă
msg-entity-publish-failed = publicarea entității a eșuat: { $e }
msg-kind-publish-failed = publicarea tipului a eșuat: { $e }
msg-field-publish-sent = entitatea { $name }.{ $field }: publicare trimisă
msg-field-publish-failed = publicarea câmpului a eșuat: { $e }
msg-acl-publish-sent = ACL runtime: publicare trimisă
msg-crud-edit-publish-sent = { $path }: publicare trimisă
msg-acl-publish-failed = publicarea ACL runtime a eșuat: { $e }
msg-yaml-error = eroare YAML: { $e }
msg-editor-saved = { $path }:salvare
msg-fetch-review = { $cid } obținut — verificați înainte de executare
msg-fetch-failed = obținere { $cid }: { $e }

# ── Verbe — căsuță poștală ────────────────────────────────────────────────
inbox-empty = căsuța poștală este goală
inbox-entry-not-found = intrarea { $n } din căsuța poștală nu a fost găsită
inbox-no-message-id = intrarea { $n } din căsuța poștală nu are message_id
inbox-no-verb = niciun verb `{ $verb }` pentru intrarea { $n } din căsuța poștală
inbox-filter-no-arg = filtrul necesită un argument DID sau alias
inbox-filter-empty = niciun mesaj de la { $did }

# ── Verbe — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = descoperire eșuată la { $url }: { $e }
discover-json-error = descoperire eșuată: JSON invalid de la { $url }: { $e }
discover-missing-did = descoperire eșuată: status.json lipsește câmpul obligatoriu `did`
discover-invalid-did = descoperire eșuată: așteptat `did` începând cu did:ma:, primit `{ $did }`
discover-no-endpoint = avertisment descoperire: `endpoint_id` absent în status.json; salvat doar DID
discover-hint-endpoint-not-found = Indiciu: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Indiciu: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Indiciu: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Indiciu: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma descoperit la { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creat — rulează '.my.identity!publish @ma' pentru a-ți publica identitatea.
claim-success = Runtime revendicat pentru { $did }
claim-conflict = Runtime deja revendicat de o altă identitate
claim-already-owned = Runtime deja revendicat de această identitate
claim-http-failed = revendicare eșuată: HTTP { $status }
claim-error = revendicare eșuată: { $e }
claim-no-session = neautentificat; autentificați-vă mai întâi pentru a revendica runtime
runtime-no-verb = niciun verb `{ $verb }` pentru { $path }

# ── Verbe — control acces ─────────────────────────────────────────────────
acl-reset = .my.acl resetat (complet deschis)
acl-persist-error = eroare la salvare: { $e }
acl-no-verb = niciun verb `{ $verb }` pentru .my.acl

# ── Verbe — identitate ────────────────────────────────────────────────────
publish-usage = utilizare: .my.identity!publish <did-sau-alias>
identity-exported = Pachetul a fost descărcat ca { $filename }
identity-export-failed = Exportul a eșuat: { $e }

# ── Verbe — documente ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content este gol
doc-save-first = { $path }.content este gol — salvați mai întâi
doc-missing-name = lipsește numele documentului
doc-publish-usage = utilizare: .my.doc.<nume>!publish <editor>
doc-publish-ipld-usage = utilizare: .my.doc.<nume>!publish-ipld <editor>
doc-publish-failed = publicare { $path }: { $e }
doc-publish-ipld-failed = publicare IPLD { $path }: { $e }
doc-publish-error-detail = publicare eșuată [{ $code }]: { $err }
doc-publish-error-hint = Indiciu: { $hint }
doc-publish-hint-session = autentificați-vă din nou pentru ca ego să vă poată accesa cheile de identitate
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verificați că documentul DID al editorului este publicat și conține un punct final accesibil
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin-ul a respins cererea; inspectați motivul și reîncercați după repararea entității/execuției
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspectați jurnalele de rulare pentru cauze detaliate și reîncercați
doc-store-sent = cerere de stocare trimisă ({ $id }) → { $publisher }; CID va sosi prin răspuns RPC
doc-ipld-store-sent = cerere de stocare IPLD trimisă ({ $id }) → { $publisher }; CID va sosi prin răspuns RPC
doc-fetch-done = { $cid } obținut → { $path }.content (neexecutat)
doc-fetch-failed = obținere { $cid }: { $e }
doc-fetch-usage = utilizare: .my.doc.<nume>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nu este setat
doc-no-verb = niciun verb `{ $verb }` pentru { $path }
path-no-verb = niciun verb `{ $verb }` pentru { $path }

# ── Text ajutor — anteturi ────────────────────────────────────────────────
help-header-zion = ── comenzi zion ───────────────────────────────────────────────────────────
help-header-messaging = ── mesagerie ─────────────────────────────────────────────────────────────
help-header-config = ── gramatică de configurare locală ────────────────────────────────────
help-header-common = ── căi comune ────────────────────────────────────────────────────────────
help-header-inbox = ── căsuță poștală ────────────────────────────────────────────────────────
help-header-documents = ── documente ────────────────────────────────────────────────────────────
help-header-i18n = ── limbaj ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── intrând în 間-spațiu ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        acest text
help-cmd-clear =   .clear                       șterge terminalul
help-cmd-panic =   .panic                       ultima soluție — folosiți dacă aveți probleme
help-cmd-history =   .history                     istoricul comenzilor (duplicate consecutive îmbinate)
help-cmd-logout =   .logout                      deconectare
help-cmd-batch =   .batch                       evaluează documentul temporar în paralel
help-cmd-batch-sync =   .batch:sync / .batch         evaluează documentul temporar linie cu linie

help-msg-echo =   @alias                       afișează DID/DID-URL rezolvat (nu se trimite mesaj)
help-msg-send =   @alias!msg body / @alias:verb args           trimite mesaj / RPC actorului
help-msg-fragment =   @alias#fragment:verb body  trimite la alias cu fragment DID explicit
help-msg-escape =   \@name                       @name literal (fără căutare alias)


help-config-get =   .path                        obține valoarea frunzei sau listează subarborele
help-config-filter =   .path value                  filtru de căutare (filtrare după valoare)
help-config-set =   .path: value                 setează frunza
help-config-delete =   .path:                       șterge frunza sau subarborele
help-config-verb =   .path!verb [args]            execută verb local

help-my =   .my                          afișează toată configurația personală
help-aliases =   .my.aliases                  listează aliasuri
help-aliases-set =   .my.aliases.<name>: <did-url>    adaugă/actualizează alias (DID sau DID-URL)
help-aliases-del =   .my.aliases.<name>:          elimină alias
help-runtime-discover =   .ma [port]          descoperă runtime local și creează alias @ma
help-runtime-claim =   .ma [port]             revendică runtime cu DID-ul tău
help-identity =   .my.identity                 afișează configurația identității
help-identity-did =   .my.identity.did             afișează DID propriu (doar citire)
help-identity-publish =   .my.identity!publish @pub    publică DID propriu prin serviciul editor
help-identity-export =   .my.identity!export          descarcă propriul pachet de identitate
help-config-path =   .config                      afișează toate intrările .config.*

help-inbox =   .my.inbox                    listează căsuța poștală (vedere subarbore)
help-inbox-n =   .my.inbox.N                  afișează câmpurile intrării N
help-inbox-from =   .my.inbox.N.from             DID expeditor pentru intrarea N
help-inbox-reply =   .my.inbox.N!reply [body]     trimite răspuns (deschide editor fără corp)
help-inbox-open =   .my.inbox.N!open             deschide conținutul în editor doar citire
help-inbox-del =   .my.inbox.N:                 șterge intrarea N
help-inbox-delall =   .my.inbox:                   șterge toate intrările din căsuța poștală
help-inbox-flush =   .my.inbox!flush              afișează toate intrările în terminal
help-inbox-filter =   .my.inbox!filter @who        arată doar înregistrările de la @who
help-inbox-traverse =   .my.inbox.N.sender.<câmp>   parcurge documentul DID al expeditorului leneș

help-doc-edit =   .my.doc.<nume>!edit           deschide editor cu conținut salvat
help-doc-edit-cid =   .my.doc.<nume>!edit /ipfs/<cid>     obține CID, deschide pentru revizuire
help-doc-eval =   .my.doc.<nume>!eval           execută conținut salvat linie cu linie
help-doc-publish =   .my.doc.<nume>!publish @pub   salvează ca blob brut (toate tipurile)
help-doc-publish-ipld =   .my.doc.<nume>!publish-ipld @pub  salvează YAML ca nod DAG-CBOR IPLD structurat
help-doc-fetch =   .my.doc.<nume>!fetch /ipfs/<cid>    importă conținut CID (fără execuție)
help-doc-cid =   .my.doc.<nume>!cid            afișează CID salvat
help-doc-del =   .my.doc.<nume>:              șterge document

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n stochează preferința de limbă legată de identitatea dvs.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               enumerați codurile de limbă disponibile

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Camera 間 este spațiul dintre identitățile 間. ma le permite acestor identități să se găsească și să comunice; după ce identitatea ta este publicată, poți participa.
help-ma-command =   .ma [port]                   conectează-te la runtime-ul ma local, citește /status.json și salvează .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publică documentul tău DID pentru ca alții să poată rezolva cheile și endpoint-ul tău
help-ma-security = Cea mai clară limită de încredere este propriul tău runtime ma cu propriul IPFS Desktop/Kubo. Un publisher la distanță poate fi util, dar atunci te bazezi pe serviciul altcuiva.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             cum intri în camera 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Când identitatea ta este cunoscută, .enter @ma te lasă să intri în 間. Găsește o lume, intră în ea și participă de acolo.
help-ma-entry-steps = Pornește IPFS Desktop și ma, apoi rulează .ma. Publică cu .my.identity!publish @ma, găsește o lume și intră cu .enter @ma.
help-ma-entry-command =   .enter @ma                  intră în 間 prin runtime-ul @ma
help-ma-entry-toggle =   .enter                       activează sau dezactivează focalizarea camerei; identitatea ta rămâne activă
help-ma-entry-url =   ?enter=<runtime>             intră după autentificare dintr-un URL partajat

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Limbi disponibile (setați cu .my.i18n: <code>):
err-lang-not-found = limba nu a fost găsită: { $lang }

msg-send-failed = trimiterea a eşuat: { $e }
msg-not-logged-in = neconectat

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Eroare de analiză YAML: { $e }
yaml-not-mapping = YAML trebuie să fie un mapping (perechi cheie: valoare); textul simplu și scalarii nu pot fi stocați ca DAG-CBOR
dagcbor-encode-error = Eroare de codificare DAG-CBOR: { $e }
cbor-decode-error = Eroare de decodificare CBOR: { $e }
cbor-json-error = Eroare CBOR la JSON: { $e }
yaml-serialise-error = Eroare de serializare YAML: { $e }
edit-reply-invalid = Răspuns de editare invalid
doc-publish-ipld-error = Publicarea IPLD a eșuat: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Eroare la salvarea curățării căsuței de intrare: { $e }
err-config-load = Eroare la încărcarea configurației: { $e }
err-lang-persist = Eroare la salvarea limbii: { $e }
err-history-parse = Eroare de analiză a istoricului: { $e }
err-history-load = Eroare la încărcarea istoricului: { $e }
err-ipfs-reply-decode = Eșec la decodificarea răspunsului IPFS: { $e }
err-edit-cbor = Eroare de editare CBOR: { $e }
err-popup-blocked = Fereastra pop-up a fost blocată de browser
status-publishing = publicare

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = eroare
rpc-error-detail = eroare: { $detail }
msg-new-message = ← [{ $from }] mesaj nou — { $count } în inbox
msg-chat = { $sender } spune { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } spune { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } intră în cameră.
room-leave = * { $name } iese din cameră.
room-drop  = * { $name } scapă { $thing }.
room-take  = * { $name } ridică { $thing }.
err-edit-decode-failed = editare: eroare la decodare: { $e }
err-edit-fetch-failed = editare: eroare la încărcare: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nicio sesiune activă — profilul nu poate fi șters
profile-delete-error = ștergerea profilului a eșuat: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil criptat și trimis la IPFS; documentul DID va fi actualizat când sosește CID
profile-publish-done = profil publicat — document DID actualizat cu CID ma.agent
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identitate deja publicată — profil actualizat
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = conținut binar (nu este afișat)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (niciunul)
profiles-deleted = profilul { $name } a fost șters
profiles-not-found = profilul nu a fost găsit: { $name }

# -- Help topics index
help-header-topics = -- subiecte -- tastați .help/<topic> pentru detalii
help-topic-msg =   .help/msg                    mesaje
help-topic-ma = .help/ma                     ma-spațiu, publicare și intrare
help-topic-path = .help/path                   gramatica locală a căii punctelor
help-topic-my =   .help/my                     config personal
help-topic-inbox =   .help/inbox                  mesaje primite
help-topic-doc =   .help/doc                    documente
help-topic-actor =   .help/actor                  actor la distanță
help-topic-zscheme =   .help/zscheme               expresii Scheme inline și documentație
help-unknown-topic =   .help/{ $topic }: subiect necunoscut

# -- Help actor section
help-header-actor = -- actori la distanță
help-actor-echo =   @actor                       afișează DID rezolvat
help-actor-text = @actor[#entity]!msg|!say|!emote body         trimite mesaj direct/chat/emote
help-actor-ping = @actor:ping                  ping de viață
help-actor-entities =   @actor/entities              listează entitățile
help-actor-entities-get = @actor/entities/<n>          obține nodul de entitate
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     editează entitatea
help-actor-entities-del = @actor/entities/<n>:         șterge entitatea
help-actor-config-get =   @actor/config/<key>          obține valoarea config
help-actor-config-set =   @actor/config/<key>: val     setează valoarea config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              editează ACL
help-actor-fragment =   @actor#entity                trimite la plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC la plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  păstrați răspunsurile 5 în mediul de sesiune
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    deschiderea zion printr-un link URL
help-topic-i18n = .help/i18n                   preferința de limbă pentru identitatea dvs
help-header-url = ── parametri URL ────────────────────────────────────────────────────────────────
help-url-intro =   Distribuie un link care deschide zion cu un destinatar precompletat:
help-url-msg =   ?msg=<did>                   precompletează: @<did>!msg (mesaj simplu)
help-url-say =   ?say=<did>                   precompletează: @<did>!say (verb say)
help-url-emote =   ?emote=<did>                 precompletează: @<did>!emote (verb emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             intrați în lumea de rulare după conectare
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Câmpul este precompletat dar nu trimis — apasă Enter pentru a trimite.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publicarea identității în rețea
help-header-publish = ── publicarea identității ───────────────────────────────────────────────────
help-publish-intro = Publicarea face identitatea ta găsibilă în rețea. Alții pot căuta DID-ul tău pentru a te contacta.
help-publish-ma = Pentru a publica, ai nevoie de ma (runtime local) instalat. Face legătura între ego și IPFS/IPNS în numele tău.
help-publish-steps = Pași: rulează '.ma [port]' pentru a detecta ma-ul local, apoi '.my.identity!publish @ma'.
help-publish-without = Fără publicare, alții nu te pot contacta — chiar dacă îți cunosc DID-ul, nu pot rezolva endpoint-ul tău.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = specificați un nume de profil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Colectarea lotului — tastați comenzi, se încheie cu .batch
batch-already-collecting = Se colectează deja un lot - terminați cu .batch mai întâi
batch-empty = Lotul era gol - nimic de rulat
batch-running = Rulez batch…
batch-step-timeout = pasul lotului a expirat

batch-done = Batch terminat în { $secs }s — { $steps } pași
batch-done-error = Batch terminat cu erori în { $secs }s — { $steps } pași
msg-timeout = Mesaj expirat (niciun răspuns în 60s)
err-unknown-command = comandă necunoscută: { $path }
err-read-only-path = { $path } este doar pentru citire
help-cmd-batch-async =   .batch:async / .batch        evaluează documentul temporar în paralel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Preluarea CID { $cid } a eșuat: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID invalid: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Avertisment: Cheia ta privată IPNS va fi trimisă la acest mediu de execuție pentru publicarea identității. Folosește doar un mediu de execuție în care ai deplină încredere.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme evaluează expresiile Scheme incluse în comenzile zion și inserează rezultatul în linie înainte de trimitere.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    exemplu inline; trimite "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definițiile persistă în sesiunea curentă de autentificare
help-zscheme-doc = Documentație: https://github.com/bahner/rust-ma-zscheme
