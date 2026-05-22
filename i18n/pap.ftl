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
msg-reply-sent = respuesta mandá
msg-reply-failed = respuesta fayá: { $e }
msg-entity-publish-sent = entidad { $name }: publikashon mandá
msg-entity-publish-failed = publikashon di entidad fayá: { $e }
msg-field-publish-sent = entidad { $name }.{ $field }: publikashon mandá
msg-field-publish-failed = publikashon di kamp fayá: { $e }
msg-acl-publish-sent = runtime ACL: publikashon mandá
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
discover-alias-hint =   alias @間 kreá — publiká ku: .my.identity:publish @間
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
