# zion — Slovenčina
lang-name = Slovenčina
label-nick = prezývka
new-identity-nick-help = Vyberte si prezývku pre 間-space. Je to len prezývka a môžete ju kedykoľvek zmeniť.
error-nick-required = prezývka je povinná
error-nick-invalid = prezývka nesmie obsahovať medzery ani @

# ── Prihlasovacia stránka ─────────────────────────────────────────────────
tab-login = prihlásiť
tab-new-identity = nová identita
tab-import-profile = importovať profil
label-passphrase = prístupová fráza
label-username = používateľské meno
label-confirm-passphrase = potvrdiť prístupovú frázu
label-did = DID
label-profile-cid = CID profilu
label-or-file = alebo súbor
btn-login = prihlásiť
btn-export = exportovať
btn-generate = generovať
btn-new-endpoint = nový koncový bod
btn-import-profile = importovať profil
btn-show-qr = zobraziť QR
btn-scan-qr = skenovať QR
qr-scan-hint = Namierte kameru na QR kód profilu zion.
qr-error-camera = kamera nie je dostupná: { $e }
qr-error-too-large = profil je pre QR kód príliš veľký
passphrase-warning = Stratená prístupová fráza = stratená identita. Obnova nie je možná.
import-profile-help = Importujte profil pomocou CID alebo súboru. Je potrebná rovnaká prístupová fráza, aká bola použitá pri publikovaní.
import-profile-detected-user = Profil patrí: { $name }
status-unlocking = odomykanie...
status-generating = generovanie identity...
status-reading-file = čítanie súboru...
status-fetching-profile = načítavanie profilu z IPFS...
status-imported = '{ $name }' importované — prejdite na záložku Prihlásiť
status-importing-profile = importuje sa profil...
profile-import-done = profil bol importovaný pre '{ $name }' — načítaných { $n } kľúčov
error-wrong-passphrase = nesprávna prístupová fráza: { $e }
error-identity-not-found = identita '{ $name }' nenájdená
error-username-required = používateľské meno je povinné
error-passphrase-required = prístupová fráza je povinná
error-passphrases-no-match = prístupové frázy sa nezhodujú
error-profile-source-required = zadajte CID alebo nahrajte súbor
error-did-required = zadajte váš DID
error-profile-fetch = profil sa nepodarilo načítať: { $e }
error-profile-no-username = profil neobsahuje používateľské meno
error-profile-no-identity = identita '{ $name }' nebola nájdená — najprv importujte identitu

# ── Systémové správy terminálu ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — prihlásený ako { $username }
msg-type-help = Napíšte .help pre zoznam príkazov.
msg-getting-started = Skúste: say Hello world, look, .help alebo help.
msg-connecting = pripájanie k iroh...
msg-iroh-ready = iroh endpoint pripravený
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID zverejnené cez lokálne 間 ({ $url })
msg-identity-publication-propagating = Publikovanie identity sa stále šíri; vstup je odložený: { $e }
msg-identity-first-publish = Identita sa publikuje prvýkrát. Môže to trvať až { $seconds } sekúnd.
msg-ma-connecting-matrix = pokúšam sa ťa pripojiť k 間trixu
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokálne 間 prevzaté
msg-local-ma-already-claimed = lokálne 間 je už prevzaté
msg-local-ma-claim-failed = nepodarilo sa prevziať lokálne 間
msg-identity-not-published = Identita nenájdená online — ak máš 間 nainštalované lokálne, spusti '.ma: claim [port]' a potom '.my.identity!publish @ma'. Napíš '.help/publish' pre podrobnosti.
msg-blocked = ⊗ zablokované [{ $cap }]: { $from }
msg-focus-cleared = fokus vymazaný
msg-left = left
msg-focusing = zameranie na { $did } ako { $prompt }
msg-set = { $path }: { $value }
msg-deleted = vymazané { $path } ({ $count } záznamov)
msg-read-only = { $path } je len na čítanie
msg-subtree-set = { $path } je podstrom; nastavenie odmietnuté
msg-ancestor-leaf = predok { $path } je list; tieňovanie odmietnuté
msg-key-not-found = kľúč nenájdený: { $path }
msg-link-not-connected = chyba načítania odkazu: nepripojené
msg-link-fetch-error = chyba načítania odkazu: { $e }
msg-link-key-not-found = kľúč `{ $key }` nenájdený v prepojenom dokumente

# ── Overenie aliasov ──────────────────────────────────────────────────────
err-alias-name-empty = názov aliasu nesmie byť prázdny
err-alias-has-dot = názov aliasu nesmie obsahovať '.'
err-alias-has-fragment = názov aliasu nesmie obsahovať '#'
err-alias-value-fragment = hodnota aliasu môže obsahovať najviac jeden neprázdny fragment DID-URL
err-alias-value-path = hodnota aliasu musí byť did:ma:<ipns> DID alebo DID-URL (bez cesty)
err-alias-not-did = hodnota aliasu musí začínať did:ma:
err-unknown-alias = neznámy alias: @{ $name }
err-bare-did = očakávané čisté did:ma:<ipns> (bez fragmentu alebo cesty), prijaté { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Uložiť
btn-eval = Spustiť
btn-cancel = Zrušiť
msg-jobs-cancelled = úlohy zrušené
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
discover-hint-endpoint-not-found = Tip: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Tip: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Tip: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tip: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 zistené na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma vytvorený — spusti '.my.identity!publish @ma' na zverejnenie svojej identity.
claim-success = Runtime prevzatý pre { $did }
claim-conflict = Runtime už prevzatý inou identitou
claim-already-owned = Runtime už prevzala táto identita
claim-http-failed = prevzatie zlyhalo: HTTP { $status }
claim-error = prevzatie zlyhalo: { $e }
claim-no-session = neprihlásený; najprv sa prihláste pre prevzatie runtime
runtime-no-verb = žiadne sloveso `{ $verb }` pre { $path }

# ── Slovesá — riadenie prístupu ───────────────────────────────────────────
acl-reset = .my.acl obnovené (plne otvorené)
acl-persist-error = chyba ukladania: { $e }
acl-no-verb = žiadne sloveso `{ $verb }` pre .my.acl

# ── Slovesá — identita ────────────────────────────────────────────────────
publish-usage = použitie: .my.identity!publish <did-alebo-alias>
identity-exported = Balík stiahnutý ako { $filename }
identity-export-failed = Export zlyhal: { $e }

# ── Slovesá — dokumenty ───────────────────────────────────────────────────
doc-content-empty = { $path } je prázdne
doc-save-first = { $path } je prázdne — najprv uložte
doc-missing-name = chýba názov dokumentu
doc-publish-usage = použitie: .my.doc.<názov>!publish <vydavateľ>
doc-publish-ipld-usage = použitie: .my.doc.<názov>!publish-ipld <vydavateľ>
doc-publish-failed = publikovanie { $path }: { $e }
doc-publish-ipld-failed = publikovanie IPLD { $path }: { $e }
doc-publish-error-detail = publikovanie zlyhalo [{ $code }]: { $err }
doc-publish-error-hint = Tip: { $hint }
doc-publish-hint-session = prihláste sa znova, aby ego malo prístup k vašim kľúčom identity
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = overiť, či je dokument DID vydavateľa zverejnený a obsahuje dosiahnuteľný koncový bod
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin odmietol požiadavku; skontrolujte dôvod a skúste to znova po oprave entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = skontrolujte protokoly runtime pre podrobnú príčinu a skúste to znova
doc-store-sent = žiadosť o uloženie odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-ipld-store-sent = žiadosť o uloženie IPLD odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-fetch-done = { $cid } načítané → { $path } (nespustené)
doc-fetch-failed = načítanie { $cid }: { $e }
doc-fetch-usage = použitie: .my.doc.<názov>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nie je nastavené
doc-no-verb = žiadne sloveso `{ $verb }` pre { $path }
path-no-verb = žiadne sloveso `{ $verb }` pre { $path }

# ── Text nápovedy — záhlavie ──────────────────────────────────────────────
help-header-zion = ── príkazy zion ───────────────────────────────────────────────────────────
help-header-messaging = ── zasielanie správ ───────────────────────────────────────────────────────
help-header-config = ── lokálna gramatika konfigurácie ─────────────────────────────────────
help-header-common = ── bežné cesty ───────────────────────────────────────────────────────────
help-header-inbox = ── doručená pošta ────────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-header-i18n = ── jazyk ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── zadanie 間-medzera ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazať terminál
help-cmd-panic =   .panic                       posledná záchrana — použite v núdzi
help-cmd-history =   .history [n]                 história príkazov (za sebou idúce duplikáty zlúčené); voľiteľné n zobrazí iba poslednych n riadkov
help-cmd-logout =   .logout                      odhlásiť
help-cmd-batch =   .batch                       vyhodnotit pracovní dokument paralelně
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         vyhodnotit pracovní dokument po řádcích

help-msg-echo =   @alias                       zobraziť vyriešený DID/DID-URL (správa sa neodošle)
help-msg-send =   @alias!msg body / @alias:verb args           odoslať správu / RPC aktérovi
help-msg-fragment =   @alias#fragment:verb body  odoslať na alias s explicitným fragmentom DID
help-msg-escape =   \@name                       doslovné @name (bez vyhľadávania aliasov)


help-config-get =   .path                        získať hodnotu listu alebo vypísať podstrom
help-config-filter =   .path [názov]                vypísať názvy podkľúčov obsahujúce názov
help-config-full =   .path. [názov]               vypísať úplné hodnoty podstromu obsahujúce názov
help-config-set =   .path: value                 nastaviť list
help-config-delete =   .path:                       vymazať list alebo podstrom
help-config-verb =   .path!verb [args]            spustiť lokálne sloveso

help-my =   .my                          zobraziť celú osobnú konfiguráciu
help-aliases =   .my.aliases                  vypísať aliasy
help-aliases-set =   .my.aliases.<name>: <did-url>    pridať/aktualizovať alias (DID alebo DID-URL)
help-aliases-del =   .my.aliases.<name>:          odstrániť alias
help-runtime-discover =   .ma: claim [port]          zistiť lokálny runtime a vytvoriť alias @ma
help-runtime-claim =   .ma: claim [port]             prevziať runtime svojím DID
help-identity =   .my.identity                 zobraziť konfiguráciu identity
help-identity-did =   .my.identity.did             zobraziť vlastný DID (len na čítanie)
help-identity-publish =   .my.identity!publish @pub    publikovať vlastný DID cez vydavateľskú službu
help-identity-export =   .my.identity!export          stiahnuť vlastný identifikačný balík
help-config-path =   .config                      zobraziť všetky záznamy .config.*

help-inbox =   .my.inbox                    vypísať doručenú poštu (pohľad podstromu)
help-inbox-n =   .my.inbox.N                  zobraziť polia záznamu N
help-inbox-from =   .my.inbox.N.from             DID odosielateľa pre záznam N
help-inbox-reply =   .my.inbox.N!reply [body]     odoslať odpoveď (otvorí editor bez obsahu)
help-inbox-open =   .my.inbox.N!open             otvoriť obsah v editore len na čítanie
help-inbox-del =   .my.inbox.N:                 vymazať záznam N
help-inbox-delall =   .my.inbox:                   vymazať všetky záznamy doručenej pošty
help-inbox-flush =   .my.inbox!flush              vytlačiť všetky záznamy v termináli
help-inbox-filter =   .my.inbox!filter @who        zobraziť iba záznamy od @who
help-inbox-traverse =   .my.inbox.N.sender.<pole>   prechádzať DID dokument odosielateľa lenivo

help-doc-edit =   .my.doc.<názov>!edit           otvoriť editor s uloženým obsahom
help-doc-edit-cid =   .my.doc.<názov>!edit /ipfs/<cid>     načítať CID, otvoriť na kontrolu
help-doc-eval =   .my.doc.<názov>!eval           spustiť uložený obsah riadok po riadku
help-doc-publish =   .my.doc.<názov>!publish @pub   uložiť ako surový blob (všetky typy)
help-doc-publish-ipld =   .my.doc.<názov>!publish-ipld @pub  uložiť YAML ako štruktúrovaný uzol DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<názov>!fetch /ipfs/<cid>    importovať obsah CID (bez spustenia)
help-doc-cid =   .my.doc.<názov>!cid            zobraziť uložené CID
help-doc-del =   .my.doc.<názov>:              vymazať dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n ukladá preferencie jazyka spojené s vašou identitou.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               zoznam dostupných jazykových kódov

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Miestnosť 間 je priestor medzi identitami 間. ma umožňuje týmto identitám nájsť sa a komunikovať; keď je tvoja identita publikovaná, môžeš sa zapojiť.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   pripoj sa k lokálnemu 間 runtime, prečítaj /status.json a ulož .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikuj svoj DID dokument, aby ostatní mohli nájsť tvoje kľúče a endpoint
help-ma-security = Najjasnejšia hranica dôvery je vlastný 間 runtime s vlastným IPFS Desktop/Kubo. Vzdialený publisher môže byť užitočný, ale potom sa spoliehaš na službu niekoho iného.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             ako vstúpiť do miestnosti 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Keď je tvoja identita známa, .enter @ma ti umožní vstúpiť do 間. Nájdi svet, vstúp doň a zapoj sa odtiaľ.
help-ma-entry-steps = Spusti IPFS Desktop a ma, potom spusti .ma. Publikuj pomocou .my.identity!publish @ma, nájdi svet a vstúp pomocou .enter @ma.
help-ma-entry-command =   .enter @ma                  vstúpiť do 間 cez runtime @ma
help-ma-entry-toggle =   .enter                       zapni alebo vypni fokus miestnosti; tvoja identita ostáva aktívna
help-ma-entry-url =   ?enter=<runtime>             vstúpiť po prihlásení zo zdieľanej URL

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
yaml-serialise-error = Chyba serializácie YAML: { $e }
edit-reply-invalid = Neplatná odpoveď na úpravu
doc-publish-ipld-error = Publikovanie IPLD zlyhalo: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Chyba uloženia čistenia schránky: { $e }
err-config-load = Chyba načítania konfigurácie: { $e }
err-lang-persist = Chyba uloženia jazyka: { $e }
err-history-parse = Chyba analýzy histórie: { $e }
err-history-load = Chyba načítania histórie: { $e }
err-history-count-invalid = počet histórie musí byť kladné celé číslo
err-ipfs-reply-decode = Zlyhanie dekódovania odpovede IPFS: { $e }
err-edit-cbor = Chyba úpravy CBOR: { $e }
err-popup-blocked = Prehliadač zablokoval vyskakovacie okno
status-publishing = publikovanie

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = chyba
rpc-error-detail = chyba: { $detail }
msg-new-message = ← [{ $from }] nová správa — { $count } v doručenej pošte
msg-chat = { $sender } hovorí { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } hovorí { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } vstúpil do miestnosti.
room-leave = * { $name } opustil miestnosť.
room-drop  = * { $name } upustil { $thing }.
room-take  = * { $name } zdvihol { $thing }.
err-edit-decode-failed = úprava: chyba dekódovania: { $e }
err-edit-fetch-failed = úprava: chyba načítania: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = žiadna aktívna relácia — profil nie je možné odstrániť
profile-delete-error = odstránenie profilu zlyhalo: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil bol zašifrovaný a odoslaný do IPFS; dokument DID sa aktualizuje, keď príde CID
profile-publish-done = profil zverejnený — dokument DID aktualizovaný o ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identita už zverejnená — profil je aktuálny
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binárny obsah (nezobrazuje sa)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (žiadny)
profiles-deleted = profil { $name } odstránený
profiles-not-found = profil sa nenašiel: { $name }

# -- Help topics index
help-header-topics = -- témata -- pro podrobnosti napište .help/<topic>
help-topic-msg =   .help/msg                    zprávy
help-topic-ma = .help/ma                     間-priestor, publikovanie a vstup
help-topic-path = .help/path                   lokálna bodková gramatika
help-topic-my =   .help/my                     osobní konfigurace
help-topic-inbox =   .help/inbox                  schránka
help-topic-doc =   .help/doc                    dokumenty
help-topic-actor =   .help/actor                  vzdálený actor
help-topic-zscheme =   .help/zscheme               vložené výrazy Scheme a dokumentácia
help-unknown-topic =   .help/{ $topic }: neznámé téma

# -- Help actor section
help-header-actor = -- vzdálení aktéři
help-actor-echo =   @actor                       zobrazit vyřešený DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         odoslať priamu/chatovú/emočnú správu
help-actor-ping = @actor:ping                  živosť ping
help-actor-entities =   @actor/entities              vypsat entity
help-actor-entities-get = @actor/entities/<n>          získať uzol entity
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     upravit entitu
help-actor-entities-del = @actor/entities/<n>:         odstrániť entitu
help-actor-config-get =   @actor/config/<key>          získat hodnotu konfigurace
help-actor-config-set =   @actor/config/<key>: val     nastavit hodnotu konfigurace
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              upravit ACL
help-actor-fragment =   @actor#entity                odeslat do pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC do pluginu
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  uchovávať odpovede 5 v prostredí relácie
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    otvorenie zion cez URL odkaz
help-topic-i18n = .help/i18n                   jazykové preferencie pre vašu identitu
help-header-url = ── URL parametre ────────────────────────────────────────────────────────────────
help-url-intro =   Zdieľaj odkaz, ktorý otvorí zion s vopred vyplneným príjemcom:
help-url-msg =   ?msg=<did>                   vopred vyplní: @<did>!msg (jednoduchá správa)
help-url-say =   ?say=<did>                   vopred vyplní: @<did>!say (sloveso say)
help-url-emote =   ?emote=<did>                 vopred vyplní: @<did>!emote (sloveso emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             po prihlásení vstúpte do runtime sveta
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Pole je vopred vyplnené, ale neodoslané — stlač Enter na odoslanie.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                zverejniť svoju identitu v sieti
help-header-publish = ── zverejnenie identity ─────────────────────────────────────────────────────
help-publish-intro = Zverejnenie sprístupní tvoju identitu v sieti. Ostatní môžu vyhľadať tvoj DID a kontaktovať ťa.
help-publish-ma = Na zverejnenie potrebuješ nainštalované 間 (lokálny runtime). Prepája ego s IPFS/IPNS v tvojom mene.
help-publish-steps = Kroky: spusti '.ma: claim [port]' na zistenie lokálneho ma, potom '.my.identity!publish @ma'.
help-publish-without = Bez zverejnenia ťa ostatní nemôžu kontaktovať — aj keď poznajú tvoj DID, nedokážu rozlíšiť tvoj endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = zadajte názov profilu: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Zhromažďovanie dávky – zadajte príkazy, ukončite .batch
batch-already-collecting = Už sa zhromažďuje dávka – najskôr skončite s .batch
batch-empty = Dávka bola prázdna – nebolo čo spustiť
batch-running = Spouštím dávku…
batch-step-timeout = časový limit dávkového kroku vypršal

batch-done = Dávka dokončena za { $secs }s — { $steps } kroků
batch-done-error = Dávka skončila s chybami za { $secs }s — { $steps } kroků
msg-timeout = Zprávě vypršel čas (žádná odpověď za 60s)
err-unknown-command = neznámy príkaz: { $path }
err-read-only-path = { $path } je iba na čítanie
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        vyhodnotit pracovní dokument paralelně


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Načítanie CID { $cid } zlyhalo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Neplatný CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Upozornenie: Váš súkromný kľúč IPNS bude odoslaný do tohto runtime prostredia na publikovanie identity. Používajte iba runtime prostredie, ktorému plne dôverujete.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme vyhodnocuje výrazy Scheme vložené do príkazov zion a pred odoslaním vloží výsledok do riadka.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    vložený príklad; odošle "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definície pretrvávajú počas aktuálnej prihlasovacej relácie
help-zscheme-doc = Dokumentácia: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Miestna brána IPFS (vyžaduje výnimku v prehliadači)

tab-config = Nastavenia
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
