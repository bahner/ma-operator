# zion — Suomi
lang-name = Suomi
label-nick = kutsumanimi
new-identity-nick-help = Valitse kutsumanimi 間-spaceen. Se on vain kutsumanimi, ja voit muuttaa sen milloin tahansa.
error-nick-required = kutsumanimi vaaditaan
error-nick-invalid = kutsumanimessä ei saa olla välilyöntejä tai @-merkkiä

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
btn-show-qr = näytä QR
btn-scan-qr = skannaa QR
qr-scan-hint = Suuntaa kamera zion-profiilin QR-koodiin.
qr-error-camera = kamera ei käytettävissä: { $e }
qr-error-too-large = profiili on liian suuri QR-koodiin
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
msg-getting-started = Kokeile: say Hello world, look, .help tai help.
msg-connecting = yhdistetään iroh:iin...
msg-iroh-ready = iroh-päätepiste valmis
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID julkaistu paikallisen 間:n kautta ({ $url })
msg-identity-publication-propagating = Identiteetin julkaisu leviää vielä; entry viivästyy: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Julkaistaan identiteettiä. Tämä voi kestää enintään { $seconds } sekuntia.
msg-ma-connecting-matrix = yritetään yhdistää sinut 間trixiin
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = paikallinen 間 varattu
msg-local-ma-already-claimed = paikallinen 間 on jo varattu
msg-local-ma-claim-failed = paikallisen 間 varaaminen epäonnistui
msg-identity-not-published = Henkilöllisyyttä ei löydetty verkosta — jos 間 on asennettu paikallisesti, aja '.ma: claim [port]' sitten '.my.identity!publish @ma'. Kirjoita '.help/publish' yksityiskohtia varten.
msg-blocked = ⊗ estetty [{ $cap }]: { $from }
msg-focus-cleared = kohdistus tyhjennetty
msg-left = left
msg-focusing = kohdistetaan { $did } nimellä { $prompt }
msg-set = { $path }: { $value }
msg-deleted = poistettiin { $path } ({ $count } merkintää)
msg-read-only = { $path } on kirjoitussuojattu
msg-subtree-set = { $path } on alipuu; asettaminen hylätty
msg-ancestor-leaf = { $path }:n esi-isä on lehti; varjostaminen hylätty
msg-key-not-found = avainta ei löydy: { $path }
msg-link-not-connected = linkin noutamisvirhe: ei yhteyttä
msg-link-fetch-error = linkin noutamisvirhe: { $e }
msg-link-key-not-found = avainta `{ $key }` ei löydy linkitetystä asiakirjasta

# ── Aliasvalidointi ───────────────────────────────────────────────────────
err-alias-name-empty = aliaksen nimi ei voi olla tyhjä
err-alias-has-dot = aliaksen nimi ei voi sisältää '.':ää
err-alias-has-fragment = aliaksen nimi ei voi sisältää '#':ää
err-alias-value-fragment = aliaksen arvossa voi olla enintään yksi ei-tyhjä DID-URL-fragmentti
err-alias-value-path = aliaksen arvon on oltava did:ma:<ipns> DID tai DID-URL (ei polkua)
err-alias-not-did = aliaksen arvon on alettava did:ma::lla
err-unknown-alias = tuntematon alias: @{ $name }
err-bare-did = odotettiin pelkkää did:ma:<ipns>:ää (ei fragmenttia tai polkua), saatiin { $did }

# ── Editori ───────────────────────────────────────────────────────────────
btn-save = Tallenna
btn-eval = Suorita
btn-cancel = Peruuta
msg-jobs-cancelled = työt peruttu
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
discover-hint-endpoint-not-found = Vihje: päätepistettä ei löytynyt. Tarkista, että 間 on käynnissä ja tarjoaa /status.json portissa 5003.
discover-hint-server-error = Vihje: ajonaika vastasi palvelinvirheellä. Tarkista 間-lokit ja yritä uudelleen.
discover-hint-network = Vihje: verkko-/yhteysongelma. Käynnistä 間, tarkista että localhost:5003 on saavutettavissa ja salli paikallinen HTTP-yhteys selaimessa.
discover-hint-generic = Vihje: tarkista että 間 ja IPFS Desktop ovat käynnissä, ja yritä `.ma` uudelleen.
discover-success = 間 löydettiin osoitteesta { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma luotu — aja '.my.identity!publish @ma' julkaistaksesi henkilöllisyytesi.
claim-success = Ajonaikainen varattu kohteelle { $did }
claim-conflict = Ajonaikainen on jo varattu toiselle identiteetille
claim-already-owned = Ajonaikainen on jo tämän identiteetin varaama
claim-http-failed = varaus epäonnistui: HTTP { $status }
claim-error = varaus epäonnistui: { $e }
claim-no-session = ei kirjautunut sisään; kirjaudu ensin varataksesi ajonaikaisen
runtime-no-verb = ei verbiä `{ $verb }` kohteelle { $path }

# ── Verbit — käyttöoikeuksien hallinta ────────────────────────────────────
acl-reset = .my.acl palautettu (täysin avoin)
err-persist = tallennusvirhe: { $e }
acl-no-verb = ei verbiä `{ $verb }` kohteelle .my.acl

# ── Verbit — identiteetti ─────────────────────────────────────────────────
publish-usage = käyttö: .my.identity!publish <did-tai-alias>
identity-exported = Paketti ladattu nimellä { $filename }
identity-export-failed = Vienti epäonnistui: { $e }

# ── Verbit — asiakirjat ───────────────────────────────────────────────────
doc-content-empty = { $path } on tyhjä
doc-save-first = { $path } on tyhjä — tallenna ensin
doc-missing-name = asiakirjan nimi puuttuu
doc-publish-usage = käyttö: .my.doc.<nimi>!publish <julkaisija>
doc-publish-ipld-usage = käyttö: .my.doc.<nimi>!publish-ipld <julkaisija>
doc-publish-failed = julkaisu { $path }: { $e }
doc-publish-ipld-failed = ipld-julkaisu { $path }: { $e }
doc-publish-error-detail = julkaisu epäonnistui [{ $code }]: { $err }
doc-publish-error-hint = Vihje: { $hint }
doc-publish-hint-session = kirjaudu uudelleen, jotta ego voi käyttää identiteettiavaimiasi
doc-publish-hint-target = käytä kelvollista julkaisijan DID:tä tai aliasta, joka ratkeaa paljaaksi did:ma:<ipns>
doc-publish-hint-network = tarkista että 間-ajonaika ja IPFS ovat saavutettavissa ja yritä uudelleen
doc-publish-hint-resolve = tarkista että julkaisijan DID-dokumentti on julkaistu ja sisältää saavutettavan päätepisteen
doc-publish-hint-acl = pyydä julkaisijan operaattoria sallimaan DID:si ACL:ssä
doc-publish-hint-runtime = ajonaika/plugin hylkäsi pyynnön; tarkista syy ja yritä uudelleen entiteetin/ajonajan korjauksen jälkeen
doc-publish-hint-ipfs = tarkista paikallisen Kubo/IPFS:n tila ja julkaisijan ajonajan tila
doc-publish-hint-unknown = tarkista ajonaikalokit tarkempaa syytä varten ja yritä uudelleen
doc-store-sent = tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-ipld-store-sent = IPLD-tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-fetch-done = haettiin { $cid } → { $path } (ei suoritettu)
doc-fetch-failed = haku { $cid }: { $e }
doc-fetch-usage = käyttö: .my.doc.<nimi>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ei ole asetettu
doc-no-verb = ei verbiä `{ $verb }` kohteelle { $path }
path-no-verb = ei verbiä `{ $verb }` kohteelle { $path }

# ── Ohjeteksti — otsikot ─────────────────────────────────────────────────
help-header-zion = ── zion-komennot ──────────────────────────────────────────────────────────
help-header-messaging = ── viestit ───────────────────────────────────────────────────────────────
help-header-config = ── paikallinen kokoonpanokielioppi ───────────────────────────────────────
help-header-common = ── yleiset polut ─────────────────────────────────────────────────────────
help-header-inbox = ── postilaatikko ─────────────────────────────────────────────────────────
help-header-documents = ── asiakirjat ────────────────────────────────────────────────────────────
help-header-i18n = ── kieli ───────────────────────────── ─────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── syöttämällä 間-välilyöntiä ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tämä teksti
help-cmd-clear =   .clear                       tyhjennä terminaali
help-cmd-panic =   .panic                       viimeinen keino — käytä jos olet pulassa
help-cmd-history =   .history [n]                 komentohistoria (peräkkäiset kaksoiskappaleet yhdistetty); valinnainen n näyttää vain viimeiset n riviä
help-cmd-logout =   .logout                      kirjaudu ulos
help-cmd-batch =   .batch                       arvioi luonnosdokumentti rinnakkain
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         arvioi luonnosdokumentti riveittäin

help-msg-echo =   @alias                       näytä ratkaistu DID/DID-URL (ei viestiä lähetetty)
help-msg-send =   @alias!msg body / @alias:verb args           lähetä viesti / RPC toimijalle
help-msg-fragment =   @alias#fragment:verb body  lähetä aliakselle eksplisiittisellä DID-fragmentilla
help-msg-escape =   \@name                       kirjaimellinen @name (ei aliashakua)


help-config-get =   .path                        hae lehden arvo tai listaa alipuu
help-config-filter =   .path [nimi]                 listaa nimen sisältävät aliavainten nimet
help-config-full =   .path. [nimi]                listaa nimen sisältävät alipuuhun kuuluvat arvot
help-config-set =   .path: value                 aseta lehti
help-config-delete =   .path:                       poista lehti tai alipuu
help-config-verb =   .path!verb [args]            suorita paikallinen verbi

help-my =   .my                          näytä kaikki henkilökohtainen kokoonpano
help-aliases =   .my.aliases                  listaa aliakset
help-aliases-set =   .my.aliases.<name>: <did-url>    lisää/päivitä alias (DID tai DID-URL)
help-aliases-del =   .my.aliases.<name>:          poista alias
help-runtime-discover =   .ma: claim [port]          löydä paikallinen ajonaikainen ja luo @ma-alias
help-runtime-claim =   .ma: claim [port]             varaa ajonaikainen DID:lläsi
help-identity =   .my.identity                 näytä identiteetin kokoonpano
help-identity-did =   .my.identity.did             näytä oma DID (kirjoitussuojattu)
help-identity-publish =   .my.identity!publish @pub    julkaise oma DID julkaisijan kautta
help-identity-export =   .my.identity!export          lataa oma identiteettipaketti
help-config-path =   .config                      näytä kaikki .config.*-merkinnät

help-inbox =   .my.inbox                    listaa postilaatikko (alipuunäkymä)
help-inbox-n =   .my.inbox.N                  näytä merkinnän N kentät
help-inbox-from =   .my.inbox.N.from             lähettäjän DID merkinnälle N
help-inbox-reply =   .my.inbox.N!reply [body]     lähetä vastaus (avaa editorin ilman bodya)
help-inbox-open =   .my.inbox.N!open             avaa sisältö kirjoitussuojatussa editorissa
help-inbox-del =   .my.inbox.N:                 poista merkintä N
help-inbox-delall =   .my.inbox:                   poista kaikki postilaatikon merkinnät
help-inbox-flush =   .my.inbox!flush              tulosta kaikki merkinnät terminaaliin
help-inbox-filter =   .my.inbox!filter @who        näytä vain @who:n merkinnät
help-inbox-traverse =   .my.inbox.N.sender.<kenttä>  traversoi lähettäjän DID-asiakirja viiveellä

help-doc-edit =   .my.doc.<nimi>!edit           avaa editori tallennetulla sisällöllä
help-doc-edit-cid =   .my.doc.<nimi>!edit /ipfs/<cid>     hae CID, avaa tarkasteltavaksi
help-doc-eval =   .my.doc.<nimi>!eval           suorita tallennettu sisältö rivi riviltä
help-doc-publish =   .my.doc.<nimi>!publish @pub   tallenna raakana blobbina (kaikki tyypit)
help-doc-publish-ipld =   .my.doc.<nimi>!publish-ipld @pub  tallenna YAML jäsennettynä DAG-CBOR IPLD-solmuna
help-doc-fetch =   .my.doc.<nimi>!fetch /ipfs/<cid>    tuo CID-sisältö (ei suoritusta)
help-doc-cid =   .my.doc.<nimi>!cid            näytä tallennettu CID
help-doc-del =   .my.doc.<nimi>:              poista asiakirja

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n tallentaa henkilöllisyytesi mukaiset kieliasetukset.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               luettelo käytettävissä olevista kielikoodeista

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間-huone on tila 間-identiteettien välissä. ma auttaa näitä identiteettejä löytämään toisensa ja kommunikoimaan; kun identiteettisi on julkaistu, voit osallistua.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   yhdistä paikalliseen ma-runtimeen, lue /status.json ja tallenna .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     julkaise DID-dokumenttisi, jotta muut voivat selvittää avaimesi ja endpointisi
help-ma-security = Selkein luottamusraja on oma 間-runtime yhdessä oman IPFS Desktop/Kubon kanssa. Etä-publisher voi olla hyödyllinen, mutta silloin luotat jonkun toisen palveluun.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             miten 間-huoneeseen mennään

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kun identiteettisi tunnetaan, .enter @ma päästää sinut astumaan 間-tilaan. Etsi maailma, mene siihen ja osallistu sieltä.
help-ma-entry-steps = Käynnistä IPFS Desktop ja ma, aja sitten .ma. Julkaise komennolla .my.identity!publish @ma, etsi maailma ja mene sisään komennolla .enter @ma.
help-ma-entry-command =   .enter @ma                  astu 間-tilaan @ma-runtimen kautta
help-ma-entry-toggle =   .enter                       kytke huonefokus päälle tai pois; identiteettisi pysyy aktiivisena
help-ma-entry-url =   ?enter=<runtime>             mene sisään kirjautumisen jälkeen jaetusta URL:sta

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Käytettävissä olevat kielet (aseta .my.i18n: <code>):
err-lang-not-found = kieltä ei löydy: { $lang }

msg-send-failed = lähetys epäonnistui: { $e }
msg-not-logged-in = ei kirjautunut sisään

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-jäsennysvirhe: { $e }
yaml-not-mapping = YAML:n täytyy olla mapping (avain: arvo -parit); pelkkää tekstiä ja skalaareja ei voi tallentaa DAG-CBOR:na
dagcbor-encode-error = DAG-CBOR-koodausvirhe: { $e }
cbor-decode-error = CBOR-dekoodausvirhe: { $e }
cbor-json-error = CBOR JSON-muunnosvirhe: { $e }
yaml-serialise-error = YAML-sarjallistamisvirhe: { $e }
edit-reply-invalid = Virheellinen muokkausvastaus
doc-publish-ipld-error = IPLD-julkaiseminen epäonnistui: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Postilaatikon siivous tallennusvirhe: { $e }
err-config-load = Konfiguraation latausvirhe: { $e }
err-lang-persist = Kielitallennus virhe: { $e }
err-history-parse = Historiaanalyysivirhe: { $e }
err-history-load = Historian latausvirhe: { $e }
err-history-count-invalid = historian määrän on oltava positiivinen kokonaisluku
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
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profiili salattiin ja lähetettiin IPFS:ään; DID-asiakirja päivitetään, kun CID saapuu
profile-publish-done = profiili julkaistu — DID-asiakirja päivitetty ma.agent-CID:llä
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identiteetti on jo julkaistu — profiili ajan tasalla
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binäärisisältö (ei näytetä)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ei mitään)
profiles-deleted = profiili { $name } poistettu
profiles-not-found = profiilia ei löydy: { $name }

# -- Help topics index
help-header-topics = -- aiheet -- kirjoita .help/<topic> saadaksesi tiedot
help-topic-msg =   .help/msg                    viestit
help-topic-ma = .help/ma                     間-avaruus, julkaisu ja merkintä
help-topic-path = .help/path                   paikallinen pistepolun kielioppi
help-topic-my =   .help/my                     henkilökohtainen config
help-topic-inbox =   .help/inbox                  saapuneet
help-topic-doc =   .help/doc                    dokumentit
help-topic-actor =   .help/actor                  etä-actor
help-topic-zscheme =   .help/zscheme               rivinsisäiset Scheme-lausekkeet ja dokumentaatio
help-unknown-topic =   .help/{ $topic }: tuntematon aihe

# -- Help actor section
help-header-actor = -- etätoimijat
help-actor-echo =   @actor                       näytä ratkaistu DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         lähetä suora/chat/emote viesti
help-actor-ping = @actor:ping                  elävyyden ping
help-actor-entities =   @actor/entities              listaa entiteetit
help-actor-entities-get = @actor/entities/<n>          hanki entiteettisolmu
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     muokkaa entiteettiä
help-actor-entities-del = @actor/entities/<n>:         poista kokonaisuus
help-actor-config-get =   @actor/config/<key>          hae config-arvo
help-actor-config-set =   @actor/config/<key>: val     aseta config-arvo
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              muokkaa ACL:ää
help-actor-fragment =   @actor#entity                lähetä pluginille
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC pluginille
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  säilyttää 5-vastaukset istuntoympäristössä
help-actor-wc-l = .z.scheme!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    zionin avaaminen URL-linkin kautta
help-topic-i18n = .help/i18n                   kieliasetus identiteettiäsi varten
help-header-url = ── URL-parametrit ───────────────────────────────────────────────────────────────
help-url-intro =   Jaa linkki, joka avaa zionin esitäytetyllä vastaanottajalla:
help-url-msg =   ?msg=<did>                   esitäyttää: @<did>!msg (tekstiviesti)
help-url-say =   ?say=<did>                   esitäyttää: @<did>!say (verbi say)
help-url-emote =   ?emote=<did>                 esitäyttää: @<did>!emote (verbi emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             Siirry ajonaikaiseen maailmaan kirjautumisen jälkeen
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Syötekenttä on esitäytetty mutta ei lähetetty — paina Enter lähettääksesi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                henkilöllisyyden julkaiseminen verkossa
help-header-publish = ── henkilöllisyyden julkaiseminen ───────────────────────────────────────────
help-publish-intro = Julkaiseminen tekee henkilöllisyytesi löydettäväksi verkossa. Muut voivat hakea DID:äsi tavoittaakseen sinut.
help-publish-ma = Julkaisemiseen tarvitset 間:n (paikallinen ajoympäristö) asennettuna. Se yhdistää egon IPFS/IPNS:ään puolestasi.
help-publish-steps = Vaiheet: aja '.ma: claim [port]' paikallisen ma:n havaitsemiseksi, sitten '.my.identity!publish @ma'.
help-publish-without = Ilman julkaisemista muut eivät voi tavoittaa sinua — vaikka he tietäisivät DID:äsi, he eivät pysty selvittämään endpoint-osoitettasi.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = anna profiilin nimi: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Kerää erää — kirjoita komennot, päättyy .batch
batch-already-collecting = Kerää jo erää – lopeta ensin .batch
batch-empty = Erä oli tyhjä – ei mitään ajamista
batch-running = Ajetaan erää…
batch-step-timeout = erävaihe aikakatkaistiin

batch-done = Erä valmis { $secs }s ajassa — { $steps } vaihetta
batch-done-error = Erä päättyi virheisiin { $secs }s ajassa — { $steps } vaihetta
msg-timeout = Viestin aika loppui (ei vastausta 60s aikana)
err-unknown-command = tuntematon komento: { $path }
err-read-only-path = { $path } on vain luettavissa
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        arvioi luonnosdokumentti rinnakkain


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } hakeminen epäonnistui: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Virheellinen CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Varoitus: IPNS-yksityisavaimesi lähetetään tälle suorituspalvelulle henkilöllisyytesi julkaisemiseen. Käytä vain suorituspalvelua, johon luotat täysin.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme arvioi zion-komentoihin upotetut Scheme-lausekkeet ja liittää tuloksen riville ennen lähettämistä.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    rivinsisäinen esimerkki; lähettää "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             määrittelyt säilyvät nykyisen kirjautumisistunnon ajan
help-zscheme-doc = Dokumentaatio: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Paikallinen IPFS-yhdyskäytävä (vaatii selainpoikkeuksen)

tab-config = Asetukset
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
