# zion — Čeština
lang-name = Čeština

# ── Přihlašovací stránka ──────────────────────────────────────────────────
tab-login = přihlásit
tab-new-identity = nová identita
tab-import = importovat
label-passphrase = přístupová fráze
label-username = uživatelské jméno
label-confirm-passphrase = potvrdit přístupovou frázi
btn-login = přihlásit
btn-export = exportovat
btn-generate = generovat
passphrase-warning = Ztracená přístupová fráze = ztracená identita. Obnova není možná.
import-help = Vyberte exportovaný soubor .zion.json. Balíček zůstane zašifrovaný.
status-unlocking = odemykání...
status-generating = generování identity...
status-reading-file = čtení souboru...
status-imported = '{ $name }' importováno — přejděte na záložku Přihlásit
error-wrong-passphrase = nesprávná přístupová fráze: { $e }
error-identity-not-found = identita '{ $name }' nenalezena
error-username-required = uživatelské jméno je povinné
error-passphrase-required = přístupová fráze je povinná
error-passphrases-no-match = přístupové fráze se neshodují

# ── Systémové zprávy terminálu ────────────────────────────────────────────
msg-logged-in = zion v{ $version } — přihlášen jako { $username }
msg-type-help = Napište .help pro seznam příkazů.
msg-connecting = připojování k iroh...
msg-iroh-ready = iroh endpoint připraven
msg-iroh-failed = iroh: { $e }
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
err-alias-has-fragment = název aliasu nesmí obsahovat '#'
err-alias-value-fragment = hodnota aliasu musí být čisté did:ma:<ipns> (bez fragmentu)
err-alias-value-path = hodnota aliasu musí být čisté did:ma:<ipns> (bez cesty)
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
msg-reply-sent = odpověď odeslána
msg-reply-failed = odeslání odpovědi selhalo: { $e }
msg-entity-publish-sent = entita { $name }: publikace odeslána
msg-entity-publish-failed = publikování entity selhalo: { $e }
msg-field-publish-sent = entita { $name }.{ $field }: publikace odeslána
msg-field-publish-failed = publikování pole selhalo: { $e }
msg-acl-publish-sent = ACL runtime: publikace odeslána
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

# ── Slovesa — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = zjišťování selhalo na { $url }: { $e }
discover-json-error = zjišťování selhalo: neplatný JSON z { $url }: { $e }
discover-missing-did = zjišťování selhalo: status.json postrádá povinné pole `did`
discover-invalid-did = zjišťování selhalo: očekáváno `did` začínající did:ma:, přijato `{ $did }`
discover-no-endpoint = varování zjišťování: `endpoint_id` chybí v status.json; uloženo jen DID
discover-success = ma zjištěno na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma vytvořen — publikujte přes: .my.identity:publish @ma
claim-success = Runtime převzat pro { $did }
claim-conflict = Runtime již převzat jinou identitou
claim-http-failed = převzetí selhalo: HTTP { $status }
claim-error = převzetí selhalo: { $e }
claim-no-session = nepřihlášen; nejprve se přihlaste pro převzetí runtime
runtime-no-verb = žádné sloveso `{ $verb }` pro { $path }

# ── Slovesa — řízení přístupu ─────────────────────────────────────────────
acl-reset = .my.acl obnoveno (plně otevřeno)
acl-persist-error = chyba ukládání: { $e }
acl-no-verb = žádné sloveso `{ $verb }` pro .my.acl

# ── Slovesa — identita ────────────────────────────────────────────────────
publish-usage = použití: .my.identity:publish <did-nebo-alias>

# ── Slovesa — dokumenty ───────────────────────────────────────────────────
doc-content-empty = { $path }.content je prázdné
doc-save-first = { $path }.content je prázdné — nejprve uložte
doc-missing-name = chybí název dokumentu
doc-publish-usage = použití: .my.doc.<název>:publish <vydavatel>
doc-publish-ipld-usage = použití: .my.doc.<název>:publish-ipld <vydavatel>
doc-publish-failed = publikování { $path }: { $e }
doc-publish-ipld-failed = publikování IPLD { $path }: { $e }
doc-store-sent = žádost o uložení odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi RPC
doc-ipld-store-sent = žádost o uložení IPLD odeslána ({ $id }) → { $publisher }; CID přijde v odpovědi RPC
doc-fetch-done = { $cid } načteno → { $path }.content (nespuštěno)
doc-fetch-failed = načítání { $cid }: { $e }
doc-fetch-usage = použití: .my.doc.<název>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid není nastaveno
doc-no-verb = žádné sloveso `{ $verb }` pro { $path }
path-no-verb = žádné sloveso `{ $verb }` pro { $path }

# ── Text nápovědy — záhlaví ───────────────────────────────────────────────
help-header-zion = ── příkazy zion ───────────────────────────────────────────────────────────
help-header-messaging = ── zasílání zpráv ─────────────────────────────────────────────────────────
help-header-focus = ── režim fokusu ──────────────────────────────────────────────────────────
help-header-config = ── lokální gramatika konfigurace ─────────────────────────────────────
help-header-common = ── běžné cesty ───────────────────────────────────────────────────────────
help-header-inbox = ── doručená pošta ────────────────────────────────────────────────────────
help-header-documents = ── dokumenty ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        tento text
help-cmd-clear =   .clear                       vymazat terminál
help-cmd-panic =   .panic                       poslední záchrana — použijte v nouzi
help-cmd-logout =   .logout                      odhlásit

help-msg-echo =   @alias                       zobrazit přeložený DID (žádná zpráva není odeslána)
help-msg-send =   @alias[:verb] body           odeslat zprávu / RPC aktérovi
help-msg-fragment =   @alias#fragment[:verb] body  odeslat na alias s explicitním fragmentem DID
help-msg-escape =   \@name                       doslovné @name (bez vyhledávání aliasů)

help-focus-set =   .use @alias [as @name]       zaměřit na aktéra (změní výzvu)
help-focus-clear =   .use                         vymazat fokus

help-config-get =   .path                        získat hodnotu listu nebo vypsat podstrom
help-config-filter =   .path value                  vyhledávací filtr (filtrovat podle hodnoty)
help-config-set =   .path: value                 nastavit list
help-config-delete =   .path:                       smazat list nebo podstrom
help-config-verb =   .path:verb [args]            spustit lokální sloveso

help-my =   .my                          zobrazit veškerou osobní konfiguraci
help-aliases =   .my.aliases                  vypsat aliasy
help-aliases-set =   .my.aliases.<name>: <did>    přidat/aktualizovat alias (čisté DID, bez #fragmentu)
help-aliases-del =   .my.aliases.<name>:          odstranit alias
help-runtime-discover =   .my.ma:discover          zjistit lokální runtime a vytvořit alias @ma
help-runtime-claim =   .my.ma:claim             převzít runtime svým DID
help-identity =   .my.identity                 zobrazit konfiguraci identity
help-identity-did =   .my.identity.did             zobrazit vlastní DID (pouze ke čtení)
help-identity-publish =   .my.identity:publish @pub    publikovat vlastní DID přes vydavatelskou službu
help-config-path =   .config                      zobrazit všechny záznamy .config.*

help-inbox =   .my.inbox                    vypsat doručenou poštu (pohled podstromu)
help-inbox-n =   .my.inbox.N                  zobrazit pole záznamu N
help-inbox-from =   .my.inbox.N.from             DID odesílatele pro záznam N
help-inbox-reply =   .my.inbox.N:reply [body]     odeslat odpověď (otevře editor bez obsahu)
help-inbox-open =   .my.inbox.N:open             otevřít obsah v editoru jen ke čtení
help-inbox-del =   .my.inbox.N:                 smazat záznam N
help-inbox-delall =   .my.inbox:                   smazat všechny záznamy doručené pošty
help-inbox-flush =   .my.inbox:flush              vytisknout všechny záznamy v terminálu
help-inbox-traverse =   .my.inbox.N.sender.<pole>   procházet DID dokument odesílatele líně

help-doc-edit =   .my.doc.<název>:edit           otevřít editor s uloženým obsahem
help-doc-edit-cid =   .my.doc.<název>:edit <cid>     načíst CID, otevřít pro kontrolu
help-doc-eval =   .my.doc.<název>:eval           spustit uložený obsah řádek po řádku
help-doc-publish =   .my.doc.<název>:publish @pub   uložit jako surový blob (všechny typy)
help-doc-publish-ipld =   .my.doc.<název>:publish-ipld @pub  uložit YAML jako strukturovaný uzel DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<název>:fetch <cid>    importovat obsah CID (bez spuštění)
help-doc-cid =   .my.doc.<název>:cid            zobrazit uložené CID
help-doc-del =   .my.doc.<název>:              smazat dokument

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Dostupné jazyky (nastavte pomocí .my.i18n: <code>):
err-lang-not-found = jazyk nenalezen: { $lang }
