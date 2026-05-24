# zion — Suomi
lang-name = Suomi

# ── Kirjautumissivu ───────────────────────────────────────────────────────
tab-login = kirjaudu sisään
tab-new-identity = uusi identiteetti
tab-import = tuo
label-passphrase = salasana
label-username = käyttäjänimi
label-confirm-passphrase = vahvista salasana
btn-login = kirjaudu sisään
btn-export = vie
btn-generate = luo
passphrase-warning = Kadotettu salasana = kadotettu identiteetti. Palautumista ei ole.
import-help = Valitse viety .zion.json-tiedosto. Paketti pysyy salattuna.
status-unlocking = avataan lukitus...
status-generating = luodaan identiteettiä...
status-reading-file = luetaan tiedostoa...
status-imported = tuotiin '{ $name }' — vaihda Kirjaudu sisään -välilehteen
error-wrong-passphrase = väärä salasana: { $e }
error-identity-not-found = identiteettiä '{ $name }' ei löydy
error-username-required = käyttäjänimi vaaditaan
error-passphrase-required = salasana vaaditaan
error-passphrases-no-match = salasanat eivät täsmää

# ── Terminaalijärjestelmäviestit ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — kirjautunut sisään nimellä { $username }
msg-type-help = Kirjoita .help saadaksesi luettelon komennoista.
msg-connecting = yhdistetään iroh:iin...
msg-iroh-ready = iroh-päätepiste valmis
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = vastaus lähetetty
msg-reply-failed = vastauksen lähettäminen epäonnistui: { $e }
msg-entity-publish-sent = entiteetti { $name }: julkaisu lähetetty
msg-entity-publish-failed = entiteetin julkaisu epäonnistui: { $e }
msg-field-publish-sent = entiteetti { $name }.{ $field }: julkaisu lähetetty
msg-field-publish-failed = kentän julkaisu epäonnistui: { $e }
msg-acl-publish-sent = ajonaikainen ACL: julkaisu lähetetty
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

# ── Verbit — ajonaikainen ─────────────────────────────────────────────────
discover-fetch-failed = löytäminen epäonnistui osoitteessa { $url }: { $e }
discover-json-error = löytäminen epäonnistui: virheellinen JSON osoitteesta { $url }: { $e }
discover-missing-did = löytäminen epäonnistui: status.json puuttuu pakollinen kenttä `did`
discover-invalid-did = löytäminen epäonnistui: odotettiin `did`:n alkavan did:ma::lla, saatiin `{ $did }`
discover-no-endpoint = löytämisvaroitus: `endpoint_id` puuttuu status.json:sta; tallennettiin vain DID
discover-success = ma löydettiin osoitteesta { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma luotu — julkaise komennolla: .my.identity:publish @ma
claim-success = Ajonaikainen varattu kohteelle { $did }
claim-conflict = Ajonaikainen on jo varattu toiselle identiteetille
claim-http-failed = varaus epäonnistui: HTTP { $status }
claim-error = varaus epäonnistui: { $e }
claim-no-session = ei kirjautunut sisään; kirjaudu ensin varataksesi ajonaikaisen
runtime-no-verb = ei verbiä `{ $verb }` kohteelle { $path }

# ── Verbit — käyttöoikeuksien hallinta ────────────────────────────────────
acl-reset = .my.acl palautettu (täysin avoin)
acl-persist-error = tallennusvirhe: { $e }
acl-no-verb = ei verbiä `{ $verb }` kohteelle .my.acl

# ── Verbit — identiteetti ─────────────────────────────────────────────────
publish-usage = käyttö: .my.identity:publish <did-tai-alias>

# ── Verbit — asiakirjat ───────────────────────────────────────────────────
doc-content-empty = { $path }.content on tyhjä
doc-save-first = { $path }.content on tyhjä — tallenna ensin
doc-missing-name = asiakirjan nimi puuttuu
doc-publish-usage = käyttö: .my.doc.<nimi>:publish <julkaisija>
doc-publish-ipld-usage = käyttö: .my.doc.<nimi>:publish-ipld <julkaisija>
doc-publish-failed = julkaisu { $path }: { $e }
doc-publish-ipld-failed = ipld-julkaisu { $path }: { $e }
doc-store-sent = tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-ipld-store-sent = IPLD-tallennuspyyntö lähetetty ({ $id }) → { $publisher }; CID saapuu RPC-vastauksen kautta
doc-fetch-done = haettiin { $cid } → { $path }.content (ei suoritettu)
doc-fetch-failed = haku { $cid }: { $e }
doc-fetch-usage = käyttö: .my.doc.<nimi>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ei ole asetettu
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
help-cmd-logout =   .logout                      kirjaudu ulos

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
help-config-verb =   .path:verb [args]            suorita paikallinen verbi

help-my =   .my                          näytä kaikki henkilökohtainen kokoonpano
help-aliases =   .my.aliases                  listaa aliakset
help-aliases-set =   .my.aliases.<name>: <did>    lisää/päivitä alias (pelkkä DID, ei #fragmenttia)
help-aliases-del =   .my.aliases.<name>:          poista alias
help-runtime-discover =   .my.ma:discover          löydä paikallinen ajonaikainen ja luo @ma-alias
help-runtime-claim =   .my.ma:claim             varaa ajonaikainen DID:lläsi
help-identity =   .my.identity                 näytä identiteetin kokoonpano
help-identity-did =   .my.identity.did             näytä oma DID (kirjoitussuojattu)
help-identity-publish =   .my.identity:publish @pub    julkaise oma DID julkaisijan kautta
help-config-path =   .config                      näytä kaikki .config.*-merkinnät

help-inbox =   .my.inbox                    listaa postilaatikko (alipuunäkymä)
help-inbox-n =   .my.inbox.N                  näytä merkinnän N kentät
help-inbox-from =   .my.inbox.N.from             lähettäjän DID merkinnälle N
help-inbox-reply =   .my.inbox.N:reply [body]     lähetä vastaus (avaa editorin ilman bodya)
help-inbox-open =   .my.inbox.N:open             avaa sisältö kirjoitussuojatussa editorissa
help-inbox-del =   .my.inbox.N:                 poista merkintä N
help-inbox-delall =   .my.inbox:                   poista kaikki postilaatikon merkinnät
help-inbox-flush =   .my.inbox:flush              tulosta kaikki merkinnät terminaaliin
help-inbox-traverse =   .my.inbox.N.sender.<kenttä>  traversoi lähettäjän DID-asiakirja viiveellä

help-doc-edit =   .my.doc.<nimi>:edit           avaa editori tallennetulla sisällöllä
help-doc-edit-cid =   .my.doc.<nimi>:edit <cid>     hae CID, avaa tarkasteltavaksi
help-doc-eval =   .my.doc.<nimi>:eval           suorita tallennettu sisältö rivi riviltä
help-doc-publish =   .my.doc.<nimi>:publish @pub   tallenna raakana blobbina (kaikki tyypit)
help-doc-publish-ipld =   .my.doc.<nimi>:publish-ipld @pub  tallenna YAML jäsennettynä DAG-CBOR IPLD-solmuna
help-doc-fetch =   .my.doc.<nimi>:fetch <cid>    tuo CID-sisältö (ei suoritusta)
help-doc-cid =   .my.doc.<nimi>:cid            näytä tallennettu CID
help-doc-del =   .my.doc.<nimi>:              poista asiakirja

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Käytettävissä olevat kielet (aseta .my.i18n: <code>):
err-lang-not-found = kieltä ei löydy: { $lang }

msg-send-failed = lähetys epäonnistui: { $e }
msg-not-logged-in = ei kirjautunut sisään
