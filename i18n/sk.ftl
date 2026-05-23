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
msg-reply-sent = odpoveď odoslaná
msg-reply-failed = odoslanie odpovede zlyhalo: { $e }
msg-entity-publish-sent = entita { $name }: publikácia odoslaná
msg-entity-publish-failed = publikovanie entity zlyhalo: { $e }
msg-field-publish-sent = entita { $name }.{ $field }: publikácia odoslaná
msg-field-publish-failed = publikovanie poľa zlyhalo: { $e }
msg-acl-publish-sent = ACL runtime: publikácia odoslaná
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

# ── Slovesá — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = zisťovanie zlyhalo na { $url }: { $e }
discover-json-error = zisťovanie zlyhalo: neplatný JSON z { $url }: { $e }
discover-missing-did = zisťovanie zlyhalo: status.json chýba povinné pole `did`
discover-invalid-did = zisťovanie zlyhalo: očakávané `did` začínajúce did:ma:, prijaté `{ $did }`
discover-no-endpoint = varovanie zisťovania: `endpoint_id` chýba v status.json; uložené len DID
discover-success = ma zistené na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma vytvorený — publikujte cez: .my.identity:publish @ma
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
help-cmd-logout =   .logout                      odhlásiť

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
help-config-path =   .config                      zobraziť všetky záznamy .config.*

help-inbox =   .my.inbox                    vypísať doručenú poštu (pohľad podstromu)
help-inbox-n =   .my.inbox.N                  zobraziť polia záznamu N
help-inbox-from =   .my.inbox.N.from             DID odosielateľa pre záznam N
help-inbox-reply =   .my.inbox.N:reply [body]     odoslať odpoveď (otvorí editor bez obsahu)
help-inbox-open =   .my.inbox.N:open             otvoriť obsah v editore len na čítanie
help-inbox-del =   .my.inbox.N:                 vymazať záznam N
help-inbox-delall =   .my.inbox:                   vymazať všetky záznamy doručenej pošty
help-inbox-flush =   .my.inbox:flush              vytlačiť všetky záznamy v termináli
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
