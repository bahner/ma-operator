# zion — Papiamentu
lang-name = Papiamentu

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = login
tab-new-identity = identidad nobo
tab-import = importá
label-passphrase = pasfrasa
label-username = nòmber di yuzador
label-confirm-passphrase = konfirmá pasfrasa
btn-login = login
btn-export = exportá
btn-generate = generá
passphrase-warning = Pèrdé pasfrasa = pèrdé identidad. No tin rekuperashon.
import-help = Skohe yon .zion.json arkivo exportá. E pakete ta keda enkriptá.
status-unlocking = desblokeando...
status-generating = generando identidad...
status-reading-file = leyendo arkivo...
status-imported = importá '{ $name }' — kambia na tab Login
error-wrong-passphrase = pasfrasa robes: { $e }
error-identity-not-found = identidad '{ $name }' no a haña
error-username-required = nòmber di yuzador ta nesesario
error-passphrase-required = pasfrasa ta nesesario
error-passphrases-no-match = pasfrasa nan no ta igual

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — login komo { $username }
msg-type-help = Tiki .help pa un lista di komando.
msg-connecting = konektando na iroh...
msg-iroh-ready = punto iroh ta listu
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Nan a haña bo identidad online — kuree '.my.identity:publish @ma' pa por yega bo.
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
err-alias-value-fragment = valor di alias mester ta un did:ma:<ipns> so (sin fragmènt)
err-alias-value-path = valor di alias mester ta un did:ma:<ipns> so (sin pado)
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

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = diskobri fayá na { $url }: { $e }
discover-json-error = diskobri fayá: JSON invalido di { $url }: { $e }
discover-missing-did = diskobri fayá: status.json falta kampu `did`
discover-invalid-did = diskobri fayá: tabata spera `did` kuminsá ku did:ma:, risibí `{ $did }`
discover-no-endpoint = aviso diskobri: `endpoint_id` falta na status.json; sòlu DID wardá
discover-success = ma diskubrí na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma kreá — publiká ku: .my.identity:publish @ma
claim-success = Runtime reklamá pa { $did }
claim-conflict = Runtime a keda reklamá pa un otro identidad
claim-http-failed = reklamashon fayá: HTTP { $status }
claim-error = reklamashon fayá: { $e }
claim-no-session = no ta login; login promé pa reklamá e runtime
runtime-no-verb = no tin verb `{ $verb }` pa { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl rinisialisá (kompletamente habri)
acl-persist-error = fayo di guardamentu: { $e }
acl-no-verb = no tin verb `{ $verb }` pa .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uso: .my.identity:publish <did-o-alias>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content ta bashi
doc-save-first = { $path }.content ta bashi — wardá promé
doc-missing-name = nòmber di dokumentu falta
doc-publish-usage = uso: .my.doc.<nòmber>:publish <publikadó>
doc-publish-ipld-usage = uso: .my.doc.<nòmber>:publish-ipld <publikadó>
doc-publish-failed = publiká { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = petishon di almacenamentu mandá ({ $id }) → { $publisher }; CID lo yega via respuesta RPC
doc-ipld-store-sent = petishon di almacenamentu IPLD mandá ({ $id }) → { $publisher }; CID lo yega via respuesta RPC
doc-fetch-done = bishitá { $cid } → { $path }.content (no ehekulá)
doc-fetch-failed = bishitá { $cid }: { $e }
doc-fetch-usage = uso: .my.doc.<nòmber>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid no ta shetá
doc-no-verb = no tin verb `{ $verb }` pa { $path }
path-no-verb = no tin verb `{ $verb }` pa { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Idiomanan disponibel (pone ku .my.i18n: <code>):

err-lang-not-found = idioma no a haña: { $lang }

help-header-zion = ── komando di zion ────────────────────────────────────────────────────────
help-header-messaging = ── mensaheria ─────────────────────────────────────────────────────────────
help-header-focus = ── modo di fókus ──────────────────────────────────────────────────────────
help-header-config = ── gramátika di konfigurashon lokal ───────────────────────────────────────
help-header-common = ── kaminon komun ──────────────────────────────────────────────────────────
help-header-inbox = ── kasita di entrada ──────────────────────────────────────────────────────
help-header-documents = ── dokumentonan (.my.doc.*) ───────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        e teksto aki
help-cmd-clear =   .clear                       limpiá terminal
help-cmd-panic =   .panic                       último rekurso — usá si bo haya bou di problema
help-cmd-history =   .history                     historial di komando (duplikado konsekutivo kombiná)
help-cmd-logout =   .logout                      sali
help-msg-echo =   @alias                       ekuá DID resueltá (ningun mensahe enviá)
help-msg-send =   @alias[:verb] body           mandá mensahe / RPC na aktor
help-msg-fragment =   @alias#fragment[:verb] body  mandá na alias ku fragmento DID eksplísito
help-msg-escape =   \@name                       @name literal (ningun búskeda di alias)
help-focus-set =   .use @alias [as @name]       fokusá riba aktor (kambiá prompt)
help-focus-clear =   .use                         kitsá fókus
help-config-get =   .path                        haña valor di fòlya of lista subarber
help-config-filter =   .path value                  pidi match (filtrá pa valor)
help-config-set =   .path: value                 ponè fòlya
help-config-delete =   .path:                       bòrá fòlya of subarber
help-config-verb =   .path:verb [args]            invokáverbete lokal
help-my =   .my                          mustrá tur konfigurashon personal
help-aliases =   .my.aliases                  listá aliasnomber
help-aliases-set =   .my.aliases.<name>: <did>    agregá/aktualisá alias (DID pelá, sin #fragmento)
help-aliases-del =   .my.aliases.<name>:          kitsá alias
help-runtime-discover =   .my.ma:discover          deskubrí runtime lokal i kreá alias @ma
help-runtime-claim =   .my.ma:claim             reklamá poseeshon di runtime ku bo DID
help-identity =   .my.identity                 mustrá konfigurashon di identidad
help-identity-did =   .my.identity.did             mustrá propio DID (solo-lektura)
help-identity-publish =   .my.identity:publish @pub    publiká propio DID via servishon di publikashon
help-config-path =   .config                      mustrá tur entrada .config.*
help-inbox =   .my.inbox                    listá kasita di entrada (wista di subarber)
help-inbox-n =   .my.inbox.N                  mustrá kampo di entrada N
help-inbox-from =   .my.inbox.N.from             DID di remitente di entrada N
help-inbox-reply =   .my.inbox.N:reply [body]     mandá respuesta (habri editor si tin ningun kuero)
help-inbox-open =   .my.inbox.N:open             habri kontenidonan di entrada solo-lektura den editor
help-inbox-del =   .my.inbox.N:                 bòrá entrada N
help-inbox-delall =   .my.inbox:                   bòrá tur entrada den kasita
help-inbox-flush =   .my.inbox:flush              imprimí tur entrada na terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   atravesá dokumento DID di remitente parsiosamente
help-doc-edit =   .my.doc.<name>:edit           habri editor ku kontenidonan salvá
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     buská CID, habri pa revisión solamente
help-doc-eval =   .my.doc.<name>:eval           ehekutá kontenidonan salvá liña pa liña
help-doc-publish =   .my.doc.<name>:publish @pub   almacená komo blob bruto (kualke tipo)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  almacená YAML komo nodo DAG-CBOR IPLD estruturá
help-doc-fetch =   .my.doc.<name>:fetch <cid>    importá kontenidonan CID (ningun ehekushon)
help-doc-cid =   .my.doc.<name>:cid            mustrá CID almacená
help-doc-del =   .my.doc.<name>:              bòrá dokumento

msg-send-failed = mandamentu a faya: { $e }
msg-not-logged-in = no a log in

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Error di analisa YAML: { $e }
yaml-not-mapping = YAML master ta un mapping (par di yabi: balor); tèks simpel i skalar no por ser almacena komo DAG-CBOR
dagcbor-encode-error = Error di kodifikashon DAG-CBOR: { $e }
cbor-decode-error = Error di dekodifikashon CBOR: { $e }
cbor-json-error = Error CBOR pa JSON: { $e }
yaml-serialize-error = Error di serializashon YAML: { $e }
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
err-edit-decode-failed = edishon: faya di dekoifikashon: { $e }
err-edit-fetch-failed = edishon: faya di karga: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no tin sesjon aktivo — no por borra perfil
profile-delete-error = borramentu di perfil a faya: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nada)
profiles-deleted = perfil { $name } a wordu borra
profiles-not-found = perfil no a haña: { $name }

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

help-topic-url =   .help.url                    habri zion via un link URL
help-header-url = ── parámetronan URL ─────────────────────────────────────────────────────────────
help-url-intro =   Parti un link ku habri zion ku un destinatario ya yená:
help-url-msg =   ?msg=<did>                   yena di antemano: @<did> (mensahe simpel)
help-url-say =   ?say=<did>                   yena di antemano: @<did>:say (verbu say)
help-url-emote =   ?emote=<did>                 yena di antemano: @<did>:emote (verbu emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   E input ta yená pero no mandá — preshoná Enter pa manda.
