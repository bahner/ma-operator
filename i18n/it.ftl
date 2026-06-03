# zion — Italiano
lang-name = Italiano

# ── Pagina di accesso ─────────────────────────────────────────────────────
tab-login = accedi
tab-new-identity = nuova identità
tab-import = importa
label-passphrase = passphrase
label-username = nome utente
label-confirm-passphrase = conferma passphrase
btn-login = accedi
btn-export = esporta
btn-generate = genera
passphrase-warning = Passphrase persa = identità persa. Non è possibile recuperarla.
import-help = Seleziona un file .zion.json esportato. Il pacchetto rimane cifrato.
status-unlocking = sblocco in corso...
status-generating = generazione identità in corso...
status-reading-file = lettura file in corso...
status-imported = '{ $name }' importato — passa alla scheda Accedi
error-wrong-passphrase = passphrase errata: { $e }
error-identity-not-found = identità '{ $name }' non trovata
error-username-required = il nome utente è obbligatorio
error-passphrase-required = la passphrase è obbligatoria
error-passphrases-no-match = le passphrase non corrispondono

# ── Messaggi di sistema del terminale ────────────────────────────────────
msg-logged-in = zion v{ $version } — connesso come { $username }
msg-type-help = Digita .help per ottenere un elenco di comandi.
msg-connecting = connessione a iroh in corso...
msg-iroh-ready = endpoint iroh pronto
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Identità non trovata online — esegui '.my.identity:publish @ma' per essere raggiungibile.
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
err-alias-value-fragment = il valore alias deve essere un did:ma:<ipns> puro (senza frammento)
err-alias-value-path = il valore alias deve essere un did:ma:<ipns> puro (senza percorso)
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

# ── Verbi — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = rilevamento fallito a { $url }: { $e }
discover-json-error = rilevamento fallito: JSON non valido da { $url }: { $e }
discover-missing-did = rilevamento fallito: status.json manca il campo obbligatorio `did`
discover-invalid-did = rilevamento fallito: atteso `did` iniziante con did:ma:, ricevuto `{ $did }`
discover-no-endpoint = avviso rilevamento: `endpoint_id` assente in status.json; salvato solo DID
discover-success = ma rilevato a { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creato — pubblica con: .my.identity:publish @ma
claim-success = Runtime reclamato per { $did }
claim-conflict = Runtime già reclamato da un'altra identità
claim-http-failed = reclamo fallito: HTTP { $status }
claim-error = reclamo fallito: { $e }
claim-no-session = non connesso; accedi prima per reclamare il runtime
runtime-no-verb = nessun verbo `{ $verb }` per { $path }

# ── Verbi — controllo accesso ─────────────────────────────────────────────
acl-reset = .my.acl ripristinato (completamente aperto)
acl-persist-error = errore di salvataggio: { $e }
acl-no-verb = nessun verbo `{ $verb }` per .my.acl

# ── Verbi — identità ─────────────────────────────────────────────────────
publish-usage = utilizzo: .my.identity:publish <did-o-alias>

# ── Verbi — documenti ────────────────────────────────────────────────────
doc-content-empty = { $path }.content è vuoto
doc-save-first = { $path }.content è vuoto — salva prima
doc-missing-name = nome documento mancante
doc-publish-usage = utilizzo: .my.doc.<nome>:publish <editore>
doc-publish-ipld-usage = utilizzo: .my.doc.<nome>:publish-ipld <editore>
doc-publish-failed = pubblicazione { $path }: { $e }
doc-publish-ipld-failed = pubblicazione IPLD { $path }: { $e }
doc-store-sent = richiesta di archiviazione inviata ({ $id }) → { $publisher }; CID arriverà tramite risposta RPC
doc-ipld-store-sent = richiesta di archiviazione IPLD inviata ({ $id }) → { $publisher }; CID arriverà tramite risposta RPC
doc-fetch-done = { $cid } recuperato → { $path }.content (non eseguito)
doc-fetch-failed = recupero { $cid }: { $e }
doc-fetch-usage = utilizzo: .my.doc.<nome>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid non è impostato
doc-no-verb = nessun verbo `{ $verb }` per { $path }
path-no-verb = nessun verbo `{ $verb }` per { $path }

# ── Testo guida — intestazioni ────────────────────────────────────────────
help-header-zion = ── comandi zion ───────────────────────────────────────────────────────────
help-header-messaging = ── messaggistica ─────────────────────────────────────────────────────────
help-header-focus = ── modalità focus ────────────────────────────────────────────────────────
help-header-config = ── grammatica di configurazione locale ──────────────────────────────────
help-header-common = ── percorsi comuni ───────────────────────────────────────────────────────
help-header-inbox = ── casella di posta ─────────────────────────────────────────────────────
help-header-documents = ── documenti ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        questo testo
help-cmd-clear =   .clear                       pulisci terminale
help-cmd-panic =   .panic                       ultima risorsa — usa se sei nei guai
help-cmd-history =   .history                     cronologia comandi (duplicati consecutivi uniti)
help-cmd-logout =   .logout                      disconnetti

help-msg-echo =   @alias                       mostra DID risolto (nessun messaggio inviato)
help-msg-send =   @alias[:verb] body           invia messaggio / RPC ad attore
help-msg-fragment =   @alias#fragment[:verb] body  invia ad alias con frammento DID esplicito
help-msg-escape =   \@name                       @name letterale (nessuna ricerca alias)

help-focus-set =   .use @alias [as @name]       focus su attore (cambia il prompt)
help-focus-clear =   .use                         cancella focus

help-config-get =   .path                        ottieni valore foglia o elenca sottoalbero
help-config-filter =   .path value                  filtro di ricerca (filtra per valore)
help-config-set =   .path: value                 imposta foglia
help-config-delete =   .path:                       elimina foglia o sottoalbero
help-config-verb =   .path:verb [args]            esegui verbo locale

help-my =   .my                          mostra tutta la configurazione personale
help-aliases =   .my.aliases                  elenca alias
help-aliases-set =   .my.aliases.<name>: <did>    aggiungi/aggiorna alias (DID puro, senza #frammento)
help-aliases-del =   .my.aliases.<name>:          rimuovi alias
help-runtime-discover =   .my.ma:discover          scopri runtime locale e crea alias @ma
help-runtime-claim =   .my.ma:claim             reclama runtime con il tuo DID
help-identity =   .my.identity                 mostra configurazione identità
help-identity-did =   .my.identity.did             mostra DID proprio (sola lettura)
help-identity-publish =   .my.identity:publish @pub    pubblica DID proprio tramite servizio editore
help-config-path =   .config                      mostra tutte le voci .config.*

help-inbox =   .my.inbox                    elenca casella di posta (vista sottoalbero)
help-inbox-n =   .my.inbox.N                  mostra campi della voce N
help-inbox-from =   .my.inbox.N.from             DID mittente per la voce N
help-inbox-reply =   .my.inbox.N:reply [body]     invia risposta (apre editor senza corpo)
help-inbox-open =   .my.inbox.N:open             apri contenuto in editor di sola lettura
help-inbox-del =   .my.inbox.N:                 elimina voce N
help-inbox-delall =   .my.inbox:                   elimina tutte le voci della casella di posta
help-inbox-flush =   .my.inbox:flush              stampa tutte le voci nel terminale
help-inbox-traverse =   .my.inbox.N.sender.<campo>  attraversa documento DID mittente in modo lazy

help-doc-edit =   .my.doc.<nome>:edit           apri editor con contenuto salvato
help-doc-edit-cid =   .my.doc.<nome>:edit <cid>     recupera CID, apri per revisione
help-doc-eval =   .my.doc.<nome>:eval           esegui contenuto salvato riga per riga
help-doc-publish =   .my.doc.<nome>:publish @pub   salva come blob grezzo (tutti i tipi)
help-doc-publish-ipld =   .my.doc.<nome>:publish-ipld @pub  salva YAML come nodo IPLD DAG-CBOR strutturato
help-doc-fetch =   .my.doc.<nome>:fetch <cid>    importa contenuto CID (senza esecuzione)
help-doc-cid =   .my.doc.<nome>:cid            mostra CID salvato
help-doc-del =   .my.doc.<nome>:              elimina documento

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
yaml-serialize-error = Errore di serializzazione YAML: { $e }
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
err-edit-decode-failed = modifica: decodifica fallita: { $e }
err-edit-fetch-failed = modifica: recupero fallito: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nessuna sessione attiva — impossibile eliminare il profilo
profile-delete-error = eliminazione del profilo fallita: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nessuno)
profiles-deleted = profilo { $name } eliminato
profiles-not-found = profilo non trovato: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    aprire zion tramite un link URL
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
help-header-url = ── parametri URL ───────────────────────────────────────────────────────────
help-url-intro =   Condividi un link che apre zion con il destinatario già compilato:
help-url-msg =   ?msg=<did>                   precompila: @<did> (messaggio testo)
help-url-say =   ?say=<did>                   precompila: @<did>:say (verbo say)
help-url-emote =   ?emote=<did>                 precompila: @<did>:emote (verbo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Il campo viene precompilato ma non inviato — premi Invio per inviare.
