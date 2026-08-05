# zion — Yorùbá
lang-name = Yorùbá
label-nick = orúkọ ìnagijẹ
new-identity-nick-help = Yan orúkọ ìnagijẹ fún ma-space. Orúkọ ìnagijẹ lasan ni, o sì lè yí i padà nígbàkigbà.
error-nick-required = orúkọ ìnagijẹ jẹ dandan
error-nick-invalid = orúkọ ìnagijẹ kò gbọ́dọ̀ ní ààyè tàbí @

# ── Ojú-ewé wọlé ─────────────────────────────────────────────────────────
tab-login = wọlé
tab-new-identity = ìdánimọ̀ tuntun
tab-import-profile = ko ọfọọfọ wọle
label-passphrase = ọ̀rọ̀ àṣírí
label-username = orúkọ olùmúlò
label-confirm-passphrase = jẹ́rìísí ọ̀rọ̀ àṣírí
label-did = DID
label-profile-cid = CID ọfọọfọ
label-or-file = tabi faili
btn-login = wọlé
btn-export = gbámújade
btn-generate = ṣẹ̀dá
btn-new-endpoint = ipari titun
btn-import-profile = ko ọfọọfọ wọle
passphrase-warning = Pàdánù ọ̀rọ̀ àṣírí = pàdánù ìdánimọ̀. Kò sí ìpadàbọ̀.
import-profile-help = Ko ọfọọfọ wọle nipasẹ CID tabi faili. O nilo ọrọ aṣina kanna ti a lo nigbati o ń tẹ jade.
import-profile-detected-user = Ọfọọfọ jẹ ti: { $name }
status-unlocking = ìṣí ṣílẹ̀...
status-generating = ṣíṣẹ̀dá ìdánimọ̀...
status-reading-file = kíkà fáìlì...
status-fetching-profile = n mu ọfọọfọ wá lati IPFS...
status-imported = a gbàwọlé '{ $name }' — lọ sí tábù wọlé
status-importing-profile = n ko ọfọọfọ wọle...
profile-import-done = ọfọọfọ wọle fun '{ $name }' — { $n } bọtini gba
error-wrong-passphrase = ọ̀rọ̀ àṣírí àṣìṣe: { $e }
error-identity-not-found = a kò rí ìdánimọ̀ '{ $name }'
error-username-required = orúkọ olùmúlò nílò
error-passphrase-required = ọ̀rọ̀ àṣírí nílò
error-passphrases-no-match = àwọn ọ̀rọ̀ àṣírí kò baramu
error-profile-source-required = pese CID tabi gbe faili soke
error-did-required = tẹ DID rẹ sii
error-profile-fetch = ko le gba ọfọọfọ: { $e }
error-profile-no-username = ọfọọfọ ko ni orukọ olumulo
error-profile-no-identity = ẹrí-iní '{ $name }' ko ri — ko ẹrí-iní wọle ni akọkọ

# ── Àwọn ìfiranṣẹ́ ètò terminal ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — a wọlé gẹ́gẹ́ bí { $username }
msg-type-help = Tẹ .help fún àtòjọ àwọn àṣẹ.
msg-getting-started = Gbìyànjú: say Hello world, look, .help, tàbí help.
msg-connecting = ìsopọ̀ mọ́ iroh...
msg-iroh-ready = ìpádédé iroh ti ṣetán
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID ti jẹ atejade nipasẹ ma agbegbe ({ $url })
msg-identity-publication-propagating = Ìtẹ̀jáde ìdánimọ̀ ṣì ń tàn ká; entry ti pẹ́: { $e }
msg-identity-first-publish = A ń tẹ ìdánimọ̀ jáde fún ìgbà àkọ́kọ́. Èyí lè gba tó { $seconds } ìṣẹ́jú-aaya.
msg-ma-connecting-matrix = a ń gbìyànjú láti so ọ mọ́ 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = a ti gba 間 agbègbè
msg-local-ma-already-claimed = 間 agbègbè ti gba tẹ́lẹ̀
msg-local-ma-claim-failed = kò ṣeé ṣe láti gba 間 agbègbè
msg-identity-not-published = Ìdánimọ̀ kò rí lórí ayelujara — tí o bá fi ma sórí kọ̀mpútà rẹ, ṣe '.ma [port]' lẹ́hìn náà '.my.identity!publish @ma'. Tẹ '.help/publish' fún àlàyé.
msg-blocked = ⊗ a dènà [{ $cap }]: { $from }
msg-focus-cleared = a pa ìfọkànsí rẹ
msg-focusing = ìfọkànsí { $did } gẹ́gẹ́ bí { $prompt }
msg-set = { $path }: { $value }
msg-deleted = a pa { $path } rẹ̀ ({ $count } àwọn ìforúkọsílẹ̀)
msg-read-only = { $path } fún kíkà nìkan
msg-subtree-set = { $path } jẹ́ igi-abẹ; kọ̀ láti fi iye
msg-ancestor-leaf = bàbá àjíji { $path } jẹ́ ewé; kọ̀ láti bòo
msg-key-not-found = kò rí bọ́tìnnì: { $path }
msg-no-match = kò sí ìbáradì
msg-link-not-connected = àṣìṣe gbígba ọ̀nà asopọ̀: a kò sopọ̀
msg-link-fetch-error = àṣìṣe gbígba ọ̀nà asopọ̀: { $e }
msg-link-key-not-found = a kò rí bọ́tìnnì `{ $key }` nínú ìwé tí a so pọ̀

# ── Ìfọ̀rọ̀wérọ̀ àpèlé ────────────────────────────────────────────────────
err-alias-name-empty = orúkọ àpèlé kò lè ṣofo
err-alias-has-dot = orúkọ àpèlé kò lè ní '.'
err-alias-has-fragment = orúkọ àpèlé kò lè ní '#'
err-alias-value-fragment = iye àpèlé lè ní fragment DID-URL kan ṣoṣo tí kò ṣofo
err-alias-value-path = iye àpèlé gbọdọ̀ jẹ́ did:ma:<ipns> DID tàbí DID-URL (kò sí path)
err-alias-not-did = iye àpèlé gbọdọ̀ bẹ̀rẹ̀ pẹ̀lú did:ma:
err-unknown-alias = àpèlé tí a kò mọ̀: @{ $name }
err-bare-did = a ní láti rí bare did:ma:<ipns> (kò sí fragment tàbí path), a rí { $did }

# ── Olùṣàtúnṣe ───────────────────────────────────────────────────────────
btn-save = pamọ́
btn-eval = ṣe
btn-cancel = fagilé
msg-jobs-cancelled = àwọn iṣẹ́ ti fagilé
btn-close = pa
btn-reply = dáhùn
btn-publish = tẹ jáde
btn-publish-ipld = tẹ jáde IPLD
msg-reply-sent = a ránṣẹ́ ìdáhùn
msg-reply-failed = ìdáhùn kùnà: { $e }
msg-entity-publish-sent = entity { $name }: a ránṣẹ́ ìtẹ jáde
msg-entity-publish-failed = ìtẹ jáde entity kùnà: { $e }
msg-kind-publish-failed = ìtẹ̀jáde irú kùnà: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: a ránṣẹ́ ìtẹ jáde
msg-field-publish-failed = ìtẹ jáde ààyè kùnà: { $e }
msg-acl-publish-sent = runtime ACL: a ránṣẹ́ ìtẹ jáde
msg-crud-edit-publish-sent = { $path }: a ránṣẹ́ ìtẹ jáde
msg-acl-publish-failed = ìtẹ jáde runtime ACL kùnà: { $e }
msg-yaml-error = àṣìṣe YAML: { $e }
msg-editor-saved = { $path }:pamọ́
msg-fetch-review = a gba { $cid } — ṣàyẹ̀wò ṣáájú ìmúṣẹ
msg-fetch-failed = gbígba { $cid }: { $e }

# ── Àwọn ìgbésẹ̀ — apótí ìnrọ̀lé ─────────────────────────────────────────
inbox-empty = apótí ìnrọ̀lé ṣofo
inbox-entry-not-found = a kò rí ìforúkọsílẹ̀ apótí { $n }
inbox-no-message-id = ìforúkọsílẹ̀ apótí { $n } kò ní message_id
inbox-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún ìforúkọsílẹ̀ apótí { $n }
inbox-filter-no-arg = àlẹ̀mọ̀ nilo ariyanjiyan DID tàbí orúkọ àpèjẹ
inbox-filter-empty = kò sí ìròyìn láti { $did }

# ── Àwọn ìgbésẹ̀ — ìgbà àkókò iṣẹ ──────────────────────────────────────
discover-fetch-failed = ìwárí kùnà ní { $url }: { $e }
discover-json-error = ìwárí kùnà: JSON tí kò tọ́ láti { $url }: { $e }
discover-missing-did = ìwárí kùnà: status.json àánù `did`
discover-invalid-did = ìwárí kùnà: `did` gbọdọ̀ bẹ̀rẹ̀ pẹ̀lú did:ma:, a rí `{ $did }`
discover-no-endpoint = ìkìlọ̀ ìwárí: `endpoint_id` àánù nínú status.json; a tọ́jú DID nìkan
discover-hint-endpoint-not-found = Àbá: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = Àbá: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = Àbá: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Àbá: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = a rí ma ní { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   à tún ṣẹ̀dá alias @ma — ṣe '.my.identity!publish @ma' láti tẹ ìdánimọ̀ rẹ jáde.
claim-success = a gba Runtime fún { $did }
claim-conflict = ìdánimọ̀ mìíràn ti gba Runtime
claim-already-owned = ìdánimọ̀ yìí ti gba Runtime tẹ́lẹ̀
claim-http-failed = gbígba kùnà: HTTP { $status }
claim-error = gbígba kùnà: { $e }
claim-no-session = a kò wọlé; wọlé ṣáájú gbígba runtime
runtime-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }

# ── Àwọn ìgbésẹ̀ — ACL ────────────────────────────────────────────────────
acl-reset = a tún saita .my.acl (ṣí patápátá)
acl-persist-error = àṣìṣe ìtọ́jú: { $e }
acl-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún .my.acl

# ── Àwọn ìgbésẹ̀ — ìdánimọ̀ ──────────────────────────────────────────────
publish-usage = lílo: .my.identity!publish <did-tàbí-àpèlé>
identity-exported = A gba bundle silẹ bi { $filename }
identity-export-failed = Okeere kuna: { $e }

# ── Àwọn ìgbésẹ̀ — àwọn ìwé ──────────────────────────────────────────────
doc-content-empty = { $path }.content ṣofo
doc-save-first = { $path }.content ṣofo — pamọ́ ṣáájú
doc-missing-name = orúkọ ìwé àánù
doc-publish-usage = lílo: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = lílo: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = ìtẹ jáde { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = ìtẹ̀jáde kùnà [{ $code }]: { $err }
doc-publish-error-hint = Àbá: { $hint }
doc-publish-hint-session = wọle lẹẹkansi ki ego le wọle si awọn bọtini idanimọ rẹ
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify ma runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = jẹrisi iwe-itumọ DID ti atẹjade ati pe o ni aaye ipari ti o le de ọdọ
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = asiko isise/ohun itanna kọ ibeere naa; ṣayẹwo idi naa ki o tun gbiyanju lẹhin titunṣe nkan / akoko asiko
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = ṣayẹwo awọn igbasilẹ akoko ṣiṣe fun idi alaye ati tun gbiyanju
doc-store-sent = a ránṣẹ́ ìbéèrè ìtọ́jú ({ $id }) → { $publisher }; CID yóò dé nípasẹ̀ ìdáhùn RPC
doc-ipld-store-sent = a ránṣẹ́ ìbéèrè ìtọ́jú IPLD ({ $id }) → { $publisher }; CID yóò dé nípasẹ̀ ìdáhùn RPC
doc-fetch-done = a gba { $cid } → { $path }.content (a kò ṣe)
doc-fetch-failed = gbígba { $cid }: { $e }
doc-fetch-usage = lílo: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = a kò saita { $path }.cid
doc-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }
path-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }

# ── Ìrànlọ́wọ́ — àwọn àkọlé ──────────────────────────────────────────────
help-header-zion = ── àwọn àṣẹ zion ────────────────────────────────────────────────────────
help-header-messaging = ── fíránṣẹ́ ─────────────────────────────────────────────────────────────
help-header-config = ── gírámà ìtúpalẹ̀ ẹbí ────────────────────────────────────────────────
help-header-common = ── àwọn ọ̀nà ti ó wọ́pọ̀ ─────────────────────────────────────────────
help-header-inbox = ── apótí ìnrọ̀lé ──────────────────────────────────────────────────────
help-header-documents = ── àwọn ìwé ────────────────────────────────────────────────────────────
help-header-i18n = ── ede ────────────────── ──────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── titẹ 間-aaye ──────────────── ──────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Ìrànlọ́wọ́ — àwọn àṣẹ zion ────────────────────────────────────────────
help-cmd-help =   .help                        ọ̀rọ̀ yìí
help-cmd-clear =   .clear                       pa terminal mọ́
help-cmd-panic =   .panic                       ọ̀nà ìgbẹ̀yìn — lò bí o bá rí ìṣòro
help-cmd-history =   .history                     ìtàn àṣẹ (àwọn tún-ṣe tẹ̀lé ara wọn jẹ́ papọ̀)
help-cmd-logout =   .logout                      jáde
help-cmd-batch =   .batch                       ጊዜያዊ ሰነድ ገምግም (በትይዩ)
help-cmd-batch-sync =   .batch:sync / .batch         ጊዜያዊ ሰነድ መስመር በመስመር ገምግም

# ── Ìrànlọ́wọ́ — fíránṣẹ́ ──────────────────────────────────────────────────
help-msg-echo =   @alias                       ṣàfihàn DID/DID-URL tí a túmọ̀ (a kò fi ifiranṣẹ ranṣẹ)
help-msg-send =   @alias!msg body / @alias:verb args           ránsẹ́ / RPC sí onísẹ̀
help-msg-fragment =   @alias#fragment:verb body  ránsẹ́ sí àpèlé pẹ̀lú fragment DID àfihàn
help-msg-escape =   \@name                       @name gangan (kò sí ìwádìí àpèlé)

# ── Ìrànlọ́wọ́ — ìpele ìfọkànsí ────────────────────────────────────────────

# ── Ìrànlọ́wọ́ — gírámà ìtúpalẹ̀ ─────────────────────────────────────────
help-config-get =   .path                        gba iye ewé tàbí ṣàkójọ igi-abẹ
help-config-filter =   .path value                  báramu ìbéèrè (àlẹ̀mọ̀ nípa iye)
help-config-set =   .path: value                 fi iye sí ewé
help-config-delete =   .path:                       pa ewé tàbí igi-abẹ rẹ̀
help-config-verb =   .path!verb [args]            pè ìgbésẹ̀ ẹbí

# ── Ìrànlọ́wọ́ — àwọn ọ̀nà ti ó wọ́pọ̀ ─────────────────────────────────
help-my =   .my                          ṣàfihàn gbogbo ìtúpalẹ̀ ara ẹni
help-aliases =   .my.aliases                  ṣàkójọ àwọn àpèlé
help-aliases-set =   .my.aliases.<name>: <did-url>    ṣàfikún/ṣàtúnṣe àpèlé (DID tàbí DID-URL)
help-aliases-del =   .my.aliases.<name>:          yọ àpèlé kúrò
help-runtime-discover =   .ma [port]          ṣàwárí runtime ẹbí kí o sì ṣẹ̀dá àpèlé @ma
help-runtime-claim =   .ma [port]             gba ẹ̀tọ́ runtime pẹ̀lú DID rẹ
help-identity =   .my.identity                 ṣàfihàn ìtúpalẹ̀ ìdánimọ̀
help-identity-did =   .my.identity.did             ṣàfihàn DID rẹ (kíkà nìkan)
help-identity-publish =   .my.identity!publish @pub    tẹ DID jáde nípasẹ̀ iṣẹ́ àtẹjáde
help-identity-export =   .my.identity!export          gba bundle idanimọ tirẹ
help-config-path =   .config                      ṣàfihàn gbogbo àwọn ìforúkọsílẹ̀ .config.*

# ── Ìrànlọ́wọ́ — apótí ìnrọ̀lé ────────────────────────────────────────────
help-inbox =   .my.inbox                    ṣàkójọ apótí ìnrọ̀lé (ìwòran igi-abẹ)
help-inbox-n =   .my.inbox.N                  ṣàfihàn àwọn ààyè ìforúkọsílẹ̀ N
help-inbox-from =   .my.inbox.N.from             DID aránnísọ̀pọ̀ ìforúkọsílẹ̀ N
help-inbox-reply =   .my.inbox.N!reply [body]     ránsẹ́ ìdáhùn (ṣí olùṣàtúnṣe bí kò bá sí ara)
help-inbox-open =   .my.inbox.N!open             ṣí àkóónú fún kíkà nìkan nínú olùṣàtúnṣe
help-inbox-del =   .my.inbox.N:                 pa ìforúkọsílẹ̀ N rẹ̀
help-inbox-delall =   .my.inbox:                   pa gbogbo àwọn ìforúkọsílẹ̀ apótí rẹ̀
help-inbox-flush =   .my.inbox!flush              tẹ gbogbo àwọn ìforúkọsílẹ̀ jáde sí terminal
help-inbox-filter =   .my.inbox!filter @who        ṣàfihàn àwọn ìdáhùn láti @who nìkàn
help-inbox-traverse =   .my.inbox.N.sender.<field>   ṣàwárí ìwé DID aránnísọ̀pọ̀ lẹ̀ẹ̀ kan

# ── Ìrànlọ́wọ́ — àwọn ìwé ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           ṣí olùṣàtúnṣe pẹ̀lú àkóónú tí a pamọ́
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     gba CID, ṣí fún àyẹ̀wò nìkan
help-doc-eval =   .my.doc.<name>!eval           ṣe àkóónú tí a pamọ́ ìlà-nípa-ìlà
help-doc-publish =   .my.doc.<name>!publish @pub   tọ́jú gẹ́gẹ́ bí blob aise (irú èyíkéyìí)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  tọ́jú YAML gẹ́gẹ́ bí ìpínrọ̀ IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    gbàwọlé àkóónú CID (kò sí ìmúṣẹ)
help-doc-cid =   .my.doc.<name>!cid            ṣàfihàn CID tí a pamọ́
help-doc-del =   .my.doc.<name>:              pa ìwé rẹ̀

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n tọju ayanfẹ ede ti o so mọ idanimọ rẹ.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               ṣe akojọ awọn koodu ede ti o wa

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Yàrá 間 ni ààyè tó wà láàrin àwọn ìdánimọ̀ 間. ma ń jẹ́ kí àwọn ìdánimọ̀ wọ̀nyí rí ara wọn kí wọ́n sì bá ara wọn sọ̀rọ̀; tí a bá ti tẹ ìdánimọ̀ rẹ jáde, o lè kópa.
help-ma-command =   .ma [port]                   so mọ́ ma runtime agbègbè rẹ, ka /status.json, kí o sì fi .ma.ctx.* pamọ́
help-ma-publish =   .my.identity!publish @ma     tẹ iwe DID rẹ jáde kí àwọn míì lè rí keys rẹ àti endpoint rẹ
help-ma-security = Ààlà ìgbẹ́kẹ̀lé tó ṣe kedere jù ni ma runtime tirẹ pẹ̀lú IPFS Desktop/Kubo tirẹ. Publisher tó jìn lè wúlò, ṣùgbọ́n nígbà yẹn o ń gbẹ́kẹ̀lé iṣẹ́ ẹlòmíì.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             bí a ṣe ń wọ yàrá 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Nígbà tí ìdánimọ̀ rẹ bá ti mọ̀, .enter @ma yóò jẹ́ kí o wọ 間. Wa ayé kan, wọ inú rẹ, kí o sì kópa láti ibẹ̀.
help-ma-entry-steps = Bẹrẹ IPFS Desktop àti ma, lẹ́yìn náà ṣiṣẹ́ .ma. Tẹ jáde pẹ̀lú .my.identity!publish @ma, wa ayé kan, kí o wọ pẹ̀lú .enter @ma.
help-ma-entry-command =   .enter @ma                  wọ 間 nípasẹ̀ @ma runtime
help-ma-entry-toggle =   .enter                       tan tàbí pa ìfojúsí yàrá; ìdánimọ̀ rẹ ń ṣiṣẹ́ síbẹ̀
help-ma-entry-url =   ?enter=<runtime>             wọlé lẹ́yìn login láti URL tí a pín

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Àwọn èdè tó wà (.my.i18n: <code> láti ṣètò):
err-lang-not-found = ede ko ri: { $lang }

msg-send-failed = fífiránṣẹ kuna: { $e }
msg-not-logged-in = ko wọle

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Aṣiṣe itupalẹ YAML: { $e }
yaml-not-mapping = YAML gbọdọ jẹ mapping (bata bọtini: iye); ọrọ ti o rọrun ati awọn isokọ ko le fipamọ bi DAG-CBOR
dagcbor-encode-error = Aṣiṣe ifaminsi DAG-CBOR: { $e }
cbor-decode-error = Aṣiṣe iṣipopada CBOR: { $e }
cbor-json-error = Aṣiṣe CBOR si JSON: { $e }
yaml-serialise-error = Aṣiṣe silẹ YAML: { $e }
edit-reply-invalid = Idahun atunse ti ko wulo
doc-publish-ipld-error = Atejade IPLD kuna: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Aṣiṣe fipamọ ifipabanilọ apoti apo: { $e }
err-config-load = Aṣiṣe igba iwọle iṣeto: { $e }
err-lang-persist = Aṣiṣe fipamọ ede: { $e }
err-history-parse = Aṣiṣe itupalẹ itan: { $e }
err-history-load = Aṣiṣe gbigba itan: { $e }
err-ipfs-reply-decode = Iṣipopada idahun IPFS kuna: { $e }
err-edit-cbor = Aṣiṣe ṣatunṣe CBOR: { $e }
err-popup-blocked = Aṣàwákiri dina ferese afihan
status-publishing = n gbejade

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = àṣìṣe
rpc-error-detail = àṣìṣe: { $detail }
msg-new-message = ← [{ $from }] ifiranṣẹ tuntun — { $count } ninu apo
msg-chat = { $sender } sọ { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } sọ pé { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } wọ inu yara.
room-leave = * { $name } kúrò nínú yara.
room-drop  = * { $name } jẹ́ { $thing } sílẹ̀.
room-take  = * { $name } gba { $thing }.
err-edit-decode-failed = ṣàtúnṣe: àṣìṣe ìtúpalẹ̀: { $e }
err-edit-fetch-failed = ṣàtúnṣe: àṣìṣe gbígba: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ko si igbimọ ti nṣiṣẹ — ko le pa profaili rẹ
profile-delete-error = piparẹ profaili kuna: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profaili ti jẹ́ kóòdù, a sì ti rán án sí IPFS; ìwé DID yóò ṣe imudojuiwọn nígbà tí CID bá dé
profile-publish-done = profaili ti tẹ̀jáde — ìwé DID ti ni imudojuiwọn pẹ̀lú ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = idanimọ ti a ti tẹjade tẹlẹ - profaili titi di oni
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = akoonu alakomeji (ko ṣe afihan)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (kosi)
profiles-deleted = profaili { $name } parẹ
profiles-not-found = profaili { $name } ko ri: { $name }

# -- Help topics index
help-header-topics = -- ርዕሶች -- ዝርዝር ለማየት .help/<topic> ይተይቡ
help-topic-msg =   .help/msg                    መልዕክት
help-topic-ma = .help/ma                     ma-aaye, titẹjade, ati titẹsi
help-topic-path = .help/path                   Gírámọ aami-ọna agbegbe
help-topic-my =   .help/my                     የግል config
help-topic-inbox =   .help/inbox                  ገቢ መልዕክት
help-topic-doc =   .help/doc                    ሰነዶች
help-topic-actor =   .help/actor                  ርቀት actor
help-topic-zscheme =   .help/zscheme               àwọn ìfihàn Scheme inú ila àti ìwé ìtọ́nisọ́nà
help-unknown-topic =   .help/{ $topic }: ያልታወቀ ርዕስ

# -- Help actor section
help-header-actor = -- ርቀት ተዋናዮች
help-actor-echo =   @actor                       DID ፍቺን አሳይ
help-actor-text = @actor[#entity]!msg|!say|!emote body         firanṣẹ taara / iwiregbe / emomote ifiranṣẹ
help-actor-ping = @actor:ping                  igbesi aye Pingi
help-actor-entities =   @actor/entities              entitiy ዘርዝር
help-actor-entities-get = @actor/entities/<n>          gba ipade nkankan
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity አርትዕ
help-actor-entities-del = @actor/entities/<n>:         pa nkankan
help-actor-config-get =   @actor/config/<key>          config እሴት አግኝ
help-actor-config-set =   @actor/config/<key>: val     config እሴት አዘጋጅ
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL አርትዕ
help-actor-fragment =   @actor#entity                ወደ plugin ላክ
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ወደ plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  pa 5 idahun ni ayika igba
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity

help-topic-url =   .help/url                    ṣii zion nipasẹ asopọ URL
help-topic-i18n = .help/i18n                   ààyò ede fun idanimọ rẹ
help-header-url = ── awọn paramita URL ────────────────────────────────────────────────────────────
help-url-intro =   Pin asopọ kan ti o ṣii zion pẹlu olugba tí a ti kọ siwaju:
help-url-msg =   ?msg=<did>                   kọ siwaju: @<did>!msg (ifiranṣẹ rọrun)
help-url-say =   ?say=<did>                   kọ siwaju: @<did>!say (ọrọ-iṣe say)
help-url-emote =   ?emote=<did>                 kọ siwaju: @<did>!emote (ọrọ-iṣe emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             tẹ aye asiko isise lẹhin wiwọle
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Titẹ sii kọ siwaju ṣugbọn a ko firanṣẹ — tẹ Enter lati firanṣẹ.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                tẹ ìdánimọ̀ rẹ jáde sórí nẹtiwọ́kì
help-header-publish = ── títẹ ìdánimọ̀ jáde ───────────────────────────────────────────────────────
help-publish-intro = Títẹ jáde mú kí ìdánimọ̀ rẹ lè rí lórí nẹtiwọ́kì. Àwọn mìíràn lè wà DID rẹ láti kan sí ọ.
help-publish-ma = Láti tẹ jáde, o nílò ma (runtime àdúgbò) tí a fi sórí. Ó so ego mọ IPFS/IPNS ní orúkọ rẹ.
help-publish-steps = Àwọn ìgbésẹ̀: ṣe '.ma [port]' láti rí ma àdúgbò, lẹ́hìn náà '.my.identity!publish @ma'.
help-publish-without = Láìsí títẹ jáde, àwọn mìíràn kò lè de ọ — bí wọ́n bá mọ DID rẹ pàápàá, wọn kò lè yanjú endpoint rẹ.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = sọ orúkọ profaili: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Gbigba ipele - iru awọn aṣẹ, pari pẹlu .batch
batch-already-collecting = Tẹlẹ gbigba ipele kan - pari pẹlu .batch akọkọ
batch-empty = Batch ti ṣofo - ko si nkankan lati ṣiṣe
batch-running = batch በሂደት ላይ…
batch-step-timeout = ipele igbese akoko jade

batch-done = Batch በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
batch-done-error = Batch ከስህተቶች ጋር በ{ $secs }s ተጠናቋል — { $steps } ደረጃዎች
msg-timeout = መልዕክቱ ጊዜው አልፏል (በ60s ምላሽ የለም)
err-unknown-command = àṣẹ tí a kò mọ̀: { $path }
err-read-only-path = { $path } jẹ́ fún kíkà nìkan
help-cmd-batch-async =   .batch:async / .batch        ጊዜያዊ ሰነድ ገምግም (በትይዩ)


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Kò ṣeéṣe láti gbà CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID tó tọ kọ: { $value }
label-runtime = ma
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = Ìkìlọ̀: Kọ́kọ́rọ́ ìkọ̀kọ̀ IPNS rẹ yóò rán sí runtime yìí fún ìtẹ̀jáde ìdánimọ̀. Lò nìkan runtime tí o ní ìgbẹ́kẹ̀lé pátápátá sí.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme ń ṣe ìṣirò àwọn ìfihàn Scheme tí a fi sínú àwọn àṣẹ zion, ó sì fi èsì náà sínú ila kí a tó rán an.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    àpẹẹrẹ inú ila; ó rán "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             àwọn ìtumọ̀ máa ń dúró fún ìgbà ìwọlé lọwọlọwọ
help-zscheme-doc = Ìwé ìtọ́nisọ́nà: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Ẹnu-ọna IPFS ti ibilẹ (nilo iyatọ aṣàgbékalẹ̀)
