# zion — 日本語
lang-name = 日本語

# ── ログインページ ────────────────────────────────────────────────────────
tab-login = ログイン
tab-new-identity = 新しいアイデンティティ
tab-import = インポート
label-passphrase = パスフレーズ
label-username = ユーザー名
label-confirm-passphrase = パスフレーズの確認
btn-login = ログイン
btn-export = エクスポート
btn-generate = 生成
passphrase-warning = パスフレーズを失うとアイデンティティも失います。回復はできません。
import-help = エクスポートされた .zion.json ファイルを選択してください。パッケージは暗号化されたままです。
status-unlocking = ロック解除中...
status-generating = アイデンティティを生成中...
status-reading-file = ファイルを読み込み中...
status-imported = '{ $name }' をインポートしました — ログインタブに切り替えてください
error-wrong-passphrase = パスフレーズが間違っています: { $e }
error-identity-not-found = アイデンティティ '{ $name }' が見つかりません
error-username-required = ユーザー名は必須です
error-passphrase-required = パスフレーズは必須です
error-passphrases-no-match = パスフレーズが一致しません

# ── ターミナルシステムメッセージ ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } としてログイン済み
msg-type-help = .help と入力するとコマンド一覧が表示されます。
msg-connecting = iroh に接続中...
msg-iroh-ready = iroh エンドポイント準備完了
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ ブロック済み [{ $cap }]: { $from }
msg-focus-cleared = フォーカスをクリアしました
msg-focusing = { $did } を { $prompt } としてフォーカス中
msg-set = { $path }: { $value }
msg-deleted = { $path } を削除しました ({ $count } 件)
msg-read-only = { $path } は読み取り専用です
msg-subtree-set = { $path } はサブツリーです。設定を拒否しました
msg-ancestor-leaf = { $path } の祖先がリーフです。シャドウイングを拒否しました
msg-key-not-found = キーが見つかりません: { $path }
msg-no-match = 一致なし
msg-link-not-connected = リンク取得エラー: 接続されていません
msg-link-fetch-error = リンク取得エラー: { $e }
msg-link-key-not-found = リンクされたドキュメントにキー `{ $key }` が見つかりません

# ── エイリアス検証 ────────────────────────────────────────────────────────
err-alias-name-empty = エイリアス名は空にできません
err-alias-has-dot = エイリアス名に '.' を含めることはできません
err-alias-has-fragment = エイリアス名に '#' を含めることはできません
err-alias-value-fragment = エイリアスの値はフラグメントなしの純粋な did:ma:<ipns> である必要があります
err-alias-value-path = エイリアスの値はパスなしの純粋な did:ma:<ipns> である必要があります
err-alias-not-did = エイリアスの値は did:ma: で始まる必要があります
err-unknown-alias = 不明なエイリアス: @{ $name }
err-bare-did = フラグメントもパスもない純粋な did:ma:<ipns> が必要ですが、{ $did } を受け取りました

# ── エディター ────────────────────────────────────────────────────────────
btn-save = 保存
btn-eval = 実行
btn-cancel = キャンセル
btn-close = 閉じる
btn-reply = 返信
btn-publish = 公開
btn-publish-ipld = 公開 IPLD
msg-reply-sent = 返信を送信しました
msg-reply-failed = 返信の送信に失敗しました: { $e }
msg-entity-publish-sent = エンティティ { $name }: 公開を送信しました
msg-entity-publish-failed = エンティティの公開に失敗しました: { $e }
msg-kind-publish-failed = 種別の公開に失敗しました: { $e }
msg-field-publish-sent = エンティティ { $name }.{ $field }: 公開を送信しました
msg-field-publish-failed = フィールドの公開に失敗しました: { $e }
msg-acl-publish-sent = ランタイム ACL: 公開を送信しました
msg-crud-edit-publish-sent = { $path }: 公開を送信しました
msg-acl-publish-failed = ランタイム ACL の公開に失敗しました: { $e }
msg-yaml-error = YAML エラー: { $e }
msg-editor-saved = { $path }:保存
msg-fetch-review = { $cid } を取得しました — 実行前に確認してください
msg-fetch-failed = { $cid } の取得エラー: { $e }

# ── 動詞 — 受信トレイ ────────────────────────────────────────────────────
inbox-empty = 受信トレイは空です
inbox-entry-not-found = 受信トレイのエントリー { $n } が見つかりません
inbox-no-message-id = 受信トレイのエントリー { $n } に message_id がありません
inbox-no-verb = 受信トレイのエントリー { $n } に動詞 `{ $verb }` がありません

# ── 動詞 — ランタイム ─────────────────────────────────────────────────────
discover-fetch-failed = { $url } での検出に失敗しました: { $e }
discover-json-error = 検出に失敗しました: { $url } からの無効な JSON: { $e }
discover-missing-did = 検出に失敗しました: status.json に必須フィールド `did` がありません
discover-invalid-did = 検出に失敗しました: `did` は did:ma: で始まる必要がありますが、`{ $did }` を受け取りました
discover-no-endpoint = 検出の警告: status.json に `endpoint_id` がありません。DID のみ保存しました
discover-success = { $url } で ma を検出しました
discover-did-line = DID: { $did }
discover-alias-hint =   エイリアス @ma を作成しました — 次で公開してください: .my.identity:publish @ma
claim-success = { $did } のランタイムを要求しました
claim-conflict = ランタイムはすでに別のアイデンティティにより要求されています
claim-http-failed = 要求に失敗しました: HTTP { $status }
claim-error = 要求に失敗しました: { $e }
claim-no-session = ログインしていません。ランタイムを要求するには先にログインしてください
runtime-no-verb = { $path } に動詞 `{ $verb }` がありません

# ── 動詞 — アクセス制御 ──────────────────────────────────────────────────
acl-reset = .my.acl をリセットしました (完全に開放)
acl-persist-error = 保存エラー: { $e }
acl-no-verb = .my.acl に動詞 `{ $verb }` がありません

# ── 動詞 — アイデンティティ ──────────────────────────────────────────────
publish-usage = 使用方法: .my.identity:publish <did-またはエイリアス>

# ── 動詞 — ドキュメント ──────────────────────────────────────────────────
doc-content-empty = { $path }.content が空です
doc-save-first = { $path }.content が空です — 先に保存してください
doc-missing-name = ドキュメント名がありません
doc-publish-usage = 使用方法: .my.doc.<名前>:publish <発行者>
doc-publish-ipld-usage = 使用方法: .my.doc.<名前>:publish-ipld <発行者>
doc-publish-failed = { $path } の公開エラー: { $e }
doc-publish-ipld-failed = { $path } の IPLD 公開エラー: { $e }
doc-store-sent = 保存リクエストを送信しました ({ $id }) → { $publisher }。CID は RPC レスポンスで届きます
doc-ipld-store-sent = IPLD 保存リクエストを送信しました ({ $id }) → { $publisher }。CID は RPC レスポンスで届きます
doc-fetch-done = { $cid } を取得しました → { $path }.content (実行されていません)
doc-fetch-failed = { $cid } の取得エラー: { $e }
doc-fetch-usage = 使用方法: .my.doc.<名前>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid が設定されていません
doc-no-verb = { $path } に動詞 `{ $verb }` がありません
path-no-verb = { $path } に動詞 `{ $verb }` がありません

# ── ヘルプテキスト — ヘッダー ─────────────────────────────────────────────
help-header-zion = ── zion コマンド ──────────────────────────────────────────────────────────
help-header-messaging = ── メッセージ送受信 ────────────────────────────────────────────────────────
help-header-focus = ── フォーカスモード ─────────────────────────────────────────────────────────
help-header-config = ── ローカル設定文法 ─────────────────────────────────────────────────────────
help-header-common = ── よく使うパス ─────────────────────────────────────────────────────────────
help-header-inbox = ── 受信トレイ ──────────────────────────────────────────────────────────────
help-header-documents = ── ドキュメント ────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        このテキスト
help-cmd-clear =   .clear                       ターミナルをクリア
help-cmd-panic =   .panic                       最後の手段 — 困ったときに使用
help-cmd-history =   .history                     コマンド履歴（連続する重複を省略）
help-cmd-logout =   .logout                      ログアウト

help-msg-echo =   @alias                       解決済み DID を表示 (メッセージは送信されない)
help-msg-send =   @alias[:verb] body           アクターにメッセージ / RPC を送信
help-msg-fragment =   @alias#fragment[:verb] body  明示的な DID フラグメント付きエイリアスに送信
help-msg-escape =   \@name                       リテラル @name (エイリアス検索なし)

help-focus-set =   .use @alias [as @name]       アクターにフォーカス (プロンプトを変更)
help-focus-clear =   .use                         フォーカスをクリア

help-config-get =   .path                        リーフの値を取得またはサブツリーを一覧表示
help-config-filter =   .path value                  検索フィルター (値でフィルタリング)
help-config-set =   .path: value                 リーフを設定
help-config-delete =   .path:                       リーフまたはサブツリーを削除
help-config-verb =   .path:verb [args]            ローカル動詞を実行

help-my =   .my                          すべての個人設定を表示
help-aliases =   .my.aliases                  エイリアスを一覧表示
help-aliases-set =   .my.aliases.<name>: <did>    エイリアスを追加/更新 (純粋な DID、#フラグメントなし)
help-aliases-del =   .my.aliases.<name>:          エイリアスを削除
help-runtime-discover =   .my.ma:discover          ローカルランタイムを検出し @ma エイリアスを作成
help-runtime-claim =   .my.ma:claim             自分の DID でランタイムを要求
help-identity =   .my.identity                 アイデンティティ設定を表示
help-identity-did =   .my.identity.did             自分の DID を表示 (読み取り専用)
help-identity-publish =   .my.identity:publish @pub    発行サービスを通じて自分の DID を公開
help-config-path =   .config                      すべての .config.* エントリーを表示

help-inbox =   .my.inbox                    受信トレイを一覧表示 (サブツリービュー)
help-inbox-n =   .my.inbox.N                  エントリー N のフィールドを表示
help-inbox-from =   .my.inbox.N.from             エントリー N の送信者 DID
help-inbox-reply =   .my.inbox.N:reply [body]     返信を送信 (本文なしでエディターを開く)
help-inbox-open =   .my.inbox.N:open             読み取り専用エディターでコンテンツを開く
help-inbox-del =   .my.inbox.N:                 エントリー N を削除
help-inbox-delall =   .my.inbox:                   受信トレイのすべてのエントリーを削除
help-inbox-flush =   .my.inbox:flush              ターミナルにすべてのエントリーを出力
help-inbox-traverse =   .my.inbox.N.sender.<フィールド>  送信者の DID ドキュメントを遅延トラバース

help-doc-edit =   .my.doc.<名前>:edit           保存されたコンテンツでエディターを開く
help-doc-edit-cid =   .my.doc.<名前>:edit <cid>     CID を取得し、レビューのために開く
help-doc-eval =   .my.doc.<名前>:eval           保存されたコンテンツを一行ずつ実行
help-doc-publish =   .my.doc.<名前>:publish @pub   生のブロブとして保存 (すべてのタイプ)
help-doc-publish-ipld =   .my.doc.<名前>:publish-ipld @pub  YAML を構造化 DAG-CBOR IPLD ノードとして保存
help-doc-fetch =   .my.doc.<名前>:fetch <cid>    CID コンテンツをインポート (実行なし)
help-doc-cid =   .my.doc.<名前>:cid            保存された CID を表示
help-doc-del =   .my.doc.<名前>:              ドキュメントを削除

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = 利用可能な言語 (.my.i18n: <code> で設定):
err-lang-not-found = 言語が見つかりません: { $lang }

msg-send-failed = 送信失敗: { $e }
msg-not-logged-in = ログインしていません

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML解析エラー: { $e }
yaml-not-mapping = YAMLはマッピング（キー：値のペア）でなければなりません；プレーンテキストとスカラーはDAG-CBORとして保存できません
dagcbor-encode-error = DAG-CBORエンコードエラー: { $e }
cbor-decode-error = CBORデコードエラー: { $e }
cbor-json-error = CBORからJSONへの変換エラー: { $e }
yaml-serialize-error = YAMLシリアル化エラー: { $e }
edit-reply-invalid = 無効な編集返信
doc-publish-ipld-error = IPLD公開に失敗: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = 受信箱整理保存エラー: { $e }
err-config-load = 設定読み込みエラー: { $e }
err-lang-persist = 言語保存エラー: { $e }
err-history-parse = 履歴解析エラー: { $e }
err-history-load = 履歴読み込みエラー: { $e }
err-ipfs-reply-decode = IPFS返信デコード失敗: { $e }
err-edit-cbor = CBOR編集エラー: { $e }
err-popup-blocked = ブラウザによりポップアップがブロックされました
status-publishing = 公開中

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = エラー
rpc-error-detail = エラー: { $detail }
msg-new-message = ← [{ $from }] 新しいメッセージ — 受信トレイに { $count } 件
err-edit-decode-failed = 編集: デコード失敗: { $e }
err-edit-fetch-failed = 編集: 取得失敗: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = アクティブなセッションがありません — プロフィールを削除できません
profile-delete-error = プロフィールの削除に失敗しました: { $e }

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (なし)
profiles-deleted = プロフィール { $name } を削除しました
profiles-not-found = プロフィールが見つかりません: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
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
