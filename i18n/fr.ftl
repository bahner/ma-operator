# zion — Français
lang-name = Français
label-nick = surnom
new-identity-nick-help = Choisissez un surnom pour ma-space. Ce n'est qu'un surnom et vous pouvez le changer à tout moment.
error-nick-required = surnom requis
error-nick-invalid = le surnom ne doit contenir ni espaces ni @

# ── Page de connexion ─────────────────────────────────────────────────────
tab-login = se connecter
tab-new-identity = nouvelle identité
tab-import-profile = importer le profil
label-passphrase = phrase secrète
label-username = nom d'utilisateur
label-confirm-passphrase = confirmer la phrase secrète
label-did = DID
label-profile-cid = CID du profil
label-or-file = ou fichier
btn-login = se connecter
btn-export = exporter
btn-generate = générer
btn-new-endpoint = nouvel accès
btn-import-profile = importer le profil
passphrase-warning = Phrase secrète perdue = identité perdue. La récupération est impossible.
import-profile-help = Importez un profil via CID ou fichier. Vous avez besoin de la même phrase de passe utilisée lors de la publication.
import-profile-detected-user = Le profil appartient à : { $name }
status-unlocking = déverrouillage...
status-generating = génération de l'identité...
status-reading-file = lecture du fichier...
status-fetching-profile = récupération du profil depuis IPFS...
status-imported = '{ $name }' importé — passez à l'onglet Connexion
status-importing-profile = importation du profil...
profile-import-done = profil importé pour '{ $name }' — { $n } clés chargées
error-wrong-passphrase = phrase secrète incorrecte : { $e }
error-identity-not-found = identité '{ $name }' introuvable
error-username-required = le nom d'utilisateur est requis
error-passphrase-required = la phrase secrète est requise
error-passphrases-no-match = les phrases secrètes ne correspondent pas
error-profile-source-required = fournissez un CID ou téléversez un fichier
error-did-required = entrez votre DID
error-profile-fetch = impossible de récupérer le profil : { $e }
error-profile-no-username = le profil ne contient pas de nom d'utilisateur
error-profile-no-identity = identité '{ $name }' introuvable — importez d'abord l'identité

# ── Messages système du terminal ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — connecté en tant que { $username }
msg-type-help = Tapez .help pour obtenir la liste des commandes.
msg-getting-started = Essayez : say Hello world, look, .help ou help.
msg-connecting = connexion à iroh...
msg-iroh-ready = point de terminaison iroh prêt
msg-iroh-failed = iroh : { $e }
msg-auto-published = DID publié via ma local ({ $url })
msg-identity-publication-propagating = La publication de l’identité se propage encore ; entrée retardée : { $e }
msg-identity-first-publish = Publication de l’identité pour la première fois. Cela peut prendre jusqu’à { $seconds } secondes.
msg-ma-connecting-matrix = tentative de connexion à la 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 local revendiqué
msg-local-ma-already-claimed = 間 local déjà revendiqué
msg-local-ma-claim-failed = impossible de revendiquer le 間 local
msg-identity-not-published = Identité introuvable en ligne — si ma est installé localement, exécute '.ma [port]' puis '.my.identity!publish @ma'. Tape '.help/publish' pour les détails.
msg-blocked = ⊗ bloqué [{ $cap }] : { $from }
msg-focus-cleared = focus effacé
msg-focusing = focus sur { $did } en tant que { $prompt }
msg-set = { $path } : { $value }
msg-deleted = suppression de { $path } ({ $count } entrées)
msg-read-only = { $path } est en lecture seule
msg-subtree-set = { $path } est un sous-arbre ; définition refusée
msg-ancestor-leaf = un ancêtre de { $path } est une feuille ; ombre refusée
msg-key-not-found = clé introuvable : { $path }
msg-link-not-connected = erreur de récupération du lien : non connecté
msg-link-fetch-error = erreur de récupération du lien : { $e }
msg-link-key-not-found = clé `{ $key }` introuvable dans le document lié

# ── Validation des alias ──────────────────────────────────────────────────
err-alias-name-empty = le nom d'alias ne peut pas être vide
err-alias-has-dot = le nom d'alias ne peut pas contenir '.'
err-alias-has-fragment = le nom d'alias ne peut pas contenir '#'
err-alias-value-fragment = la valeur d'alias peut contenir au plus un fragment DID-URL non vide
err-alias-value-path = la valeur d'alias doit être un DID did:ma:<ipns> ou une DID-URL (sans chemin)
err-alias-not-did = la valeur d'alias doit commencer par did:ma:
err-unknown-alias = alias inconnu : @{ $name }
err-bare-did = did:ma:<ipns> pur attendu (sans fragment ni chemin), reçu { $did }

# ── Éditeur ───────────────────────────────────────────────────────────────
btn-save = Enregistrer
btn-eval = Exécuter
btn-cancel = Annuler
msg-jobs-cancelled = tâches annulées
btn-close = Fermer
btn-reply = Répondre
btn-publish = Publier
btn-publish-ipld = Publier IPLD
msg-reply-sent = réponse envoyée
msg-reply-failed = échec de l'envoi de la réponse : { $e }
msg-entity-publish-sent = entité { $name } : publication envoyée
msg-entity-publish-failed = échec de la publication de l'entité : { $e }
msg-kind-publish-failed = échec de publication du type: { $e }
msg-field-publish-sent = entité { $name }.{ $field } : publication envoyée
msg-field-publish-failed = échec de la publication du champ : { $e }
msg-acl-publish-sent = ACL d'exécution : publication envoyée
msg-crud-edit-publish-sent = { $path }: publication envoyée
msg-acl-publish-failed = échec de la publication de l'ACL d'exécution : { $e }
msg-yaml-error = erreur YAML : { $e }
msg-editor-saved = { $path }:enregistrer
msg-fetch-review = { $cid } récupéré — vérifiez avant l'exécution
msg-fetch-failed = récupération { $cid } : { $e }

# ── Verbes — boîte de réception ───────────────────────────────────────────
inbox-empty = la boîte de réception est vide
inbox-entry-not-found = entrée { $n } de la boîte de réception introuvable
inbox-no-message-id = l'entrée { $n } de la boîte de réception n'a pas de message_id
inbox-no-verb = aucun verbe `{ $verb }` pour l'entrée { $n } de la boîte de réception
inbox-filter-no-arg = le filtre nécessite un argument DID ou alias
inbox-filter-empty = aucun message de { $did }

# ── Verbes — exécution ────────────────────────────────────────────────────
discover-fetch-failed = découverte échouée à { $url } : { $e }
discover-json-error = découverte échouée : JSON invalide de { $url } : { $e }
discover-missing-did = découverte échouée : status.json manque le champ obligatoire `did`
discover-invalid-did = découverte échouée : `did` devrait commencer par did:ma:, reçu `{ $did }`
discover-no-endpoint = avertissement découverte : `endpoint_id` absent de status.json ; seul le DID enregistré
discover-hint-endpoint-not-found = Indice : point de terminaison introuvable. Vérifiez que `ma` fonctionne et expose /status.json sur le port 5003.
discover-hint-server-error = Indice : le runtime a répondu par une erreur serveur. Consultez les journaux de `ma` et réessayez.
discover-hint-network = Indice : problème réseau/connexion. Démarrez `ma`, vérifiez que localhost:5003 est accessible et autorisez l’accès HTTP local dans le navigateur.
discover-hint-generic = Indice : vérifiez que `ma` et IPFS Desktop fonctionnent, puis réessayez `.ma`.
discover-success = ma découvert à { $url }
discover-did-line = DID : { $did }
discover-alias-hint =   alias @ma créé — exécute '.my.identity!publish @ma' pour publier ton identité.
claim-success = Exécution revendiquée pour { $did }
claim-conflict = Exécution déjà revendiquée par une autre identité
claim-already-owned = Runtime déjà revendiqué par cette identité
claim-http-failed = revendication échouée : HTTP { $status }
claim-error = revendication échouée : { $e }
claim-no-session = non connecté ; connectez-vous d'abord pour revendiquer l'exécution
runtime-no-verb = aucun verbe `{ $verb }` pour { $path }

# ── Verbes — contrôle d'accès ─────────────────────────────────────────────
acl-reset = .my.acl réinitialisé (entièrement ouvert)
acl-persist-error = erreur d'enregistrement : { $e }
acl-no-verb = aucun verbe `{ $verb }` pour .my.acl

# ── Verbes — identité ─────────────────────────────────────────────────────
publish-usage = utilisation : .my.identity!publish <did-ou-alias>
identity-exported = Paquet téléchargé sous { $filename }
identity-export-failed = Échec de l'exportation : { $e }

# ── Verbes — documents ───────────────────────────────────────────────────
doc-content-empty = { $path }.content est vide
doc-save-first = { $path }.content est vide — enregistrez d'abord
doc-missing-name = nom du document manquant
doc-publish-usage = utilisation : .my.doc.<nom>!publish <éditeur>
doc-publish-ipld-usage = utilisation : .my.doc.<nom>!publish-ipld <éditeur>
doc-publish-failed = publication { $path } : { $e }
doc-publish-ipld-failed = publication IPLD { $path } : { $e }
doc-publish-error-detail = publication échouée [{ $code }] : { $err }
doc-publish-error-hint = Indice : { $hint }
doc-publish-hint-session = reconnectez-vous pour qu’ego puisse accéder à vos clés d’identité
doc-publish-hint-target = utilisez une DID de publication valide ou un alias qui se résout en did:ma:<ipns> nu
doc-publish-hint-network = vérifiez que le runtime ma et IPFS sont accessibles, puis réessayez
doc-publish-hint-resolve = vérifiez que le document DID du publieur est publié et contient un point de terminaison accessible
doc-publish-hint-acl = demandez à l’opérateur du publieur d’autoriser votre DID dans l’ACL
doc-publish-hint-runtime = le runtime/plugin a rejeté la requête ; examinez la raison et réessayez après correction de l’entité/runtime
doc-publish-hint-ipfs = vérifiez l’état local de Kubo/IPFS et le statut du runtime publieur
doc-publish-hint-unknown = consultez les journaux du runtime pour la cause détaillée et réessayez
doc-store-sent = demande de stockage envoyée ({ $id }) → { $publisher } ; CID arrivera via réponse RPC
doc-ipld-store-sent = demande de stockage IPLD envoyée ({ $id }) → { $publisher } ; CID arrivera via réponse RPC
doc-fetch-done = { $cid } récupéré → { $path }.content (non exécuté)
doc-fetch-failed = récupération { $cid } : { $e }
doc-fetch-usage = utilisation : .my.doc.<nom>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid n'est pas défini
doc-no-verb = aucun verbe `{ $verb }` pour { $path }
path-no-verb = aucun verbe `{ $verb }` pour { $path }

# ── Texte d'aide — en-têtes ───────────────────────────────────────────────
help-header-zion = ── commandes zion ─────────────────────────────────────────────────────────
help-header-messaging = ── messagerie ────────────────────────────────────────────────────────────
help-header-config = ── grammaire de configuration locale ────────────────────────────────────
help-header-common = ── chemins courants ──────────────────────────────────────────────────────
help-header-inbox = ── boîte de réception ────────────────────────────────────────────────────
help-header-documents = ── documents ─────────────────────────────────────────────────────────────
help-header-i18n = ── langue ────────────────────────────── ───────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── entrer dans l'espace 間────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ce texte
help-cmd-clear =   .clear                       effacer le terminal
help-cmd-panic =   .panic                       dernier recours — utilisez si vous êtes dans la difficulté
help-cmd-history =   .history                     historique des commandes (doublons consécutifs fusionnés)
help-cmd-logout =   .logout                      se déconnecter
help-cmd-batch =   .batch                       évaluer le document brouillon en parallèle
help-cmd-batch-sync =   .batch:sync / .batch         évaluer le document brouillon ligne par ligne

help-msg-echo =   @alias                       afficher le DID/DID-URL résolu (aucun message envoyé)
help-msg-send =   @alias!msg body / @alias:verb args           envoyer un message / RPC à un acteur
help-msg-fragment =   @alias#fragment:verb body  envoyer à l'alias avec un fragment DID explicite
help-msg-escape =   \@name                       @name littéral (pas de recherche d'alias)


help-config-get =   .path                        obtenir la valeur de la feuille ou lister le sous-arbre
help-config-set =   .path: value                 définir la feuille
help-config-delete =   .path:                       supprimer la feuille ou le sous-arbre
help-config-verb =   .path!verb [args]            exécuter un verbe local

help-my =   .my                          afficher toute la configuration personnelle
help-aliases =   .my.aliases                  lister les alias
help-aliases-set =   .my.aliases.<name>: <did-url>    ajouter/mettre à jour un alias (DID ou DID-URL)
help-aliases-del =   .my.aliases.<name>:          supprimer un alias
help-runtime-discover =   .ma [port]          découvrir l'exécution locale et créer l'alias @ma
help-runtime-claim =   .ma [port]             revendiquer l'exécution avec votre DID
help-identity =   .my.identity                 afficher la configuration de l'identité
help-identity-did =   .my.identity.did             afficher son DID (lecture seule)
help-identity-publish =   .my.identity!publish @pub    publier son DID via le service d'édition
help-identity-export =   .my.identity!export          télécharger son propre paquet d'identité
help-config-path =   .config                      afficher toutes les entrées .config.*

help-inbox =   .my.inbox                    lister la boîte de réception (vue sous-arbre)
help-inbox-n =   .my.inbox.N                  afficher les champs de l'entrée N
help-inbox-from =   .my.inbox.N.from             DID de l'expéditeur pour l'entrée N
help-inbox-reply =   .my.inbox.N!reply [body]     envoyer une réponse (ouvre l'éditeur sans corps)
help-inbox-open =   .my.inbox.N!open             ouvrir le contenu dans un éditeur en lecture seule
help-inbox-del =   .my.inbox.N:                 supprimer l'entrée N
help-inbox-delall =   .my.inbox:                   supprimer toutes les entrées de la boîte de réception
help-inbox-flush =   .my.inbox!flush              afficher toutes les entrées dans le terminal
help-inbox-filter =   .my.inbox!filter @who        afficher uniquement les entrées de @who
help-inbox-traverse =   .my.inbox.N.sender.<champ>  traverser le document DID de l'expéditeur en différé

help-doc-edit =   .my.doc.<nom>!edit           ouvrir l'éditeur avec le contenu enregistré
help-doc-edit-cid =   .my.doc.<nom>!edit /ipfs/<cid>     récupérer le CID, ouvrir pour révision
help-doc-eval =   .my.doc.<nom>!eval           exécuter le contenu enregistré ligne par ligne
help-doc-publish =   .my.doc.<nom>!publish @pub   stocker comme blob brut (tous types)
help-doc-publish-ipld =   .my.doc.<nom>!publish-ipld @pub  stocker YAML comme nœud IPLD DAG-CBOR structuré
help-doc-fetch =   .my.doc.<nom>!fetch /ipfs/<cid>    importer le contenu CID (sans exécution)
help-doc-cid =   .my.doc.<nom>!cid            afficher le CID enregistré
help-doc-del =   .my.doc.<nom>:              supprimer le document

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n stocke la préférence de langue liée à votre identité.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               lister les codes de langue disponibles

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = La salle 間 est l’espace entre les identités 間. ma permet à ces identités de se trouver et de communiquer ; une fois ton identité publiée, tu peux participer.
help-ma-command =   .ma [port]                   se connecter au runtime ma local, lire /status.json et enregistrer .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publier ton document DID pour que les autres résolvent tes clés et ton endpoint
help-ma-security = La limite de confiance la plus claire est ton propre runtime ma avec ton propre IPFS Desktop/Kubo. Un publisher distant peut être utile, mais tu dépends alors du service de quelqu’un d’autre.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             comment entrer dans la salle 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Quand ton identité est connue, .enter @ma te laisse entrer dans 間. Trouve un monde, entre-y et participe depuis là.
help-ma-entry-steps = Démarre IPFS Desktop et ma, puis lance .ma. Publie avec .my.identity!publish @ma, trouve un monde et entre avec .enter @ma.
help-ma-entry-command =   .enter @ma                  entrer dans 間 via le runtime @ma
help-ma-entry-toggle =   .enter                       activer ou désactiver le focus de la salle ; ton identité reste active
help-ma-entry-url =   ?enter=<runtime>             entrer après connexion depuis une URL partagée

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Langues disponibles (définir avec .my.i18n: <code>):
err-lang-not-found = langue introuvable : { $lang }

msg-send-failed = échec de l'envoi : { $e }
msg-not-logged-in = non connecté

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Erreur d'analyse YAML : { $e }
yaml-not-mapping = YAML doit être un mapping (paires clé : valeur) ; le texte brut et les scalaires ne peuvent pas être stockés en DAG-CBOR
dagcbor-encode-error = Erreur d'encodage DAG-CBOR : { $e }
cbor-decode-error = Erreur de décodage CBOR : { $e }
cbor-json-error = Erreur CBOR vers JSON : { $e }
yaml-serialise-error = Erreur de sérialisation YAML : { $e }
edit-reply-invalid = Réponse de modification invalide
doc-publish-ipld-error = Publication IPLD échouée : { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Erreur de sauvegarde du nettoyage de la boîte de réception : { $e }
err-config-load = Erreur de chargement de la configuration : { $e }
err-lang-persist = Erreur de sauvegarde de la langue : { $e }
err-history-parse = Erreur d'analyse de l'historique : { $e }
err-history-load = Erreur de chargement de l'historique : { $e }
err-ipfs-reply-decode = Échec du décodage de la réponse IPFS : { $e }
err-edit-cbor = Erreur d'édition CBOR : { $e }
err-popup-blocked = Fenêtre contextuelle bloquée par le navigateur
status-publishing = publication

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = erreur
rpc-error-detail = erreur: { $detail }
msg-new-message = ← [{ $from }] nouveau message — { $count } dans la boîte de réception
msg-chat = { $sender } dit { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } dit { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } entre dans la salle.
room-leave = * { $name } quitte la salle.
room-drop  = * { $name } lâche { $thing }.
room-take  = * { $name } ramasse { $thing }.
err-edit-decode-failed = édition: échec du décodage: { $e }
err-edit-fetch-failed = édition: échec du chargement: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = aucune session active — impossible de supprimer le profil
profile-delete-error = échec de la suppression du profil : { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil chiffré et envoyé à IPFS ; le document DID sera mis à jour quand le CID arrivera
profile-publish-done = profil publié — document DID mis à jour avec le CID ma.agent
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identité déjà publiée — profil à jour
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = contenu binaire (non affiché)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (aucun)
profiles-deleted = profil { $name } supprimé
profiles-not-found = profil introuvable : { $name }

# -- Help topics index
help-header-topics = -- sujets -- tapez .help/<topic> pour les détails
help-topic-msg =   .help/msg                    messagerie
help-topic-ma = .help/ma                     ma-espace, publication et entrée
help-topic-path = .help/path                   grammaire locale du chemin des points
help-topic-my =   .help/my                     config personnelle
help-topic-inbox =   .help/inbox                  boîte de réception
help-topic-doc =   .help/doc                    documents locaux
help-topic-actor =   .help/actor                  acteur distant
help-topic-zscheme =   .help/zscheme               expressions Scheme intégrées et documentation
help-topic-url =   .help/url                    ouvrir zion via un lien URL
help-topic-i18n = .help/i18n                   préférence linguistique pour votre identité
help-unknown-topic =   .help/{ $topic }: sujet inconnu

# -- Help actor section
help-header-actor = -- acteurs distants
help-actor-echo =   @actor                       afficher le DID résolu
help-actor-text = @actor[#entity]!msg|!say|!emote body         envoyer un message direct/chat/emote
help-actor-ping = @actor:ping                  ping de vivacité
help-actor-entities =   @actor/entities              lister les entités
help-actor-entities-get = @actor/entities/<n>          obtenir le nœud d'entité
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     modifier l’entité
help-actor-entities-del = @actor/entities/<n>:         supprimer l'entité
help-actor-config-get =   @actor/config/<key>          obtenir la valeur de config
help-actor-config-set =   @actor/config/<key>: val     définir la valeur de config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              modifier ACL
help-actor-fragment =   @actor#entity                envoyer au plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC vers le plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  conserver les réponses 5 dans l'environnement de session
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── paramètres URL ──────────────────────────────────────────────────────────
help-url-intro =   Partage un lien qui ouvre zion avec un destinataire pré-rempli :
help-url-msg =   ?msg=<did>                   pré-remplit : @<did>!msg (message texte)
help-url-say =   ?say=<did>                   pré-remplit : @<did>!say (verbe say)
help-url-emote =   ?emote=<did>                 pré-remplit : @<did>!emote (verbe emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             entrez dans le monde d'exécution après la connexion
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   La saisie est pré-remplie mais non envoyée — appuie sur Entrée pour envoyer.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publier ton identité sur le réseau
help-header-publish = ── publier son identité ─────────────────────────────────────────────────────
help-publish-intro = La publication rend ton identité trouvable sur le réseau. D'autres peuvent chercher ton DID pour te contacter.
help-publish-ma = Pour publier, tu as besoin de ma (runtime local) installé. Il relie ego à IPFS/IPNS en ton nom.
help-publish-steps = Étapes : lance '.ma [port]' pour détecter ton ma local, puis '.my.identity!publish @ma'.
help-publish-without = Sans publication, les autres ne peuvent pas te joindre — même s'ils connaissent ton DID, ils ne peuvent pas résoudre ton endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = indiquez un nom de profil : .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecte par lots : tapez des commandes, terminez par .batch
batch-already-collecting = Vous collectez déjà un lot – terminez d'abord par .batch
batch-empty = Le lot était vide – rien à exécuter
batch-running = Exécution du batch…
batch-step-timeout = l'étape du lot a expiré

batch-done = Batch terminé en { $secs }s — { $steps } étapes
batch-done-error = Batch terminé avec erreurs en { $secs }s — { $steps } étapes
msg-timeout = Message expiré (aucune réponse en 60s)
err-unknown-command = commande inconnue : { $path }
err-read-only-path = { $path } est en lecture seule
help-cmd-batch-async =   .batch:async / .batch        évaluer le document brouillon en parallèle


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Échec de la récupération du CID { $cid } : { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID non valide : { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Avertissement : Votre clé privée IPNS sera envoyée à cet environnement d'exécution pour la publication de votre identité. N'utilisez qu'un environnement d'exécution auquel vous faites entièrement confiance.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme évalue les expressions Scheme intégrées aux commandes zion et insère le résultat dans la ligne avant son envoi.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    exemple intégré ; envoie "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             les définitions persistent pendant la session de connexion actuelle
help-zscheme-doc = Documentation : https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Passerelle IPFS locale (exception navigateur requise)

tab-config = Paramètres
label-gateway = gateway
