# zion — Kriolu
lang-name = Kriolu

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = logar
tab-new-identity = nova identidadi
tab-import = importá
label-passphrase = frazi-pase
label-username = nomi di uzadór
label-confirm-passphrase = konfirmá frazi-pase
btn-login = logar
btn-export = exportá
btn-generate = jerá
btn-new-endpoint = novu endpoint
passphrase-warning = Pèrdi frazi-pase = pèrdi identidadi. Ka ten rekuperason.
import-help = Skoĩ un fikeru .zion.json exportadu. Pakotu ta fikadu enkriptadu.
status-unlocking = sta desblokuandu...
status-generating = sta jerandu identidadi...
status-reading-file = sta lêndu fikeru...
status-imported = importadu '{ $name }' — mudá pa tab Logar
error-wrong-passphrase = frazi-pase eradu: { $e }
error-identity-not-found = identidadi '{ $name }' ka atxadu
error-username-required = nomi di uzadór nesesáriu
error-passphrase-required = frazi-pase nesesáriu
error-passphrases-no-match = frazi-pase dem ka igual

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logadu komo { $username }
msg-type-help = Tipa .help pa lista di komandu.
msg-connecting = konektandu a iroh...
msg-iroh-ready = pontu iroh prontu
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID pablikadu via ma lokal ({ $url })
msg-identity-not-published = Idantidadi ka acha na intanet — si bu ten ma instaladu lokal, kori '.my.ma:discover' dipus '.my.identity:publish @ma'. Skriva '.help.publish' pa ditailyu.
msg-blocked = ⊗ blokadu [{ $cap }]: { $from }
msg-focus-cleared = foku limpadu
msg-focusing = foku { $did } komo { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eliminadu { $path } ({ $count } entráda)
msg-read-only = { $path } é só-lêtura
msg-subtree-set = { $path } é um subarvori; rejitandu definir
msg-ancestor-leaf = um ansestral di { $path } é uma fólya; rejitandu kobrí
msg-key-not-found = xavi ka atxadu: { $path }
msg-no-match = ka ten korêspodênsia
msg-link-not-connected = érro di buska ligason: ka konektadu
msg-link-fetch-error = érro di buska ligason: { $e }
msg-link-key-not-found = xavi `{ $key }` ka atxadu dentru di dokumentu ligadu

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = nomi di alias ka podi sta bázyu
err-alias-has-dot = nomi di alias ka podi tê '.'
err-alias-has-fragment = nomi di alias ka podi tê '#'
err-alias-value-fragment = valór di alias tên ku sê did:ma:<ipns> só (sen fragmentu)
err-alias-value-path = valór di alias tên ku sê did:ma:<ipns> só (sen kaminhu)
err-alias-not-did = valór di alias tên ku kumesá ku did:ma:
err-unknown-alias = alias deskonsidu: @{ $name }
err-bare-did = speráva did:ma:<ipns> só (sen fragmentu o kaminhu), atxadu { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Gravá
btn-eval = Evaluá
btn-cancel = Kansela
btn-close = Fexá
btn-reply = Respondê
btn-publish = Publiká
btn-publish-ipld = Publiká IPLD
msg-reply-sent = risposta mandadu
msg-reply-failed = risposta falhadu: { $e }
msg-entity-publish-sent = entidadi { $name }: publikason mandadu
msg-entity-publish-failed = publikason di entidadi falhadu: { $e }
msg-kind-publish-failed = publikason di tépu faliu: { $e }
msg-field-publish-sent = entidadi { $name }.{ $field }: publikason mandadu
msg-field-publish-failed = publikason di kampu falhadu: { $e }
msg-acl-publish-sent = runtime ACL: publikason mandadu
msg-crud-edit-publish-sent = { $path }: publikason mandadu
msg-acl-publish-failed = publikason di runtime ACL falhadu: { $e }
msg-yaml-error = érro YAML: { $e }
msg-editor-saved = { $path }:gravá
msg-fetch-review = buskadu { $cid } — ribizhá antis di avaliá
msg-fetch-failed = buská { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = kaixa di entrada bázya
inbox-entry-not-found = entráda di kaixa { $n } ka atxadu
inbox-no-message-id = entráda di kaixa { $n } ka tên message_id
inbox-no-verb = ka tên vèrbu `{ $verb }` pa entráda di kaixa { $n }
inbox-filter-no-arg = filtru presiza un argumento DID ó alias
inbox-filter-empty = nenhum mensaji di { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskuberta falhadu na { $url }: { $e }
discover-json-error = diskuberta falhadu: JSON invalidu di { $url }: { $e }
discover-missing-did = diskuberta falhadu: status.json falta kampu `did`
discover-invalid-did = diskuberta falhadu: speráva `did` kumesá ku did:ma:, atxadu `{ $did }`
discover-no-endpoint = avizu diskuberta: `endpoint_id` falta na status.json; só DID gravadu
discover-success = ma deskubertu na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma ta kriadu — kori '.my.identity:publish @ma' pa publika bo idantidadi.
claim-success = Runtime reklamadu pa { $did }
claim-conflict = Runtime ja reklamadu pa otra identidadi
claim-http-failed = reklamason falhadu: HTTP { $status }
claim-error = reklamason falhadu: { $e }
claim-no-session = ka logadu; loga primêru pa reklamá runtime
runtime-no-verb = ka tên vèrbu `{ $verb }` pa { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl rênisiadu (kompletamenti abertu)
acl-persist-error = érro di persistênsia: { $e }
acl-no-verb = ka tên vèrbu `{ $verb }` pa .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uzajen: .my.identity:publish <did-o-alias>
identity-exported = Bundle downloadadu kómu { $filename }
identity-export-failed = Spurtasion falha: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content é bázyu
doc-save-first = { $path }.content é bázyu — gravá primêru
doc-missing-name = nomi di dokumentu falta
doc-publish-usage = uzajen: .my.doc.<nomi>:publish <publikadór>
doc-publish-ipld-usage = uzajen: .my.doc.<nomi>:publish-ipld <publikadór>
doc-publish-failed = publiká { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = pedidu di armazenamentu mandadu ({ $id }) → { $publisher }; CID ta xiga via risposta RPC
doc-ipld-store-sent = pedidu di armazenamentu IPLD mandadu ({ $id }) → { $publisher }; CID ta xiga via risposta RPC
doc-fetch-done = buskadu { $cid } → { $path }.content (ka eziutadu)
doc-fetch-failed = buská { $cid }: { $e }
doc-fetch-usage = uzajen: .my.doc.<nomi>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ka definidu
doc-no-verb = ka tên vèrbu `{ $verb }` pa { $path }
path-no-verb = ka tên vèrbu `{ $verb }` pa { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lingua disponivel (.my.i18n: <code> pa pô):

err-lang-not-found = lingua ka atxadu: { $lang }

help-header-zion = ── komandus di zion ───────────────────────────────────────────────────────
help-header-messaging = ── mensajen ───────────────────────────────────────────────────────────────
help-header-focus = ── modu fokus ─────────────────────────────────────────────────────────────
help-header-config = ── gramatika di konfigurason lokal ────────────────────────────────────────
help-header-common = ── kaminhos komuns ────────────────────────────────────────────────────────
help-header-inbox = ── kaixa di entrada ───────────────────────────────────────────────────────
help-header-documents = ── dokumentus (.my.doc.*) ─────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        es tekstu
help-cmd-clear =   .clear                       limpa terminal
help-cmd-panic =   .panic                       últimu rekursu — uza si bo pèrdi
help-cmd-history =   .history                     istória di komandu (kopia konsekutivu meskladu)
help-cmd-logout =   .logout                      sai
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)
help-msg-echo =   @alias                       ekua DID rezolvidu (ka manda mensajen)
help-msg-send =   @alias[:verb] body           manda mensajen / RPC pa atór
help-msg-fragment =   @alias#fragment[:verb] body  manda pa alias ku fragmentu DID eplísitu
help-msg-escape =   \@name                       @name literal (ka prókura alias)
help-focus-set =   .use @alias [as @name]       fokusa na atór (muda promptu)
help-focus-clear =   .use                         limpa fokus
help-config-get =   .path                        panha valór di fólha o lista sób-árvori
help-config-filter =   .path value                  konsulta match (filtra po valór)
help-config-set =   .path: value                 seta fólha
help-config-delete =   .path:                       apaga fólha o sób-árvori
help-config-verb =   .path:verb [args]            invoka vèrbu lokal
help-my =   .my                          mustra tudu konfigurason pesoal
help-aliases =   .my.aliases                  lista alias
help-aliases-set =   .my.aliases.<name>: <did>    adisiona/atuAliza alias (DID nú, sin #fragmentu)
help-aliases-del =   .my.aliases.<name>:          remove alias
help-runtime-discover =   .my.ma:discover          diskubrí runtime lokal i kria alias @ma
help-runtime-claim =   .my.ma:claim             reklama propriedadi di runtime ku bo DID
help-identity =   .my.identity                 mustra konfigurason di identidadi
help-identity-did =   .my.identity.did             mustra DID própriu (sô-leitura)
help-identity-publish =   .my.identity:publish @pub    publiká DID própriu via servis di publikason
help-identity-export =   .my.identity:export          download bu própriu bundle di identidade
help-config-path =   .config                      mustra tudu entradas .config.*
help-inbox =   .my.inbox                    lista kaixa di entrada (vista di sób-árvori)
help-inbox-n =   .my.inbox.N                  mustra kanpus di entrada N
help-inbox-from =   .my.inbox.N.from             DID di remetenti di entrada N
help-inbox-reply =   .my.inbox.N:reply [body]     manda risposta (abri editor si ka ten korpus)
help-inbox-open =   .my.inbox.N:open             abri konteúdu di entrada sô-leitura no editor
help-inbox-del =   .my.inbox.N:                 apaga entrada N
help-inbox-delall =   .my.inbox:                   apaga tudu entradas di kaixa
help-inbox-flush =   .my.inbox:flush              imprime tudu entradas na terminal
help-inbox-filter =   .my.inbox:filter @who        mostra só entradas di @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traversa dokumentu DID di remetenti pasientemente
help-doc-edit =   .my.doc.<name>:edit           abri editor ku konteúdu salvadu
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     busca CID, abri pa revisão sô
help-doc-eval =   .my.doc.<name>:eval           sita konteúdu salvadu linha po linha
help-doc-publish =   .my.doc.<name>:publish @pub   garda komu blob bruto (kualker tipu)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  garda YAML komu nódu DAG-CBOR IPLD strukturadu
help-doc-fetch =   .my.doc.<name>:fetch <cid>    impórta konteúdu CID (sin sita)
help-doc-cid =   .my.doc.<name>:cid            mustra CID gardadu
help-doc-del =   .my.doc.<name>:              apaga dokumentu

msg-send-failed = falhadu pa manda: { $e }
msg-not-logged-in = ka ta ligadu

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erru di análizi YAML: { $e }
yaml-not-mapping = YAML ta di ser un mapping (par xavi: valor); tèkstu simples i skalar ka podi ser armazenadu kumu DAG-CBOR
dagcbor-encode-error = Erru di kodifikason DAG-CBOR: { $e }
cbor-decode-error = Erru di dekodifikason CBOR: { $e }
cbor-json-error = Erru CBOR pa JSON: { $e }
yaml-serialize-error = Erru di serializason YAML: { $e }
edit-reply-invalid = Risposta di edisom invalidu
doc-publish-ipld-error = Pablikason IPLD faliu: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Erru di grava limpeza di kaixa di entrada: { $e }
err-config-load = Erru di karrega konfigurasón: { $e }
err-lang-persist = Erru di grava língua: { $e }
err-history-parse = Erru di análizi istória: { $e }
err-history-load = Erru di karrega istória: { $e }
err-ipfs-reply-decode = Falha di dekodifikason di reposta IPFS: { $e }
err-edit-cbor = Erru di edisom CBOR: { $e }
err-popup-blocked = Popup blokedu pa navegador
status-publishing = ta publika

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = érru
rpc-error-detail = érru: { $detail }
msg-new-message = ← [{ $from }] mensajen novu — { $count } na kaixa di entrada
msg-chat = { $sender } fala { $body }
err-edit-decode-failed = edisaun: falta di decodifikasaun: { $e }
err-edit-fetch-failed = edisaun: falta di karregamentu: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ka ten sesãu ativu — ka podi apagá profil
profile-delete-error = apagamentu di profil falhadu: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nada)
profiles-deleted = profil { $name } apagadu
profiles-not-found = profil ka atxadu: { $name }

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

help-topic-url =   .help.url                    abri zion via un ligason URL
help-header-url = ── parametru URL ────────────────────────────────────────────────────────────────
help-url-intro =   Partilha un ligason ki abri zion ku un destinatáriu ia metidu:
help-url-msg =   ?msg=<did>                   mete antis: @<did> (mensaji simples)
help-url-say =   ?say=<did>                   mete antis: @<did>:say (verbu say)
help-url-emote =   ?emote=<did>                 mete antis: @<did>:emote (verbu emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Entrada sta metida ma ka manda ainda — preme Enter pa manda.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publika bo idantidadi na rede
help-header-publish = ── publika idantidadi ───────────────────────────────────────────────────────
help-publish-intro = Publikason fazi bo idantidadi atxável na rede. Otus podi txuba bo DID pa kontakta ku bu.
help-publish-ma = Pa publika, bu ta prexisa ma (runtime lokal) instaladu. El liga ego ku IPFS/IPNS na bo nomi.
help-publish-steps = Passu: kori '.my.ma:discover' pa diteta ma lokal, dipus '.my.identity:publish @ma'.
help-publish-without = Sin publikason, otus ka pa konsigi atingi bu — mes ki es sabi bo DID, es ka pa rezolvi bo endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
batch-step-timeout = batch step timed out
