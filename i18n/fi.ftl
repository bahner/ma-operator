# zion — Suomi
lang-name = Suomi

# ── Kirjautumissivu ───────────────────────────────────────────────────────
tab-login = kirjaudu sisään
tab-new-identity = uusi identiteetti
tab-import-profile = tuo profiili
label-passphrase = salasana
label-username = käyttäjänimi
label-confirm-passphrase = vahvista salasana
label-did = DID
label-profile-cid = profiili-CID
label-or-file = tai tiedosto
btn-login = kirjaudu sisään
btn-export = vie
btn-generate = luo
btn-new-endpoint = uusi päätepiste
btn-import-profile = tuo profiili
passphrase-warning = Kadotettu salasana = kadotettu identiteetti. Palautumista ei ole.
import-profile-help = Tuo profiili CID:n tai tiedoston avulla. Tarvitset saman salasanalauseen, jota käytettiin julkaisemiseen.
import-profile-detected-user = Profiili kuuluu: { $name }
status-unlocking = avataan lukitus...
status-generating = luodaan identiteettiä...
status-reading-file = luetaan tiedostoa...
status-fetching-profile = haetaan profiilia IPFS:stä...
status-imported = tuotiin '{ $name }' — vaihda Kirjaudu sisään -välilehteen
status-importing-profile = tuodaan profiilia...
profile-import-done = profiili tuotu käyttäjälle '{ $name }' — { $n } avainta ladattu
error-wrong-passphrase = väärä salasana: { $e }
error-identity-not-found = identiteettiä '{ $name }' ei löydy
error-username-required = käyttäjänimi vaaditaan
error-passphrase-required = salasana vaaditaan
error-passphrases-no-match = salasanat eivät täsmää
error-profile-source-required = anna CID tai lataa tiedosto
error-did-required = anna DID-tunnuksesi
error-profile-fetch = profiilin hakeminen epäonnistui: { $e }
error-profile-no-username = profiili ei sisällä käyttäjänimeä
error-profile-no-identity = identiteetti '{ $name }' ei löytynyt — tuo identiteetti ensin

# ── Terminaalijärjestelmäviestit ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — kirjautunut sisään nimellä { $username }
msg-type-help = Kirjoita .help saadaksesi luettelon komennoista.
msg-connecting = yhdistetään iroh:iin...
msg-iroh-ready = iroh-päätepiste valmis
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID julkaistu paikallisen ma:n kautta ({ $url })
msg-identity-not-published = Henkilöllisyyttä ei löydetty verkosta — jos ma on asennettu paikallisesti, aja '.ma [port]' sitten '/my/identity!publish @ma'. Kirjoita '.help/publish' yksityiskohtia varten.
msg-blocked = ⊗ estetty [{ $cap }]: { $from }
msg-focus-cleared = kohdistus tyhjennetty
msg-focusing = kohdistetaan { $did } nimellä { $prompt }
msg-set = { $path }: { $value }
msg-deleted = poistettiin { $path } ({ $count } merkintää)
msg-read-only = { $path } on kirjoitussuojattu
msg-subtree-set = { $path } on alipuu; asettaminen hylätty
msg-ancestor-leaf = { $path }:n esi-isä on lehti; varjostaminen hylätty
msg-key-not-found = avainta ei löydy: { $path }
msg-no-match = ei osumia
msg-link-not-connected = linkin noutamisvirhe: ei yhteyttä
msg-link-fetch-error = linkin noutamisvirhe: { $e }
msg-link-key-not-found = avainta `{ $key }` ei löydy linkitetystä asiakirjasta

# ── Aliasvalidointi ───────────────────────────────────────────────────────
err-alias-name-empty = aliaksen nimi ei voi olla tyhjä
err-alias-has-dot = aliaksen nimi ei voi sisältää '.':ää
err-alias-has-fragment = aliaksen nimi ei voi sisältää '#':ää
err-alias-value-fragment = aliaksen arvon on oltava pelkkä did:ma:<ipns> (ei fragmenttia)
err-alias-value-path = aliaksen arvon on oltava pelkkä did:ma:<ipns> (ei polkua)
err-alias-not-did = aliaksen arvon on alettava did:ma::lla
err-unknown-alias = tuntematon alias: @{ $name }
err-bare-did = odotettiin pelkkää did:ma:<ipns>:ää (ei fragmenttia tai polkua), saatiin { $did }

# ── Editori ───────────────────────────────────────────────────────────────
btn-save = Tallenna
btn-eval = Suorita
btn-cancel = Peruuta
btn-close = Sulje
btn-reply = Vastaa
btn-publish = Julkaise
btn-publish-ipld = Julkaise IPLD
msg-reply-sent = vastaus lähetetty
msg-reply-failed = vastauksen lähettäminen epäonnistui: { $e }
msg-entity-publish-sent = entiteetti { $name }: julkaisu lähetetty
msg-entity-publish-failed = entiteetin julkaisu epäonnistui: { $e }
msg-kind-publish-failed = tyypin julkaisu epäonnistui: { $e }
msg-field-publish-sent = entiteetti { $name }.{ $field }: julkaisu lähetetty
msg-field-publish-failed = kentän julkaisu epäonnistui: { $e }
msg-acl-publish-sent = ajonaikainen ACL: julkaisu lähetetty
msg-crud-edit-publish-sent = { $path }: julkaisu lähetetty
msg-acl-publish-failed = ajonaikaisen ACL:n julkaisu epäonnistui: { $e }
msg-yaml-error = YAML-virhe: { $e }
msg-editor-saved = { $path }:tallenna
msg-fetch-review = haettiin { $cid } — tarkista ennen suorittamista
msg-fetch-failed = haku { $cid }: { $e }

# ── Verbit — postilaatikko ────────────────────────────────────────────────
inbox-empty = postilaatikko on tyhjä
inbox-entry-not-found = postilaatikon merkintää { $n } ei löydy
inbox-no-message-id = postilaatikon merkinnällä { $n } ei ole message_id:tä
inbox-no-verb = ei verbiä `{ $verb }` postilaatikon merkinnälle { $n }
inbox-filter-no-arg = suodatin vaatii DID- tai alias-argumentin
inbox-filter-empty = ei viestejä kohteelta { $did }

# ── Verbit — ajonaikainen ─────────────────────────────────────────────────
discover-fetch-failed = löytäminen epäonnistui osoitteessa { $url }: { $e }
discover-json-error = löytäminen epäonnistui: virheellinen JSON osoitteesta { $url }: { $e }
discover-missing-did = löytäminen epäonnistui: status.json puuttuu pakollinen kenttä `did`
discover-invalid-did = löytäminen epäonnistui: odotettiin `did`:n alkavan did:ma::lla, saatiin `{ $did }`
discover-no-endpoint = löytämisvaroitus: `endpoint_id` puuttuu status.json:sta; tallennettiin vain DID
discover-success = ma löydettiin osoitteesta { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma luotu — aja '/my/identity!publish @ma' julkaistaksesi henkilöllisyytesi.
claim-success = Ajonaikainen varattu kohteelle { $did }
claim-conflict = Ajonaikainen on jo varattu toiselle identiteetille
claim-http-failed = varaus epäonnistui: HTTP { $status }
claim-error = varaus epäonnistui: { $e }
claim-no-session = ei kirjautunut sisään; kirjaudu ensin varataksesi ajonaikaisen
runtime-no-verb = ei verbiä `{ $verb }` kohteelle { $path }

# ── Verbit — käyttöoikeuksien hallinta ────────────────────────────────────
acl-reset = /my/acl palautettu (täysin avoin)
acl-persist-error = tallennusvirhe: { $e }
acl-no-verb = ei verbiä `{ $verb }` kohteelle /my/acl

# ── Verbit — identiteetti ─────────────────────────────────────────────────
publish-usage = käyttö: /my/identity!publish <did-tai-alias>
identity-exported = Paketti ladattu nimellä { $filename }
identity-export-failed = Vienti epäonnistui: { $e }

# ── Verbit — asiakirjat ───────────────────────────────────────────────────
doc-content-empty = { $path }/content on tyhjä
doc-save-first = { $path }/content on tyhjä — tallenna ensin
doc-missing-name = asiakirjan nimi puuttuu
doc-publish-usage = käyttö: /my/doc/<nimi>:publish <julkaisija>
doc-publish-ipld-usage = käyttö: /my/doc/<nimi>:publish-ipld <julkaisija>
doc-publish-failed = julkaisu { $path }: { $e }
doc-publish-ipld-failed = ipld-julkaisu { $path }: { $e }
doc-store-sent = tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-ipld-store-sent = IPLD-tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-fetch-done = haettiin { $cid } → { $path }/content (ei suoritettu)
doc-fetch-failed = haku { $cid }: { $e }
doc-fetch-usage = käyttö: /my/doc/<nimi>:fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid ei ole asetettu
doc-no-verb = ei verbiä `{ $verb }` kohteelle { $path }
path-no-verb = ei verbiä `{ $verb }` kohteelle { $path }

# ── Ohjeteksti — otsikot ─────────────────────────────────────────────────
help-header-zion = ── zion-komennot ──────────────────────────────────────────────────────────
help-header-messaging = ── viestit ───────────────────────────────────────────────────────────────
help-header-focus = ── kohdistustila ─────────────────────────────────────────────────────────
help-header-config = ── paikallinen kokoonpanokielioppi ───────────────────────────────────────
help-header-common = ── yleiset polut ─────────────────────────────────────────────────────────
help-header-inbox = ── postilaatikko ─────────────────────────────────────────────────────────
help-header-documents = ── asiakirjat ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tämä teksti
help-cmd-clear =   .clear                       tyhjennä terminaali
help-cmd-panic =   .panic                       viimeinen keino — käytä jos olet pulassa
help-cmd-history =   .history                     komentohistoria (peräkkäiset kaksoiskappaleet yhdistetty)
help-cmd-logout =   .logout                      kirjaudu ulos
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       näytä ratkaistu DID (ei viestiä lähetetty)
help-msg-send =   @alias[:verb] body           lähetä viesti / RPC toimijalle
help-msg-fragment =   @alias#fragment[:verb] body  lähetä aliakselle eksplisiittisellä DID-fragmentilla
help-msg-escape =   \@name                       kirjaimellinen @name (ei aliashakua)

help-focus-set =   .use @alias [as @name]       kohdista toimijaan (muuttaa kehotetta)
help-focus-clear =   .use                         tyhjennä kohdistus

help-config-get =   .path                        hae lehden arvo tai listaa alipuu
help-config-filter =   .path value                  hakusuodatin (suodata arvon mukaan)
help-config-set =   .path: value                 aseta lehti
help-config-delete =   .path:                       poista lehti tai alipuu
help-config-verb =   .path!verb [args]            suorita paikallinen verbi

help-my =   /my                          näytä kaikki henkilökohtainen kokoonpano
help-aliases =   /my/aliases                  listaa aliakset
help-aliases-set =   /my/aliases/<name>: <did>    lisää/päivitä alias (pelkkä DID, ei #fragmenttia)
help-aliases-del =   /my/aliases/<name>:          poista alias
help-runtime-discover =   .ma [port]          löydä paikallinen ajonaikainen ja luo @ma-alias
help-runtime-claim =   .ma [port]             varaa ajonaikainen DID:lläsi
help-identity =   /my/identity                 näytä identiteetin kokoonpano
help-identity-did =   /my/identity/did             näytä oma DID (kirjoitussuojattu)
help-identity-publish =   /my/identity!publish @pub    julkaise oma DID julkaisijan kautta
help-identity-export =   /my/identity!export          lataa oma identiteettipaketti
help-config-path =   .config                      näytä kaikki .config.*-merkinnät

help-inbox =   /my/inbox                    listaa postilaatikko (alipuunäkymä)
help-inbox-n =   /my/inbox/N                  näytä merkinnän N kentät
help-inbox-from =   /my/inbox/N/from             lähettäjän DID merkinnälle N
help-inbox-reply =   /my/inbox/N!reply [body]     lähetä vastaus (avaa editorin ilman bodya)
help-inbox-open =   /my/inbox/N!open             avaa sisältö kirjoitussuojatussa editorissa
help-inbox-del =   /my/inbox/N:                 poista merkintä N
help-inbox-delall =   /my/inbox:                   poista kaikki postilaatikon merkinnät
help-inbox-flush =   /my/inbox!flush              tulosta kaikki merkinnät terminaaliin
help-inbox-filter =   /my/inbox!filter @who        näytä vain @who:n merkinnät
help-inbox-traverse =   /my/inbox/N/sender/<kenttä>  traversoi lähettäjän DID-asiakirja viiveellä

help-doc-edit =   /my/doc/<nimi>:edit           avaa editori tallennetulla sisällöllä
help-doc-edit-cid =   /my/doc/<nimi>:edit <cid>     hae CID, avaa tarkasteltavaksi
help-doc-eval =   /my/doc/<nimi>:eval           suorita tallennettu sisältö rivi riviltä
help-doc-publish =   /my/doc/<nimi>:publish @pub   tallenna raakana blobbina (kaikki tyypit)
help-doc-publish-ipld =   /my/doc/<nimi>:publish-ipld @pub  tallenna YAML jäsennettynä DAG-CBOR IPLD-solmuna
help-doc-fetch =   /my/doc/<nimi>:fetch <cid>    tuo CID-sisältö (ei suoritusta)
help-doc-cid =   /my/doc/<nimi>:cid            näytä tallennettu CID
help-doc-del =   /my/doc/<nimi>:              poista asiakirja

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Käytettävissä olevat kielet (aseta /my/i18n: <code>):
err-lang-not-found = kieltä ei löydy: { $lang }

msg-send-failed = lähetys epäonnistui: { $e }
msg-not-logged-in = ei kirjautunut sisään

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-jäsennysvirhe: { $e }
yaml-not-mapping = YAML:n täytyy olla mapping (avain: arvo -parit); pelkkää tekstiä ja skalaareja ei voi tallentaa DAG-CBOR:na
dagcbor-encode-error = DAG-CBOR-koodausvirhe: { $e }
cbor-decode-error = CBOR-dekoodausvirhe: { $e }
cbor-json-error = CBOR JSON-muunnosvirhe: { $e }
yaml-serialize-error = YAML-sarjallistamisvirhe: { $e }
edit-reply-invalid = Virheellinen muokkausvastaus
doc-publish-ipld-error = IPLD-julkaiseminen epäonnistui: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Postilaatikon siivous tallennusvirhe: { $e }
err-config-load = Konfiguraation latausvirhe: { $e }
err-lang-persist = Kielitallennus virhe: { $e }
err-history-parse = Historiaanalyysivirhe: { $e }
err-history-load = Historian latausvirhe: { $e }
err-ipfs-reply-decode = IPFS-vastauksen dekoodausvirhe: { $e }
err-edit-cbor = CBOR-muokkausvirhe: { $e }
err-popup-blocked = Ponnahdusikkuna estetty selaimelta
status-publishing = julkaistaan

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = virhe
rpc-error-detail = virhe: { $detail }
msg-new-message = ← [{ $from }] uusi viesti — { $count } saapuneissa
msg-chat = { $sender } sanoo { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } sanoo { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } astuu huoneeseen.
room-leave = * { $name } poistuu huoneesta.
room-drop  = * { $name } pudottaa { $thing }.
room-take  = * { $name } nostaa { $thing }.
err-edit-decode-failed = muokkaus: purku epäonnistui: { $e }
err-edit-fetch-failed = muokkaus: haku epäonnistui: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ei aktiivista istuntoa — profiilia ei voi poistaa
profile-delete-error = profiilin poistaminen epäonnistui: { $e }
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
profiles-empty = (ei mitään)
profiles-deleted = profiili { $name } poistettu
profiles-not-found = profiilia ei löydy: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
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

help-topic-url =   .help/url                    zionin avaaminen URL-linkin kautta
help-header-url = ── URL-parametrit ───────────────────────────────────────────────────────────────
help-url-intro =   Jaa linkki, joka avaa zionin esitäytetyllä vastaanottajalla:
help-url-msg =   ?msg=<did>                   esitäyttää: @<did> (tekstiviesti)
help-url-say =   ?say=<did>                   esitäyttää: @<did>:say (verbi say)
help-url-emote =   ?emote=<did>                 esitäyttää: @<did>:emote (verbi emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Syötekenttä on esitäytetty mutta ei lähetetty — paina Enter lähettääksesi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                henkilöllisyyden julkaiseminen verkossa
help-header-publish = ── henkilöllisyyden julkaiseminen ───────────────────────────────────────────
help-publish-intro = Julkaiseminen tekee henkilöllisyytesi löydettäväksi verkossa. Muut voivat hakea DID:äsi tavoittaakseen sinut.
help-publish-ma = Julkaisemiseen tarvitset ma:n (paikallinen ajoympäristö) asennettuna. Se yhdistää egon IPFS/IPNS:ään puolestasi.
help-publish-steps = Vaiheet: aja '.ma [port]' paikallisen ma:n havaitsemiseksi, sitten '/my/identity!publish @ma'.
help-publish-without = Ilman julkaisemista muut eivät voi tavoittaa sinua — vaikka he tietäisivät DID:äsi, he eivät pysty selvittämään endpoint-osoitettasi.
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = CID { $cid } hakeminen epäonnistui: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Virheellinen CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Varoitus: IPNS-yksityisavaimesi lähetetään tälle suorituspalvelulle henkilöllisyytesi julkaisemiseen. Käytä vain suorituspalvelua, johon luotat täysin.
