# zion — Ελληνικά
lang-name = Ελληνικά

# ── Σελίδα σύνδεσης ───────────────────────────────────────────────────────
tab-login = σύνδεση
tab-new-identity = νέα ταυτότητα
tab-import = εισαγωγή
label-passphrase = φράση πρόσβασης
label-username = όνομα χρήστη
label-confirm-passphrase = επιβεβαίωση φράσης πρόσβασης
btn-login = σύνδεση
btn-export = εξαγωγή
btn-generate = δημιουργία
btn-new-endpoint = νέο σημείο σύνδεσης
passphrase-warning = Χαμένη φράση πρόσβασης = χαμένη ταυτότητα. Η ανάκτηση δεν είναι δυνατή.
import-help = Επιλέξτε εξαγόμενο αρχείο .zion.json. Το πακέτο παραμένει κρυπτογραφημένο.
status-unlocking = ξεκλείδωμα...
status-generating = δημιουργία ταυτότητας...
status-reading-file = ανάγνωση αρχείου...
status-imported = το '{ $name }' εισήχθη — μεταβείτε στην καρτέλα Σύνδεση
error-wrong-passphrase = λανθασμένη φράση πρόσβασης: { $e }
error-identity-not-found = η ταυτότητα '{ $name }' δεν βρέθηκε
error-username-required = το όνομα χρήστη είναι υποχρεωτικό
error-passphrase-required = η φράση πρόσβασης είναι υποχρεωτική
error-passphrases-no-match = οι φράσεις πρόσβασης δεν ταιριάζουν

# ── Μηνύματα συστήματος τερματικού ───────────────────────────────────────
msg-logged-in = zion v{ $version } — συνδεδεμένοι ως { $username }
msg-type-help = Πληκτρολογήστε .help για λίστα εντολών.
msg-connecting = σύνδεση στο iroh...
msg-iroh-ready = τελικό σημείο iroh έτοιμο
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID δημοσιεύτηκε μέσω τοπικού ma ({ $url })
msg-identity-not-published = Η ταυτότητα δεν βρέθηκε διαδικτυακά — αν έχεις εγκατεστημένο το ma τοπικά, εκτέλεσε '.my.ma:discover' και μετά '.my.identity:publish @ma'. Πληκτρολόγησε '.help.publish' για λεπτομέρειες.
msg-blocked = ⊗ αποκλεισμένο [{ $cap }]: { $from }
msg-focus-cleared = η εστίαση διαγράφηκε
msg-focusing = εστίαση σε { $did } ως { $prompt }
msg-set = { $path }: { $value }
msg-deleted = διαγράφηκε { $path } ({ $count } καταχωρήσεις)
msg-read-only = { $path } είναι μόνο για ανάγνωση
msg-subtree-set = { $path } είναι υποδέντρο· η ρύθμιση απορρίφθηκε
msg-ancestor-leaf = ένας πρόγονος του { $path } είναι φύλλο· η σκίαση απορρίφθηκε
msg-key-not-found = το κλειδί δεν βρέθηκε: { $path }
msg-no-match = δεν βρέθηκε αποτέλεσμα
msg-link-not-connected = σφάλμα ανάκτησης συνδέσμου: δεν υπάρχει σύνδεση
msg-link-fetch-error = σφάλμα ανάκτησης συνδέσμου: { $e }
msg-link-key-not-found = το κλειδί `{ $key }` δεν βρέθηκε στο συνδεδεμένο έγγραφο

# ── Επαλήθευση ψευδωνύμων ─────────────────────────────────────────────────
err-alias-name-empty = το όνομα ψευδωνύμου δεν μπορεί να είναι κενό
err-alias-has-dot = το όνομα ψευδωνύμου δεν μπορεί να περιέχει '.'
err-alias-has-fragment = το όνομα ψευδωνύμου δεν μπορεί να περιέχει '#'
err-alias-value-fragment = η τιμή ψευδωνύμου πρέπει να είναι καθαρό did:ma:<ipns> (χωρίς τμήμα)
err-alias-value-path = η τιμή ψευδωνύμου πρέπει να είναι καθαρό did:ma:<ipns> (χωρίς διαδρομή)
err-alias-not-did = η τιμή ψευδωνύμου πρέπει να αρχίζει με did:ma:
err-unknown-alias = άγνωστο ψευδώνυμο: @{ $name }
err-bare-did = αναμένεται καθαρό did:ma:<ipns> (χωρίς τμήμα ή διαδρομή), ελήφθη { $did }

# ── Επεξεργαστής ──────────────────────────────────────────────────────────
btn-save = Αποθήκευση
btn-eval = Εκτέλεση
btn-cancel = Ακύρωση
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
discover-success = το ma ανακαλύφθηκε στο { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   ψευδώνυμο @ma δημιουργήθηκε — εκτέλεσε '.my.identity:publish @ma' για να δημοσιεύσεις την ταυτότητά σου.
claim-success = Το περιβάλλον εκτέλεσης διεκδικήθηκε για { $did }
claim-conflict = Το περιβάλλον εκτέλεσης έχει ήδη διεκδικηθεί από άλλη ταυτότητα
claim-http-failed = η διεκδίκηση απέτυχε: HTTP { $status }
claim-error = η διεκδίκηση απέτυχε: { $e }
claim-no-session = δεν έχετε συνδεθεί· συνδεθείτε πρώτα για να διεκδικήσετε το περιβάλλον εκτέλεσης
runtime-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }

# ── Ρήματα — έλεγχος πρόσβασης ───────────────────────────────────────────
acl-reset = .my.acl επαναφέρθηκε (πλήρως ανοικτό)
acl-persist-error = σφάλμα αποθήκευσης: { $e }
acl-no-verb = δεν υπάρχει ρήμα `{ $verb }` για .my.acl

# ── Ρήματα — ταυτότητα ────────────────────────────────────────────────────
publish-usage = χρήση: .my.identity:publish <did-ή-ψευδώνυμο>
identity-exported = Το πακέτο λήφθηκε ως { $filename }
identity-export-failed = Η εξαγωγή απέτυχε: { $e }

# ── Ρήματα — έγγραφα ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content είναι κενό
doc-save-first = { $path }.content είναι κενό — αποθηκεύστε πρώτα
doc-missing-name = λείπει το όνομα εγγράφου
doc-publish-usage = χρήση: .my.doc.<όνομα>:publish <εκδότης>
doc-publish-ipld-usage = χρήση: .my.doc.<όνομα>:publish-ipld <εκδότης>
doc-publish-failed = δημοσίευση { $path }: { $e }
doc-publish-ipld-failed = δημοσίευση IPLD { $path }: { $e }
doc-store-sent = αίτημα αποθήκευσης εστάλη ({ $id }) → { $publisher }; το CID θα φτάσει μέσω απάντησης RPC
doc-ipld-store-sent = αίτημα αποθήκευσης IPLD εστάλη ({ $id }) → { $publisher }; το CID θα φτάσει μέσω απάντησης RPC
doc-fetch-done = { $cid } ανακτήθηκε → { $path }.content (δεν εκτελέστηκε)
doc-fetch-failed = ανάκτηση { $cid }: { $e }
doc-fetch-usage = χρήση: .my.doc.<όνομα>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid δεν έχει οριστεί
doc-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }
path-no-verb = δεν υπάρχει ρήμα `{ $verb }` για { $path }

# ── Κείμενο βοήθειας — κεφαλίδες ─────────────────────────────────────────
help-header-zion = ── εντολές zion ───────────────────────────────────────────────────────────
help-header-messaging = ── ανταλλαγή μηνυμάτων ───────────────────────────────────────────────────
help-header-focus = ── λειτουργία εστίασης ───────────────────────────────────────────────────
help-header-config = ── τοπική γραμματική διαμόρφωσης ────────────────────────────────────
help-header-common = ── συνήθεις διαδρομές ────────────────────────────────────────────────────
help-header-inbox = ── εισερχόμενα ───────────────────────────────────────────────────────────
help-header-documents = ── έγγραφα ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        αυτό το κείμενο
help-cmd-clear =   .clear                       εκκαθάριση τερματικού
help-cmd-panic =   .panic                       τελευταία λύση — χρησιμοποιήστε αν αντιμετωπίζετε πρόβλημα
help-cmd-history =   .history                     ιστορικό εντολών (διαδοχικά διπλότυπα ενοποιήθηκαν)
help-cmd-logout =   .logout                      αποσύνδεση
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       εμφάνιση επιλυμένου DID (δεν αποστέλλεται μήνυμα)
help-msg-send =   @alias[:verb] body           αποστολή μηνύματος / RPC σε ηθοποιό
help-msg-fragment =   @alias#fragment[:verb] body  αποστολή σε ψευδώνυμο με ρητό τμήμα DID
help-msg-escape =   \@name                       κυριολεκτικό @name (χωρίς αναζήτηση ψευδωνύμου)

help-focus-set =   .use @alias [as @name]       εστίαση σε ηθοποιό (αλλάζει την προτροπή)
help-focus-clear =   .use                         εκκαθάριση εστίασης

help-config-get =   .path                        λήψη τιμής φύλλου ή καταγραφή υποδέντρου
help-config-filter =   .path value                  φίλτρο αναζήτησης (φιλτράρισμα κατά τιμή)
help-config-set =   .path: value                 ρύθμιση φύλλου
help-config-delete =   .path:                       διαγραφή φύλλου ή υποδέντρου
help-config-verb =   .path:verb [args]            εκτέλεση τοπικού ρήματος

help-my =   .my                          εμφάνιση όλης της προσωπικής διαμόρφωσης
help-aliases =   .my.aliases                  καταγραφή ψευδωνύμων
help-aliases-set =   .my.aliases.<name>: <did>    προσθήκη/ενημέρωση ψευδωνύμου (καθαρό DID, χωρίς #τμήμα)
help-aliases-del =   .my.aliases.<name>:          αφαίρεση ψευδωνύμου
help-runtime-discover =   .my.ma:discover          ανακάλυψη τοπικού περιβάλλοντος εκτέλεσης και δημιουργία ψευδωνύμου @ma
help-runtime-claim =   .my.ma:claim             διεκδίκηση περιβάλλοντος εκτέλεσης με το DID σας
help-identity =   .my.identity                 εμφάνιση διαμόρφωσης ταυτότητας
help-identity-did =   .my.identity.did             εμφάνιση ιδίου DID (μόνο ανάγνωση)
help-identity-publish =   .my.identity:publish @pub    δημοσίευση ιδίου DID μέσω υπηρεσίας εκδότη
help-identity-export =   .my.identity:export          λήψη δικού σου πακέτου ταυτότητας
help-config-path =   .config                      εμφάνιση όλων των καταχωρήσεων .config.*

help-inbox =   .my.inbox                    καταγραφή εισερχομένων (προβολή υποδέντρου)
help-inbox-n =   .my.inbox.N                  εμφάνιση πεδίων καταχώρησης N
help-inbox-from =   .my.inbox.N.from             DID αποστολέα για καταχώρηση N
help-inbox-reply =   .my.inbox.N:reply [body]     αποστολή απάντησης (ανοίγει επεξεργαστή χωρίς σώμα)
help-inbox-open =   .my.inbox.N:open             άνοιγμα περιεχομένου σε επεξεργαστή μόνο ανάγνωσης
help-inbox-del =   .my.inbox.N:                 διαγραφή καταχώρησης N
help-inbox-delall =   .my.inbox:                   διαγραφή όλων των καταχωρήσεων εισερχομένων
help-inbox-flush =   .my.inbox:flush              εκτύπωση όλων των καταχωρήσεων στο τερματικό
help-inbox-filter =   .my.inbox:filter @who        εμφάνιση μόνο εγγραφών από @who
help-inbox-traverse =   .my.inbox.N.sender.<πεδίο>  τεμπέλικη διάσχιση εγγράφου DID αποστολέα

help-doc-edit =   .my.doc.<όνομα>:edit           άνοιγμα επεξεργαστή με αποθηκευμένο περιεχόμενο
help-doc-edit-cid =   .my.doc.<όνομα>:edit <cid>     ανάκτηση CID, άνοιγμα για αναθεώρηση
help-doc-eval =   .my.doc.<όνομα>:eval           εκτέλεση αποθηκευμένου περιεχομένου γραμμή-γραμμή
help-doc-publish =   .my.doc.<όνομα>:publish @pub   αποθήκευση ως ακατέργαστο blob (όλοι οι τύποι)
help-doc-publish-ipld =   .my.doc.<όνομα>:publish-ipld @pub  αποθήκευση YAML ως δομημένο κόμβο DAG-CBOR IPLD
help-doc-fetch =   .my.doc.<όνομα>:fetch <cid>    εισαγωγή περιεχομένου CID (χωρίς εκτέλεση)
help-doc-cid =   .my.doc.<όνομα>:cid            εμφάνιση αποθηκευμένου CID
help-doc-del =   .my.doc.<όνομα>:              διαγραφή εγγράφου

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
yaml-serialize-error = Σφάλμα σειριοποίησης YAML: { $e }
edit-reply-invalid = Μη έγκυρη απάντηση επεξεργασίας
doc-publish-ipld-error = Αποτυχία δημοσίευσης IPLD: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Σφάλμα αποθήκευσης κλαδέματος εισερχόμενης: { $e }
err-config-load = Σφάλμα φόρτωσης ρυθμίσεων: { $e }
err-lang-persist = Σφάλμα αποθήκευσης γλώσσας: { $e }
err-history-parse = Σφάλμα ανάλυσης ιστορικού: { $e }
err-history-load = Σφάλμα φόρτωσης ιστορικού: { $e }
err-ipfs-reply-decode = Αποτυχία αποκωδικοποίησης απόκρισης IPFS: { $e }
err-edit-cbor = Σφάλμα επεξεργασίας CBOR: { $e }
err-popup-blocked = Το αναδυόμενο παράθυρο αποκλείστηκε από τον περιηγητή
status-publishing = δημοσίευση

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = σφάλμα
rpc-error-detail = σφάλμα: { $detail }
msg-new-message = ← [{ $from }] νέο μήνυμα — { $count } στα εισερχόμενα
msg-chat = { $sender } λέει { $body }
err-edit-decode-failed = αποτυχία αποκωδικοποίησης επεξεργασίας: { $e }
err-edit-fetch-failed = αποτυχία ανάκτησης επεξεργασίας: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = δεν υπάρχει ενεργή συνεδρία — δεν είναι δυνατή η διαγραφή του προφίλ
profile-delete-error = η διαγραφή του προφίλ απέτυχε: { $e }
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
profiles-empty = (κανένα)
profiles-deleted = το προφίλ { $name } διαγράφηκε
profiles-not-found = το προφίλ δεν βρέθηκε: { $name }

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

help-topic-url =   .help.url                    άνοιγμα του zion μέσω συνδέσμου URL
help-header-url = ── παράμετροι URL ───────────────────────────────────────────────────────────────
help-url-intro =   Μοιράσου έναν σύνδεσμο που ανοίγει το zion με προσυμπληρωμένο παραλήπτη:
help-url-msg =   ?msg=<did>                   προσυμπληρώνει: @<did> (απλό μήνυμα)
help-url-say =   ?say=<did>                   προσυμπληρώνει: @<did>:say (ρήμα say)
help-url-emote =   ?emote=<did>                 προσυμπληρώνει: @<did>:emote (ρήμα emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Η είσοδος είναι προσυμπληρωμένη αλλά δεν έχει σταλεί — πάτα Enter για αποστολή.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                δημοσίευση ταυτότητας στο δίκτυο
help-header-publish = ── δημοσίευση ταυτότητας ────────────────────────────────────────────────────
help-publish-intro = Η δημοσίευση κάνει την ταυτότητά σου εντοπίσιμη στο δίκτυο. Άλλοι μπορούν να αναζητήσουν το DID σου για να σε βρουν.
help-publish-ma = Για να δημοσιεύσεις χρειάζεσαι εγκατεστημένο το ma (τοπικό runtime). Συνδέει το ego με το IPFS/IPNS εκ μέρους σου.
help-publish-steps = Βήματα: εκτέλεσε '.my.ma:discover' για ανίχνευση του τοπικού ma, μετά '.my.identity:publish @ma'.
help-publish-without = Χωρίς δημοσίευση, άλλοι δεν μπορούν να σε βρουν — ακόμα κι αν γνωρίζουν το DID σου, δεν μπορούν να αναλύσουν το endpoint σου.
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
