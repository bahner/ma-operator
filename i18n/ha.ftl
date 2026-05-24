# zion — Hausa
lang-name = Hausa

# ── Shafin shiga ──────────────────────────────────────────────────────────
tab-login = shiga
tab-new-identity = sabon asali
tab-import = shigar da
label-passphrase = kalmar sirri
label-username = sunan mai amfani
label-confirm-passphrase = tabbatar da kalmar sirri
btn-login = shiga
btn-export = fitar da
btn-generate = samar
passphrase-warning = Rasa kalmar sirri = rasa asali. Babu dawo.
import-help = Zaɓi fayil .zion.json da aka fitar. Kunshin yana ɓoye.
status-unlocking = ana buɗewa...
status-generating = ana samar da asali...
status-reading-file = ana karanta fayil...
status-imported = an shigar da '{ $name }' — je zuwa shafin shiga
error-wrong-passphrase = kalmar sirri ba daidai ba: { $e }
error-identity-not-found = ba a samu asalin '{ $name }' ba
error-username-required = ana buƙatar sunan mai amfani
error-passphrase-required = ana buƙatar kalmar sirri
error-passphrases-no-match = kalmomin sirri ba su dace ba

# ── Saƙonnin tsarin terminal ──────────────────────────────────────────────
msg-logged-in = zion v{ $version } — an shiga a matsayin { $username }
msg-type-help = Rubuta .help don jerin umarni.
msg-connecting = ana haɗawa da iroh...
msg-iroh-ready = ƙarshen iroh ya shirya
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = an aika amsa
msg-reply-failed = amsa ta kasa: { $e }
msg-entity-publish-sent = entity { $name }: an aika wallafa
msg-entity-publish-failed = wallafar entity ta kasa: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: an aika wallafa
msg-field-publish-failed = wallafar filin ta kasa: { $e }
msg-acl-publish-sent = runtime ACL: an aika wallafa
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

# ── Aikatau — lokacin gudana ──────────────────────────────────────────────
discover-fetch-failed = bincike ya kasa a { $url }: { $e }
discover-json-error = bincike ya kasa: JSON mara inganci daga { $url }: { $e }
discover-missing-did = bincike ya kasa: status.json yana rasa filin `did`
discover-invalid-did = bincike ya kasa: `did` dole ne ya fara da did:ma:, an samu `{ $did }`
discover-no-endpoint = gargadin bincike: `endpoint_id` yana rasa a status.json; an ajiye DID kawai
discover-success = an gano ma a { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   an ƙirƙiri laƙabi @ma — wallafa da: .my.identity:publish @ma
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
publish-usage = amfani: .my.identity:publish <did-ko-laƙabi>

# ── Aikatau — takardu ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content fanko ne
doc-save-first = { $path }.content fanko ne — ajiye da farko
doc-missing-name = suna na takarda ya ɓace
doc-publish-usage = amfani: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = amfani: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = wallafa { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = an aika buƙatar ajiye ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-ipld-store-sent = an aika buƙatar ajiye IPLD ({ $id }) → { $publisher }; CID zai zo ta RPC amsa
doc-fetch-done = an ɗauko { $cid } → { $path }.content (ba a gudanar ba)
doc-fetch-failed = ɗaukar { $cid }: { $e }
doc-fetch-usage = amfani: .my.doc.<name>:fetch <cid>
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
help-cmd-logout =   .logout                      fita

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
help-config-verb =   .path:verb [args]            kira aikatau gida

# ── Rubutun taimako — hanyoyin gama gari ─────────────────────────────────
help-my =   .my                          nuna duk saitunan sirri
help-aliases =   .my.aliases                  jera laƙabai
help-aliases-set =   .my.aliases.<name>: <did>    ƙara/sabunta laƙabi (bare DID, babu #fragment)
help-aliases-del =   .my.aliases.<name>:          cire laƙabi
help-runtime-discover =   .my.ma:discover          gano runtime na gida kuma samar da laƙabi @ma
help-runtime-claim =   .my.ma:claim             ɗauki mallakar runtime da DID ɗinka
help-identity =   .my.identity                 nuna saitunan asali
help-identity-did =   .my.identity.did             nuna DID ɗinka (karatu kawai)
help-identity-publish =   .my.identity:publish @pub    wallafa DID ta hanyar sabis na wallafa
help-config-path =   .config                      nuna duk shigarwar .config.*

# ── Rubutun taimako — akwatin wasiku ─────────────────────────────────────
help-inbox =   .my.inbox                    jera akwatin wasiku (kallon ƙananan reshe)
help-inbox-n =   .my.inbox.N                  nuna filayen shigarwa N
help-inbox-from =   .my.inbox.N.from             DID mai aika shigarwa N
help-inbox-reply =   .my.inbox.N:reply [body]     aika amsa (buɗa mai gyara idan babu jikin saƙo)
help-inbox-open =   .my.inbox.N:open             buɗa abun ciki don karatu kawai a mai gyara
help-inbox-del =   .my.inbox.N:                 goge shigarwa N
help-inbox-delall =   .my.inbox:                   goge duk shigarwar akwatin wasiku
help-inbox-flush =   .my.inbox:flush              buga duk shigarwa zuwa terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   bincika takarda DID mai aika a hankali

# ── Rubutun taimako — takardu ─────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           buɗa mai gyara tare da abun ciki da aka ajiye
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     ɗauko CID, buɗa don duba kawai
help-doc-eval =   .my.doc.<name>:eval           gudanar da abun ciki da aka ajiye layi-balayi
help-doc-publish =   .my.doc.<name>:publish @pub   ajiye a matsayin blob ɗin da ba a sarrafa ba (kowane nau'i)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  ajiye YAML a matsayin kumbun IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    shigo da abun CID (babu gudanarwa)
help-doc-cid =   .my.doc.<name>:cid            nuna CID da aka ajiye
help-doc-del =   .my.doc.<name>:              goge takarda

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Yarukan da ake da su (saita ta .my.i18n: <code>):
err-lang-not-found = harshe ba a sami ba: { $lang }

msg-send-failed = aika aika: { $e }
msg-not-logged-in = ba a shiga ba
