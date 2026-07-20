# zion — Čeština
lang-name = Čeština

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
passphrase-warning = Ztracená přístupová fráze = ztracená identita. Obnova není možná.
import-profile-help = Importujte profil pomocí CID nebo souboru. Potřebujete stejné heslo, které bylo použito při publikování.
import-profile-detected-user = Profil patří: { $name }
status-unlocking = odemykání...
status-generating = generování identity...
status-reading-file = čtení souboru...
status-fetching-profile = načítání profilu z IPFS...
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
msg-logged-in = zion v{ $version } — přihlášen jako { $username }
msg-type-help = Napište .help pro seznam příkazů.
msg-connecting = připojování k iroh...
msg-iroh-ready = iroh endpoint připraven
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID zveřejněno přes lokální ma ({ $url })
msg-ma-connecting-matrix = pokouším se tě připojit k 間trixu
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = lokální 間 převzat
msg-local-ma-already-claimed = lokální 間 už je převzat
msg-local-ma-claim-failed = lokální 間 se nepodařilo převzít
msg-identity-not-published = Identita nenalezena online — máš-li ma nainstalované lokálně, spusť '.ma [port]' a poté '.my.identity!publish @ma'. Napiš '.help/publish' pro podrobnosti.
msg-blocked = ⊗ zablokováno [{ $cap }]: { $from }
msg-focus-cleared = fokus vymazán
msg-focusing = zaměření na { $did } jako { $prompt }
msg-set = { $path }: { $value }
msg-deleted = smazáno { $path } ({ $count } záznamů)
msg-read-only = { $path } je pouze ke čtení
msg-subtree-set = { $path } je podstrom; nastavení odmítnuto
msg-ancestor-leaf = předek { $path } je list; stínování odmítnuto
msg-key-not-found = klíč nenalezen: { $path }
msg-no-match = žádná shoda
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
discover-hint-endpoint-not-found = Tip: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Tip: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Tip: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tip: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma zjištěno na { $url }
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
acl-persist-error = chyba ukládání: { $e }
acl-no-verb = žádné sloveso `{ $verb }` pro .my.acl

# ── Slovesa — identita ────────────────────────────────────────────────────
publish-usage = použití: .my.identity!publish <did-nebo-alias>
identity-exported = Balíček stažen jako { $filename }
identity-export-failed = Export se nezdařil: { $e }

# ── Slovesa — dokumenty ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prázdné
doc-save-first = { $path }.content je prázdné — nejprve uložte
doc-missing-name = chybí název dokumentu
doc-publish-usage = použití: .my.doc.<název>!publish <vydavatel>
doc-publish-ipld-usage = použití: .my.doc.<název>!publish-ipld <vydavatel>
doc-publish-failed = publikování { $path }: { $e }
doc-publish-ipld-failed = publikování IPLD { $path }: { $e }
doc-publish-error-detail = publikování selhalo [{ $code }]: { $err }
doc-publish-error-hint = Tip: { $hint }
doc-publish-hint-session = přihlaste se znovu, aby ego mělo přístup k vašim klíčům identity
doc-publish-hint-target = použijte platný DID nebo alias vydavatele, který se převede na holý 57
doc-publish-hint-network = ověřte, že runtime 7 a 22 jsou dosažitelné, pak to zkuste znovu
doc-publish-hint-resolve = ověřte, zda je dokument DID vydavatele publikován a obsahuje dosažitelný koncový bod
doc-publish-hint-acl = požádejte operátora vydavatele o povolení vašeho DID v 48
doc-publish-hint-runtime = runtime/plugin odmítl požadavek; zkontrolujte důvod a zkuste to znovu po opravě entity/runtime
doc-publish-hint-ipfs = zkontrolujte místní stav 12/17 a stav runtime vydavatele
doc-publish-hint-unknown = prohlédněte si protokoly běhového prostředí pro podrobnou příčinu a zkuste to znovu
doc-store-sent = žádost o uložení odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi RPC
doc-ipld-store-sent = žádost o uložení IPLD odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi RPC
doc-fetch-done = { $cid } načteno → { $path }.content (nespuštěno)
doc-fetch-failed = načítání { $cid }: { $e }
doc-fetch-usage = použití: .my.doc.<název>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid není nastaveno
doc-no-verb = žádné sloveso `{ $verb }` pro { $path }
path-no-verb = žádné sloveso `{ $verb }` pro { $path }

# ── Text nápovědy — záhlaví ───────────────────────────────────────────────
help-header-zion = ── příkazy zion ───────────────────────────────────────────────────────────
help-header-messaging = ── zasílání zpráv ─────────────────────────────────────────────────────────
help-header-config = ── lokální gramatika konfigurace ─────────────────────────────────────
help-header-common = ── běžné cesty ───────────────────────────────────────────────────────────
help-header-inbox = ── doručená pošta ────────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-header-i18n = ── jazyk ───────────────────────────────── ───────────────────────────────
help-header-ma = ── 3-mezera ─────────────────────────────── ───────────────────────────────
help-header-ma-entry = ── zadání 間-mezera ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazat terminál
help-cmd-panic =   .panic                       poslední záchrana — použijte v nouzi
help-cmd-history =   .history                     historie příkazů (po sobě jdoucí duplikáty sloučeny)
help-cmd-logout =   .logout                      odhlásit
help-cmd-batch =   .batch                       vyhodnotit pracovní dokument paralelně
help-cmd-batch-sync =   .batch:sync / .batch         vyhodnotit pracovní dokument po řádcích

help-msg-echo =   @alias                       zobrazit přeložený DID/DID-URL (žádná zpráva není odeslána)
help-msg-send =   @alias!msg body / @alias:verb args           odeslat zprávu / RPC aktérovi
help-msg-fragment =   @alias#fragment:verb body  odeslat na alias s explicitním fragmentem DID
help-msg-escape =   \@name                       doslovné @name (bez vyhledávání aliasů)


help-config-get =   .path                        získat hodnotu listu nebo vypsat podstrom
help-config-filter =   .path value                  vyhledávací filtr (filtrovat podle hodnoty)
help-config-set =   .path: value                 nastavit list
help-config-delete =   .path:                       smazat list nebo podstrom
help-config-verb =   .path!verb [args]            spustit lokální sloveso

help-my =   .my                          zobrazit veškerou osobní konfiguraci
help-aliases =   .my.aliases                  vypsat aliasy
help-aliases-set =   .my.aliases.<name>: <did-url>    přidat/aktualizovat alias (DID nebo DID-URL)
help-aliases-del =   .my.aliases.<name>:          odstranit alias
help-runtime-discover =   .ma [port]          zjistit lokální runtime a vytvořit alias @ma
help-runtime-claim =   .ma [port]             převzít runtime svým DID
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
help-i18n-set = .my.i18n: <code>             vyberte jazyk, který 20 používá pro tuto identitu
help-i18n-list = .my.i18n!list               seznam dostupných jazykových kódů

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Místnost 間 je prostor mezi identitami 間. ma těmto identitám umožňuje, aby se našly a komunikovaly; jakmile je tvoje identita publikovaná, můžeš se zapojit.
help-ma-command =   .ma [port]                   připoj se k místnímu ma runtime, přečti /status.json a ulož .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikuj svůj DID dokument, aby ostatní mohli najít tvoje klíče a endpoint
help-ma-security = Nejjasnější hranice důvěry je vlastní ma runtime s vlastním IPFS Desktop/Kubo. Vzdálený publisher může být užitečný, ale pak spoléháš na službu někoho jiného.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
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
yaml-serialize-error = Chyba serializace YAML: { $e }
edit-reply-invalid = Neplatná odpověď na úpravu
doc-publish-ipld-error = Publikování IPLD selhalo: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Chyba uložení prořezání schránky: { $e }
err-config-load = Chyba načítání konfigurace: { $e }
err-lang-persist = Chyba uložení jazyka: { $e }
err-history-parse = Chyba analýzy historie: { $e }
err-history-load = Chyba načítání historie: { $e }
err-ipfs-reply-decode = Selhání dekódování IPFS odpovědi: { $e }
err-edit-cbor = Chyba úpravy CBOR: { $e }
err-popup-blocked = Vyskakovací okno zablokováno prohlížečem
status-publishing = publikování

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = chyba
rpc-error-detail = chyba: { $detail }
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
profile-wrong-user = nelze nastavit 11 pro jiný profil – pouze pro váš vlastní
profile-wrong-user-name = nelze nastavit 11 pro 19 – pouze váš vlastní profil
profile-no-ma = není nakonfigurováno žádné runtime 3 – nejprve spusťte 31
profile-no-cid = pro tento profil není uložen žádný 3 – nejprve spusťte 37
profile-no-cid-in-doc = v dokumentu DID nebyl nalezen žádný profil 11 – nejprve spusťte 43
profile-publish-sent = profil byl zašifrován a odeslán do IPFS; dokument DID se aktualizuje po doručení CID
profile-publish-done = profil publikován — dokument DID byl aktualizován o ma.agent CID
profile-publish-failed = publikování profilu se nezdařilo: 24
profile-fetch-done = profil načten — klíče 18 načteny z 43
profile-fetch-failed = načtení profilu se nezdařilo: 22
msg-identity-exists = identita již zveřejněna — profil je aktuální
profile-import-exists = profil 8 již existuje – nejprve jej smažte
profile-import-wrong-user = soubor obsahuje profil 22, očekávaný 42

# -- CID content operations
cid-op-binary = binární obsah (nezobrazeno)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = nepodařilo se načíst obsah: 25
cid-op-unknown = operace s neznámým obsahem: 27
cid-op-wc = { $lines } řádky 18 slova 36 znaky
profiles-empty = (žádný)
profiles-deleted = profil { $name } smazán
profiles-not-found = profil nenalezen: { $name }

# -- Help topics index
help-header-topics = -- témata -- pro podrobnosti napište .help/<topic>
help-topic-msg =   .help/msg                    zprávy
help-topic-ma = .help/ma                     ma-prostor, publikování a vstup
help-topic-path = .help/path                   místní dot-path gramatika
help-topic-my =   .help/my                     osobní konfigurace
help-topic-inbox =   .help/inbox                  schránka
help-topic-doc =   .help/doc                    dokumenty
help-topic-actor =   .help/actor                  vzdálený actor
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: neznámé téma

# -- Help actor section
help-header-actor = -- vzdálení aktéři
help-actor-echo =   @actor                       zobrazit vyřešený DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         odeslat přímou/chatovou/emotovou zprávu
help-actor-ping = @actor:ping                  živost ping
help-actor-entities =   @actor/entities              vypsat entity
help-actor-entities-get = @actor/entities/<n>          získat uzel entity
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   nastavit entitu odkazem 14
help-actor-entities-edit =   @actor/entities/<n>!edit     upravit entitu
help-actor-entities-del = @actor/entities/<n>:         odstranit entitu
help-actor-config-get =   @actor/config/<key>          získat hodnotu konfigurace
help-actor-config-set =   @actor/config/<key>: val     nastavit hodnotu konfigurace
help-actor-acl = @actor/acl                   získat 4
help-actor-acl-edit =   @actor/acl!edit              upravit ACL
help-actor-fragment =   @actor#entity                odeslat do pluginu
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC do pluginu
help-header-cid-ops = ── 3 herec volá ───────────────────────── ──────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  zavolejte entitu 15 z 24 a počkejte na její odpověď
help-actor-head = (@actor/path)                načíst vzdálený obsah CRUD z 31
help-actor-tail = (<bafy...>)                  zahrnout a vyhodnotit 21 z 36 41
help-actor-wc = (define x (@actor:verb arg))  ponechat odpovědi 5 v prostředí relace
help-actor-wc-l = .my.scheme.ma!edit           upravit uložené pomocníky 11 pro tuto identitu

help-topic-url =   .help/url                    otevření zion přes URL odkaz
help-topic-i18n = .help/i18n                   jazykové preference pro vaši identitu
help-header-url = ── URL parametry ────────────────────────────────────────────────────────────────
help-url-intro =   Sdílej odkaz, který otevře zion s předvyplněným příjemcem:
help-url-msg =   ?msg=<did>                   předvyplní: @<did>!msg (prostá zpráva)
help-url-say =   ?say=<did>                   předvyplní: @<did>!say (sloveso say)
help-url-emote =   ?emote=<did>                 předvyplní: @<did>!emote (sloveso emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / 23 URL
help-url-enter = ?enter=<runtime>             po přihlášení vstoupit do runtime světa
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Vstup je předvyplněn, ale neodeslaný — stiskni Enter pro odeslání.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                zveřejnit svou identitu v síti
help-header-publish = ── zveřejnění identity ──────────────────────────────────────────────────────
help-publish-intro = Zveřejnění učiní tvou identitu dohledatelnou v síti. Ostatní mohou vyhledat tvůj DID, aby tě kontaktovali.
help-publish-ma = Pro zveřejnění potřebuješ nainstalované ma (lokální runtime). Propojuje ego s IPFS/IPNS tvým jménem.
help-publish-steps = Kroky: spusť '.ma [port]' pro detekci lokálního ma, poté '.my.identity!publish @ma'.
help-publish-without = Bez zveřejnění tě ostatní nemohou kontaktovat — i když znají tvůj DID, nemohou rozlišit tvůj endpoint.
profile-fetch-did-resolve-failed = Ještě nebylo zveřejněno – nejprve spusťte 28 a poté 67 svůj profil
profile-update-done = profil aktualizován — klíče 18 byly sloučeny z 43
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
err-unknown-command = neznámý příkaz: { $path }
err-read-only-path = { $path } je pouze pro čtení
help-cmd-batch-async =   .batch:async / .batch        vyhodnotit pracovní dokument paralelně


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Načtení CID { $cid } selhalo: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Neplatný CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Varování: Váš soukromý klíč IPNS bude odeslán do tohoto běhového prostředí za účelem publikování identity. Používejte pouze běhové prostředí, kterému plně důvěřujete.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
