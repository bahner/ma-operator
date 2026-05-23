# zion — Français
lang-name = Français

# ── Page de connexion ─────────────────────────────────────────────────────
tab-login = se connecter
tab-new-identity = nouvelle identité
tab-import = importer
label-passphrase = phrase secrète
label-username = nom d'utilisateur
label-confirm-passphrase = confirmer la phrase secrète
btn-login = se connecter
btn-export = exporter
btn-generate = générer
passphrase-warning = Phrase secrète perdue = identité perdue. La récupération est impossible.
import-help = Choisissez un fichier .zion.json exporté. Le paquet reste chiffré.
status-unlocking = déverrouillage...
status-generating = génération de l'identité...
status-reading-file = lecture du fichier...
status-imported = '{ $name }' importé — passez à l'onglet Connexion
error-wrong-passphrase = phrase secrète incorrecte : { $e }
error-identity-not-found = identité '{ $name }' introuvable
error-username-required = le nom d'utilisateur est requis
error-passphrase-required = la phrase secrète est requise
error-passphrases-no-match = les phrases secrètes ne correspondent pas

# ── Messages système du terminal ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — connecté en tant que { $username }
msg-type-help = Tapez .help pour obtenir la liste des commandes.
msg-connecting = connexion à iroh...
msg-iroh-ready = point de terminaison iroh prêt
msg-iroh-failed = iroh : { $e }
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
msg-reply-sent = réponse envoyée
msg-reply-failed = échec de l'envoi de la réponse : { $e }
msg-entity-publish-sent = entité { $name } : publication envoyée
msg-entity-publish-failed = échec de la publication de l'entité : { $e }
msg-field-publish-sent = entité { $name }.{ $field } : publication envoyée
msg-field-publish-failed = échec de la publication du champ : { $e }
msg-acl-publish-sent = ACL d'exécution : publication envoyée
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

# ── Verbes — exécution ────────────────────────────────────────────────────
discover-fetch-failed = découverte échouée à { $url } : { $e }
discover-json-error = découverte échouée : JSON invalide de { $url } : { $e }
discover-missing-did = découverte échouée : status.json manque le champ obligatoire `did`
discover-invalid-did = découverte échouée : `did` devrait commencer par did:ma:, reçu `{ $did }`
discover-no-endpoint = avertissement découverte : `endpoint_id` absent de status.json ; seul le DID enregistré
discover-success = ma découvert à { $url }
discover-did-line = DID : { $did }
discover-alias-hint =   alias @ma créé — publiez avec : .my.identity:publish @ma
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
publish-usage = utilisation : .my.identity:publish <did-ou-alias>

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
help-cmd-logout =   .logout                      se déconnecter

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
help-config-verb =   .path:verb [args]            exécuter un verbe local

help-my =   .my                          afficher toute la configuration personnelle
help-aliases =   .my.aliases                  lister les alias
help-aliases-set =   .my.aliases.<name>: <did>    ajouter/mettre à jour un alias (DID pur, sans #fragment)
help-aliases-del =   .my.aliases.<name>:          supprimer un alias
help-runtime-discover =   .my.ma:discover          découvrir l'exécution locale et créer l'alias @ma
help-runtime-claim =   .my.ma:claim             revendiquer l'exécution avec votre DID
help-identity =   .my.identity                 afficher la configuration de l'identité
help-identity-did =   .my.identity.did             afficher son DID (lecture seule)
help-identity-publish =   .my.identity:publish @pub    publier son DID via le service d'édition
help-config-path =   .config                      afficher toutes les entrées .config.*

help-inbox =   .my.inbox                    lister la boîte de réception (vue sous-arbre)
help-inbox-n =   .my.inbox.N                  afficher les champs de l'entrée N
help-inbox-from =   .my.inbox.N.from             DID de l'expéditeur pour l'entrée N
help-inbox-reply =   .my.inbox.N:reply [body]     envoyer une réponse (ouvre l'éditeur sans corps)
help-inbox-open =   .my.inbox.N:open             ouvrir le contenu dans un éditeur en lecture seule
help-inbox-del =   .my.inbox.N:                 supprimer l'entrée N
help-inbox-delall =   .my.inbox:                   supprimer toutes les entrées de la boîte de réception
help-inbox-flush =   .my.inbox:flush              afficher toutes les entrées dans le terminal
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
