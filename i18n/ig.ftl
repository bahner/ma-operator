# zion — Igbo
lang-name = Igbo

# ── Ibe ịbanye ────────────────────────────────────────────────────────────
tab-login = banye
tab-new-identity = njirimara ọhụrụ
tab-import-profile = bubatuo profaịl
label-passphrase = okwu nzuzo
label-username = aha onye ọrụ
label-confirm-passphrase = gosi okwu nzuzo
label-did = DID
label-profile-cid = CID profaịl
label-or-file = ma ọ bụ faịl
btn-login = banye
btn-export = pụta
btn-generate = mepụta
btn-new-endpoint = ọnụ ụzọ ọhụrụ
btn-import-profile = bubatuo profaịl
passphrase-warning = Ịhapụ okwu nzuzo = ịhapụ njirimara. Ọ dịghị iweghachi.
import-profile-help = Bubatuo profaịl site na CID ma ọ bụ faịl. Ị chọrọ igodo ahụ ị jiri mgbe ị bipụtara.
import-profile-detected-user = Profaịl bụ nke: { $name }
status-unlocking = na-emeghe...
status-generating = na-emepụta njirimara...
status-reading-file = na-agụ faịlụ...
status-fetching-profile = na-enweta profaịl site na IPFS...
status-imported = atinyere '{ $name }' — gaa tab ịbanye
status-importing-profile = na-abudata profaịl...
profile-import-done = etinyela profaịl maka '{ $name }' — { $n } igodo abudata
error-wrong-passphrase = okwu nzuzo ezighi ezi: { $e }
error-identity-not-found = achịghị njirimara '{ $name }'
error-username-required = aha onye ọrụ dị mkpa
error-passphrase-required = okwu nzuzo dị mkpa
error-passphrases-no-match = okwu nzuzo abụọ adabaghị
error-profile-source-required = nye CID ma ọ bụ bulite faịl
error-did-required = tinye DID gị
error-profile-fetch = enweghị ike ịnweta profaịl: { $e }
error-profile-no-username = profaịl enweghị aha onye ọrụ
error-profile-no-identity = identity '{ $name }' ahụghị — bubatuo identity nke mbụ

# ── Ozi sistemụ terminal ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — abanyela dị ka { $username }
msg-type-help = Pịnye .help maka ndepụta iwu.
msg-connecting = na-ejikọ na iroh...
msg-iroh-ready = ọhere iroh dị njikere
msg-iroh-failed = iroh: { $e }
msg-auto-published = Ebipụtara DID site na ma mpaghara ({ $url })
msg-ma-connecting-matrix = na-agbalị ijikọ gị na 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = akwụtara 間 mpaghara
msg-local-ma-already-claimed = akwụtalarị 間 mpaghara
msg-local-ma-claim-failed = akwụtaghị 間 mpaghara
msg-identity-not-published = Atụfuọla njirimara n'ịntanetị — ọ bụrụ na ma edepụtara n'ebe obibi, bido '.ma [port]' wee mee '.my.identity!publish @ma'. Dee '.help/publish' maka nkọwa.
msg-blocked = ⊗ ewepụtara [{ $cap }]: { $from }
msg-focus-cleared = ewepụtara ntụleanya
msg-focusing = na-etinye uche na { $did } dị ka { $prompt }
msg-set = { $path }: { $value }
msg-deleted = ehichapụrụ { $path } ({ $count } ndepụta)
msg-read-only = { $path } bụ maka ịgụ naanị
msg-subtree-set = { $path } bụ alaka; ọ jụrụ ịtọ
msg-ancestor-leaf = nna nna { $path } bụ ọhụrụ; ọ jụrụ ikpuchi
msg-key-not-found = achịghị igodo: { $path }
msg-no-match = enweghị ihe dabara
msg-link-not-connected = njehie ịnweta njikọ: ejikọghị
msg-link-fetch-error = njehie ịnweta njikọ: { $e }
msg-link-key-not-found = achịghị igodo `{ $key }` n'akwụkwọ ejikọrọ

# ── Nkwado aha nchọkwa ─────────────────────────────────────────────────────
err-alias-name-empty = aha nchọkwa enweghị ike ịbụ efu
err-alias-has-dot = aha nchọkwa enweghị ike inwe '.'
err-alias-has-fragment = aha nchọkwa enweghị ike inwe '#'
err-alias-value-fragment = uru nchọkwa nwere ike ịnwe naanị otu fragment DID-URL na-adịghị efu
err-alias-value-path = uru nchọkwa ga-abụ did:ma:<ipns> DID ma ọ bụ DID-URL (enweghị ụzọ)
err-alias-not-did = uru nchọkwa ga-amalite na did:ma:
err-unknown-alias = nchọkwa amaghị: @{ $name }
err-bare-did = a tọọ bare did:ma:<ipns> (enweghị fragment ma ọ bụ path), nwetara { $did }

# ── Onye ndezi ────────────────────────────────────────────────────────────
btn-save = chekwaa
btn-eval = rụọ ọrụ
btn-cancel = kagbuo
btn-close = mechie
btn-reply = zaghachi
btn-publish = bipụta
btn-publish-ipld = bipụta IPLD
msg-reply-sent = ezitela ọzaghachi
msg-reply-failed = ọzaghachi erughị: { $e }
msg-entity-publish-sent = entity { $name }: ezitela ịbipụta
msg-entity-publish-failed = ịbipụta entity erughị: { $e }
msg-kind-publish-failed = ịpụta ụdị dara ada: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ezitela ịbipụta
msg-field-publish-failed = ịbipụta ngalaba erughị: { $e }
msg-acl-publish-sent = runtime ACL: ezitela ịbipụta
msg-crud-edit-publish-sent = { $path }: ezitela ịbipụta
msg-acl-publish-failed = ịbipụta runtime ACL erughị: { $e }
msg-yaml-error = njehie YAML: { $e }
msg-editor-saved = { $path }:chekwaa
msg-fetch-review = enwetara { $cid } — lelee tupu ịrụ ọrụ
msg-fetch-failed = ịnweta { $cid }: { $e }

# ── Ọrụ — igbe ozi ────────────────────────────────────────────────────────
inbox-empty = igbe ozi di efu
inbox-entry-not-found = achịghị ndepụta igbe ozi { $n }
inbox-no-message-id = ndepụta igbe ozi { $n } enweghị message_id
inbox-no-verb = enweghị ọrụ `{ $verb }` maka ndepụta igbe ozi { $n }
inbox-filter-no-arg = filter chọrọ arụmụka DID ma ọ bụ alias
inbox-filter-empty = enweghị ozi sitere na { $did }

# ── Ọrụ — oge ọrụ ─────────────────────────────────────────────────────────
discover-fetch-failed = nchọpụta erughị na { $url }: { $e }
discover-json-error = nchọpụta erughị: JSON na-ezighị ezi si { $url }: { $e }
discover-missing-did = nchọpụta erughị: status.json enweghị ngalaba `did`
discover-invalid-did = nchọpụta erughị: `did` ga-amalite na did:ma:, nwetara `{ $did }`
discover-no-endpoint = ọdịmara nchọpụta: `endpoint_id` dịghị na status.json; echekwara DID naanị
discover-hint-endpoint-not-found = Ndụmọdụ: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Ndụmọdụ: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Ndụmọdụ: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Ndụmọdụ: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = achọpụtara ma na { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   emepụtara alias @ma — mee '.my.identity!publish @ma' iji bipute njirimara gị.
claim-success = akwụtara Runtime maka { $did }
claim-conflict = njirimara ọzọ akwụtara Runtime otu oge
claim-already-owned = njirimara a akwụtalarị Runtime
claim-http-failed = ikwu akwụ erughị: HTTP { $status }
claim-error = ikwu akwụ erughị: { $e }
claim-no-session = abanyeghị; banye ka ọ bụrụ nke mbụ iji kwu akwụ runtime
runtime-no-verb = enweghị ọrụ `{ $verb }` maka { $path }

# ── Ọrụ — ACL ─────────────────────────────────────────────────────────────
acl-reset = etọghachiri .my.acl (mepee kpamkpam)
acl-persist-error = njehie echekwa: { $e }
acl-no-verb = enweghị ọrụ `{ $verb }` maka .my.acl

# ── Ọrụ — njirimara ───────────────────────────────────────────────────────
publish-usage = ojiji: .my.identity!publish <did-ma-ọ-bụ-nchọkwa>
identity-exported = A budata bundle dị ka { $filename }
identity-export-failed = Nbupu enweghị ike: { $e }

# ── Ọrụ — akwụkwọ ────────────────────────────────────────────────────────
doc-content-empty = { $path }.content di efu
doc-save-first = { $path }.content di efu — chekwaa ka ọ bụrụ nke mbụ
doc-missing-name = aha akwụkwọ hapụrụ
doc-publish-usage = ojiji: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = ojiji: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ịbipụta { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = mbipụta dara [{ $code }]: { $err }
doc-publish-error-hint = Ndụmọdụ: { $hint }
doc-publish-hint-session = banye ọzọ ka ego wee nweta igodo njirimara gị
doc-publish-hint-target = jiri ezigbo onye nkwusa DID ma ọ bụ utu aha kpebiri ịgbara 57
doc-publish-hint-network = nyochaa oge ọsọ 7 na 22 nwere ike iru, wee nwaa ọzọ
doc-publish-hint-resolve = gosi na ebipụtara akwụkwọ DID onye mbipụta ma nwee ebe njedebe enwere ike iru
doc-publish-hint-acl = Rịọ onye ọrụ mbipụta ka o kwe ka emee gị na 48
doc-publish-hint-runtime = Oge ojiri gaa/ngwa mgbakwunye jụrụ arịrịọ ahụ; nyochaa ihe kpatara ya wee nwaa mgbe edozichara ihe / oge ojiri gaa
doc-publish-hint-ipfs = lelee ahụike 12/17 mpaghara yana ọkwa oge ojiri gaa
doc-publish-hint-unknown = lelee ndekọ oge ojiri gaa maka ihe kpatara ya wee nwaa ọzọ
doc-store-sent = ezitela arịrịọ echekwa ({ $id }) → { $publisher }; CID ga-abịa site na ọzaghachi RPC
doc-ipld-store-sent = ezitela arịrịọ echekwa IPLD ({ $id }) → { $publisher }; CID ga-abịa site na ọzaghachi RPC
doc-fetch-done = enwetara { $cid } → { $path }.content (arụghị ọrụ)
doc-fetch-failed = ịnweta { $cid }: { $e }
doc-fetch-usage = ojiji: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = atọghị { $path }.cid
doc-no-verb = enweghị ọrụ `{ $verb }` maka { $path }
path-no-verb = enweghị ọrụ `{ $verb }` maka { $path }

# ── Enyemaka — isi ────────────────────────────────────────────────────────
help-header-zion = ── iwu zion ──────────────────────────────────────────────────────────────
help-header-messaging = ── ịziga ozi ─────────────────────────────────────────────────────────────
help-header-config = ── nhazi grammar ebe obibi ──────────────────────────────────────────────
help-header-common = ── ụzọ a na-ejikarị ─────────────────────────────────────────────────────
help-header-inbox = ── igbe ozi ─────────────────────────────────────────────────────────────
help-header-documents = ── akwụkwọ ─────────────────────────────────────────────────────────────
help-header-i18n = ── asụsụ ──────────────── ───────────────
help-header-ma = ── 3-oghere ─────────────── ───────────────
help-header-ma-entry = ── na-abanye 間-ohere ─────────────── ────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Enyemaka — iwu zion ───────────────────────────────────────────────────
help-cmd-help =   .help                        ederede a
help-cmd-clear =   .clear                       kpochaa terminal
help-cmd-panic =   .panic                       ụzọ ikpeazụ — jiri ya mgbe ị nọ n'nsogbu
help-cmd-history =   .history                     akụkọ ihe mere (ndị mwepụta n'usoro jikọtara)
help-cmd-logout =   .logout                      pụọ
help-cmd-batch =   .batch                       evaluasi dokumen coretan secara paralel
help-cmd-batch-sync =   .batch:sync / .batch         evaluasi dokumen coretan baris demi baris

# ── Enyemaka — ịziga ozi ──────────────────────────────────────────────────
help-msg-echo =   @alias                       gosi DID/DID-URL e dozierela (ezigaghị ozi)
help-msg-send =   @alias!msg body / @alias:verb args           ziga ozi / RPC na onye na-eme ihe
help-msg-fragment =   @alias#fragment:verb body  ziga na nchọkwa nwere fragment DID ọkụkọ
help-msg-escape =   \@name                       @name n'okwu n'okwu (ọ chọghị nchọkwa)

# ── Enyemaka — ọnọdụ ntụleanya ───────────────────────────────────────────

# ── Enyemaka — nhazi grammar ──────────────────────────────────────────────
help-config-get =   .path                        nweta uru ọhụrụ ma ọ bụ depụta alaka
help-config-filter =   .path value                  dakọta arịrịọ (isi n'uru)
help-config-set =   .path: value                 tọ ọhụrụ
help-config-delete =   .path:                       hichapụ ọhụrụ ma ọ bụ alaka
help-config-verb =   .path!verb [args]            kpọọ ọrụ obibi

# ── Enyemaka — ụzọ a na-ejikarị ──────────────────────────────────────────
help-my =   .my                          gosi nhazi nke onwe gị niile
help-aliases =   .my.aliases                  depụta nchọkwa
help-aliases-set =   .my.aliases.<name>: <did-url>    tinye/melite nchọkwa (DID ma ọ bụ DID-URL)
help-aliases-del =   .my.aliases.<name>:          wepu nchọkwa
help-runtime-discover =   .ma [port]          chọpụta runtime obibi ma mepụtakwa nchọkwa @ma
help-runtime-claim =   .ma [port]             kwụa akwụ runtime site na DID gị
help-identity =   .my.identity                 gosi nhazi njirimara
help-identity-did =   .my.identity.did             gosi DID gị (ịgụ naanị)
help-identity-publish =   .my.identity!publish @pub    bipụta DID site na ọrụ ịbipụta
help-identity-export =   .my.identity!export          budata bundle identity gị
help-config-path =   .config                      gosi ndepụta .config.* niile

# ── Enyemaka — igbe ozi ──────────────────────────────────────────────────
help-inbox =   .my.inbox                    depụta igbe ozi (nlele alaka)
help-inbox-n =   .my.inbox.N                  gosi ngalaba ndepụta N
help-inbox-from =   .my.inbox.N.from             DID onye zigara ndepụta N
help-inbox-reply =   .my.inbox.N!reply [body]     ziga ọzaghachi (meghe onye ndezi ọ bụrụ na ọ dịghị ahụ)
help-inbox-open =   .my.inbox.N!open             mepee ọdịnaya maka ịgụ naanị n'onye ndezi
help-inbox-del =   .my.inbox.N:                 hichapụ ndepụta N
help-inbox-delall =   .my.inbox:                   hichapụ ndepụta igbe ozi niile
help-inbox-flush =   .my.inbox!flush              bipụta ndepụta niile na terminal
help-inbox-filter =   .my.inbox!filter @who        gosi naanị ndepụta site na @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   gafee akwụkwọ DID onye zigara n'ụzọ nwayọọ

# ── Enyemaka — akwụkwọ ────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           mepee onye ndezi nwere ọdịnaya echekwara
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     nweta CID, mepee maka nlele naanị
help-doc-eval =   .my.doc.<name>!eval           rụọ ọdịnaya echekwara akara n'akara
help-doc-publish =   .my.doc.<name>!publish @pub   chekwaa dị ka blob ọhụrụ (ụdị ọ bụla)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  chekwaa YAML dị ka ọkpụrụkpụ IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    bawanye ọdịnaya CID (arụghị ọrụ)
help-doc-cid =   .my.doc.<name>!cid            gosi CID echekwara
help-doc-del =   .my.doc.<name>:              hichapụ akwụkwọ

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n na-echekwa mmasị asụsụ jikọtara na njirimara gị.
help-i18n-set = .my.i18n: <code>             họrọ asụsụ 20 na-eji maka njirimara a
help-i18n-list = .my.i18n!list               depụta koodu asụsụ dị

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Ụlọ 間 bụ oghere dị n’etiti njirimara 間. ma na-eme ka njirimara ndị a chọta ibe ha ma kwurịta okwu; mgbe e bipụtara njirimara gị, ị nwere ike isonye.
help-ma-command =   .ma [port]                   jikọọ na ma runtime nke mpaghara, gụọ /status.json, ma chekwaa .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     bipụta akwụkwọ DID gị ka ndị ọzọ nwee ike ịchọta igodo gị na endpoint gị
help-ma-security = Oke ntụkwasị obi kacha doo anya bụ ma runtime nke gị na IPFS Desktop/Kubo nke gị. Publisher dị anya nwere ike ịba uru, mana mgbe ahụ ị na-adabere na ọrụ onye ọzọ.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             otu esi abanye n’ụlọ 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Mgbe a maara njirimara gị, .enter @ma na-ahapụ gị ịbanye na 間. Chọta ụwa, banye na ya, sonye site n’ebe ahụ.
help-ma-entry-steps = Malite IPFS Desktop na ma, mgbe ahụ gbaa .ma. Bipụta site na .my.identity!publish @ma, chọta ụwa, banye na .enter @ma.
help-ma-entry-command =   .enter @ma                  banye na 間 site na @ma runtime
help-ma-entry-toggle =   .enter                       gbanye ma ọ bụ gbanyụọ nlebara anya ụlọ; njirimara gị ka na-arụ ọrụ
help-ma-entry-url =   ?enter=<runtime>             banye mgbe ị banyere site na URL ekekọrịtara

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Asụsụ ndị dị (.my.i18n: <code> were tọọ):
err-lang-not-found = asụsụ ahụ achọtaghị: { $lang }

msg-send-failed = izipu dara ada: { $e }
msg-not-logged-in = abanye ọ bụghị

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Njehie YAML: { $e }
yaml-not-mapping = YAML ga-abụ mapping (ọpọ igodo: ọnọdụ); edemede nkịtị na scalar enweghị ike idobe ya dị ka DAG-CBOR
dagcbor-encode-error = Njehie ndenye DAG-CBOR: { $e }
cbor-decode-error = Njehie denye CBOR: { $e }
cbor-json-error = Njehie CBOR→JSON: { $e }
yaml-serialize-error = Njehie serialization YAML: { $e }
edit-reply-invalid = Nzaghachi mmezi na-arụ ọrụ
doc-publish-ipld-error = Nkwuputa IPLD dara: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Njehie chekwa inbox: { $e }
err-config-load = Njehie nbudata nhazi: { $e }
err-lang-persist = Njehie chekwa asụsụ: { $e }
err-history-parse = Njehie nyochaa akụkọ ihe mere eme: { $e }
err-history-load = Njehie nbudata akụkọ ihe mere eme: { $e }
err-ipfs-reply-decode = Njehie denye azịza IPFS: { $e }
err-edit-cbor = Njehie mmezi CBOR: { $e }
err-popup-blocked = Browser egbochi popup
status-publishing = nkwupụta

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = njehie
rpc-error-detail = njehie: { $detail }
msg-new-message = ← [{ $from }] ozi ọhụrụ — { $count } n'igbe ozi
msg-chat = { $sender } si { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } kwuru { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } banyere n'ọnụ ụlọ.
room-leave = * { $name } pụọ n'ọnụ ụlọ.
room-drop  = * { $name } tụfuo { $thing }.
room-take  = * { $name } were { $thing }.
err-edit-decode-failed = dezie: ọdịda ntụgharị: { $e }
err-edit-fetch-failed = dezie: ọdịda nweta: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = enweghị nnọọ nọọọ — enweghị ike ihichapụ profaịlụ
profile-delete-error = ihichapụ profaịlụ dara ada: { $e }
profile-wrong-user = enweghị ike ịtọ 11 maka profaịlụ ọzọ - naanị nke gị
profile-wrong-user-name = enweghị ike ịtọ 11 maka 19 - naanị profaịlụ nke gị
profile-no-ma = Ọ dịghị 3 oge ojiri gaa ahazi-gbaa 31 mbụ
profile-no-cid = ọ dịghị 3 echekwara maka profaịlụ a — gba ọsọ 37 mbụ
profile-no-cid-in-doc = enweghị profaịlụ 11 achọtara na akwụkwọ DID - gbaa 43 mbụ
profile-publish-sent = e zoro profaịlụ ma zigara ya IPFS; a ga-emelite akwụkwọ DID mgbe CID bịara
profile-publish-done = ebipụtala profaịlụ — emelitela akwụkwọ DID na ma.agent CID
profile-publish-failed = mbipụta profaịlụ dara: 24
profile-fetch-done = profaịlụ ewepụtara - igodo 18 ebugoro na 43
profile-fetch-failed = Nweta profaịlụ dara ada: 22
msg-identity-exists = njirimara ebipụtalarị - profaịlụ ruo ugbu a
profile-import-exists = profaịlụ 8 adịlarị - buru ụzọ hichapụ ya
profile-import-wrong-user = faịlụ nwere profaịlụ 22, 42 tụrụ anya

# -- CID content operations
cid-op-binary = ọnụọgụ abụọ (anaghị egosipụta)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = enwetaghị ọdịnaya: 25
cid-op-unknown = arụmọrụ ọdịnaya amaghi ama: 27
cid-op-wc = Ahịrị { $lines } 18 okwu 36 chars
profiles-empty = (ọ dịghị)
profiles-deleted = profaịlụ { $name } ahichapụrụ
profiles-not-found = profaịlụ ahụghị: { $name }

# -- Help topics index
help-header-topics = -- topik -- ketik .help/<topic> untuk detail
help-topic-msg =   .help/msg                    pesan
help-topic-ma = .help/ma                     ma-oghere, mbipụta na ntinye
help-topic-path = .help/path                   Ụtọasụsụ ntụpọ-ụzọ mpaghara
help-topic-my =   .help/my                     config pribadi
help-topic-inbox =   .help/inbox                  kotak masuk
help-topic-doc =   .help/doc                    dokumen
help-topic-actor =   .help/actor                  actor jarak jauh
help-topic-zscheme =   .help/zscheme               inline Scheme expressions and docs
help-unknown-topic =   .help/{ $topic }: topik tidak dikenal

# -- Help actor section
help-header-actor = -- aktor jarak jauh
help-actor-echo =   @actor                       tampilkan DID yang diselesaikan
help-actor-text = @actor[#entity]!msg|!say|!emote body         zipu ozi ozugbo/ kparịta ụka/emomote
help-actor-ping = @actor:ping                  ping dị ndụ
help-actor-entities =   @actor/entities              daftar entitas
help-actor-entities-get = @actor/entities/<n>          nweta ọnụ ụlọ
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   ntọala site na ntụnye aka 14
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entitas
help-actor-entities-del = @actor/entities/<n>:         ihichapụ ihe
help-actor-config-get =   @actor/config/<key>          ambil nilai config
help-actor-config-set =   @actor/config/<key>: val     atur nilai config
help-actor-acl = @actor/acl                   nweta 4
help-actor-acl-edit =   @actor/acl!edit              dezie ACL
help-actor-fragment =   @actor#entity                kirim ke plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ke plugin
help-header-cid-ops = ── 3 oku omee ────────────── ───────────────
help-actor-cat = (@actor#entity:verb arg...)  kpọọ otu ụlọ ọrụ 15 site na 24 wee chere azịza ya
help-actor-head = (@actor/path)                weta ọdịnaya CRUD dịpụrụ adịpụ site na 31
help-actor-tail = (<bafy...>)                  gụnyere ma nyochaa 21 site na 36 41
help-actor-wc = (define x (@actor:verb arg))  debe nzaghachi 5 na gburugburu nnọkọ
help-actor-wc-l = .my.scheme.ma!edit           dezie ndị enyemaka 11 echekwara maka njirimara a

help-topic-url =   .help/url                    mepee zion site na njikọ URL
help-topic-i18n = .help/i18n                   mmasị asụsụ maka njirimara gị
help-header-url = ── ihe mmezi URL ────────────────────────────────────────────────────────────────
help-url-intro =   Kesaa njikọ imepee zion nwere onye nnata edebere:
help-url-msg =   ?msg=<did>                   deeye tupu: @<did>!msg (ozi dị mfe)
help-url-say =   ?say=<did>                   deeye tupu: @<did>!say (ngwa ọrụ say)
help-url-emote =   ?emote=<did>                 deeye tupu: @<did>!emote (ngwa ọrụ emote)
help-url-ma = ?ma=<did-or-url>              pre-mejuputa oge ojiri gaa DID / 23 URL
help-url-enter = ?enter=<runtime>             banye runtime ụwa mgbe nbanye
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ntinye edebere ọzọ ma ọ bụ na ezigheziela — pịa Enter ịziga.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                bipute njirimara gị na netwọk
help-header-publish = ── ibiputa njirimara ─────────────────────────────────────────────────────────
help-publish-intro = Ibibiputa na-eme ka a nọchie njirimara gị na netwọk. Ndị ọzọ nwere ike ịchọ DID gị iji kpọtụrụ gị.
help-publish-ma = Iji bipute, ọ dị mkpa ịnwe ma (runtime nke mpaghara) edepụtara. Ọ na-ejikọta ego na IPFS/IPNS n'aha gị.
help-publish-steps = Usoro: bido '.ma [port]' iji chọpụta ma nke mpaghara, wee mee '.my.identity!publish @ma'.
help-publish-without = Na-enweghị ibiputa, ndị ọzọ enweghị ike iru gị — ọ bụrụn'ọ ha mata DID gị, ha enweghị ike idozi endpoint gị.
profile-fetch-did-resolve-failed = Ebipụtabeghị - gbaa 28 mbụ, wee 67 profaịlụ gị
profile-update-done = profaịlụ emelitere - igodo 18 jikọtara na 43
profile-delete-needs-name = kọwaa aha profaịlụ: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Ịnakọta ogbe - ụdị iwu, mechie na .batch
batch-already-collecting = Ugbua na-anakọta ogbe - jiri .batch mechie mbụ
batch-empty = Batch tọgbọ chakoo - ọ nweghị ihe ọ ga-agba
batch-running = Menjalankan batch…
batch-step-timeout = Oge nkwụsị nke ogbe agwụla

batch-done = Batch selesai dalam { $secs }d — { $steps } langkah
batch-done-error = Batch selesai dengan kesalahan dalam { $secs }d — { $steps } langkah
msg-timeout = Pesan habis waktu (tidak ada balasan dalam 60d)
err-unknown-command = iwu a na-amaghị: { $path }
err-read-only-path = { $path } bụ naanị ọgụgụ
help-cmd-batch-async =   .batch:async / .batch        evaluasi dokumen coretan secara paralel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Ịnweta CID { $cid } enweghị ike: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID na-adịghị mma: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Ịdọ aka ná ntị: Igodo nzuzo IPNS gị ga-aziga runtime a maka nkwupụta njirimara. Jiri naanị runtime i kwere n'ezi obi nke ọma.

# -- Help text -- zscheme
help-header-zscheme-topic = -- zscheme
help-zscheme-intro = zscheme evaluates Scheme expressions embedded in zion commands and splices the result into the line before it is sent.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    inline example; sends "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definitions persist for the current login session
help-zscheme-doc = Docs: https://github.com/bahner/rust-ma-zscheme
