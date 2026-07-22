# zion — Italiano
lang-name = Italiano

# ── Pagina di accesso ─────────────────────────────────────────────────────
tab-login = accedi
tab-new-identity = nuova identità
tab-import-profile = importa profilo
label-passphrase = passphrase
label-username = nome utente
label-confirm-passphrase = conferma passphrase
label-did = DID
label-profile-cid = CID del profilo
label-or-file = o file
btn-login = accedi
btn-export = esporta
btn-generate = genera
btn-new-endpoint = nuovo endpoint
btn-import-profile = importa profilo
passphrase-warning = Passphrase persa = identità persa. Non è possibile recuperarla.
import-profile-help = Importa un profilo tramite CID o file. È necessaria la stessa passphrase utilizzata durante la pubblicazione.
import-profile-detected-user = Il profilo appartiene a: { $name }
status-unlocking = sblocco in corso...
status-generating = generazione identità in corso...
status-reading-file = lettura file in corso...
status-fetching-profile = recupero del profilo da IPFS in corso...
status-imported = '{ $name }' importato — passa alla scheda Accedi
status-importing-profile = importazione del profilo in corso...
profile-import-done = profilo importato per '{ $name }' — { $n } chiavi caricate
error-wrong-passphrase = passphrase errata: { $e }
error-identity-not-found = identità '{ $name }' non trovata
error-username-required = il nome utente è obbligatorio
error-passphrase-required = la passphrase è obbligatoria
error-passphrases-no-match = le passphrase non corrispondono
error-profile-source-required = fornire un CID o caricare un file
error-did-required = inserisci il tuo DID
error-profile-fetch = impossibile recuperare il profilo: { $e }
error-profile-no-username = il profilo non contiene un nome utente
error-profile-no-identity = identità '{ $name }' non trovata — importare prima l'identità

# ── Messaggi di sistema del terminale ────────────────────────────────────
msg-logged-in = zion v{ $version } — connesso come { $username }
msg-type-help = Digita .help per ottenere un elenco di comandi.
msg-connecting = connessione a iroh in corso...
msg-iroh-ready = endpoint iroh pronto
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID pubblicato tramite ma locale ({ $url })
msg-ma-connecting-matrix = provo a connetterti alla 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 locale reclamato
msg-local-ma-already-claimed = 間 locale già reclamato
msg-local-ma-claim-failed = impossibile reclamare il 間 locale
msg-identity-not-published = Identità non trovata online — se hai ma installato localmente, esegui '.ma [port]' poi '.my.identity!publish @ma'. Digita '.help/publish' per i dettagli.
msg-blocked = ⊗ bloccato [{ $cap }]: { $from }
msg-focus-cleared = focus cancellato
msg-focusing = focus su { $did } come { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eliminato { $path } ({ $count } voci)
msg-read-only = { $path } è di sola lettura
msg-subtree-set = { $path } è un sottoalbero; impostazione rifiutata
msg-ancestor-leaf = un antenato di { $path } è una foglia; ombreggiatura rifiutata
msg-key-not-found = chiave non trovata: { $path }
msg-no-match = nessuna corrispondenza
msg-link-not-connected = errore nel recupero del collegamento: non connesso
msg-link-fetch-error = errore nel recupero del collegamento: { $e }
msg-link-key-not-found = chiave `{ $key }` non trovata nel documento collegato

# ── Validazione alias ─────────────────────────────────────────────────────
err-alias-name-empty = il nome alias non può essere vuoto
err-alias-has-dot = il nome alias non può contenere '.'
err-alias-has-fragment = il nome alias non può contenere '#'
err-alias-value-fragment = il valore alias può contenere al massimo un frammento DID-URL non vuoto
err-alias-value-path = il valore alias deve essere un DID did:ma:<ipns> o DID-URL (senza percorso)
err-alias-not-did = il valore alias deve iniziare con did:ma:
err-unknown-alias = alias sconosciuto: @{ $name }
err-bare-did = atteso did:ma:<ipns> puro (senza frammento o percorso), ricevuto { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Salva
btn-eval = Esegui
btn-cancel = Annulla
btn-close = Chiudi
btn-reply = Rispondi
btn-publish = Pubblica
btn-publish-ipld = Pubblica IPLD
msg-reply-sent = risposta inviata
msg-reply-failed = invio risposta fallito: { $e }
msg-entity-publish-sent = entità { $name }: pubblicazione inviata
msg-entity-publish-failed = pubblicazione entità fallita: { $e }
msg-kind-publish-failed = pubblicazione tipo fallita: { $e }
msg-field-publish-sent = entità { $name }.{ $field }: pubblicazione inviata
msg-field-publish-failed = pubblicazione campo fallita: { $e }
msg-acl-publish-sent = ACL di esecuzione: pubblicazione inviata
msg-crud-edit-publish-sent = { $path }: pubblicazione inviata
msg-acl-publish-failed = pubblicazione ACL di esecuzione fallita: { $e }
msg-yaml-error = errore YAML: { $e }
msg-editor-saved = { $path }:salva
msg-fetch-review = { $cid } recuperato — controlla prima di eseguire
msg-fetch-failed = recupero { $cid }: { $e }

# ── Verbi — casella di posta ──────────────────────────────────────────────
inbox-empty = la casella di posta è vuota
inbox-entry-not-found = voce { $n } della casella di posta non trovata
inbox-no-message-id = la voce { $n } della casella di posta non ha message_id
inbox-no-verb = nessun verbo `{ $verb }` per la voce { $n } della casella di posta
inbox-filter-no-arg = il filtro richiede un argomento DID o alias
inbox-filter-empty = nessun messaggio da { $did }

# ── Verbi — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = rilevamento fallito a { $url }: { $e }
discover-json-error = rilevamento fallito: JSON non valido da { $url }: { $e }
discover-missing-did = rilevamento fallito: status.json manca il campo obbligatorio `did`
discover-invalid-did = rilevamento fallito: atteso `did` iniziante con did:ma:, ricevuto `{ $did }`
discover-no-endpoint = avviso rilevamento: `endpoint_id` assente in status.json; salvato solo DID
discover-hint-endpoint-not-found = Suggerimento: endpoint non trovato. Verifica che `ma` sia in esecuzione ed esponga /status.json sulla porta 5003.
discover-hint-server-error = Suggerimento: il runtime ha risposto con un errore del server. Controlla i log di `ma` e riprova.
discover-hint-network = Suggerimento: problema di rete/connettività. Avvia `ma`, verifica che localhost:5003 sia raggiungibile e consenti l’accesso HTTP locale nel browser.
discover-hint-generic = Suggerimento: verifica che `ma` e IPFS Desktop siano in esecuzione, poi riprova `.ma`.
discover-success = ma rilevato a { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creato — esegui '.my.identity!publish @ma' per pubblicare la tua identità.
claim-success = Runtime reclamato per { $did }
claim-conflict = Runtime già reclamato da un'altra identità
claim-already-owned = Runtime già reclamato da questa identità
claim-http-failed = reclamo fallito: HTTP { $status }
claim-error = reclamo fallito: { $e }
claim-no-session = non connesso; accedi prima per reclamare il runtime
runtime-no-verb = nessun verbo `{ $verb }` per { $path }

# ── Verbi — controllo accesso ─────────────────────────────────────────────
acl-reset = .my.acl ripristinato (completamente aperto)
acl-persist-error = errore di salvataggio: { $e }
acl-no-verb = nessun verbo `{ $verb }` per .my.acl

# ── Verbi — identità ─────────────────────────────────────────────────────
publish-usage = utilizzo: .my.identity!publish <did-o-alias>
identity-exported = Bundle scaricato come { $filename }
identity-export-failed = Esportazione fallita: { $e }

# ── Verbi — documenti ────────────────────────────────────────────────────
doc-content-empty = { $path }.content è vuoto
doc-save-first = { $path }.content è vuoto — salva prima
doc-missing-name = nome documento mancante
doc-publish-usage = utilizzo: .my.doc.<nome>!publish <editore>
doc-publish-ipld-usage = utilizzo: .my.doc.<nome>!publish-ipld <editore>
doc-publish-failed = pubblicazione { $path }: { $e }
doc-publish-ipld-failed = pubblicazione IPLD { $path }: { $e }
doc-publish-error-detail = pubblicazione fallita [{ $code }]: { $err }
doc-publish-error-hint = Suggerimento: { $hint }
doc-publish-hint-session = accedi di nuovo così ego può accedere alle tue chiavi di identità
doc-publish-hint-target = usa un DID di pubblicatore valido o un alias che risolva a un did:ma:<ipns> senza frammento
doc-publish-hint-network = verifica che runtime ma e IPFS siano raggiungibili e riprova
doc-publish-hint-resolve = verifica che il documento DID del pubblicatore sia pubblicato e contenga un endpoint raggiungibile
doc-publish-hint-acl = chiedi all’operatore del pubblicatore di consentire il tuo DID nell’ACL
doc-publish-hint-runtime = runtime/plugin ha rifiutato la richiesta; esamina il motivo e riprova dopo aver corretto entità/runtime
doc-publish-hint-ipfs = controlla la salute locale di Kubo/IPFS e lo stato del runtime pubblicatore
doc-publish-hint-unknown = consulta i log del runtime per la causa dettagliata e riprova
doc-store-sent = richiesta di archiviazione inviata ({ $id }) → { $publisher }; CID arriverà tramite risposta RPC
doc-ipld-store-sent = richiesta di archiviazione IPLD inviata ({ $id }) → { $publisher }; CID arriverà tramite risposta RPC
doc-fetch-done = { $cid } recuperato → { $path }.content (non eseguito)
doc-fetch-failed = recupero { $cid }: { $e }
doc-fetch-usage = utilizzo: .my.doc.<nome>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid non è impostato
doc-no-verb = nessun verbo `{ $verb }` per { $path }
path-no-verb = nessun verbo `{ $verb }` per { $path }

# ── Testo guida — intestazioni ────────────────────────────────────────────
help-header-zion = ── comandi zion ───────────────────────────────────────────────────────────
help-header-messaging = ── messaggistica ─────────────────────────────────────────────────────────
help-header-config = ── grammatica di configurazione locale ──────────────────────────────────
help-header-common = ── percorsi comuni ───────────────────────────────────────────────────────
help-header-inbox = ── casella di posta ─────────────────────────────────────────────────────
help-header-documents = ── documenti ────────────────────────────────────────────────────────────
help-header-i18n = ── lingua ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entrando nello 間-spazio ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        questo testo
help-cmd-clear =   .clear                       pulisci terminale
help-cmd-panic =   .panic                       ultima risorsa — usa se sei nei guai
help-cmd-history =   .history                     cronologia comandi (duplicati consecutivi uniti)
help-cmd-logout =   .logout                      disconnetti
help-cmd-batch =   .batch                       valuta documento temporaneo in parallelo
help-cmd-batch-sync =   .batch:sync / .batch         valuta documento temporaneo riga per riga

help-msg-echo =   @alias                       mostra DID/DID-URL risolto (nessun messaggio inviato)
help-msg-send =   @alias!msg body / @alias:verb args           invia messaggio / RPC ad attore
help-msg-fragment =   @alias#fragment:verb body  invia ad alias con frammento DID esplicito
help-msg-escape =   \@name                       @name letterale (nessuna ricerca alias)


help-config-get =   .path                        ottieni valore foglia o elenca sottoalbero
help-config-filter =   .path value                  filtro di ricerca (filtra per valore)
help-config-set =   .path: value                 imposta foglia
help-config-delete =   .path:                       elimina foglia o sottoalbero
help-config-verb =   .path!verb [args]            esegui verbo locale

help-my =   .my                          mostra tutta la configurazione personale
help-aliases =   .my.aliases                  elenca alias
help-aliases-set =   .my.aliases.<name>: <did-url>    aggiungi/aggiorna alias (DID o DID-URL)
help-aliases-del =   .my.aliases.<name>:          rimuovi alias
help-runtime-discover =   .ma [port]          scopri runtime locale e crea alias @ma
help-runtime-claim =   .ma [port]             reclama runtime con il tuo DID
help-identity =   .my.identity                 mostra configurazione identità
help-identity-did =   .my.identity.did             mostra DID proprio (sola lettura)
help-identity-publish =   .my.identity!publish @pub    pubblica DID proprio tramite servizio editore
help-identity-export =   .my.identity!export          scarica il proprio bundle di identità
help-config-path =   .config                      mostra tutte le voci .config.*

help-inbox =   .my.inbox                    elenca casella di posta (vista sottoalbero)
help-inbox-n =   .my.inbox.N                  mostra campi della voce N
help-inbox-from =   .my.inbox.N.from             DID mittente per la voce N
help-inbox-reply =   .my.inbox.N!reply [body]     invia risposta (apre editor senza corpo)
help-inbox-open =   .my.inbox.N!open             apri contenuto in editor di sola lettura
help-inbox-del =   .my.inbox.N:                 elimina voce N
help-inbox-delall =   .my.inbox:                   elimina tutte le voci della casella di posta
help-inbox-flush =   .my.inbox!flush              stampa tutte le voci nel terminale
help-inbox-filter =   .my.inbox!filter @who        mostra solo le voci di @who
help-inbox-traverse =   .my.inbox.N.sender.<campo>  attraversa documento DID mittente in modo lazy

help-doc-edit =   .my.doc.<nome>!edit           apri editor con contenuto salvato
help-doc-edit-cid =   .my.doc.<nome>!edit /ipfs/<cid>     recupera CID, apri per revisione
help-doc-eval =   .my.doc.<nome>!eval           esegui contenuto salvato riga per riga
help-doc-publish =   .my.doc.<nome>!publish @pub   salva come blob grezzo (tutti i tipi)
help-doc-publish-ipld =   .my.doc.<nome>!publish-ipld @pub  salva YAML come nodo IPLD DAG-CBOR strutturato
help-doc-fetch =   .my.doc.<nome>!fetch /ipfs/<cid>    importa contenuto CID (senza esecuzione)
help-doc-cid =   .my.doc.<nome>!cid            mostra CID salvato
help-doc-del =   .my.doc.<nome>:              elimina documento

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n memorizza la preferenza della lingua legata alla tua identità.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               elencare i codici delle lingue disponibili

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = La stanza 間 è lo spazio tra identità 間. ma permette a queste identità di trovarsi e comunicare; una volta pubblicata la tua identità, puoi partecipare.
help-ma-command =   .ma [port]                   connetti il runtime ma locale, leggi /status.json e salva .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     pubblica il tuo documento DID perché altri possano risolvere le tue chiavi e il tuo endpoint
help-ma-security = Il confine di fiducia più chiaro è il tuo runtime ma con il tuo IPFS Desktop/Kubo. Un publisher remoto può essere utile, ma in quel caso dipendi dal servizio di qualcun altro.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             come entrare nella stanza 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Quando la tua identità è conosciuta, .enter @ma ti permette di entrare in 間. Trova un mondo, entraci e partecipa da lì.
help-ma-entry-steps = Avvia IPFS Desktop e ma, poi esegui .ma. Pubblica con .my.identity!publish @ma, trova un mondo ed entra con .enter @ma.
help-ma-entry-command =   .enter @ma                  entra in 間 tramite il runtime @ma
help-ma-entry-toggle =   .enter                       attiva o disattiva il focus della stanza; la tua identità resta attiva
help-ma-entry-url =   ?enter=<runtime>             entra dopo il login da un URL condiviso

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lingue disponibili (imposta con .my.i18n: <code>):
err-lang-not-found = lingua non trovata: { $lang }

msg-send-failed = invio fallito: { $e }
msg-not-logged-in = non connesso

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Errore di analisi YAML: { $e }
yaml-not-mapping = YAML deve essere un mapping (coppie chiave: valore); testo semplice e scalari non possono essere archiviati come DAG-CBOR
dagcbor-encode-error = Errore di codifica DAG-CBOR: { $e }
cbor-decode-error = Errore di decodifica CBOR: { $e }
cbor-json-error = Errore da CBOR a JSON: { $e }
yaml-serialise-error = Errore di serializzazione YAML: { $e }
edit-reply-invalid = Risposta di modifica non valida
doc-publish-ipld-error = Pubblicazione IPLD fallita: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Errore salvataggio pulizia posta in arrivo: { $e }
err-config-load = Errore di caricamento configurazione: { $e }
err-lang-persist = Errore di salvataggio della lingua: { $e }
err-history-parse = Errore analisi cronologia: { $e }
err-history-load = Errore di caricamento cronologia: { $e }
err-ipfs-reply-decode = Decodifica risposta IPFS fallita: { $e }
err-edit-cbor = Errore di modifica CBOR: { $e }
err-popup-blocked = Finestra popup bloccata dal browser
status-publishing = pubblicazione

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = errore
rpc-error-detail = errore: { $detail }
msg-new-message = ← [{ $from }] nuovo messaggio — { $count } nella posta in arrivo
msg-chat = { $sender } dice { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } dice { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } entra nella stanza.
room-leave = * { $name } esce dalla stanza.
room-drop  = * { $name } lascia cadere { $thing }.
room-take  = * { $name } raccoglie { $thing }.
err-edit-decode-failed = modifica: decodifica fallita: { $e }
err-edit-fetch-failed = modifica: recupero fallito: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nessuna sessione attiva — impossibile eliminare il profilo
profile-delete-error = eliminazione del profilo fallita: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profilo cifrato e inviato a IPFS; il documento DID sarà aggiornato quando arriva il CID
profile-publish-done = profilo pubblicato — documento DID aggiornato con CID ma.agent
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identità già pubblicata — profilo aggiornato
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = contenuto binario (non visualizzato)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nessuno)
profiles-deleted = profilo { $name } eliminato
profiles-not-found = profilo non trovato: { $name }

# -- Help topics index
help-header-topics = -- argomenti -- digita .help/<topic> per i dettagli
help-topic-msg =   .help/msg                    messaggi
help-topic-ma = .help/ma                     ma-spazio, pubblicazione e ingresso
help-topic-path = .help/path                   grammatica locale del percorso dei punti
help-topic-my =   .help/my                     config personale
help-topic-inbox =   .help/inbox                  posta in arrivo
help-topic-doc =   .help/doc                    documenti
help-topic-actor =   .help/actor                  actor remoto
help-topic-zscheme =   .help/zscheme               espressioni Scheme inline e documentazione
help-topic-url =   .help/url                    aprire zion tramite un link URL
help-topic-i18n = .help/i18n                   preferenza linguistica per la tua identità
help-unknown-topic =   .help/{ $topic }: argomento sconosciuto

# -- Help actor section
help-header-actor = -- attori remoti
help-actor-echo =   @actor                       mostra DID risolto
help-actor-text = @actor[#entity]!msg|!say|!emote body         inviare un messaggio diretto/chat/emotivo
help-actor-ping = @actor:ping                  ping di vitalità
help-actor-entities =   @actor/entities              elenca entità
help-actor-entities-get = @actor/entities/<n>          ottieni il nodo dell'entità
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     modifica entità
help-actor-entities-del = @actor/entities/<n>:         eliminare l'entità
help-actor-config-get =   @actor/config/<key>          leggi valore config
help-actor-config-set =   @actor/config/<key>: val     imposta valore config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              modifica ACL
help-actor-fragment =   @actor#entity                invia al plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC al plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  mantenere le risposte 5 nell'ambiente della sessione
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── parametri URL ───────────────────────────────────────────────────────────
help-url-intro =   Condividi un link che apre zion con il destinatario già compilato:
help-url-msg =   ?msg=<did>                   precompila: @<did>!msg (messaggio testo)
help-url-say =   ?say=<did>                   precompila: @<did>!say (verbo say)
help-url-emote =   ?emote=<did>                 precompila: @<did>!emote (verbo emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             accedere al mondo runtime dopo il login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Il campo viene precompilato ma non inviato — premi Invio per inviare.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pubblicare la tua identità sulla rete
help-header-publish = ── pubblicare identità ──────────────────────────────────────────────────────
help-publish-intro = La pubblicazione rende la tua identità trovabile sulla rete. Altri possono cercare il tuo DID per contattarti.
help-publish-ma = Per pubblicare hai bisogno di ma (runtime locale) installato. Collega ego a IPFS/IPNS per conto tuo.
help-publish-steps = Passi: esegui '.ma [port]' per rilevare il tuo ma locale, poi '.my.identity!publish @ma'.
help-publish-without = Senza pubblicazione, altri non possono raggiungerti — anche se conoscono il tuo DID, non riescono a risolvere il tuo endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = specifica un nome profilo: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Raccolta batch: digita i comandi e termina con .batch
batch-already-collecting = Sto già raccogliendo un lotto: termina prima con .batch
batch-empty = Il batch era vuoto: niente da eseguire
batch-running = Esecuzione batch…
batch-step-timeout = il passaggio batch è scaduto

batch-done = Batch completato in { $secs }s — { $steps } passi
batch-done-error = Batch completato con errori in { $secs }s — { $steps } passi
msg-timeout = Messaggio scaduto (nessuna risposta in 60s)
err-unknown-command = comando sconosciuto: { $path }
err-read-only-path = { $path } è di sola lettura
help-cmd-batch-async =   .batch:async / .batch        valuta documento temporaneo in parallelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Recupero di CID { $cid } fallito: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID non valido: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Avviso: La tua chiave privata IPNS verrà inviata a questo ambiente di esecuzione per la pubblicazione dell'identità. Usa solo un ambiente di esecuzione di cui ti fidi completamente.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme valuta le espressioni Scheme inserite nei comandi zion e innesta il risultato nella riga prima dell’invio.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    esempio inline; invia "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             le definizioni persistono per la sessione di login corrente
help-zscheme-doc = Documentazione: https://github.com/bahner/rust-ma-zscheme
