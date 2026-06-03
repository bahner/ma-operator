# zion — 繁體中文
lang-name = 中文（繁體）

# ── 登入頁面 ──────────────────────────────────────────────────────────────
tab-login = 登入
tab-new-identity = 新建身分
tab-import = 匯入
label-passphrase = 密碼短語
label-username = 使用者名稱
label-confirm-passphrase = 確認密碼短語
btn-login = 登入
btn-export = 匯出
btn-generate = 產生
passphrase-warning = 遺失密碼短語即遺失身分。無法復原。
import-help = 選擇已匯出的 .zion.json 檔案。金鑰包保持加密狀態。
status-unlocking = 解鎖中...
status-generating = 產生身分中...
status-reading-file = 讀取檔案中...
status-imported = 已匯入 '{ $name }' — 切換至登入索引標籤
error-wrong-passphrase = 密碼短語錯誤: { $e }
error-identity-not-found = 找不到身分 '{ $name }'
error-username-required = 需要使用者名稱
error-passphrase-required = 需要密碼短語
error-passphrases-no-match = 密碼短語不相符

# ── 終端機系統訊息 ────────────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — 已以 { $username } 身分登入
msg-type-help = 輸入 .help 查看指令清單。
msg-connecting = 正在連線到 iroh...
msg-iroh-ready = iroh 端點就緒
msg-iroh-failed = iroh: { $e }
msg-identity-not-published = 未在網上找到身份 — 執行 '.my.identity:publish @ma' 以便成為可聯絡的。
msg-blocked = ⊗ 已封鎖 [{ $cap }]: { $from }
msg-focus-cleared = 焦點已清除
msg-focusing = 將 { $did } 聚焦為 { $prompt }
msg-set = { $path }: { $value }
msg-deleted = 已刪除 { $path }（{ $count } 項）
msg-read-only = { $path } 為唯讀
msg-subtree-set = { $path } 是子樹；拒絕設定
msg-ancestor-leaf = { $path } 的某個祖先是葉節點；拒絕遮蔽
msg-key-not-found = 找不到鍵: { $path }
msg-no-match = 無相符項目
msg-link-not-connected = 連結擷取錯誤：未連線
msg-link-fetch-error = 連結擷取錯誤: { $e }
msg-link-key-not-found = 在連結文件中找不到鍵 `{ $key }`

# ── 別名驗證 ──────────────────────────────────────────────────────────────
err-alias-name-empty = 別名不能為空
err-alias-has-dot = 別名不能包含 '.'
err-alias-has-fragment = 別名不能包含 '#'
err-alias-value-fragment = 別名值必須是純 did:ma:<ipns>（無片段）
err-alias-value-path = 別名值必須是純 did:ma:<ipns>（無路徑）
err-alias-not-did = 別名值必須以 did:ma: 開頭
err-unknown-alias = 未知別名: @{ $name }
err-bare-did = 期望純 did:ma:<ipns>（無片段或路徑），得到 { $did }

# ── 編輯器 ────────────────────────────────────────────────────────────────
btn-save = 儲存
btn-eval = 執行
btn-cancel = 取消
btn-close = 關閉
btn-reply = 回覆
btn-publish = 發佈
btn-publish-ipld = 發佈 IPLD
msg-reply-sent = 回覆已傳送
msg-reply-failed = 回覆失敗: { $e }
msg-entity-publish-sent = 實體 { $name }：發佈請求已傳送
msg-entity-publish-failed = 實體發佈失敗: { $e }
msg-kind-publish-failed = 種類發布失敗：{ $e }
msg-field-publish-sent = 實體 { $name }.{ $field }：發佈請求已傳送
msg-field-publish-failed = 欄位發佈失敗: { $e }
msg-acl-publish-sent = 執行階段 ACL：發佈請求已傳送
msg-crud-edit-publish-sent = { $path }：發佈請求已傳送
msg-acl-publish-failed = 執行階段 ACL 發佈失敗: { $e }
msg-yaml-error = YAML 錯誤: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = 已擷取 { $cid } — 執行前請審閱
msg-fetch-failed = 擷取 { $cid }: { $e }

# ── 動詞 — 收件匣 ─────────────────────────────────────────────────────────
inbox-empty = 收件匣為空
inbox-entry-not-found = 找不到收件匣項目 { $n }
inbox-no-message-id = 收件匣項目 { $n } 沒有 message_id
inbox-no-verb = 收件匣項目 { $n } 沒有 `{ $verb }` 動詞

# ── 動詞 — 執行階段 ───────────────────────────────────────────────────────
discover-fetch-failed = 探索失敗於 { $url }: { $e }
discover-json-error = 探索失敗：來自 { $url } 的無效 JSON: { $e }
discover-missing-did = 探索失敗：status.json 缺少必填欄位 `did`
discover-invalid-did = 探索失敗：期望 `did` 以 did:ma: 開頭，得到 `{ $did }`
discover-no-endpoint = 探索警告：status.json 中缺少 `endpoint_id`；僅儲存了 DID
discover-success = 已在 { $url } 探索到 ma
discover-did-line = DID: { $did }
discover-alias-hint =   別名 @ma 已建立 — 發佈指令: .my.identity:publish @ma
claim-success = 執行階段已為 { $did } 宣告
claim-conflict = 執行階段已被另一身分宣告
claim-http-failed = 宣告失敗：HTTP { $status }
claim-error = 宣告失敗: { $e }
claim-no-session = 未登入；請先登入後再宣告執行階段
runtime-no-verb = { $path } 沒有 `{ $verb }` 動詞

# ── 動詞 — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl 已重設（完全開放）
acl-persist-error = 持久化錯誤: { $e }
acl-no-verb = .my.acl 沒有 `{ $verb }` 動詞

# ── 動詞 — 身分 ───────────────────────────────────────────────────────────
publish-usage = 用法: .my.identity:publish <did-或-別名>

# ── 動詞 — 文件 ───────────────────────────────────────────────────────────
doc-content-empty = { $path }.content 為空
doc-save-first = { $path }.content 為空 — 請先儲存
doc-missing-name = 缺少文件名稱
doc-publish-usage = 用法: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = 用法: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = 發佈 { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = 儲存請求已傳送（{ $id }）→ { $publisher }；CID 將透過 RPC 回覆到達
doc-ipld-store-sent = IPLD 儲存請求已傳送（{ $id }）→ { $publisher }；CID 將透過 RPC 回覆到達
doc-fetch-done = 已擷取 { $cid } → { $path }.content（未執行）
doc-fetch-failed = 擷取 { $cid }: { $e }
doc-fetch-usage = 用法: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid 未設定
doc-no-verb = { $path } 沒有 `{ $verb }` 動詞
path-no-verb = { $path } 沒有 `{ $verb }` 動詞

# ── 說明文字 — 標題 ───────────────────────────────────────────────────────
help-header-zion = ── zion 指令 ─────────────────────────────────────────────────────────────
help-header-messaging = ── 訊息傳遞 ──────────────────────────────────────────────────────────
help-header-focus = ── 焦點模式 ──────────────────────────────────────────────────────────────
help-header-config = ── 本地設定語法 ──────────────────────────────────────────────────────────
help-header-common = ── 常用路徑 ──────────────────────────────────────────────────────────────
help-header-inbox = ── 收件匣 ────────────────────────────────────────────────────────────────
help-header-documents = ── 文件 ──────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── 說明文字 — zion 指令 ──────────────────────────────────────────────────
help-cmd-help =   .help                        此說明文字
help-cmd-clear =   .clear                       清除終端機
help-cmd-panic =   .panic                       最後手段 — 遇到問題時使用
help-cmd-history =   .history                     命令歷史（連續重複項已合併）
help-cmd-logout =   .logout                      登出

# ── 說明文字 — 訊息傳遞 ───────────────────────────────────────────────────
help-msg-echo =   @alias                       回顯已解析的 DID（不傳送訊息）
help-msg-send =   @alias[:verb] body           傳送訊息 / RPC 給角色
help-msg-fragment =   @alias#fragment[:verb] body  傳送到帶顯式 DID 片段的別名
help-msg-escape =   \@name                       字面 @name（不查找別名）

# ── 說明文字 — 焦點模式 ───────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       聚焦角色（更改提示符）
help-focus-clear =   .use                         清除焦點

# ── 說明文字 — 設定語法 ───────────────────────────────────────────────────
help-config-get =   .path                        取得葉值或列出子樹
help-config-filter =   .path value                  按值過濾子樹
help-config-set =   .path: value                 設定葉值
help-config-delete =   .path:                       刪除葉或子樹
help-config-verb =   .path:verb [args]            呼叫本地動詞

# ── 說明文字 — 常用路徑 ───────────────────────────────────────────────────
help-my =   .my                          顯示所有個人設定
help-aliases =   .my.aliases                  列出別名
help-aliases-set =   .my.aliases.<name>: <did>    新增/更新別名（純 DID，無 #fragment）
help-aliases-del =   .my.aliases.<name>:          移除別名
help-runtime-discover =   .my.ma:discover          探索本地執行階段並建立 @ma 別名
help-runtime-claim =   .my.ma:claim             用您的 DID 宣告執行階段所有權
help-identity =   .my.identity                 顯示身分設定
help-identity-did =   .my.identity.did             顯示自己的 DID（唯讀）
help-identity-publish =   .my.identity:publish @pub    透過發佈服務發佈自己的 DID
help-config-path =   .config                      顯示所有 .config.* 條目

# ── 說明文字 — 收件匣 ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    列出收件匣（子樹檢視）
help-inbox-n =   .my.inbox.N                  顯示項目 N 的欄位
help-inbox-from =   .my.inbox.N.from             項目 N 的寄件者 DID
help-inbox-reply =   .my.inbox.N:reply [body]     傳送回覆（無內文則開啟編輯器）
help-inbox-open =   .my.inbox.N:open             在編輯器中唯讀開啟項目內容
help-inbox-del =   .my.inbox.N:                 刪除項目 N
help-inbox-delall =   .my.inbox:                   刪除所有收件匣項目
help-inbox-flush =   .my.inbox:flush              將所有項目列印到終端機
help-inbox-traverse =   .my.inbox.N.sender.<field>   惰性遍歷寄件者 DID 文件

# ── 說明文字 — 文件 ───────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           用已儲存內容開啟編輯器
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     擷取 CID，僅供審閱開啟
help-doc-eval =   .my.doc.<name>:eval           逐行執行已儲存內容
help-doc-publish =   .my.doc.<name>:publish @pub   作為原始資料儲存（任意類型）
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  將 YAML 儲存為結構化 DAG-CBOR IPLD 節點
help-doc-fetch =   .my.doc.<name>:fetch <cid>    匯入 CID 內容（不執行）
help-doc-cid =   .my.doc.<name>:cid            顯示已儲存的 CID
help-doc-del =   .my.doc.<name>:              刪除文件

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = 可用語言（使用 .my.i18n: <code> 設定）：
err-lang-not-found = 未找到語言: { $lang }

msg-send-failed = 傳送失敗：{ $e }
msg-not-logged-in = 未登入

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML 解析錯誤：{ $e }
yaml-not-mapping = YAML 必須是映射（鍵：值對）；純文字和純量無法儲存為 DAG-CBOR
dagcbor-encode-error = DAG-CBOR 編碼錯誤：{ $e }
cbor-decode-error = CBOR 解碼錯誤：{ $e }
cbor-json-error = CBOR 轉 JSON 錯誤：{ $e }
yaml-serialize-error = YAML 序列化錯誤：{ $e }
edit-reply-invalid = 無效的編輯回覆
doc-publish-ipld-error = IPLD 發布失敗：{ $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = 收件箱整理儲存錯誤：{ $e }
err-config-load = 設定載入錯誤：{ $e }
err-lang-persist = 語言儲存錯誤：{ $e }
err-history-parse = 歷史記錄解析錯誤：{ $e }
err-history-load = 歷史記錄載入錯誤：{ $e }
err-ipfs-reply-decode = IPFS 回覆解碼失敗：{ $e }
err-edit-cbor = CBOR 編輯錯誤：{ $e }
err-popup-blocked = 瀏覽器封鎖了彈出視窗
status-publishing = 發布中

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = 錯誤
rpc-error-detail = 錯誤: { $detail }
msg-new-message = ← [{ $from }] 新訊息 — 收件匣中 { $count } 則
err-edit-decode-failed = 編輯: 解碼失敗: { $e }
err-edit-fetch-failed = 編輯: 取得失敗: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = 無活動工作階段 — 無法刪除個人資料
profile-delete-error = 個人資料刪除失敗: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (無)
profiles-deleted = 個人資料 { $name } 已刪除
profiles-not-found = 找不到個人資料: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    透過 URL 連結開啟 zion
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
help-header-url = ── URL 參數 ─────────────────────────────────────────────────────────────────
help-url-intro =   分享一個連結，開啟 zion 時自動填入收件人：
help-url-msg =   ?msg=<did>                   預填：@<did>（文字訊息）
help-url-say =   ?say=<did>                   預填：@<did>:say（say 動詞）
help-url-emote =   ?emote=<did>                 預填：@<did>:emote（emote 動詞）
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   輸入框被預填但不會傳送 — 按 Enter 鍵傳送。
