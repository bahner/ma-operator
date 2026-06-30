# zion — Kreyòl ayisyen
lang-name = Kreyòl ayisyen

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = konekte
tab-new-identity = nouvo idantite
tab-import-profile = enpòte pwofil
label-passphrase = mo sekrè
label-username = non itilizatè
label-confirm-passphrase = konfime mo sekrè
label-did = DID
label-profile-cid = CID pwofil
label-or-file = oswa fichye
btn-login = konekte
btn-export = ekspòte
btn-generate = jenere
btn-new-endpoint = nouvo koneksyon
btn-import-profile = enpòte pwofil
passphrase-warning = Pèdi mo sekrè = pèdi idantite. Pa gen rekiperasyon.
import-profile-help = Enpòte yon pwofil pa CID oswa fichye. Ou bezwen menm fraz sekrè a ou te itilize lè ou te pibliye.
import-profile-detected-user = Pwofil la pou: { $name }
status-unlocking = ap debloke...
status-generating = ap jenere idantite...
status-reading-file = ap li fichye...
status-fetching-profile = ap chache pwofil nan IPFS...
status-imported = enpòte '{ $name }' — chanje nan onglet Konekte
status-importing-profile = ap enpòte pwofil...
profile-import-done = pwofil enpòte pou '{ $name }' — { $n } kle chaje
error-wrong-passphrase = mo sekrè mal: { $e }
error-identity-not-found = idantite '{ $name }' pa jwenn
error-username-required = non itilizatè obligatwa
error-passphrase-required = mo sekrè obligatwa
error-passphrases-no-match = mo sekrè yo pa menm
error-profile-source-required = bay yon CID oswa telechaje yon fichye
error-did-required = antre DID ou
error-profile-fetch = pa t ka jwenn pwofil: { $e }
error-profile-no-username = pwofil la pa gen non itilizatè
error-profile-no-identity = idantite '{ $name }' pa jwenn — enpòte idantite anvan

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — konekte kòm { $username }
msg-type-help = Tape .help pou yon lis kòmand.
msg-connecting = ap konekte nan iroh...
msg-iroh-ready = pwen iroh pare
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID pibliye via ma lokal ({ $url })
msg-identity-not-published = Idantite pa jwenn sou entènèt — si ou gen ma ki instalé lokalman, kouri '.ma [port]' epi '.my.identity!publish @ma'. Tape '.help.publish' pou detay.
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
err-alias-has-dot = non alias pa ka gen '.'
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
msg-kind-publish-failed = piblikasyon kalite echwe: { $e }
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
inbox-filter-no-arg = filtre bezwen yon agiman DID oswa alias
inbox-filter-empty = pa gen mesaj soti nan { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = dekouvèt echwe nan { $url }: { $e }
discover-json-error = dekouvèt echwe: JSON invalid soti { $url }: { $e }
discover-missing-did = dekouvèt echwe: status.json manke chan obligatwa `did`
discover-invalid-did = dekouvèt echwe: te atann `did` kòmanse ak did:ma:, jwenn `{ $did }`
discover-no-endpoint = avètisman dekouvèt: `endpoint_id` manke nan status.json; sèlman DID estoke
discover-success = ma dekouvri nan { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma te kreye — kouri '.my.identity!publish @ma' pou pibliye idantite ou.
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
publish-usage = itilizasyon: .my.identity!publish <did-oswa-alias>
identity-exported = Pakè a telechaje kòm { $filename }
identity-export-failed = Ekspòtasyon echwe: { $e }

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
help-cmd-history =   .history                     istwa kòmand (repetisyon konsekitif konbine)
help-cmd-logout =   .logout                      dekonekte
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)
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
help-config-verb =   .path!verb [args]            envoke vèb lokal
help-my =   .my                          montre tout konfigirasyon pèsonèl
help-aliases =   .my.aliases                  liste alias yo
help-aliases-set =   .my.aliases.<name>: <did>    ajoute/mete ajou alias (DID nid, san #fragman)
help-aliases-del =   .my.aliases.<name>:          retire alias
help-runtime-discover =   .ma [port]          dekouvri runtime lokal epi kreye alias @ma
help-runtime-claim =   .ma [port]             reklame pwopriyete runtime avèk DID ou
help-identity =   .my.identity                 montre konfigirasyon idantite
help-identity-did =   .my.identity.did             montre pwòp DID (li sèlman)
help-identity-publish =   .my.identity!publish @pub    pibliye pwòp DID via sèvis pibliye
help-identity-export =   .my.identity!export          telechaje pakè idantite ou
help-config-path =   .config                      montre tout antri .config.*
help-inbox =   .my.inbox                    liste bwat resepsyon (wè souabre)
help-inbox-n =   .my.inbox.N                  montre chan antri N
help-inbox-from =   .my.inbox.N.from             DID expèditè antri N
help-inbox-reply =   .my.inbox.N!reply [body]     voye repons (ouvri editè si pa gen kò)
help-inbox-open =   .my.inbox.N!open             ouvri kontni antri li sèlman nan editè
help-inbox-del =   .my.inbox.N:                 efase antri N
help-inbox-delall =   .my.inbox:                   efase tout antri nan bwat resepsyon
help-inbox-flush =   .my.inbox!flush              enprime tout antri nan terminal
help-inbox-filter =   .my.inbox!filter @who        montre sèlman antre ki soti nan @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   travèse dokiman DID expèditè alèz
help-doc-edit =   .my.doc.<name>!edit           ouvri editè avèk kontni sovgade
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     rekipere CID, ouvri pou revizyon sèlman
help-doc-eval =   .my.doc.<name>!eval           egzekite kontni sovgade liy pa liy
help-doc-publish =   .my.doc.<name>!publish @pub   estoke kòm blob brital (nenpòt tip)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  estoke YAML kòm nœd DAG-CBOR IPLD strukturè
help-doc-fetch =   .my.doc.<name>!fetch <cid>    enpòte kontni CID (pa egzekite)
help-doc-cid =   .my.doc.<name>!cid            montre CID estoke
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
msg-chat = { $sender } di { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } di { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } antre nan chanm lan.
room-leave = * { $name } kite chanm lan.
room-drop  = * { $name } kite { $thing } tonbe.
room-take  = * { $name } ranmase { $thing }.
err-edit-decode-failed = edisyon: echèk dekodaj: { $e }
err-edit-fetch-failed = edisyon: echèk chajman: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = pa gen sesyon aktif — pa kapab efase pwofil la
profile-delete-error = efaseman pwofil echwe: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (okenn)
profiles-deleted = pwofil { $name } efase
profiles-not-found = pwofil pa jwenn: { $name }

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
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities.<n>          get entity
help-actor-entities-set =   @actor.entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities.<n>!edit     edit entity
help-actor-entities-del =   @actor.entities.<n>:         delete entity
help-actor-config-get =   @actor.config.<key>          get config value
help-actor-config-set =   @actor.config.<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    ouvri zion atravè yon lyen URL
help-header-url = ── paramèt URL ──────────────────────────────────────────────────────────────────
help-url-intro =   Pataje yon lyen ki ouvri zion ak yon destinatè ki ranpli davans:
help-url-msg =   ?msg=<did>                   ranpli davans: @<did> (mesaj senp)
help-url-say =   ?say=<did>                   ranpli davans: @<did>:say (vèb say)
help-url-emote =   ?emote=<did>                 ranpli davans: @<did>:emote (vèb emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Champ nan ranpli davans men pa voye — peze Enter pou voye.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                pibliye idantite ou sou rezo a
help-header-publish = ── pibliye idantite ─────────────────────────────────────────────────────────
help-publish-intro = Piblikasyon fè idantite ou jwenn sou rezo a. Lòt moun ka chèche DID ou pou kontakte ou.
help-publish-ma = Pou pibliye, ou bezwen ma (runtime lokal) enstale. Li konekte ego ak IPFS/IPNS nan non ou.
help-publish-steps = Etap: kouri '.ma [port]' pou detekte ma lokal, epi '.my.identity!publish @ma'.
help-publish-without = San piblikasyon, lòt moun pa ka jwenn ou — menm si yo konnen DID ou, yo pa ka rezoud endpoint ou.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then ':publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
batch-step-timeout = batch step timed out

batch-done = batch-done
batch-done-error = batch-done-error
msg-timeout = msg-timeout
help-cmd-batch-async = help-cmd-batch-async


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Pa kapab jwenn CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ki valab: { $value }
