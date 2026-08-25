# zion — Português
lang-name = Português
label-nick = alcunha
new-identity-nick-help = Escolha uma alcunha para 間-space. É apenas uma alcunha e pode alterá-la quando quiser.
error-nick-required = alcunha obrigatória
error-nick-invalid = a alcunha não pode conter espaços nem @

# ── Página de login ───────────────────────────────────────────────────────
tab-login = entrar
tab-new-identity = nova identidade
tab-import-profile = importar perfil
label-passphrase = frase de acesso
label-username = nome de utilizador
label-confirm-passphrase = confirmar frase de acesso
label-did = DID
label-profile-cid = CID do perfil
label-or-file = ou arquivo
btn-login = entrar
btn-export = exportar
btn-generate = gerar
btn-new-endpoint = novo endpoint
btn-import-profile = importar perfil
btn-show-qr = mostrar QR
btn-scan-qr = ler QR
qr-scan-hint = Aponte a câmara para um código QR de perfil zion.
qr-error-camera = câmara indisponível: { $e }
qr-error-too-large = perfil demasiado grande para um código QR
passphrase-warning = Frase de acesso perdida = identidade perdida. Não existe recuperação.
import-profile-help = Importe um perfil via CID ou arquivo. É necessária a mesma frase secreta utilizada na publicação.
import-profile-detected-user = O perfil pertence a: { $name }
status-unlocking = a desbloquear...
status-generating = a gerar identidade...
status-reading-file = a ler ficheiro...
status-fetching-profile = buscando perfil do IPFS...
status-imported = '{ $name }' importado — mude para o separador Entrar
status-importing-profile = importando perfil...
profile-import-done = perfil importado para '{ $name }' — { $n } chaves carregadas
error-wrong-passphrase = frase de acesso incorreta: { $e }
error-identity-not-found = identidade '{ $name }' não encontrada
error-username-required = nome de utilizador é obrigatório
error-passphrase-required = frase de acesso é obrigatória
error-passphrases-no-match = as frases de acesso não correspondem
error-profile-source-required = forneça um CID ou carregue um arquivo
error-did-required = insira o seu DID
error-profile-fetch = não foi possível buscar o perfil: { $e }
error-profile-no-username = o perfil não contém um nome de utilizador
error-profile-no-identity = identidade '{ $name }' não encontrada — importe a identidade primeiro

# ── Mensagens do sistema do terminal ─────────────────────────────────────
msg-logged-in = zion v{ $version } — sessão iniciada como { $username }
msg-type-help = Escreva .help para obter uma lista de comandos.
msg-getting-started = Experimente: say Hello world, look, .help ou help.
msg-connecting = a ligar ao iroh...
msg-iroh-ready = ponto de extremidade iroh pronto
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicado via 間 local ({ $url })
msg-identity-publication-propagating = A publicação da identidade ainda está a propagar-se; entrada atrasada: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = A publicar a identidade. Isto pode demorar até { $seconds } segundos.
msg-ma-connecting-matrix = a tentar ligá-lo à 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 local reclamado
msg-local-ma-already-claimed = 間 local já reclamado
msg-local-ma-claim-failed = não foi possível reclamar o 間 local
msg-identity-not-published = Identidade não encontrada online — se tiver 間 instalado localmente, execute '.ma: claim [port]' e depois '.my.identity!publish @ma'. Digite '.help/publish' para detalhes.
msg-blocked = ⊗ bloqueado [{ $cap }]: { $from }
msg-focus-cleared = foco limpo
msg-left = left
msg-focusing = a focar { $did } como { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eliminado { $path } ({ $count } entradas)
msg-read-only = { $path } é só de leitura
msg-subtree-set = { $path } é uma subárvore; configuração recusada
msg-ancestor-leaf = um ancestral de { $path } é uma folha; sombreamento recusado
msg-key-not-found = chave não encontrada: { $path }
msg-link-not-connected = erro ao obter ligação: não conectado
msg-link-fetch-error = erro ao obter ligação: { $e }
msg-link-key-not-found = chave `{ $key }` não encontrada no documento ligado

# ── Validação de alias ────────────────────────────────────────────────────
err-alias-name-empty = o nome do alias não pode estar vazio
err-alias-has-dot = o nome do alias não pode conter '.'
err-alias-has-fragment = o nome do alias não pode conter '#'
err-alias-value-fragment = o valor do alias pode conter no máximo um fragmento DID-URL não vazio
err-alias-value-path = o valor do alias deve ser um DID did:ma:<ipns> ou DID-URL (sem caminho)
err-alias-not-did = o valor do alias deve começar com did:ma:
err-unknown-alias = alias desconhecido: @{ $name }
err-bare-did = esperado did:ma:<ipns> puro (sem fragmento ou caminho), recebido { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Guardar
btn-eval = Executar
btn-cancel = Cancelar
msg-jobs-cancelled = trabalhos cancelados
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
discover-hint-endpoint-not-found = Dica: endpoint não encontrado. Verifique se 間 está em execução e expõe /status.json na porta 5003.
discover-hint-server-error = Dica: o runtime respondeu com erro de servidor. Verifique os logs de 間 e tente novamente.
discover-hint-network = Dica: problema de rede/conectividade. Inicie 間, verifique se localhost:5003 está acessível e permita acesso HTTP local no navegador.
discover-hint-generic = Dica: verifique se 間 e IPFS Desktop estão em execução e tente `.ma` novamente.
discover-success = 間 descoberto em { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma criado — execute '.my.identity!publish @ma' para publicar a sua identidade.
claim-success = Tempo de execução reclamado para { $did }
claim-conflict = Tempo de execução já reclamado por outra identidade
claim-already-owned = Runtime já reclamado por esta identidade
claim-http-failed = reclamação falhou: HTTP { $status }
claim-error = reclamação falhou: { $e }
claim-no-session = não autenticado; inicie sessão primeiro para reclamar o tempo de execução
runtime-no-verb = nenhum verbo `{ $verb }` para { $path }

# ── Verbos — controlo de acesso ───────────────────────────────────────────
acl-reset = .my.acl reposto (completamente aberto)
err-persist = erro ao guardar: { $e }
acl-no-verb = nenhum verbo `{ $verb }` para .my.acl

# ── Verbos — identidade ───────────────────────────────────────────────────
publish-usage = utilização: .my.identity!publish <did-ou-alias>
identity-exported = Pacote descarregado como { $filename }
identity-export-failed = Exportação falhou: { $e }

# ── Verbos — documentos ───────────────────────────────────────────────────
doc-content-empty = { $path } está vazio
doc-save-first = { $path } está vazio — guarde primeiro
doc-missing-name = nome do documento em falta
doc-publish-usage = utilização: .my.doc.<nome>!publish <editor>
doc-publish-ipld-usage = utilização: .my.doc.<nome>!publish-ipld <editor>
doc-publish-failed = publicação { $path }: { $e }
doc-publish-ipld-failed = publicação IPLD { $path }: { $e }
doc-publish-error-detail = publicação falhou [{ $code }]: { $err }
doc-publish-error-hint = Dica: { $hint }
doc-publish-hint-session = entre novamente para que ego possa acessar suas chaves de identidade
doc-publish-hint-target = use um DID de publicador válido ou um alias que resolva para did:ma:<ipns> sem fragmento
doc-publish-hint-network = verifique se o runtime 間 e o IPFS estão acessíveis e tente novamente
doc-publish-hint-resolve = verifique se o documento DID do publicador foi publicado e contém um endpoint acessível
doc-publish-hint-acl = peça ao operador do publicador para permitir seu DID na ACL
doc-publish-hint-runtime = o runtime/plugin rejeitou a solicitação; inspecione o motivo e tente novamente após corrigir entidade/runtime
doc-publish-hint-ipfs = verifique a saúde local do Kubo/IPFS e o status do runtime publicador
doc-publish-hint-unknown = consulte os logs do runtime para a causa detalhada e tente novamente
doc-store-sent = pedido de armazenamento enviado ({ $id }) → { $publisher }; CID chegará por resposta RPC
doc-ipld-store-sent = pedido de armazenamento IPLD enviado ({ $id }) → { $publisher }; CID chegará por resposta RPC
doc-fetch-done = { $cid } obtido → { $path } (não executado)
doc-fetch-failed = obtenção { $cid }: { $e }
doc-fetch-usage = utilização: .my.doc.<nome>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid não está definido
doc-no-verb = nenhum verbo `{ $verb }` para { $path }
path-no-verb = nenhum verbo `{ $verb }` para { $path }

# ── Texto de ajuda — cabeçalhos ───────────────────────────────────────────
help-header-zion = ── comandos zion ──────────────────────────────────────────────────────────
help-header-messaging = ── mensagens ─────────────────────────────────────────────────────────────
help-header-config = ── gramática de configuração local ──────────────────────────────────────
help-header-common = ── caminhos comuns ───────────────────────────────────────────────────────
help-header-inbox = ── caixa de entrada ─────────────────────────────────────────────────────
help-header-documents = ── documentos ───────────────────────────────────────────────────────────
help-header-i18n = ── idioma ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entrando no 間-espaço ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        este texto
help-cmd-clear =   .clear                       limpar o terminal
help-cmd-panic =   .panic                       último recurso — use se estiver em apuros
help-cmd-history =   .history [n]                 histórico de comandos (duplicatas consecutivas mescladas); n opcional mostra apenas as últimas n linhas
help-cmd-logout =   .logout                      terminar sessão
help-cmd-batch =   .batch                       avaliar documento rascunho em paralelo
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         avaliar documento rascunho linha por linha

help-msg-echo =   @alias                       mostrar DID/DID-URL resolvido (nenhuma mensagem enviada)
help-msg-send =   @alias!msg body / @alias:verb args           enviar mensagem / RPC para ator
help-msg-fragment =   @alias#fragment:verb body  enviar para alias com fragmento DID explícito
help-msg-escape =   \@name                       @name literal (sem pesquisa de alias)


help-config-get =   .path                        obter valor de folha ou listar subárvore
help-config-filter =   .path [nome]                 listar nomes de chaves filhas que contêm nome
help-config-full =   .path. [nome]                listar valores completos da subárvore que contêm nome
help-config-set =   .path: value                 definir folha
help-config-delete =   .path:                       eliminar folha ou subárvore
help-config-verb =   .path!verb [args]            executar verbo local

help-my =   .my                          mostrar toda a configuração pessoal
help-aliases =   .my.aliases                  listar aliases
help-aliases-set =   .my.aliases.<name>: <did-url>    adicionar/atualizar alias (DID ou DID-URL)
help-aliases-del =   .my.aliases.<name>:          remover alias
help-runtime-discover =   .ma: claim [port]          descobrir tempo de execução local e criar alias @ma
help-runtime-claim =   .ma: claim [port]             reclamar tempo de execução com o seu DID
help-identity =   .my.identity                 mostrar configuração de identidade
help-identity-did =   .my.identity.did             mostrar DID próprio (só de leitura)
help-identity-publish =   .my.identity!publish @pub    publicar DID próprio através do serviço editor
help-identity-export =   .my.identity!export          descarregar o próprio pacote de identidade
help-config-path =   .config                      mostrar todas as entradas .config.*

help-inbox =   .my.inbox                    listar caixa de entrada (vista de subárvore)
help-inbox-n =   .my.inbox.N                  mostrar campos da entrada N
help-inbox-from =   .my.inbox.N.from             DID do remetente para a entrada N
help-inbox-reply =   .my.inbox.N!reply [body]     enviar resposta (abre editor sem corpo)
help-inbox-open =   .my.inbox.N!open             abrir conteúdo em editor só de leitura
help-inbox-del =   .my.inbox.N:                 eliminar entrada N
help-inbox-delall =   .my.inbox:                   eliminar todas as entradas da caixa de entrada
help-inbox-flush =   .my.inbox!flush              imprimir todas as entradas no terminal
help-inbox-filter =   .my.inbox!filter @who        mostrar apenas entradas de @who
help-inbox-traverse =   .my.inbox.N.sender.<campo>  percorrer documento DID do remetente de forma diferida

help-doc-edit =   .my.doc.<nome>!edit           abrir editor com conteúdo guardado
help-doc-edit-cid =   .my.doc.<nome>!edit /ipfs/<cid>     obter CID, abrir para revisão
help-doc-eval =   .my.doc.<nome>!eval           executar conteúdo guardado linha por linha
help-doc-publish =   .my.doc.<nome>!publish @pub   guardar como blob bruto (todos os tipos)
help-doc-publish-ipld =   .my.doc.<nome>!publish-ipld @pub  guardar YAML como nó IPLD DAG-CBOR estruturado
help-doc-fetch =   .my.doc.<nome>!fetch /ipfs/<cid>    importar conteúdo CID (sem execução)
help-doc-cid =   .my.doc.<nome>!cid            mostrar CID guardado
help-doc-del =   .my.doc.<nome>:              eliminar documento

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n armazena a preferência de idioma vinculada à sua identidade.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               listar códigos de idioma disponíveis

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = A sala 間 é o espaço entre identidades 間. ma permite que essas identidades se encontrem e se comuniquem; quando a tua identidade está publicada, podes participar.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   ligar ao teu runtime 間 local, ler /status.json e guardar .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publicar o teu documento DID para que outros resolvam as tuas chaves e endpoint
help-ma-security = A fronteira de confiança mais clara é o teu próprio runtime 間 com o teu próprio IPFS Desktop/Kubo. Um publisher remoto pode ser útil, mas então dependes do serviço de outra pessoa.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             como entrar na sala 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Quando a tua identidade é conhecida, .enter @ma deixa-te entrar em 間. Encontra um mundo, entra nele e participa a partir daí.
help-ma-entry-steps = Inicia o IPFS Desktop e o ma, depois executa .ma. Publica com .my.identity!publish @ma, encontra um mundo e entra com .enter @ma.
help-ma-entry-command =   .enter @ma                  entrar em 間 através do runtime @ma
help-ma-entry-toggle =   .enter                       ativar ou desativar o foco da sala; a tua identidade continua ativa
help-ma-entry-url =   ?enter=<runtime>             entrar depois do login a partir de uma URL partilhada

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
yaml-serialise-error = Erro de serialização YAML: { $e }
edit-reply-invalid = Resposta de edição inválida
doc-publish-ipld-error = Publicação IPLD falhou: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Erro ao guardar limpeza da caixa de entrada: { $e }
err-config-load = Erro ao carregar configuração: { $e }
err-lang-persist = Erro ao guardar idioma: { $e }
err-history-parse = Erro de análise do histórico: { $e }
err-history-load = Erro ao carregar histórico: { $e }
err-history-count-invalid = o número do histórico deve ser um inteiro positivo
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
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = perfil criptografado e enviado ao IPFS; o documento DID será atualizado quando o CID chegar
profile-publish-done = perfil publicado — documento DID atualizado com o CID ma.agent
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identidade já publicada — perfil atualizado
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = conteúdo binário (não exibido)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nenhum)
profiles-deleted = perfil { $name } excluído
profiles-not-found = perfil não encontrado: { $name }

# -- Help topics index
help-header-topics = -- tópicos -- digite .help/<topic> para detalhes
help-topic-msg =   .help/msg                    mensagens
help-topic-ma = .help/ma                     間-espaço, publicação e entrada
help-topic-path = .help/path                   gramática de caminho de ponto local
help-topic-my =   .help/my                     config pessoal
help-topic-inbox =   .help/inbox                  caixa de entrada
help-topic-doc =   .help/doc                    documentos
help-topic-actor =   .help/actor                  actor remoto
help-topic-zscheme =   .help/zscheme               expressões Scheme embutidas e documentação
help-topic-url =   .help/url                    abrir zion via um link URL
help-topic-i18n = .help/i18n                   preferência de idioma para sua identidade
help-unknown-topic =   .help/{ $topic }: tópico desconhecido

# -- Help actor section
help-header-actor = -- atores remotos
help-actor-echo =   @actor                       mostrar DID resolvido
help-actor-text = @actor[#entity]!msg|!say|!emote body         enviar mensagem direta/chat/emote
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
help-header-url = ── parâmetros de URL ───────────────────────────────────────────────────────
help-url-intro =   Partilha um link que abre zion com o destinatário pré-preenchido:
help-url-msg =   ?msg=<did>                   pré-preenche: @<did>!msg (mensagem de texto)
help-url-say =   ?say=<did>                   pré-preenche: @<did>!say (verbo say)
help-url-emote =   ?emote=<did>                 pré-preenche: @<did>!emote (verbo emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             entre no mundo do tempo de execução após o login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   O campo é pré-preenchido mas não enviado — prime Enter para enviar.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publicar a sua identidade na rede
help-header-publish = ── publicar identidade ──────────────────────────────────────────────────────
help-publish-intro = Publicar torna a sua identidade encontrável na rede. Outros podem pesquisar o seu DID para o contactar.
help-publish-ma = Para publicar, precisa de 間 (runtime local) instalado. Liga ego ao IPFS/IPNS em seu nome.
help-publish-steps = Passos: execute '.ma: claim [port]' para detetar o seu 間 local, depois '.my.identity!publish @ma'.
help-publish-without = Sem publicar, outros não conseguem contactá-lo — mesmo que conheçam o seu DID, não conseguem resolver o seu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = especifique um nome de perfil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Coletando lote — digite comandos, termine com .batch
batch-already-collecting = Já coletando um lote – termine primeiro com .batch
batch-empty = O lote estava vazio – nada para executar
batch-running = Executando lote…
batch-step-timeout = a etapa do lote expirou

batch-done = Lote concluído em { $secs }s — { $steps } passos
batch-done-error = Lote concluído com erros em { $secs }s — { $steps } passos
msg-timeout = Mensagem expirou (sem resposta em 60s)
err-unknown-command = comando desconhecido: { $path }
err-read-only-path = { $path } é somente leitura
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        avaliar documento rascunho em paralelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Falha ao obter CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID inválido: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Aviso: A sua chave privada IPNS será enviada a este ambiente de execução para publicar a sua identidade. Use apenas um ambiente de execução em que confie totalmente.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme avalia expressões Scheme embutidas em comandos zion e insere o resultado na linha antes de a enviar.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    exemplo embutido; envia "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             as definições persistem durante a sessão de login atual
help-zscheme-doc = Documentação: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Gateway IPFS local (requer exceção do navegador)

tab-config = Definições
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
