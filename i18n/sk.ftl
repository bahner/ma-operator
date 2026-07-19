# zion — Slovenčina
lang-name = Slovenčina

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
msg-connecting = pripájanie k iroh...
msg-iroh-ready = iroh endpoint pripravený
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID zverejnené cez lokálne ma ({ $url })
msg-ma-connecting-matrix = pokúšam sa ťa pripojiť k 間trixu
msg-local-ma-claimed = lokálne 間 prevzaté
msg-local-ma-already-claimed = lokálne 間 je už prevzaté
msg-local-ma-claim-failed = nepodarilo sa prevziať lokálne 間
msg-identity-not-published = Identita nenájdená online — ak máš ma nainštalované lokálne, spusti '.ma [port]' a potom '.my.identity!publish @ma'. Napíš '.help/publish' pre podrobnosti.
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
err-alias-value-fragment = hodnota aliasu môže obsahovať najviac jeden neprázdny fragment DID-URL
err-alias-value-path = hodnota aliasu musí byť did:ma:<ipns> DID alebo DID-URL (bez cesty)
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
discover-hint-endpoint-not-found = Tip: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Tip: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Tip: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tip: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma zistené na { $url }
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
doc-content-empty = { $path }.content je prázdne
doc-save-first = { $path }.content je prázdne — najprv uložte
doc-missing-name = chýba názov dokumentu
doc-publish-usage = použitie: .my.doc.<názov>!publish <vydavateľ>
doc-publish-ipld-usage = použitie: .my.doc.<názov>!publish-ipld <vydavateľ>
doc-publish-failed = publikovanie { $path }: { $e }
doc-publish-ipld-failed = publikovanie IPLD { $path }: { $e }
doc-publish-error-detail = publikovanie zlyhalo [{ $code }]: { $err }
doc-publish-error-hint = Tip: { $hint }
doc-publish-hint-session = prihláste sa znova, aby ego malo prístup k vašim kľúčom identity
doc-publish-hint-target = použite platný identifikátor DID alebo alias vydavateľa, ktorý sa rozlišuje na holý 57
doc-publish-hint-network = overte, či sú 7 runtime a 22 dosiahnuteľné, potom to skúste znova
doc-publish-hint-resolve = overiť, či je dokument DID vydavateľa zverejnený a obsahuje dosiahnuteľný koncový bod
doc-publish-hint-acl = požiadajte operátora vydavateľa o povolenie vášho DID v 48
doc-publish-hint-runtime = runtime/plugin odmietol požiadavku; skontrolujte dôvod a skúste to znova po oprave entity/runtime
doc-publish-hint-ipfs = skontrolujte stav lokálneho 12/17 a stav spustenia vydavateľa
doc-publish-hint-unknown = skontrolujte protokoly runtime pre podrobnú príčinu a skúste to znova
doc-store-sent = žiadosť o uloženie odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-ipld-store-sent = žiadosť o uloženie IPLD odoslaná ({ $id }) → { $publisher }; CID príde v odpovedi RPC
doc-fetch-done = { $cid } načítané → { $path }.content (nespustené)
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
help-header-ma = ── 3-medzera ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── zadanie 間-medzera ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazať terminál
help-cmd-panic =   .panic                       posledná záchrana — použite v núdzi
help-cmd-history =   .history                     história príkazov (za sebou idúce duplikáty zlúčené)
help-cmd-logout =   .logout                      odhlásiť
help-cmd-batch =   .batch                       vyhodnotit pracovní dokument paralelně
help-cmd-batch-sync =   .batch:sync / .batch         vyhodnotit pracovní dokument po řádcích

help-msg-echo =   @alias                       zobraziť vyriešený DID/DID-URL (správa sa neodošle)
help-msg-send =   @alias!msg body / @alias:verb args           odoslať správu / RPC aktérovi
help-msg-fragment =   @alias#fragment:verb body  odoslať na alias s explicitným fragmentom DID
help-msg-escape =   \@name                       doslovné @name (bez vyhľadávania aliasov)


help-config-get =   .path                        získať hodnotu listu alebo vypísať podstrom
help-config-filter =   .path value                  vyhľadávací filter (filtrovať podľa hodnoty)
help-config-set =   .path: value                 nastaviť list
help-config-delete =   .path:                       vymazať list alebo podstrom
help-config-verb =   .path!verb [args]            spustiť lokálne sloveso

help-my =   .my                          zobraziť celú osobnú konfiguráciu
help-aliases =   .my.aliases                  vypísať aliasy
help-aliases-set =   .my.aliases.<name>: <did-url>    pridať/aktualizovať alias (DID alebo DID-URL)
help-aliases-del =   .my.aliases.<name>:          odstrániť alias
help-runtime-discover =   .ma [port]          zistiť lokálny runtime a vytvoriť alias @ma
help-runtime-claim =   .ma [port]             prevziať runtime svojím DID
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
help-i18n-set = .my.i18n: <code>             vyberte jazyk, ktorý 20 používa pre túto identitu
help-i18n-list = .my.i18n!list               zoznam dostupných jazykových kódov

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Miestnosť 間 je priestor medzi identitami 間. ma umožňuje týmto identitám nájsť sa a komunikovať; keď je tvoja identita publikovaná, môžeš sa zapojiť.
help-ma-command =   .ma [port]                   pripoj sa k lokálnemu ma runtime, prečítaj /status.json a ulož .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikuj svoj DID dokument, aby ostatní mohli nájsť tvoje kľúče a endpoint
help-ma-security = Najjasnejšia hranica dôvery je vlastný ma runtime s vlastným IPFS Desktop/Kubo. Vzdialený publisher môže byť užitočný, ale potom sa spoliehaš na službu niekoho iného.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
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
profile-wrong-user = nemožno nastaviť 11 pre iný profil – iba pre váš vlastný
profile-wrong-user-name = nemožno nastaviť 11 pre 19 — iba váš vlastný profil
profile-no-ma = nie je nakonfigurované žiadne runtime 3 – najskôr spustite 31
profile-no-cid = pre tento profil nie je uložený žiadny 3 – najskôr spustite 37
profile-no-cid-in-doc = v dokumente DID sa nenašiel žiadny profil 11 – najskôr spustite 43
profile-publish-sent = profil bol zašifrovaný a odoslaný do IPFS; dokument DID sa aktualizuje, keď príde CID
profile-publish-done = profil zverejnený — dokument DID aktualizovaný o ma.agent CID
profile-publish-failed = Zverejnenie profilu zlyhalo: 24
profile-fetch-done = profil načítaný — kľúče 18 načítané z 43
profile-fetch-failed = načítanie profilu zlyhalo: 22
msg-identity-exists = identita už zverejnená — profil je aktuálny
profile-import-exists = profil 8 už existuje – najskôr ho odstráňte
profile-import-wrong-user = súbor obsahuje profil 22, očakávaný 42

# -- CID content operations
cid-op-binary = binárny obsah (nezobrazuje sa)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = nepodarilo sa načítať obsah: 25
cid-op-unknown = operácia s neznámym obsahom: 27
cid-op-wc = { $lines } riadky 18 slová 36 znakov
profiles-empty = (žiadny)
profiles-deleted = profil { $name } odstránený
profiles-not-found = profil sa nenašiel: { $name }

# -- Help topics index
help-header-topics = -- témata -- pro podrobnosti napište .help/<topic>
help-topic-msg =   .help/msg                    zprávy
help-topic-ma = .help/ma                     ma-priestor, publikovanie a vstup
help-topic-path = .help/path                   lokálna bodková gramatika
help-topic-my =   .help/my                     osobní konfigurace
help-topic-inbox =   .help/inbox                  schránka
help-topic-doc =   .help/doc                    dokumenty
help-topic-actor =   .help/actor                  vzdálený actor
help-unknown-topic =   .help/{ $topic }: neznámé téma

# -- Help actor section
help-header-actor = -- vzdálení aktéři
help-actor-echo =   @actor                       zobrazit vyřešený DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         odoslať priamu/chatovú/emočnú správu
help-actor-ping = @actor:ping                  živosť ping
help-actor-entities =   @actor/entities              vypsat entity
help-actor-entities-get = @actor/entities/<n>          získať uzol entity
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   nastaviť entitu odkazom 14
help-actor-entities-edit =   @actor/entities/<n>!edit     upravit entitu
help-actor-entities-del = @actor/entities/<n>:         odstrániť entitu
help-actor-config-get =   @actor/config/<key>          získat hodnotu konfigurace
help-actor-config-set =   @actor/config/<key>: val     nastavit hodnotu konfigurace
help-actor-acl = @actor/acl                   získajte 4
help-actor-acl-edit =   @actor/acl!edit              upravit ACL
help-actor-fragment =   @actor#entity                odeslat do pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC do pluginu
help-header-cid-ops = ── 3 herec volá ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  zavolajte entitu 15 z 24 a počkajte na jej odpoveď
help-actor-head = (@actor/path)                načítať vzdialený obsah CRUD z 31
help-actor-tail = (<bafy...>)                  zahrnúť a vyhodnotiť 21 z 36 41
help-actor-wc = (define x (@actor:verb arg))  uchovávať odpovede 5 v prostredí relácie
help-actor-wc-l = .my.scheme.ma!edit           upraviť uložených pomocníkov 11 pre túto identitu

help-topic-url =   .help/url                    otvorenie zion cez URL odkaz
help-topic-i18n = .help/i18n                   jazykové preferencie pre vašu identitu
help-header-url = ── URL parametre ────────────────────────────────────────────────────────────────
help-url-intro =   Zdieľaj odkaz, ktorý otvorí zion s vopred vyplneným príjemcom:
help-url-msg =   ?msg=<did>                   vopred vyplní: @<did>!msg (jednoduchá správa)
help-url-say =   ?say=<did>                   vopred vyplní: @<did>!say (sloveso say)
help-url-emote =   ?emote=<did>                 vopred vyplní: @<did>!emote (sloveso emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / 23 URL
help-url-enter = ?enter=<runtime>             po prihlásení vstúpte do runtime sveta
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Pole je vopred vyplnené, ale neodoslané — stlač Enter na odoslanie.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                zverejniť svoju identitu v sieti
help-header-publish = ── zverejnenie identity ─────────────────────────────────────────────────────
help-publish-intro = Zverejnenie sprístupní tvoju identitu v sieti. Ostatní môžu vyhľadať tvoj DID a kontaktovať ťa.
help-publish-ma = Na zverejnenie potrebuješ nainštalované ma (lokálny runtime). Prepája ego s IPFS/IPNS v tvojom mene.
help-publish-steps = Kroky: spusti '.ma [port]' na zistenie lokálneho ma, potom '.my.identity!publish @ma'.
help-publish-without = Bez zverejnenia ťa ostatní nemôžu kontaktovať — aj keď poznajú tvoj DID, nedokážu rozlíšiť tvoj endpoint.
profile-fetch-did-resolve-failed = Ešte nebolo zverejnené – najskôr spustite 28 a potom 67 svoj profil
profile-update-done = profil aktualizovaný — kľúče 18 sa zlúčili z 43
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
help-cmd-batch-async =   .batch:async / .batch        vyhodnotit pracovní dokument paralelně


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Načítanie CID { $cid } zlyhalo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Neplatný CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Upozornenie: Váš súkromný kľúč IPNS bude odoslaný do tohto runtime prostredia na publikovanie identity. Používajte iba runtime prostredie, ktorému plne dôverujete.
