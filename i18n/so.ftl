# zion — Soomaaliga
lang-name = Soomaali

# ── Bogga gelitaanka ──────────────────────────────────────────────────────
tab-login = gal
tab-new-identity = aqoonsi cusub
tab-import = keeni gudaha
label-passphrase = ereyga sirta
label-username = magaca isticmaalaha
label-confirm-passphrase = xaqiiji ereyga sirta
btn-login = gal
btn-export = soo saar
btn-generate = abuur
passphrase-warning = Luminta ereyga sirta = luminta aqoonsigu. Soo noqosho ma jirto.
import-help = Dooro faylka .zion.json ee la soo saaray. Xidhmadda way ku xidnaataa sirta.
status-unlocking = la furayo...
status-generating = aqoonsiga la abuurayo...
status-reading-file = faylka la akhriyayo...
status-imported = '{ $name }' ayaa la keenay — u beddel taabka gelitaanka
error-wrong-passphrase = ereyga sirta waa khalad: { $e }
error-identity-not-found = aqoonsiga '{ $name }' lama helin
error-username-required = magaca isticmaalaha ayaa loo baahan yahay
error-passphrase-required = ereyga sirta ayaa loo baahan yahay
error-passphrases-no-match = ereyada sirta kuma habboona

# ── Fariimaha nidaamka terminal ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — waad galeen ahaan { $username }
msg-type-help = Qor .help si aad u hesho liiska amarka.
msg-connecting = iroh lagula xidhanayo...
msg-iroh-ready = dhamaadka iroh ayaa diyaar ah
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = Aqoonsigaaga lama helin internetka — orod '.my.identity:publish @ma' si aad u gacan-siisato.
msg-blocked = ⊗ la xiday [{ $cap }]: { $from }
msg-focus-cleared = xushmadda la tirtiray
msg-focusing = xushmadda { $did } ahaan { $prompt }
msg-set = { $path }: { $value }
msg-deleted = { $path } la tirtirtay ({ $count } gelitaan)
msg-read-only = { $path } waxaa loo akhrin karaa oo keliya
msg-subtree-set = { $path } geed yar ah; diiday in la dhigo
msg-ancestor-leaf = awoowayaasha { $path } caleenta ah; diiday in la dabooло
msg-key-not-found = furaha lama helin: { $path }
msg-no-match = wax la mid ah ma jiro
msg-link-not-connected = khaladka qaadashada xidhmada: lama xidhin
msg-link-fetch-error = khaladka qaadashada xidhmada: { $e }
msg-link-key-not-found = furaha `{ $key }` dokumantigii la xidhay lama helin

# ── Xaqiijinta magaca kale ────────────────────────────────────────────────
err-alias-name-empty = magaca magaca kale ma noqon karo mid maran
err-alias-has-dot = magacyada kale kuma jiri karaan '.'
err-alias-has-fragment = magacyada kale kuma jiri karaan '#'
err-alias-value-fragment = qiimaha magaca kale waa inuu noqdaa bare did:ma:<ipns> (fragment la'aan)
err-alias-value-path = qiimaha magaca kale waa inuu noqdaa bare did:ma:<ipns> (path la'aan)
err-alias-not-did = qiimaha magaca kale waa inuu ku billowdo did:ma:
err-unknown-alias = magaca kale aan la garanin: @{ $name }
err-bare-did = bare did:ma:<ipns> ayaa la filaayay (fragment ama path la'aan), { $did } ayaa la helay

# ── Tifatiraha ────────────────────────────────────────────────────────────
btn-save = keydi
btn-eval = socodsii
btn-cancel = jooji
btn-close = xidh
btn-reply = jawaab
btn-publish = daabac
btn-publish-ipld = daabac IPLD
msg-reply-sent = jawaabta la diray
msg-reply-failed = jawaabtu ku guuldareysatay: { $e }
msg-entity-publish-sent = entity { $name }: daabacaadda la diray
msg-entity-publish-failed = daabacaadda entity ku guuldareysatay: { $e }
msg-kind-publish-failed = daabacaadda nooca waxay ku guuldarraystay: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: daabacaadda la diray
msg-field-publish-failed = daabacaadda goobta ku guuldareysatay: { $e }
msg-acl-publish-sent = runtime ACL: daabacaadda la diray
msg-crud-edit-publish-sent = { $path }: daabacaadda la diray
msg-acl-publish-failed = daabacaadda runtime ACL ku guuldareysatay: { $e }
msg-yaml-error = khaladka YAML: { $e }
msg-editor-saved = { $path }:keydi
msg-fetch-review = { $cid } la soo qaatay — dib u eeg ka hor socodsiinta
msg-fetch-failed = qaadashada { $cid }: { $e }

# ── Ficilada — sanduuqa gelitaanka ────────────────────────────────────────
inbox-empty = sanduuqa gelitaanku wuu maran yahay
inbox-entry-not-found = gelitaanka sanduuqa { $n } lama helin
inbox-no-message-id = gelitaanka sanduuqa { $n } message_id ma laha
inbox-no-verb = ficil `{ $verb }` gelitaanka sanduuqa { $n } ma jiro

# ── Ficilada — wakhtiga shaqada ───────────────────────────────────────────
discover-fetch-failed = ogaanshaha ku guuldareystay { $url }: { $e }
discover-json-error = ogaanshaha ku guuldareystay: JSON khalad ah oo ka timid { $url }: { $e }
discover-missing-did = ogaanshaha ku guuldareystay: status.json goobta `did` waad ka maqan tahay
discover-invalid-did = ogaanshaha ku guuldareystay: `did` waa inuu ku billowdo did:ma:, `{ $did }` la helay
discover-no-endpoint = digniin ogaanshaha: `endpoint_id` ka maqan status.json; DID oo keliya la keydiay
discover-success = ma laga ogaaday { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   magaca kale @ma la abuuray — daabac khadkan: .my.identity:publish @ma
claim-success = Runtime waxaa loo hantiyay { $did }
claim-conflict = Runtime aqoonsi kale ayaa hore u hantiyay
claim-http-failed = codsigii ku guuldareystay: HTTP { $status }
claim-error = codsigii ku guuldareystay: { $e }
claim-no-session = lama gelin; gal horta si aad u hantido runtime
runtime-no-verb = ficil `{ $verb }` { $path } ma jiro

# ── Ficilada — ACL ────────────────────────────────────────────────────────
acl-reset = .my.acl dib loo dejiyay (si buuxda u furan)
acl-persist-error = khaladka keydinта: { $e }
acl-no-verb = ficil `{ $verb }` .my.acl ma jiro

# ── Ficilada — aqoonsiga ──────────────────────────────────────────────────
publish-usage = isticmaalka: .my.identity:publish <did-ama-magaca-kale>

# ── Ficilada — dokumantigyada ─────────────────────────────────────────────
doc-content-empty = { $path }.content wuu maran yahay
doc-save-first = { $path }.content wuu maran yahay — horta keydi
doc-missing-name = magaca dokumantigga waa la waayay
doc-publish-usage = isticmaalka: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = isticmaalka: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = daabacaadda { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = codsiga kaydinta la diray ({ $id }) → { $publisher }; CID waxay ku imaanaysaa jawaabta RPC
doc-ipld-store-sent = codsiga kaydinta IPLD la diray ({ $id }) → { $publisher }; CID waxay ku imaanaysaa jawaabta RPC
doc-fetch-done = { $cid } la soo qaatay → { $path }.content (lama socodsiin)
doc-fetch-failed = qaadashada { $cid }: { $e }
doc-fetch-usage = isticmaalka: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid lama dejin
doc-no-verb = ficil `{ $verb }` { $path } ma jiro
path-no-verb = ficil `{ $verb }` { $path } ma jiro

# ── Gargaarku — cinwaanada ────────────────────────────────────────────────
help-header-zion = ── amarka zion ────────────────────────────────────────────────────────────
help-header-messaging = ── farriin diridda ───────────────────────────────────────────────────────
help-header-focus = ── xaaladda xushmadda ────────────────────────────────────────────────────
help-header-config = ── naxwaha dejinta deegaanka ─────────────────────────────────────────────
help-header-common = ── wadooyinka caadiga ah ─────────────────────────────────────────────────
help-header-inbox = ── sanduuqa gelitaanka ────────────────────────────────────────────────────
help-header-documents = ── dokumantigyada ────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Gargaarku — amarka zion ───────────────────────────────────────────────
help-cmd-help =   .help                        qoraalkan
help-cmd-clear =   .clear                       nadiifi terminal
help-cmd-panic =   .panic                       xallinta ugu dambeysa — isticmaal haddaad dhibaato ku jirto
help-cmd-history =   .history                     taariikhda amarrada (nuqulaha xiriirka biirtay)
help-cmd-logout =   .logout                      ka bax

# ── Gargaarku — farriin diridda ───────────────────────────────────────────
help-msg-echo =   @alias                       tus DID la xalliyay (farriin la dirin)
help-msg-send =   @alias[:verb] body           dir farriin / RPC u sheegto actor
help-msg-fragment =   @alias#fragment[:verb] body  dir xidhmad leh DID fragment cad
help-msg-escape =   \@name                       @name dhab ah (raadinta magaca kale ma jirto)

# ── Gargaarku — xaaladda xushmadda ───────────────────────────────────────
help-focus-set =   .use @alias [as @name]       xushmad ku samee actor (prompt ayaa isbeddelaa)
help-focus-clear =   .use                         xushmadda tirtir

# ── Gargaarku — naxwaha dejinta ───────────────────────────────────────────
help-config-get =   .path                        hel qiimaha caleenta ama liiska geedka yar
help-config-filter =   .path value                  weydiimaha la xidhiidhiya (u habeynta qiimaha)
help-config-set =   .path: value                 dejiso caleenta
help-config-delete =   .path:                       tirtir caleenta ama geedka yar
help-config-verb =   .path:verb [args]            wac ficilka deegaanka

# ── Gargaarku — wadooyinka caadiga ah ────────────────────────────────────
help-my =   .my                          tus dhammaan dejintada shakhsiga
help-aliases =   .my.aliases                  liisko magacyada kale
help-aliases-set =   .my.aliases.<name>: <did>    ku dar/cusbooneysii magaca kale (bare DID, #fragment la'aan)
help-aliases-del =   .my.aliases.<name>:          ka saar magaca kale
help-runtime-discover =   .my.ma:discover          ogaw runtime deegaanka oo abuur magaca kale @ma
help-runtime-claim =   .my.ma:claim             hantida runtime DID-kaagana
help-identity =   .my.identity                 tus dejinta aqoonsiga
help-identity-did =   .my.identity.did             tus DID-kaaga (akhrin oo keliya)
help-identity-publish =   .my.identity:publish @pub    DID u daabac adeegga daabacaadda
help-config-path =   .config                      tus dhammaan gelitaanada .config.*

# ── Gargaarku — sanduuqa gelitaanka ──────────────────────────────────────
help-inbox =   .my.inbox                    liisko sanduuqa gelitaanka (aragtida geedka yar)
help-inbox-n =   .my.inbox.N                  tus goobaha gelitaanka N
help-inbox-from =   .my.inbox.N.from             DID wariyaha gelitaanka N
help-inbox-reply =   .my.inbox.N:reply [body]     dir jawaab (fur tifatiraha haddaan jiraan jirka)
help-inbox-open =   .my.inbox.N:open             fur waxa ku jira si loo akhriyo oo keliya tifatiraha
help-inbox-del =   .my.inbox.N:                 tirtir gelitaanka N
help-inbox-delall =   .my.inbox:                   tirtir dhammaan gelitaanada sanduuqa
help-inbox-flush =   .my.inbox:flush              daabac dhammaan gelitaanada terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   orod dokumantigga DID wariyaha si tartiib ah

# ── Gargaarku — dokumantigyada ────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           fur tifatiraha leh waxa la keydiay
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     qaado CID, fur dib-u-eegista oo keliya
help-doc-eval =   .my.doc.<name>:eval           soccodsii waxa la keydiay sadar-sadar
help-doc-publish =   .my.doc.<name>:publish @pub   keydi ahaan blob cuur ah (nooc kasta)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  keydi YAML ahaan node IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    soo geliso waxa CID ka jira (lama socodsiin)
help-doc-cid =   .my.doc.<name>:cid            tus CID la keydiay
help-doc-del =   .my.doc.<name>:              tirtir dokumantigga

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Luqadaha la heli karo (ku dejiso .my.i18n: <code>):
err-lang-not-found = luqadda lama helin: { $lang }

msg-send-failed = dirista way fashilaatay: { $e }
msg-not-logged-in = lama gelin

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Khalad falanqaynta YAML: { $e }
yaml-not-mapping = YAML waa inay tahay mapping (labojibbaar furaha: qiimaha); qoraalka caadiga ah iyo qiimaynta kuma kaydi kartid DAG-CBOR
dagcbor-encode-error = Khalad koodiyeynta DAG-CBOR: { $e }
cbor-decode-error = Khalad koodka-goynta CBOR: { $e }
cbor-json-error = Khalad CBOR→JSON: { $e }
yaml-serialize-error = Khalad taxnada YAML: { $e }
edit-reply-invalid = Jawaab tafatirka ah oo aan saxnayn
doc-publish-ipld-error = Daabacaadda IPLD waxay ku guuldarreysatay: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Khalad kaydinta nadiifinta sanduuqa galitaanka: { $e }
err-config-load = Khalad dejinta habaynta: { $e }
err-lang-persist = Khalad kaydinta luqadda: { $e }
err-history-parse = Khalad falanqaynta tariikhdda: { $e }
err-history-load = Khalad dejinta tariikhdda: { $e }
err-ipfs-reply-decode = Khalad koodka-goynta jawaabta IPFS: { $e }
err-edit-cbor = Khalad tafatirka CBOR: { $e }
err-popup-blocked = Daaqadda pop-up waxaa xidday daaweynaha
status-publishing = daabacaad

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = khalad
rpc-error-detail = khalad: { $detail }
msg-new-message = ← [{ $from }] fariin cusub — { $count } sanduuqa
err-edit-decode-failed = tafatirka: khalad sharraxaad: { $e }
err-edit-fetch-failed = tafatirka: khalad keenista: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ma jirto fadhiga firfircoon — liiska ma la tirsan karo
profile-delete-error = tirirka liiska wuu guul-dareystay: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (midna)
profiles-deleted = liiska { $name } la tiriyey
profiles-not-found = liiska lama helin: { $name }

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

help-topic-url =   .help.url                    furista zion adeegsiga xiriirka URL
help-header-url = ── cabbirada URL ─────────────────────────────────────────────────────────────────
help-url-intro =   La wadaag xiriir si loo furo zion oo leh qofka la xiriira ee hore loo buuxiyey:
help-url-msg =   ?msg=<did>                   hore u buuxi: @<did> (fariin fudud)
help-url-say =   ?say=<did>                   hore u buuxi: @<did>:say (fal say)
help-url-emote =   ?emote=<did>                 hore u buuxi: @<did>:emote (fal emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Gelinta waa la buuxiyey laakiin lama dirin — riix Enter si aad u dirto.
