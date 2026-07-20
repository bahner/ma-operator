# zion — Esperanto
lang-name = Esperanto

# ── Landing page ──────────────────────────────────────────────────────────
tab-login = ensaluti
tab-new-identity = nova identeco
tab-import-profile = importi profilon
label-passphrase = pasfrazo
label-username = uzantnomo
label-confirm-passphrase = konfirmi pasfrazon
label-did = DID
label-profile-cid = profilo CID
label-or-file = aŭ dosiero
btn-login = ensaluti
btn-export = elporti
btn-generate = generi
btn-new-endpoint = nova finpunkto
btn-import-profile = importi profilon
passphrase-warning = Perdita pasfrazo = perdita identeco. Ne ekzistas reakiro.
import-profile-help = Importu profilon per CID aŭ dosiero. Vi bezonas la saman pasfrazon uzatan dum publikigo.
import-profile-detected-user = Profilo apartenas al: { $name }
status-unlocking = malŝlosante...
status-generating = generante idencecon...
status-reading-file = legante dosieron...
status-fetching-profile = alŝutante profilon el IPFS...
status-imported = enportita '{ $name }' — ŝaltu al Ensaluti-langeto
status-importing-profile = importante profilon...
profile-import-done = profilo importita por '{ $name }' — { $n } ŝlosiloj ŝarĝitaj
error-wrong-passphrase = malĝusta pasfrazo: { $e }
error-identity-not-found = identeco '{ $name }' ne trovita
error-username-required = uzantnomo necesa
error-passphrase-required = pasfrazo necesa
error-passphrases-no-match = pasfrazoj ne kongruas
error-profile-source-required = donu CID aŭ alŝutu dosieron
error-did-required = enigu vian DID
error-profile-fetch = ne eblis elŝuti profilon: { $e }
error-profile-no-username = profilo ne enhavas uzantonomon
error-profile-no-identity = identeco '{ $name }' ne trovita — unue importu identecon

# ── Terminal system messages ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — ensalutita kiel { $username }
msg-type-help = Tajpu .help por listo de komandoj.
msg-connecting = konektante al iroh...
msg-iroh-ready = iroh-finpunkto preta
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID publikigita per loka ma ({ $url })
msg-ma-connecting-matrix = provas konekti vin al la 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = loka 間 reklamita
msg-local-ma-already-claimed = loka 間 jam reklamita
msg-local-ma-claim-failed = malsukcesis reklami lokan 間
msg-identity-not-published = Identeco ne trovita en la reto — se ma estas instalita loke, rulu '.ma [port]' poste '.my.identity!publish @ma'. Skribu '.help/publish' por detaloj.
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
err-alias-value-fragment = valoro de kromnomo povas enhavi maksimume unu ne-malplenan DID-URL-fragmenton
err-alias-value-path = valoro de kromnomo devas esti did:ma:<ipns> DID aŭ DID-URL (sen vojo)
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
inbox-filter-no-arg = filtro bezonas DID-aŭ-kromnoman argumenton
inbox-filter-empty = neniu mesaĝo de { $did }

# ── Verbs — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = malkovro malsukcesis ĉe { $url }: { $e }
discover-json-error = malkovro malsukcesis: nevalida JSON de { $url }: { $e }
discover-missing-did = malkovro malsukcesis: status.json mankas bezonata kampo `did`
discover-invalid-did = malkovro malsukcesis: atendis `did` komenci per did:ma:, ricevis `{ $did }`
discover-no-endpoint = malkovro-averto: `endpoint_id` mankas en status.json; nur DID konservita
discover-hint-endpoint-not-found = Konsilo: endpoint ne trovita. Kontrolu ke `ma` montras /status.json ĉe pordo 5003.
discover-hint-server-error = Konsilo: runtime respondis per servila eraro. Kontrolu la `ma`-protokolojn kaj reprovu.
discover-hint-network = Sugesto: problemo pri reto/konekteco. Komencu 40, konfirmu ke localhost:5003 estas atingebla, kaj permesu lokan 101-aliron en la retumilo.
discover-hint-generic = Sugesto: kontrolu 13 kaj 25 Labortablo funkcias, tiam reprovu 59.
discover-success = ma malkovrita ĉe { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   kromnomo @ma kreita — rulu '.my.identity!publish @ma' por publikigi vian identecon.
claim-success = Rultempo reklamita por { $did }
claim-conflict = Rultempo jam reklamita de alia identeco
claim-already-owned = Rultempo jam reklamita de ĉi tiu identeco
claim-http-failed = reklamo malsukcesis: HTTP { $status }
claim-error = reklamo malsukcesis: { $e }
claim-no-session = ne ensalutita; ensalutu unue por reklami rultemon
runtime-no-verb = neniu verbo `{ $verb }` por { $path }

# ── Verbs — ACL ───────────────────────────────────────────────────────────
acl-reset = .my.acl reagordita (plene malfermita)
acl-persist-error = konservad-eraro: { $e }
acl-no-verb = neniu verbo `{ $verb }` por .my.acl

# ── Verbs — identity ─────────────────────────────────────────────────────
publish-usage = uzado: .my.identity!publish <did-aŭ-kromnomo>
identity-exported = Pakaĵo elŝutita kiel { $filename }
identity-export-failed = Eksporto malsukcesis: { $e }

# ── Verbs — documents ────────────────────────────────────────────────────
doc-content-empty = { $path }.content estas malplena
doc-save-first = { $path }.content estas malplena — konservu unue
doc-missing-name = mankas dokumentonomo
doc-publish-usage = uzado: .my.doc.<nomo>!publish <eldonisto>
doc-publish-ipld-usage = uzado: .my.doc.<nomo>!publish-ipld <eldonisto>
doc-publish-failed = publikigi { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publikigo malsukcesa [16]: 28
doc-publish-error-hint = Hint: { $hint }
doc-publish-hint-session = ensalutu denove por ke ego povu aliri viajn identajn ŝlosilojn
doc-publish-hint-target = uzu validan eldoniston DID aŭ kaŝnomon kiu solvas nur 57
doc-publish-hint-network = konfirmu la rultempon de 7 kaj 22 estas atingeblaj, tiam reprovu
doc-publish-hint-resolve = kontrolu, ke la eldonisto DID-dokumento estas publikigita kaj enhavas atingeblan finpunkton
doc-publish-hint-acl = petu la eldonan operatoron permesi vian DID en 48
doc-publish-hint-runtime = rultempo/kromaĵo malakceptis la peton; inspektu la kialon kaj reprovu post fiksado de ento/rultempo
doc-publish-hint-ipfs = kontrolu lokan 12/17 sanon kaj eldonan rultempan staton
doc-publish-hint-unknown = inspektu rultempajn protokolojn por detala kaŭzo kaj reprovu
doc-store-sent = stoka peto sendita ({ $id }) → { $publisher }; CID alvenos per RPC-respondo
doc-ipld-store-sent = IPLD-stoka peto sendita ({ $id }) → { $publisher }; CID alvenos per RPC-respondo
doc-fetch-done = elŝutita { $cid } → { $path }.content (ne efektivigita)
doc-fetch-failed = elŝuti { $cid }: { $e }
doc-fetch-usage = uzado: .my.doc.<nomo>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ne agordita
doc-no-verb = neniu verbo `{ $verb }` por { $path }
path-no-verb = neniu verbo `{ $verb }` por { $path }

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Disponeblaj lingvoj (agordu per .my.i18n: <code>):

err-lang-not-found = lingvo ne trovita: { $lang }

help-header-zion = ── zion-komandoj ──────────────────────────────────────────────────────────
help-header-messaging = ── mesaĝado ───────────────────────────────────────────────────────────────
help-header-config = ── loka agordo-gramatiko ──────────────────────────────────────────────────
help-header-common = ── komunaj vojoj ──────────────────────────────────────────────────────────
help-header-inbox = ── poŝtkesto ──────────────────────────────────────────────────────────────
help-header-documents = ── dokumentoj (.my.doc.*) ─────────────────────────────────────────────────
help-header-i18n = ── lingvo ────────────────────────────── ───────────────────────────────
help-header-ma = ── 3-spaco ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── enirante 間-spacon ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────
help-cmd-help =   .help                        ĉi tiu teksto
help-cmd-clear =   .clear                       malplenigu terminalon
help-cmd-panic =   .panic                       lasta rimedo — uzu se vi perdas sin
help-cmd-history =   .history                     komanda historio (sinsekvaj duplikaĵoj kunfanditaj)
help-cmd-logout =   .logout                      elsaluti
help-cmd-batch =   .batch                       evaluar documento temporal en paralelo
help-cmd-batch-sync =   .batch:sync / .batch         evaluar documento temporal línea por línea
help-msg-echo =   @alias                       montri solvitajn DID/DID-URL (neniu mesaĝo sendita)
help-msg-send =   @alias!msg body / @alias:verb args           sendi mesaĝon / RPC al aktoro
help-msg-fragment =   @alias#fragment:verb body  sendi al alias kun eksplicita DID-fragmento
help-msg-escape =   \@name                       laŭvorta @name (neniu alias-serĉo)
help-config-get =   .path                        akiri folian valoron aŭ listi subarbon
help-config-filter =   .path value                  serĉodemando (filtri per valoro)
help-config-set =   .path: value                 agordi folion
help-config-delete =   .path:                       forigi folion aŭ subarbon
help-config-verb =   .path!verb [args]            alvoki lokan verbon
help-my =   .my                          montri ĉiujn personajn agordojn
help-aliases =   .my.aliases                  listigi aliasnomojn
help-aliases-set =   .my.aliases.<name>: <did-url>    aldonu/ĝisdatigu kromnomon (DID aŭ DID-URL)
help-aliases-del =   .my.aliases.<name>:          forigi aliasnomon
help-runtime-discover =   .ma [port]          malkovri lokan rultemon kaj krei @ma-aliasnomon
help-runtime-claim =   .ma [port]             postuli posedadon de rultemo per via DID
help-identity =   .my.identity                 montri identecajn agordojn
help-identity-did =   .my.identity.did             montri propran DID (nur-legebla)
help-identity-publish =   .my.identity!publish @pub    publikigi propran DID per eldonisto
help-identity-export =   .my.identity!export          elŝutu propran identec-pakaĵon
help-config-path =   .config                      montri ĉiujn .config.*-enrigetojn
help-inbox =   .my.inbox                    listigi poŝtkeston (subarbovido)
help-inbox-n =   .my.inbox.N                  montri kampojn de eniro N
help-inbox-from =   .my.inbox.N.from             sendanta DID de eniro N
help-inbox-reply =   .my.inbox.N!reply [body]     sendi respondon (malfermas redaktilon se ne estas korpo)
help-inbox-open =   .my.inbox.N!open             malfermi enhavon nur-legenda en redaktilo
help-inbox-del =   .my.inbox.N:                 forigi eniro N
help-inbox-delall =   .my.inbox:                   forigi ĉiujn poŝtkestajn enrigetojn
help-inbox-flush =   .my.inbox!flush              presi ĉiujn enrigetojn al terminalo
help-inbox-filter =   .my.inbox!filter @who        montri nur enskribojn de @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   trairi sendantan DID-dokumenton malrapide
help-doc-edit =   .my.doc.<name>!edit           malfermi redaktilon kun konservita enhavo
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     alŝuti CID, malfermi por recenzo nur
help-doc-eval =   .my.doc.<name>!eval           ekzekuti konservitan enhavon linio post linio
help-doc-publish =   .my.doc.<name>!publish @pub   konservi kiel krudan blobon (iu ajn tipo)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  konservi YAML kiel strukturan DAG-CBOR IPLD-nodon
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    importi CID-enhavon (neniu ekzekuto)
help-doc-cid =   .my.doc.<name>!cid            montri konservitan CID
help-doc-del =   .my.doc.<name>:              forigi dokumenton

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n konservas la lingvopreferon ligitan al via identeco.
help-i18n-set = .my.i18n: <code>             elektu la lingvon, kiun 20 uzas por ĉi tiu identeco
help-i18n-list = .my.i18n!list               listigu disponeblajn lingvokodojn

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = La 間-ĉambro estas la spaco inter 間-identecoj. ma helpas tiujn identecojn trovi unu la alian kaj komuniki; kiam via identeco estas publikigita, vi povas partopreni.
help-ma-command =   .ma [port]                   konekti al via loka ma-runtime, legi /status.json, kaj konservi .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikigi vian DID-dokumenton por ke aliaj trovu viajn ŝlosilojn kaj endpoint-on
help-ma-security = La plej klara fidlimo estas via propra ma-runtime kun via propra IPFS Desktop/Kubo. Fora publisher povas utili, sed tiam vi fidas je servo de iu alia.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             kiel eniri la 間-ĉambron

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kiam via identeco estas konata, .enter @ma lasas vin enpaŝi en 間. Trovu mondon, eniru ĝin, kaj partoprenu de tie.
help-ma-entry-steps = Startigu IPFS Desktop kaj ma, poste rulu .ma. Publikigu per .my.identity!publish @ma, trovu mondon, kaj eniru per .enter @ma.
help-ma-entry-command =   .enter @ma                  eniri 間 tra la @ma-runtime
help-ma-entry-toggle =   .enter                       ŝaltu aŭ malŝaltu ĉambran fokuson; via identeco restas aktiva
help-ma-entry-url =   ?enter=<runtime>             eniri post ensaluto el kundividita URL

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
msg-chat = { $sender } diras { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } diras { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } eniras la ĉambron.
room-leave = * { $name } foriras el la ĉambro.
room-drop  = * { $name } faligis { $thing }.
room-take  = * { $name } prenis { $thing }.
err-edit-decode-failed = redaktado: malĉifrada eraro: { $e }
err-edit-fetch-failed = redaktado: prena eraro: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = neniu aktiva sesio — ne eblas forigi profilon
profile-delete-error = forigo de profilo malsukcesis: { $e }
profile-wrong-user = ne povas agordi 11 por alia profilo — nur via propra
profile-wrong-user-name = ne povas agordi 11 por 19 — nur vian propran profilon
profile-no-ma = neniu 3 rultempo agordita — rulu 31 unue
profile-no-cid = neniu 3 stokita por ĉi tiu profilo — rulu 37 unue
profile-no-cid-in-doc = neniu profilo 11 trovita en DID-dokumento — rulu 43 unue
profile-publish-sent = profilo ĉifrita kaj sendita al IPFS; la DID-dokumento estos ĝisdatigita kiam CID alvenos
profile-publish-done = profilo publikigita — DID-dokumento ĝisdatigita per ma.agent CID
profile-publish-failed = profilpublikigo malsukcesis: 24
profile-fetch-done = profilo akirita — 18-ŝlosiloj ŝarĝitaj de 43
profile-fetch-failed = malsukcesa serĉo de profilo: 22
msg-identity-exists = identeco jam publikigita — profilo ĝisdatigita
profile-import-exists = profilo 8 jam ekzistas — unue forigu ĝin
profile-import-wrong-user = dosiero enhavas profilon 22, atenditan 42

# -- CID content operations
cid-op-binary = binara enhavo (ne montrata)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = malsukcesis alporti enhavon: 25
cid-op-unknown = nekonata enhavoperacio: 27
cid-op-wc = { $lines } linioj 18 vortoj 36 signoj
profiles-empty = (neniu)
profiles-deleted = profilo { $name } forigita
profiles-not-found = profilo ne trovita: { $name }

# -- Help topics index
help-header-topics = -- temas -- escribe .help/<topic> para detalles
help-topic-msg =   .help/msg                    mensajería
help-topic-ma = .help/ma                     ma-spaco, eldonado kaj eniro
help-topic-path = .help/path                   loka punkto-voja gramatiko
help-topic-my =   .help/my                     config personal
help-topic-inbox =   .help/inbox                  bandeja de entrada
help-topic-doc =   .help/doc                    documentos
help-topic-actor =   .help/actor                  actor remoto
help-topic-url =   .help/url                    malfermi zion per URL-ligilo
help-topic-i18n = .help/i18n                   lingvoprefero por via identeco
help-unknown-topic =   .help/{ $topic }: tema desconocido

# -- Help actor section
help-header-actor = -- actores remotos
help-actor-echo =   @actor                       mostrar DID resuelto
help-actor-text = @actor[#entity]!msg|!say|!emote body         sendu rektan/babili/emotigan mesaĝon
help-actor-ping = @actor:ping                  viveco ping
help-actor-entities =   @actor/entities              listar entidades
help-actor-entities-get = @actor/entities/<n>          akiri entan nodon
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   agordi enton per 14-referenco
help-actor-entities-edit =   @actor/entities/<n>!edit     editar entidad
help-actor-entities-del = @actor/entities/<n>:         forigi enton
help-actor-config-get =   @actor/config/<key>          obtener valor de config
help-actor-config-set =   @actor/config/<key>: val     establecer valor de config
help-actor-acl = @actor/acl                   akiri 4
help-actor-acl-edit =   @actor/acl!edit              editar ACL
help-actor-fragment =   @actor#entity                enviar al plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC al plugin
help-header-cid-ops = ── 3 aktoro vokas ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  voku enton 15 de 24 kaj atendu ĝian respondon
help-actor-head = (@actor/path)                alportu foran CRUD-enhavon de 31
help-actor-tail = (<bafy...>)                  inkluzivi kaj taksi 21 de 36 41
help-actor-wc = (define x (@actor:verb arg))  konservu 5 respondojn en la seanca medio
help-actor-wc-l = .my.scheme.ma!edit           redakti konservitajn helpantojn de 11 por ĉi tiu identeco
help-header-url = ── URL-parametroj ──────────────────────────────────────────────────────────
help-url-intro =   Kunhavigu ligilon kiu malfermas zion kun antaŭplenigita ricevonto:
help-url-msg =   ?msg=<did>                   antaŭplenigas: @<did>!msg (teksta mesaĝo)
help-url-say =   ?say=<did>                   antaŭplenigas: @<did>!say (verbo say)
help-url-emote =   ?emote=<did>                 antaŭplenigas: @<did>!emote (verbo emote)
help-url-ma = ?ma=<did-or-url>              antaŭplenigi rultempon DID / 23 URL
help-url-enter = ?enter=<runtime>             eniru rultempan mondon post ensaluto
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   La kampo estas antaŭplenita sed ne sendita — premu Enter por sendi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publikigi vian identecon al la reto
help-header-publish = ── publikigi identecon ──────────────────────────────────────────────────────
help-publish-intro = Publikigo faras vian identecon trovebla en la reto. Aliaj povas serĉi vian DID por kontakti vin.
help-publish-ma = Por publikigi, vi bezonas instalitan ma (loka rultempo). Ĝi ligas egon al IPFS/IPNS nome de vi.
help-publish-steps = Paŝoj: rulu '.ma [port]' por detekti lokan ma, poste '.my.identity!publish @ma'.
help-publish-without = Sen publikigo, aliaj ne povas atingi vin — eĉ konante vian DID, ili ne povas solvi vian endpoint.
profile-fetch-did-resolve-failed = DID ankoraŭ ne publikigita — rulu 28 unue, poste 67 vian profilon
profile-update-done = profilo ĝisdatigita — 18-ŝlosiloj kunfanditaj de 43
profile-delete-needs-name = specifu profilnomon: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kolektado de batch — tajpu komandojn, finiĝu per .batch
batch-already-collecting = Jam kolektante aron - unue finiĝu per .batch
batch-empty = Aro estis malplena - nenio kurebla
batch-running = Ejecutando lote…
batch-step-timeout = batpaŝo elĉerpita

batch-done = Lote completado en { $secs }s — { $steps } pasos
batch-done-error = Lote terminado con errores en { $secs }s — { $steps } pasos
msg-timeout = Mensaje agotado (sin respuesta en 60s)
err-unknown-command = nekonata komando: { $path }
err-read-only-path = { $path } estas nurlega
help-cmd-batch-async =   .batch:async / .batch        evaluar documento temporal en paralelo


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Malsukcesis preni CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Nevalida CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Averto: Via IPNS privata ŝlosilo estos sendita al ĉi tiu rultempa servilo por identeca eldonado. Uzu nur ruлtempa servilon, kiun vi plene fidas.
