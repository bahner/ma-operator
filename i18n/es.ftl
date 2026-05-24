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
msg-reply-sent = respuesta enviada
msg-reply-failed = error al enviar respuesta: { $e }
msg-entity-publish-sent = entidad { $name }: publicación enviada
msg-entity-publish-failed = error al publicar entidad: { $e }
msg-field-publish-sent = entidad { $name }.{ $field }: publicación enviada
msg-field-publish-failed = error al publicar campo: { $e }
msg-acl-publish-sent = ACL de tiempo de ejecución: publicación enviada
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

# ── Verbos — tiempo de ejecución ─────────────────────────────────────────
discover-fetch-failed = descubrimiento fallido en { $url }: { $e }
discover-json-error = descubrimiento fallido: JSON no válido de { $url }: { $e }
discover-missing-did = descubrimiento fallido: status.json falta el campo obligatorio `did`
discover-invalid-did = descubrimiento fallido: se esperaba que `did` comenzara con did:ma:, se recibió `{ $did }`
discover-no-endpoint = advertencia de descubrimiento: `endpoint_id` ausente en status.json; solo se guardó DID
discover-success = ma descubierto en { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma creado — publica con: .my.identity:publish @ma
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
help-config-path =   .config                      mostrar todas las entradas .config.*

help-inbox =   .my.inbox                    listar bandeja de entrada (vista de subárbol)
help-inbox-n =   .my.inbox.N                  mostrar campos de la entrada N
help-inbox-from =   .my.inbox.N.from             DID del remitente para la entrada N
help-inbox-reply =   .my.inbox.N:reply [body]     enviar respuesta (abre editor sin cuerpo)
help-inbox-open =   .my.inbox.N:open             abrir contenido en editor de solo lectura
help-inbox-del =   .my.inbox.N:                 eliminar entrada N
help-inbox-delall =   .my.inbox:                   eliminar todas las entradas de la bandeja de entrada
help-inbox-flush =   .my.inbox:flush              imprimir todas las entradas en el terminal
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
