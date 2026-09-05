# operator — Čeština
lang-name = Čeština
label-nick = přezdívka
new-identity-nick-help = Vyberte si přezdívku pro 間-space. Je to jen přezdívka a můžete ji kdykoli změnit.
error-nick-required = přezdívka je povinná
error-nick-invalid = přezdívka nesmí obsahovat mezery ani @

# ── Přihlašovací stránka ──────────────────────────────────────────────────
tab-login = přihlásit
tab-new-identity = nová identita
tab-import-profile = import profilu
label-passphrase = přístupová fráze
label-username = uživatelské jméno
label-confirm-passphrase = potvrdit přístupovou frázi
label-did = DID
label-profile-cid = CID profilu
label-or-file = nebo soubor
btn-login = přihlásit
btn-export = exportovat
btn-generate = generovat
btn-new-endpoint = nový koncový bod
btn-import-profile = import profilu
btn-show-qr = zobrazit QR
btn-scan-qr = skenovat QR
qr-scan-hint = Namiřte kameru na QR kód profilu operator.
qr-error-camera = kamera není dostupná: { $e }
qr-error-too-large = profil je pro QR kód příliš velký
passphrase-warning = Ztracená přístupová fráze = ztracená identita. Obnova není možná.
import-profile-help = Importujte profil pomocí CID nebo souboru. Potřebujete stejné heslo, které bylo použito při publikování.
import-profile-detected-user = Profil patří: { $name }
status-unlocking = odemykání...
status-generating = generování identity...
status-reading-file = čtení souboru...
status-fetching-profile = načítání profilu z IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = '{ $name }' importováno — přejděte na záložku Přihlásit
status-importing-profile = importuje se profil...
profile-import-done = profil pro '{ $name }' importován — načteno { $n } klíčů
error-wrong-passphrase = nesprávná přístupová fráze: { $e }
error-identity-not-found = identita '{ $name }' nenalezena
error-username-required = uživatelské jméno je povinné
error-passphrase-required = přístupová fráze je povinná
error-passphrases-no-match = přístupové fráze se neshodují
error-profile-source-required = zadejte CID nebo nahrajte soubor
error-did-required = zadejte svůj DID
error-profile-fetch = nelze načíst profil: { $e }
error-profile-no-username = profil neobsahuje uživatelské jméno
error-profile-no-identity = identita '{ $name }' nenalezena — nejprve importujte identitu

# ── Systémové zprávy terminálu ────────────────────────────────────────────
msg-logged-in = operator v{ $version } — přihlášen jako { $username }
msg-type-help = Napište .help pro seznam příkazů.
msg-getting-started = Zkuste: say Hello world, look, .help nebo help.
msg-connecting = připojování k iroh...
msg-iroh-ready = iroh endpoint připraven
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID zveřejněno přes lokální 間 ({ $url })
msg-identity-publication-propagating = Publikování identity se stále šíří; vstup je odložen: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = Vyhledávání důvěryhodného MA může trvat až { $seconds } sekund.
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Publikujeme identitu. Může to trvat až { $seconds } sekund.
msg-ma-connecting-matrix = pokouším se tě připojit k 間trixu
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokální 間 převzat
msg-local-ma-already-claimed = lokální 間 už je převzat
msg-local-ma-claim-failed = lokální 間 se nepodařilo převzít
msg-identity-not-published = Identita nenalezena online — máš-li 間 nainstalované lokálně, spusť '.ma: claim [port]' a poté '.my.identity!publish @ma'. Napiš '.help/publish' pro podrobnosti.
msg-blocked = ⊗ zablokováno [{ $cap }]: { $from }
msg-focus-cleared = fokus vymazán
msg-left = left
msg-focusing = zaměření na { $did } jako { $prompt }
msg-set = { $path }: { $value }
msg-deleted = smazáno { $path } ({ $count } záznamů)
msg-read-only = { $path } je pouze ke čtení
msg-subtree-set = { $path } je podstrom; nastavení odmítnuto
msg-ancestor-leaf = předek { $path } je list; stínování odmítnuto
msg-key-not-found = klíč nenalezen: { $path }
msg-link-not-connected = chyba načítání odkazu: nepřipojeno
msg-link-fetch-error = chyba načítání odkazu: { $e }
msg-link-key-not-found = klíč `{ $key }` nenalezen v propojeném dokumentu

# ── Ověření aliasů ────────────────────────────────────────────────────────
err-alias-name-empty = název aliasu nesmí být prázdný
err-alias-has-dot = název aliasu nesmí obsahovat '.'
err-alias-has-fragment = název aliasu nesmí obsahovat '#'
err-alias-value-fragment = hodnota aliasu může obsahovat nejvýše jeden neprázdný fragment DID-URL
err-alias-value-path = hodnota aliasu musí být did:ma:<ipns> DID nebo DID-URL (bez cesty)
err-alias-not-did = hodnota aliasu musí začínat did:ma:
err-unknown-alias = neznámý alias: @{ $name }
err-bare-did = očekáváno čisté did:ma:<ipns> (bez fragmentu nebo cesty), přijato { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Uložit
btn-eval = Spustit
btn-cancel = Zrušit
msg-jobs-cancelled = úlohy zrušeny
btn-close = Zavřít
btn-reply = Odpovědět
btn-publish = Publikovat
btn-publish-ipld = Publikovat IPLD
msg-reply-sent = odpověď odeslána
msg-reply-failed = odeslání odpovědi selhalo: { $e }
msg-entity-publish-sent = entita { $name }: publikace odeslána
msg-entity-publish-failed = publikování entity selhalo: { $e }
msg-kind-publish-failed = Vydání typu selhalo: { $e }
msg-field-publish-sent = entita { $name }.{ $field }: publikace odeslána
msg-field-publish-failed = publikování pole selhalo: { $e }
msg-acl-publish-sent = ACL runtime: publikace odeslána
msg-crud-edit-publish-sent = { $path }: publikace odeslána
msg-acl-publish-failed = publikování ACL runtime selhalo: { $e }
msg-yaml-error = chyba YAML: { $e }
msg-editor-saved = { $path }:uložit
msg-fetch-review = { $cid } načteno — zkontrolujte před spuštěním
msg-fetch-failed = načítání { $cid }: { $e }

# ── Slovesa — doručená pošta ──────────────────────────────────────────────
inbox-empty = doručená pošta je prázdná
inbox-entry-not-found = záznam { $n } doručené pošty nenalezen
inbox-no-message-id = záznam { $n } doručené pošty nemá message_id
inbox-no-verb = žádné sloveso `{ $verb }` pro záznam { $n } doručené pošty
inbox-filter-no-arg = filtr vyžaduje argument DID nebo alias
inbox-filter-empty = žádné zprávy od { $did }

# ── Slovesa — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = zjišťování selhalo na { $url }: { $e }
discover-json-error = zjišťování selhalo: neplatný JSON z { $url }: { $e }
discover-missing-did = zjišťování selhalo: status.json postrádá povinné pole `did`
discover-invalid-did = zjišťování selhalo: očekáváno `did` začínající did:ma:, přijato `{ $did }`
discover-no-endpoint = varování zjišťování: `endpoint_id` chybí v status.json; uloženo jen DID
discover-hint-endpoint-not-found = Tip: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Tip: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Tip: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tip: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 zjištěno na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma vytvořen — spusť '.my.identity!publish @ma' pro zveřejnění své identity.
claim-success = Runtime převzat pro { $did }
claim-conflict = Runtime již převzat jinou identitou
claim-already-owned = Runtime už je převzat touto identitou
claim-http-failed = převzetí selhalo: HTTP { $status }
claim-error = převzetí selhalo: { $e }
claim-no-session = nepřihlášen; nejprve se přihlaste pro převzetí runtime
runtime-no-verb = žádné sloveso `{ $verb }` pro { $path }

# ── Slovesa — řízení přístupu ─────────────────────────────────────────────
acl-reset = .my.acl obnoveno (plně otevřeno)
err-persist = chyba ukládání: { $e }
acl-no-verb = žádné sloveso `{ $verb }` pro .my.acl

# ── Slovesa — identita ────────────────────────────────────────────────────
publish-usage = použití: .my.identity!publish <did-nebo-alias>
identity-exported = Balíček stažen jako { $filename }
identity-export-failed = Export se nezdařil: { $e }

# ── Slovesa — dokumenty ───────────────────────────────────────────────────
doc-content-empty = { $path } je prázdné
doc-save-first = { $path } je prázdné — nejprve uložte
doc-missing-name = chybí název dokumentu
doc-publish-usage = použití: .my.doc.<název>!publish <vydavatel>
doc-publish-ipld-usage = použití: .my.doc.<název>!publish-ipld <vydavatel>
doc-publish-failed = publikování { $path }: { $e }
doc-publish-ipld-failed = publikování IPLD { $path }: { $e }
doc-publish-error-detail = publikování selhalo [{ $code }]: { $err }
doc-publish-error-hint = Tip: { $hint }
doc-publish-hint-session = přihlaste se znovu, aby operator mělo přístup k vašim klíčům identity
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = ověřte, zda je dokument DID vydavatele publikován a obsahuje dosažitelný koncový bod
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin odmítl požadavek; zkontrolujte důvod a zkuste to znovu po opravě entity/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = prohlédněte si protokoly běhového prostředí pro podrobnou příčinu a zkuste to znovu
doc-store-sent = žádost o uložení odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi
doc-ipld-store-sent = žádost o uložení IPLD odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi
doc-fetch-done = { $cid } načteno → { $path } (nespuštěno)
doc-fetch-failed = načítání { $cid }: { $e }
doc-fetch-usage = použití: .my.doc.<název>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid není nastaveno
doc-no-verb = žádné sloveso `{ $verb }` pro { $path }
path-no-verb = žádné sloveso `{ $verb }` pro { $path }

# ── Text nápovědy — záhlaví ───────────────────────────────────────────────
help-header-operator = ── příkazy operator ───────────────────────────────────────────────────────────
help-header-messaging = ── zasílání zpráv ─────────────────────────────────────────────────────────
help-header-config = ── lokální gramatika konfigurace ─────────────────────────────────────
help-header-common = ── běžné cesty ───────────────────────────────────────────────────────────
help-header-inbox = ── doručená pošta ────────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-header-i18n = ── jazyk ───────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── zadání 間-mezera ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazat terminál
help-cmd-panic =   .panic                       poslední záchrana — použijte v nouzi
help-cmd-history =   .history [n]                 historie příkazů (po sobě jdoucí duplikáty sloučeny); volitelné n zobrazí jen posledních n řádků
help-cmd-logout =   .logout                      odhlásit
help-cmd-batch =   .batch                       vyhodnotit pracovní dokument paralelně
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         vyhodnotit pracovní dokument po řádcích

help-msg-echo =   @alias                       zobrazit přeložený DID/DID-URL (žádná zpráva není odeslána)
help-msg-send = @alias!msg body @alias:verb args odeslat zprávu aktérovi
help-msg-fragment =   @alias#fragment:verb body  odeslat na alias s explicitním fragmentem DID
help-msg-escape =   \@name                       doslovné @name (bez vyhledávání aliasů)


help-config-get =   .path                        získat hodnotu listu nebo vypsat podstrom
help-config-filter =   .path [název]                vypsat názvy podklíčů obsahující název
help-config-full =   .path. [název]               vypsat úplné hodnoty podstromu obsahující název
help-config-set =   .path: value                 nastavit list
help-config-delete =   .path:                       smazat list nebo podstrom
help-config-verb =   .path!verb [args]            spustit lokální sloveso

help-my =   .my                          zobrazit veškerou osobní konfiguraci
help-aliases =   .my.aliases                  vypsat aliasy
help-aliases-set =   .my.aliases.<name>: <did-url>    přidat/aktualizovat alias (DID nebo DID-URL)
help-aliases-del =   .my.aliases.<name>:          odstranit alias
help-runtime-discover =   .ma: claim [port]          zjistit lokální runtime a vytvořit alias @ma
help-runtime-claim =   .ma: claim [port]             převzít runtime svým DID
help-identity =   .my.identity                 zobrazit konfiguraci identity
help-identity-did =   .my.identity.did             zobrazit vlastní DID (pouze ke čtení)
help-identity-publish =   .my.identity!publish @pub    publikovat vlastní DID přes vydavatelskou službu
help-identity-export =   .my.identity!export          stáhnout vlastní balíček identity
help-config-path =   .config                      zobrazit všechny záznamy .config.*

help-inbox =   .my.inbox                    vypsat doručenou poštu (pohled podstromu)
help-inbox-n =   .my.inbox.N                  zobrazit pole záznamu N
help-inbox-from =   .my.inbox.N.from             DID odesílatele pro záznam N
help-inbox-reply =   .my.inbox.N!reply [body]     odeslat odpověď (otevře editor bez obsahu)
help-inbox-open =   .my.inbox.N!open             otevřít obsah v editoru jen ke čtení
help-inbox-del =   .my.inbox.N:                 smazat záznam N
help-inbox-delall =   .my.inbox:                   smazat všechny záznamy doručené pošty
help-inbox-flush =   .my.inbox!flush              vytisknout všechny záznamy v terminálu
help-inbox-filter =   .my.inbox!filter @who        zobrazit pouze záznamy od @who
help-inbox-traverse =   .my.inbox.N.sender.<pole>   procházet DID dokument odesílatele líně

help-doc-edit =   .my.doc.<název>!edit           otevřít editor s uloženým obsahem
help-doc-edit-cid =   .my.doc.<název>!edit /ipfs/<cid>     načíst CID, otevřít pro kontrolu
help-doc-eval =   .my.doc.<název>!eval           spustit uložený obsah řádek po řádku
help-doc-publish =   .my.doc.<název>!publish @pub   uložit jako surový blob (všechny typy)
help-doc-publish-ipld =   .my.doc.<název>!publish-ipld @pub  uložit YAML jako strukturovaný uzel DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<název>!fetch /ipfs/<cid>    importovat obsah CID (bez spuštění)
help-doc-cid =   .my.doc.<název>!cid            zobrazit uložené CID
help-doc-del =   .my.doc.<název>:              smazat dokument

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n ukládá jazykové preference spojené s vaší identitou.
help-i18n-set = .my.i18n: <code>             choose the language operator uses for this identity
help-i18n-list = .my.i18n!list               seznam dostupných jazykových kódů

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Místnost 間 je prostor mezi identitami 間. ma těmto identitám umožňuje, aby se našly a komunikovaly; jakmile je tvoje identita publikovaná, můžeš se zapojit.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   připoj se k místnímu 間 runtime, přečti /status.json a ulož .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikuj svůj DID dokument, aby ostatní mohli najít tvoje klíče a endpoint
help-ma-security = Nejjasnější hranice důvěry je vlastní 間 runtime s vlastním IPFS Desktop/Kubo. Vzdálený publisher může být užitečný, ale pak spoléháš na službu někoho jiného.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             jak vstoupit do místnosti 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Když je tvoje identita známá, .enter @ma ti umožní vstoupit do 間. Najdi si svět, vstup do něj a odtud se zapoj.
help-ma-entry-steps = Spusť IPFS Desktop a ma, potom spusť .ma. Publikuj pomocí .my.identity!publish @ma, najdi svět a vstup pomocí .enter @ma.
help-ma-entry-command =   .enter @ma                  vstup do 間 přes runtime @ma
help-ma-entry-toggle =   .enter                       zapni nebo vypni fokus místnosti; tvoje identita zůstává aktivní
help-ma-entry-url =   ?enter=<runtime>             vstup po přihlášení ze sdílené URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostupné jazyky (nastavte pomocí .my.i18n: <code>):
err-lang-not-found = jazyk nenalezen: { $lang }

msg-send-failed = odeslání se nezdařilo: { $e }
msg-not-logged-in = nepřihlášen

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Chyba analýzy YAML: { $e }
yaml-not-mapping = YAML musí být mapping (páry klíč: hodnota); prostý text a skaláry nelze uložit jako DAG-CBOR
dagcbor-encode-error = Chyba kódování DAG-CBOR: { $e }
cbor-decode-error = Chyba dekódování CBOR: { $e }
cbor-json-error = Chyba převodu CBOR na JSON: { $e }
yaml-serialise-error = Chyba serializace YAML: { $e }
edit-reply-invalid = Neplatná odpověď na úpravu
doc-publish-ipld-error = Publikování IPLD selhalo: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Chyba uložení prořezání schránky: { $e }
err-config-load = Chyba načítání konfigurace: { $e }
err-lang-persist = Chyba uložení jazyka: { $e }
err-history-parse = Chyba analýzy historie: { $e }
err-history-load = Chyba načítání historie: { $e }
err-history-count-invalid = počet historie musí být kladné celé číslo
err-ipfs-reply-decode = Selhání dekódování IPFS odpovědi: { $e }
err-edit-cbor = Chyba úpravy CBOR: { $e }
err-popup-blocked = Vyskakovací okno zablokováno prohlížečem
status-publishing = publikování

# ── redigering ─────────────────────────────────────────────────────
term-error = chyba
term-error-detail = chyba: { $detail }
msg-new-message = ← [{ $from }] nová zpráva — { $count } v doručené poště
msg-chat = { $sender } říká { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } říká { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } vstoupil do místnosti.
room-leave = * { $name } opustil místnost.
room-drop  = * { $name } upustil { $thing }.
room-take  = * { $name } zvedl { $thing }.
err-edit-decode-failed = chyba dekódování při úpravě: { $e }
err-edit-fetch-failed = chyba načítání při úpravě: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = žádné aktivní sezení — profil nelze smazat
profile-delete-error = mazání profilu selhalo: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil byl zašifrován a odeslán do IPFS; dokument DID se aktualizuje po doručení CID
profile-publish-done = profil publikován — dokument DID byl aktualizován o ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identita již zveřejněna — profil je aktuální
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binární obsah (nezobrazeno)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (žádný)
profiles-deleted = profil { $name } smazán
profiles-not-found = profil nenalezen: { $name }

# -- Help topics index
help-header-topics = -- témata -- pro podrobnosti napište .help/<topic>
help-topic-msg = .help/msg zprávy
help-topic-ma = .help/ma                     間-prostor, publikování a vstup
help-topic-path = .help/path                   místní dot-path gramatika
help-topic-my =   .help/my                     osobní konfigurace
help-topic-inbox =   .help/inbox                  schránka
help-topic-doc =   .help/doc                    dokumenty
help-topic-actor =   .help/actor                  vzdálený actor
help-topic-z =   .help/z                      veřejný a soukromý obsah Scheme
help-topic-zscheme =   .help/zscheme               vložené výrazy Scheme a dokumentace
help-unknown-topic =   .help/{ $topic }: neznámé téma

# -- Help actor section
help-header-actor = -- vzdálení aktéři
help-actor-echo =   @actor                       zobrazit vyřešený DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         odeslat přímou/chatovou/emotovou zprávu
help-actor-ping = @actor:ping                  živost ping
help-actor-entities =   @actor/entities              vypsat entity
help-actor-entities-get = @actor/entities/<n>          získat uzel entity
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     upravit entitu
help-actor-entities-del = @actor/entities/<n>:         odstranit entitu
help-actor-config-get =   @actor/config/<key>          získat hodnotu konfigurace
help-actor-config-set =   @actor/config/<key>: val     nastavit hodnotu konfigurace
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              upravit ACL
help-actor-fragment =   @actor#entity                odeslat do pluginu
help-actor-fragment-verb = @actor#entity:verb [args] do pluginu
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...) call an entity from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg)) ponechat odpovědi 5 v prostředí relace

help-topic-url =   .help/url                    otevření operator přes URL odkaz
help-topic-i18n = .help/i18n                   jazykové preference pro vaši identitu
help-header-url = ── URL parametry ────────────────────────────────────────────────────────────────
help-url-intro =   Sdílej odkaz, který otevře operator s předvyplněným příjemcem:
help-url-msg =   ?msg=<did>                   předvyplní: @<did>!msg (prostá zpráva)
help-url-say =   ?say=<did>                   předvyplní: @<did>!say (sloveso say)
help-url-emote =   ?emote=<did>                 předvyplní: @<did>!emote (sloveso emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             po přihlášení vstoupit do runtime světa
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Vstup je předvyplněn, ale neodeslaný — stiskni Enter pro odeslání.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                zveřejnit svou identitu v síti
help-header-publish = ── zveřejnění identity ──────────────────────────────────────────────────────
help-publish-intro = Zveřejnění učiní tvou identitu dohledatelnou v síti. Ostatní mohou vyhledat tvůj DID, aby tě kontaktovali.
help-publish-ma = Pro zveřejnění potřebuješ nainstalované 間 (lokální runtime). Propojuje operator s IPFS/IPNS tvým jménem.
help-publish-steps = Kroky: spusť '.ma: claim [port]' pro detekci lokálního ma, poté '.my.identity!publish @ma'.
help-publish-without = Bez zveřejnění tě ostatní nemohou kontaktovat — i když znají tvůj DID, nemohou rozlišit tvůj endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = zadejte název profilu: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Sběr dávky — zadejte příkazy, ukončete .batch
batch-already-collecting = Již sbíráte dávku — nejprve skončete .batch
batch-empty = Dávka byla prázdná – nebylo co spustit
batch-running = Spouštím dávku…
batch-step-timeout = vypršel časový limit dávkového kroku

batch-done = Dávka dokončena za { $secs }s — { $steps } kroků
batch-done-error = Dávka skončila s chybami za { $secs }s — { $steps } kroků
msg-timeout = Zprávě vypršel čas (žádná odpověď za 60s)
msg-outbox-open-timeout = aktér { $target } je nedostupný — spojení vypršelo po { $ms }ms
msg-outbox-send-timeout = odeslání na { $target } vypršelo po { $ms }ms — spojení mohlo být přerušeno
err-unknown-command = neznámý příkaz: { $path }
err-read-only-path = { $path } je pouze pro čtení
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        vyhodnotit pracovní dokument paralelně


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Načtení CID { $cid } selhalo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Neplatný CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Varování: Váš soukromý klíč IPNS bude odeslán do tohoto běhového prostředí za účelem publikování identity. Používejte pouze běhové prostředí, kterému plně důvěřujete.

# -- Help text -- zscheme
help-header-z = ── .z a .my ───────────────────────────────────────────────────────────────
help-z-public =   .z.*                       veřejný nebo publikovatelný obsah; neukládejte sem tajemství
help-z-scheme =   .z.scheme                  skript Scheme načtený a vyhodnocený při spuštění
help-z-control =   .z.scheme                 obsah spouštěcího skriptu ovládáte sami
help-z-private =   .my.*                     soukromá místní konfigurace; Scheme lze uložit i sem
help-z-choice =   .z.* / .my.*               .z.* používejte pro veřejný Scheme a .my.* pro soukromý Scheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme vyhodnocuje výrazy Scheme vložené do příkazů operator a před odesláním vloží výsledek do řádku.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    vložený příklad; odešle "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definice zůstávají pro aktuální přihlášenou relaci
help-zscheme-doc = Dokumentace: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Místní IPFS brána (vyžaduje výjimku v prohlížeči)

tab-config = Nastavení
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
