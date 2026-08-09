# zion — Ελληνικά
lang-name = Ελληνικά
label-nick = ψευδώνυμο
new-identity-nick-help = Διαλέξτε ένα ψευδώνυμο για το 間-space. Είναι μόνο ψευδώνυμο και μπορεί να αλλάξει οποτεδήποτε.
error-nick-required = απαιτείται ψευδώνυμο
error-nick-invalid = το ψευδώνυμο δεν πρέπει να περιέχει κενά ή @

# ── Σελίδα σύνδεσης ───────────────────────────────────────────────────────
tab-login = σύνδεση
tab-new-identity = νέα ταυτότητα
tab-import-profile = εισαγωγή προφίλ
label-passphrase = φράση πρόσβασης
label-username = όνομα χρήστη
label-confirm-passphrase = επιβεβαίωση φράσης πρόσβασης
label-did = DID
label-profile-cid = CID προφίλ
label-or-file = ή αρχείο
btn-login = σύνδεση
btn-export = εξαγωγή
btn-generate = δημιουργία
btn-new-endpoint = νέο σημείο σύνδεσης
btn-import-profile = εισαγωγή προφίλ
btn-show-qr = εμφάνιση QR
btn-scan-qr = σάρωση QR
qr-scan-hint = Στρέψτε την κάμερα σε έναν κωδικό QR προφίλ zion.
qr-error-camera = η κάμερα δεν είναι διαθέσιμη: { $e }
qr-error-too-large = το προφίλ είναι πολύ μεγάλο για κωδικό QR
passphrase-warning = Χαμένη φράση πρόσβασης = χαμένη ταυτότητα. Η ανάκτηση δεν είναι δυνατή.
import-profile-help = Εισαγάγετε ένα προφίλ μέσω CID ή αρχείου. Χρειάζεστε την ίδια φράση πρόσβασης που χρησιμοποιήθηκε κατά τη δημοσίευση.
import-profile-detected-user = Το προφίλ ανήκει στον/στην: { $name }
status-unlocking = ξεκλείδωμα...
status-generating = δημιουργία ταυτότητας...
status-reading-file = ανάγνωση αρχείου...
status-fetching-profile = ανάκτηση προφίλ από IPFS...
status-imported = το '{ $name }' εισήχθη — μεταβείτε στην καρτέλα Σύνδεση
status-importing-profile = εισαγωγή προφίλ...
profile-import-done = το προφίλ εισήχθη για τον/την '{ $name }' — { $n } κλειδιά φορτώθηκαν
error-wrong-passphrase = λανθασμένη φράση πρόσβασης: { $e }
error-identity-not-found = η ταυτότητα '{ $name }' δεν βρέθηκε
error-username-required = το όνομα χρήστη είναι υποχρεωτικό
error-passphrase-required = η φράση πρόσβασης είναι υποχρεωτική
error-passphrases-no-match = οι φράσεις πρόσβασης δεν ταιριάζουν
error-profile-source-required = δώστε CID ή ανεβάστε αρχείο
error-did-required = εισαγάγετε το DID σας
error-profile-fetch = αδυναμία ανάκτησης προφίλ: { $e }
error-profile-no-username = το προφίλ δεν περιέχει όνομα χρήστη
error-profile-no-identity = η ταυτότητα '{ $name }' δεν βρέθηκε — εισαγάγετε πρώτα την ταυτότητα

# ── Μηνύματα συστήματος τερματικού ───────────────────────────────────────
msg-logged-in = zion v{ $version } — συνδεδεμένοι ως { $username }
msg-type-help = Πληκτρολογήστε .help για λίστα εντολών.
msg-getting-started = Δοκιμάστε: say Hello world, look, .help ή help.
msg-connecting = σύνδεση στο iroh...
msg-iroh-ready = τελικό σημείο iroh έτοιμο
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID δημοσιεύτηκε μέσω τοπικού 間 ({ $url })
msg-identity-publication-propagating = Η δημοσίευση της ταυτότητας διαδίδεται ακόμη· η είσοδος καθυστερεί: { $e }
msg-identity-first-publish = Δημοσιεύεται η ταυτότητα για πρώτη φορά. Αυτό μπορεί να διαρκέσει έως { $seconds } δευτερόλεπτα.
msg-ma-connecting-matrix = προσπαθούμε να σε συνδέσουμε στο 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = το τοπικό 間 διεκδικήθηκε
msg-local-ma-already-claimed = το τοπικό 間 έχει ήδη διεκδικηθεί
msg-local-ma-claim-failed = αποτυχία διεκδίκησης του τοπικού 間
msg-identity-not-published = Η ταυτότητα δεν βρέθηκε διαδικτυακά — αν έχεις εγκατεστημένο το 間 τοπικά, εκτέλεσε '.ma [port]' και μετά '.my.identity!publish @ma'. Πληκτρολόγησε '.help/publish' για λεπτομέρειες.
msg-blocked = ⊗ αποκλεισμένο [{ $cap }]: { $from }
msg-focus-cleared = η εστίαση διαγράφηκε
msg-left = left
msg-focusing = εστίαση σε { $did } ως { $prompt }
msg-set = { $path }: { $value }
msg-deleted = διαγράφηκε { $path } ({ $count } καταχωρήσεις)
msg-read-only = { $path } είναι μόνο για ανάγνωση
msg-subtree-set = { $path } είναι υποδέντρο· η ρύθμιση απορρίφθηκε
msg-ancestor-leaf = ένας πρόγονος του { $path } είναι φύλλο· η σκίαση απορρίφθηκε
msg-key-not-found = το κλειδί δεν βρέθηκε: { $path }
msg-link-not-connected = σφάλμα ανάκτησης συνδέσμου: δεν υπάρχει σύνδεση
msg-link-fetch-error = σφάλμα ανάκτησης συνδέσμου: { $e }
msg-link-key-not-found = το κλειδί `{ $key }` δεν βρέθηκε στο συνδεδεμένο έγγραφο

# ── Επαλήθευση ψευδωνύμων ─────────────────────────────────────────────────
err-alias-name-empty = το όνομα ψευδωνύμου δεν μπορεί να είναι κενό
err-alias-has-dot = το όνομα ψευδωνύμου δεν μπορεί να περιέχει '.'
err-alias-has-fragment = το όνομα ψευδωνύμου δεν μπορεί να περιέχει '#'
err-alias-value-fragment = η τιμή ψευδωνύμου μπορεί να περιέχει το πολύ ένα μη κενό τμήμα DID-URL
err-alias-value-path = η τιμή ψευδωνύμου πρέπει να είναι DID did:ma:<ipns> ή DID-URL (χωρίς διαδρομή)
err-alias-not-did = η τιμή ψευδωνύμου πρέπει να αρχίζει με did:ma:
err-unknown-alias = άγνωστο ψευδώνυμο: @{ $name }
err-bare-did = αναμένεται καθαρό did:ma:<ipns> (χωρίς τμήμα ή διαδρομή), ελήφθη { $did }

# ── Επεξεργαστής ──────────────────────────────────────────────────────────
btn-save = Αποθήκευση
btn-eval = Εκτέλεση
btn-cancel = Ακύρωση
msg-jobs-cancelled = οι εργασίες ακυρώθηκαν
btn-close = Κλείσιμο
btn-reply = Απάντηση
btn-publish = Δημοσίευση
btn-publish-ipld = Δημοσίευση IPLD
msg-reply-sent = η απάντηση στάλθηκε
msg-reply-failed = αποστολή απάντησης απέτυχε: { $e }
msg-entity-publish-sent = οντότητα { $name }: δημοσίευση εστάλη
msg-entity-publish-failed = δημοσίευση οντότητας απέτυχε: { $e }
msg-kind-publish-failed = αποτυχία δημοσίευσης τύπου: { $e }
msg-field-publish-sent = οντότητα { $name }.{ $field }: δημοσίευση εστάλη
msg-field-publish-failed = δημοσίευση πεδίου απέτυχε: { $e }
msg-acl-publish-sent = ACL περιβάλλοντος εκτέλεσης: δημοσίευση εστάλη
msg-crud-edit-publish-sent = { $path }: δημοσίευση εστάλη
msg-acl-publish-failed = δημοσίευση ACL περιβάλλοντος εκτέλεσης απέτυχε: { $e }
msg-yaml-error = σφάλμα YAML: { $e }
msg-editor-saved = { $path }:αποθήκευση
msg-fetch-review = { $cid } ανακτήθηκε — ελέγξτε πριν την εκτέλεση
msg-fetch-failed = ανάκτηση { $cid }: { $e }

# ── Ρήματα — εισερχόμενα ─────────────────────────────────────────────────
inbox-empty = τα εισερχόμενα είναι κενά
inbox-entry-not-found = η καταχώρηση { $n } των εισερχομένων δεν βρέθηκε
inbox-no-message-id = η καταχώρηση { $n } των εισερχομένων δεν έχει message_id
inbox-no-verb = δεν υπάρχει ρήμα `{ $verb }` για την καταχώρηση { $n } των εισερχομένων
inbox-filter-no-arg = το φίλτρο χρειάζεται DID ή ψευδώνυμο
inbox-filter-empty = δεν υπάρχουν μηνύματα από { $did }

# ── Ρήματα — περιβάλλον εκτέλεσης ───────────────────────────────────────
discover-fetch-failed = η ανακάλυψη απέτυχε στο { $url }: { $e }
discover-json-error = η ανακάλυψη απέτυχε: μη έγκυρο JSON από { $url }: { $e }
discover-missing-did = η ανακάλυψη απέτυχε: το status.json δεν έχει το υποχρεωτικό πεδίο `did`
discover-invalid-did = η ανακάλυψη απέτυχε: αναμένεται `did` που αρχίζει με did:ma:, ελήφθη `{ $did }`
discover-no-endpoint = προειδοποίηση ανακάλυψης: το `endpoint_id` απουσιάζει στο status.json· αποθηκεύτηκε μόνο το DID
discover-hint-endpoint-not-found = Υπόδειξη: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Υπόδειξη: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Υπόδειξη: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Υπόδειξη: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = το 間 ανακαλύφθηκε στο { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   ψευδώνυμο @ma δημιουργήθηκε — εκτέλεσε '.my.identity!publish @ma' για να δημοσιεύσεις την ταυτότητά σου.
claim-success = Το περιβάλλον εκτέλεσης διεκδικήθηκε για { $did }
claim-conflict = Το περιβάλλον εκτέλεσης έχει ήδη διεκδικηθεί από άλλη ταυτότητα
claim-already-owned = Το Runtime έχει ήδη διεκδικηθεί από αυτήν την ταυτότητα
claim-http-failed = η διεκδίκηση απέτυχε: HTTP { $status }
claim-error = η διεκδίκηση απέτυχε: { $e }
claim-no-session = δεν έχετε συνδεθεί· συνδεθείτε πρώτα για να διεκδικήσετε το περιβάλλον εκτέλεσης
runtime-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }

# ── Ρήματα — έλεγχος πρόσβασης ───────────────────────────────────────────
acl-reset = .my.acl επαναφέρθηκε (πλήρως ανοικτό)
acl-persist-error = σφάλμα αποθήκευσης: { $e }
acl-no-verb = δεν υπάρχει ρήμα `{ $verb }` για .my.acl

# ── Ρήματα — ταυτότητα ────────────────────────────────────────────────────
publish-usage = χρήση: .my.identity!publish <did-ή-ψευδώνυμο>
identity-exported = Το πακέτο λήφθηκε ως { $filename }
identity-export-failed = Η εξαγωγή απέτυχε: { $e }

# ── Ρήματα — έγγραφα ─────────────────────────────────────────────────────
doc-content-empty = { $path } είναι κενό
doc-save-first = { $path } είναι κενό — αποθηκεύστε πρώτα
doc-missing-name = λείπει το όνομα εγγράφου
doc-publish-usage = χρήση: .my.doc.<όνομα>!publish <εκδότης>
doc-publish-ipld-usage = χρήση: .my.doc.<όνομα>!publish-ipld <εκδότης>
doc-publish-failed = δημοσίευση { $path }: { $e }
doc-publish-ipld-failed = δημοσίευση IPLD { $path }: { $e }
doc-publish-error-detail = η δημοσίευση απέτυχε [{ $code }]: { $err }
doc-publish-error-hint = Υπόδειξη: { $hint }
doc-publish-hint-session = συνδεθείτε ξανά ώστε το ego να έχει πρόσβαση στα κλειδιά ταυτότητάς σας
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = βεβαιωθείτε ότι το έγγραφο DID του εκδότη είναι δημοσιευμένο και περιέχει ένα προσβάσιμο τελικό σημείο
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = Ο χρόνος εκτέλεσης/πρόσθετο απέρριψε το αίτημα. επιθεωρήστε τον λόγο και δοκιμάστε ξανά μετά τη διόρθωση της οντότητας/χρόνου εκτέλεσης
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = επιθεωρήστε τα αρχεία καταγραφής χρόνου εκτέλεσης για λεπτομερή αιτία και δοκιμάστε ξανά
doc-store-sent = αίτημα αποθήκευσης εστάλη ({ $id }) → { $publisher }; το CID θα φτάσει μέσω απάντησης RPC
doc-ipld-store-sent = αίτημα αποθήκευσης IPLD εστάλη ({ $id }) → { $publisher }; το CID θα φτάσει μέσω απάντησης RPC
doc-fetch-done = { $cid } ανακτήθηκε → { $path } (δεν εκτελέστηκε)
doc-fetch-failed = ανάκτηση { $cid }: { $e }
doc-fetch-usage = χρήση: .my.doc.<όνομα>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid δεν έχει οριστεί
doc-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }
path-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }

# ── Κείμενο βοήθειας — κεφαλίδες ─────────────────────────────────────────
help-header-zion = ── εντολές zion ───────────────────────────────────────────────────────────
help-header-messaging = ── ανταλλαγή μηνυμάτων ───────────────────────────────────────────────────
help-header-config = ── τοπική γραμματική διαμόρφωσης ────────────────────────────────────
help-header-common = ── συνήθεις διαδρομές ────────────────────────────────────────────────────
help-header-inbox = ── εισερχόμενα ───────────────────────────────────────────────────────────
help-header-documents = ── έγγραφα ──────────────────────────────────────────────────────────────
help-header-i18n = ── γλώσσα ────────────────────── ─────────────────────-
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── είσοδος στο 間-space ─────────────────────── ──────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        αυτό το κείμενο
help-cmd-clear =   .clear                       εκκαθάριση τερματικού
help-cmd-panic =   .panic                       τελευταία λύση — χρησιμοποιήστε αν αντιμετωπίζετε πρόβλημα
help-cmd-history =   .history [n]                 ιστορικό εντολών (διαδοχικά διπλότυπα ενοποιήθηκαν); το προαιρετικό n εμφανίζει μόνο τις τελευταίες n γραμμές
help-cmd-logout =   .logout                      αποσύνδεση
help-cmd-batch =   .batch                       εκτέλεση πρόχειρου εγγράφου παράλληλα
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         εκτέλεση πρόχειρου εγγράφου γραμμή-γραμμή

help-msg-echo =   @alias                       εμφάνιση επιλυμένου DID/DID-URL (δεν αποστέλλεται μήνυμα)
help-msg-send =   @alias!msg body / @alias:verb args           αποστολή μηνύματος / RPC σε ηθοποιό
help-msg-fragment =   @alias#fragment:verb body  αποστολή σε ψευδώνυμο με ρητό τμήμα DID
help-msg-escape =   \@name                       κυριολεκτικό @name (χωρίς αναζήτηση ψευδωνύμου)


help-config-get =   .path                        λήψη τιμής φύλλου ή καταγραφή υποδέντρου
help-config-filter =   .path [όνομα]                κατάλογος ονομάτων θυγατρικών κλειδιών που περιέχουν όνομα
help-config-full =   .path. [όνομα]               κατάλογος πλήρων τιμών υποδέντρου που περιέχουν όνομα
help-config-set =   .path: value                 ρύθμιση φύλλου
help-config-delete =   .path:                       διαγραφή φύλλου ή υποδέντρου
help-config-verb =   .path!verb [args]            εκτέλεση τοπικού ρήματος

help-my =   .my                          εμφάνιση όλης της προσωπικής διαμόρφωσης
help-aliases =   .my.aliases                  καταγραφή ψευδωνύμων
help-aliases-set =   .my.aliases.<name>: <did-url>    προσθήκη/ενημέρωση ψευδωνύμου (DID ή DID-URL)
help-aliases-del =   .my.aliases.<name>:          αφαίρεση ψευδωνύμου
help-runtime-discover =   .ma [port]          ανακάλυψη τοπικού περιβάλλοντος εκτέλεσης και δημιουργία ψευδωνύμου @ma
help-runtime-claim =   .ma [port]             διεκδίκηση περιβάλλοντος εκτέλεσης με το DID σας
help-identity =   .my.identity                 εμφάνιση διαμόρφωσης ταυτότητας
help-identity-did =   .my.identity.did             εμφάνιση ιδίου DID (μόνο ανάγνωση)
help-identity-publish =   .my.identity!publish @pub    δημοσίευση ιδίου DID μέσω υπηρεσίας εκδότη
help-identity-export =   .my.identity!export          λήψη δικού σου πακέτου ταυτότητας
help-config-path =   .config                      εμφάνιση όλων των καταχωρήσεων .config.*

help-inbox =   .my.inbox                    καταγραφή εισερχομένων (προβολή υποδέντρου)
help-inbox-n =   .my.inbox.N                  εμφάνιση πεδίων καταχώρησης N
help-inbox-from =   .my.inbox.N.from             DID αποστολέα για καταχώρηση N
help-inbox-reply =   .my.inbox.N!reply [body]     αποστολή απάντησης (ανοίγει επεξεργαστή χωρίς σώμα)
help-inbox-open =   .my.inbox.N!open             άνοιγμα περιεχομένου σε επεξεργαστή μόνο ανάγνωσης
help-inbox-del =   .my.inbox.N:                 διαγραφή καταχώρησης N
help-inbox-delall =   .my.inbox:                   διαγραφή όλων των καταχωρήσεων εισερχομένων
help-inbox-flush =   .my.inbox!flush              εκτύπωση όλων των καταχωρήσεων στο τερματικό
help-inbox-filter =   .my.inbox!filter @who        εμφάνιση μόνο εγγραφών από @who
help-inbox-traverse =   .my.inbox.N.sender.<πεδίο>  τεμπέλικη διάσχιση εγγράφου DID αποστολέα

help-doc-edit =   .my.doc.<όνομα>!edit           άνοιγμα επεξεργαστή με αποθηκευμένο περιεχόμενο
help-doc-edit-cid =   .my.doc.<όνομα>!edit /ipfs/<cid>     ανάκτηση CID, άνοιγμα για αναθεώρηση
help-doc-eval =   .my.doc.<όνομα>!eval           εκτέλεση αποθηκευμένου περιεχομένου γραμμή-γραμμή
help-doc-publish =   .my.doc.<όνομα>!publish @pub   αποθήκευση ως ακατέργαστο blob (όλοι οι τύποι)
help-doc-publish-ipld =   .my.doc.<όνομα>!publish-ipld @pub  αποθήκευση YAML ως δομημένο κόμβο DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<όνομα>!fetch /ipfs/<cid>    εισαγωγή περιεχομένου CID (χωρίς εκτέλεση)
help-doc-cid =   .my.doc.<όνομα>!cid            εμφάνιση αποθηκευμένου CID
help-doc-del =   .my.doc.<όνομα>:              διαγραφή εγγράφου

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = Το .my.i18n αποθηκεύει την προτίμηση γλώσσας που συνδέεται με την ταυτότητά σας.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               λίστα των διαθέσιμων κωδικών γλώσσας

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Το δωμάτιο 間 είναι ο χώρος ανάμεσα στις ταυτότητες 間. Το ma επιτρέπει σε αυτές τις ταυτότητες να βρίσκουν η μία την άλλη και να επικοινωνούν· μόλις δημοσιευτεί η ταυτότητά σου, μπορείς να συμμετέχεις.
help-ma-command =   .ma [port]                   συνδέσου στο τοπικό 間 runtime, διάβασε /status.json και αποθήκευσε .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     δημοσίευσε το DID έγγραφό σου ώστε άλλοι να βρίσκουν τα κλειδιά και το endpoint σου
help-ma-security = Το καθαρότερο όριο εμπιστοσύνης είναι το δικό σου 間 runtime με το δικό σου IPFS Desktop/Kubo. Ένας απομακρυσμένος publisher μπορεί να είναι χρήσιμος, αλλά τότε βασίζεσαι στην υπηρεσία κάποιου άλλου.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             πώς να μπεις στο δωμάτιο 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Όταν η ταυτότητά σου είναι γνωστή, το .enter @ma σε αφήνει να μπεις στο 間. Βρες έναν κόσμο, μπες σε αυτόν και συμμετείχε από εκεί.
help-ma-entry-steps = Ξεκίνα το IPFS Desktop και το ma, έπειτα τρέξε .ma. Δημοσίευσε με .my.identity!publish @ma, βρες έναν κόσμο και μπες με .enter @ma.
help-ma-entry-command =   .enter @ma                  μπες στο 間 μέσω του @ma runtime
help-ma-entry-toggle =   .enter                       ενεργοποίησε ή απενεργοποίησε την εστίαση στο δωμάτιο· η ταυτότητά σου μένει ενεργή
help-ma-entry-url =   ?enter=<runtime>             μπες μετά τη σύνδεση από κοινόχρηστο URL

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Διαθέσιμες γλώσσες (ορισμός με .my.i18n: <code>):
err-lang-not-found = η γλώσσα δεν βρέθηκε: { $lang }

msg-send-failed = αποτυχία αποστολής: { $e }
msg-not-logged-in = δεν έχετε συνδεθεί

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Σφάλμα ανάλυσης YAML: { $e }
yaml-not-mapping = Το YAML πρέπει να είναι mapping (ζεύγη κλειδιού: τιμής); απλό κείμενο και βαθμωτά δεν μπορούν να αποθηκευτούν ως DAG-CBOR
dagcbor-encode-error = Σφάλμα κωδικοποίησης DAG-CBOR: { $e }
cbor-decode-error = Σφάλμα αποκωδικοποίησης CBOR: { $e }
cbor-json-error = Σφάλμα CBOR σε JSON: { $e }
yaml-serialise-error = Σφάλμα σειριοποίησης YAML: { $e }
edit-reply-invalid = Μη έγκυρη απάντηση επεξεργασίας
doc-publish-ipld-error = Αποτυχία δημοσίευσης IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Σφάλμα αποθήκευσης κλαδέματος εισερχόμενης: { $e }
err-config-load = Σφάλμα φόρτωσης ρυθμίσεων: { $e }
err-lang-persist = Σφάλμα αποθήκευσης γλώσσας: { $e }
err-history-parse = Σφάλμα ανάλυσης ιστορικού: { $e }
err-history-load = Σφάλμα φόρτωσης ιστορικού: { $e }
err-history-count-invalid = ο αριθμός ιστορικού πρέπει να είναι θετικός ακέραιος
err-ipfs-reply-decode = Αποτυχία αποκωδικοποίησης απόκρισης IPFS: { $e }
err-edit-cbor = Σφάλμα επεξεργασίας CBOR: { $e }
err-popup-blocked = Το αναδυόμενο παράθυρο αποκλείστηκε από τον περιηγητή
status-publishing = δημοσίευση

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = σφάλμα
rpc-error-detail = σφάλμα: { $detail }
msg-new-message = ← [{ $from }] νέο μήνυμα — { $count } στα εισερχόμενα
msg-chat = { $sender } λέει { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } λέει { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } μπαίνει στο δωμάτιο.
room-leave = * { $name } φεύγει από το δωμάτιο.
room-drop  = * { $name } ρίχνει { $thing }.
room-take  = * { $name } μαζεύει { $thing }.
err-edit-decode-failed = αποτυχία αποκωδικοποίησης επεξεργασίας: { $e }
err-edit-fetch-failed = αποτυχία ανάκτησης επεξεργασίας: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = δεν υπάρχει ενεργή συνεδρία — δεν είναι δυνατή η διαγραφή του προφίλ
profile-delete-error = η διαγραφή του προφίλ απέτυχε: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = το προφίλ κρυπτογραφήθηκε και στάλθηκε στο IPFS· το έγγραφο DID θα ενημερωθεί όταν φτάσει το CID
profile-publish-done = το προφίλ δημοσιεύτηκε — το έγγραφο DID ενημερώθηκε με ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = Η ταυτότητα έχει ήδη δημοσιευτεί — το προφίλ είναι ενημερωμένο
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = δυαδικό περιεχόμενο (δεν εμφανίζεται)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (κανένα)
profiles-deleted = το προφίλ { $name } διαγράφηκε
profiles-not-found = το προφίλ δεν βρέθηκε: { $name }

# -- Help topics index
help-header-topics = -- θέματα -- πληκτρολογήστε .help/<topic> για λεπτομέρειες
help-topic-msg =   .help/msg                    μηνύματα
help-topic-ma = .help/ma                     間-χώρος, δημοσίευση και είσοδος
help-topic-path = .help/path                   τοπική γραμματική με τελείες
help-topic-my =   .help/my                     προσωπική config
help-topic-inbox =   .help/inbox                  εισερχόμενα
help-topic-doc =   .help/doc                    έγγραφα
help-topic-actor =   .help/actor                  απομακρυσμένος actor
help-topic-zscheme =   .help/zscheme               ενσωματωμένες εκφράσεις Scheme και τεκμηρίωση
help-unknown-topic =   .help/{ $topic }: άγνωστο θέμα

# -- Help actor section
help-header-actor = -- απομακρυσμένοι actors
help-actor-echo =   @actor                       εμφάνιση επιλυμένου DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         αποστολή άμεσου μηνύματος/συνομιλίας/συναγερμού
help-actor-ping = @actor:ping                  ping ζωντάνιας
help-actor-entities =   @actor/entities              λίστα entities
help-actor-entities-get = @actor/entities/<n>          λήψη κόμβου οντότητας
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     επεξεργασία entity
help-actor-entities-del = @actor/entities/<n>:         διαγραφή οντότητας
help-actor-config-get =   @actor/config/<key>          λήψη τιμής config
help-actor-config-set =   @actor/config/<key>: val     ορισμός τιμής config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              επεξεργασία ACL
help-actor-fragment =   @actor#entity                αποστολή στο plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC στο plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  κρατήστε 5 απαντήσεις στο περιβάλλον περιόδου λειτουργίας
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    άνοιγμα του zion μέσω συνδέσμου URL
help-topic-i18n = .help/i18n                   γλωσσική προτίμηση για την ταυτότητά σας
help-header-url = ── παράμετροι URL ───────────────────────────────────────────────────────────────
help-url-intro =   Μοιράσου έναν σύνδεσμο που ανοίγει το zion με προσυμπληρωμένο παραλήπτη:
help-url-msg =   ?msg=<did>                   προσυμπληρώνει: @<did>!msg (απλό μήνυμα)
help-url-say =   ?say=<did>                   προσυμπληρώνει: @<did>!say (ρήμα say)
help-url-emote =   ?emote=<did>                 προσυμπληρώνει: @<did>!emote (ρήμα emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             μπείτε στον κόσμο του χρόνου εκτέλεσης μετά τη σύνδεση
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Η είσοδος είναι προσυμπληρωμένη αλλά δεν έχει σταλεί — πάτα Enter για αποστολή.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                δημοσίευση ταυτότητας στο δίκτυο
help-header-publish = ── δημοσίευση ταυτότητας ────────────────────────────────────────────────────
help-publish-intro = Η δημοσίευση κάνει την ταυτότητά σου εντοπίσιμη στο δίκτυο. Άλλοι μπορούν να αναζητήσουν το DID σου για να σε βρουν.
help-publish-ma = Για να δημοσιεύσεις χρειάζεσαι εγκατεστημένο το 間 (τοπικό runtime). Συνδέει το ego με το IPFS/IPNS εκ μέρους σου.
help-publish-steps = Βήματα: εκτέλεσε '.ma [port]' για ανίχνευση του τοπικού ma, μετά '.my.identity!publish @ma'.
help-publish-without = Χωρίς δημοσίευση, άλλοι δεν μπορούν να σε βρουν — ακόμα κι αν γνωρίζουν το DID σου, δεν μπορούν να αναλύσουν το endpoint σου.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = καθορίστε όνομα προφίλ: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Συλλογή παρτίδας — πληκτρολογήστε εντολές, τελειώστε με .batch
batch-already-collecting = Ήδη συλλέγεται μια παρτίδα — τερματίστε πρώτα με το .batch
batch-empty = Η παρτίδα ήταν άδεια — δεν υπήρχε τίποτα για εκτέλεση
batch-running = Εκτέλεση batch…
batch-step-timeout = Λήξη χρονικού ορίου του βήματος παρτίδας

batch-done = Το batch ολοκληρώθηκε σε { $secs }s — { $steps } βήματα
batch-done-error = Το batch ολοκληρώθηκε με σφάλματα σε { $secs }s — { $steps } βήματα
msg-timeout = Το μήνυμα έληξε (καμία απάντηση σε 60s)
err-unknown-command = άγνωστη εντολή: { $path }
err-read-only-path = το { $path } είναι μόνο για ανάγνωση
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        εκτέλεση πρόχειρου εγγράφου παράλληλα


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Αποτυχία ανάκτησης CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Μη έγκυρο CID: { $value }
label-runtime = μα
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Προειδοποίηση: Το ιδιωτικό κλειδί IPNS σας θα σταλεί σε αυτό το περιβάλλον εκτέλεσης για τη δημοσίευση ταυτότητας. Χρησιμοποιείτε μόνο ένα περιβάλλον εκτέλεσης που εμπιστεύεστε πλήρως.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = Το zscheme αξιολογεί εκφράσεις Scheme μέσα σε εντολές zion και εισάγει το αποτέλεσμα στη γραμμή πριν σταλεί.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ενσωματωμένο παράδειγμα· στέλνει "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             οι ορισμοί παραμένουν για την τρέχουσα συνεδρία σύνδεσης
help-zscheme-doc = Τεκμηρίωση: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Τοπική πύλη IPFS (απαιτεί εξαίρεση στον περιηγητή)

tab-config = Ρυθμίσεις
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
