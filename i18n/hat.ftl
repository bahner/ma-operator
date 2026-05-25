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
btn-publish-ipld = Pibliye IPLD
msg-reply-sent = repons voye
msg-reply-failed = repons echwe: { $e }
msg-entity-publish-sent = antite { $name }: pibliye voye
msg-entity-publish-failed = pibliye antite echwe: { $e }
msg-field-publish-sent = antite { $name }.{ $field }: pibliye voye
msg-field-publish-failed = pibliye chan echwe: { $e }
msg-acl-publish-sent = ACL runtime: pibliye voye
msg-crud-edit-publish-sent = { $path }: pibliye voye
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
discover-alias-hint =   alias @ma kreye — pibliye ak: .my.identity:publish @ma
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

err-lang-not-found = lang pa jwenn: { $lang }

help-header-zion = ── kòmand zion ────────────────────────────────────────────────────────────
help-header-messaging = ── mesajri ────────────────────────────────────────────────────────────────
help-header-focus = ── mòd fokis ──────────────────────────────────────────────────────────────
help-header-config = ── gramè konfigirasyon lokal ──────────────────────────────────────────────
help-header-common = ── chemen komen ───────────────────────────────────────────────────────────
help-header-inbox = ── bwat resepsyon ─────────────────────────────────────────────────────────
help-header-documents = ── dokiman (.my.doc.*) ────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        teks sa a
help-cmd-clear =   .clear                       efase terminal
help-cmd-panic =   .panic                       dènye rekous — itilize si ou pèdi
help-cmd-logout =   .logout                      dekonekte
help-msg-echo =   @alias                       montre DID rezoud la (pa voye mesaj)
help-msg-send =   @alias[:verb] body           voye mesaj / RPC bay aktè
help-msg-fragment =   @alias#fragment[:verb] body  voye ba alias avèk fragman DID eksplisit
help-msg-escape =   \@name                       @name literal (pa chèche alias)
help-focus-set =   .use @alias [as @name]       fokis sou aktè (chanje pwomp)
help-focus-clear =   .use                         efase fokis
help-config-get =   .path                        jwenn valè fèy oswa liste souabre
help-config-filter =   .path value                  rekèt match (filtre pa valè)
help-config-set =   .path: value                 mete fèy
help-config-delete =   .path:                       efase fèy oswa souabre
help-config-verb =   .path:verb [args]            envoke vèb lokal
help-my =   .my                          montre tout konfigirasyon pèsonèl
help-aliases =   .my.aliases                  liste alias yo
help-aliases-set =   .my.aliases.<name>: <did>    ajoute/mete ajou alias (DID nid, san #fragman)
help-aliases-del =   .my.aliases.<name>:          retire alias
help-runtime-discover =   .my.ma:discover          dekouvri runtime lokal epi kreye alias @ma
help-runtime-claim =   .my.ma:claim             reklame pwopriyete runtime avèk DID ou
help-identity =   .my.identity                 montre konfigirasyon idantite
help-identity-did =   .my.identity.did             montre pwòp DID (li sèlman)
help-identity-publish =   .my.identity:publish @pub    pibliye pwòp DID via sèvis pibliye
help-config-path =   .config                      montre tout antri .config.*
help-inbox =   .my.inbox                    liste bwat resepsyon (wè souabre)
help-inbox-n =   .my.inbox.N                  montre chan antri N
help-inbox-from =   .my.inbox.N.from             DID expèditè antri N
help-inbox-reply =   .my.inbox.N:reply [body]     voye repons (ouvri editè si pa gen kò)
help-inbox-open =   .my.inbox.N:open             ouvri kontni antri li sèlman nan editè
help-inbox-del =   .my.inbox.N:                 efase antri N
help-inbox-delall =   .my.inbox:                   efase tout antri nan bwat resepsyon
help-inbox-flush =   .my.inbox:flush              enprime tout antri nan terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   travèse dokiman DID expèditè alèz
help-doc-edit =   .my.doc.<name>:edit           ouvri editè avèk kontni sovgade
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     rekipere CID, ouvri pou revizyon sèlman
help-doc-eval =   .my.doc.<name>:eval           egzekite kontni sovgade liy pa liy
help-doc-publish =   .my.doc.<name>:publish @pub   estoke kòm blob brital (nenpòt tip)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  estoke YAML kòm nœd DAG-CBOR IPLD strukturè
help-doc-fetch =   .my.doc.<name>:fetch <cid>    enpòte kontni CID (pa egzekite)
help-doc-cid =   .my.doc.<name>:cid            montre CID estoke
help-doc-del =   .my.doc.<name>:              efase dokiman

msg-send-failed = echèk voye: { $e }
msg-not-logged-in = ou pa konekte

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erè pars YAML: { $e }
yaml-not-mapping = YAML dwe yon mapping (pè kle: valè); tèks senp ak skalè pa ka estoke kòm DAG-CBOR
dagcbor-encode-error = Erè kodaj DAG-CBOR: { $e }
cbor-decode-error = Erè dekodaj CBOR: { $e }
cbor-json-error = Erè CBOR a JSON: { $e }
yaml-serialize-error = Erè serializasyon YAML: { $e }
edit-reply-invalid = Repons edisyon ki valid pa
doc-publish-ipld-error = Piblikasyon IPLD echwe: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Erè sove netwayaj bwat resepsyon: { $e }
err-config-load = Erè chajman konfigirasyon: { $e }
err-lang-persist = Erè sove lang: { $e }
err-history-parse = Erè pars istwa: { $e }
err-history-load = Erè chajman istwa: { $e }
err-ipfs-reply-decode = Echèk dekodaj repons IPFS: { $e }
err-edit-cbor = Erè edisyon CBOR: { $e }
err-popup-blocked = Popup bloke pa navigatè
status-publishing = ap pibliye

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = erè
rpc-error-detail = erè: { $detail }
msg-new-message = ← [{ $from }] nouvo mesaj — { $count } nan bwat resepsyon
err-edit-decode-failed = edisyon: echèk dekodaj: { $e }
err-edit-fetch-failed = edisyon: echèk chajman: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = pa gen sesyon aktif — pa kapab efase pwofil la
profile-delete-error = efaseman pwofil echwe: { $e }
profile-no-verb = .my.profile: vèb enkoni: { $verb }
