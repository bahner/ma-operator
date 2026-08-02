# zion — 简体中文
lang-name = 中文（简体）
label-nick = 昵称
new-identity-nick-help = 为 ma-space 选择一个昵称。它只是昵称，你可以随时更改。
error-nick-required = 需要昵称
error-nick-invalid = 昵称不能包含空格或 @

# ── 登录页面 ──────────────────────────────────────────────────────────────
tab-login = 登录
tab-new-identity = 新建身份
tab-import-profile = 导入配置文件
label-passphrase = 密码短语
label-username = 用户名
label-confirm-passphrase = 确认密码短语
label-did = DID
label-profile-cid = 配置文件 CID
label-or-file = 或文件
btn-login = 登录
btn-export = 导出
btn-generate = 生成
btn-new-endpoint = 新端点
btn-import-profile = 导入配置文件
passphrase-warning = 丢失密码短语即丢失身份。无法恢复。
import-profile-help = 通过 CID 或文件导入配置文件。需要与发布时相同的密码短语。
import-profile-detected-user = 配置文件属于：{ $name }
status-unlocking = 解锁中...
status-generating = 生成身份中...
status-reading-file = 读取文件中...
status-fetching-profile = 正在从 IPFS 获取配置文件...
status-imported = 已导入 '{ $name }' — 切换到登录标签
status-importing-profile = 正在导入配置文件...
profile-import-done = 已为 '{ $name }' 导入配置文件 — 加载了 { $n } 个密钥
error-wrong-passphrase = 密码短语错误: { $e }
error-identity-not-found = 找不到身份 '{ $name }'
error-username-required = 需要用户名
error-passphrase-required = 需要密码短语
error-passphrases-no-match = 密码短语不匹配
error-profile-source-required = 提供 CID 或上传文件
error-did-required = 请输入您的 DID
error-profile-fetch = 无法获取配置文件：{ $e }
error-profile-no-username = 配置文件不包含用户名
error-profile-no-identity = 身份 '{ $name }' 未找到 — 请先导入身份

# ── 终端系统消息 ──────────────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — 已以 { $username } 身份登录
msg-type-help = 输入 .help 查看命令列表。
msg-getting-started = 试试：say Hello world、look、.help 或 help。
msg-connecting = 正在连接到 iroh...
msg-iroh-ready = iroh 端点就绪
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID 已通过本地 ma ({ $url }) 发布
msg-identity-publication-propagating = 身份发布仍在传播；entry 已延迟：{ $e }
msg-identity-first-publish = 正在首次发布身份。这最多可能需要 { $seconds } 秒。
msg-ma-connecting-matrix = 正在尝试将你连接到 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 已声明本地 間
msg-local-ma-already-claimed = 本地 間 已被声明
msg-local-ma-claim-failed = 无法声明本地 間
msg-identity-not-published = 未在线找到身份 — 如果本地安装了 ma，请运行 '.ma [port]' 然后 '.my.identity!publish @ma'。输入 '.help/publish' 查看详情。
msg-blocked = ⊗ 已拦截 [{ $cap }]: { $from }
msg-focus-cleared = 焦点已清除
msg-focusing = 将 { $did } 聚焦为 { $prompt }
msg-set = { $path }: { $value }
msg-deleted = 已删除 { $path }（{ $count } 项）
msg-read-only = { $path } 为只读
msg-subtree-set = { $path } 是子树；拒绝设置
msg-ancestor-leaf = { $path } 的某个祖先是叶节点；拒绝遮蔽
msg-key-not-found = 找不到键: { $path }
msg-no-match = 无匹配
msg-link-not-connected = 链接获取错误：未连接
msg-link-fetch-error = 链接获取错误: { $e }
msg-link-key-not-found = 在链接文档中找不到键 `{ $key }`

# ── 别名验证 ──────────────────────────────────────────────────────────────
err-alias-name-empty = 别名不能为空
err-alias-has-dot = 别名不能包含 '.'
err-alias-has-fragment = 别名不能包含 '#'
err-alias-value-fragment = 别名值最多可包含一个非空 DID-URL 片段
err-alias-value-path = 别名值必须是 did:ma:<ipns> DID 或 DID-URL（无路径）
err-alias-not-did = 别名值必须以 did:ma: 开头
err-unknown-alias = 未知别名: @{ $name }
err-bare-did = 期望纯 did:ma:<ipns>（无片段或路径），得到 { $did }

# ── 编辑器 ────────────────────────────────────────────────────────────────
btn-save = 保存
btn-eval = 执行
btn-cancel = 取消
msg-jobs-cancelled = 任务已取消
btn-close = 关闭
btn-reply = 回复
btn-publish = 发布
btn-publish-ipld = 发布 IPLD
msg-reply-sent = 回复已发送
msg-reply-failed = 回复失败: { $e }
msg-entity-publish-sent = 实体 { $name }：发布请求已发送
msg-entity-publish-failed = 实体发布失败: { $e }
msg-kind-publish-failed = 种类发布失败：{ $e }
msg-field-publish-sent = 实体 { $name }.{ $field }：发布请求已发送
msg-field-publish-failed = 字段发布失败: { $e }
msg-acl-publish-sent = 运行时 ACL：发布请求已发送
msg-crud-edit-publish-sent = { $path }：发布请求已发送
msg-acl-publish-failed = 运行时 ACL 发布失败: { $e }
msg-yaml-error = YAML 错误: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = 已获取 { $cid } — 执行前请审查
msg-fetch-failed = 获取 { $cid }: { $e }

# ── 动词 — 收件箱 ─────────────────────────────────────────────────────────
inbox-empty = 收件箱为空
inbox-entry-not-found = 找不到收件箱条目 { $n }
inbox-no-message-id = 收件箱条目 { $n } 没有 message_id
inbox-no-verb = 收件箱条目 { $n } 没有 `{ $verb }` 动词
inbox-filter-no-arg = 过滤器需要 DID 或别名参数
inbox-filter-empty = 没有来自 { $did } 的消息

# ── 动词 — 运行时 ─────────────────────────────────────────────────────────
discover-fetch-failed = 发现失败于 { $url }: { $e }
discover-json-error = 发现失败：来自 { $url } 的无效 JSON: { $e }
discover-missing-did = 发现失败：status.json 缺少必填字段 `did`
discover-invalid-did = 发现失败：期望 `did` 以 did:ma: 开头，得到 `{ $did }`
discover-no-endpoint = 发现警告：status.json 中缺少 `endpoint_id`；仅存储了 DID
discover-hint-endpoint-not-found = 提示：未找到端点。请确认 `ma` 正在运行，并在 5003 端口公开 /status.json。
discover-hint-server-error = 提示：运行时返回了服务器错误。请检查 `ma` 日志并重试。
discover-hint-network = 提示：网络/连接问题。启动 `ma`，确认 localhost:5003 可访问，并在浏览器中允许本地 HTTP 访问。
discover-hint-generic = 提示：确认 `ma` 和 IPFS Desktop 正在运行，然后重试 `.ma`。
discover-success = 已在 { $url } 发现 ma
discover-did-line = DID: { $did }
discover-alias-hint =   已创建别名 @ma — 运行 '.my.identity!publish @ma' 以发布你的身份。
claim-success = 运行时已为 { $did } 声明
claim-conflict = 运行时已被另一身份声明
claim-already-owned = Runtime 已被此身份声明
claim-http-failed = 声明失败：HTTP { $status }
claim-error = 声明失败: { $e }
claim-no-session = 未登录；请先登录后再声明运行时
runtime-no-verb = { $path } 没有 `{ $verb }` 动词

# ── 动词 — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl 已重置（完全开放）
acl-persist-error = 持久化错误: { $e }
acl-no-verb = .my.acl 没有 `{ $verb }` 动词

# ── 动词 — 身份 ───────────────────────────────────────────────────────────
publish-usage = 用法: .my.identity!publish <did-或-别名>
identity-exported = 包已下载为 { $filename }
identity-export-failed = 导出失败：{ $e }

# ── 动词 — 文档 ───────────────────────────────────────────────────────────
doc-content-empty = { $path }.content 为空
doc-save-first = { $path }.content 为空 — 请先保存
doc-missing-name = 缺少文档名称
doc-publish-usage = 用法: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = 用法: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = 发布 { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = 发布失败 [{ $code }]：{ $err }
doc-publish-error-hint = 提示：{ $hint }
doc-publish-hint-session = 请重新登录，以便 ego 可以访问你的身份密钥
doc-publish-hint-target = 使用有效的发布者 DID，或能解析为裸 did:ma:<ipns> 的别名
doc-publish-hint-network = 确认 ma 运行时和 IPFS 可访问，然后重试
doc-publish-hint-resolve = 确认发布者 DID 文档已发布，并包含可访问的端点
doc-publish-hint-acl = 请发布者运维人员在 ACL 中允许你的 DID
doc-publish-hint-runtime = 运行时/插件拒绝了请求；检查原因并修复实体/运行时后重试
doc-publish-hint-ipfs = 检查本地 Kubo/IPFS 健康状态和发布者运行时状态
doc-publish-hint-unknown = 查看运行时日志以了解详细原因，然后重试
doc-store-sent = 存储请求已发送（{ $id }）→ { $publisher }；CID 将通过 RPC 回复到达
doc-ipld-store-sent = IPLD 存储请求已发送（{ $id }）→ { $publisher }；CID 将通过 RPC 回复到达
doc-fetch-done = 已获取 { $cid } → { $path }.content（未执行）
doc-fetch-failed = 获取 { $cid }: { $e }
doc-fetch-usage = 用法: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid 未设置
doc-no-verb = { $path } 没有 `{ $verb }` 动词
path-no-verb = { $path } 没有 `{ $verb }` 动词

# ── 帮助文本 — 标题 ───────────────────────────────────────────────────────
help-header-zion = ── zion 命令 ─────────────────────────────────────────────────────────────
help-header-messaging = ── 消息传递 ──────────────────────────────────────────────────────────
help-header-config = ── 本地配置语法 ──────────────────────────────────────────────────────────
help-header-common = ── 常用路径 ──────────────────────────────────────────────────────────────
help-header-inbox = ── 收件箱 ────────────────────────────────────────────────────────────────
help-header-documents = ── 文档 ──────────────────────────────────────────────────────────────────
help-header-i18n = ── 语言────────────────────────────────────────────────────────────────
help-header-ma = ── ma-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 进入间空间──────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── 帮助文本 — zion 命令 ──────────────────────────────────────────────────
help-cmd-help =   .help                        此帮助文本
help-cmd-clear =   .clear                       清屏
help-cmd-panic =   .panic                       最后手段 — 遇到问题时使用
help-cmd-history =   .history                     命令历史（连续重复项已合并）
help-cmd-logout =   .logout                      退出登录
help-cmd-batch =   .batch                       并行执行临时文档
help-cmd-batch-sync =   .batch:sync / .batch         逐行执行临时文档

# ── 帮助文本 — 消息传递 ───────────────────────────────────────────────────
help-msg-echo =   @alias                       显示已解析的 DID/DID-URL（不发送消息）
help-msg-send =   @alias!msg body / @alias:verb args           发送消息 / RPC 给角色
help-msg-fragment =   @alias#fragment:verb body  发送到带显式 DID 片段的别名
help-msg-escape =   \@name                       字面 @name（不查找别名）

# ── 帮助文本 — 焦点模式 ───────────────────────────────────────────────────

# ── 帮助文本 — 配置语法 ───────────────────────────────────────────────────
help-config-get =   .path                        获取叶值或列出子树
help-config-filter =   .path value                  按值过滤子树
help-config-set =   .path: value                 设置叶值
help-config-delete =   .path:                       删除叶或子树
help-config-verb =   .path!verb [args]            调用本地动词

# ── 帮助文本 — 常用路径 ───────────────────────────────────────────────────
help-my =   .my                          显示所有个人配置
help-aliases =   .my.aliases                  列出别名
help-aliases-set =   .my.aliases.<name>: <did-url>    添加/更新别名（DID 或 DID-URL）
help-aliases-del =   .my.aliases.<name>:          删除别名
help-runtime-discover =   .ma [port]          发现本地运行时并创建 @ma 别名
help-runtime-claim =   .ma [port]             用您的 DID 声明运行时所有权
help-identity =   .my.identity                 显示身份配置
help-identity-did =   .my.identity.did             显示自己的 DID（只读）
help-identity-publish =   .my.identity!publish @pub    通过发布服务发布自己的 DID
help-identity-export =   .my.identity!export          下载自己的身份包
help-config-path =   .config                      显示所有 .config.* 条目

# ── 帮助文本 — 收件箱 ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    列出收件箱（子树视图）
help-inbox-n =   .my.inbox.N                  显示条目 N 的字段
help-inbox-from =   .my.inbox.N.from             条目 N 的发送者 DID
help-inbox-reply =   .my.inbox.N!reply [body]     发送回复（无正文则打开编辑器）
help-inbox-open =   .my.inbox.N!open             在编辑器中只读打开条目内容
help-inbox-del =   .my.inbox.N:                 删除条目 N
help-inbox-delall =   .my.inbox:                   删除所有收件箱条目
help-inbox-flush =   .my.inbox!flush              将所有条目打印到终端
help-inbox-filter =   .my.inbox!filter @who        仅显示来自 @who 的条目
help-inbox-traverse =   .my.inbox.N.sender.<field>   惰性遍历发送者 DID 文档

# ── 帮助文本 — 文档 ───────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           用已保存内容打开编辑器
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     获取 CID，仅供审查打开
help-doc-eval =   .my.doc.<name>!eval           逐行执行已保存内容
help-doc-publish =   .my.doc.<name>!publish @pub   作为原始数据存储（任意类型）
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  将 YAML 存储为结构化 DAG-CBOR IPLD 节点
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    导入 CID 内容（不执行）
help-doc-cid =   .my.doc.<name>!cid            显示已存储的 CID
help-doc-del =   .my.doc.<name>:              删除文档

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n 存储与您的身份相关的语言偏好。
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               列出可用的语言代码

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 房间是 間 身份之间的空间。ma 让这些身份能够找到彼此并通信；当你的身份发布后，你就可以参与其中。
help-ma-command =   .ma [port]                   连接本地 ma runtime，读取 /status.json，并保存 .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     发布你的 DID 文档，让其他人能解析你的密钥和 endpoint
help-ma-security = 最清晰的信任边界，是你自己的 ma runtime 加上你自己的 IPFS Desktop/Kubo。远程 publisher 可能有用，但那意味着你依赖别人的服务。
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             如何进入 間 房间

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = 当你的身份已被知晓时，.enter @ma 会让你进入 間。找到一个 world，进入它，并从那里参与。
help-ma-entry-steps = 启动 IPFS Desktop 和 ma，然后运行 .ma。用 .my.identity!publish @ma 发布，找到一个 world，再用 .enter @ma 进入。
help-ma-entry-command =   .enter @ma                  通过 @ma runtime 进入 間
help-ma-entry-toggle =   .enter                       开启或关闭房间焦点；你的身份保持活跃
help-ma-entry-url =   ?enter=<runtime>             从共享 URL 登录后进入

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = 可用语言（使用 .my.i18n: <code> 设置）：
err-lang-not-found = 未找到语言: { $lang }

msg-send-failed = 发送失败：{ $e }
msg-not-logged-in = 未登录

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML 解析错误：{ $e }
yaml-not-mapping = YAML 必须是映射（键：值对）；纯文本和标量无法存储为 DAG-CBOR
dagcbor-encode-error = DAG-CBOR 编码错误：{ $e }
cbor-decode-error = CBOR 解码错误：{ $e }
cbor-json-error = CBOR 转 JSON 错误：{ $e }
yaml-serialise-error = YAML 序列化错误：{ $e }
edit-reply-invalid = 无效的编辑回复
doc-publish-ipld-error = IPLD 发布失败：{ $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = 收件箱整理保存错误：{ $e }
err-config-load = 配置加载错误：{ $e }
err-lang-persist = 语言保存错误：{ $e }
err-history-parse = 历史记录解析错误：{ $e }
err-history-load = 历史记录加载错误：{ $e }
err-ipfs-reply-decode = IPFS 回复解码失败：{ $e }
err-edit-cbor = CBOR 编辑错误：{ $e }
err-popup-blocked = 浏览器屏蔽了弹窗
status-publishing = 发布中

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = 错误
rpc-error-detail = 错误: { $detail }
msg-new-message = ← [{ $from }] 新消息 — 收件箱中 { $count } 条
msg-chat = { $sender } 说 { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } 说 { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } 进入了房间。
room-leave = * { $name } 离开了房间。
room-drop  = * { $name } 丢下了 { $thing }。
room-take  = * { $name } 拾起了 { $thing }。
err-edit-decode-failed = 编辑: 解码失败: { $e }
err-edit-fetch-failed = 编辑: 获取失败: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = 无活动会话 — 无法删除个人资料
profile-delete-error = 个人资料删除失败: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = 配置文件已加密并发送到 IPFS；CID 到达后将更新 DID 文档
profile-publish-done = 配置文件已发布 — DID 文档已使用 ma.agent CID 更新
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = 身份已发布 - 个人资料已更新
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = 二进制内容（不显示）
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (无)
profiles-deleted = 个人资料 { $name } 已删除
profiles-not-found = 未找到个人资料: { $name }

# -- Help topics index
help-header-topics = -- 主题 -- 输入 .help/<topic> 查看详情
help-topic-msg =   .help/msg                    消息
help-topic-ma = .help/ma                     ma-空间、发布、入口
help-topic-path = .help/path                   局部点路径语法
help-topic-my =   .help/my                     个人 config
help-topic-inbox =   .help/inbox                  收件箱
help-topic-doc =   .help/doc                    文档
help-topic-actor =   .help/actor                  远程 actor
help-topic-zscheme =   .help/zscheme               内联 Scheme 表达式和文档
help-topic-url =   .help/url                    通过 URL 链接打开 zion
help-topic-i18n = .help/i18n                   您身份的语言偏好
help-unknown-topic =   .help/{ $topic }: 未知主题

# -- Help actor section
help-header-actor = -- 远程 actor
help-actor-echo =   @actor                       显示已解析 DID
help-actor-text = @actor[#entity]!msg|!say|!emote body         发送直接/聊天/表情消息
help-actor-ping = @actor:ping                  活跃度
help-actor-entities =   @actor/entities              列出 entity
help-actor-entities-get = @actor/entities/<n>          获取实体节点
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     编辑 entity
help-actor-entities-del = @actor/entities/<n>:         删除实体
help-actor-config-get =   @actor/config/<key>          获取 config 值
help-actor-config-set =   @actor/config/<key>: val     设置 config 值
help-actor-acl = @actor/acl                   得到4
help-actor-acl-edit =   @actor/acl!edit              编辑 ACL
help-actor-fragment =   @actor#entity                发送到 plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC 到 plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  在会话环境中保留 5 回复
help-actor-wc-l = .my.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URL 参数 ─────────────────────────────────────────────────────────────────
help-url-intro =   分享一个链接，打开 zion 时自动填入收件人：
help-url-msg =   ?msg=<did>                   预填：@<did>!msg（文本消息）
help-url-say =   ?say=<did>                   预填：@<did>!say（say 动词）
help-url-emote =   ?emote=<did>                 预填：@<did>!emote（emote 动词）
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             登录后进入运行时世界
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   输入框被预填但不会发送 — 按 Enter 键发送。
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                将你的身份发布到网络
help-header-publish = ── 发布身份 ──────────────────────────────────────────────────────────────────
help-publish-intro = 发布使你的身份在网络上可被发现。其他人可以查找你的 DID 来联系你。
help-publish-ma = 发布需要安装 ma（本地运行时）。它代表你将 ego 连接到 IPFS/IPNS。
help-publish-steps = 步骤：运行 '.ma [port]' 检测本地 ma，然后 '.my.identity!publish @ma'。
help-publish-without = 未发布时，其他人无法联系你 — 即使知道你的 DID，也无法解析你的 endpoint。
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = 请指定配置文件名：.profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = 收集batch-type命令，以.batch结尾
batch-already-collecting = 已收集一批 — 首先以 .batch 结尾
batch-empty = 批次为空 — 没有可运行的内容
batch-running = 正在运行 batch…
batch-step-timeout = 批处理步骤超时

batch-done = batch 已完成，用时 { $secs }s — { $steps } 步
batch-done-error = batch 已完成但有错误，用时 { $secs }s — { $steps } 步
msg-timeout = 消息超时（60s 内无回复）
err-unknown-command = 未知命令：{ $path }
err-read-only-path = { $path } 为只读
help-cmd-batch-async =   .batch:async / .batch        并行执行临时文档


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = 获取 CID { $cid } 失败：{ $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = 无效的 CID：{ $value }
label-runtime = 马
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = 警告：您的IPNS私钥将被发送到此运行时用于身份发布。请仅使用您完全信任的运行时。

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme 会求值嵌入在 zion 命令中的 Scheme 表达式，并在发送前把结果拼回这一行。
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    内联示例；发送 "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             定义会在当前登录会话中保留
help-zscheme-doc = 文档: https://github.com/bahner/rust-ma-zscheme
