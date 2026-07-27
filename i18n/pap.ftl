# zion — Papiamentu
lang-name = Papiamentu
label-nick = sobrenòmber
new-identity-nick-help = Skohe un sobrenòmber pa ma-space. Ta solamente un sobrenòmber, i bo por kambi'é ki ora ku bo ke.
error-nick-required = sobrenòmber ta obligatorio
error-nick-invalid = sobrenòmber no por tin spasio òf @

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = identidad nobo
tab-import-profile = importa perfil
label-passphrase = pasfrasa
label-username = nòmber di yuzador
label-confirm-passphrase = konfirmá pasfrasa
label-did = DID
label-profile-cid = CID di perfil
label-or-file = of fichá
btn-login = login
btn-export = exportá
btn-generate = generá
btn-new-endpoint = nobo endpoint
btn-import-profile = importa perfil
passphrase-warning = Pèrdé pasfrasa = pèrdé identidad. No tin rekuperashon.
import-profile-help = Importa un perfil via CID of fichá. Bo mester di e mesun pasfráze usa riba publikashon.
import-profile-detected-user = Perfil ta di: { $name }
status-unlocking = desblokeando...
status-generating = generando identidad...
status-reading-file = leyendo arkivo...
status-fetching-profile = ta haña perfil di IPFS...
status-imported = importá '{ $name }' — kambia na tab Login
status-importing-profile = ta importando perfil...
profile-import-done = perfil importá pa '{ $name }' — { $n } yabi kargá
error-wrong-passphrase = pasfrasa robes: { $e }
error-identity-not-found = identidad '{ $name }' no a haña
error-username-required = nòmber di yuzador ta nesesario
error-passphrase-required = pasfrasa ta nesesario
error-passphrases-no-match = pasfrasa nan no ta igual
error-profile-source-required = duna un CID of upload un fichá
error-did-required = mete bo DID
error-profile-fetch = no por haña perfil: { $e }
error-profile-no-username = perfil no tin nomber di usuario
error-profile-no-identity = identidad '{ $name }' no hayá — importa identidad prome

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — login komo { $username }
msg-type-help = Tiki .help pa un lista di komando.
msg-getting-started = Purba: say Hello world, look, .help, òf help.
msg-connecting = konektando na iroh...
msg-iroh-ready = punto iroh ta listu
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publiká via ma lokal ({ $url })
msg-identity-publication-propagating = Publikashon di identidat ta propaga ainda; entry ta retrasá: { $e }
msg-identity-first-publish = Ta publiká identidat pa promé biaha. Esaki por tuma te { $seconds } sekònde.
msg-ma-connecting-matrix = ta purba konektábo ku e 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 lokal reklamá
msg-local-ma-already-claimed = 間 lokal ya reklamá
msg-local-ma-claim-failed = no por a reklamá 間 lokal
msg-identity-not-published = Identidad no a haña na internet — si ma ta instalá lokalmente, drenta '.ma [port]' i despues '.my.identity!publish @ma'. Tik '.help/publish' pa detaljenan.
msg-blocked = ⊗ blokea [{ $cap }]: { $from }
msg-focus-cleared = foko limpiá
msg-focusing = foko { $did } komo { $prompt }
msg-set = { $path }: { $value }
msg-deleted = bora { $path } ({ $count } entrada)
msg-read-only = { $path } ta lektura solamente
msg-subtree-set = { $path } ta un subarbol; negando pa shetá
msg-ancestor-leaf = un antesesor di { $path } ta un hoja; negando pa kobrí
msg-key-not-found = yabi no haña: { $path }
msg-no-match = no tin koresppondenshia
msg-link-not-connected = fayo bisitá link: no ta konektá
msg-link-fetch-error = fayo bisitá link: { $e }
msg-link-key-not-found = yabi `{ $key }` no haña den dokumentu linkeá

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = nòmber di alias no por ta bashi
err-alias-has-dot = nòmber di alias no por get '.'
err-alias-has-fragment = nòmber di alias no por get '#'
err-alias-value-fragment = valor di alias por tin maksimo un fragmento DID-URL ku no ta bashí
err-alias-value-path = valor di alias mester ta un DID did:ma:<ipns> òf DID-URL (sin path)
err-alias-not-did = valor di alias mester kuminsá ku did:ma:
err-unknown-alias = alias deskonosí: @{ $name }
err-bare-did = tabata spera did:ma:<ipns> so (sin fragmènt of pado), risibí { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Wardá
btn-eval = Evaluá
btn-cancel = Kanselá
btn-close = Serrá
btn-reply = Respondé
btn-publish = Publiká
btn-publish-ipld = Publiká IPLD
msg-reply-sent = respuesta mandá
msg-reply-failed = respuesta fayá: { $e }
msg-entity-publish-sent = entidad { $name }: publikashon mandá
msg-entity-publish-failed = publikashon di entidad fayá: { $e }
msg-kind-publish-failed = publicashon di tipo a faya: { $e }
msg-field-publish-sent = entidad { $name }.{ $field }: publikashon mandá
msg-field-publish-failed = publikashon di kamp fayá: { $e }
msg-acl-publish-sent = runtime ACL: publikashon mandá
msg-crud-edit-publish-sent = { $path }: publikashon mandá
msg-acl-publish-failed = publikashon di runtime ACL fayá: { $e }
msg-yaml-error = fayo YAML: { $e }
msg-editor-saved = { $path }:wardá
msg-fetch-review = bishitá { $cid } — ribizhá promé di evaluá
msg-fetch-failed = bishitá { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = inbox ta bashi
inbox-entry-not-found = entrada di inbox { $n } no haña
inbox-no-message-id = entrada di inbox { $n } no tin message_id
inbox-no-verb = no tin verb `{ $verb }` pa entrada di inbox { $n }
inbox-filter-no-arg = filter mester un argumento DID of alias
inbox-filter-empty = no tin mensahe di { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskobri fayá na { $url }: { $e }
discover-json-error = diskobri fayá: JSON invalido di { $url }: { $e }
discover-missing-did = diskobri fayá: status.json falta kampu `did`
discover-invalid-did = diskobri fayá: tabata spera `did` kuminsá ku did:ma:, risibí `{ $did }`
discover-no-endpoint = aviso diskobri: `endpoint_id` falta na status.json; sòlu DID wardá
discover-hint-endpoint-not-found = Pista: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Pista: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Pista: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Pista: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma diskubrí na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma a krea — drenta '.my.identity!publish @ma' pa publiká bo identidad.
claim-success = Runtime reklamá pa { $did }
claim-conflict = Runtime a keda reklamá pa un otro identidad
claim-already-owned = Runtime ya reklamá pa e identidat aki
claim-http-failed = reklamashon fayá: HTTP { $status }
claim-error = reklamashon fayá: { $e }
claim-no-session = no ta login; login promé pa reklamá e runtime
runtime-no-verb = no tin verb `{ $verb }` pa { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl rinisialisá (kompletamente habri)
acl-persist-error = fayo di guardamentu: { $e }
acl-no-verb = no tin verb `{ $verb }` pa .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uso: .my.identity!publish <did-o-alias>
identity-exported = Bundle a baha komo { $filename }
identity-export-failed = Eksportashon a faya: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content ta bashi
doc-save-first = { $path }.content ta bashi — wardá promé
doc-missing-name = nòmber di dokumentu falta
doc-publish-usage = uso: .my.doc.<nòmber>!publish <publikadó>
doc-publish-ipld-usage = uso: .my.doc.<nòmber>!publish-ipld <publikadó>
doc-publish-failed = publiká { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publikashon a fayá [{ $code }]: { $err }
doc-publish-error-hint = Pista: { $hint }
doc-publish-hint-session = log in atrobe pa asina ego por haña akseso na bo yabinan di identidat
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifiká ku e dokumento di DID di e publikadó ta publiká i ta kontené un punto final alkansabel
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin a rechasá e petishon; inspekshoná e motibu i bolbe purba despues di drecha entidat/tempu di ehekushon
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = inspekshoná e registronan di tempu di ehekushon pa kousa detayá i purba di nobo
doc-store-sent = petishon di almacenamentu mandá ({ $id }) → { $publisher }; CID lo yega via respuesta RPC
doc-ipld-store-sent = petishon di almacenamentu IPLD mandá ({ $id }) → { $publisher }; CID lo yega via respuesta RPC
doc-fetch-done = bishitá { $cid } → { $path }.content (no ehekulá)
doc-fetch-failed = bishitá { $cid }: { $e }
doc-fetch-usage = uso: .my.doc.<nòmber>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid no ta shetá
doc-no-verb = no tin verb `{ $verb }` pa { $path }
path-no-verb = no tin verb `{ $verb }` pa { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Idiomanan disponibel (pone ku .my.i18n: <code>):

err-lang-not-found = idioma no a haña: { $lang }

help-header-zion = ── komando di zion ────────────────────────────────────────────────────────
help-header-messaging = ── mensaheria ─────────────────────────────────────────────────────────────
help-header-config = ── gramátika di konfigurashon lokal ───────────────────────────────────────
help-header-common = ── kaminon komun ──────────────────────────────────────────────────────────
help-header-inbox = ── kasita di entrada ──────────────────────────────────────────────────────
help-header-documents = ── dokumentonan (.my.doc.*) ───────────────────────────────────────────────
help-header-i18n = ── idioma ────────────────────────────── ────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── drentando 間-espasio ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        e teksto aki
help-cmd-clear =   .clear                       limpiá terminal
help-cmd-panic =   .panic                       último rekurso — usá si bo haya bou di problema
help-cmd-history =   .history                     historial di komando (duplikado konsekutivo kombiná)
help-cmd-logout =   .logout                      sali
help-cmd-batch =   .batch                       avaliar documento rascunho em paralelo
help-cmd-batch-sync =   .batch:sync / .batch         avaliar documento rascunho linha por linha
help-msg-echo =   @alias                       mustra DID/DID-URL resolví (no ta manda mensahe)
help-msg-send =   @alias!msg body / @alias:verb args           mandá mensahe / RPC na aktor
help-msg-fragment =   @alias#fragment:verb body  mandá na alias ku fragmento DID eksplísito
help-msg-escape =   \@name                       @name literal (ningun búskeda di alias)
help-config-get =   .path                        haña valor di fòlya of lista subarber
help-config-filter =   .path value                  pidi match (filtrá pa valor)
help-config-set =   .path: value                 ponè fòlya
help-config-delete =   .path:                       bòrá fòlya of subarber
help-config-verb =   .path!verb [args]            invokáverbete lokal
help-my =   .my                          mustrá tur konfigurashon personal
help-aliases =   .my.aliases                  listá aliasnomber
help-aliases-set =   .my.aliases.<name>: <did-url>    agregá/aktualisá alias (DID òf DID-URL)
help-aliases-del =   .my.aliases.<name>:          kitsá alias
help-runtime-discover =   .ma [port]          deskubrí runtime lokal i kreá alias @ma
help-runtime-claim =   .ma [port]             reklamá poseeshon di runtime ku bo DID
help-identity =   .my.identity                 mustrá konfigurashon di identidad
help-identity-did =   .my.identity.did             mustrá propio DID (solo-lektura)
help-identity-publish =   .my.identity!publish @pub    publiká propio DID via servishon di publikashon
help-identity-export =   .my.identity!export          baha bo propio bundle di identidad
help-config-path =   .config                      mustrá tur entrada .config.*
help-inbox =   .my.inbox                    listá kasita di entrada (wista di subarber)
help-inbox-n =   .my.inbox.N                  mustrá kampo di entrada N
help-inbox-from =   .my.inbox.N.from             DID di remitente di entrada N
help-inbox-reply =   .my.inbox.N!reply [body]     mandá respuesta (habri editor si tin ningun kuero)
help-inbox-open =   .my.inbox.N!open             habri kontenidonan di entrada solo-lektura den editor
help-inbox-del =   .my.inbox.N:                 bòrá entrada N
help-inbox-delall =   .my.inbox:                   bòrá tur entrada den kasita
help-inbox-flush =   .my.inbox!flush              imprimí tur entrada na terminal
help-inbox-filter =   .my.inbox!filter @who        mustra sòlo entradanan di @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   atravesá dokumento DID di remitente parsiosamente
help-doc-edit =   .my.doc.<name>!edit           habri editor ku kontenidonan salvá
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     buská CID, habri pa revisión solamente
help-doc-eval =   .my.doc.<name>!eval           ehekutá kontenidonan salvá liña pa liña
help-doc-publish =   .my.doc.<name>!publish @pub   almacená komo blob bruto (kualke tipo)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  almacená YAML komo nodo DAG-CBOR IPLD estruturá
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    importá kontenidonan CID (ningun ehekushon)
help-doc-cid =   .my.doc.<name>!cid            mustrá CID almacená
help-doc-del =   .my.doc.<name>:              bòrá dokumento

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n ta warda e preferensia di idioma mará na bo identidat.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lista kódigonan di idioma disponibel

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = E kamber 間 ta e espasio entre identidadnan 間. ma ta laga e identidadnan aki haña otro i komuniká; ora bo identidad ta publiká, bo por partisipá.
help-ma-command =   .ma [port]                   konektá ku bo ma runtime lokal, lesa /status.json, i warda .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publiká bo dokumento DID pa otro hende por resolve bo yabi nan i endpoint
help-ma-security = E frontera di konfiansa mas kla ta bo propio ma runtime ku bo propio IPFS Desktop/Kubo. Un publisher remoto por ta útil, pero e ora ei bo ta dependé di servisio di otro hende.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kon pa drenta den e kamber 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Ora bo identidad ta konosí, .enter @ma ta laga bo drenta den 間. Haña un mundu, drenta aden, i partisipá for di ei.
help-ma-entry-steps = Start IPFS Desktop i ma, despues kore .ma. Publiká ku .my.identity!publish @ma, haña un mundu, i drenta ku .enter @ma.
help-ma-entry-command =   .enter @ma                  drenta den 間 via e @ma runtime
help-ma-entry-toggle =   .enter                       sende òf paga fokùs di kamber; bo identidad ta keda aktivo
help-ma-entry-url =   ?enter=<runtime>             drenta despues di login for di un URL kompartí

msg-send-failed = mandamentu a faya: { $e }
msg-not-logged-in = no a log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Error di analisa YAML: { $e }
yaml-not-mapping = YAML master ta un mapping (par di yabi: balor); tèks simpel i skalar no por ser almacena komo DAG-CBOR
dagcbor-encode-error = Error di kodifikashon DAG-CBOR: { $e }
cbor-decode-error = Error di dekodifikashon CBOR: { $e }
cbor-json-error = Error CBOR pa JSON: { $e }
yaml-serialise-error = Error di serializashon YAML: { $e }
edit-reply-invalid = Respuesta di edishan inválido
doc-publish-ipld-error = Pablikashon IPLD a faya: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Error di garda pruning di kaha di entrada: { $e }
err-config-load = Error di karga konfigurasjon: { $e }
err-lang-persist = Error di garda idioma: { $e }
err-history-parse = Error di analisa historia: { $e }
err-history-load = Error di karga historia: { $e }
err-ipfs-reply-decode = Fayo di dekofikashon di respuesta IPFS: { $e }
err-edit-cbor = Error di edishan CBOR: { $e }
err-popup-blocked = Popup blokea pa browser
status-publishing = ta publica

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = fout
rpc-error-detail = fout: { $detail }
msg-new-message = ← [{ $from }] mesashi nobo — { $count } den inbox
msg-chat = { $sender } bisa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ta bisa { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ta drenta.
room-leave = * { $name } ta sali.
room-drop  = * { $name } ta laga kèi { $thing }.
room-take  = * { $name } ta piki { $thing } riba.
err-edit-decode-failed = edishon: faya di dekoifikashon: { $e }
err-edit-fetch-failed = edishon: faya di karga: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no tin sesjon aktivo — no por borra perfil
profile-delete-error = borramentu di perfil a faya: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil kriptá i mandá na IPFS; dokumento DID ta aktualisá ora CID yega
profile-publish-done = profil publiká — dokumento DID aktualisá ku ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identidat publiká kaba — profil ta aktualisá
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = kontenido binario (no ta wòrdu mustra)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nada)
profiles-deleted = perfil { $name } a wordu borra
profiles-not-found = perfil no a haña: { $name }

# -- Help topics index
help-header-topics = -- tópicos -- digite .help/<topic> para detalhes
help-topic-msg =   .help/msg                    mensagens
help-topic-ma = .help/ma                     ma-espasio, publikashon, i entrada
help-topic-path = .help/path                   gramátika lokal di trayekto di punto
help-topic-my =   .help/my                     config pessoal
help-topic-inbox =   .help/inbox                  caixa de entrada
help-topic-doc =   .help/doc                    documentos
help-topic-actor =   .help/actor                  actor remoto
help-topic-zscheme =   .help/zscheme               ekspreshon Scheme den liña i dokumentashon
help-unknown-topic =   .help/{ $topic }: tópico desconhecido

# -- Help actor section
help-header-actor = -- atores remotos
help-actor-echo =   @actor                       mostrar DID resolvido
help-actor-text = @actor[#entity]!msg|!say|!emote body         manda mensahe direkto/chat/emote
help-actor-ping = @actor:ping                  ping di bida
help-actor-entities =   @actor/entities              listar entidades
help-actor-entities-get = @actor/entities/<n>          haña nodo di entidat
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     editar entidade
help-actor-entities-del = @actor/entities/<n>:         eliminá entidat
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
help-actor-wc = (define x (@actor:verb arg))  warda kontesta 5 den e ambiente di seshon
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    habri zion via un link URL
help-topic-i18n = .help/i18n                   preferensia di idioma pa bo identidat
help-header-url = ── parámetronan URL ─────────────────────────────────────────────────────────────
help-url-intro =   Parti un link ku habri zion ku un destinatario ya yená:
help-url-msg =   ?msg=<did>                   yena di antemano: @<did>!msg (mensahe simpel)
help-url-say =   ?say=<did>                   yena di antemano: @<did>!say (verbu say)
help-url-emote =   ?emote=<did>                 yena di antemano: @<did>!emote (verbu emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             drenta mundu di tempu di ehekushon despues di login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   E input ta yená pero no mandá — preshoná Enter pa manda.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publiká bo identidad riba e red
help-header-publish = ── publikashon di identidad ─────────────────────────────────────────────────
help-publish-intro = Publikashon ta hasi bo identidad enkontrable riba e red. Otronan por buská bo DID pa kontakto.
help-publish-ma = Pa publiká, bo mester tin ma (runtime lokal) instalá. E ta konektá ego ku IPFS/IPNS na nòmber di bo.
help-publish-steps = Pasónan: drenta '.ma [port]' pa detektá e ma lokal, despues '.my.identity!publish @ma'.
help-publish-without = Sin publikashon, otronan no por alkanso bo — no importa si nan konosé bo DID, nan no por risòlbe bo endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = spesifiká nòmber di profil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolekshonando komandonan di tipo di lote, kaba ku .batch
batch-already-collecting = Ya ta rekohé un lote — kaba ku .batch promé
batch-empty = Lote tabata bashi — nada pa kore
batch-running = Executando lote…
batch-step-timeout = e paso di lote a kaba di tempu

batch-done = Lote concluído em { $secs }s — { $steps } passos
batch-done-error = Lote concluído com erros em { $secs }s — { $steps } passos
msg-timeout = Mensagem expirou (sem resposta em 60s)
err-unknown-command = komando deskonosí: { $path }
err-read-only-path = { $path } ta solamente pa lesa
help-cmd-batch-async =   .batch:async / .batch        avaliar documento rascunho em paralelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = No por haña CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID no ta válido: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Aviso: Bo yabi privá IPNS lo wordo manda na e runtime aki pa pública identidad. Sòlamente uza un runtime ku bo konfía tur-tur.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme ta evaluá ekspreshonnan Scheme den komandanan zion i ta pone e resultado den e liña promé ku manda.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ehèmpel den liña; ta manda "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definishonnan ta keda durante e seshon di login aktual
help-zscheme-doc = Dokumentashon: https://github.com/bahner/rust-ma-zscheme
