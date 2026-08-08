# zion — Magyar
lang-name = Magyar
label-nick = becenév
new-identity-nick-help = Válassz becenevet a ma-space-hez. Ez csak egy becenév, és bármikor megváltoztathatod.
error-nick-required = becenév szükséges
error-nick-invalid = a becenév nem tartalmazhat szóközt vagy @ jelet

# ── Bejelentkezési oldal ──────────────────────────────────────────────────
tab-login = bejelentkezés
tab-new-identity = új identitás
tab-import-profile = profil importálása
label-passphrase = jelmondat
label-username = felhasználónév
label-confirm-passphrase = jelmondat megerősítése
label-did = DID
label-profile-cid = profil CID
label-or-file = vagy fájl
btn-login = bejelentkezés
btn-export = exportálás
btn-generate = generálás
btn-new-endpoint = új végpont
btn-import-profile = profil importálása
btn-show-qr = QR megjelenítése
btn-scan-qr = QR beolvasása
qr-scan-hint = Irányítsa a kamerát egy zion profil QR-kódjára.
qr-error-camera = a kamera nem elérhető: { $e }
qr-error-too-large = a profil túl nagy egy QR-kódhoz
passphrase-warning = Elveszett jelmondat = elveszett identitás. Helyreállítás nem lehetséges.
import-profile-help = Importáljon egy profilt CID vagy fájl segítségével. Szükséges ugyanaz a jelszófrázis, amelyet a közzétételkor használt.
import-profile-detected-user = A profil tulajdonosa: { $name }
status-unlocking = feloldás folyamatban...
status-generating = identitás generálása...
status-reading-file = fájl olvasása...
status-fetching-profile = profil letöltése az IPFS-ről...
status-imported = '{ $name }' importálva — lépjen át a Bejelentkezés lapra
status-importing-profile = profil importálása...
profile-import-done = a profil importálva '{ $name }' számára — { $n } kulcs betöltve
error-wrong-passphrase = helytelen jelmondat: { $e }
error-identity-not-found = az identitás '{ $name }' nem található
error-username-required = a felhasználónév megadása kötelező
error-passphrase-required = a jelmondat megadása kötelező
error-passphrases-no-match = a jelmondatok nem egyeznek
error-profile-source-required = adjon meg CID-t vagy töltsön fel fájlt
error-did-required = adja meg DID-jét
error-profile-fetch = a profil nem kérhető le: { $e }
error-profile-no-username = a profil nem tartalmaz felhasználónevet
error-profile-no-identity = az identitás '{ $name }' nem található — előbb importálja az identitást

# ── Terminál rendszerüzenetek ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — bejelentkezve mint { $username }
msg-type-help = Írja be a .help parancsot a parancsok listájához.
msg-getting-started = Próbálja ki: say Hello world, look, .help vagy help.
msg-connecting = csatlakozás az iroh-hoz...
msg-iroh-ready = iroh végpont kész
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID közzétéve helyi ma-n keresztül ({ $url })
msg-identity-publication-propagating = Az identitás közzététele még terjed; az entry késik: { $e }
msg-identity-first-publish = Az identitás első közzététele folyamatban. Ez akár { $seconds } másodpercig is eltarthat.
msg-ma-connecting-matrix = megpróbálunk csatlakoztatni a 間trixhoz
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = helyi 間 igénybe véve
msg-local-ma-already-claimed = a helyi 間 már igénybe van véve
msg-local-ma-claim-failed = nem sikerült igénybe venni a helyi 間-t
msg-identity-not-published = Az identitás nem található online — ha helyileg telepítve van a ma, futtasd '.ma [port]', majd '.my.identity!publish @ma'. Írd '.help/publish' a részletekért.
msg-blocked = ⊗ letiltva [{ $cap }]: { $from }
msg-focus-cleared = fókusz törölve
msg-left = left
msg-focusing = fókuszálás: { $did } mint { $prompt }
msg-set = { $path }: { $value }
msg-deleted = törölve: { $path } ({ $count } bejegyzés)
msg-read-only = { $path } csak olvasható
msg-subtree-set = { $path } részfa; a beállítás elutasítva
msg-ancestor-leaf = { $path } egyik őse levél; az árnyékolás elutasítva
msg-key-not-found = kulcs nem található: { $path }
msg-link-not-connected = hivatkozás lekérési hiba: nincs kapcsolat
msg-link-fetch-error = hivatkozás lekérési hiba: { $e }
msg-link-key-not-found = `{ $key }` kulcs nem található a hivatkozott dokumentumban

# ── Alias érvényesítés ────────────────────────────────────────────────────
err-alias-name-empty = az álnév neve nem lehet üres
err-alias-has-dot = az álnév neve nem tartalmazhat '.' karaktert
err-alias-has-fragment = az álnév neve nem tartalmazhat '#' karaktert
err-alias-value-fragment = az álnév értéke legfeljebb egy nem üres DID-URL töredéket tartalmazhat
err-alias-value-path = az álnév értékének did:ma:<ipns> DID-nek vagy DID-URL-nek kell lennie (útvonal nélkül)
err-alias-not-did = az álnév értékének did:ma:-vel kell kezdődnie
err-unknown-alias = ismeretlen álnév: @{ $name }
err-bare-did = tiszta did:ma:<ipns> várt (töredék vagy útvonal nélkül), kapott: { $did }

# ── Szerkesztő ────────────────────────────────────────────────────────────
btn-save = Mentés
btn-eval = Futtatás
btn-cancel = Mégse
msg-jobs-cancelled = feladatok megszakítva
btn-close = Bezárás
btn-reply = Válasz
btn-publish = Közzététel
btn-publish-ipld = Közzététel IPLD
msg-reply-sent = válasz elküldve
msg-reply-failed = a válasz küldése sikertelen: { $e }
msg-entity-publish-sent = { $name } entitás: közzététel elküldve
msg-entity-publish-failed = az entitás közzététele sikertelen: { $e }
msg-kind-publish-failed = típus közzétele sikertelen: { $e }
msg-field-publish-sent = { $name }.{ $field } entitás: közzététel elküldve
msg-field-publish-failed = a mező közzététele sikertelen: { $e }
msg-acl-publish-sent = futtatókörnyezet ACL: közzététel elküldve
msg-crud-edit-publish-sent = { $path }: közzététel elküldve
msg-acl-publish-failed = a futtatókörnyezet ACL közzététele sikertelen: { $e }
msg-yaml-error = YAML hiba: { $e }
msg-editor-saved = { $path }:mentés
msg-fetch-review = { $cid } letöltve — ellenőrizze futtatás előtt
msg-fetch-failed = letöltés { $cid }: { $e }

# ── Igék — bejövő üzenetek ────────────────────────────────────────────────
inbox-empty = a bejövő üzenetek üresek
inbox-entry-not-found = a bejövő üzenetek { $n }. bejegyzése nem található
inbox-no-message-id = a bejövő üzenetek { $n }. bejegyzésének nincs message_id-je
inbox-no-verb = nincs `{ $verb }` ige a bejövő üzenetek { $n }. bejegyzéséhez
inbox-filter-no-arg = a szűrőhöz DID vagy alias argumentum szükséges
inbox-filter-empty = nincs üzenet { $did } felhasználótól

# ── Igék — futtatókörnyezet ───────────────────────────────────────────────
discover-fetch-failed = felderítés sikertelen a következő helyen: { $url }: { $e }
discover-json-error = felderítés sikertelen: érvénytelen JSON a következőből: { $url }: { $e }
discover-missing-did = felderítés sikertelen: a status.json hiányzó kötelező `did` mezőt tartalmaz
discover-invalid-did = felderítés sikertelen: a `did` did:ma:-vel kell kezdődjön, kapott: `{ $did }`
discover-no-endpoint = felderítési figyelmeztetés: `endpoint_id` hiányzik a status.json-ból; csak DID mentve
discover-hint-endpoint-not-found = Tipp: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Tipp: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Tipp: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Tipp: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = ma felderítve a következő helyen: { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma alias létrehozva — futtasd '.my.identity!publish @ma' az identitásod közzétételéhez.
claim-success = Futtatókörnyezet igénybe véve: { $did }
claim-conflict = A futtatókörnyezetet már egy másik identitás igénybe vette
claim-already-owned = A Runtime-ot már ez az identitás igénybe vette
claim-http-failed = igénybevétel sikertelen: HTTP { $status }
claim-error = igénybevétel sikertelen: { $e }
claim-no-session = nincs bejelentkezés; a futtatókörnyezet igénybevételéhez először jelentkezzen be
runtime-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }

# ── Igék — hozzáférés-vezérlés ────────────────────────────────────────────
acl-reset = .my.acl visszaállítva (teljesen nyitott)
acl-persist-error = mentési hiba: { $e }
acl-no-verb = nincs `{ $verb }` ige a .my.acl-hez

# ── Igék — identitás ──────────────────────────────────────────────────────
publish-usage = használat: .my.identity!publish <did-vagy-álnév>
identity-exported = A csomag letöltve { $filename } névvel
identity-export-failed = Az export sikertelen: { $e }

# ── Igék — dokumentumok ───────────────────────────────────────────────────
doc-content-empty = { $path }.content üres
doc-save-first = { $path }.content üres — először mentse el
doc-missing-name = hiányzó dokumentumnév
doc-publish-usage = használat: .my.doc.<név>!publish <kiadó>
doc-publish-ipld-usage = használat: .my.doc.<név>!publish-ipld <kiadó>
doc-publish-failed = közzététel { $path }: { $e }
doc-publish-ipld-failed = IPLD közzététel { $path }: { $e }
doc-publish-error-detail = közzététel sikertelen [{ $code }]: { $err }
doc-publish-error-hint = Tipp: { $hint }
doc-publish-hint-session = jelentkezzen be újra, hogy az ego hozzáférhessen a személyazonossági kulcsaihoz
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = ellenőrizze, hogy a kiadói DID-dokumentum megjelent-e, és tartalmaz-e elérhető végpontot
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin elutasította a kérést; ellenőrizze az okot, és próbálja újra az entitás/futásidő javítása után
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = ellenőrizze a futásidejű naplókat a részletes okokért, és próbálkozzon újra
doc-store-sent = tárolási kérelem elküldve ({ $id }) → { $publisher }; a CID RPC válaszban érkezik
doc-ipld-store-sent = IPLD tárolási kérelem elküldve ({ $id }) → { $publisher }; a CID RPC válaszban érkezik
doc-fetch-done = { $cid } letöltve → { $path }.content (nem futtatva)
doc-fetch-failed = letöltés { $cid }: { $e }
doc-fetch-usage = használat: .my.doc.<név>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nincs beállítva
doc-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }
path-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }

# ── Súgószöveg — fejlécek ─────────────────────────────────────────────────
help-header-zion = ── zion parancsok ─────────────────────────────────────────────────────────
help-header-messaging = ── üzenetküldés ──────────────────────────────────────────────────────────
help-header-config = ── helyi konfigurációs szintaxis ──────────────────────────────────────
help-header-common = ── általános útvonalak ───────────────────────────────────────────────────
help-header-inbox = ── bejövő üzenetek ──────────────────────────────────────────────────────
help-header-documents = ── dokumentumok ─────────────────────────────────────────────────────────
help-header-i18n = ── nyelv ───────────────────────────── ──────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-szóköz beírása ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ez a szöveg
help-cmd-clear =   .clear                       terminál törlése
help-cmd-panic =   .panic                       végső megoldás — ha bajban van, használja
help-cmd-history =   .history                     parancselőzmények (egymást követő ismétlések összevonva)
help-cmd-logout =   .logout                      kijelentkezés
help-cmd-batch =   .batch                       vázlatdokumentum párhuzamos kiértékelése
help-cmd-batch-sync =   .batch:sync / .batch         vázlatdokumentum soronkénti kiértékelése

help-msg-echo =   @alias                       feloldott DID/DID-URL megjelenítése (nincs üzenetküldés)
help-msg-send =   @alias!msg body / @alias:verb args           üzenet / RPC küldése szereplőnek
help-msg-fragment =   @alias#fragment:verb body  küldés álnévnek explicit DID-töredékkel
help-msg-escape =   \@name                       szó szerinti @name (alias keresés nélkül)


help-config-get =   .path                        levél értékének lekérése vagy részfa listázása
help-config-set =   .path: value                 levél beállítása
help-config-delete =   .path:                       levél vagy részfa törlése
help-config-verb =   .path!verb [args]            helyi ige futtatása

help-my =   .my                          összes személyes konfiguráció megjelenítése
help-aliases =   .my.aliases                  álnevek listázása
help-aliases-set =   .my.aliases.<name>: <did-url>    álnév hozzáadása/frissítése (DID vagy DID-URL)
help-aliases-del =   .my.aliases.<name>:          álnév eltávolítása
help-runtime-discover =   .ma [port]          helyi futtatókörnyezet felderítése és @ma álnév létrehozása
help-runtime-claim =   .ma [port]             futtatókörnyezet igénybevétele a DID-del
help-identity =   .my.identity                 identitáskonfiguráció megjelenítése
help-identity-did =   .my.identity.did             saját DID megjelenítése (csak olvasható)
help-identity-publish =   .my.identity!publish @pub    saját DID közzététele a kiadói szolgáltatáson keresztül
help-identity-export =   .my.identity!export          saját identitáscsomag letöltése
help-config-path =   .config                      összes .config.* bejegyzés megjelenítése

help-inbox =   .my.inbox                    bejövő üzenetek listázása (részfa nézet)
help-inbox-n =   .my.inbox.N                  N. bejegyzés mezőinek megjelenítése
help-inbox-from =   .my.inbox.N.from             feladó DID az N. bejegyzéshez
help-inbox-reply =   .my.inbox.N!reply [body]     válasz küldése (szerkesztőt nyit tartalom nélkül)
help-inbox-open =   .my.inbox.N!open             tartalom megnyitása csak olvasható szerkesztőben
help-inbox-del =   .my.inbox.N:                 N. bejegyzés törlése
help-inbox-delall =   .my.inbox:                   összes bejövő bejegyzés törlése
help-inbox-flush =   .my.inbox!flush              összes bejegyzés kiírása a terminálra
help-inbox-filter =   .my.inbox!filter @who        csak @who bejegyzéseinek megjelenítése
help-inbox-traverse =   .my.inbox.N.sender.<mező>   feladó DID-dokumentum lusta bejárása

help-doc-edit =   .my.doc.<név>!edit           szerkesztő megnyitása mentett tartalommal
help-doc-edit-cid =   .my.doc.<név>!edit /ipfs/<cid>     CID letöltése, megnyitás áttekintésre
help-doc-eval =   .my.doc.<név>!eval           mentett tartalom futtatása soronként
help-doc-publish =   .my.doc.<név>!publish @pub   mentés nyers blobként (minden típus)
help-doc-publish-ipld =   .my.doc.<név>!publish-ipld @pub  YAML mentése strukturált DAG-CBOR IPLD csomópontként
help-doc-fetch =   .my.doc.<név>!fetch /ipfs/<cid>    CID tartalom importálása (futtatás nélkül)
help-doc-cid =   .my.doc.<név>!cid            mentett CID megjelenítése
help-doc-del =   .my.doc.<név>:              dokumentum törlése

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = A .my.i18n az Ön személyazonosságához kötött nyelvi beállításokat tárolja.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               listázza ki az elérhető nyelvkódokat

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = A 間 szoba a 間 identitások közötti tér. A ma segít ezeknek az identitásoknak megtalálni egymást és kommunikálni; amint az identitásod publikálva van, részt vehetsz.
help-ma-command =   .ma [port]                   kapcsolódj a helyi ma runtime-hoz, olvasd be a /status.json-t, és mentsd a .ma.ctx.* értékeket
help-ma-publish =   .my.identity!publish @ma     publikáld a DID dokumentumodat, hogy mások feloldhassák a kulcsaidat és endpointodat
help-ma-security = A legtisztább bizalmi határ a saját ma runtime-od a saját IPFS Desktop/Kubo példányoddal. Egy távoli publisher hasznos lehet, de akkor valaki más szolgáltatására támaszkodsz.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             hogyan lépj be a 間 szobába

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Ha az identitásod ismert, a .enter @ma beenged a 間 térbe. Keress egy világot, lépj be, és onnan vegyél részt.
help-ma-entry-steps = Indítsd el az IPFS Desktopot és a ma-t, majd futtasd a .ma parancsot. Publikálj a .my.identity!publish @ma paranccsal, keress egy világot, és lépj be a .enter @ma paranccsal.
help-ma-entry-command =   .enter @ma                  belépés a 間 térbe az @ma runtime-on keresztül
help-ma-entry-toggle =   .enter                       a szobafókusz be- vagy kikapcsolása; az identitásod aktív marad
help-ma-entry-url =   ?enter=<runtime>             belépés megosztott URL-ből való bejelentkezés után

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Elérhető nyelvek (beállítás: .my.i18n: <code>):
err-lang-not-found = a nyelv nem található: { $lang }

msg-send-failed = küldés sikertelen: { $e }
msg-not-logged-in = nincs bejelentkezve

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML-elemzési hiba: { $e }
yaml-not-mapping = A YAML-nak mappingnek (kulcs: érték pároknak) kell lennie; egyszerű szöveg és skalárok nem tárolhatók DAG-CBOR formátumban
dagcbor-encode-error = DAG-CBOR-kódolási hiba: { $e }
cbor-decode-error = CBOR-dekódolási hiba: { $e }
cbor-json-error = CBOR→JSON konverziós hiba: { $e }
yaml-serialise-error = YAML-sorosítási hiba: { $e }
edit-reply-invalid = Érvénytelen szerkesztési válasz
doc-publish-ipld-error = IPLD-közzététel sikertelen: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Beérkező levelek karbantartás mentési hiba: { $e }
err-config-load = Konfiguráció betöltési hiba: { $e }
err-lang-persist = Nyelv mentési hiba: { $e }
err-history-parse = Előzmények elemzési hiba: { $e }
err-history-load = Előzmények betöltési hiba: { $e }
err-ipfs-reply-decode = IPFS válasz dekódolási hiba: { $e }
err-edit-cbor = CBOR szerkesztési hiba: { $e }
err-popup-blocked = A böngésző blokkolta a felugró ablakot
status-publishing = közzététel

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = hiba
rpc-error-detail = hiba: { $detail }
msg-new-message = ← [{ $from }] új üzenet — { $count } a beérkező levelekben
msg-chat = { $sender } mondja { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } mondja { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } belép a szobába.
room-leave = * { $name } elhagyja a szobát.
room-drop  = * { $name } elejtette { $thing }.
room-take  = * { $name } felvette { $thing }.
err-edit-decode-failed = szerkesztés: dekódolási hiba: { $e }
err-edit-fetch-failed = szerkesztés: betöltési hiba: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nincs aktív munkamenet — a profil nem törölhető
profile-delete-error = a profil törlése sikertelen: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = a profil titkosítva és elküldve az IPFS-re; a DID-dokumentum frissül, amikor megérkezik a CID
profile-publish-done = profil közzétéve — a DID-dokumentum frissítve ma.agent CID-del
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = személyazonossága már közzétett – a profil naprakész
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = bináris tartalom (nem jelenik meg)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (nincs)
profiles-deleted = a(z) { $name } profil törölve
profiles-not-found = a profil nem található: { $name }

# -- Help topics index
help-header-topics = -- témák -- részletekhez írd be: .help/<topic>
help-topic-msg =   .help/msg                    üzenetek
help-topic-ma = .help/ma                     ma-tér, közzététel és bejegyzés
help-topic-path = .help/path                   helyi pont-útvonal nyelvtan
help-topic-my =   .help/my                     személyes config
help-topic-inbox =   .help/inbox                  bejövő
help-topic-doc =   .help/doc                    dokumentumok
help-topic-actor =   .help/actor                  távoli actor
help-topic-zscheme =   .help/zscheme               beágyazott Scheme-kifejezések és dokumentáció
help-unknown-topic =   .help/{ $topic }: ismeretlen téma

# -- Help actor section
help-header-actor = -- távoli actorok
help-actor-echo =   @actor                       feloldott DID megjelenítése
help-actor-text = @actor[#entity]!msg|!say|!emote body         közvetlen/chat/emote üzenet küldése
help-actor-ping = @actor:ping                  elevenség ping
help-actor-entities =   @actor/entities              entitások listázása
help-actor-entities-get = @actor/entities/<n>          entitáscsomópont beszerzése
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entitás szerkesztése
help-actor-entities-del = @actor/entities/<n>:         entitás törlése
help-actor-config-get =   @actor/config/<key>          config érték lekérése
help-actor-config-set =   @actor/config/<key>: val     config érték beállítása
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL szerkesztése
help-actor-fragment =   @actor#entity                küldés pluginnek
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC pluginnek
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  tartsa a 5 válaszokat a munkamenet környezetben
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    zion megnyitása URL-linken keresztül
help-topic-i18n = .help/i18n                   identitásod nyelvi preferenciája
help-header-url = ── URL-paraméterek ──────────────────────────────────────────────────────────────
help-url-intro =   Ossz meg egy linket, amely előre kitöltött címzettel nyitja meg a zion-t:
help-url-msg =   ?msg=<did>                   előre kitölti: @<did>!msg (egyszerű üzenet)
help-url-say =   ?say=<did>                   előre kitölti: @<did>!say (say ige)
help-url-emote =   ?emote=<did>                 előre kitölti: @<did>!emote (emote ige)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             bejelentkezés után lépjen be a futásidejű világba
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   A beviteli mező előre ki van töltve, de nem lett elküldve — nyomj Enter-t a küldéshez.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                azonosságod közzététele a hálózaton
help-header-publish = ── azonosság közzététele ─────────────────────────────────────────────────────
help-publish-intro = A közzététel megtalálhatóvá teszi az azonosságodat a hálózaton. Mások megkereshetik a DID-edet, hogy elérjenek.
help-publish-ma = A közzétételhez szükséges a ma (helyi futtatókörnyezet) telepítése. Összeköti az ego-t az IPFS/IPNS-sel a neveddel.
help-publish-steps = Lépések: futtasd '.ma [port]' a helyi ma megtalálásához, majd '.my.identity!publish @ma'.
help-publish-without = Közzététel nélkül mások nem tudnak elérni — még ha ismerik is a DID-edet, nem tudják feloldani az endpointodat.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = adjon meg profilnevet: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Köteg begyűjtése — írja be a parancsokat, a végén .batch
batch-already-collecting = Már gyűjtött egy köteget – először fejezze be .batch-el
batch-empty = A köteg üres volt – nincs mit futtatni
batch-running = Batch futtatása…
batch-step-timeout = köteglépés időtúllépés

batch-done = Batch kész { $secs }s alatt — { $steps } lépés
batch-done-error = Batch hibákkal fejeződött be { $secs }s alatt — { $steps } lépés
msg-timeout = Az üzenet időtúllépett (nincs válasz 60s alatt)
err-unknown-command = ismeretlen parancs: { $path }
err-read-only-path = { $path } csak olvasható
help-cmd-batch-async =   .batch:async / .batch        vázlatdokumentum párhuzamos kiértékelése


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = A CID { $cid } lekérése sikertelen: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Érvénytelen CID: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Figyelmeztetés: Az IPNS titkos kulcsod elküldésre kerül erre a futtatókörnyezetre az identitás publikálásához. Csak olyan futtatókörnyezetet használj, amelynek teljesen megbízol.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = A zscheme kiértékeli a zion parancsokba ágyazott Scheme-kifejezéseket, és elküldés előtt beilleszti az eredményt a sorba.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    soron belüli példa; ezt küldi: "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             a definíciók megmaradnak az aktuális bejelentkezési munkamenetben
help-zscheme-doc = Dokumentáció: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Helyi IPFS-átjáró (böngészőkivétel szükséges)

tab-config = Beállítások
label-gateway = gateway
