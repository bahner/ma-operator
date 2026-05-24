# zion — Yorùbá
lang-name = Yorùbá

# ── Ojú-ewé wọlé ─────────────────────────────────────────────────────────
tab-login = wọlé
tab-new-identity = ìdánimọ̀ tuntun
tab-import = gbàwọlé
label-passphrase = ọ̀rọ̀ àṣírí
label-username = orúkọ olùmúlò
label-confirm-passphrase = jẹ́rìísí ọ̀rọ̀ àṣírí
btn-login = wọlé
btn-export = gbámújade
btn-generate = ṣẹ̀dá
passphrase-warning = Pàdánù ọ̀rọ̀ àṣírí = pàdánù ìdánimọ̀. Kò sí ìpadàbọ̀.
import-help = Yan fáìlì .zion.json tí a gbámújade. Àpò náà ṣì wà ní ìmọ̀lò.
status-unlocking = ìṣí ṣílẹ̀...
status-generating = ṣíṣẹ̀dá ìdánimọ̀...
status-reading-file = kíkà fáìlì...
status-imported = a gbàwọlé '{ $name }' — lọ sí tábù wọlé
error-wrong-passphrase = ọ̀rọ̀ àṣírí àṣìṣe: { $e }
error-identity-not-found = a kò rí ìdánimọ̀ '{ $name }'
error-username-required = orúkọ olùmúlò nílò
error-passphrase-required = ọ̀rọ̀ àṣírí nílò
error-passphrases-no-match = àwọn ọ̀rọ̀ àṣírí kò baramu

# ── Àwọn ìfiranṣẹ́ ètò terminal ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — a wọlé gẹ́gẹ́ bí { $username }
msg-type-help = Tẹ .help fún àtòjọ àwọn àṣẹ.
msg-connecting = ìsopọ̀ mọ́ iroh...
msg-iroh-ready = ìpádédé iroh ti ṣetán
msg-iroh-failed = iroh: { $e }
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
err-alias-has-fragment = orúkọ àpèlé kò lè ní '#'
err-alias-value-fragment = iye àpèlé gbọdọ̀ jẹ́ bare did:ma:<ipns> (kò sí fragment)
err-alias-value-path = iye àpèlé gbọdọ̀ jẹ́ bare did:ma:<ipns> (kò sí path)
err-alias-not-did = iye àpèlé gbọdọ̀ bẹ̀rẹ̀ pẹ̀lú did:ma:
err-unknown-alias = àpèlé tí a kò mọ̀: @{ $name }
err-bare-did = a ní láti rí bare did:ma:<ipns> (kò sí fragment tàbí path), a rí { $did }

# ── Olùṣàtúnṣe ───────────────────────────────────────────────────────────
btn-save = pamọ́
btn-eval = ṣe
btn-cancel = fagilé
btn-close = pa
btn-reply = dáhùn
btn-publish = tẹ jáde
msg-reply-sent = a ránṣẹ́ ìdáhùn
msg-reply-failed = ìdáhùn kùnà: { $e }
msg-entity-publish-sent = entity { $name }: a ránṣẹ́ ìtẹ jáde
msg-entity-publish-failed = ìtẹ jáde entity kùnà: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: a ránṣẹ́ ìtẹ jáde
msg-field-publish-failed = ìtẹ jáde ààyè kùnà: { $e }
msg-acl-publish-sent = runtime ACL: a ránṣẹ́ ìtẹ jáde
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

# ── Àwọn ìgbésẹ̀ — ìgbà àkókò iṣẹ ──────────────────────────────────────
discover-fetch-failed = ìwárí kùnà ní { $url }: { $e }
discover-json-error = ìwárí kùnà: JSON tí kò tọ́ láti { $url }: { $e }
discover-missing-did = ìwárí kùnà: status.json àánù `did`
discover-invalid-did = ìwárí kùnà: `did` gbọdọ̀ bẹ̀rẹ̀ pẹ̀lú did:ma:, a rí `{ $did }`
discover-no-endpoint = ìkìlọ̀ ìwárí: `endpoint_id` àánù nínú status.json; a tọ́jú DID nìkan
discover-success = a rí ma ní { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   a ṣẹ̀dá àpèlé @ma — tẹ jáde pẹ̀lú: .my.identity:publish @ma
claim-success = a gba Runtime fún { $did }
claim-conflict = ìdánimọ̀ mìíràn ti gba Runtime
claim-http-failed = gbígba kùnà: HTTP { $status }
claim-error = gbígba kùnà: { $e }
claim-no-session = a kò wọlé; wọlé ṣáájú gbígba runtime
runtime-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }

# ── Àwọn ìgbésẹ̀ — ACL ────────────────────────────────────────────────────
acl-reset = a tún saita .my.acl (ṣí patápátá)
acl-persist-error = àṣìṣe ìtọ́jú: { $e }
acl-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún .my.acl

# ── Àwọn ìgbésẹ̀ — ìdánimọ̀ ──────────────────────────────────────────────
publish-usage = lílo: .my.identity:publish <did-tàbí-àpèlé>

# ── Àwọn ìgbésẹ̀ — àwọn ìwé ──────────────────────────────────────────────
doc-content-empty = { $path }.content ṣofo
doc-save-first = { $path }.content ṣofo — pamọ́ ṣáájú
doc-missing-name = orúkọ ìwé àánù
doc-publish-usage = lílo: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = lílo: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = ìtẹ jáde { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = a ránṣẹ́ ìbéèrè ìtọ́jú ({ $id }) → { $publisher }; CID yóò dé nípasẹ̀ ìdáhùn RPC
doc-ipld-store-sent = a ránṣẹ́ ìbéèrè ìtọ́jú IPLD ({ $id }) → { $publisher }; CID yóò dé nípasẹ̀ ìdáhùn RPC
doc-fetch-done = a gba { $cid } → { $path }.content (a kò ṣe)
doc-fetch-failed = gbígba { $cid }: { $e }
doc-fetch-usage = lílo: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = a kò saita { $path }.cid
doc-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }
path-no-verb = kò sí ìgbésẹ̀ `{ $verb }` fún { $path }

# ── Ìrànlọ́wọ́ — àwọn àkọlé ──────────────────────────────────────────────
help-header-zion = ── àwọn àṣẹ zion ────────────────────────────────────────────────────────
help-header-messaging = ── fíránṣẹ́ ─────────────────────────────────────────────────────────────
help-header-focus = ── ìpele ìfọkànsí ───────────────────────────────────────────────────────
help-header-config = ── gírámà ìtúpalẹ̀ ẹbí ────────────────────────────────────────────────
help-header-common = ── àwọn ọ̀nà ti ó wọ́pọ̀ ─────────────────────────────────────────────
help-header-inbox = ── apótí ìnrọ̀lé ──────────────────────────────────────────────────────
help-header-documents = ── àwọn ìwé ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Ìrànlọ́wọ́ — àwọn àṣẹ zion ────────────────────────────────────────────
help-cmd-help =   .help                        ọ̀rọ̀ yìí
help-cmd-clear =   .clear                       pa terminal mọ́
help-cmd-panic =   .panic                       ọ̀nà ìgbẹ̀yìn — lò bí o bá rí ìṣòro
help-cmd-logout =   .logout                      jáde

# ── Ìrànlọ́wọ́ — fíránṣẹ́ ──────────────────────────────────────────────────
help-msg-echo =   @alias                       ṣàfihàn DID tí a yanjú (kò sí ìfiránṣẹ́)
help-msg-send =   @alias[:verb] body           ránsẹ́ / RPC sí onísẹ̀
help-msg-fragment =   @alias#fragment[:verb] body  ránsẹ́ sí àpèlé pẹ̀lú fragment DID àfihàn
help-msg-escape =   \@name                       @name gangan (kò sí ìwádìí àpèlé)

# ── Ìrànlọ́wọ́ — ìpele ìfọkànsí ────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fọkàn sí onísẹ̀ (yípadà prompt)
help-focus-clear =   .use                         pa ìfọkànsí rẹ

# ── Ìrànlọ́wọ́ — gírámà ìtúpalẹ̀ ─────────────────────────────────────────
help-config-get =   .path                        gba iye ewé tàbí ṣàkójọ igi-abẹ
help-config-filter =   .path value                  báramu ìbéèrè (àlẹ̀mọ̀ nípa iye)
help-config-set =   .path: value                 fi iye sí ewé
help-config-delete =   .path:                       pa ewé tàbí igi-abẹ rẹ̀
help-config-verb =   .path:verb [args]            pè ìgbésẹ̀ ẹbí

# ── Ìrànlọ́wọ́ — àwọn ọ̀nà ti ó wọ́pọ̀ ─────────────────────────────────
help-my =   .my                          ṣàfihàn gbogbo ìtúpalẹ̀ ara ẹni
help-aliases =   .my.aliases                  ṣàkójọ àwọn àpèlé
help-aliases-set =   .my.aliases.<name>: <did>    ṣàfikún/ṣàtúnṣe àpèlé (bare DID, kò sí #fragment)
help-aliases-del =   .my.aliases.<name>:          yọ àpèlé kúrò
help-runtime-discover =   .my.ma:discover          ṣàwárí runtime ẹbí kí o sì ṣẹ̀dá àpèlé @ma
help-runtime-claim =   .my.ma:claim             gba ẹ̀tọ́ runtime pẹ̀lú DID rẹ
help-identity =   .my.identity                 ṣàfihàn ìtúpalẹ̀ ìdánimọ̀
help-identity-did =   .my.identity.did             ṣàfihàn DID rẹ (kíkà nìkan)
help-identity-publish =   .my.identity:publish @pub    tẹ DID jáde nípasẹ̀ iṣẹ́ àtẹjáde
help-config-path =   .config                      ṣàfihàn gbogbo àwọn ìforúkọsílẹ̀ .config.*

# ── Ìrànlọ́wọ́ — apótí ìnrọ̀lé ────────────────────────────────────────────
help-inbox =   .my.inbox                    ṣàkójọ apótí ìnrọ̀lé (ìwòran igi-abẹ)
help-inbox-n =   .my.inbox.N                  ṣàfihàn àwọn ààyè ìforúkọsílẹ̀ N
help-inbox-from =   .my.inbox.N.from             DID aránnísọ̀pọ̀ ìforúkọsílẹ̀ N
help-inbox-reply =   .my.inbox.N:reply [body]     ránsẹ́ ìdáhùn (ṣí olùṣàtúnṣe bí kò bá sí ara)
help-inbox-open =   .my.inbox.N:open             ṣí àkóónú fún kíkà nìkan nínú olùṣàtúnṣe
help-inbox-del =   .my.inbox.N:                 pa ìforúkọsílẹ̀ N rẹ̀
help-inbox-delall =   .my.inbox:                   pa gbogbo àwọn ìforúkọsílẹ̀ apótí rẹ̀
help-inbox-flush =   .my.inbox:flush              tẹ gbogbo àwọn ìforúkọsílẹ̀ jáde sí terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   ṣàwárí ìwé DID aránnísọ̀pọ̀ lẹ̀ẹ̀ kan

# ── Ìrànlọ́wọ́ — àwọn ìwé ─────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           ṣí olùṣàtúnṣe pẹ̀lú àkóónú tí a pamọ́
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     gba CID, ṣí fún àyẹ̀wò nìkan
help-doc-eval =   .my.doc.<name>:eval           ṣe àkóónú tí a pamọ́ ìlà-nípa-ìlà
help-doc-publish =   .my.doc.<name>:publish @pub   tọ́jú gẹ́gẹ́ bí blob aise (irú èyíkéyìí)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  tọ́jú YAML gẹ́gẹ́ bí ìpínrọ̀ IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    gbàwọlé àkóónú CID (kò sí ìmúṣẹ)
help-doc-cid =   .my.doc.<name>:cid            ṣàfihàn CID tí a pamọ́
help-doc-del =   .my.doc.<name>:              pa ìwé rẹ̀

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Àwọn èdè tó wà (.my.i18n: <code> láti ṣètò):
err-lang-not-found = ede ko ri: { $lang }

msg-send-failed = fífiránṣẹ kuna: { $e }
msg-not-logged-in = ko wọle
