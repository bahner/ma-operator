# zion — Română
lang-name = Română

# ── Pagina de autentificare ───────────────────────────────────────────────
tab-login = autentificare
tab-new-identity = identitate nouă
tab-import = importare
label-passphrase = frază de acces
label-username = nume de utilizator
label-confirm-passphrase = confirmați fraza de acces
btn-login = autentificare
btn-export = exportare
btn-generate = generare
passphrase-warning = Fraza de acces pierdută = identitate pierdută. Recuperarea nu este posibilă.
import-help = Alegeți un fișier .zion.json exportat. Pachetul rămâne criptat.
status-unlocking = deblocare...
status-generating = generare identitate...
status-reading-file = citire fișier...
status-imported = '{ $name }' importat — treceți la fila Autentificare
error-wrong-passphrase = frază de acces incorectă: { $e }
error-identity-not-found = identitatea '{ $name }' nu a fost găsită
error-username-required = numele de utilizator este obligatoriu
error-passphrase-required = fraza de acces este obligatorie
error-passphrases-no-match = frazele de acces nu se potrivesc

# ── Mesaje de sistem ale terminalului ────────────────────────────────────
msg-logged-in = zion v{ $version } — autentificat ca { $username }
msg-type-help = Tastați .help pentru o listă de comenzi.
msg-connecting = conectare la iroh...
msg-iroh-ready = punct final iroh pregătit
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Identitate negăsită online — rulează '.my.identity:publish @ma' pentru a deveni accesibil.
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
err-alias-value-fragment = valoarea aliasului trebuie să fie un did:ma:<ipns> pur (fără fragment)
err-alias-value-path = valoarea aliasului trebuie să fie un did:ma:<ipns> pur (fără cale)
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

# ── Verbe — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = descoperire eșuată la { $url }: { $e }
discover-json-error = descoperire eșuată: JSON invalid de la { $url }: { $e }
discover-missing-did = descoperire eșuată: status.json lipsește câmpul obligatoriu `did`
discover-invalid-did = descoperire eșuată: așteptat `did` începând cu did:ma:, primit `{ $did }`
discover-no-endpoint = avertisment descoperire: `endpoint_id` absent în status.json; salvat doar DID
discover-success = ma descoperit la { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creat — publicați prin: .my.identity:publish @ma
claim-success = Runtime revendicat pentru { $did }
claim-conflict = Runtime deja revendicat de o altă identitate
claim-http-failed = revendicare eșuată: HTTP { $status }
claim-error = revendicare eșuată: { $e }
claim-no-session = neautentificat; autentificați-vă mai întâi pentru a revendica runtime
runtime-no-verb = niciun verb `{ $verb }` pentru { $path }

# ── Verbe — control acces ─────────────────────────────────────────────────
acl-reset = .my.acl resetat (complet deschis)
acl-persist-error = eroare la salvare: { $e }
acl-no-verb = niciun verb `{ $verb }` pentru .my.acl

# ── Verbe — identitate ────────────────────────────────────────────────────
publish-usage = utilizare: .my.identity:publish <did-sau-alias>

# ── Verbe — documente ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content este gol
doc-save-first = { $path }.content este gol — salvați mai întâi
doc-missing-name = lipsește numele documentului
doc-publish-usage = utilizare: .my.doc.<nume>:publish <editor>
doc-publish-ipld-usage = utilizare: .my.doc.<nume>:publish-ipld <editor>
doc-publish-failed = publicare { $path }: { $e }
doc-publish-ipld-failed = publicare IPLD { $path }: { $e }
doc-store-sent = cerere de stocare trimisă ({ $id }) → { $publisher }; CID va sosi prin răspuns RPC
doc-ipld-store-sent = cerere de stocare IPLD trimisă ({ $id }) → { $publisher }; CID va sosi prin răspuns RPC
doc-fetch-done = { $cid } obținut → { $path }.content (neexecutat)
doc-fetch-failed = obținere { $cid }: { $e }
doc-fetch-usage = utilizare: .my.doc.<nume>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nu este setat
doc-no-verb = niciun verb `{ $verb }` pentru { $path }
path-no-verb = niciun verb `{ $verb }` pentru { $path }

# ── Text ajutor — anteturi ────────────────────────────────────────────────
help-header-zion = ── comenzi zion ───────────────────────────────────────────────────────────
help-header-messaging = ── mesagerie ─────────────────────────────────────────────────────────────
help-header-focus = ── modul focus ───────────────────────────────────────────────────────────
help-header-config = ── gramatică de configurare locală ────────────────────────────────────
help-header-common = ── căi comune ────────────────────────────────────────────────────────────
help-header-inbox = ── căsuță poștală ────────────────────────────────────────────────────────
help-header-documents = ── documente ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        acest text
help-cmd-clear =   .clear                       șterge terminalul
help-cmd-panic =   .panic                       ultima soluție — folosiți dacă aveți probleme
help-cmd-history =   .history                     istoricul comenzilor (duplicate consecutive îmbinate)
help-cmd-logout =   .logout                      deconectare

help-msg-echo =   @alias                       afișează DID rezolvat (niciun mesaj trimis)
help-msg-send =   @alias[:verb] body           trimite mesaj / RPC actorului
help-msg-fragment =   @alias#fragment[:verb] body  trimite la alias cu fragment DID explicit
help-msg-escape =   \@name                       @name literal (fără căutare alias)

help-focus-set =   .use @alias [as @name]       focalizare pe actor (modifică promptul)
help-focus-clear =   .use                         șterge focus

help-config-get =   .path                        obține valoarea frunzei sau listează subarborele
help-config-filter =   .path value                  filtru de căutare (filtrare după valoare)
help-config-set =   .path: value                 setează frunza
help-config-delete =   .path:                       șterge frunza sau subarborele
help-config-verb =   .path:verb [args]            execută verb local

help-my =   .my                          afișează toată configurația personală
help-aliases =   .my.aliases                  listează aliasuri
help-aliases-set =   .my.aliases.<name>: <did>    adaugă/actualizează alias (DID pur, fără #fragment)
help-aliases-del =   .my.aliases.<name>:          elimină alias
help-runtime-discover =   .my.ma:discover          descoperă runtime local și creează alias @ma
help-runtime-claim =   .my.ma:claim             revendică runtime cu DID-ul tău
help-identity =   .my.identity                 afișează configurația identității
help-identity-did =   .my.identity.did             afișează DID propriu (doar citire)
help-identity-publish =   .my.identity:publish @pub    publică DID propriu prin serviciul editor
help-config-path =   .config                      afișează toate intrările .config.*

help-inbox =   .my.inbox                    listează căsuța poștală (vedere subarbore)
help-inbox-n =   .my.inbox.N                  afișează câmpurile intrării N
help-inbox-from =   .my.inbox.N.from             DID expeditor pentru intrarea N
help-inbox-reply =   .my.inbox.N:reply [body]     trimite răspuns (deschide editor fără corp)
help-inbox-open =   .my.inbox.N:open             deschide conținutul în editor doar citire
help-inbox-del =   .my.inbox.N:                 șterge intrarea N
help-inbox-delall =   .my.inbox:                   șterge toate intrările din căsuța poștală
help-inbox-flush =   .my.inbox:flush              afișează toate intrările în terminal
help-inbox-traverse =   .my.inbox.N.sender.<câmp>   parcurge documentul DID al expeditorului leneș

help-doc-edit =   .my.doc.<nume>:edit           deschide editor cu conținut salvat
help-doc-edit-cid =   .my.doc.<nume>:edit <cid>     obține CID, deschide pentru revizuire
help-doc-eval =   .my.doc.<nume>:eval           execută conținut salvat linie cu linie
help-doc-publish =   .my.doc.<nume>:publish @pub   salvează ca blob brut (toate tipurile)
help-doc-publish-ipld =   .my.doc.<nume>:publish-ipld @pub  salvează YAML ca nod DAG-CBOR IPLD structurat
help-doc-fetch =   .my.doc.<nume>:fetch <cid>    importă conținut CID (fără execuție)
help-doc-cid =   .my.doc.<nume>:cid            afișează CID salvat
help-doc-del =   .my.doc.<nume>:              șterge document

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
yaml-serialize-error = Eroare de serializare YAML: { $e }
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
err-edit-decode-failed = editare: eroare la decodare: { $e }
err-edit-fetch-failed = editare: eroare la încărcare: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nicio sesiune activă — profilul nu poate fi șters
profile-delete-error = ștergerea profilului a eșuat: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (niciunul)
profiles-deleted = profilul { $name } a fost șters
profiles-not-found = profilul nu a fost găsit: { $name }

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
