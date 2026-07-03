# zion — Français
lang-name = Français

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
msg-connecting = connexion à iroh...
msg-iroh-ready = point de terminaison iroh prêt
msg-iroh-failed = iroh : { $e }
msg-auto-published = DID publié via ma local ({ $url })
msg-identity-not-published = Identité introuvable en ligne — si ma est installé localement, exécute '.ma [port]' puis '.my.identity!publish @ma'. Tape '.help.publish' pour les détails.
msg-blocked = ⊗ bloqué [{ $cap }] : { $from }
msg-focus-cleared = focus effacé
msg-focusing = focus sur { $did } en tant que { $prompt }
msg-set = { $path } : { $value }
msg-deleted = suppression de { $path } ({ $count } entrées)
msg-read-only = { $path } est en lecture seule
msg-subtree-set = { $path } est un sous-arbre ; définition refusée
msg-ancestor-leaf = un ancêtre de { $path } est une feuille ; ombre refusée
msg-key-not-found = clé introuvable : { $path }
msg-no-match = aucune correspondance
msg-link-not-connected = erreur de récupération du lien : non connecté
msg-link-fetch-error = erreur de récupération du lien : { $e }
msg-link-key-not-found = clé `{ $key }` introuvable dans le document lié

# ── Validation des alias ──────────────────────────────────────────────────
err-alias-name-empty = le nom d'alias ne peut pas être vide
err-alias-has-dot = le nom d'alias ne peut pas contenir '.'
err-alias-has-fragment = le nom d'alias ne peut pas contenir '#'
err-alias-value-fragment = la valeur d'alias doit être un did:ma:<ipns> pur (sans fragment)
err-alias-value-path = la valeur d'alias doit être un did:ma:<ipns> pur (sans chemin)
err-alias-not-did = la valeur d'alias doit commencer par did:ma:
err-unknown-alias = alias inconnu : @{ $name }
err-bare-did = did:ma:<ipns> pur attendu (sans fragment ni chemin), reçu { $did }

# ── Éditeur ───────────────────────────────────────────────────────────────
btn-save = Enregistrer
btn-eval = Exécuter
btn-cancel = Annuler
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
discover-success = ma découvert à { $url }
discover-did-line = DID : { $did }
discover-alias-hint =   alias @ma créé — exécute '.my.identity!publish @ma' pour publier ton identité.
claim-success = Exécution revendiquée pour { $did }
claim-conflict = Exécution déjà revendiquée par une autre identité
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
doc-publish-usage = utilisation : .my.doc.<nom>:publish <éditeur>
doc-publish-ipld-usage = utilisation : .my.doc.<nom>:publish-ipld <éditeur>
doc-publish-failed = publication { $path } : { $e }
doc-publish-ipld-failed = publication IPLD { $path } : { $e }
doc-store-sent = demande de stockage envoyée ({ $id }) → { $publisher } ; CID arrivera via réponse RPC
doc-ipld-store-sent = demande de stockage IPLD envoyée ({ $id }) → { $publisher } ; CID arrivera via réponse RPC
doc-fetch-done = { $cid } récupéré → { $path }.content (non exécuté)
doc-fetch-failed = récupération { $cid } : { $e }
doc-fetch-usage = utilisation : .my.doc.<nom>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid n'est pas défini
doc-no-verb = aucun verbe `{ $verb }` pour { $path }
path-no-verb = aucun verbe `{ $verb }` pour { $path }

# ── Texte d'aide — en-têtes ───────────────────────────────────────────────
help-header-zion = ── commandes zion ─────────────────────────────────────────────────────────
help-header-messaging = ── messagerie ────────────────────────────────────────────────────────────
help-header-focus = ── mode focus ────────────────────────────────────────────────────────────
help-header-config = ── grammaire de configuration locale ────────────────────────────────────
help-header-common = ── chemins courants ──────────────────────────────────────────────────────
help-header-inbox = ── boîte de réception ────────────────────────────────────────────────────
help-header-documents = ── documents ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        ce texte
help-cmd-clear =   .clear                       effacer le terminal
help-cmd-panic =   .panic                       dernier recours — utilisez si vous êtes dans la difficulté
help-cmd-history =   .history                     historique des commandes (doublons consécutifs fusionnés)
help-cmd-logout =   .logout                      se déconnecter
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

help-msg-echo =   @alias                       afficher le DID résolu (aucun message envoyé)
help-msg-send =   @alias[:verb] body           envoyer un message / RPC à un acteur
help-msg-fragment =   @alias#fragment[:verb] body  envoyer à l'alias avec un fragment DID explicite
help-msg-escape =   \@name                       @name littéral (pas de recherche d'alias)

help-focus-set =   .use @alias [as @name]       focaliser sur l'acteur (modifie l'invite)
help-focus-clear =   .use                         effacer le focus

help-config-get =   .path                        obtenir la valeur de la feuille ou lister le sous-arbre
help-config-filter =   .path value                  filtre de recherche (filtrer par valeur)
help-config-set =   .path: value                 définir la feuille
help-config-delete =   .path:                       supprimer la feuille ou le sous-arbre
help-config-verb =   .path!verb [args]            exécuter un verbe local

help-my =   .my                          afficher toute la configuration personnelle
help-aliases =   .my.aliases                  lister les alias
help-aliases-set =   .my.aliases.<name>: <did>    ajouter/mettre à jour un alias (DID pur, sans #fragment)
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

help-doc-edit =   .my.doc.<nom>:edit           ouvrir l'éditeur avec le contenu enregistré
help-doc-edit-cid =   .my.doc.<nom>:edit <cid>     récupérer le CID, ouvrir pour révision
help-doc-eval =   .my.doc.<nom>:eval           exécuter le contenu enregistré ligne par ligne
help-doc-publish =   .my.doc.<nom>:publish @pub   stocker comme blob brut (tous types)
help-doc-publish-ipld =   .my.doc.<nom>:publish-ipld @pub  stocker YAML comme nœud IPLD DAG-CBOR structuré
help-doc-fetch =   .my.doc.<nom>:fetch <cid>    importer le contenu CID (sans exécution)
help-doc-cid =   .my.doc.<nom>:cid            afficher le CID enregistré
help-doc-del =   .my.doc.<nom>:              supprimer le document

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
yaml-serialize-error = Erreur de sérialisation YAML : { $e }
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
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (aucun)
profiles-deleted = profil { $name } supprimé
profiles-not-found = profil introuvable : { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    ouvrir zion via un lien URL
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities.<n>          get entity
help-actor-entities-set =   @actor.entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities.<n>!edit     edit entity
help-actor-entities-del =   @actor.entities.<n>:         delete entity
help-actor-config-get =   @actor.config.<key>          get config value
help-actor-config-set =   @actor.config.<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only
help-header-url = ── paramètres URL ──────────────────────────────────────────────────────────
help-url-intro =   Partage un lien qui ouvre zion avec un destinataire pré-rempli :
help-url-msg =   ?msg=<did>                   pré-remplit : @<did> (message texte)
help-url-say =   ?say=<did>                   pré-remplit : @<did>:say (verbe say)
help-url-emote =   ?emote=<did>                 pré-remplit : @<did>:emote (verbe emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   La saisie est pré-remplie mais non envoyée — appuie sur Entrée pour envoyer.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publier ton identité sur le réseau
help-header-publish = ── publier son identité ─────────────────────────────────────────────────────
help-publish-intro = La publication rend ton identité trouvable sur le réseau. D'autres peuvent chercher ton DID pour te contacter.
help-publish-ma = Pour publier, tu as besoin de ma (runtime local) installé. Il relie ego à IPFS/IPNS en ton nom.
help-publish-steps = Étapes : lance '.ma [port]' pour détecter ton ma local, puis '.my.identity!publish @ma'.
help-publish-without = Sans publication, les autres ne peuvent pas te joindre — même s'ils connaissent ton DID, ils ne peuvent pas résoudre ton endpoint.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
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


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Échec de la récupération du CID { $cid } : { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID non valide : { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Avertissement : Votre clé privée IPNS sera envoyée à cet environnement d'exécution pour la publication de votre identité. N'utilisez qu'un environnement d'exécution auquel vous faites entièrement confiance.
