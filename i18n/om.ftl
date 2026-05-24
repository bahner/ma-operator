# zion — Afaan Oromoo
lang-name = Afaan Oromoo

# ── Fuula seensaa ─────────────────────────────────────────────────────────
tab-login = seeni
tab-new-identity = eenyummaa haaraa
tab-import = galchi
label-passphrase = jecha icciitii
label-username = maqaa fayyadamaa
label-confirm-passphrase = jecha icciitii mirkaneessi
btn-login = seeni
btn-export = baasi
btn-generate = uumi
passphrase-warning = Jecha icciitii dhabuu = eenyummaa dhabuu. Deebii hin jiru.
import-help = Faayilii .zion.json baafame filadhu. Kuusaan icciitii ta'ee jira.
status-unlocking = banamaa jira...
status-generating = eenyummaa uumamaa jira...
status-reading-file = faayilii dubbifamaa jira...
status-imported = '{ $name }' galame — gara taabii seensaatti deebi'i
error-wrong-passphrase = jecha icciitii dogoggore: { $e }
error-identity-not-found = eenyummaan '{ $name }' hin argamne
error-username-required = maqaa fayyadamaa barbaachisaa dha
error-passphrase-required = jecha icciitii barbaachisaa dha
error-passphrases-no-match = jechoonni icciitii wal hin simne

# ── Ergaalee sirna terminal ───────────────────────────────────────────────
msg-logged-in = zion v{ $version } — akka { $username }tti seenameera
msg-type-help = Tarree ajajootaaf .help barreessi.
msg-connecting = iroh walitti hidhamaa...
msg-iroh-ready = xumura iroh qophaa'eera
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = deebiin ergameera
msg-reply-failed = deebiin hin milkaa'ne: { $e }
msg-entity-publish-sent = entity { $name }: maxxansiin ergameera
msg-entity-publish-failed = maxxansiin entity hin milkaa'ne: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: maxxansiin ergameera
msg-field-publish-failed = maxxansiin dirree hin milkaa'ne: { $e }
msg-acl-publish-sent = runtime ACL: maxxansiin ergameera
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

# ── Gochaalee — yeroo hojii ───────────────────────────────────────────────
discover-fetch-failed = argannoon { $url }: { $e } irratti hin milkaa'ne
discover-json-error = argannoon hin milkaa'ne: JSON dogongoraa { $url }: { $e } irraa
discover-missing-did = argannoon hin milkaa'ne: status.json dirree `did` hin qabu
discover-invalid-did = argannoon hin milkaa'ne: `did` did:ma: irraa eegaluu qaba, `{ $did }` argame
discover-no-endpoint = gorsa argannoo: `endpoint_id` status.json keessa hin jiru; DID qofa kuufame
discover-success = ma { $url } irratti argame
discover-did-line = DID: { $did }
discover-alias-hint =   moggaasi @ma uumame — maxxansi: .my.identity:publish @ma
claim-success = Runtime { $did }f fudhatame
claim-conflict = Runtime eenyummaa biroon duraan fudhatameera
claim-http-failed = fudhachuu hin milkaa'ne: HTTP { $status }
claim-error = fudhachuu hin milkaa'ne: { $e }
claim-no-session = hin seenne; runtime fudhachuuf jalqaba seeni
runtime-no-verb = gochan `{ $verb }` { $path }f hin jiru

# ── Gochaalee — ACL ───────────────────────────────────────────────────────
acl-reset = .my.acl deebi'ee qindaa'e (guutummaatti banaa)
acl-persist-error = dogoggora kuusaa: { $e }
acl-no-verb = gochan `{ $verb }` .my.aclf hin jiru

# ── Gochaalee — eenyummaa ─────────────────────────────────────────────────
publish-usage = fayyadamuu: .my.identity:publish <did-ykn-moggaasa>

# ── Gochaalee — galmeelee ─────────────────────────────────────────────────
doc-content-empty = { $path }.content duwwaadha
doc-save-first = { $path }.content duwwaadha — jalqaba olkaa'i
doc-missing-name = maqaan galmee hin jiru
doc-publish-usage = fayyadamuu: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = fayyadamuu: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = maxxansuu { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = gaaffiin kuusaa ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-ipld-store-sent = gaaffiin kuusaa IPLD ergame ({ $id }) → { $publisher }; CID deebii RPC dhaan dhufa
doc-fetch-done = { $cid } fiddame → { $path }.content (raawwatamuu dide)
doc-fetch-failed = { $cid } fiduu: { $e }
doc-fetch-usage = fayyadamuu: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid hin qindaa'ne
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
help-cmd-logout =   .logout                      bahu

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
help-config-verb =   .path:verb [args]            gochaa naannoo waami

# ── Gargaarsa — karaalee waliigalaa ──────────────────────────────────────
help-my =   .my                          qindaa'ina dhuunfaa hunda agarsiisi
help-aliases =   .my.aliases                  moggaasalee tarreessi
help-aliases-set =   .my.aliases.<name>: <did>    moggaasa ida'i/haaromsi (bare DID, #fragment hin qabu)
help-aliases-del =   .my.aliases.<name>:          moggaasa haaqami
help-runtime-discover =   .my.ma:discover          runtime naannoo argadhu kaanis moggaasa @ma uumi
help-runtime-claim =   .my.ma:claim             DID keetiin runtime fudhadhu
help-identity =   .my.identity                 qindaa'ina eenyummaa agarsiisi
help-identity-did =   .my.identity.did             DID kee agarsiisi (dubbisuu qofa)
help-identity-publish =   .my.identity:publish @pub    tajaajiila maxxansaa dhaan DID maxxansi
help-config-path =   .config                      galmeewwan .config.* hunda agarsiisi

# ── Gargaarsa — fuudhaa ergaa ─────────────────────────────────────────────
help-inbox =   .my.inbox                    fuudhaa ergaa tarreessi (mul'ata imitee)
help-inbox-n =   .my.inbox.N                  dirreelee galmee N agarsiisi
help-inbox-from =   .my.inbox.N.from             DID ergaa galmee N
help-inbox-reply =   .my.inbox.N:reply [body]     deebii ergi (qaamni hin jiru yoo ta'e sirreessaan banama)
help-inbox-open =   .my.inbox.N:open             qabiyyee dubbisuu qofa sirreessaatti bani
help-inbox-del =   .my.inbox.N:                 galmee N haaqami
help-inbox-delall =   .my.inbox:                   galmeewwan fuudhaa ergaa hunda haaqami
help-inbox-flush =   .my.inbox:flush              galmeewwan hunda terminalitti maxxansi
help-inbox-traverse =   .my.inbox.N.sender.<field>   galmee DID ergaa erganii lolasaan saagi

# ── Gargaarsa — galmeelee ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           sirreessaa qabiyyee kuufameen bani
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID fidii, ilaluuf qofa bani
help-doc-eval =   .my.doc.<name>:eval           qabiyyee kuufame sareen raawwadhu
help-doc-publish =   .my.doc.<name>:publish @pub   blob hin safaramin ta'uun kuufi (gosa kamiyyuu)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML huccuu IPLD DAG-CBOR ta'uun kuufi
help-doc-fetch =   .my.doc.<name>:fetch <cid>    qabiyyee CID galchi (raawwachuu hin dandaa'u)
help-doc-cid =   .my.doc.<name>:cid            CID kuufame agarsiisi
help-doc-del =   .my.doc.<name>:              galmee haaqami

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Afaanota jiran (.my.i18n: <code> tiin qabi):
err-lang-not-found = afaan hin argamne: { $lang }

msg-send-failed = ergaa erguun hin milkoofne: { $e }
msg-not-logged-in = seenee hin jiru
