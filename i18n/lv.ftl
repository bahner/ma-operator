# zion — Latviešu
lang-name = Latviešu

# ── Pieteikšanās lapa ─────────────────────────────────────────────────────
tab-login = pierakstīties
tab-new-identity = jauna identitāte
tab-import = importēt
label-passphrase = paroles frāze
label-username = lietotājvārds
label-confirm-passphrase = apstiprināt paroles frāzi
btn-login = pierakstīties
btn-export = eksportēt
btn-generate = ģenerēt
passphrase-warning = Zaudēta paroles frāze = zaudēta identitāte. Atjaunošana nav iespējama.
import-help = Izvēlieties eksportētu .zion.json failu. Pakete paliek šifrēta.
status-unlocking = atbloķē...
status-generating = ģenerē identitāti...
status-reading-file = lasa failu...
status-imported = importēja '{ $name }' — pārslēdzieties uz Pieteikšanās cilni
error-wrong-passphrase = nepareiza paroles frāze: { $e }
error-identity-not-found = identitāte '{ $name }' nav atrasta
error-username-required = lietotājvārds ir obligāts
error-passphrase-required = paroles frāze ir obligāta
error-passphrases-no-match = paroles frāzes nesakrīt

# ── Termināļa sistēmas ziņojumi ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — pierakstījies kā { $username }
msg-type-help = Ierakstiet .help, lai iegūtu komandu sarakstu.
msg-connecting = savienojas ar iroh...
msg-iroh-ready = iroh galapunkts gatavs
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ bloķēts [{ $cap }]: { $from }
msg-focus-cleared = fokuss notīrīts
msg-focusing = fokusē { $did } kā { $prompt }
msg-set = { $path }: { $value }
msg-deleted = dzēsa { $path } ({ $count } ierakstus)
msg-read-only = { $path } ir tikai lasāms
msg-subtree-set = { $path } ir apakškoks; iestatīšana atteikta
msg-ancestor-leaf = { $path } priekštecis ir lapa; pārklāšana atteikta
msg-key-not-found = atslēga nav atrasta: { $path }
msg-no-match = nav sakritību
msg-link-not-connected = saites ielādes kļūda: nav savienojuma
msg-link-fetch-error = saites ielādes kļūda: { $e }
msg-link-key-not-found = atslēga `{ $key }` nav atrasta saistītajā dokumentā

# ── Aizstājvārdu validācija ───────────────────────────────────────────────
err-alias-name-empty = aizstājvārda nosaukums nevar būt tukšs
err-alias-has-fragment = aizstājvārda nosaukums nevar saturēt '#'
err-alias-value-fragment = aizstājvārda vērtībai jābūt tīram did:ma:<ipns> (bez fragmenta)
err-alias-value-path = aizstājvārda vērtībai jābūt tīram did:ma:<ipns> (bez ceļa)
err-alias-not-did = aizstājvārda vērtībai jāsākas ar did:ma:
err-unknown-alias = nezināms aizstājvārds: @{ $name }
err-bare-did = gaidīja tīru did:ma:<ipns> (bez fragmenta vai ceļa), saņēma { $did }

# ── Redaktors ─────────────────────────────────────────────────────────────
btn-save = Saglabāt
btn-eval = Izpildīt
btn-cancel = Atcelt
btn-close = Aizvērt
btn-reply = Atbildēt
btn-publish = Publicēt
msg-reply-sent = atbilde nosūtīta
msg-reply-failed = atbildes nosūtīšana neizdevās: { $e }
msg-entity-publish-sent = entītija { $name }: publicēšana nosūtīta
msg-entity-publish-failed = entītijas publicēšana neizdevās: { $e }
msg-field-publish-sent = entītija { $name }.{ $field }: publicēšana nosūtīta
msg-field-publish-failed = lauka publicēšana neizdevās: { $e }
msg-acl-publish-sent = izpildlaika ACL: publicēšana nosūtīta
msg-acl-publish-failed = izpildlaika ACL publicēšana neizdevās: { $e }
msg-yaml-error = YAML kļūda: { $e }
msg-editor-saved = { $path }:saglabāt
msg-fetch-review = ielādēja { $cid } — pārskatiet pirms izpildes
msg-fetch-failed = ielāde { $cid }: { $e }

# ── Darbības vārdi — iesūtne ──────────────────────────────────────────────
inbox-empty = iesūtne ir tukša
inbox-entry-not-found = iesūtnes ieraksts { $n } nav atrasts
inbox-no-message-id = iesūtnes ierakstam { $n } nav message_id
inbox-no-verb = iesūtnes ierakstam { $n } nav darbības vārda `{ $verb }`

# ── Darbības vārdi — izpildlaiks ─────────────────────────────────────────
discover-fetch-failed = atklāšana neizdevās { $url }: { $e }
discover-json-error = atklāšana neizdevās: nepareizs JSON no { $url }: { $e }
discover-missing-did = atklāšana neizdevās: status.json trūkst obligātā lauka `did`
discover-invalid-did = atklāšana neizdevās: gaidīja `did` sākumu ar did:ma:, saņēma `{ $did }`
discover-no-endpoint = atklāšanas brīdinājums: `endpoint_id` trūkst status.json; saglabāja tikai DID
discover-success = ma atklāts { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   aizstājvārds @間 izveidots — publicējiet ar: .my.identity:publish @間
claim-success = Izpildlaiks pieprasīts { $did }
claim-conflict = Izpildlaiks jau pieprasīts citas identitātes
claim-http-failed = pieprasīšana neizdevās: HTTP { $status }
claim-error = pieprasīšana neizdevās: { $e }
claim-no-session = nav pierakstījies; vispirms pierakstieties, lai pieprasītu izpildlaiku
runtime-no-verb = { $path } nav darbības vārda `{ $verb }`

# ── Darbības vārdi — piekļuves kontrole ──────────────────────────────────
acl-reset = .my.acl atiestatīts (pilnīgi atvērts)
acl-persist-error = saglabāšanas kļūda: { $e }
acl-no-verb = .my.acl nav darbības vārda `{ $verb }`

# ── Darbības vārdi — identitāte ──────────────────────────────────────────
publish-usage = lietošana: .my.identity:publish <did-vai-aizstājvārds>

# ── Darbības vārdi — dokumenti ───────────────────────────────────────────
doc-content-empty = { $path }.content ir tukšs
doc-save-first = { $path }.content ir tukšs — vispirms saglabājiet
doc-missing-name = trūkst dokumenta nosaukuma
doc-publish-usage = lietošana: .my.doc.<nosaukums>:publish <izdevējs>
doc-publish-ipld-usage = lietošana: .my.doc.<nosaukums>:publish-ipld <izdevējs>
doc-publish-failed = publicēšana { $path }: { $e }
doc-publish-ipld-failed = ipld-publicēšana { $path }: { $e }
doc-store-sent = saglabāšanas pieprasījums nosūtīts ({ $id }) → { $publisher }; CID pienāks caur RPC atbildi
doc-ipld-store-sent = IPLD-saglabāšanas pieprasījums nosūtīts ({ $id }) → { $publisher }; CID pienāks caur RPC atbildi
doc-fetch-done = ielādēja { $cid } → { $path }.content (nav izpildīts)
doc-fetch-failed = ielāde { $cid }: { $e }
doc-fetch-usage = lietošana: .my.doc.<nosaukums>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nav iestatīts
doc-no-verb = { $path } nav darbības vārda `{ $verb }`
path-no-verb = { $path } nav darbības vārda `{ $verb }`

# ── Palīdzības teksts — virsraksti ────────────────────────────────────────
help-header-zion = ── zion komandas ──────────────────────────────────────────────────────────
help-header-messaging = ── ziņojumi ──────────────────────────────────────────────────────────────
help-header-focus = ── fokusa režīms ─────────────────────────────────────────────────────────
help-header-config = ── lokālā konfigurācijas gramatika ─────────────────────────────────────
help-header-common = ── biežākie ceļi ─────────────────────────────────────────────────────────
help-header-inbox = ── iesūtne ───────────────────────────────────────────────────────────────
help-header-documents = ── dokumenti ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        šis teksts
help-cmd-clear =   .clear                       notīrīt termināli
help-cmd-panic =   .panic                       pēdējais līdzeklis — izmantojiet, ja esat nonācis grūtībās
help-cmd-logout =   .logout                      atteikties

help-msg-echo =   @alias                       parādīt atrisināto DID (ziņojums nav nosūtīts)
help-msg-send =   @alias[:verb] body           nosūtīt ziņojumu / RPC dalībniekam
help-msg-fragment =   @alias#fragment[:verb] body  nosūtīt aizstājvārdam ar skaidru DID fragmentu
help-msg-escape =   \@name                       burtiski @name (nav aizstājvārda meklēšanas)

help-focus-set =   .use @alias [as @name]       fokusēties uz dalībnieku (maina uzvedni)
help-focus-clear =   .use                         notīrīt fokusu

help-config-get =   .path                        iegūt lapas vērtību vai uzskaitīt apakškoku
help-config-filter =   .path value                  meklēšanas filtrs (filtrēt pēc vērtības)
help-config-set =   .path: value                 iestatīt lapu
help-config-delete =   .path:                       dzēst lapu vai apakškoku
help-config-verb =   .path:verb [args]            izpildīt lokālo darbības vārdu

help-my =   .my                          parādīt visu personisko konfigurāciju
help-aliases =   .my.aliases                  uzskaitīt aizstājvārdus
help-aliases-set =   .my.aliases.<name>: <did>    pievienot/atjaunināt aizstājvārdu (tīrs DID, bez #fragmenta)
help-aliases-del =   .my.aliases.<name>:          noņemt aizstājvārdu
help-runtime-discover =   .my.runtime:discover          atklāt lokālo izpildlaiku un izveidot @間 aizstājvārdu
help-runtime-claim =   .my.runtime:claim             pieprasīt izpildlaiku ar savu DID
help-identity =   .my.identity                 parādīt identitātes konfigurāciju
help-identity-did =   .my.identity.did             parādīt savu DID (tikai lasāms)
help-identity-publish =   .my.identity:publish @pub    publicēt savu DID caur izdevēja pakalpojumu
help-config-path =   .config                      parādīt visus .config.* ierakstus

help-inbox =   .my.inbox                    uzskaitīt iesūtni (apakškoka skats)
help-inbox-n =   .my.inbox.N                  parādīt ieraksta N laukus
help-inbox-from =   .my.inbox.N.from             sūtītāja DID ierakstam N
help-inbox-reply =   .my.inbox.N:reply [body]     nosūtīt atbildi (atver redaktoru bez satura)
help-inbox-open =   .my.inbox.N:open             atvērt saturu tikai lasāmā redaktorā
help-inbox-del =   .my.inbox.N:                 dzēst ierakstu N
help-inbox-delall =   .my.inbox:                   dzēst visus iesūtnes ierakstus
help-inbox-flush =   .my.inbox:flush              izdrukāt visus ierakstus terminālī
help-inbox-traverse =   .my.inbox.N.sender.<lauks>  šķērsot sūtītāja DID dokumentu ar kavēšanos

help-doc-edit =   .my.doc.<nosaukums>:edit           atvērt redaktoru ar saglabāto saturu
help-doc-edit-cid =   .my.doc.<nosaukums>:edit <cid>     ielādēt CID, atvērt pārskatīšanai
help-doc-eval =   .my.doc.<nosaukums>:eval           izpildīt saglabāto saturu rindu pa rindai
help-doc-publish =   .my.doc.<nosaukums>:publish @pub   saglabāt kā neapstrādātu blob (visi veidi)
help-doc-publish-ipld =   .my.doc.<nosaukums>:publish-ipld @pub  saglabāt YAML kā strukturētu DAG-CBOR IPLD mezglu
help-doc-fetch =   .my.doc.<nosaukums>:fetch <cid>    importēt CID saturu (nav izpildes)
help-doc-cid =   .my.doc.<nosaukums>:cid            parādīt saglabāto CID
help-doc-del =   .my.doc.<nosaukums>:              dzēst dokumentu

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Pieejamās valodas (iestatīt ar .my.i18n: <code>):
