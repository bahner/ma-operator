# zion — Esperanto
lang-name = Esperanto

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = ensaluti
tab-new-identity = nova identeco
tab-import = enporti
label-passphrase = pasfrazo
label-username = uzantnomo
label-confirm-passphrase = konfirmi pasfrazon
btn-login = ensaluti
btn-export = elporti
btn-generate = generi
passphrase-warning = Perdita pasfrazo = perdita identeco. Ne ekzistas reakiro.
import-help = Elektu eksportitan .zion.json dosieron. La pakaĵo restas ĉifrita.
status-unlocking = malŝlosante...
status-generating = generante idencecon...
status-reading-file = legante dosieron...
status-imported = enportita '{ $name }' — ŝaltu al Ensaluti-langeto
error-wrong-passphrase = malĝusta pasfrazo: { $e }
error-identity-not-found = identeco '{ $name }' ne trovita
error-username-required = uzantnomo necesa
error-passphrase-required = pasfrazo necesa
error-passphrases-no-match = pasfrazoj ne kongruas

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ensalutita kiel { $username }
msg-type-help = Tajpu .help por listo de komandoj.
msg-connecting = konektante al iroh...
msg-iroh-ready = iroh-finpunkto preta
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Identeco ne trovita rete — rulu '.my.identity:publish @ma' por fariĝi atingebla.
msg-blocked = ⊗ blokita [{ $cap }]: { $from }
msg-focus-cleared = fokuso malaktivigita
msg-focusing = fokuso { $did } kiel { $prompt }
msg-set = { $path }: { $value }
msg-deleted = forigita { $path } ({ $count } eroj)
msg-read-only = { $path } estas nur-lega
msg-subtree-set = { $path } estas subarbeto; rifuzas agordi
msg-ancestor-leaf = prapatrino de { $path } estas folio; rifuzas kaŝi
msg-key-not-found = ŝlosilo ne trovita: { $path }
msg-no-match = neniu kongruaĵo
msg-link-not-connected = ligilo-elŝut-eraro: ne konektita
msg-link-fetch-error = ligilo-elŝut-eraro: { $e }
msg-link-key-not-found = ŝlosilo `{ $key }` ne trovita en ligita dokumento

# ── Alias validation ──────────────────────────────────────────────────────
err-alias-name-empty = kromnomo ne povas esti malplena
err-alias-has-dot = kromnomo ne povas enhavi '.'
err-alias-has-fragment = kromnomo ne povas enhavi '#'
err-alias-value-fragment = valoro de kromnomo devas esti nuda did:ma:<ipns> (sen fragmento)
err-alias-value-path = valoro de kromnomo devas esti nuda did:ma:<ipns> (sen vojo)
err-alias-not-did = valoro de kromnomo devas komenci per did:ma:
err-unknown-alias = nekonata kromnomo: @{ $name }
err-bare-did = atendis nudan did:ma:<ipns> (sen fragmento aŭ vojo), ricevis { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Konservi
btn-eval = Taksi
btn-cancel = Nuligi
btn-close = Fermi
btn-reply = Respondi
btn-publish = Publikigi
btn-publish-ipld = Publikigi IPLD
msg-reply-sent = respondo sendita
msg-reply-failed = respondo malsukcesis: { $e }
msg-entity-publish-sent = entiteco { $name }: publikigo sendita
msg-entity-publish-failed = entiteca publikigo malsukcesis: { $e }
msg-kind-publish-failed = tipo-eldonado malsukcesis: { $e }
msg-field-publish-sent = entiteco { $name }.{ $field }: publikigo sendita
msg-field-publish-failed = kampa publikigo malsukcesis: { $e }
msg-acl-publish-sent = rultempo-ACL: publikigo sendita
msg-crud-edit-publish-sent = { $path }: publikigo sendita
msg-acl-publish-failed = rultempo-ACL-publikigo malsukcesis: { $e }
msg-yaml-error = YAML-eraro: { $e }
msg-editor-saved = { $path }:konservita
msg-fetch-review = elŝutita { $cid } — reviziu antaŭ taksado
msg-fetch-failed = elŝuti { $cid }: { $e }

# ── Verbs — inbox ─────────────────────────────────────────────────────────
inbox-empty = ricevujo malplena
inbox-entry-not-found = ricevujo-ero { $n } ne trovita
inbox-no-message-id = ricevujo-ero { $n } ne havas message_id
inbox-no-verb = neniu verbo `{ $verb }` por ricevujo-ero { $n }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = malkovro malsukcesis ĉe { $url }: { $e }
discover-json-error = malkovro malsukcesis: nevalida JSON de { $url }: { $e }
discover-missing-did = malkovro malsukcesis: status.json mankas bezonata kampo `did`
discover-invalid-did = malkovro malsukcesis: atendis `did` komenci per did:ma:, ricevis `{ $did }`
discover-no-endpoint = malkovro-averto: `endpoint_id` mankas en status.json; nur DID konservita
discover-success = ma malkovrita ĉe { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   kromnomo @ma kreita — publikigi per: .my.identity:publish @ma
claim-success = Rultempo reklamita por { $did }
claim-conflict = Rultempo jam reklamita de alia identeco
claim-http-failed = reklamo malsukcesis: HTTP { $status }
claim-error = reklamo malsukcesis: { $e }
claim-no-session = ne ensalutita; ensalutu unue por reklami rultemon
runtime-no-verb = neniu verbo `{ $verb }` por { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reagordita (plene malfermita)
acl-persist-error = konservad-eraro: { $e }
acl-no-verb = neniu verbo `{ $verb }` por .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uzado: .my.identity:publish <did-aŭ-kromnomo>

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content estas malplena
doc-save-first = { $path }.content estas malplena — konservu unue
doc-missing-name = mankas dokumentonomo
doc-publish-usage = uzado: .my.doc.<nomo>:publish <eldonisto>
doc-publish-ipld-usage = uzado: .my.doc.<nomo>:publish-ipld <eldonisto>
doc-publish-failed = publikigi { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = stoka peto sendita ({ $id }) → { $publisher }; CID alvenos per RPC-respondo
doc-ipld-store-sent = IPLD-stoka peto sendita ({ $id }) → { $publisher }; CID alvenos per RPC-respondo
doc-fetch-done = elŝutita { $cid } → { $path }.content (ne efektivigita)
doc-fetch-failed = elŝuti { $cid }: { $e }
doc-fetch-usage = uzado: .my.doc.<nomo>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ne agordita
doc-no-verb = neniu verbo `{ $verb }` por { $path }
path-no-verb = neniu verbo `{ $verb }` por { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Disponeblaj lingvoj (agordu per .my.i18n: <code>):

err-lang-not-found = lingvo ne trovita: { $lang }

help-header-zion = ── zion-komandoj ──────────────────────────────────────────────────────────
help-header-messaging = ── mesaĝado ───────────────────────────────────────────────────────────────
help-header-focus = ── fokusa reĝimo ──────────────────────────────────────────────────────────
help-header-config = ── loka agordo-gramatiko ──────────────────────────────────────────────────
help-header-common = ── komunaj vojoj ──────────────────────────────────────────────────────────
help-header-inbox = ── poŝtkesto ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumentoj (.my.doc.*) ─────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        ĉi tiu teksto
help-cmd-clear =   .clear                       malplenigu terminalon
help-cmd-panic =   .panic                       lasta rimedo — uzu se vi perdas sin
help-cmd-history =   .history                     komanda historio (sinsekvaj duplikaĵoj kunfanditaj)
help-cmd-logout =   .logout                      elsaluti
help-msg-echo =   @alias                       eĥigi solvitan DID (neniu mesaĝo sendita)
help-msg-send =   @alias[:verb] body           sendi mesaĝon / RPC al aktoro
help-msg-fragment =   @alias#fragment[:verb] body  sendi al alias kun eksplicita DID-fragmento
help-msg-escape =   \@name                       laŭvorta @name (neniu alias-serĉo)
help-focus-set =   .use @alias [as @name]       fokusi sur aktoro (ŝanĝas promptan)
help-focus-clear =   .use                         viŝi fokuson
help-config-get =   .path                        akiri folian valoron aŭ listi subarbon
help-config-filter =   .path value                  serĉodemando (filtri per valoro)
help-config-set =   .path: value                 agordi folion
help-config-delete =   .path:                       forigi folion aŭ subarbon
help-config-verb =   .path:verb [args]            alvoki lokan verbon
help-my =   .my                          montri ĉiujn personajn agordojn
help-aliases =   .my.aliases                  listigi aliasnomojn
help-aliases-set =   .my.aliases.<name>: <did>    aldoni/ĝisdatigi aliasnomon (nuda DID, sen #fragmento)
help-aliases-del =   .my.aliases.<name>:          forigi aliasnomon
help-runtime-discover =   .my.ma:discover          malkovri lokan rultemon kaj krei @ma-aliasnomon
help-runtime-claim =   .my.ma:claim             postuli posedadon de rultemo per via DID
help-identity =   .my.identity                 montri identecajn agordojn
help-identity-did =   .my.identity.did             montri propran DID (nur-legebla)
help-identity-publish =   .my.identity:publish @pub    publikigi propran DID per eldonisto
help-config-path =   .config                      montri ĉiujn .config.*-enrigetojn
help-inbox =   .my.inbox                    listigi poŝtkeston (subarbovido)
help-inbox-n =   .my.inbox.N                  montri kampojn de eniro N
help-inbox-from =   .my.inbox.N.from             sendanta DID de eniro N
help-inbox-reply =   .my.inbox.N:reply [body]     sendi respondon (malfermas redaktilon se ne estas korpo)
help-inbox-open =   .my.inbox.N:open             malfermi enhavon nur-legenda en redaktilo
help-inbox-del =   .my.inbox.N:                 forigi eniro N
help-inbox-delall =   .my.inbox:                   forigi ĉiujn poŝtkestajn enrigetojn
help-inbox-flush =   .my.inbox:flush              presi ĉiujn enrigetojn al terminalo
help-inbox-traverse =   .my.inbox.N.sender.<field>   trairi sendantan DID-dokumenton malrapide
help-doc-edit =   .my.doc.<name>:edit           malfermi redaktilon kun konservita enhavo
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     alŝuti CID, malfermi por recenzo nur
help-doc-eval =   .my.doc.<name>:eval           ekzekuti konservitan enhavon linio post linio
help-doc-publish =   .my.doc.<name>:publish @pub   konservi kiel krudan blobon (iu ajn tipo)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  konservi YAML kiel strukturan DAG-CBOR IPLD-nodon
help-doc-fetch =   .my.doc.<name>:fetch <cid>    importi CID-enhavon (neniu ekzekuto)
help-doc-cid =   .my.doc.<name>:cid            montri konservitan CID
help-doc-del =   .my.doc.<name>:              forigi dokumenton

msg-send-failed = sendo malsukcesis: { $e }
msg-not-logged-in = ne ensalutinta

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-analizilo eraro: { $e }
yaml-not-mapping = YAML devas esti mapo (ŝlosilo: valoro-paroj); simpla teksto kaj skalaro ne povas esti storitaj kiel DAG-CBOR
dagcbor-encode-error = DAG-CBOR-kodado eraro: { $e }
cbor-decode-error = CBOR-dekodado eraro: { $e }
cbor-json-error = CBOR al JSON eraro: { $e }
yaml-serialize-error = YAML-serialigado eraro: { $e }
edit-reply-invalid = Nevalida redakta respondo
doc-publish-ipld-error = IPLD-publikigo malsukcesis: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Prizorgadaj konservado eraro: { $e }
err-config-load = Agordaj ŝarĝado eraro: { $e }
err-lang-persist = Lingvo konservado eraro: { $e }
err-history-parse = Historia analizilo eraro: { $e }
err-history-load = Historia ŝarĝado eraro: { $e }
err-ipfs-reply-decode = IPFS-respondo dekodado malsukcesis: { $e }
err-edit-cbor = CBOR-redaktado eraro: { $e }
err-popup-blocked = Fenestro blokita de retumilo
status-publishing = eldonas

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = eraro
rpc-error-detail = eraro: { $detail }
msg-new-message = ← [{ $from }] nova mesaĝo — { $count } en ricevujo
err-edit-decode-failed = redaktado: malĉifrada eraro: { $e }
err-edit-fetch-failed = redaktado: prena eraro: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = neniu aktiva sesio — ne eblas forigi profilon
profile-delete-error = forigo de profilo malsukcesis: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (neniu)
profiles-deleted = profilo { $name } forigita
profiles-not-found = profilo ne trovita: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    malfermi zion per URL-ligilo
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
help-header-url = ── URL-parametroj ──────────────────────────────────────────────────────────
help-url-intro =   Kunhavigu ligilon kiu malfermas zion kun antaŭplenigita ricevonto:
help-url-msg =   ?msg=<did>                   antaŭplenigas: @<did> (teksta mesaĝo)
help-url-say =   ?say=<did>                   antaŭplenigas: @<did>:say (verbo say)
help-url-emote =   ?emote=<did>                 antaŭplenigas: @<did>:emote (verbo emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   La kampo estas antaŭplenita sed ne sendita — premu Enter por sendi.
