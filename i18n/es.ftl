# zion — Español
lang-name = Español

# ── Página de inicio de sesión ────────────────────────────────────────────
tab-login = iniciar sesión
tab-new-identity = nueva identidad
tab-import = importar
label-passphrase = frase de contraseña
label-username = nombre de usuario
label-confirm-passphrase = confirmar frase de contraseña
btn-login = iniciar sesión
btn-export = exportar
btn-generate = generar
passphrase-warning = Frase de contraseña perdida = identidad perdida. No hay recuperación posible.
import-help = Seleccione un archivo .zion.json exportado. El paquete permanece cifrado.
status-unlocking = desbloqueando...
status-generating = generando identidad...
status-reading-file = leyendo archivo...
status-imported = '{ $name }' importado — cambie a la pestaña Iniciar sesión
error-wrong-passphrase = frase de contraseña incorrecta: { $e }
error-identity-not-found = identidad '{ $name }' no encontrada
error-username-required = se requiere nombre de usuario
error-passphrase-required = se requiere frase de contraseña
error-passphrases-no-match = las frases de contraseña no coinciden

# ── Mensajes del sistema del terminal ────────────────────────────────────
msg-logged-in = zion v{ $version } — sesión iniciada como { $username }
msg-type-help = Escribe .help para obtener una lista de comandos.
msg-connecting = conectando a iroh...
msg-iroh-ready = punto final de iroh listo
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publicado a través de ma local ({ $url })
msg-identity-not-published = Identidad no encontrada en línea — si tienes ma instalado localmente, ejecuta '.my.ma:discover' y luego '.my.identity:publish @ma'. Escribe '.help.publish' para más detalles.
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
err-alias-value-fragment = el valor de alias debe ser un did:ma:<ipns> puro (sin fragmento)
err-alias-value-path = el valor de alias debe ser un did:ma:<ipns> puro (sin ruta)
err-alias-not-did = el valor de alias debe comenzar con did:ma:
err-unknown-alias = alias desconocido: @{ $name }
err-bare-did = se esperaba did:ma:<ipns> puro (sin fragmento ni ruta), se recibió { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Guardar
btn-eval = Ejecutar
btn-cancel = Cancelar
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
discover-success = ma descubierto en { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creado — ejecuta '.my.identity:publish @ma' para publicar tu identidad.
claim-success = Tiempo de ejecución reclamado para { $did }
claim-conflict = Tiempo de ejecución ya reclamado por otra identidad
claim-http-failed = reclamación fallida: HTTP { $status }
claim-error = reclamación fallida: { $e }
claim-no-session = no iniciada sesión; inicia sesión primero para reclamar el tiempo de ejecución
runtime-no-verb = no hay verbo `{ $verb }` para { $path }

# ── Verbos — control de acceso ────────────────────────────────────────────
acl-reset = .my.acl restablecido (completamente abierto)
acl-persist-error = error al guardar: { $e }
acl-no-verb = no hay verbo `{ $verb }` para .my.acl

# ── Verbos — identidad ────────────────────────────────────────────────────
publish-usage = uso: .my.identity:publish <did-o-alias>
identity-exported = Paquete descargado como { $filename }
identity-export-failed = Exportación fallida: { $e }

# ── Verbos — documentos ───────────────────────────────────────────────────
doc-content-empty = { $path }.content está vacío
doc-save-first = { $path }.content está vacío — guarda primero
doc-missing-name = falta el nombre del documento
doc-publish-usage = uso: .my.doc.<nombre>:publish <editor>
doc-publish-ipld-usage = uso: .my.doc.<nombre>:publish-ipld <editor>
doc-publish-failed = publicación { $path }: { $e }
doc-publish-ipld-failed = publicación IPLD { $path }: { $e }
doc-store-sent = solicitud de almacenamiento enviada ({ $id }) → { $publisher }; CID llegará por respuesta RPC
doc-ipld-store-sent = solicitud de almacenamiento IPLD enviada ({ $id }) → { $publisher }; CID llegará por respuesta RPC
doc-fetch-done = { $cid } obtenido → { $path }.content (no ejecutado)
doc-fetch-failed = obtención { $cid }: { $e }
doc-fetch-usage = uso: .my.doc.<nombre>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid no está establecido
doc-no-verb = no hay verbo `{ $verb }` para { $path }
path-no-verb = no hay verbo `{ $verb }` para { $path }

# ── Texto de ayuda — encabezados ──────────────────────────────────────────
help-header-zion = ── comandos zion ──────────────────────────────────────────────────────────
help-header-messaging = ── mensajería ────────────────────────────────────────────────────────────
help-header-focus = ── modo enfoque ──────────────────────────────────────────────────────────
help-header-config = ── gramática de configuración local ─────────────────────────────────────
help-header-common = ── rutas comunes ─────────────────────────────────────────────────────────
help-header-inbox = ── bandeja de entrada ────────────────────────────────────────────────────
help-header-documents = ── documentos ───────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        este texto
help-cmd-clear =   .clear                       limpiar el terminal
help-cmd-panic =   .panic                       último recurso — úsalo si estás en apuros
help-cmd-history =   .history                     historial de comandos (duplicados consecutivos combinados)
help-cmd-logout =   .logout                      cerrar sesión

help-msg-echo =   @alias                       mostrar DID resuelto (no se envió ningún mensaje)
help-msg-send =   @alias[:verb] body           enviar mensaje / RPC a actor
help-msg-fragment =   @alias#fragment[:verb] body  enviar al alias con fragmento DID explícito
help-msg-escape =   \@name                       @name literal (sin búsqueda de alias)

help-focus-set =   .use @alias [as @name]       enfocar en actor (cambia el indicador)
help-focus-clear =   .use                         borrar enfoque

help-config-get =   .path                        obtener valor de hoja o listar subárbol
help-config-filter =   .path value                  filtro de búsqueda (filtrar por valor)
help-config-set =   .path: value                 establecer hoja
help-config-delete =   .path:                       eliminar hoja o subárbol
help-config-verb =   .path:verb [args]            ejecutar verbo local

help-my =   .my                          mostrar toda la configuración personal
help-aliases =   .my.aliases                  listar alias
help-aliases-set =   .my.aliases.<name>: <did>    añadir/actualizar alias (DID puro, sin #fragmento)
help-aliases-del =   .my.aliases.<name>:          eliminar alias
help-runtime-discover =   .my.ma:discover          descubrir tiempo de ejecución local y crear alias @ma
help-runtime-claim =   .my.ma:claim             reclamar tiempo de ejecución con tu DID
help-identity =   .my.identity                 mostrar configuración de identidad
help-identity-did =   .my.identity.did             mostrar DID propio (solo lectura)
help-identity-publish =   .my.identity:publish @pub    publicar DID propio a través del servicio editor
help-identity-export =   .my.identity:export          descargar paquete de identidad propia
help-config-path =   .config                      mostrar todas las entradas .config.*

help-inbox =   .my.inbox                    listar bandeja de entrada (vista de subárbol)
help-inbox-n =   .my.inbox.N                  mostrar campos de la entrada N
help-inbox-from =   .my.inbox.N.from             DID del remitente para la entrada N
help-inbox-reply =   .my.inbox.N:reply [body]     enviar respuesta (abre editor sin cuerpo)
help-inbox-open =   .my.inbox.N:open             abrir contenido en editor de solo lectura
help-inbox-del =   .my.inbox.N:                 eliminar entrada N
help-inbox-delall =   .my.inbox:                   eliminar todas las entradas de la bandeja de entrada
help-inbox-flush =   .my.inbox:flush              imprimir todas las entradas en el terminal
help-inbox-filter =   .my.inbox:filter @who        mostrar solo entradas de @who
help-inbox-traverse =   .my.inbox.N.sender.<campo>  recorrer el documento DID del remitente de forma diferida

help-doc-edit =   .my.doc.<nombre>:edit           abrir editor con contenido guardado
help-doc-edit-cid =   .my.doc.<nombre>:edit <cid>     obtener CID, abrir para revisión
help-doc-eval =   .my.doc.<nombre>:eval           ejecutar contenido guardado línea por línea
help-doc-publish =   .my.doc.<nombre>:publish @pub   guardar como blob sin procesar (todos los tipos)
help-doc-publish-ipld =   .my.doc.<nombre>:publish-ipld @pub  guardar YAML como nodo IPLD DAG-CBOR estructurado
help-doc-fetch =   .my.doc.<nombre>:fetch <cid>    importar contenido CID (sin ejecución)
help-doc-cid =   .my.doc.<nombre>:cid            mostrar CID guardado
help-doc-del =   .my.doc.<nombre>:              eliminar documento

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
yaml-serialize-error = Error de serialización YAML: { $e }
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
err-edit-decode-failed = edición: fallo de decodificación: { $e }
err-edit-fetch-failed = edición: fallo de carga: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = no hay sesión activa — no se puede eliminar el perfil
profile-delete-error = error al eliminar el perfil: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ninguno)
profiles-deleted = perfil { $name } eliminado
profiles-not-found = perfil no encontrado: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    abrir zion mediante un enlace URL
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
help-header-url = ── parámetros de URL ───────────────────────────────────────────────────────
help-url-intro =   Comparte un enlace que abre zion con un destinatario ya rellenado:
help-url-msg =   ?msg=<did>                   rellena: @<did> (mensaje de texto)
help-url-say =   ?say=<did>                   rellena: @<did>:say (verbo say)
help-url-emote =   ?emote=<did>                 rellena: @<did>:emote (verbo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   El campo se rellena pero no se envía — pulsa Intro para enviar.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publicar tu identidad en la red
help-header-publish = ── publicar identidad ───────────────────────────────────────────────────────
help-publish-intro = Publicar hace que tu identidad sea localizable en la red. Otros pueden buscar tu DID para contactarte.
help-publish-ma = Para publicar necesitas ma (runtime local) instalado. Conecta ego con IPFS/IPNS en tu nombre.
help-publish-steps = Pasos: ejecuta '.my.ma:discover' para detectar tu ma local, luego '.my.identity:publish @ma'.
help-publish-without = Sin publicar, otros no pueden alcanzarte — aunque conozcan tu DID, no pueden resolver tu endpoint.
