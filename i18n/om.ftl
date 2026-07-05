# zion — Afaan Oromoo
lang-name = Afaan Oromoo

# ── Fuula seensaa ─────────────────────────────────────────────────────────
tab-login = seeni
tab-new-identity = eenyummaa haaraa
tab-import-profile = profaayilii galchi
label-passphrase = jecha icciitii
label-username = maqaa fayyadamaa
label-confirm-passphrase = jecha icciitii mirkaneessi
label-did = DID
label-profile-cid = profaayilii CID
label-or-file = yookaan faayilii
btn-login = seeni
btn-export = baasi
btn-generate = uumi
btn-new-endpoint = dhibcaha haaraa
btn-import-profile = profaayilii galchi
passphrase-warning = Jecha icciitii dhabuu = eenyummaa dhabuu. Deebii hin jiru.
import-profile-help = Profaayilii CID yookaan faayiliidhaan galchi. Paaswardii maxxansaaf fayyadamame waliigala barbaadama.
import-profile-detected-user = Profaayiliin kan: { $name }
status-unlocking = banamaa jira...
status-generating = eenyummaa uumamaa jira...
status-reading-file = faayilii dubbifamaa jira...
status-fetching-profile = profaayilii IPFS irraa fudhachaa...
status-imported = '{ $name }' galame — gara taabii seensaatti deebi'i
status-importing-profile = profaayilii galchinaa...
profile-import-done = profaayiliin '{ $name }' galche — bitootee { $n } fe'ame
error-wrong-passphrase = jecha icciitii dogoggore: { $e }
error-identity-not-found = eenyummaan '{ $name }' hin argamne
error-username-required = maqaa fayyadamaa barbaachisaa dha
error-passphrase-required = jecha icciitii barbaachisaa dha
error-passphrases-no-match = jechoonni icciitii wal hin simne
error-profile-source-required = CID kenni yookaan faayilii galchi
error-did-required = DID kee galchi
error-profile-fetch = profaayilii argachuu hin dandeenye: { $e }
error-profile-no-username = profaayiliin maqaa fayyadamaa hin qabu
error-profile-no-identity = eenummaa '{ $name }' argame hin jiru — duraan eenummaa galchi

# ── Ergaalee sirna terminal ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — akka { $username }tti seenameera
msg-type-help = Tarree ajajootaaf .help barreessi.
msg-connecting = iroh walitti hidhamaa...
msg-iroh-ready = xumura iroh qophaa'eera
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID ma naannoo ({ $url }) tiin maxxanfame
msg-identity-not-published = Eenyummaan interneetii irraa hin argamne — yoo ma naannoo irratti fe'ame, '.ma [port]' itti aansuun '/my/identity!publish @ma' oofaa. Bal'ina argachuuf '.help/publish' barreessi.
msg-blocked = ⊗ uggurame [{ $cap }]: { $from }
msg-focus-cleared = xiyyeeffannoon qulqullaa'e
msg-focusing = { $did } gara { $prompt }tti xiyyeeffachaa jira
msg-set = { $path }: { $value }
msg-deleted = { $path } haaqame ({ $count } galmeewwan)
msg-read-only = { $path } dubbisuu qofa
msg-subtree-set = { $path } imitee dha; kaa'uu diduu
msg-ancestor-leaf = abbaa haadha { $path } dahoo dha; haguuguu diduu
msg-key-not-found = furtuun hin argamne: { $path }
msg-no-match = walfakkaataan hin jiru
msg-link-not-connected = dogoggora harkifannaa liinkii: walitti hin hidhamne
msg-link-fetch-error = dogoggora harkifannaa liinkii: { $e }
msg-link-key-not-found = furtuun `{ $key }` galmee walitti hidhametti hin argamne

# ── Mirkaneessaa moggaasa ─────────────────────────────────────────────────
err-alias-name-empty = maqaan moggaasaa duwwaa ta'uu hin danda'u
err-alias-has-dot = maqaalee moggaasaa '.' qabaachuu hin danda'an
err-alias-has-fragment = maqaalee moggaasaa '#' qabaachuu hin danda'an
err-alias-value-fragment = gatiin moggaasaa bare did:ma:<ipns> ta'uu qaba (fragment hin qabu)
err-alias-value-path = gatiin moggaasaa bare did:ma:<ipns> ta'uu qaba (path hin qabu)
err-alias-not-did = gatiin moggaasaa did:ma: irraa eegaluu qaba
err-unknown-alias = moggaasi beekamu hin jiru: @{ $name }
err-bare-did = bare did:ma:<ipns> eegama ture (fragment ykn path hin qabu), { $did } argame

# ── Sirreessaa ────────────────────────────────────────────────────────────
btn-save = olkaa'i
btn-eval = raawwadhu
btn-cancel = dhiisi
btn-close = cufii
btn-reply = deebisi
btn-publish = maxxansi
btn-publish-ipld = maxxansi IPLD
msg-reply-sent = deebiin ergameera
msg-reply-failed = deebiin hin milkaa'ne: { $e }
msg-entity-publish-sent = entity { $name }: maxxansiin ergameera
msg-entity-publish-failed = maxxansiin entity hin milkaa'ne: { $e }
msg-kind-publish-failed = maxxansi gosa kufe: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: maxxansiin ergameera
msg-field-publish-failed = maxxansiin dirree hin milkaa'ne: { $e }
msg-acl-publish-sent = runtime ACL: maxxansiin ergameera
msg-crud-edit-publish-sent = { $path }: maxxansiin ergameera
msg-acl-publish-failed = maxxansiin runtime ACL hin milkaa'ne: { $e }
msg-yaml-error = dogoggora YAML: { $e }
msg-editor-saved = { $path }:olkaa'i
msg-fetch-review = { $cid } fiddame — raawwachuu dura ilaali
msg-fetch-failed = { $cid } fiduu: { $e }

# ── Gochaalee — fuudhaa ergaa ─────────────────────────────────────────────
inbox-empty = fuudhaa ergaan duwwaadha
inbox-entry-not-found = galmeen fuudhaa ergaa { $n } hin argamne
inbox-no-message-id = galmeen fuudhaa ergaa { $n } message_id hin qabu
inbox-no-verb = gochan `{ $verb }` galmee fuudhaa ergaa { $n }f hin jiru
inbox-filter-no-arg = filtarrichi DID ykn alias barbaada
inbox-filter-empty = ergaan { $did } irraa hin jiru

# ── Gochaalee — yeroo hojii ───────────────────────────────────────────────
discover-fetch-failed = argannoon { $url }: { $e } irratti hin milkaa'ne
discover-json-error = argannoon hin milkaa'ne: JSON dogongoraa { $url }: { $e } irraa
discover-missing-did = argannoon hin milkaa'ne: status.json dirree `did` hin qabu
discover-invalid-did = argannoon hin milkaa'ne: `did` did:ma: irraa eegaluu qaba, `{ $did }` argame
discover-no-endpoint = gorsa argannoo: `endpoint_id` status.json keessa hin jiru; DID qofa kuufame
discover-success = ma { $url } irratti argame
discover-did-line = DID: { $did }
discover-alias-hint =   maqaa gorsaa @ma uumame — eenyummaa kee maxxansuuf '/my/identity!publish @ma' oofaa.
claim-success = Runtime { $did }f fudhatame
claim-conflict = Runtime eenyummaa biroon duraan fudhatameera
claim-http-failed = fudhachuu hin milkaa'ne: HTTP { $status }
claim-error = fudhachuu hin milkaa'ne: { $e }
claim-no-session = hin seenne; runtime fudhachuuf jalqaba seeni
runtime-no-verb = gochan `{ $verb }` { $path }f hin jiru

# ── Gochaalee — ACL ───────────────────────────────────────────────────────
acl-reset = /my/acl deebi'ee qindaa'e (guutummaatti banaa)
acl-persist-error = dogoggora kuusaa: { $e }
acl-no-verb = gochan `{ $verb }` /my/aclf hin jiru

# ── Gochaalee — eenyummaa ─────────────────────────────────────────────────
publish-usage = fayyadamuu: /my/identity!publish <did-ykn-moggaasa>
identity-exported = Bundle garagalche { $filename }
identity-export-failed = Baasuun hin dandeenye: { $e }

# ── Gochaalee — galmeelee ─────────────────────────────────────────────────
doc-content-empty = { $path }/content duwwaadha
doc-save-first = { $path }/content duwwaadha — jalqaba olkaa'i
doc-missing-name = maqaan galmee hin jiru
doc-publish-usage = fayyadamuu: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = fayyadamuu: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = maxxansuu { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = gaaffiin kuusaa ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-ipld-store-sent = gaaffiin kuusaa IPLD ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-fetch-done = { $cid } fiddame → { $path }/content (raawwatamuu dide)
doc-fetch-failed = { $cid } fiduu: { $e }
doc-fetch-usage = fayyadamuu: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid hin qindaa'ne
doc-no-verb = gochan `{ $verb }` { $path }f hin jiru
path-no-verb = gochan `{ $verb }` { $path }f hin jiru

# ── Gargaarsa — mataa dureelee ────────────────────────────────────────────
help-header-zion = ── ajajoota zion ──────────────────────────────────────────────────────────
help-header-messaging = ── ergaa erguuf ──────────────────────────────────────────────────────────
help-header-focus = ── moodii xiyyeeffannoo ─────────────────────────────────────────────────
help-header-config = ── giiraama qindaa'ina naannoo ──────────────────────────────────────────
help-header-common = ── karaalee waliigalaa ────────────────────────────────────────────────────
help-header-inbox = ── fuudhaa ergaa ───────────────────────────────────────────────────────────
help-header-documents = ── galmeelee ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Gargaarsa — ajajoota zion ─────────────────────────────────────────────
help-cmd-help =   .help                        barruu kana
help-cmd-clear =   .clear                       terminal qulqulleessi
help-cmd-panic =   .panic                       karaa dhumaa — rakkoo yoo mudateef fayyadami
help-cmd-history =   .history                     seenaa ajajaa (irra deddeebi'iinsa walitti-aanaa walitti-qabame)
help-cmd-logout =   .logout                      bahu
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Gargaarsa — ergaa erguuf ──────────────────────────────────────────────
help-msg-echo =   @alias                       DID hiikame agarsiisi (ergaan hin ergamu)
help-msg-send =   @alias[:verb] body           ergaa / RPC ergaan seera taphataan
help-msg-fragment =   @alias#fragment[:verb] body  fragment DID ifaa wajjin ergi
help-msg-escape =   \@name                       @name dhugaa (moggaasni hin barbaadamu)

# ── Gargaarsa — moodii xiyyeeffannoo ─────────────────────────────────────
help-focus-set =   .use @alias [as @name]       taphataan xiyyeeffadhu (prompt jijjiira)
help-focus-clear =   .use                         xiyyeeffannoo qulqulleessi

# ── Gargaarsa — giiraama qindaa'inaa ─────────────────────────────────────
help-config-get =   .path                        gatii dahoo argadhu ykn imitee tarreessi
help-config-filter =   .path value                  gaaffii deebisi (gatiidhaan shaakali)
help-config-set =   .path: value                 dahoo qindi'i
help-config-delete =   .path:                       dahoo ykn imitee haaqama
help-config-verb =   .path!verb [args]            gochaa naannoo waami

# ── Gargaarsa — karaalee waliigalaa ──────────────────────────────────────
help-my =   /my                          qindaa'ina dhuunfaa hunda agarsiisi
help-aliases =   /my/aliases                  moggaasalee tarreessi
help-aliases-set =   /my/aliases/<name>: <did>    moggaasa ida'i/haaromsi (bare DID, #fragment hin qabu)
help-aliases-del =   /my/aliases/<name>:          moggaasa haaqami
help-runtime-discover =   .ma [port]          runtime naannoo argadhu kaanis moggaasa @ma uumi
help-runtime-claim =   .ma [port]             DID keetiin runtime fudhadhu
help-identity =   /my/identity                 qindaa'ina eenyummaa agarsiisi
help-identity-did =   /my/identity/did             DID kee agarsiisi (dubbisuu qofa)
help-identity-publish =   /my/identity!publish @pub    tajaajiila maxxansaa dhaan DID maxxansi
help-identity-export =   /my/identity!export          bundle eenyummaa kee buufadhu
help-config-path =   .config                      galmeewwan .config.* hunda agarsiisi

# ── Gargaarsa — fuudhaa ergaa ─────────────────────────────────────────────
help-inbox =   /my/inbox                    fuudhaa ergaa tarreessi (mul'ata imitee)
help-inbox-n =   /my/inbox/N                  dirreelee galmee N agarsiisi
help-inbox-from =   /my/inbox/N/from             DID ergaa galmee N
help-inbox-reply =   /my/inbox/N!reply [body]     deebii ergi (qaamni hin jiru yoo ta'e sirreessaan banama)
help-inbox-open =   /my/inbox/N!open             qabiyyee dubbisuu qofa sirreessaatti bani
help-inbox-del =   /my/inbox/N:                 galmee N haaqami
help-inbox-delall =   /my/inbox:                   galmeewwan fuudhaa ergaa hunda haaqami
help-inbox-flush =   /my/inbox!flush              galmeewwan hunda terminalitti maxxansi
help-inbox-filter =   /my/inbox!filter @who        galmeewwan @who irraa qofa agarsiisi
help-inbox-traverse =   /my/inbox/N/sender/<field>   galmee DID ergaa erganii lolasaan saagi

# ── Gargaarsa — galmeelee ─────────────────────────────────────────────────
help-doc-edit =   /my/doc/<name>!edit           sirreessaa qabiyyee kuufameen bani
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     CID fidii, ilaluuf qofa bani
help-doc-eval =   /my/doc/<name>!eval           qabiyyee kuufame sareen raawwadhu
help-doc-publish =   /my/doc/<name>!publish @pub   blob hin safaramin ta'uun kuufi (gosa kamiyyuu)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  YAML huccuu IPLD DAG-CBOR ta'uun kuufi
help-doc-fetch =   /my/doc/<name>!fetch <cid>    qabiyyee CID galchi (raawwachuu hin dandaa'u)
help-doc-cid =   /my/doc/<name>!cid            CID kuufame agarsiisi
help-doc-del =   /my/doc/<name>:              galmee haaqami

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Afaanota jiran (/my/i18n: <code> tiin qabi):
err-lang-not-found = afaan hin argamne: { $lang }

msg-send-failed = ergaa erguun hin milkoofne: { $e }
msg-not-logged-in = seenee hin jiru

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Dogoggora YAML: { $e }
yaml-not-mapping = YAML mapping (pair furtuun: gatii) ta'uu qaba; barreeffama duwwaa fi scalar DAG-CBOR ta'ee kuusuu hin danda'u
dagcbor-encode-error = Dogoggora DAG-CBOR: { $e }
cbor-decode-error = Dogoggora CBOR: { $e }
cbor-json-error = Dogoggora CBOR gara JSON: { $e }
yaml-serialize-error = Dogoggora serialization YAML: { $e }
edit-reply-invalid = Deebii gulaala dogoggoraa
doc-publish-ipld-error = Maxxansuu IPLD kufe: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Dogoggora galmeessuu inbox: { $e }
err-config-load = Dogoggora fe'umsaa: { $e }
err-lang-persist = Dogoggora qusachuu afaan: { $e }
err-history-parse = Dogoggora falanqaynta seenaa: { $e }
err-history-load = Dogoggora fe'umsaa seenaa: { $e }
err-ipfs-reply-decode = Deebii IPFS decode kufe: { $e }
err-edit-cbor = Dogoggora gulaala CBOR: { $e }
err-popup-blocked = Popup daldhaame birauzaraan
status-publishing = maxxansuu

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = dogoggora
rpc-error-detail = dogoggora: { $detail }
msg-new-message = ← [{ $from }] ergaa haaraa — { $count } sanduuqa
msg-chat = { $sender } jedha { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } jedha { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } gara kutaa seene.
room-leave = * { $name } kutaa gadhiise.
room-drop  = * { $name } { $thing } harkaa buuse.
room-take  = * { $name } { $thing } fudhate.
err-edit-decode-failed = gulaala: dogoggora hiikuu: { $e }
err-edit-fetch-failed = gulaala: dogoggora fida: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = waltajjii hojii hin jiru — profaayilii haaquu hin danda'amu
profile-delete-error = haaquun profaayilii hin milkoofne: { $e }
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
profiles-empty = (hin jiru)
profiles-deleted = profaayilii { $name } haqame
profiles-not-found = profaayilii hin argamne: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help/msg                    messaging
help-topic-focus =   .help/focus                  focus mode
help-topic-path =   .help/path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help/inbox                  inbox
help-topic-doc =   .help/doc                    documents
help-topic-actor =   .help/actor                  remote actor
help-unknown-topic =   .help/{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
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

help-topic-url =   .help/url                    zion URL link tiin banuu
help-header-url = ── ulaagalee URL ────────────────────────────────────────────────────────────────
help-url-intro =   Fuullee itti sirraa'e wajjin zion banu link qoodi:
help-url-msg =   ?msg=<did>                   dursee guuti: @<did> (ergaa salphaa)
help-url-say =   ?say=<did>                   dursee guuti: @<did>:say (jechi say)
help-url-emote =   ?emote=<did>                 dursee guuti: @<did>:emote (jechi emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Galchi guutameera garuu hin ergamne — erguu Enter tuqi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                eenyummaa kee networki irratti maxxansi
help-header-publish = ── eenyummaa maxxansuu ──────────────────────────────────────────────────────
help-publish-intro = Maxxansuun eenyummaa kee networki irratti argamuu danda'u taasisa. Namoota biroo DID kee barbaaduun si argachuu danda'u.
help-publish-ma = Maxxansuuf, ma (runtime naannoo) fe'amuu qaba. Ego fi IPFS/IPNS si bakka buusee walitti hidha.
help-publish-steps = Tartiiba: ma naannoo argachuuf '.ma [port]' oofaa, itti aansuun '/my/identity!publish @ma'.
help-publish-without = Maxxansuu malee namooni biroon si dhaqqabuu hin danda'an — DID kee beekaniiyyuu endpoint kee furuuf dandeetii hin qaban.
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
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
scheme-cid-fetch-error = CID { $cid } fudhatuu dadhabame: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID sirrii miti: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Gorgorsiisa: Furtuun IPNS dhuunfaa keessan runtime kanaatti ergama eenyummaa maxxansuu. Fuula runtime amannu qofa fayyadamaa.
