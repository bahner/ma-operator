# zion — Hausa
lang-name = Hausa

# ── Shafin shiga ──────────────────────────────────────────────────────────
tab-login = shiga
tab-new-identity = sabon asali
tab-import-profile = shigo da bayanan martaba
label-passphrase = kalmar sirri
label-username = sunan mai amfani
label-confirm-passphrase = tabbatar da kalmar sirri
label-did = DID
label-profile-cid = CID na martaba
label-or-file = ko fayil
btn-login = shiga
btn-export = fitar da
btn-generate = samar
btn-new-endpoint = sabon ƙarshe
btn-import-profile = shigo da bayanan martaba
passphrase-warning = Rasa kalmar sirri = rasa asali. Babu dawo.
import-profile-help = Shigo da martabar ta CID ko fayil. Kana bukata kalmar sirri ɗaya da aka yi amfani da ita yayin buga.
import-profile-detected-user = Martabar ta: { $name }
status-unlocking = ana buɗewa...
status-generating = ana samar da asali...
status-reading-file = ana karanta fayil...
status-fetching-profile = ana neman martaba daga IPFS...
status-imported = an shigar da '{ $name }' — je zuwa shafin shiga
status-importing-profile = shigar da martaba...
profile-import-done = an shigo da martabar '{ $name }' — an loda makullin { $n }
error-wrong-passphrase = kalmar sirri ba daidai ba: { $e }
error-identity-not-found = ba a samu asalin '{ $name }' ba
error-username-required = ana buƙatar sunan mai amfani
error-passphrase-required = ana buƙatar kalmar sirri
error-passphrases-no-match = kalmomin sirri ba su dace ba
error-profile-source-required = ba da CID ko loda fayil
error-did-required = shigar DID ɗin ka
error-profile-fetch = ba a iya samun martaba: { $e }
error-profile-no-username = martabar ba ta ƙunshi sunan mai amfani
error-profile-no-identity = asali '{ $name }' ba a samu — fara shigo da asali

# ── Saƙonnin tsarin terminal ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — an shiga a matsayin { $username }
msg-type-help = Rubuta .help don jerin umarni.
msg-connecting = ana haɗawa da iroh...
msg-iroh-ready = ƙarshen iroh ya shirya
msg-iroh-failed = iroh: { $e }
msg-auto-published = An buga DID ta hanyar ma na gida ({ $url })
msg-identity-not-published = Ba a sami ainihi kan layi ba — idan an shigar da ma cikin gida, gudanar da '.ma [port]' sannan '.my.identity!publish @ma'. Rubuta '.help.publish' don cikakken bayani.
msg-blocked = ⊗ an toshe [{ $cap }]: { $from }
msg-focus-cleared = an share mai da hankali
msg-focusing = ana mai da hankali { $did } a matsayin { $prompt }
msg-set = { $path }: { $value }
msg-deleted = an goge { $path } ({ $count } shigarwa)
msg-read-only = { $path } don karatu kawai
msg-subtree-set = { $path } reshe ne; ƙin saita
msg-ancestor-leaf = kakannin { $path } ganye ne; ƙin rufe
msg-key-not-found = ba a samu maɓalli ba: { $path }
msg-no-match = babu daidaituwa
msg-link-not-connected = kuskuren ɗaukar hanyar haɗin: ba a haɗa ba
msg-link-fetch-error = kuskuren ɗaukar hanyar haɗin: { $e }
msg-link-key-not-found = ba a samu maɓalli `{ $key }` a cikin takarda da aka haɗa ba

# ── Tabbatar da laƙabi ────────────────────────────────────────────────────
err-alias-name-empty = sunan laƙabi ba zai iya zama fanko ba
err-alias-has-dot = sunayen laƙabi ba su iya ƙunsar '.' ba
err-alias-has-fragment = sunayen laƙabi ba su iya ƙunsar '#' ba
err-alias-value-fragment = ƙimar laƙabi dole ne ta kasance bare did:ma:<ipns> (babu fragment)
err-alias-value-path = ƙimar laƙabi dole ne ta kasance bare did:ma:<ipns> (babu path)
err-alias-not-did = ƙimar laƙabi dole ne ta fara da did:ma:
err-unknown-alias = laƙabi da ba a sani ba: @{ $name }
err-bare-did = ana tsammanin bare did:ma:<ipns> (babu fragment ko path), an samu { $did }

# ── Mai gyara ─────────────────────────────────────────────────────────────
btn-save = ajiye
btn-eval = gudanar
btn-cancel = soke
btn-close = rufe
btn-reply = amsa
btn-publish = wallafa
btn-publish-ipld = wallafa IPLD
msg-reply-sent = an aika amsa
msg-reply-failed = amsa ta kasa: { $e }
msg-entity-publish-sent = entity { $name }: an aika wallafa
msg-entity-publish-failed = wallafar entity ta kasa: { $e }
msg-kind-publish-failed = buga nau'in ya kasa: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: an aika wallafa
msg-field-publish-failed = wallafar filin ta kasa: { $e }
msg-acl-publish-sent = runtime ACL: an aika wallafa
msg-crud-edit-publish-sent = { $path }: an aika wallafa
msg-acl-publish-failed = wallafar runtime ACL ta kasa: { $e }
msg-yaml-error = kuskuren YAML: { $e }
msg-editor-saved = { $path }:ajiye
msg-fetch-review = an ɗauko { $cid } — duba kafin gudanarwa
msg-fetch-failed = ɗaukar { $cid }: { $e }

# ── Aikatau — akwatin wasiku ──────────────────────────────────────────────
inbox-empty = akwatin wasiku fanko ne
inbox-entry-not-found = ba a samu shigarwar akwatin wasiku { $n } ba
inbox-no-message-id = shigarwar akwatin wasiku { $n } ba ta da message_id
inbox-no-verb = babu aikatau `{ $verb }` don shigarwar akwatin wasiku { $n }
inbox-filter-no-arg = tace tana buƙatar jayayya ta DID ko alias
inbox-filter-empty = babu saƙonnin daga { $did }

# ── Aikatau — lokacin gudana ──────────────────────────────────────────────
discover-fetch-failed = bincike ya kasa a { $url }: { $e }
discover-json-error = bincike ya kasa: JSON mara inganci daga { $url }: { $e }
discover-missing-did = bincike ya kasa: status.json yana rasa filin `did`
discover-invalid-did = bincike ya kasa: `did` dole ne ya fara da did:ma:, an samu `{ $did }`
discover-no-endpoint = gargadin bincike: `endpoint_id` yana rasa a status.json; an ajiye DID kawai
discover-success = an gano ma a { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   an ƙirƙiri laƙabi @ma — gudanar da '.my.identity!publish @ma' don wallafa ainihinku.
claim-success = an ɗauki Runtime don { $did }
claim-conflict = wani asali ya riga ya ɗauki Runtime
claim-http-failed = ɗaukar ya kasa: HTTP { $status }
claim-error = ɗaukar ya kasa: { $e }
claim-no-session = ba a shiga ba; shiga da farko don ɗaukar runtime
runtime-no-verb = babu aikatau `{ $verb }` don { $path }

# ── Aikatau — ACL ─────────────────────────────────────────────────────────
acl-reset = an sake saita .my.acl (buɗe gaba ɗaya)
acl-persist-error = kuskuren ajiye: { $e }
acl-no-verb = babu aikatau `{ $verb }` don .my.acl

# ── Aikatau — asali ───────────────────────────────────────────────────────
publish-usage = amfani: .my.identity!publish <did-ko-laƙabi>
identity-exported = An sauke ƙunshin a matsayin { $filename }
identity-export-failed = Fitarwa ta kasa: { $e }

# ── Aikatau — takardu ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content fanko ne
doc-save-first = { $path }.content fanko ne — ajiye da farko
doc-missing-name = suna na takarda ya ɓace
doc-publish-usage = amfani: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = amfani: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = wallafa { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = an aika buƙatar ajiye ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-ipld-store-sent = an aika buƙatar ajiye IPLD ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-fetch-done = an ɗauko { $cid } → { $path }.content (ba a gudanar ba)
doc-fetch-failed = ɗaukar { $cid }: { $e }
doc-fetch-usage = amfani: .my.doc.<name>!fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = ba a saita { $path }.cid ba
doc-no-verb = babu aikatau `{ $verb }` don { $path }
path-no-verb = babu aikatau `{ $verb }` don { $path }

# ── Rubutun taimako — taken ───────────────────────────────────────────────
help-header-zion = ── umarnan zion ───────────────────────────────────────────────────────────
help-header-messaging = ── aikawasiku ───────────────────────────────────────────────────────────
help-header-focus = ── yanayin mai da hankali ────────────────────────────────────────────────
help-header-config = ── nahawun saitunan gida ─────────────────────────────────────────────────
help-header-common = ── hanyoyin gama gari ────────────────────────────────────────────────────
help-header-inbox = ── akwatin wasiku ────────────────────────────────────────────────────────
help-header-documents = ── takardu ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Rubutun taimako — umarnan zion ────────────────────────────────────────
help-cmd-help =   .help                        wannan rubutu
help-cmd-clear =   .clear                       share terminal
help-cmd-panic =   .panic                       mafita ta ƙarshe — yi amfani idan akwai matsala
help-cmd-history =   .history                     tarihin umarni (maimaita masu jere sun haɗu)
help-cmd-logout =   .logout                      fita
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Rubutun taimako — aikawasiku ──────────────────────────────────────────
help-msg-echo =   @alias                       nuna DID da aka warware (babu aika saƙo)
help-msg-send =   @alias[:verb] body           aika saƙo / RPC zuwa ɗan wasa
help-msg-fragment =   @alias#fragment[:verb] body  aika da fragment DID bayyananne
help-msg-escape =   \@name                       @name na zahiri (babu binciken laƙabi)

# ── Rubutun taimako — yanayin mai da hankali ─────────────────────────────
help-focus-set =   .use @alias [as @name]       mai da hankali a kan ɗan wasa (canza buɗe)
help-focus-clear =   .use                         share mai da hankali

# ── Rubutun taimako — nahawun saitunan ───────────────────────────────────
help-config-get =   .path                        sami ƙimar ganye ko jera ƙananan reshe
help-config-filter =   .path value                  daidaitar bincike (tace da ƙima)
help-config-set =   .path: value                 saita ganye
help-config-delete =   .path:                       goge ganye ko ƙananan reshe
help-config-verb =   .path!verb [args]            kira aikatau gida

# ── Rubutun taimako — hanyoyin gama gari ─────────────────────────────────
help-my =   .my                          nuna duk saitunan sirri
help-aliases =   .my.aliases                  jera laƙabai
help-aliases-set =   .my.aliases.<name>: <did>    ƙara/sabunta laƙabi (bare DID, babu #fragment)
help-aliases-del =   .my.aliases.<name>:          cire laƙabi
help-runtime-discover =   .ma [port]          gano runtime na gida kuma samar da laƙabi @ma
help-runtime-claim =   .ma [port]             ɗauki mallakar runtime da DID ɗinka
help-identity =   .my.identity                 nuna saitunan asali
help-identity-did =   .my.identity.did             nuna DID ɗinka (karatu kawai)
help-identity-publish =   .my.identity!publish @pub    wallafa DID ta hanyar sabis na wallafa
help-identity-export =   .my.identity!export          sauke ƙunshin shaida naka
help-config-path =   .config                      nuna duk shigarwar .config.*

# ── Rubutun taimako — akwatin wasiku ─────────────────────────────────────
help-inbox =   .my.inbox                    jera akwatin wasiku (kallon ƙananan reshe)
help-inbox-n =   .my.inbox.N                  nuna filayen shigarwa N
help-inbox-from =   .my.inbox.N.from             DID mai aika shigarwa N
help-inbox-reply =   .my.inbox.N!reply [body]     aika amsa (buɗa mai gyara idan babu jikin saƙo)
help-inbox-open =   .my.inbox.N!open             buɗa abun ciki don karatu kawai a mai gyara
help-inbox-del =   .my.inbox.N:                 goge shigarwa N
help-inbox-delall =   .my.inbox:                   goge duk shigarwar akwatin wasiku
help-inbox-flush =   .my.inbox!flush              buga duk shigarwa zuwa terminal
help-inbox-filter =   .my.inbox!filter @who        nuna shigarwa daga @who kawai
help-inbox-traverse =   .my.inbox.N.sender.<field>   bincika takarda DID mai aika a hankali

# ── Rubutun taimako — takardu ─────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           buɗa mai gyara tare da abun ciki da aka ajiye
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     ɗauko CID, buɗa don duba kawai
help-doc-eval =   .my.doc.<name>!eval           gudanar da abun ciki da aka ajiye layi-balayi
help-doc-publish =   .my.doc.<name>!publish @pub   ajiye a matsayin blob ɗin da ba a sarrafa ba (kowane nau'i)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  ajiye YAML a matsayin kumbun IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch <cid>    shigo da abun CID (babu gudanarwa)
help-doc-cid =   .my.doc.<name>!cid            nuna CID da aka ajiye
help-doc-del =   .my.doc.<name>:              goge takarda

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Yarukan da ake da su (saita ta .my.i18n: <code>):
err-lang-not-found = harshe ba a sami ba: { $lang }

msg-send-failed = aika aika: { $e }
msg-not-logged-in = ba a shiga ba

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Kuskure na YAML: { $e }
yaml-not-mapping = YAML dole ya kasance mapping (ma'aunin maɓalli: ƙima); rubutun talaka da sauƙaƙu ba za a iya adana su a matsayin DAG-CBOR ba
dagcbor-encode-error = Kuskuren lissafin DAG-CBOR: { $e }
cbor-decode-error = Kuskuren lalata CBOR: { $e }
cbor-json-error = Kuskuren juyawa CBOR zuwa JSON: { $e }
yaml-serialize-error = Kuskuren jerin YAML: { $e }
edit-reply-invalid = Amsa gyara mara inganci
doc-publish-ipld-error = Bugawa IPLD ta kasa: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kuskuren adana tsabtace akwatin shiga: { $e }
err-config-load = Kuskuren loda saita: { $e }
err-lang-persist = Kuskuren adana yare: { $e }
err-history-parse = Kuskuren binciken tarihi: { $e }
err-history-load = Kuskuren loda tarihi: { $e }
err-ipfs-reply-decode = Rashin lalata amsar IPFS: { $e }
err-edit-cbor = Kuskuren gyara CBOR: { $e }
err-popup-blocked = Popup ta toshe ta browser
status-publishing = wallafawa

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = kuskure
rpc-error-detail = kuskure: { $detail }
msg-new-message = ← [{ $from }] saƙo sabon — { $count } a akwatin karɓa
msg-chat = { $sender } yana cewa { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } ya ce { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } ya shiga daki.
room-leave = * { $name } ya bar daki.
room-drop  = * { $name } ya jefa { $thing }.
room-take  = * { $name } ya ɗauki { $thing }.
err-edit-decode-failed = gyara: kuskuren fassara: { $e }
err-edit-fetch-failed = gyara: kuskuren nemo: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = babu takardar izni mai aiki — ba za a iya goge bayanan martaba ba
profile-delete-error = gogewa bayanan martaba ta ci tura: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
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
profiles-empty = (babu)
profiles-deleted = an goge bayanan martaba { $name }
profiles-not-found = ba a samu bayanan martaba ba: { $name }

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

help-topic-url =   .help.url                    buɗe zion ta hanyar URL link
help-header-url = ── sharuɗɗan URL ─────────────────────────────────────────────────────────────────
help-url-intro =   Raba hanyar haɗin zion tare da mai karɓa da aka shigar da shi a gaba:
help-url-msg =   ?msg=<did>                   cika a gaba: @<did> (saƙon rubutu)
help-url-say =   ?say=<did>                   cika a gaba: @<did>:say (fi'ili say)
help-url-emote =   ?emote=<did>                 cika a gaba: @<did>:emote (fi'ili emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Shigarwar an cika a gaba amma ba a aika ba — danna Enter don aika.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                wallafa ainihinku a cikin hanyar sadarwa
help-header-publish = ── wallafa ainihi ───────────────────────────────────────────────────────────
help-publish-intro = Wallafawa yana sa ainihinku ya zama abin samu a cikin hanyar sadarwa. Wasu na iya neman DID ɗinku don tuntubarku.
help-publish-ma = Don wallafawa, kuna buƙatar ma (runtime na cikin gida) da aka shigar. Yana haɗa ego da IPFS/IPNS a madadin ku.
help-publish-steps = Matakan: gudanar da '.ma [port]' don gano ma na cikin gida, sannan '.my.identity!publish @ma'.
help-publish-without = Ba tare da wallafawa ba, wasu ba za su iya kaiwa gare ka ba — ko da sun san DID ɗinka, ba za su iya warware endpoint ɗinka ba.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = Kuskure wajen ɗaukar CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Ba ingantaccen CID ba: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Gargaɗi: Makullin IPNS ɗin ku na sirri zai aika zuwa wannan runtime don wallafa shaida. Yi amfani da runtime da kuka amince da shi gaba ɗaya ne kaɗai.
