# zion — 简体中文
lang-name = 中文（简体）

# ── 登录页面 ──────────────────────────────────────────────────────────────
tab-login = 登录
tab-new-identity = 新建身份
tab-import = 导入
label-passphrase = 密码短语
label-username = 用户名
label-confirm-passphrase = 确认密码短语
btn-login = 登录
btn-export = 导出
btn-generate = 生成
passphrase-warning = 丢失密码短语即丢失身份。无法恢复。
import-help = 选择已导出的 .zion.json 文件。密钥包保持加密状态。
status-unlocking = 解锁中...
status-generating = 生成身份中...
status-reading-file = 读取文件中...
status-imported = 已导入 '{ $name }' — 切换到登录标签
error-wrong-passphrase = 密码短语错误: { $e }
error-identity-not-found = 找不到身份 '{ $name }'
error-username-required = 需要用户名
error-passphrase-required = 需要密码短语
error-passphrases-no-match = 密码短语不匹配

# ── 终端系统消息 ──────────────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — 已以 { $username } 身份登录
msg-type-help = 输入 .help 查看命令列表。
msg-connecting = 正在连接到 iroh...
msg-iroh-ready = iroh 端点就绪
msg-iroh-failed = iroh: { $e }
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
err-alias-has-fragment = 别名不能包含 '#'
err-alias-value-fragment = 别名值必须是纯 did:ma:<ipns>（无片段）
err-alias-value-path = 别名值必须是纯 did:ma:<ipns>（无路径）
err-alias-not-did = 别名值必须以 did:ma: 开头
err-unknown-alias = 未知别名: @{ $name }
err-bare-did = 期望纯 did:ma:<ipns>（无片段或路径），得到 { $did }

# ── 编辑器 ────────────────────────────────────────────────────────────────
btn-save = 保存
btn-eval = 执行
btn-cancel = 取消
btn-close = 关闭
btn-reply = 回复
btn-publish = 发布
btn-publish-ipld = 发布 IPLD
msg-reply-sent = 回复已发送
msg-reply-failed = 回复失败: { $e }
msg-entity-publish-sent = 实体 { $name }：发布请求已发送
msg-entity-publish-failed = 实体发布失败: { $e }
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

# ── 动词 — 运行时 ─────────────────────────────────────────────────────────
discover-fetch-failed = 发现失败于 { $url }: { $e }
discover-json-error = 发现失败：来自 { $url } 的无效 JSON: { $e }
discover-missing-did = 发现失败：status.json 缺少必填字段 `did`
discover-invalid-did = 发现失败：期望 `did` 以 did:ma: 开头，得到 `{ $did }`
discover-no-endpoint = 发现警告：status.json 中缺少 `endpoint_id`；仅存储了 DID
discover-success = 已在 { $url } 发现 ma
discover-did-line = DID: { $did }
discover-alias-hint =   别名 @ma 已创建 — 发布命令: .my.identity:publish @ma
claim-success = 运行时已为 { $did } 声明
claim-conflict = 运行时已被另一身份声明
claim-http-failed = 声明失败：HTTP { $status }
claim-error = 声明失败: { $e }
claim-no-session = 未登录；请先登录后再声明运行时
runtime-no-verb = { $path } 没有 `{ $verb }` 动词

# ── 动词 — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl 已重置（完全开放）
acl-persist-error = 持久化错误: { $e }
acl-no-verb = .my.acl 没有 `{ $verb }` 动词

# ── 动词 — 身份 ───────────────────────────────────────────────────────────
publish-usage = 用法: .my.identity:publish <did-或-别名>

# ── 动词 — 文档 ───────────────────────────────────────────────────────────
doc-content-empty = { $path }.content 为空
doc-save-first = { $path }.content 为空 — 请先保存
doc-missing-name = 缺少文档名称
doc-publish-usage = 用法: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = 用法: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = 发布 { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = 存储请求已发送（{ $id }）→ { $publisher }；CID 将通过 RPC 回复到达
doc-ipld-store-sent = IPLD 存储请求已发送（{ $id }）→ { $publisher }；CID 将通过 RPC 回复到达
doc-fetch-done = 已获取 { $cid } → { $path }.content（未执行）
doc-fetch-failed = 获取 { $cid }: { $e }
doc-fetch-usage = 用法: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid 未设置
doc-no-verb = { $path } 没有 `{ $verb }` 动词
path-no-verb = { $path } 没有 `{ $verb }` 动词

# ── 帮助文本 — 标题 ───────────────────────────────────────────────────────
help-header-zion = ── zion 命令 ─────────────────────────────────────────────────────────────
help-header-messaging = ── 消息传递 ──────────────────────────────────────────────────────────
help-header-focus = ── 焦点模式 ──────────────────────────────────────────────────────────────
help-header-config = ── 本地配置语法 ──────────────────────────────────────────────────────────
help-header-common = ── 常用路径 ──────────────────────────────────────────────────────────────
help-header-inbox = ── 收件箱 ────────────────────────────────────────────────────────────────
help-header-documents = ── 文档 ──────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── 帮助文本 — zion 命令 ──────────────────────────────────────────────────
help-cmd-help =   .help                        此帮助文本
help-cmd-clear =   .clear                       清屏
help-cmd-panic =   .panic                       最后手段 — 遇到问题时使用
help-cmd-logout =   .logout                      退出登录

# ── 帮助文本 — 消息传递 ───────────────────────────────────────────────────
help-msg-echo =   @alias                       回显已解析的 DID（不发送消息）
help-msg-send =   @alias[:verb] body           发送消息 / RPC 给角色
help-msg-fragment =   @alias#fragment[:verb] body  发送到带显式 DID 片段的别名
help-msg-escape =   \@name                       字面 @name（不查找别名）

# ── 帮助文本 — 焦点模式 ───────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       聚焦角色（更改提示符）
help-focus-clear =   .use                         清除焦点

# ── 帮助文本 — 配置语法 ───────────────────────────────────────────────────
help-config-get =   .path                        获取叶值或列出子树
help-config-filter =   .path value                  按值过滤子树
help-config-set =   .path: value                 设置叶值
help-config-delete =   .path:                       删除叶或子树
help-config-verb =   .path:verb [args]            调用本地动词

# ── 帮助文本 — 常用路径 ───────────────────────────────────────────────────
help-my =   .my                          显示所有个人配置
help-aliases =   .my.aliases                  列出别名
help-aliases-set =   .my.aliases.<name>: <did>    添加/更新别名（纯 DID，无 #fragment）
help-aliases-del =   .my.aliases.<name>:          删除别名
help-runtime-discover =   .my.ma:discover          发现本地运行时并创建 @ma 别名
help-runtime-claim =   .my.ma:claim             用您的 DID 声明运行时所有权
help-identity =   .my.identity                 显示身份配置
help-identity-did =   .my.identity.did             显示自己的 DID（只读）
help-identity-publish =   .my.identity:publish @pub    通过发布服务发布自己的 DID
help-config-path =   .config                      显示所有 .config.* 条目

# ── 帮助文本 — 收件箱 ─────────────────────────────────────────────────────
help-inbox =   .my.inbox                    列出收件箱（子树视图）
help-inbox-n =   .my.inbox.N                  显示条目 N 的字段
help-inbox-from =   .my.inbox.N.from             条目 N 的发送者 DID
help-inbox-reply =   .my.inbox.N:reply [body]     发送回复（无正文则打开编辑器）
help-inbox-open =   .my.inbox.N:open             在编辑器中只读打开条目内容
help-inbox-del =   .my.inbox.N:                 删除条目 N
help-inbox-delall =   .my.inbox:                   删除所有收件箱条目
help-inbox-flush =   .my.inbox:flush              将所有条目打印到终端
help-inbox-traverse =   .my.inbox.N.sender.<field>   惰性遍历发送者 DID 文档

# ── 帮助文本 — 文档 ───────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           用已保存内容打开编辑器
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     获取 CID，仅供审查打开
help-doc-eval =   .my.doc.<name>:eval           逐行执行已保存内容
help-doc-publish =   .my.doc.<name>:publish @pub   作为原始数据存储（任意类型）
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  将 YAML 存储为结构化 DAG-CBOR IPLD 节点
help-doc-fetch =   .my.doc.<name>:fetch <cid>    导入 CID 内容（不执行）
help-doc-cid =   .my.doc.<name>:cid            显示已存储的 CID
help-doc-del =   .my.doc.<name>:              删除文档

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
yaml-serialize-error = YAML 序列化错误：{ $e }
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
err-edit-decode-failed = 编辑: 解码失败: { $e }
err-edit-fetch-failed = 编辑: 获取失败: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = 无活动会话 — 无法删除个人资料
profile-delete-error = 个人资料删除失败: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (无)
profiles-deleted = 个人资料 { $name } 已删除
profiles-not-found = 未找到个人资料: { $name }
