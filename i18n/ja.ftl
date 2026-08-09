# zion — 日本語
lang-name = 日本語
label-nick = ニックネーム
new-identity-nick-help = 間-space で使うニックネームを選んでください。これはただのニックネームで、いつでも変更できます。
error-nick-required = ニックネームが必要です
error-nick-invalid = ニックネームには空白や @ を含められません

# ── ログインページ ────────────────────────────────────────────────────────
tab-login = ログイン
tab-new-identity = 新しいアイデンティティ
tab-import-profile = プロフィールをインポート
label-passphrase = パスフレーズ
label-username = ユーザー名
label-confirm-passphrase = パスフレーズの確認
label-did = DID
label-profile-cid = プロフィール CID
label-or-file = またはファイル
btn-login = ログイン
btn-export = エクスポート
btn-generate = 生成
btn-new-endpoint = 新しいエンドポイント
btn-import-profile = プロフィールをインポート
btn-show-qr = QRを表示
btn-scan-qr = QRをスキャン
qr-scan-hint = カメラをzionプロフィールのQRコードに向けてください。
qr-error-camera = カメラを利用できません: { $e }
qr-error-too-large = プロフィールが大きすぎてQRコードにできません
passphrase-warning = パスフレーズを失うとアイデンティティも失います。回復はできません。
import-profile-help = CIDまたはファイルでプロフィールをインポートします。公開時に使用したパスフレーズが必要です。
import-profile-detected-user = プロフィールの所有者: { $name }
status-unlocking = ロック解除中...
status-generating = アイデンティティを生成中...
status-reading-file = ファイルを読み込み中...
status-fetching-profile = IPFSからプロフィールを取得中...
status-imported = '{ $name }' をインポートしました — ログインタブに切り替えてください
status-importing-profile = プロフィールをインポート中...
profile-import-done = '{ $name }' のプロフィールをインポートしました — { $n } 個のキーを読み込みました
error-wrong-passphrase = パスフレーズが間違っています: { $e }
error-identity-not-found = アイデンティティ '{ $name }' が見つかりません
error-username-required = ユーザー名は必須です
error-passphrase-required = パスフレーズは必須です
error-passphrases-no-match = パスフレーズが一致しません
error-profile-source-required = CIDを入力するかファイルをアップロードしてください
error-did-required = DIDを入力してください
error-profile-fetch = プロフィールを取得できませんでした: { $e }
error-profile-no-username = プロフィールにユーザー名が含まれていません
error-profile-no-identity = アイデンティティ '{ $name }' が見つかりません — まずアイデンティティをインポートしてください

# ── ターミナルシステムメッセージ ──────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } としてログイン済み
msg-type-help = .help と入力するとコマンド一覧が表示されます。
msg-getting-started = まずは say Hello world、look、.help、help を試してください。
msg-connecting = iroh に接続中...
msg-iroh-ready = iroh エンドポイント準備完了
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID がローカル 間 ({ $url }) 経由で公開されました
msg-identity-publication-propagating = identity の公開はまだ伝播中です。entry は遅延しています: { $e }
msg-identity-first-publish = identity を初めて公開しています。最大 { $seconds } 秒かかる場合があります。
msg-ma-connecting-matrix = 間trix へ接続しようとしています
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = ローカル 間 を要求しました
msg-local-ma-already-claimed = ローカル 間 はすでに要求済みです
msg-local-ma-claim-failed = ローカル 間 の要求に失敗しました
msg-identity-not-published = オンラインで身元が見つかりません — maがローカルにインストールされている場合、'.ma [port]'を実行してから'.my.identity!publish @ma'を実行してください。詳細は'.help/publish'と入力してください。
msg-blocked = ⊗ ブロック済み [{ $cap }]: { $from }
msg-focus-cleared = フォーカスをクリアしました
msg-left = left
msg-focusing = { $did } を { $prompt } としてフォーカス中
msg-set = { $path }: { $value }
msg-deleted = { $path } を削除しました ({ $count } 件)
msg-read-only = { $path } は読み取り専用です
msg-subtree-set = { $path } はサブツリーです。設定を拒否しました
msg-ancestor-leaf = { $path } の祖先がリーフです。シャドウイングを拒否しました
msg-key-not-found = キーが見つかりません: { $path }
msg-link-not-connected = リンク取得エラー: 接続されていません
msg-link-fetch-error = リンク取得エラー: { $e }
msg-link-key-not-found = リンクされたドキュメントにキー `{ $key }` が見つかりません

# ── エイリアス検証 ────────────────────────────────────────────────────────
err-alias-name-empty = エイリアス名は空にできません
err-alias-has-dot = エイリアス名に '.' を含めることはできません
err-alias-has-fragment = エイリアス名に '#' を含めることはできません
err-alias-value-fragment = エイリアス値に含められる空でない DID-URL フラグメントは最大 1 つです
err-alias-value-path = エイリアス値は did:ma:<ipns> DID または DID-URL である必要があります (パスなし)
err-alias-not-did = エイリアスの値は did:ma: で始まる必要があります
err-unknown-alias = 不明なエイリアス: @{ $name }
err-bare-did = フラグメントもパスもない純粋な did:ma:<ipns> が必要ですが、{ $did } を受け取りました

# ── エディター ────────────────────────────────────────────────────────────
btn-save = 保存
btn-eval = 実行
btn-cancel = キャンセル
msg-jobs-cancelled = ジョブをキャンセルしました
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
inbox-filter-no-arg = フィルターにはDIDまたはエイリアスの引数が必要です
inbox-filter-empty = { $did } からのメッセージはありません

# ── 動詞 — ランタイム ─────────────────────────────────────────────────────
discover-fetch-failed = { $url } での検出に失敗しました: { $e }
discover-json-error = 検出に失敗しました: { $url } からの無効な JSON: { $e }
discover-missing-did = 検出に失敗しました: status.json に必須フィールド `did` がありません
discover-invalid-did = 検出に失敗しました: `did` は did:ma: で始まる必要がありますが、`{ $did }` を受け取りました
discover-no-endpoint = 検出の警告: status.json に `endpoint_id` がありません。DID のみ保存しました
discover-hint-endpoint-not-found = ヒント: エンドポイントが見つかりません。間 が実行中で、ポート 5003 で /status.json を公開していることを確認してください。
discover-hint-server-error = ヒント: ランタイムがサーバーエラーを返しました。間 のログを確認して再試行してください。
discover-hint-network = ヒント: ネットワーク/接続の問題です。間 を起動し、localhost:5003 に到達できることと、ブラウザでローカル HTTP アクセスが許可されていることを確認してください。
discover-hint-generic = ヒント: 間 と IPFS Desktop が実行中であることを確認してから `.ma` を再試行してください。
discover-success = { $url } で 間 を検出しました
discover-did-line = DID: { $did }
discover-alias-hint =   エイリアス @ma が作成されました — '.my.identity!publish @ma'を実行して身元を公開してください。
claim-success = { $did } のランタイムを要求しました
claim-conflict = ランタイムはすでに別のアイデンティティにより要求されています
claim-already-owned = Runtime はすでにこのアイデンティティにより要求されています
claim-http-failed = 要求に失敗しました: HTTP { $status }
claim-error = 要求に失敗しました: { $e }
claim-no-session = ログインしていません。ランタイムを要求するには先にログインしてください
runtime-no-verb = { $path } に動詞 `{ $verb }` がありません

# ── 動詞 — アクセス制御 ──────────────────────────────────────────────────
acl-reset = .my.acl をリセットしました (完全に開放)
acl-persist-error = 保存エラー: { $e }
acl-no-verb = .my.acl に動詞 `{ $verb }` がありません

# ── 動詞 — アイデンティティ ──────────────────────────────────────────────
publish-usage = 使用方法: .my.identity!publish <did-またはエイリアス>
identity-exported = バンドルを { $filename } としてダウンロードしました
identity-export-failed = エクスポート失敗: { $e }

# ── 動詞 — ドキュメント ──────────────────────────────────────────────────
doc-content-empty = { $path } が空です
doc-save-first = { $path } が空です — 先に保存してください
doc-missing-name = ドキュメント名がありません
doc-publish-usage = 使用方法: .my.doc.<名前>!publish <発行者>
doc-publish-ipld-usage = 使用方法: .my.doc.<名前>!publish-ipld <発行者>
doc-publish-failed = { $path } の公開エラー: { $e }
doc-publish-ipld-failed = { $path } の IPLD 公開エラー: { $e }
doc-publish-error-detail = 公開に失敗しました [{ $code }]: { $err }
doc-publish-error-hint = ヒント: { $hint }
doc-publish-hint-session = ego が識別キーにアクセスできるように再ログインしてください
doc-publish-hint-target = 有効な発行者 DID、または裸の did:ma:<ipns> に解決されるエイリアスを使用してください
doc-publish-hint-network = 間 ランタイムと IPFS に到達できることを確認して再試行してください
doc-publish-hint-resolve = 発行者の DID ドキュメントが公開され、到達可能なエンドポイントを含むことを確認してください
doc-publish-hint-acl = 発行者の運用者に ACL であなたの DID を許可してもらってください
doc-publish-hint-runtime = ランタイム/プラグインが要求を拒否しました。理由を確認し、エンティティ/ランタイム修正後に再試行してください
doc-publish-hint-ipfs = ローカル Kubo/IPFS の状態と発行者ランタイムの状態を確認してください
doc-publish-hint-unknown = 詳細な原因をランタイムログで確認して再試行してください
doc-store-sent = 保存リクエストを送信しました ({ $id }) → { $publisher }。CID は RPC レスポンスで届きます
doc-ipld-store-sent = IPLD 保存リクエストを送信しました ({ $id }) → { $publisher }。CID は RPC レスポンスで届きます
doc-fetch-done = { $cid } を取得しました → { $path } (実行されていません)
doc-fetch-failed = { $cid } の取得エラー: { $e }
doc-fetch-usage = 使用方法: .my.doc.<名前>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid が設定されていません
doc-no-verb = { $path } に動詞 `{ $verb }` がありません
path-no-verb = { $path } に動詞 `{ $verb }` がありません

# ── ヘルプテキスト — ヘッダー ─────────────────────────────────────────────
help-header-zion = ── zion コマンド ──────────────────────────────────────────────────────────
help-header-messaging = ── メッセージ送受信 ────────────────────────────────────────────────────────
help-header-config = ── ローカル設定文法 ─────────────────────────────────────────────────────────
help-header-common = ── よく使うパス ─────────────────────────────────────────────────────────────
help-header-inbox = ── 受信トレイ ──────────────────────────────────────────────────────────────
help-header-documents = ── ドキュメント ────────────────────────────────────────────────────────────
help-header-i18n = ── 言語 ───────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間に入ります ─────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

help-cmd-help =   .help                        このテキスト
help-cmd-clear =   .clear                       ターミナルをクリア
help-cmd-panic =   .panic                       最後の手段 — 困ったときに使用
help-cmd-history =   .history [n]                 コマンド履歴（連続する重複を省略）；省略可能なnを指定すると最後のn行だけ表示
help-cmd-logout =   .logout                      ログアウト
help-cmd-batch =   .batch                       スクラッチ文書を並列評価
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         スクラッチ文書を行ごとに評価

help-msg-echo =   @alias                       解決済み DID/DID-URL を表示 (メッセージは送信されません)
help-msg-send =   @alias!msg body / @alias:verb args           アクターにメッセージ / RPC を送信
help-msg-fragment =   @alias#fragment:verb body  明示的な DID フラグメント付きエイリアスに送信
help-msg-escape =   \@name                       リテラル @name (エイリアス検索なし)


help-config-get =   .path                        リーフの値を取得またはサブツリーを一覧表示
help-config-filter =   .path [名前]                 名前を含む子キー名を一覧表示
help-config-full =   .path. [名前]                名前を含む完全なサブツリー値を一覧表示
help-config-set =   .path: value                 リーフを設定
help-config-delete =   .path:                       リーフまたはサブツリーを削除
help-config-verb =   .path!verb [args]            ローカル動詞を実行

help-my =   .my                          すべての個人設定を表示
help-aliases =   .my.aliases                  エイリアスを一覧表示
help-aliases-set =   .my.aliases.<name>: <did-url>    エイリアスを追加/更新 (DID または DID-URL)
help-aliases-del =   .my.aliases.<name>:          エイリアスを削除
help-runtime-discover =   .ma [port]          ローカルランタイムを検出し @ma エイリアスを作成
help-runtime-claim =   .ma [port]             自分の DID でランタイムを要求
help-identity =   .my.identity                 アイデンティティ設定を表示
help-identity-did =   .my.identity.did             自分の DID を表示 (読み取り専用)
help-identity-publish =   .my.identity!publish @pub    発行サービスを通じて自分の DID を公開
help-identity-export =   .my.identity!export          自分の身元バンドルをダウンロード
help-config-path =   .config                      すべての .config.* エントリーを表示

help-inbox =   .my.inbox                    受信トレイを一覧表示 (サブツリービュー)
help-inbox-n =   .my.inbox.N                  エントリー N のフィールドを表示
help-inbox-from =   .my.inbox.N.from             エントリー N の送信者 DID
help-inbox-reply =   .my.inbox.N!reply [body]     返信を送信 (本文なしでエディターを開く)
help-inbox-open =   .my.inbox.N!open             読み取り専用エディターでコンテンツを開く
help-inbox-del =   .my.inbox.N:                 エントリー N を削除
help-inbox-delall =   .my.inbox:                   受信トレイのすべてのエントリーを削除
help-inbox-flush =   .my.inbox!flush              ターミナルにすべてのエントリーを出力
help-inbox-filter =   .my.inbox!filter @who        @who からの項目のみ表示
help-inbox-traverse =   .my.inbox.N.sender.<フィールド>  送信者の DID ドキュメントを遅延トラバース

help-doc-edit =   .my.doc.<名前>!edit           保存されたコンテンツでエディターを開く
help-doc-edit-cid =   .my.doc.<名前>!edit /ipfs/<cid>     CID を取得し、レビューのために開く
help-doc-eval =   .my.doc.<名前>!eval           保存されたコンテンツを一行ずつ実行
help-doc-publish =   .my.doc.<名前>!publish @pub   生のブロブとして保存 (すべてのタイプ)
help-doc-publish-ipld =   .my.doc.<名前>!publish-ipld @pub  YAML を構造化 DAG-CBOR IPLD ノードとして保存
help-doc-fetch =   .my.doc.<名前>!fetch /ipfs/<cid>    CID コンテンツをインポート (実行なし)
help-doc-cid =   .my.doc.<名前>!cid            保存された CID を表示
help-doc-del =   .my.doc.<名前>:              ドキュメントを削除

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n には、ユーザーの ID に関連付けられた言語設定が保存されます。
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               利用可能な言語コードをリストする

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間の部屋は、間のアイデンティティ同士のあいだにある場所です。ma はそれらのアイデンティティが互いを見つけ、通信できるようにします。あなたのアイデンティティが公開されると、参加できるようになります。
help-ma-command =   .ma [port]                   ローカルの 間 runtime に接続し、/status.json を読み、.ma.ctx.* を保存する
help-ma-publish =   .my.identity!publish @ma     DID ドキュメントを公開し、他の人が鍵と endpoint を解決できるようにする
help-ma-security = もっとも明確な信頼境界は、自分の 間 runtime と自分の IPFS Desktop/Kubo です。リモート publisher は便利な場合もありますが、その場合は他人のサービスに依存します。
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間の部屋への入り方

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = あなたのアイデンティティが知られると、.enter @ma で 間 に入れます。world を見つけてそこに入り、そこから参加します。
help-ma-entry-steps = IPFS Desktop と ma を起動し、.ma を実行します。.my.identity!publish @ma で公開し、world を見つけ、.enter @ma で入ります。
help-ma-entry-command =   .enter @ma                  @ma runtime 経由で 間 に入る
help-ma-entry-toggle =   .enter                       部屋フォーカスをオンまたはオフにします。アイデンティティは有効なままです
help-ma-entry-url =   ?enter=<runtime>             共有 URL からログインしたあとに入る

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
yaml-serialise-error = YAMLシリアル化エラー: { $e }
edit-reply-invalid = 無効な編集返信
doc-publish-ipld-error = IPLD公開に失敗: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = 受信箱整理保存エラー: { $e }
err-config-load = 設定読み込みエラー: { $e }
err-lang-persist = 言語保存エラー: { $e }
err-history-parse = 履歴解析エラー: { $e }
err-history-load = 履歴読み込みエラー: { $e }
err-history-count-invalid = 履歴の件数は正の整数でなければなりません
err-ipfs-reply-decode = IPFS返信デコード失敗: { $e }
err-edit-cbor = CBOR編集エラー: { $e }
err-popup-blocked = ブラウザによりポップアップがブロックされました
status-publishing = 公開中

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = エラー
rpc-error-detail = エラー: { $detail }
msg-new-message = ← [{ $from }] 新しいメッセージ — 受信トレイに { $count } 件
msg-chat = { $sender }「{ $body }」

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } が言う { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } が入室しました。
room-leave = * { $name } が退室しました。
room-drop  = * { $name } が { $thing } を落とした。
room-take  = * { $name } が { $thing } を拾った。
err-edit-decode-failed = 編集: デコード失敗: { $e }
err-edit-fetch-failed = 編集: 取得失敗: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = アクティブなセッションがありません — プロフィールを削除できません
profile-delete-error = プロフィールの削除に失敗しました: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = プロファイルは暗号化されて IPFS に送信されました。CID が届くと DID ドキュメントが更新されます
profile-publish-done = プロファイルを公開しました — DID ドキュメントを ma.agent CID で更新しました
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = 身元はすでに公開されています - プロフィールは最新です
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = バイナリコンテンツ (表示されません)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (なし)
profiles-deleted = プロフィール { $name } を削除しました
profiles-not-found = プロフィールが見つかりません: { $name }

# -- Help topics index
help-header-topics = -- トピック -- 詳細は .help/<topic> と入力
help-topic-msg =   .help/msg                    メッセージ
help-topic-ma = .help/ma                     間-スペース、公開、およびエントリ
help-topic-path = .help/path                   ローカルドットパス文法
help-topic-my =   .help/my                     個人 config
help-topic-inbox =   .help/inbox                  受信箱
help-topic-doc =   .help/doc                    文書
help-topic-actor =   .help/actor                  リモート actor
help-topic-zscheme =   .help/zscheme               インライン Scheme 式とドキュメント
help-topic-url =   .help/url                    URLリンクからzionを開く
help-topic-i18n = .help/i18n                   自分のアイデンティティに合わせた言語設定
help-unknown-topic =   .help/{ $topic }: 不明なトピック

# -- Help actor section
help-header-actor = -- リモート actor
help-actor-echo =   @actor                       解決済み DID を表示
help-actor-text = @actor[#entity]!msg|!say|!emote body         ダイレクト/チャット/エモートメッセージを送信する
help-actor-ping = @actor:ping                  活性ピング
help-actor-entities =   @actor/entities              entity を一覧表示
help-actor-entities-get = @actor/entities/<n>          エンティティノードを取得する
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity を編集
help-actor-entities-del = @actor/entities/<n>:         エンティティの削除
help-actor-config-get =   @actor/config/<key>          config 値を取得
help-actor-config-set =   @actor/config/<key>: val     config 値を設定
help-actor-acl = @actor/acl                   4を取得
help-actor-acl-edit =   @actor/acl!edit              ACL を編集
help-actor-fragment =   @actor#entity                plugin に送信
help-actor-fragment-verb =   @actor#entity:verb [args]    plugin への RPC
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  5 応答をセッション環境に保持する
help-actor-wc-l = .my.z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URLパラメータ ────────────────────────────────────────────────────────────
help-url-intro =   受信者があらかじめ入力されたzionを開くリンクを共有する：
help-url-msg =   ?msg=<did>                   事前入力: @<did>!msg（テキストメッセージ）
help-url-say =   ?say=<did>                   事前入力: @<did>!say（say動詞）
help-url-emote =   ?emote=<did>                 事前入力: @<did>!emote（emote動詞）
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             ログイン後にランタイムワールドに入る
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   入力欄は事前入力されますが送信はされません — Enterを押して送信。
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                ネットワークに身元を公開する
help-header-publish = ── 身元の公開 ────────────────────────────────────────────────────────────────
help-publish-intro = 公開することでネットワーク上で身元を見つけられるようになります。他の人はDIDを検索してあなたに連絡できます。
help-publish-ma = 公開するにはma（ローカルランタイム）がインストールされている必要があります。egをIPFS/IPNSに橋渡しします。
help-publish-steps = 手順：'.ma [port]'でローカルmaを検出し、'.my.identity!publish @ma'を実行してください。
help-publish-without = 公開しないと他の人はあなたに連絡できません — DIDを知っていてもendpointを解決できないためです。
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = プロファイル名を指定してください: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = バッチを収集しています — コマンドを入力し、.batch で終わります
batch-already-collecting = すでにバッチを収集しています - 最初に .batch で終了します
batch-empty = バッチは空でした - 実行するものがありません
batch-running = batch を実行中…
batch-step-timeout = バッチステップがタイムアウトしました

batch-done = batch 完了: { $secs }s — { $steps } ステップ
batch-done-error = batch はエラー付きで完了: { $secs }s — { $steps } ステップ
msg-timeout = メッセージがタイムアウトしました (60s 応答なし)
err-unknown-command = 不明なコマンド: { $path }
err-read-only-path = { $path } は読み取り専用です
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        スクラッチ文書を並列評価


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } の取得に失敗しました: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = 有効な CID ではありません: { $value }
label-runtime = マ
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = 警告：あなたのIPNSプライベートキーはこのランタイムにアイデンティティを公開するために送信されます。完全に信頼するランタイムのみを使用してください。

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme は zion コマンドに埋め込まれた Scheme 式を評価し、送信前に結果をその行へ差し込みます。
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    インライン例。"say 7 + 5 = 12" を送信します
help-zscheme-define =   (define x 12)             定義は現在のログインセッション中保持されます
help-zscheme-doc = ドキュメント: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = ローカル IPFS ゲートウェイ（ブラウザの例外が必要）

tab-config = 設定
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
