# zion — Magyar
lang-name = Magyar

# ── Bejelentkezési oldal ──────────────────────────────────────────────────
tab-login = bejelentkezés
tab-new-identity = új identitás
tab-import = importálás
label-passphrase = jelmondat
label-username = felhasználónév
label-confirm-passphrase = jelmondat megerősítése
btn-login = bejelentkezés
btn-export = exportálás
btn-generate = generálás
passphrase-warning = Elveszett jelmondat = elveszett identitás. Helyreállítás nem lehetséges.
import-help = Válasszon egy exportált .zion.json fájlt. A csomag titkosítva marad.
status-unlocking = feloldás folyamatban...
status-generating = identitás generálása...
status-reading-file = fájl olvasása...
status-imported = '{ $name }' importálva — lépjen át a Bejelentkezés lapra
error-wrong-passphrase = helytelen jelmondat: { $e }
error-identity-not-found = az identitás '{ $name }' nem található
error-username-required = a felhasználónév megadása kötelező
error-passphrase-required = a jelmondat megadása kötelező
error-passphrases-no-match = a jelmondatok nem egyeznek

# ── Terminál rendszerüzenetek ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — bejelentkezve mint { $username }
msg-type-help = Írja be a .help parancsot a parancsok listájához.
msg-connecting = csatlakozás az iroh-hoz...
msg-iroh-ready = iroh végpont kész
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ letiltva [{ $cap }]: { $from }
msg-focus-cleared = fókusz törölve
msg-focusing = fókuszálás: { $did } mint { $prompt }
msg-set = { $path }: { $value }
msg-deleted = törölve: { $path } ({ $count } bejegyzés)
msg-read-only = { $path } csak olvasható
msg-subtree-set = { $path } részfa; a beállítás elutasítva
msg-ancestor-leaf = { $path } egyik őse levél; az árnyékolás elutasítva
msg-key-not-found = kulcs nem található: { $path }
msg-no-match = nincs találat
msg-link-not-connected = hivatkozás lekérési hiba: nincs kapcsolat
msg-link-fetch-error = hivatkozás lekérési hiba: { $e }
msg-link-key-not-found = `{ $key }` kulcs nem található a hivatkozott dokumentumban

# ── Alias érvényesítés ────────────────────────────────────────────────────
err-alias-name-empty = az álnév neve nem lehet üres
err-alias-has-fragment = az álnév neve nem tartalmazhat '#' karaktert
err-alias-value-fragment = az álnév értékének tiszta did:ma:<ipns> kell lennie (töredék nélkül)
err-alias-value-path = az álnév értékének tiszta did:ma:<ipns> kell lennie (útvonal nélkül)
err-alias-not-did = az álnév értékének did:ma:-vel kell kezdődnie
err-unknown-alias = ismeretlen álnév: @{ $name }
err-bare-did = tiszta did:ma:<ipns> várt (töredék vagy útvonal nélkül), kapott: { $did }

# ── Szerkesztő ────────────────────────────────────────────────────────────
btn-save = Mentés
btn-eval = Futtatás
btn-cancel = Mégse
btn-close = Bezárás
btn-reply = Válasz
btn-publish = Közzététel
btn-publish-ipld = Közzététel IPLD
msg-reply-sent = válasz elküldve
msg-reply-failed = a válasz küldése sikertelen: { $e }
msg-entity-publish-sent = { $name } entitás: közzététel elküldve
msg-entity-publish-failed = az entitás közzététele sikertelen: { $e }
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

# ── Igék — futtatókörnyezet ───────────────────────────────────────────────
discover-fetch-failed = felderítés sikertelen a következő helyen: { $url }: { $e }
discover-json-error = felderítés sikertelen: érvénytelen JSON a következőből: { $url }: { $e }
discover-missing-did = felderítés sikertelen: a status.json hiányzó kötelező `did` mezőt tartalmaz
discover-invalid-did = felderítés sikertelen: a `did` did:ma:-vel kell kezdődjön, kapott: `{ $did }`
discover-no-endpoint = felderítési figyelmeztetés: `endpoint_id` hiányzik a status.json-ból; csak DID mentve
discover-success = ma felderítve a következő helyen: { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   @ma álnév létrehozva — tegye közzé: .my.identity:publish @ma
claim-success = Futtatókörnyezet igénybe véve: { $did }
claim-conflict = A futtatókörnyezetet már egy másik identitás igénybe vette
claim-http-failed = igénybevétel sikertelen: HTTP { $status }
claim-error = igénybevétel sikertelen: { $e }
claim-no-session = nincs bejelentkezés; a futtatókörnyezet igénybevételéhez először jelentkezzen be
runtime-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }

# ── Igék — hozzáférés-vezérlés ────────────────────────────────────────────
acl-reset = .my.acl visszaállítva (teljesen nyitott)
acl-persist-error = mentési hiba: { $e }
acl-no-verb = nincs `{ $verb }` ige a .my.acl-hez

# ── Igék — identitás ──────────────────────────────────────────────────────
publish-usage = használat: .my.identity:publish <did-vagy-álnév>

# ── Igék — dokumentumok ───────────────────────────────────────────────────
doc-content-empty = { $path }.content üres
doc-save-first = { $path }.content üres — először mentse el
doc-missing-name = hiányzó dokumentumnév
doc-publish-usage = használat: .my.doc.<név>:publish <kiadó>
doc-publish-ipld-usage = használat: .my.doc.<név>:publish-ipld <kiadó>
doc-publish-failed = közzététel { $path }: { $e }
doc-publish-ipld-failed = IPLD közzététel { $path }: { $e }
doc-store-sent = tárolási kérelem elküldve ({ $id }) → { $publisher }; a CID RPC válaszban érkezik
doc-ipld-store-sent = IPLD tárolási kérelem elküldve ({ $id }) → { $publisher }; a CID RPC válaszban érkezik
doc-fetch-done = { $cid } letöltve → { $path }.content (nem futtatva)
doc-fetch-failed = letöltés { $cid }: { $e }
doc-fetch-usage = használat: .my.doc.<név>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid nincs beállítva
doc-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }
path-no-verb = nincs `{ $verb }` ige a következőhöz: { $path }

# ── Súgószöveg — fejlécek ─────────────────────────────────────────────────
help-header-zion = ── zion parancsok ─────────────────────────────────────────────────────────
help-header-messaging = ── üzenetküldés ──────────────────────────────────────────────────────────
help-header-focus = ── fókusz mód ────────────────────────────────────────────────────────────
help-header-config = ── helyi konfigurációs szintaxis ──────────────────────────────────────
help-header-common = ── általános útvonalak ───────────────────────────────────────────────────
help-header-inbox = ── bejövő üzenetek ──────────────────────────────────────────────────────
help-header-documents = ── dokumentumok ─────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ez a szöveg
help-cmd-clear =   .clear                       terminál törlése
help-cmd-panic =   .panic                       végső megoldás — ha bajban van, használja
help-cmd-logout =   .logout                      kijelentkezés

help-msg-echo =   @alias                       feloldott DID megjelenítése (nem küld üzenetet)
help-msg-send =   @alias[:verb] body           üzenet / RPC küldése szereplőnek
help-msg-fragment =   @alias#fragment[:verb] body  küldés álnévnek explicit DID-töredékkel
help-msg-escape =   \@name                       szó szerinti @name (alias keresés nélkül)

help-focus-set =   .use @alias [as @name]       fókuszálás szereplőre (módosítja a promptot)
help-focus-clear =   .use                         fókusz törlése

help-config-get =   .path                        levél értékének lekérése vagy részfa listázása
help-config-filter =   .path value                  keresési szűrő (szűrés érték szerint)
help-config-set =   .path: value                 levél beállítása
help-config-delete =   .path:                       levél vagy részfa törlése
help-config-verb =   .path:verb [args]            helyi ige futtatása

help-my =   .my                          összes személyes konfiguráció megjelenítése
help-aliases =   .my.aliases                  álnevek listázása
help-aliases-set =   .my.aliases.<name>: <did>    álnév hozzáadása/frissítése (tiszta DID, #töredék nélkül)
help-aliases-del =   .my.aliases.<name>:          álnév eltávolítása
help-runtime-discover =   .my.ma:discover          helyi futtatókörnyezet felderítése és @ma álnév létrehozása
help-runtime-claim =   .my.ma:claim             futtatókörnyezet igénybevétele a DID-del
help-identity =   .my.identity                 identitáskonfiguráció megjelenítése
help-identity-did =   .my.identity.did             saját DID megjelenítése (csak olvasható)
help-identity-publish =   .my.identity:publish @pub    saját DID közzététele a kiadói szolgáltatáson keresztül
help-config-path =   .config                      összes .config.* bejegyzés megjelenítése

help-inbox =   .my.inbox                    bejövő üzenetek listázása (részfa nézet)
help-inbox-n =   .my.inbox.N                  N. bejegyzés mezőinek megjelenítése
help-inbox-from =   .my.inbox.N.from             feladó DID az N. bejegyzéshez
help-inbox-reply =   .my.inbox.N:reply [body]     válasz küldése (szerkesztőt nyit tartalom nélkül)
help-inbox-open =   .my.inbox.N:open             tartalom megnyitása csak olvasható szerkesztőben
help-inbox-del =   .my.inbox.N:                 N. bejegyzés törlése
help-inbox-delall =   .my.inbox:                   összes bejövő bejegyzés törlése
help-inbox-flush =   .my.inbox:flush              összes bejegyzés kiírása a terminálra
help-inbox-traverse =   .my.inbox.N.sender.<mező>   feladó DID-dokumentum lusta bejárása

help-doc-edit =   .my.doc.<név>:edit           szerkesztő megnyitása mentett tartalommal
help-doc-edit-cid =   .my.doc.<név>:edit <cid>     CID letöltése, megnyitás áttekintésre
help-doc-eval =   .my.doc.<név>:eval           mentett tartalom futtatása soronként
help-doc-publish =   .my.doc.<név>:publish @pub   mentés nyers blobként (minden típus)
help-doc-publish-ipld =   .my.doc.<név>:publish-ipld @pub  YAML mentése strukturált DAG-CBOR IPLD csomópontként
help-doc-fetch =   .my.doc.<név>:fetch <cid>    CID tartalom importálása (futtatás nélkül)
help-doc-cid =   .my.doc.<név>:cid            mentett CID megjelenítése
help-doc-del =   .my.doc.<név>:              dokumentum törlése

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
yaml-serialize-error = YAML-sorosítási hiba: { $e }
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
err-edit-decode-failed = szerkesztés: dekódolási hiba: { $e }
err-edit-fetch-failed = szerkesztés: betöltési hiba: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = nincs aktív munkamenet — a profil nem törölhető
profile-delete-error = a profil törlése sikertelen: { $e }
profile-no-verb = .my.profile: ismeretlen parancs: { $verb }
