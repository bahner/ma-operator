# zion — lang belta (Belter Creole)
lang-name = Lang Belta
# From The Expanse, constructed by linguist Nick Farmer.
# ISO 639-3: qbc (local/private use code)

# ── Pej ingang ────────────────────────────────────────────────────────────
tab-login = ingang
tab-new-identity = nyu selfmang
tab-import-profile = bringin profayel
label-passphrase = sekrit-lang
label-username = mang-nim
label-confirm-passphrase = sikkina sekrit-lang
label-did = DID
label-profile-cid = profayel CID
label-or-file = o fayl
btn-login = ingang
btn-export = tekout
btn-generate = mek
btn-new-endpoint = nyu boneway
btn-import-profile = bringin profayel
passphrase-warning = Losh sekrit-lang = losh selfmang. Na du finyish wit nating.
import-profile-help = Bringin profayel wit CID o fayl. Im gonya sekrit-lang kopeng fo pablikesim.
import-profile-detected-user = Profayel da fo: { $name }
status-unlocking = uddering...
status-generating = mekking nyu selfmang...
status-reading-file = lit fayl...
status-fetching-profile = dey bring profayel koming IPFS...
status-imported = '{ $name }' bringin — go ingang tab
status-importing-profile = bringinéfosho profayel...
profile-import-done = profayel bringin fo '{ $name }' — { $n } ki loding
error-wrong-passphrase = sekrit-lang da no gut: { $e }
error-identity-not-found = selfmang '{ $name }' na finyish wit
error-username-required = mang-nim gonya kom
error-passphrase-required = sekrit-lang gonya kom
error-passphrases-no-match = sekrit-lang du na kopeng
error-profile-source-required = tekout CID o upfayel fayl
error-did-required = put in DID fo yu
error-profile-fetch = nating kom fo profayel: { $e }
error-profile-no-username = profayel na hesh mang-nim
error-profile-no-identity = selfmang '{ $name }' na finyish wit — bringin selfmang fosh

# ── Sistem koments terminal ────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ingangé wit { $username }
msg-type-help = Showxa .help fo kowl komands.
msg-connecting = konekting to iroh...
msg-iroh-ready = iroh endpoint gútegow
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID push out, local ma ({ $url })
msg-ma-connecting-matrix = du ta xitim fo konek to da 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = local 間 ta klaim
msg-local-ma-already-claimed = local 間 ta klaim bifo
msg-local-ma-claim-failed = local 間 klaim na go
msg-identity-not-published = Inyalowda pashang nowit kewe na la tube — si ma besh da gut, run '.ma [port]' den '.my.identity!publish @ma'. Slip '.help/publish' fo detay.
msg-blocked = ⊗ hamma [{ $cap }]: { $from }
msg-focus-cleared = fokus na du
msg-focusing = fokus { $did } as { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } na du ({ $count } tenye)
msg-read-only = { $path } lit-seng oyedeng
msg-subtree-set = { $path } im gova-kopeng; na du seting
msg-ancestor-leaf = { $path } gova im lef; na du dabali
msg-key-not-found = ki na finyish wit: { $path }
msg-no-match = nating kopeng
msg-link-not-connected = hámfalla du fech link: na konekt
msg-link-fetch-error = hámfalla du fech link: { $e }
msg-link-key-not-found = ki `{ $key }` na finyish wit im link-dok

# ── Alias falaare ─────────────────────────────────────────────────────────
err-alias-name-empty = alias nim na owkwa im nating
err-alias-has-dot = alias nim na tenye '.'
err-alias-has-fragment = alias nim na tenye '#'
err-alias-value-fragment = alias sanda gonya na mowt wang non-empty DID-URL fragment
err-alias-value-path = alias sanda gonya did:ma:<ipns> DID unte DID-URL (na path)
err-alias-not-did = alias sanda gonya showxa did:ma: diching
err-unknown-alias = alias na sasa: @{ $name }
err-bare-did = bare did:ma:<ipns> kolowda (na wit fragment oyedeng path), towa { $did }

# ── Editow ────────────────────────────────────────────────────────────────
btn-save = hol
btn-eval = du
btn-cancel = na-du
btn-close = tek-out
btn-reply = bek-showxa
btn-publish = sendowt
btn-publish-ipld = sendowt IPLD
msg-reply-sent = bek-showxa gonya kom
msg-reply-failed = bek-showxa hámfalla: { $e }
msg-entity-publish-sent = entity { $name }: sendowt gonya kom
msg-entity-publish-failed = sendowt entity hámfalla: { $e }
msg-kind-publish-failed = kind publish fail: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: sendowt gonya kom
msg-field-publish-failed = sendowt fild hámfalla: { $e }
msg-acl-publish-sent = runtime ACL: sendowt gonya kom
msg-crud-edit-publish-sent = { $path }: sendowt gonya kom
msg-acl-publish-failed = sendowt runtime ACL hámfalla: { $e }
msg-yaml-error = YAML hámfalla: { $e }
msg-editor-saved = { $path }:hol
msg-fetch-review = { $cid } fech finyish — pensa kowl bifo du
msg-fetch-failed = feching { $cid }: { $e }

# ── Du — inbox ────────────────────────────────────────────────────────────
inbox-empty = inbox im nating
inbox-entry-not-found = inbox tenye { $n } na finyish wit
inbox-no-message-id = inbox tenye { $n } na tenye message_id
inbox-no-verb = na du `{ $verb }` fo inbox tenye { $n }
inbox-filter-no-arg = filtew nid DID wa alias argument
inbox-filter-empty = nating showxa fom { $did }

# ── Du — runtime ──────────────────────────────────────────────────────────
discover-fetch-failed = diskova hámfalla wit { $url }: { $e }
discover-json-error = diskova hámfalla: mal JSON from { $url }: { $e }
discover-missing-did = diskova hámfalla: status.json na tenye `did`
discover-invalid-did = diskova hámfalla: `did` gonya showxa did:ma: diching, towa `{ $did }`
discover-no-endpoint = diskova beleti: `endpoint_id` na finyish wit status.json; DID oyedeng hol
discover-hint-endpoint-not-found = Hint: endpoint na du find. Check im `ma` show /status.json na port 5003.
discover-hint-server-error = Hint: runtime gi server error. Check `ma` log im en try again.
discover-hint-network = Dica: problema de rede/conectividade. Inicie 40, verifique se localhost:5003 está acessível e permita acesso local 101 no navegador.
discover-hint-generic = Dica: verifique se 13 e 25 Desktop estão em execução e tente novamente 59.
discover-success = ma diskova at { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias kowl da — run '.my.identity!publish @ma' fo pashang inyalowda setara.
claim-success = Runtime klaim fo { $did }
claim-conflict = Runtime ta klaim by bifo selfmang
claim-already-owned = Runtime ta klaim by dis selfmang
claim-http-failed = kolowda hámfalla: HTTP { $status }
claim-error = kolowda hámfalla: { $e }
claim-no-session = na ingang; ingang diching fo klaim runtime
runtime-no-verb = na du `{ $verb }` fo { $path }

# ── Du — ACL ──────────────────────────────────────────────────────────────
acl-reset = .my.acl reset finyish (udda kowl-wit)
acl-persist-error = hámfalla hol: { $e }
acl-no-verb = na du `{ $verb }` fo .my.acl

# ── Du — selfmang ─────────────────────────────────────────────────────────
publish-usage = showxa: .my.identity!publish <did-oyedeng-alias>
identity-exported = Bundle downye as { $filename }
identity-export-failed = Export bombauch: { $e }

# ── Du — dokuments ────────────────────────────────────────────────────────
doc-content-empty = { $path }.content im nating
doc-save-first = { $path }.content im nating — hol diching
doc-missing-name = dokument nim na finyish
doc-publish-usage = showxa: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = showxa: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = sendowt { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publish hámfalla [{ $code }]: { $err }
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = faça login novamente para que o ego possa acessar suas chaves de selfmang
doc-publish-hint-target = use um DID ou alias de editor válido que resolva apenas 57
doc-publish-hint-network = verifique se o tempo de execução 7 e 22 estão acessíveis e tente novamente
doc-publish-hint-resolve = verifique se o documento DID do editor foi sendowt e contém um endpoint acessível
doc-publish-hint-acl = peça ao operador do editor para permitir seu DID em 48
doc-publish-hint-runtime = runtime/plugin rejeitou a solicitação; inspecione o motivo e tente novamente após corrigir a entidade/tempo de execução
doc-publish-hint-ipfs = verifique a integridade local do 12/17 e o status do tempo de execução do editor
doc-publish-hint-unknown = inspecione os logs de tempo de execução para obter a causa detalhada e tente novamente
doc-store-sent = hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-ipld-store-sent = IPLD hol kolowda sendowt ({ $id }) → { $publisher }; CID gonya kom wit RPC bek-showxa
doc-fetch-done = { $cid } fech finyish → { $path }.content (na du-im)
doc-fetch-failed = feching { $cid }: { $e }
doc-fetch-usage = showxa: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid na hol
doc-no-verb = na du `{ $verb }` fo { $path }
path-no-verb = na du `{ $verb }` fo { $path }

# ── Halp — gova ──────────────────────────────────────────────────────────
help-header-zion = ── zion komands ────────────────────────────────────────────────────────────
help-header-messaging = ── showxa ───────────────────────────────────────────────────────────────
help-header-config = ── konfig naxwe ──────────────────────────────────────────────────────────
help-header-common = ── kowl paj du ──────────────────────────────────────────────────────────
help-header-inbox = ── caixa de entrada ──────────────────────────────── ────────────────────────────────
help-header-documents = ── dokuments ────────────────────────────────────────────────────────────
help-header-i18n = ── idioma ────────────────────────────── ───────────────────────────────
help-header-ma = ── Espaço 3 ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── entrando no 間-espaço ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Halp — zion komands ───────────────────────────────────────────────────
help-cmd-help =   .help                        dis lit-pej
help-cmd-clear =   .clear                       kel terminal
help-cmd-panic =   .panic                       owkwa keting — du wit problem
help-cmd-history =   .history                     komand histori (sekwens duplikat mash bikik)
help-cmd-logout =   .logout                      tek-out
help-cmd-batch =   .batch                       run scratch document parallel
help-cmd-batch-sync =   .batch:sync / .batch         run scratch document line by line

# ── Halp — showxa ─────────────────────────────────────────────────────────
help-msg-echo =   @alias                       lit resolved DID/DID-URL (na send message)
help-msg-send =   @alias!msg body / @alias:verb args           showxa message / RPC fo actor
help-msg-fragment =   @alias#fragment:verb body  showxa wit DID fragment cler
help-msg-escape =   \@name                       @name leshi (na du alias)

# ── Halp — fokus mod ──────────────────────────────────────────────────────

# ── Halp — konfig naxwe ───────────────────────────────────────────────────
help-config-get =   .path                        sasa lef sanda oyedeng lit gova-kopeng
help-config-filter =   .path value                  kolowda (hamma wit sanda)
help-config-set =   .path: value                 set lef
help-config-delete =   .path:                       na-du lef oyedeng gova-kopeng
help-config-verb =   .path!verb [args]            kol lokal verb

# ── Halp — kowl paj du ───────────────────────────────────────────────────
help-my =   .my                          lit kowl selfmang konfig
help-aliases =   .my.aliases                  lit alias kowl
help-aliases-set =   .my.aliases.<name>: <did-url> mek/update alias (DID unte DID-URL)
help-aliases-del =   .my.aliases.<name>:          na-du alias
help-runtime-discover =   .ma [port]          diskova lokal runtime unte mek @ma alias
help-runtime-claim =   .ma [port]             klaim runtime wit yu DID
help-identity =   .my.identity                 lit selfmang konfig
help-identity-did =   .my.identity.did             lit yu DID (lit-seng oyedeng)
help-identity-publish =   .my.identity!publish @pub    sendowt DID wit publishe
help-identity-export =   .my.identity!export          downye yu owp identity bundle
help-config-path =   .config                      lit kowl .config.* tenye

# ── Halp — inbox ─────────────────────────────────────────────────────────
help-inbox =   .my.inbox                    lit inbox (gova-kopeng lit)
help-inbox-n =   .my.inbox.N                  lit tenye N fild kowl
help-inbox-from =   .my.inbox.N.from             DID showxa-mang tenye N
help-inbox-reply =   .my.inbox.N!reply [body]     showxa bek-showxa (editow udda na wit body)
help-inbox-open =   .my.inbox.N!open             udda mbeɗe lit-seng editow
help-inbox-del =   .my.inbox.N:                 na-du tenye N
help-inbox-delall =   .my.inbox:                   na-du kowl inbox tenye
help-inbox-flush =   .my.inbox!flush              lit kowl tenye terminal
help-inbox-filter =   .my.inbox!filter @who        lit kowl tenye fom @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   mali-du DID dok showxa-mang

# ── Halp — dokuments ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           udda editow wit hol mbeɗe
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     fech CID, udda lit-seng oyedeng
help-doc-eval =   .my.doc.<name>!eval           du hol mbeɗe lain-wit-lain
help-doc-publish =   .my.doc.<name>!publish @pub   hol as raw blob (kowl tip)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  hol YAML as IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bringin CID mbeɗe (na du-im)
help-doc-cid =   .my.doc.<name>!cid            lit hol CID
help-doc-del =   .my.doc.<name>:              na-du dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n armazena a preferência de idioma vinculada à sua selfmang.
help-i18n-set = .my.i18n: <code>             escolha o idioma que 20 usa para esta selfmang
help-i18n-list = .my.i18n!list               listar códigos de idioma disponíveis

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Da 間 room im da space between 間 identities. ma du da identities find each other and talk; once your identity im published, you can join.
help-ma-command = .ma [port]                   conecte-se ao seu tempo de execução local 22, leia /status.json e salve .QXQ1XQX.ctx.*
help-ma-publish = .my.identity!publish @ma     publique seu documento DID para que outros possam resolver suas chaves e endpoint
help-ma-security = Da clearest trust boundary im your own ma runtime with your own IPFS Desktop/Kubo. Remote publisher can help, but then you depend on another service.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             how to enter da 間 room

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = When your identity im known, .enter @ma let you step into 間. Find a world, go in, and join from there.
help-ma-entry-steps = Inicie 6 Desktop e 23, depois execute .QXQ2XQX. Publicar com .my.identity!publish @QXQ3XQX, encontre um mundo e entre com .enter @QXQ4XQX.
help-ma-entry-command =   .enter @ma                  enter 間 through da @ma runtime
help-ma-entry-toggle =   .enter                       toggle da room focus on or off; yer identity stays active
help-ma-entry-url =   ?enter=<runtime>             enter after login from shared URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Belter languages (.my.i18n: <code> fo set):
err-lang-not-found = langue introuvable : { $lang }

msg-send-failed = sako nah bringin: { $e }
msg-not-logged-in = inyalowda nah owkwa

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erro de análise YAML: 18
yaml-not-mapping = YAML mus bi mapping (keya: valyu pɛr); plen tèks an skalas no kɛn bi stòrd as DAG-CBOR
dagcbor-encode-error = Erro de codificação DAG-CBOR: 23
cbor-decode-error = Erro de decodificação CBOR: 19
cbor-json-error = Erro CBOR para 8: 20
yaml-serialize-error = Erro de serialização YAML: 22
edit-reply-invalid = resposta de edição inválida
doc-publish-ipld-error = IPLD publish failed: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = a remoção da caixa de entrada persiste: 21
err-config-load = erro de carregamento de configuração: 19
err-lang-persist = persistir idioma: 14
err-history-parse = erro de análise de histórico: 21
err-history-load = erro de carregamento de histórico: 20
err-ipfs-reply-decode = Falha na decodificação da resposta IPFS: 26
err-edit-cbor = editar erro 5: 17
err-popup-blocked = popup block by browser
status-publishing = publishin

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = keng ando gonya
rpc-error-detail = fot: { $detail }
msg-new-message = ← [{ $from }] nyú mesej — { $count } in de boks
msg-chat = { $sender } sa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } go sabe { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } kopeng insid.
room-leave = * { $name } go owt.
room-drop  = * { $name } drip { $thing }.
room-take  = * { $name } pick up { $thing }.
err-edit-decode-failed = edit: fot decode: { $e }
err-edit-fetch-failed = edit: fot fetch: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no session kopeng — no pensa dele profil
profile-delete-error = profil dele bek no go: { $e }
profile-wrong-user = não é possível definir 11 para outro profayel — apenas o seu
profile-wrong-user-name = não é possível definir 11 para 19 – apenas seu próprio profayel
profile-no-ma = nenhum tempo de execução 3 configurado - execute 31 primeiro
profile-no-cid = nenhum 3 armazenado para este profayel — execute 37 primeiro
profile-no-cid-in-doc = nenhum profayel 11 encontrado no documento DID — execute 43 primeiro
profile-publish-sent = profile du encrypt im send na IPFS; DID doc pensa update when CID kom
profile-publish-done = profile publish — DID doc update wit ma.agent CID
profile-publish-failed = falha na publicação do profayel: 24
profile-fetch-done = profayel obtido — chaves 18 carregadas de 43
profile-fetch-failed = falha na busca do profayel: 22
msg-identity-exists = selfmang já publicada — profayel atualizado
profile-import-exists = o profayel 8 já existe — exclua-o primeiro
profile-import-wrong-user = arquivo contém profayel 22, esperado 42

# -- CID content operations
cid-op-binary = conteúdo binário (não exibido)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = falha ao buscar conteúdo: 25
cid-op-unknown = operação de conteúdo desconhecido: 27
cid-op-wc = Linhas { $lines } Palavras 18 Caracteres 36
profiles-empty = (nenhum)
profiles-deleted = profil { $name } dele go
profiles-not-found = profil no found: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for detail
help-topic-msg =   .help/msg                    message-talk
help-topic-ma = .help/ma                     ma-espaço, publicação e entrada
help-topic-path = .help/path                   gramática de caminho de ponto local
help-topic-my =   .help/my                     own config
help-topic-inbox =   .help/inbox                  message box
help-topic-doc =   .help/doc                    docu dem
help-topic-actor =   .help/actor                  far actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: topic na du sabe

# -- Help actor section
help-header-actor = -- remote actor dem
help-actor-echo =   @actor                       show DID wey resolve
help-actor-text = @actor[#entity]!msg|!say|!emote body         enviar showxa direta/chat/emote
help-actor-ping = @actor:ping                  ping de vivacidade
help-actor-entities =   @actor/entities              show entity-list
help-actor-entities-get = @actor/entities/<n>          obter nó de entidade
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   definir entidade por referência 14
help-actor-entities-edit =   @actor/entities/<n>!edit     change entity
help-actor-entities-del = @actor/entities/<n>:         excluir entidade
help-actor-config-get =   @actor/config/<key>          take config value
help-actor-config-set =   @actor/config/<key>: val     put config value
help-actor-acl = @actor/acl                   obter 4
help-actor-acl-edit =   @actor/acl!edit              change ACL
help-actor-fragment =   @actor#entity                send go plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC go plugin
help-header-cid-ops = ── Chamadas do ator 3 ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  ligue para uma entidade 15 de 24 e aguarde sua resposta
help-actor-head = (@actor/path)                buscar conteúdo CRUD remoto de 31
help-actor-tail = (<bafy...>)                  incluir e avaliar 21 de um 36 41
help-actor-wc = (define x (@actor:verb arg))  mantenha as respostas 5 no ambiente da sessão
help-actor-wc-l = .my.scheme.ma!edit           editar auxiliares 11 salvos para esta selfmang

help-topic-url =   .help/url                    open zion tru URL peng
help-topic-i18n = .help/i18n                   preferência de idioma para sua selfmang
help-header-url = ── URL pamitim ──────────────────────────────────────────────────────────────────
help-url-intro =   Fo peng fo open zion wit belter wating already fill:
help-url-msg =   ?msg=<did>                   fill befo: @<did>!msg (basic palabras)
help-url-say =   ?say=<did>                   fill befo: @<did>!say (say verd)
help-url-emote =   ?emote=<did>                 fill befo: @<did>!emote (emote verd)
help-url-ma = ?ma=<did-or-url>              pré-preencher tempo de execução DID / URL 23
help-url-enter = ?enter=<runtime>             entre no mundo do tempo de execução após o login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Di input fill but no sen — peng Enter fo sen.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                pashang inyalowda setara to da ring
help-header-publish = ── pashang setara ───────────────────────────────────────────────────────────
help-publish-intro = Pashang da setara tube-kewe na la ring. Felota mang DID inyalowda setara fo da kontak.
help-publish-ma = Fo pashang, ma (local runtime) besh da gut. Im kang ego wit IPFS/IPNS fo inyalowda.
help-publish-steps = Stap: run '.ma [port]' fo find local ma, den '.my.identity!publish @ma'.
help-publish-without = Wit no pashang, felota no kang reach you — even si dem know you DID, dem no kang solve you endpoint.
profile-fetch-did-resolve-failed = DID ainda não sendowt – execute 28 primeiro e depois 67 seu profayel
profile-update-done = profayel atualizado – chaves 18 mescladas de 43
profile-delete-needs-name = set profile nem: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Coletando lote — digite komands, termine com .batch
batch-already-collecting = Já coletando um lote – termine primeiro com .batch
batch-empty = O lote estava vazio – nada para executar
batch-running = Batch dey run…
batch-step-timeout = a etapa do lote expirou

batch-done = Batch don finish for { $secs }s — { $steps } steps
batch-done-error = Batch finish with errors for { $secs }s — { $steps } steps
msg-timeout = Message time don pass (no reply for 60s)
err-unknown-command = komang na du sabe: { $path }
err-read-only-path = { $path } pensa read-only
help-cmd-batch-async =   .batch:async / .batch        run scratch document parallel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Pensa CID { $cid } na kang: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Dat na proper CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Belte wok: Da IPNS priv-key du senye go na dis runtime fo pashang identity. Kowl yuse runtime du fulding trust, walowda.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
