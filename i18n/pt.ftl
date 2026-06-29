# zion — Português
lang-name = Português

# ── Página de login ───────────────────────────────────────────────────────
tab-login = entrar
tab-new-identity = nova identidade
tab-import = importar
label-passphrase = frase de acesso
label-username = nome de utilizador
label-confirm-passphrase = confirmar frase de acesso
btn-login = entrar
btn-export = exportar
btn-generate = gerar
btn-new-endpoint = novo endpoint
passphrase-warning = Frase de acesso perdida = identidade perdida. Não existe recuperação.
import-help = Escolha um ficheiro .zion.json exportado. O pacote permanece cifrado.
status-unlocking = a desbloquear...
status-generating = a gerar identidade...
status-reading-file = a ler ficheiro...
status-imported = '{ $name }' importado — mude para o separador Entrar
error-wrong-passphrase = frase de acesso incorreta: { $e }
error-identity-not-found = identidade '{ $name }' não encontrada
error-username-required = nome de utilizador é obrigatório
error-passphrase-required = frase de acesso é obrigatória
error-passphrases-no-match = as frases de acesso não correspondem

# ── Mensagens do sistema do terminal ─────────────────────────────────────
msg-logged-in = zion v{ $version } — sessão iniciada como { $username }
msg-type-help = Escreva .help para obter uma lista de comandos.
msg-connecting = a ligar ao iroh...
msg-iroh-ready = ponto de extremidade iroh pronto
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicado via ma local ({ $url })
msg-identity-not-published = Identidade não encontrada online — se tiver ma instalado localmente, execute '.my.ma:discover' e depois '.my.identity:publish @ma'. Digite '.help.publish' para detalhes.
msg-blocked = ⊗ bloqueado [{ $cap }]: { $from }
msg-focus-cleared = foco limpo
msg-focusing = a focar { $did } como { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eliminado { $path } ({ $count } entradas)
msg-read-only = { $path } é só de leitura
msg-subtree-set = { $path } é uma subárvore; configuração recusada
msg-ancestor-leaf = um ancestral de { $path } é uma folha; sombreamento recusado
msg-key-not-found = chave não encontrada: { $path }
msg-no-match = sem correspondência
msg-link-not-connected = erro ao obter ligação: não conectado
msg-link-fetch-error = erro ao obter ligação: { $e }
msg-link-key-not-found = chave `{ $key }` não encontrada no documento ligado

# ── Validação de alias ────────────────────────────────────────────────────
err-alias-name-empty = o nome do alias não pode estar vazio
err-alias-has-dot = o nome do alias não pode conter '.'
err-alias-has-fragment = o nome do alias não pode conter '#'
err-alias-value-fragment = o valor do alias deve ser um did:ma:<ipns> puro (sem fragmento)
err-alias-value-path = o valor do alias deve ser um did:ma:<ipns> puro (sem caminho)
err-alias-not-did = o valor do alias deve começar com did:ma:
err-unknown-alias = alias desconhecido: @{ $name }
err-bare-did = esperado did:ma:<ipns> puro (sem fragmento ou caminho), recebido { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Guardar
btn-eval = Executar
btn-cancel = Cancelar
btn-close = Fechar
btn-reply = Responder
btn-publish = Publicar
btn-publish-ipld = Publicar IPLD
msg-reply-sent = resposta enviada
msg-reply-failed = falha ao enviar resposta: { $e }
msg-entity-publish-sent = entidade { $name }: publicação enviada
msg-entity-publish-failed = falha ao publicar entidade: { $e }
msg-kind-publish-failed = publicação de tipo falhou: { $e }
msg-field-publish-sent = entidade { $name }.{ $field }: publicação enviada
msg-field-publish-failed = falha ao publicar campo: { $e }
msg-acl-publish-sent = ACL de tempo de execução: publicação enviada
msg-crud-edit-publish-sent = { $path }: publicação enviada
msg-acl-publish-failed = falha ao publicar ACL de tempo de execução: { $e }
msg-yaml-error = erro YAML: { $e }
msg-editor-saved = { $path }:guardar
msg-fetch-review = { $cid } obtido — reveja antes de executar
msg-fetch-failed = obtenção { $cid }: { $e }

# ── Verbos — caixa de entrada ─────────────────────────────────────────────
inbox-empty = a caixa de entrada está vazia
inbox-entry-not-found = entrada { $n } da caixa de entrada não encontrada
inbox-no-message-id = a entrada { $n } da caixa de entrada não tem message_id
inbox-no-verb = nenhum verbo `{ $verb }` para a entrada { $n } da caixa de entrada
inbox-filter-no-arg = o filtro requer um argumento DID ou alias
inbox-filter-empty = nenhuma mensagem de { $did }

# ── Verbos — tempo de execução ────────────────────────────────────────────
discover-fetch-failed = descoberta falhou em { $url }: { $e }
discover-json-error = descoberta falhou: JSON inválido de { $url }: { $e }
discover-missing-did = descoberta falhou: status.json em falta o campo obrigatório `did`
discover-invalid-did = descoberta falhou: esperava `did` começar com did:ma:, recebido `{ $did }`
discover-no-endpoint = aviso de descoberta: `endpoint_id` ausente em status.json; apenas DID guardado
discover-success = ma descoberto em { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma criado — execute '.my.identity:publish @ma' para publicar a sua identidade.
claim-success = Tempo de execução reclamado para { $did }
claim-conflict = Tempo de execução já reclamado por outra identidade
claim-http-failed = reclamação falhou: HTTP { $status }
claim-error = reclamação falhou: { $e }
claim-no-session = não autenticado; inicie sessão primeiro para reclamar o tempo de execução
runtime-no-verb = nenhum verbo `{ $verb }` para { $path }

# ── Verbos — controlo de acesso ───────────────────────────────────────────
acl-reset = .my.acl reposto (completamente aberto)
acl-persist-error = erro ao guardar: { $e }
acl-no-verb = nenhum verbo `{ $verb }` para .my.acl

# ── Verbos — identidade ───────────────────────────────────────────────────
publish-usage = utilização: .my.identity:publish <did-ou-alias>
identity-exported = Pacote descarregado como { $filename }
identity-export-failed = Exportação falhou: { $e }

# ── Verbos — documentos ───────────────────────────────────────────────────
doc-content-empty = { $path }.content está vazio
doc-save-first = { $path }.content está vazio — guarde primeiro
doc-missing-name = nome do documento em falta
doc-publish-usage = utilização: .my.doc.<nome>:publish <editor>
doc-publish-ipld-usage = utilização: .my.doc.<nome>:publish-ipld <editor>
doc-publish-failed = publicação { $path }: { $e }
doc-publish-ipld-failed = publicação IPLD { $path }: { $e }
doc-store-sent = pedido de armazenamento enviado ({ $id }) → { $publisher }; CID chegará por resposta RPC
doc-ipld-store-sent = pedido de armazenamento IPLD enviado ({ $id }) → { $publisher }; CID chegará por resposta RPC
doc-fetch-done = { $cid } obtido → { $path }.content (não executado)
doc-fetch-failed = obtenção { $cid }: { $e }
doc-fetch-usage = utilização: .my.doc.<nome>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid não está definido
doc-no-verb = nenhum verbo `{ $verb }` para { $path }
path-no-verb = nenhum verbo `{ $verb }` para { $path }

# ── Texto de ajuda — cabeçalhos ───────────────────────────────────────────
help-header-zion = ── comandos zion ──────────────────────────────────────────────────────────
help-header-messaging = ── mensagens ─────────────────────────────────────────────────────────────
help-header-focus = ── modo de foco ──────────────────────────────────────────────────────────
help-header-config = ── gramática de configuração local ──────────────────────────────────────
help-header-common = ── caminhos comuns ───────────────────────────────────────────────────────
help-header-inbox = ── caixa de entrada ─────────────────────────────────────────────────────
help-header-documents = ── documentos ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        este texto
help-cmd-clear =   .clear                       limpar o terminal
help-cmd-panic =   .panic                       último recurso — use se estiver em apuros
help-cmd-history =   .history                     histórico de comandos (duplicatas consecutivas mescladas)
help-cmd-logout =   .logout                      terminar sessão
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       mostrar DID resolvido (nenhuma mensagem enviada)
help-msg-send =   @alias[:verb] body           enviar mensagem / RPC para ator
help-msg-fragment =   @alias#fragment[:verb] body  enviar para alias com fragmento DID explícito
help-msg-escape =   \@name                       @name literal (sem pesquisa de alias)

help-focus-set =   .use @alias [as @name]       focar em ator (altera o prompt)
help-focus-clear =   .use                         limpar foco

help-config-get =   .path                        obter valor de folha ou listar subárvore
help-config-filter =   .path value                  filtro de pesquisa (filtrar por valor)
help-config-set =   .path: value                 definir folha
help-config-delete =   .path:                       eliminar folha ou subárvore
help-config-verb =   .path:verb [args]            executar verbo local

help-my =   .my                          mostrar toda a configuração pessoal
help-aliases =   .my.aliases                  listar aliases
help-aliases-set =   .my.aliases.<name>: <did>    adicionar/atualizar alias (DID puro, sem #fragmento)
help-aliases-del =   .my.aliases.<name>:          remover alias
help-runtime-discover =   .my.ma:discover          descobrir tempo de execução local e criar alias @ma
help-runtime-claim =   .my.ma:claim             reclamar tempo de execução com o seu DID
help-identity =   .my.identity                 mostrar configuração de identidade
help-identity-did =   .my.identity.did             mostrar DID próprio (só de leitura)
help-identity-publish =   .my.identity:publish @pub    publicar DID próprio através do serviço editor
help-identity-export =   .my.identity:export          descarregar o próprio pacote de identidade
help-config-path =   .config                      mostrar todas as entradas .config.*

help-inbox =   .my.inbox                    listar caixa de entrada (vista de subárvore)
help-inbox-n =   .my.inbox.N                  mostrar campos da entrada N
help-inbox-from =   .my.inbox.N.from             DID do remetente para a entrada N
help-inbox-reply =   .my.inbox.N:reply [body]     enviar resposta (abre editor sem corpo)
help-inbox-open =   .my.inbox.N:open             abrir conteúdo em editor só de leitura
help-inbox-del =   .my.inbox.N:                 eliminar entrada N
help-inbox-delall =   .my.inbox:                   eliminar todas as entradas da caixa de entrada
help-inbox-flush =   .my.inbox:flush              imprimir todas as entradas no terminal
help-inbox-filter =   .my.inbox:filter @who        mostrar apenas entradas de @who
help-inbox-traverse =   .my.inbox.N.sender.<campo>  percorrer documento DID do remetente de forma diferida

help-doc-edit =   .my.doc.<nome>:edit           abrir editor com conteúdo guardado
help-doc-edit-cid =   .my.doc.<nome>:edit <cid>     obter CID, abrir para revisão
help-doc-eval =   .my.doc.<nome>:eval           executar conteúdo guardado linha por linha
help-doc-publish =   .my.doc.<nome>:publish @pub   guardar como blob bruto (todos os tipos)
help-doc-publish-ipld =   .my.doc.<nome>:publish-ipld @pub  guardar YAML como nó IPLD DAG-CBOR estruturado
help-doc-fetch =   .my.doc.<nome>:fetch <cid>    importar conteúdo CID (sem execução)
help-doc-cid =   .my.doc.<nome>:cid            mostrar CID guardado
help-doc-del =   .my.doc.<nome>:              eliminar documento

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Idiomas disponíveis (definir com .my.i18n: <code>):
err-lang-not-found = idioma não encontrado: { $lang }

msg-send-failed = falha no envio: { $e }
msg-not-logged-in = não conectado

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erro de análise YAML: { $e }
yaml-not-mapping = YAML deve ser um mapping (pares chave: valor); texto simples e escalares não podem ser armazenados como DAG-CBOR
dagcbor-encode-error = Erro de codificação DAG-CBOR: { $e }
cbor-decode-error = Erro de decodificação CBOR: { $e }
cbor-json-error = Erro de conversão CBOR para JSON: { $e }
yaml-serialize-error = Erro de serialização YAML: { $e }
edit-reply-invalid = Resposta de edição inválida
doc-publish-ipld-error = Publicação IPLD falhou: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Erro ao guardar limpeza da caixa de entrada: { $e }
err-config-load = Erro ao carregar configuração: { $e }
err-lang-persist = Erro ao guardar idioma: { $e }
err-history-parse = Erro de análise do histórico: { $e }
err-history-load = Erro ao carregar histórico: { $e }
err-ipfs-reply-decode = Falha ao decodificar resposta IPFS: { $e }
err-edit-cbor = Erro de edição CBOR: { $e }
err-popup-blocked = Pop-up bloqueado pelo navegador
status-publishing = publicando

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = erro
rpc-error-detail = erro: { $detail }
msg-new-message = ← [{ $from }] nova mensagem — { $count } na caixa de entrada
msg-chat = { $sender } diz { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } diz { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } entra na sala.
room-leave = * { $name } sai da sala.
room-drop  = * { $name } larga { $thing }.
room-take  = * { $name } apanha { $thing }.
err-edit-decode-failed = edição: falha na decodificação: { $e }
err-edit-fetch-failed = edição: falha no carregamento: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nenhuma sessão ativa — não é possível excluir o perfil
profile-delete-error = falha ao excluir o perfil: { $e }
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
profiles-empty = (nenhum)
profiles-deleted = perfil { $name } excluído
profiles-not-found = perfil não encontrado: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    abrir zion via um link URL
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
help-header-url = ── parâmetros de URL ───────────────────────────────────────────────────────
help-url-intro =   Partilha um link que abre zion com o destinatário pré-preenchido:
help-url-msg =   ?msg=<did>                   pré-preenche: @<did> (mensagem de texto)
help-url-say =   ?say=<did>                   pré-preenche: @<did>:say (verbo say)
help-url-emote =   ?emote=<did>                 pré-preenche: @<did>:emote (verbo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   O campo é pré-preenchido mas não enviado — prime Enter para enviar.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publicar a sua identidade na rede
help-header-publish = ── publicar identidade ──────────────────────────────────────────────────────
help-publish-intro = Publicar torna a sua identidade encontrável na rede. Outros podem pesquisar o seu DID para o contactar.
help-publish-ma = Para publicar, precisa de ma (runtime local) instalado. Liga ego ao IPFS/IPNS em seu nome.
help-publish-steps = Passos: execute '.my.ma:discover' para detetar o seu ma local, depois '.my.identity:publish @ma'.
help-publish-without = Sem publicar, outros não conseguem contactá-lo — mesmo que conheçam o seu DID, não conseguem resolver o seu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
scheme-cid-fetch-error = Falha ao obter CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID inválido: { $value }
