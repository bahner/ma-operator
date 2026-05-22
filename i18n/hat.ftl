# zion — Kreyòl ayisyen
lang-name = Kreyòl ayisyen

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = konekte
tab-new-identity = nouvo idantite
tab-import = enpòte
label-passphrase = mo sekrè
label-username = non itilizatè
label-confirm-passphrase = konfime mo sekrè
btn-login = konekte
btn-export = ekspòte
btn-generate = jenere
passphrase-warning = Pèdi mo sekrè = pèdi idantite. Pa gen rekiperasyon.
import-help = Chwazi yon fichye .zion.json ekspòte. Pakèt la rete chifre.
status-unlocking = ap debloke...
status-generating = ap jenere idantite...
status-reading-file = ap li fichye...
status-imported = enpòte '{ $name }' — chanje nan onglet Konekte
error-wrong-passphrase = mo sekrè mal: { $e }
error-identity-not-found = idantite '{ $name }' pa jwenn
error-username-required = non itilizatè obligatwa
error-passphrase-required = mo sekrè obligatwa
error-passphrases-no-match = mo sekrè yo pa menm

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — konekte kòm { $username }
msg-type-help = Tape .help pou yon lis kòmand.
msg-connecting = ap konekte nan iroh...
msg-iroh-ready = pwen iroh pare
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ bloke [{ $cap }]: { $from }
msg-focus-cleared = fòkis efase
msg-focusing = fòkis { $did } kòm { $prompt }
msg-set = { $path }: { $value }
msg-deleted = efase { $path } ({ $count } antre)
msg-read-only = { $path } se li sèlman
msg-subtree-set = { $path } se yon sousabèy; refize defini
msg-ancestor-leaf = yon ansèt nan { $path } se yon fèy; refize kouvri
msg-key-not-found = kle pa jwenn: { $path }
msg-no-match = pa gen korèspondans
msg-link-not-connected = erè chèchaj lyen: pa konekte
msg-link-fetch-error = erè chèchaj lyen: { $e }
msg-link-key-not-found = kle `{ $key }` pa jwenn nan dokiman lye a

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = non alias pa ka vid
err-alias-has-fragment = non alias pa ka gen '#'
err-alias-value-fragment = valè alias dwe yon did:ma:<ipns> pou kò li (pa gen fragman)
err-alias-value-path = valè alias dwe yon did:ma:<ipns> pou kò li (pa gen chemen)
err-alias-not-did = valè alias dwe kòmanse ak did:ma:
err-unknown-alias = alias enkoni: @{ $name }
err-bare-did = te atann did:ma:<ipns> pou kò li (pa gen fragman ni chemen), jwenn { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Sove
btn-eval = Evalye
btn-cancel = Anile
btn-close = Fèmen
btn-reply = Repon
btn-publish = Pibliye
msg-reply-sent = repons voye
msg-reply-failed = repons echwe: { $e }
msg-entity-publish-sent = antite { $name }: pibliye voye
msg-entity-publish-failed = pibliye antite echwe: { $e }
msg-field-publish-sent = antite { $name }.{ $field }: pibliye voye
msg-field-publish-failed = pibliye chan echwe: { $e }
msg-acl-publish-sent = ACL runtime: pibliye voye
msg-acl-publish-failed = pibliye ACL runtime echwe: { $e }
msg-yaml-error = erè YAML: { $e }
msg-editor-saved = { $path }:sove
msg-fetch-review = chèche { $cid } — revize anvan evalyasyon
msg-fetch-failed = chèche { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = bwat resepsyon vid
inbox-entry-not-found = antre bwat resepsyon { $n } pa jwenn
inbox-no-message-id = antre bwat resepsyon { $n } pa gen message_id
inbox-no-verb = pa gen vèb `{ $verb }` pou antre bwat resepsyon { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = dekouvèt echwe nan { $url }: { $e }
discover-json-error = dekouvèt echwe: JSON invalid soti { $url }: { $e }
discover-missing-did = dekouvèt echwe: status.json manke chan obligatwa `did`
discover-invalid-did = dekouvèt echwe: te atann `did` kòmanse ak did:ma:, jwenn `{ $did }`
discover-no-endpoint = avètisman dekouvèt: `endpoint_id` manke nan status.json; sèlman DID estoke
discover-success = ma dekouvri nan { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @間 kreye — pibliye ak: .my.identity:publish @間
claim-success = Runtime reklame pou { $did }
claim-conflict = Runtime deja reklame pa yon lòt idantite
claim-http-failed = reklamasyon echwe: HTTP { $status }
claim-error = reklamasyon echwe: { $e }
claim-no-session = pa konekte; konekte dabò pou reklame runtime
runtime-no-verb = pa gen vèb `{ $verb }` pou { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reyinisyalize (konplètman ouvè)
acl-persist-error = erè pèsistans: { $e }
acl-no-verb = pa gen vèb `{ $verb }` pou .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = itilizasyon: .my.identity:publish <did-oswa-alias>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content vid
doc-save-first = { $path }.content vid — sove dabò
doc-missing-name = non dokiman manke
doc-publish-usage = itilizasyon: .my.doc.<non>:publish <piblikatè>
doc-publish-ipld-usage = itilizasyon: .my.doc.<non>:publish-ipld <piblikatè>
doc-publish-failed = pibliye { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = demann depo voye ({ $id }) → { $publisher }; CID ap rive via repons RPC
doc-ipld-store-sent = demann depo IPLD voye ({ $id }) → { $publisher }; CID ap rive via repons RPC
doc-fetch-done = chèche { $cid } → { $path }.content (pa egzekite)
doc-fetch-failed = chèche { $cid }: { $e }
doc-fetch-usage = itilizasyon: .my.doc.<non>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid pa defini
doc-no-verb = pa gen vèb `{ $verb }` pou { $path }
path-no-verb = pa gen vèb `{ $verb }` pou { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Lang disponib yo (mete ak .my.i18n: <code>):
