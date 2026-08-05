# zion — Español
lang-name = Español
label-nick = apodo
new-identity-nick-help = Elige un apodo para ma-space. Es solo un apodo y puedes cambiarlo cuando quieras.
error-nick-required = se requiere apodo
error-nick-invalid = el apodo no debe contener espacios ni @

# ── Página de inicio de sesión ────────────────────────────────────────────
tab-login = iniciar sesión
tab-new-identity = nueva identidad
tab-import-profile = importar perfil
label-passphrase = frase de contraseña
label-username = nombre de usuario
label-confirm-passphrase = confirmar frase de contraseña
label-did = DID
label-profile-cid = CID del perfil
label-or-file = o archivo
btn-login = iniciar sesión
btn-export = exportar
btn-generate = generar
btn-new-endpoint = nuevo endpoint
btn-import-profile = importar perfil
passphrase-warning = Frase de contraseña perdida = identidad perdida. No hay recuperación posible.
import-profile-help = Importe un perfil mediante CID o archivo. Necesita la misma frase de contraseña utilizada al publicar.
import-profile-detected-user = El perfil pertenece a: { $name }
status-unlocking = desbloqueando...
status-generating = generando identidad...
status-reading-file = leyendo archivo...
status-fetching-profile = obteniendo perfil de IPFS...
status-imported = '{ $name }' importado — cambie a la pestaña Iniciar sesión
status-importing-profile = importando perfil...
profile-import-done = perfil importado para '{ $name }' — { $n } claves cargadas
error-wrong-passphrase = frase de contraseña incorrecta: { $e }
error-identity-not-found = identidad '{ $name }' no encontrada
error-username-required = se requiere nombre de usuario
error-passphrase-required = se requiere frase de contraseña
error-passphrases-no-match = las frases de contraseña no coinciden
error-profile-source-required = proporcione un CID o suba un archivo
error-did-required = introduce tu DID
error-profile-fetch = no se pudo obtener el perfil: { $e }
error-profile-no-username = el perfil no contiene un nombre de usuario
error-profile-no-identity = identidad '{ $name }' no encontrada — importe la identidad primero

# ── Mensajes del sistema del terminal ────────────────────────────────────
msg-logged-in = zion v{ $version } — sesión iniciada como { $username }
msg-type-help = Escribe .help para obtener una lista de comandos.
msg-getting-started = Prueba: say Hello world, look, .help o help.
msg-connecting = conectando a iroh...
msg-iroh-ready = punto final de iroh listo
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicado a través de ma local ({ $url })
msg-identity-publication-propagating = La publicación de la identidad aún se está propagando; entrada retrasada: { $e }
msg-identity-first-publish = Publicando la identidad por primera vez. Esto puede tardar hasta { $seconds } segundos.
msg-ma-connecting-matrix = intentando conectarte a la 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 local reclamado
msg-local-ma-already-claimed = 間 local ya reclamado
msg-local-ma-claim-failed = no se pudo reclamar el 間 local
msg-identity-not-published = Identidad no encontrada en línea — si tienes ma instalado localmente, ejecuta '.ma [port]' y luego '.my.identity!publish @ma'. Escribe '.help/publish' para más detalles.
msg-blocked = ⊗ bloqueado [{ $cap }]: { $from }
msg-focus-cleared = enfoque borrado
msg-focusing = enfocando { $did } como { $prompt }
msg-set = { $path }: { $value }
msg-deleted = eliminado { $path } ({ $count } entradas)
msg-read-only = { $path } es de solo lectura
msg-subtree-set = { $path } es un subárbol; configuración rechazada
msg-ancestor-leaf = un ancestro de { $path } es una hoja; sombreado rechazado
msg-key-not-found = clave no encontrada: { $path }
msg-no-match = sin coincidencia
msg-link-not-connected = error al obtener enlace: no conectado
msg-link-fetch-error = error al obtener enlace: { $e }
msg-link-key-not-found = clave `{ $key }` no encontrada en el documento vinculado

# ── Validación de alias ───────────────────────────────────────────────────
err-alias-name-empty = el nombre de alias no puede estar vacío
err-alias-has-dot = el nombre de alias no puede contener '.'
err-alias-has-fragment = el nombre de alias no puede contener '#'
err-alias-value-fragment = el valor de alias puede contener como máximo un fragmento DID-URL no vacío
err-alias-value-path = el valor de alias debe ser un DID did:ma:<ipns> o DID-URL (sin ruta)
err-alias-not-did = el valor de alias debe comenzar con did:ma:
err-unknown-alias = alias desconocido: @{ $name }
err-bare-did = se esperaba did:ma:<ipns> puro (sin fragmento ni ruta), se recibió { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Guardar
btn-eval = Ejecutar
btn-cancel = Cancelar
msg-jobs-cancelled = trabajos cancelados
btn-close = Cerrar
btn-reply = Responder
btn-publish = Publicar
btn-publish-ipld = Publicar IPLD
msg-reply-sent = respuesta enviada
msg-reply-failed = error al enviar respuesta: { $e }
msg-entity-publish-sent = entidad { $name }: publicación enviada
msg-entity-publish-failed = error al publicar entidad: { $e }
msg-kind-publish-failed = publicación de tipo fallida: { $e }
msg-field-publish-sent = entidad { $name }.{ $field }: publicación enviada
msg-field-publish-failed = error al publicar campo: { $e }
msg-acl-publish-sent = ACL de tiempo de ejecución: publicación enviada
msg-crud-edit-publish-sent = { $path }: publicación enviada
msg-acl-publish-failed = error al publicar ACL de tiempo de ejecución: { $e }
msg-yaml-error = error YAML: { $e }
msg-editor-saved = { $path }:guardar
msg-fetch-review = { $cid } obtenido — revise antes de ejecutar
msg-fetch-failed = obtención { $cid }: { $e }

# ── Verbos — bandeja de entrada ───────────────────────────────────────────
inbox-empty = la bandeja de entrada está vacía
inbox-entry-not-found = entrada { $n } de la bandeja de entrada no encontrada
inbox-no-message-id = la entrada { $n } de la bandeja de entrada no tiene message_id
inbox-no-verb = no hay verbo `{ $verb }` para la entrada { $n } de la bandeja de entrada
inbox-filter-no-arg = el filtro requiere un argumento DID o alias
inbox-filter-empty = no hay mensajes de { $did }

# ── Verbos — tiempo de ejecución ─────────────────────────────────────────
discover-fetch-failed = descubrimiento fallido en { $url }: { $e }
discover-json-error = descubrimiento fallido: JSON no válido de { $url }: { $e }
discover-missing-did = descubrimiento fallido: status.json falta el campo obligatorio `did`
discover-invalid-did = descubrimiento fallido: se esperaba que `did` comenzara con did:ma:, se recibió `{ $did }`
discover-no-endpoint = advertencia de descubrimiento: `endpoint_id` ausente en status.json; solo se guardó DID
discover-hint-endpoint-not-found = Pista: punto final no encontrado. Comprueba que `ma` esté ejecutándose y exponga /status.json en el puerto 5003.
discover-hint-server-error = Pista: el runtime respondió con un error del servidor. Revisa los registros de `ma` e inténtalo de nuevo.
discover-hint-network = Pista: problema de red/conectividad. Inicia `ma`, verifica que localhost:5003 sea accesible y permite acceso HTTP local en el navegador.
discover-hint-generic = Pista: verifica que `ma` e IPFS Desktop estén en ejecución y reintenta `.ma`.
discover-success = ma descubierto en { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creado — ejecuta '.my.identity!publish @ma' para publicar tu identidad.
claim-success = Tiempo de ejecución reclamado para { $did }
claim-conflict = Tiempo de ejecución ya reclamado por otra identidad
claim-already-owned = Runtime ya reclamado por esta identidad
claim-http-failed = reclamación fallida: HTTP { $status }
claim-error = reclamación fallida: { $e }
claim-no-session = no iniciada sesión; inicia sesión primero para reclamar el tiempo de ejecución
runtime-no-verb = no hay verbo `{ $verb }` para { $path }

# ── Verbos — control de acceso ────────────────────────────────────────────
acl-reset = .my.acl restablecido (completamente abierto)
acl-persist-error = error al guardar: { $e }
acl-no-verb = no hay verbo `{ $verb }` para .my.acl

# ── Verbos — identidad ────────────────────────────────────────────────────
publish-usage = uso: .my.identity!publish <did-o-alias>
identity-exported = Paquete descargado como { $filename }
identity-export-failed = Exportación fallida: { $e }

# ── Verbos — documentos ───────────────────────────────────────────────────
doc-content-empty = { $path }.content está vacío
doc-save-first = { $path }.content está vacío — guarda primero
doc-missing-name = falta el nombre del documento
doc-publish-usage = uso: .my.doc.<nombre>!publish <editor>
doc-publish-ipld-usage = uso: .my.doc.<nombre>!publish-ipld <editor>
doc-publish-failed = publicación { $path }: { $e }
doc-publish-ipld-failed = publicación IPLD { $path }: { $e }
doc-publish-error-detail = publicación fallida [{ $code }]: { $err }
doc-publish-error-hint = Pista: { $hint }
doc-publish-hint-session = inicia sesión otra vez para que ego pueda acceder a tus claves de identidad
doc-publish-hint-target = usa una DID de publicador válida o un alias que resuelva a una did:ma:<ipns> sin fragmento
doc-publish-hint-network = verifica que el runtime ma e IPFS sean accesibles y reintenta
doc-publish-hint-resolve = verifica que el documento DID del publicador esté publicado y contenga un punto final accesible
doc-publish-hint-acl = pide al operador del publicador que permita tu DID en la ACL
doc-publish-hint-runtime = el runtime/plugin rechazó la solicitud; revisa la razón y reintenta tras corregir entidad/runtime
doc-publish-hint-ipfs = comprueba la salud local de Kubo/IPFS y el estado del runtime publicador
doc-publish-hint-unknown = revisa los registros del runtime para ver la causa detallada y reintenta
doc-store-sent = solicitud de almacenamiento enviada ({ $id }) → { $publisher }; CID llegará por respuesta RPC
doc-ipld-store-sent = solicitud de almacenamiento IPLD enviada ({ $id }) → { $publisher }; CID llegará por respuesta RPC
doc-fetch-done = { $cid } obtenido → { $path }.content (no ejecutado)
doc-fetch-failed = obtención { $cid }: { $e }
doc-fetch-usage = uso: .my.doc.<nombre>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid no está establecido
doc-no-verb = no hay verbo `{ $verb }` para { $path }
path-no-verb = no hay verbo `{ $verb }` para { $path }

# ── Texto de ayuda — encabezados ──────────────────────────────────────────
help-header-zion = ── comandos zion ──────────────────────────────────────────────────────────
help-header-messaging = ── mensajería ────────────────────────────────────────────────────────────
help-header-config = ── gramática de configuración local ─────────────────────────────────────
help-header-common = ── rutas comunes ─────────────────────────────────────────────────────────
help-header-inbox = ── bandeja de entrada ────────────────────────────────────────────────────
help-header-documents = ── documentos ───────────────────────────────────────────────────────────
help-header-i18n = ── idioma ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entrando en el 間-espacio ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        este texto
help-cmd-clear =   .clear                       limpiar el terminal
help-cmd-panic =   .panic                       último recurso — úsalo si estás en apuros
help-cmd-history =   .history                     historial de comandos (duplicados consecutivos combinados)
help-cmd-logout =   .logout                      cerrar sesión
help-cmd-batch =   .batch                       evaluar documento temporal en paralelo
help-cmd-batch-sync =   .batch:sync / .batch         evaluar documento temporal línea por línea

help-msg-echo =   @alias                       mostrar DID/DID-URL resuelto (no se envía ningún mensaje)
help-msg-send =   @alias!msg body / @alias:verb args           enviar mensaje / RPC a actor
help-msg-fragment =   @alias#fragment:verb body  enviar al alias con fragmento DID explícito
help-msg-escape =   \@name                       @name literal (sin búsqueda de alias)


help-config-get =   .path                        obtener valor de hoja o listar subárbol
help-config-filter =   .path value                  filtro de búsqueda (filtrar por valor)
help-config-set =   .path: value                 establecer hoja
help-config-delete =   .path:                       eliminar hoja o subárbol
help-config-verb =   .path!verb [args]            ejecutar verbo local

help-my =   .my                          mostrar toda la configuración personal
help-aliases =   .my.aliases                  listar alias
help-aliases-set =   .my.aliases.<name>: <did-url>    añadir/actualizar alias (DID o DID-URL)
help-aliases-del =   .my.aliases.<name>:          eliminar alias
help-runtime-discover =   .ma [port]          descubrir tiempo de ejecución local y crear alias @ma
help-runtime-claim =   .ma [port]             reclamar tiempo de ejecución con tu DID
help-identity =   .my.identity                 mostrar configuración de identidad
help-identity-did =   .my.identity.did             mostrar DID propio (solo lectura)
help-identity-publish =   .my.identity!publish @pub    publicar DID propio a través del servicio editor
help-identity-export =   .my.identity!export          descargar paquete de identidad propia
help-config-path =   .config                      mostrar todas las entradas .config.*

help-inbox =   .my.inbox                    listar bandeja de entrada (vista de subárbol)
help-inbox-n =   .my.inbox.N                  mostrar campos de la entrada N
help-inbox-from =   .my.inbox.N.from             DID del remitente para la entrada N
help-inbox-reply =   .my.inbox.N!reply [body]     enviar respuesta (abre editor sin cuerpo)
help-inbox-open =   .my.inbox.N!open             abrir contenido en editor de solo lectura
help-inbox-del =   .my.inbox.N:                 eliminar entrada N
help-inbox-delall =   .my.inbox:                   eliminar todas las entradas de la bandeja de entrada
help-inbox-flush =   .my.inbox!flush              imprimir todas las entradas en el terminal
help-inbox-filter =   .my.inbox!filter @who        mostrar solo entradas de @who
help-inbox-traverse =   .my.inbox.N.sender.<campo>  recorrer el documento DID del remitente de forma diferida

help-doc-edit =   .my.doc.<nombre>!edit           abrir editor con contenido guardado
help-doc-edit-cid =   .my.doc.<nombre>!edit /ipfs/<cid>     obtener CID, abrir para revisión
help-doc-eval =   .my.doc.<nombre>!eval           ejecutar contenido guardado línea por línea
help-doc-publish =   .my.doc.<nombre>!publish @pub   guardar como blob sin procesar (todos los tipos)
help-doc-publish-ipld =   .my.doc.<nombre>!publish-ipld @pub  guardar YAML como nodo IPLD DAG-CBOR estructurado
help-doc-fetch =   .my.doc.<nombre>!fetch /ipfs/<cid>    importar contenido CID (sin ejecución)
help-doc-cid =   .my.doc.<nombre>!cid            mostrar CID guardado
help-doc-del =   .my.doc.<nombre>:              eliminar documento

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n almacena la preferencia de idioma vinculada a su identidad.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               listar códigos de idioma disponibles

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = La sala 間 es el espacio entre identidades 間. ma permite que esas identidades se encuentren y se comuniquen; cuando tu identidad está publicada, puedes participar.
help-ma-command =   .ma [port]                   conectar con tu runtime ma local, leer /status.json y guardar .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publicar tu documento DID para que otros resuelvan tus claves y tu endpoint
help-ma-security = El límite de confianza más claro es tu propio runtime ma con tu propio IPFS Desktop/Kubo. Un publisher remoto puede ser útil, pero entonces dependes del servicio de otra persona.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             cómo entrar en la sala 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Cuando tu identidad ya es conocida, .enter @ma te permite entrar en 間. Encuentra un mundo, entra en él y participa desde allí.
help-ma-entry-steps = Inicia IPFS Desktop y ma, luego ejecuta .ma. Publica con .my.identity!publish @ma, encuentra un mundo y entra con .enter @ma.
help-ma-entry-command =   .enter @ma                  entrar en 間 mediante el runtime @ma
help-ma-entry-toggle =   .enter                       activa o desactiva el foco de la sala; tu identidad sigue activa
help-ma-entry-url =   ?enter=<runtime>             entrar después de iniciar sesión desde una URL compartida

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Idiomas disponibles (configura con .my.i18n: <code>):
err-lang-not-found = idioma no encontrado: { $lang }

msg-send-failed = envío fallido: { $e }
msg-not-logged-in = no ha iniciado sesión

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Error de análisis YAML: { $e }
yaml-not-mapping = YAML debe ser un mapping (pares clave: valor); el texto plano y los escalares no pueden almacenarse como DAG-CBOR
dagcbor-encode-error = Error de codificación DAG-CBOR: { $e }
cbor-decode-error = Error de decodificación CBOR: { $e }
cbor-json-error = Error CBOR a JSON: { $e }
yaml-serialise-error = Error de serialización YAML: { $e }
edit-reply-invalid = Respuesta de edición no válida
doc-publish-ipld-error = Publicación IPLD fallida: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Error al guardar la limpieza del buzón: { $e }
err-config-load = Error al cargar la configuración: { $e }
err-lang-persist = Error al guardar el idioma: { $e }
err-history-parse = Error de análisis del historial: { $e }
err-history-load = Error al cargar el historial: { $e }
err-ipfs-reply-decode = Fallo al decodificar respuesta IPFS: { $e }
err-edit-cbor = Error de edición CBOR: { $e }
err-popup-blocked = Ventana emergente bloqueada por el navegador
status-publishing = publicando

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = error
rpc-error-detail = error: { $detail }
msg-new-message = ← [{ $from }] nuevo mensaje — { $count } en bandeja de entrada
msg-chat = { $sender } dice { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } dice { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } entra en la sala.
room-leave = * { $name } sale de la sala.
room-drop  = * { $name } suelta { $thing }.
room-take  = * { $name } recoge { $thing }.
err-edit-decode-failed = edición: fallo de decodificación: { $e }
err-edit-fetch-failed = edición: fallo de carga: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no hay sesión activa — no se puede eliminar el perfil
profile-delete-error = error al eliminar el perfil: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = perfil cifrado y enviado a IPFS; el documento DID se actualizará cuando llegue el CID
profile-publish-done = perfil publicado — documento DID actualizado con el CID de ma.agent
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identidad ya publicada — perfil actualizado
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = contenido binario (no mostrado)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ninguno)
profiles-deleted = perfil { $name } eliminado
profiles-not-found = perfil no encontrado: { $name }

# -- Help topics index
help-header-topics = -- temas -- escribe .help/<topic> para detalles
help-topic-msg =   .help/msg                    mensajería
help-topic-ma = .help/ma                     ma-espacio, publicación y entrada
help-topic-path = .help/path                   gramática de ruta de puntos local
help-topic-my =   .help/my                     config personal
help-topic-inbox =   .help/inbox                  bandeja de entrada
help-topic-doc =   .help/doc                    documentos
help-topic-actor =   .help/actor                  actor remoto
help-topic-zscheme =   .help/zscheme               expresiones Scheme en línea y documentación
help-topic-url =   .help/url                    abrir zion mediante un enlace URL
help-topic-i18n = .help/i18n                   preferencia de idioma para su identidad
help-unknown-topic =   .help/{ $topic }: tema desconocido

# -- Help actor section
help-header-actor = -- actores remotos
help-actor-echo =   @actor                       mostrar DID resuelto
help-actor-text = @actor[#entity]!msg|!say|!emote body         enviar mensaje directo/chat/emoticón
help-actor-ping = @actor:ping                  ping de vida
help-actor-entities =   @actor/entities              listar entidades
help-actor-entities-get = @actor/entities/<n>          obtener nodo de entidad
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     editar entidad
help-actor-entities-del = @actor/entities/<n>:         eliminar entidad
help-actor-config-get =   @actor/config/<key>          obtener valor de config
help-actor-config-set =   @actor/config/<key>: val     establecer valor de config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              editar ACL
help-actor-fragment =   @actor#entity                enviar al plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC al plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  mantener las respuestas 5 en el entorno de sesión
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── parámetros de URL ───────────────────────────────────────────────────────
help-url-intro =   Comparte un enlace que abre zion con un destinatario ya rellenado:
help-url-msg =   ?msg=<did>                   rellena: @<did>!msg (mensaje de texto)
help-url-say =   ?say=<did>                   rellena: @<did>!say (verbo say)
help-url-emote =   ?emote=<did>                 rellena: @<did>!emote (verbo emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             ingrese al mundo de ejecución después de iniciar sesión
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   El campo se rellena pero no se envía — pulsa Intro para enviar.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publicar tu identidad en la red
help-header-publish = ── publicar identidad ───────────────────────────────────────────────────────
help-publish-intro = Publicar hace que tu identidad sea localizable en la red. Otros pueden buscar tu DID para contactarte.
help-publish-ma = Para publicar necesitas ma (runtime local) instalado. Conecta ego con IPFS/IPNS en tu nombre.
help-publish-steps = Pasos: ejecuta '.ma [port]' para detectar tu ma local, luego '.my.identity!publish @ma'.
help-publish-without = Sin publicar, otros no pueden alcanzarte — aunque conozcan tu DID, no pueden resolver tu endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = indica un nombre de perfil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Recopilación de lotes: escriba comandos y finalice con .batch
batch-already-collecting = Ya estoy recopilando un lote: finalice primero con .batch
batch-empty = El lote estaba vacío: no había nada que ejecutar.
batch-running = Ejecutando lote…
batch-step-timeout = paso del lote agotado

batch-done = Lote completado en { $secs }s — { $steps } pasos
batch-done-error = Lote terminado con errores en { $secs }s — { $steps } pasos
msg-timeout = Mensaje agotado (sin respuesta en 60s)
err-unknown-command = comando desconocido: { $path }
err-read-only-path = { $path } es de solo lectura
help-cmd-batch-async =   .batch:async / .batch        evaluar documento temporal en paralelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Error al obtener CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID no válido: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Advertencia: Tu clave privada IPNS se enviará a este entorno de ejecución para la publicación de identidad. Usa solo un entorno de ejecución en el que confíes plenamente.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme evalúa expresiones Scheme incrustadas en comandos de zion e inserta el resultado en la línea antes de enviarla.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ejemplo en línea; envía "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             las definiciones persisten durante la sesión actual
help-zscheme-doc = Documentación: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Pasarela IPFS local (requiere excepción del navegador)

tab-config = Ajustes
label-gateway = gateway
