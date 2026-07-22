# zion — Kriolu
lang-name = Kriolu

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = logar
tab-new-identity = nova identidadi
tab-import-profile = importa perfil
label-passphrase = frazi-pase
label-username = nomi di uzadór
label-confirm-passphrase = konfirmá frazi-pase
label-did = DID
label-profile-cid = CID di perfil
label-or-file = o ficher
btn-login = logar
btn-export = exportá
btn-generate = jerá
btn-new-endpoint = novu endpoint
btn-import-profile = importa perfil
passphrase-warning = Pèrdi frazi-pase = pèrdi identidadi. Ka ten rekuperason.
import-profile-help = Importa un perfil via CID o ficher. Bes mester di mesmu frázi di pássa uzadu pa publica.
import-profile-detected-user = Perfil pértense a: { $name }
status-unlocking = sta desblokuandu...
status-generating = sta jerandu identidadi...
status-reading-file = sta lêndu fikeru...
status-fetching-profile = ta buskâ perfil na IPFS...
status-imported = importadu '{ $name }' — mudá pa tab Logar
status-importing-profile = ta importá perfil...
profile-import-done = perfil importadu pa '{ $name }' — { $n } xabi karegadu
error-wrong-passphrase = frazi-pase eradu: { $e }
error-identity-not-found = identidadi '{ $name }' ka atxadu
error-username-required = nomi di uzadór nesesáriu
error-passphrase-required = frazi-pase nesesáriu
error-passphrases-no-match = frazi-pase dem ka igual
error-profile-source-required = dá un CID o karrega ficher
error-did-required = mete abo DID
error-profile-fetch = ka podi buskâ perfil: { $e }
error-profile-no-username = perfil ka ten nómi di uzuáriu
error-profile-no-identity = identidádi '{ $name }' ka atxádu — importa identidádi prímeru

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — logadu komo { $username }
msg-type-help = Tipa .help pa lista di komandu.
msg-connecting = konektandu a iroh...
msg-iroh-ready = pontu iroh prontu
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID pablikadu via ma lokal ({ $url })
msg-ma-connecting-matrix = ta tenta konekta-bu a 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 lokal reklamadu
msg-local-ma-already-claimed = 間 lokal ja reklamadu
msg-local-ma-claim-failed = ka konsigi reklama 間 lokal
msg-identity-not-published = Idantidadi ka acha na intanet — si bu ten ma instaladu lokal, kori '.ma [port]' dipus '.my.identity!publish @ma'. Skriva '.help/publish' pa ditailyu.
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
err-alias-value-fragment = valór di alias pode teni no má ki un fragmentu DID-URL ka buziu
err-alias-value-path = valór di alias tên ku sê un DID did:ma:<ipns> ó DID-URL (sen path)
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
discover-hint-endpoint-not-found = Dika: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Dika: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Dika: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Dika: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma deskubertu na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma ta kriadu — kori '.my.identity!publish @ma' pa publika bo idantidadi.
claim-success = Runtime reklamadu pa { $did }
claim-conflict = Runtime ja reklamadu pa otra identidadi
claim-already-owned = Runtime ja reklamadu pa es identidadi
claim-http-failed = reklamason falhadu: HTTP { $status }
claim-error = reklamason falhadu: { $e }
claim-no-session = ka logadu; loga primêru pa reklamá runtime
runtime-no-verb = ka tên vèrbu `{ $verb }` pa { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl rênisiadu (kompletamenti abertu)
acl-persist-error = érro di persistênsia: { $e }
acl-no-verb = ka tên vèrbu `{ $verb }` pa .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uzajen: .my.identity!publish <did-o-alias>
identity-exported = Bundle downloadadu kómu { $filename }
identity-export-failed = Spurtasion falha: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content é bázyu
doc-save-first = { $path }.content é bázyu — gravá primêru
doc-missing-name = nomi di dokumentu falta
doc-publish-usage = uzajen: .my.doc.<nomi>!publish <publikadór>
doc-publish-ipld-usage = uzajen: .my.doc.<nomi>!publish-ipld <publikadór>
doc-publish-failed = publiká { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publikason falhadu [{ $code }]: { $err }
doc-publish-error-hint = Dika: { $hint }
doc-publish-hint-session = faça login novamente para que o ego possa acessar suas chaves de identidadi
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifique se o documento DID do editor foi publicado e contém um endpoint acessível
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin rejected the request; inspect the reason and retry after fixing entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspect runtime logs for detailed cause and retry
doc-store-sent = pedidu di armazenamentu mandadu ({ $id }) → { $publisher }; CID ta xiga via risposta RPC
doc-ipld-store-sent = pedidu di armazenamentu IPLD mandadu ({ $id }) → { $publisher }; CID ta xiga via risposta RPC
doc-fetch-done = buskadu { $cid } → { $path }.content (ka eziutadu)
doc-fetch-failed = buská { $cid }: { $e }
doc-fetch-usage = uzajen: .my.doc.<nomi>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ka definidu
doc-no-verb = ka tên vèrbu `{ $verb }` pa { $path }
path-no-verb = ka tên vèrbu `{ $verb }` pa { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lingua disponivel (.my.i18n: <code> pa pô):

err-lang-not-found = lingua ka atxadu: { $lang }

help-header-zion = ── komandus di zion ───────────────────────────────────────────────────────
help-header-messaging = ── mensajen ───────────────────────────────────────────────────────────────
help-header-config = ── gramatika di konfigurason lokal ────────────────────────────────────────
help-header-common = ── kaminhos komuns ────────────────────────────────────────────────────────
help-header-inbox = ── kaixa di entrada ───────────────────────────────────────────────────────
help-header-documents = ── dokumentus (.my.doc.*) ─────────────────────────────────────────────────
help-header-i18n = ── idioma ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entrando no 間-espaço ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        es tekstu
help-cmd-clear =   .clear                       limpa terminal
help-cmd-panic =   .panic                       últimu rekursu — uza si bo pèrdi
help-cmd-history =   .history                     istória di komandu (kopia konsekutivu meskladu)
help-cmd-logout =   .logout                      sai
help-cmd-batch =   .batch                       avaliar documento rascunho em paralelo
help-cmd-batch-sync =   .batch:sync / .batch         avaliar documento rascunho linha por linha
help-msg-echo =   @alias                       mostra DID/DID-URL rezolvidu (nen mensagem mandadu)
help-msg-send =   @alias!msg body / @alias:verb args           manda mensajen / RPC pa atór
help-msg-fragment =   @alias#fragment:verb body  manda pa alias ku fragmentu DID eplísitu
help-msg-escape =   \@name                       @name literal (ka prókura alias)
help-config-get =   .path                        panha valór di fólha o lista sób-árvori
help-config-filter =   .path value                  konsulta match (filtra po valór)
help-config-set =   .path: value                 seta fólha
help-config-delete =   .path:                       apaga fólha o sób-árvori
help-config-verb =   .path!verb [args]            invoka vèrbu lokal
help-my =   .my                          mustra tudu konfigurason pesoal
help-aliases =   .my.aliases                  lista alias
help-aliases-set =   .my.aliases.<name>: <did-url>    adisiona/atualiza alias (DID ó DID-URL)
help-aliases-del = .my.aliases.<name>:          remover alias
help-runtime-discover =   .ma [port]          diskubrí runtime lokal i kria alias @ma
help-runtime-claim =   .ma [port]             reklama propriedadi di runtime ku bo DID
help-identity =   .my.identity                 mustra konfigurason di identidadi
help-identity-did =   .my.identity.did             mustra DID própriu (sô-leitura)
help-identity-publish =   .my.identity!publish @pub    publiká DID própriu via servis di publikason
help-identity-export =   .my.identity!export          download bu própriu bundle di identidade
help-config-path =   .config                      mustra tudu entradas .config.*
help-inbox =   .my.inbox                    lista kaixa di entrada (vista di sób-árvori)
help-inbox-n =   .my.inbox.N                  mustra kanpus di entrada N
help-inbox-from =   .my.inbox.N.from             DID di remetenti di entrada N
help-inbox-reply =   .my.inbox.N!reply [body]     manda risposta (abri editor si ka ten korpus)
help-inbox-open =   .my.inbox.N!open             abri konteúdu di entrada sô-leitura no editor
help-inbox-del =   .my.inbox.N:                 apaga entrada N
help-inbox-delall =   .my.inbox:                   apaga tudu entradas di kaixa
help-inbox-flush =   .my.inbox!flush              imprime tudu entradas na terminal
help-inbox-filter =   .my.inbox!filter @who        mostra só entradas di @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   traversa dokumentu DID di remetenti pasientemente
help-doc-edit =   .my.doc.<name>!edit           abri editor ku konteúdu salvadu
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     busca CID, abri pa revisão sô
help-doc-eval =   .my.doc.<name>!eval           sita konteúdu salvadu linha po linha
help-doc-publish =   .my.doc.<name>!publish @pub   garda komu blob bruto (kualker tipu)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  garda YAML komu nódu DAG-CBOR IPLD strukturadu
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    impórta konteúdu CID (sin sita)
help-doc-cid =   .my.doc.<name>!cid            mustra CID gardadu
help-doc-del =   .my.doc.<name>:              apaga dokumentu

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n armazena a preferência de idioma vinculada à sua identidadi.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               listar códigos de idioma disponíveis

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Sala 間 é spasu entri identidadis 間. ma ta fazi es identidadis atxa un otu y kumunika; ora ki bu identidadi sta publikadu, bu pudi partisipa.
help-ma-command =   .ma [port]                   liga ku bu ma runtime lokal, le /status.json, y guarda .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publika bu dokumentu DID pa otus pudi risolvi bu xabis y endpoint
help-ma-security = Limiti di konfiansa mas klaru é bu propi ma runtime ku bu propi IPFS Desktop/Kubo. Un publisher lonji pudi ser útil, mas enton bu ta dipendi di sirvisu di otu algin.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             modi di entra na sala 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Ora ki bu identidadi é konxidu, .enter @ma ta dexabu entra na 間. Atxa un mundu, entra nel, y partisipa di li.
help-ma-entry-steps = Inisia IPFS Desktop y ma, dipos roda .ma. Publika ku .my.identity!publish @ma, atxa un mundu, y entra ku .enter @ma.
help-ma-entry-command =   .enter @ma                  entra na 間 através di @ma runtime
help-ma-entry-toggle =   .enter                       liga ô disliga fokusu di sala; bu identidadi ta fika ativu
help-ma-entry-url =   ?enter=<runtime>             entra dipos di login di un URL partilhadu

msg-send-failed = falhadu pa manda: { $e }
msg-not-logged-in = ka ta ligadu

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erru di análizi YAML: { $e }
yaml-not-mapping = YAML ta di ser un mapping (par xavi: valor); tèkstu simples i skalar ka podi ser armazenadu kumu DAG-CBOR
dagcbor-encode-error = Erru di kodifikason DAG-CBOR: { $e }
cbor-decode-error = Erru di dekodifikason CBOR: { $e }
cbor-json-error = Erru CBOR pa JSON: { $e }
yaml-serialise-error = Erru di serializason YAML: { $e }
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

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ta fla { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } entra na sala.
room-leave = * { $name } sai di sala.
room-drop  = * { $name } larga { $thing }.
room-take  = * { $name } panha { $thing }.
err-edit-decode-failed = edisaun: falta di decodifikasaun: { $e }
err-edit-fetch-failed = edisaun: falta di karregamentu: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ka ten sesãu ativu — ka podi apagá profil
profile-delete-error = apagamentu di profil falhadu: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = perfil kriptadu y mandadu pa IPFS; dokumentu DID ta atualizadu ora ki CID txiga
profile-publish-done = perfil publikadu — dokumentu DID atualizadu ku ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identidadi já publicada — perfil atualizado
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

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
help-header-topics = -- tópicos -- digite .help/<topic> para detalhes
help-topic-msg =   .help/msg                    mensagens
help-topic-ma = .help/ma                     ma-espaço, publicação e entrada
help-topic-path = .help/path                   gramática de caminho de ponto local
help-topic-my =   .help/my                     config pessoal
help-topic-inbox =   .help/inbox                  caixa de entrada
help-topic-doc =   .help/doc                    documentos
help-topic-actor =   .help/actor                  actor remoto
help-topic-zscheme =   .help/zscheme               ekspreson Scheme na linha y dokumentason
help-unknown-topic =   .help/{ $topic }: tópico desconhecido

# -- Help actor section
help-header-actor = -- atores remotos
help-actor-echo =   @actor                       mostrar DID resolvido
help-actor-text = @actor[#entity]!msg|!say|!emote body         enviar mensajen direta/chat/emote
help-actor-ping = @actor:ping                  ping de vivacidade
help-actor-entities =   @actor/entities              listar entidades
help-actor-entities-get = @actor/entities/<n>          obter nó de entidade
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     editar entidade
help-actor-entities-del = @actor/entities/<n>:         excluir entidade
help-actor-config-get =   @actor/config/<key>          obter valor de config
help-actor-config-set =   @actor/config/<key>: val     definir valor de config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              editar ACL
help-actor-fragment =   @actor#entity                enviar ao plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ao plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  mantenha as respostas 5 no ambiente da sessão
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    abri zion via un ligason URL
help-topic-i18n = .help/i18n                   preferência de idioma para sua identidadi
help-header-url = ── parametru URL ────────────────────────────────────────────────────────────────
help-url-intro =   Partilha un ligason ki abri zion ku un destinatáriu ia metidu:
help-url-msg =   ?msg=<did>                   mete antis: @<did>!msg (mensaji simples)
help-url-say =   ?say=<did>                   mete antis: @<did>!say (verbu say)
help-url-emote =   ?emote=<did>                 mete antis: @<did>!emote (verbu emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             enter runtime world after login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Entrada sta metida ma ka manda ainda — preme Enter pa manda.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publika bo idantidadi na rede
help-header-publish = ── publika idantidadi ───────────────────────────────────────────────────────
help-publish-intro = Publikason fazi bo idantidadi atxável na rede. Otus podi txuba bo DID pa kontakta ku bu.
help-publish-ma = Pa publika, bu ta prexisa ma (runtime lokal) instaladu. El liga ego ku IPFS/IPNS na bo nomi.
help-publish-steps = Passu: kori '.ma [port]' pa diteta ma lokal, dipus '.my.identity!publish @ma'.
help-publish-without = Sin publikason, otus ka pa konsigi atingi bu — mes ki es sabi bo DID, es ka pa rezolvi bo endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = indika nomi di perfil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Coletando lote — digite comandos, termine com .batch
batch-already-collecting = Já coletando um lote – termine primeiro com .batch
batch-empty = O lote estava vazio – nada para executar
batch-running = Executando lote…
batch-step-timeout = a etapa do lote expirou

batch-done = Lote concluído em { $secs }s — { $steps } passos
batch-done-error = Lote concluído com erros em { $secs }s — { $steps } passos
msg-timeout = Mensagem expirou (sem resposta em 60s)
err-unknown-command = kumandu diskonxedu: { $path }
err-read-only-path = { $path } é só pa letura
help-cmd-batch-async =   .batch:async / .batch        avaliar documento rascunho em paralelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Ka falla busca CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ka ta válidu: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Avisu: Bu xave privadu IPNS di bu la ser mandadu pa kel runtime li pa pabliká identidadi. So uza un runtime ku bu kunfia di txeu.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme avalia ekspreson Scheme dentu di komandus zion y poi resultado na linha antis di manda.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    izemplu na linha; manda "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definison ta fika na seson atual di login
help-zscheme-doc = Dokumentason: https://github.com/bahner/rust-ma-zscheme
