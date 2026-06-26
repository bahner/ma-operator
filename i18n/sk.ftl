# zion — Slovenčina
lang-name = Slovenčina

# ── Prihlasovacia stránka ─────────────────────────────────────────────────
tab-login = prihlásiť
tab-new-identity = nová identita
tab-import = importovať
label-passphrase = prístupová fráza
label-username = používateľské meno
label-confirm-passphrase = potvrdiť prístupovú frázu
btn-login = prihlásiť
btn-export = exportovať
btn-generate = generovať
btn-new-endpoint = nový koncový bod
passphrase-warning = Stratená prístupová fráza = stratená identita. Obnova nie je možná.
import-help = Vyberte exportovaný súbor .zion.json. Balíček zostane zašifrovaný.
status-unlocking = odomykanie...
status-generating = generovanie identity...
status-reading-file = čítanie súboru...
status-imported = '{ $name }' importované — prejdite na záložku Prihlásiť
error-wrong-passphrase = nesprávna prístupová fráza: { $e }
error-identity-not-found = identita '{ $name }' nenájdená
error-username-required = používateľské meno je povinné
error-passphrase-required = prístupová fráza je povinná
error-passphrases-no-match = prístupové frázy sa nezhodujú

# ── Systémové správy terminálu ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — prihlásený ako { $username }
msg-type-help = Napíšte .help pre zoznam príkazov.
msg-connecting = pripájanie k iroh...
msg-iroh-ready = iroh endpoint pripravený
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID zverejnené cez lokálne ma ({ $url })
msg-identity-not-published = Identita nenájdená online — ak máš ma nainštalované lokálne, spusti '.my.ma:discover' a potom '.my.identity:publish @ma'. Napíš '.help.publish' pre podrobnosti.
msg-blocked = ⊗ zablokované [{ $cap }]: { $from }
msg-focus-cleared = fokus vymazaný
msg-focusing = zameranie na { $did } ako { $prompt }
msg-set = { $path }: { $value }
msg-deleted = vymazané { $path } ({ $count } záznamov)
msg-read-only = { $path } je len na čítanie
msg-subtree-set = { $path } je podstrom; nastavenie odmietnuté
msg-ancestor-leaf = predok { $path } je list; tieňovanie odmietnuté
msg-key-not-found = kľúč nenájdený: { $path }
msg-no-match = žiadna zhoda
msg-link-not-connected = chyba načítania odkazu: nepripojené
msg-link-fetch-error = chyba načítania odkazu: { $e }
msg-link-key-not-found = kľúč `{ $key }` nenájdený v prepojenom dokumente

# ── Overenie aliasov ──────────────────────────────────────────────────────
err-alias-name-empty = názov aliasu nesmie byť prázdny
err-alias-has-dot = názov aliasu nesmie obsahovať '.'
err-alias-has-fragment = názov aliasu nesmie obsahovať '#'
err-alias-value-fragment = hodnota aliasu musí byť čisté did:ma:<ipns> (bez fragmentu)
err-alias-value-path = hodnota aliasu musí byť čisté did:ma:<ipns> (bez cesty)
err-alias-not-did = hodnota aliasu musí začínať did:ma:
err-unknown-alias = neznámy alias: @{ $name }
err-bare-did = očakávané čisté did:ma:<ipns> (bez fragmentu alebo cesty), prijaté { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Uložiť
btn-eval = Spustiť
btn-cancel = Zrušiť
btn-close = Zatvoriť
btn-reply = Odpovedať
btn-publish = Publikovať
btn-publish-ipld = Publikovať IPLD
msg-reply-sent = odpoveď odoslaná
msg-reply-failed = odoslanie odpovede zlyhalo: { $e }
msg-entity-publish-sent = entita { $name }: publikácia odoslaná
msg-entity-publish-failed = publikovanie entity zlyhalo: { $e }
msg-kind-publish-failed = zverejnenie typu zlyhalo: { $e }
msg-field-publish-sent = entita { $name }.{ $field }: publikácia odoslaná
msg-field-publish-failed = publikovanie poľa zlyhalo: { $e }
msg-acl-publish-sent = ACL runtime: publikácia odoslaná
msg-crud-edit-publish-sent = { $path }: publikácia odoslaná
msg-acl-publish-failed = publikovanie ACL runtime zlyhalo: { $e }
msg-yaml-error = chyba YAML: { $e }
msg-editor-saved = { $path }:uložiť
msg-fetch-review = { $cid } načítané — skontrolujte pred spustením
msg-fetch-failed = načítanie { $cid }: { $e }

# ── Slovesá — doručená pošta ──────────────────────────────────────────────
inbox-empty = doručená pošta je prázdna
inbox-entry-not-found = záznam { $n } doručenej pošty nenájdený
inbox-no-message-id = záznam { $n } doručenej pošty nemá message_id
inbox-no-verb = žiadne sloveso `{ $verb }` pre záznam { $n } doručenej pošty
inbox-filter-no-arg = filter vyžaduje argument DID alebo alias
inbox-filter-empty = žiadne správy od { $did }

# ── Slovesá — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = zisťovanie zlyhalo na { $url }: { $e }
discover-json-error = zisťovanie zlyhalo: neplatný JSON z { $url }: { $e }
discover-missing-did = zisťovanie zlyhalo: status.json chýba povinné pole `did`
discover-invalid-did = zisťovanie zlyhalo: očakávané `did` začínajúce did:ma:, prijaté `{ $did }`
discover-no-endpoint = varovanie zisťovania: `endpoint_id` chýba v status.json; uložené len DID
discover-success = ma zistené na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma vytvorený — spusti '.my.identity:publish @ma' na zverejnenie svojej identity.
claim-success = Runtime prevzatý pre { $did }
claim-conflict = Runtime už prevzatý inou identitou
claim-http-failed = prevzatie zlyhalo: HTTP { $status }
claim-error = prevzatie zlyhalo: { $e }
claim-no-session = neprihlásený; najprv sa prihláste pre prevzatie runtime
runtime-no-verb = žiadne sloveso `{ $verb }` pre { $path }

# ── Slovesá — riadenie prístupu ───────────────────────────────────────────
acl-reset = .my.acl obnovené (plne otvorené)
acl-persist-error = chyba ukladania: { $e }
acl-no-verb = žiadne sloveso `{ $verb }` pre .my.acl

# ── Slovesá — identita ────────────────────────────────────────────────────
publish-usage = použitie: .my.identity:publish <did-alebo-alias>
identity-exported = Balík stiahnutý ako { $filename }
identity-export-failed = Export zlyhal: { $e }

# ── Slovesá — dokumenty ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prázdne
doc-save-first = { $path }.content je prázdne — najprv uložte
doc-missing-name = chýba názov dokumentu
doc-publish-usage = použitie: .my.doc.<názov>:publish <vydavateľ>
doc-publish-ipld-usage = použitie: .my.doc.<názov>:publish-ipld <vydavateľ>
doc-publish-failed = publikovanie { $path }: { $e }
doc-publish-ipld-failed = publikovanie IPLD { $path }: { $e }
doc-store-sent = žiadosť o uloženie odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-ipld-store-sent = žiadosť o uloženie IPLD odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-fetch-done = { $cid } načítané → { $path }.content (nespustené)
doc-fetch-failed = načítanie { $cid }: { $e }
doc-fetch-usage = použitie: .my.doc.<názov>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nie je nastavené
doc-no-verb = žiadne sloveso `{ $verb }` pre { $path }
path-no-verb = žiadne sloveso `{ $verb }` pre { $path }

# ── Text nápovedy — záhlavie ──────────────────────────────────────────────
help-header-zion = ── príkazy zion ───────────────────────────────────────────────────────────
help-header-messaging = ── zasielanie správ ───────────────────────────────────────────────────────
help-header-focus = ── režim fokusu ──────────────────────────────────────────────────────────
help-header-config = ── lokálna gramatika konfigurácie ─────────────────────────────────────
help-header-common = ── bežné cesty ───────────────────────────────────────────────────────────
help-header-inbox = ── doručená pošta ────────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazať terminál
help-cmd-panic =   .panic                       posledná záchrana — použite v núdzi
help-cmd-history =   .history                     história príkazov (za sebou idúce duplikáty zlúčené)
help-cmd-logout =   .logout                      odhlásiť
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       zobraziť preložený DID (žiadna správa sa neodošle)
help-msg-send =   @alias[:verb] body           odoslať správu / RPC aktérovi
help-msg-fragment =   @alias#fragment[:verb] body  odoslať na alias s explicitným fragmentom DID
help-msg-escape =   \@name                       doslovné @name (bez vyhľadávania aliasov)

help-focus-set =   .use @alias [as @name]       zamerať na aktéra (zmení výzvu)
help-focus-clear =   .use                         vymazať fokus

help-config-get =   .path                        získať hodnotu listu alebo vypísať podstrom
help-config-filter =   .path value                  vyhľadávací filter (filtrovať podľa hodnoty)
help-config-set =   .path: value                 nastaviť list
help-config-delete =   .path:                       vymazať list alebo podstrom
help-config-verb =   .path:verb [args]            spustiť lokálne sloveso

help-my =   .my                          zobraziť celú osobnú konfiguráciu
help-aliases =   .my.aliases                  vypísať aliasy
help-aliases-set =   .my.aliases.<name>: <did>    pridať/aktualizovať alias (čisté DID, bez #fragmentu)
help-aliases-del =   .my.aliases.<name>:          odstrániť alias
help-runtime-discover =   .my.ma:discover          zistiť lokálny runtime a vytvoriť alias @ma
help-runtime-claim =   .my.ma:claim             prevziať runtime svojím DID
help-identity =   .my.identity                 zobraziť konfiguráciu identity
help-identity-did =   .my.identity.did             zobraziť vlastný DID (len na čítanie)
help-identity-publish =   .my.identity:publish @pub    publikovať vlastný DID cez vydavateľskú službu
help-identity-export =   .my.identity:export          stiahnuť vlastný identifikačný balík
help-config-path =   .config                      zobraziť všetky záznamy .config.*

help-inbox =   .my.inbox                    vypísať doručenú poštu (pohľad podstromu)
help-inbox-n =   .my.inbox.N                  zobraziť polia záznamu N
help-inbox-from =   .my.inbox.N.from             DID odosielateľa pre záznam N
help-inbox-reply =   .my.inbox.N:reply [body]     odoslať odpoveď (otvorí editor bez obsahu)
help-inbox-open =   .my.inbox.N:open             otvoriť obsah v editore len na čítanie
help-inbox-del =   .my.inbox.N:                 vymazať záznam N
help-inbox-delall =   .my.inbox:                   vymazať všetky záznamy doručenej pošty
help-inbox-flush =   .my.inbox:flush              vytlačiť všetky záznamy v termináli
help-inbox-filter =   .my.inbox:filter @who        zobraziť iba záznamy od @who
help-inbox-traverse =   .my.inbox.N.sender.<pole>   prechádzať DID dokument odosielateľa lenivo

help-doc-edit =   .my.doc.<názov>:edit           otvoriť editor s uloženým obsahom
help-doc-edit-cid =   .my.doc.<názov>:edit <cid>     načítať CID, otvoriť na kontrolu
help-doc-eval =   .my.doc.<názov>:eval           spustiť uložený obsah riadok po riadku
help-doc-publish =   .my.doc.<názov>:publish @pub   uložiť ako surový blob (všetky typy)
help-doc-publish-ipld =   .my.doc.<názov>:publish-ipld @pub  uložiť YAML ako štruktúrovaný uzol DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<názov>:fetch <cid>    importovať obsah CID (bez spustenia)
help-doc-cid =   .my.doc.<názov>:cid            zobraziť uložené CID
help-doc-del =   .my.doc.<názov>:              vymazať dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostupné jazyky (nastaviť pomocou .my.i18n: <code>):
err-lang-not-found = jazyk nenájdený: { $lang }

msg-send-failed = odoslanie zlyhalo: { $e }
msg-not-logged-in = neprihlásený

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Chyba analýzy YAML: { $e }
yaml-not-mapping = YAML musí byť mapping (páry kľúč: hodnota); prostý text a skaláry nemožno uložiť ako DAG-CBOR
dagcbor-encode-error = Chyba kódovania DAG-CBOR: { $e }
cbor-decode-error = Chyba dekódovania CBOR: { $e }
cbor-json-error = Chyba konverzie CBOR na JSON: { $e }
yaml-serialize-error = Chyba serializácie YAML: { $e }
edit-reply-invalid = Neplatná odpoveď na úpravu
doc-publish-ipld-error = Publikovanie IPLD zlyhalo: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Chyba uloženia čistenia schránky: { $e }
err-config-load = Chyba načítania konfigurácie: { $e }
err-lang-persist = Chyba uloženia jazyka: { $e }
err-history-parse = Chyba analýzy histórie: { $e }
err-history-load = Chyba načítania histórie: { $e }
err-ipfs-reply-decode = Zlyhanie dekódovania odpovede IPFS: { $e }
err-edit-cbor = Chyba úpravy CBOR: { $e }
err-popup-blocked = Prehliadač zablokoval vyskakovacie okno
status-publishing = publikovanie

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = chyba
rpc-error-detail = chyba: { $detail }
msg-new-message = ← [{ $from }] nová správa — { $count } v doručenej pošte
msg-chat = { $sender } hovorí { $body }
err-edit-decode-failed = úprava: chyba dekódovania: { $e }
err-edit-fetch-failed = úprava: chyba načítania: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = žiadna aktívna relácia — profil nie je možné odstrániť
profile-delete-error = odstránenie profilu zlyhalo: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.my.ma:discover' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (žiadny)
profiles-deleted = profil { $name } odstránený
profiles-not-found = profil sa nenašiel: { $name }

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

help-topic-url =   .help.url                    otvorenie zion cez URL odkaz
help-header-url = ── URL parametre ────────────────────────────────────────────────────────────────
help-url-intro =   Zdieľaj odkaz, ktorý otvorí zion s vopred vyplneným príjemcom:
help-url-msg =   ?msg=<did>                   vopred vyplní: @<did> (jednoduchá správa)
help-url-say =   ?say=<did>                   vopred vyplní: @<did>:say (sloveso say)
help-url-emote =   ?emote=<did>                 vopred vyplní: @<did>:emote (sloveso emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Pole je vopred vyplnené, ale neodoslané — stlač Enter na odoslanie.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                zverejniť svoju identitu v sieti
help-header-publish = ── zverejnenie identity ─────────────────────────────────────────────────────
help-publish-intro = Zverejnenie sprístupní tvoju identitu v sieti. Ostatní môžu vyhľadať tvoj DID a kontaktovať ťa.
help-publish-ma = Na zverejnenie potrebuješ nainštalované ma (lokálny runtime). Prepája ego s IPFS/IPNS v tvojom mene.
help-publish-steps = Kroky: spusti '.my.ma:discover' na zistenie lokálneho ma, potom '.my.identity:publish @ma'.
help-publish-without = Bez zverejnenia ťa ostatní nemôžu kontaktovať — aj keď poznajú tvoj DID, nedokážu rozlíšiť tvoj endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
