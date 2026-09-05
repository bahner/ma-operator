# operator — Tiếng Việt
lang-name = Tiếng Việt
label-nick = biệt danh
new-identity-nick-help = Chọn một biệt danh cho 間-space. Đây chỉ là biệt danh và bạn có thể đổi bất cứ lúc nào.
error-nick-required = cần biệt danh
error-nick-invalid = biệt danh không được chứa khoảng trắng hoặc @

# ── Trang đăng nhập ───────────────────────────────────────────────────────
tab-login = đăng nhập
tab-new-identity = danh tính mới
tab-import-profile = nhập hồ sơ
label-passphrase = cụm mật khẩu
label-username = tên người dùng
label-confirm-passphrase = xác nhận cụm mật khẩu
label-did = DID
label-profile-cid = CID hồ sơ
label-or-file = hoặc tệp
btn-login = đăng nhập
btn-export = xuất
btn-generate = tạo
btn-new-endpoint = điểm cuối mới
btn-import-profile = nhập hồ sơ
btn-show-qr = hiển thị QR
btn-scan-qr = quét QR
qr-scan-hint = Hướng camera vào mã QR hồ sơ operator.
qr-error-camera = không có camera: { $e }
qr-error-too-large = hồ sơ quá lớn cho mã QR
passphrase-warning = Mất cụm mật khẩu = mất danh tính. Không thể khôi phục.
import-profile-help = Nhập hồ sơ qua CID hoặc tệp. Bạn cần cụm mật khẩu giống như đã dùng khi xuất bản.
import-profile-detected-user = Hồ sơ thuộc về: { $name }
status-unlocking = đang mở khóa...
status-generating = đang tạo danh tính...
status-reading-file = đang đọc tệp...
status-fetching-profile = đang lấy hồ sơ từ IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = đã nhập '{ $name }' — chuyển sang tab Đăng nhập
status-importing-profile = đang nhập hồ sơ...
profile-import-done = đã nhập hồ sơ cho '{ $name }' — đã tải { $n } khóa
error-wrong-passphrase = sai cụm mật khẩu: { $e }
error-identity-not-found = không tìm thấy danh tính '{ $name }'
error-username-required = cần có tên người dùng
error-passphrase-required = cần có cụm mật khẩu
error-passphrases-no-match = các cụm mật khẩu không khớp
error-profile-source-required = cung cấp CID hoặc tải lên tệp
error-did-required = nhập DID của bạn
error-profile-fetch = không thể lấy hồ sơ: { $e }
error-profile-no-username = hồ sơ không chứa tên người dùng
error-profile-no-identity = danh tính '{ $name }' không tìm thấy — nhập danh tính trước

# ── Thông báo hệ thống terminal ───────────────────────────────────────────
msg-logged-in = operator v{ $version } — đã đăng nhập với tư cách { $username }
msg-type-help = Nhập .help để xem danh sách lệnh.
msg-getting-started = Hãy thử: say Hello world, look, .help hoặc help.
msg-connecting = đang kết nối tới iroh...
msg-iroh-ready = điểm cuối iroh sẵn sàng
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID được xuất bản qua 間 cục bộ ({ $url })
msg-identity-publication-propagating = Việc công bố danh tính vẫn đang lan truyền; entry bị trì hoãn: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-lookup-wait = Tra cứu MA đáng tin cậy có thể mất tới { $seconds } giây.
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Đang công bố danh tính. Việc này có thể mất tới { $seconds } giây.
msg-ma-connecting-matrix = đang cố kết nối bạn vào 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = đã yêu cầu 間 cục bộ
msg-local-ma-already-claimed = 間 cục bộ đã được yêu cầu
msg-local-ma-claim-failed = không thể yêu cầu 間 cục bộ
msg-identity-not-published = Không tìm thấy danh tính trực tuyến — nếu 間 được cài đặt cục bộ, hãy chạy '.ma: claim [port]' rồi '.my.identity!publish @ma'. Gõ '.help/publish' để xem chi tiết.
msg-blocked = ⊗ bị chặn [{ $cap }]: { $from }
msg-focus-cleared = đã xóa tiêu điểm
msg-left = left
msg-focusing = đang tập trung { $did } thành { $prompt }
msg-set = { $path }: { $value }
msg-deleted = đã xóa { $path } ({ $count } mục)
msg-read-only = { $path } chỉ đọc
msg-subtree-set = { $path } là cây con; từ chối đặt
msg-ancestor-leaf = một tổ tiên của { $path } là lá; từ chối che khuất
msg-key-not-found = không tìm thấy khóa: { $path }
msg-link-not-connected = lỗi tải liên kết: chưa kết nối
msg-link-fetch-error = lỗi tải liên kết: { $e }
msg-link-key-not-found = không tìm thấy khóa `{ $key }` trong tài liệu được liên kết

# ── Xác thực bí danh ──────────────────────────────────────────────────────
err-alias-name-empty = tên bí danh không được để trống
err-alias-has-dot = tên bí danh không được chứa '.'
err-alias-has-fragment = tên bí danh không được chứa '#'
err-alias-value-fragment = giá trị bí danh có thể chứa tối đa một phân mảnh DID-URL không rỗng
err-alias-value-path = giá trị bí danh phải là DID did:ma:<ipns> hoặc DID-URL (không có đường dẫn)
err-alias-not-did = giá trị bí danh phải bắt đầu bằng did:ma:
err-unknown-alias = bí danh không xác định: @{ $name }
err-bare-did = yêu cầu bare did:ma:<ipns> (không có phân mảnh hoặc đường dẫn), nhận được { $did }

# ── Trình soạn thảo ───────────────────────────────────────────────────────
btn-save = Lưu
btn-eval = Chạy
btn-cancel = Hủy
msg-jobs-cancelled = tác vụ đã hủy
btn-close = Đóng
btn-reply = Trả lời
btn-publish = Xuất bản
btn-publish-ipld = Xuất bản IPLD
msg-reply-sent = đã gửi trả lời
msg-reply-failed = trả lời thất bại: { $e }
msg-entity-publish-sent = thực thể { $name }: đã gửi yêu cầu xuất bản
msg-entity-publish-failed = xuất bản thực thể thất bại: { $e }
msg-kind-publish-failed = xuất bản loại thất bại: { $e }
msg-field-publish-sent = thực thể { $name }.{ $field }: đã gửi yêu cầu xuất bản
msg-field-publish-failed = xuất bản trường thất bại: { $e }
msg-acl-publish-sent = ACL runtime: đã gửi yêu cầu xuất bản
msg-crud-edit-publish-sent = { $path }: đã gửi yêu cầu xuất bản
msg-acl-publish-failed = xuất bản ACL runtime thất bại: { $e }
msg-yaml-error = lỗi YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = đã tải { $cid } — xem lại trước khi chạy
msg-fetch-failed = tải { $cid }: { $e }

# ── Động từ — hộp thư đến ────────────────────────────────────────────────
inbox-empty = hộp thư đến trống
inbox-entry-not-found = không tìm thấy mục hộp thư đến { $n }
inbox-no-message-id = mục hộp thư đến { $n } không có message_id
inbox-no-verb = không có động từ `{ $verb }` cho mục hộp thư đến { $n }
inbox-filter-no-arg = bộ lọc yêu cầu đối số DID hoặc bí danh
inbox-filter-empty = không có tin nhắn từ { $did }

# ── Động từ — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = khám phá thất bại tại { $url }: { $e }
discover-json-error = khám phá thất bại: JSON không hợp lệ từ { $url }: { $e }
discover-missing-did = khám phá thất bại: status.json thiếu trường `did`
discover-invalid-did = khám phá thất bại: `did` phải bắt đầu bằng did:ma:, nhận được `{ $did }`
discover-no-endpoint = cảnh báo khám phá: `endpoint_id` thiếu trong status.json; chỉ lưu DID
discover-hint-endpoint-not-found = Gợi ý: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Gợi ý: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Gợi ý: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Gợi ý: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = đã khám phá 間 tại { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   bí danh @ma đã được tạo — chạy '.my.identity!publish @ma' để xuất bản danh tính của bạn.
claim-success = Runtime đã được yêu cầu cho { $did }
claim-conflict = Runtime đã được yêu cầu bởi danh tính khác
claim-already-owned = Runtime đã được yêu cầu bởi danh tính này
claim-http-failed = yêu cầu thất bại: HTTP { $status }
claim-error = yêu cầu thất bại: { $e }
claim-no-session = chưa đăng nhập; đăng nhập trước để yêu cầu runtime
runtime-no-verb = không có động từ `{ $verb }` cho { $path }

# ── Động từ — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl đã đặt lại (mở hoàn toàn)
err-persist = lỗi lưu trữ: { $e }
acl-no-verb = không có động từ `{ $verb }` cho .my.acl

# ── Động từ — danh tính ───────────────────────────────────────────────────
publish-usage = cách dùng: .my.identity!publish <did-hoặc-bí-danh>
identity-exported = Gói đã tải xuống là { $filename }
identity-export-failed = Xuất thất bại: { $e }

# ── Động từ — tài liệu ────────────────────────────────────────────────────
doc-content-empty = { $path } trống
doc-save-first = { $path } trống — lưu trước
doc-missing-name = thiếu tên tài liệu
doc-publish-usage = cách dùng: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = cách dùng: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = xuất bản { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = xuất bản thất bại [{ $code }]: { $err }
doc-publish-error-hint = Gợi ý: { $hint }
doc-publish-hint-session = đăng nhập lại để cái tôi có thể truy cập vào khóa nhận dạng của bạn
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = xác minh tài liệu DID của nhà xuất bản đã được xuất bản và chứa điểm cuối có thể truy cập
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = thời gian chạy/plugin từ chối yêu cầu; kiểm tra lý do và thử lại sau khi sửa thực thể/thời gian chạy
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = kiểm tra nhật ký thời gian chạy để biết nguyên nhân chi tiết và thử lại
doc-store-sent = đã gửi yêu cầu lưu trữ ({ $id }) → { $publisher }; CID sẽ đến qua trả lời
doc-ipld-store-sent = đã gửi yêu cầu lưu trữ IPLD ({ $id }) → { $publisher }; CID sẽ đến qua trả lời
doc-fetch-done = đã tải { $cid } → { $path } (chưa chạy)
doc-fetch-failed = tải { $cid }: { $e }
doc-fetch-usage = cách dùng: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid chưa được đặt
doc-no-verb = không có động từ `{ $verb }` cho { $path }
path-no-verb = không có động từ `{ $verb }` cho { $path }

# ── Trợ giúp — tiêu đề ───────────────────────────────────────────────────
help-header-operator = ── lệnh operator ─────────────────────────────────────────────────────────────
help-header-messaging = ── nhắn tin ──────────────────────────────────────────────────────────────
help-header-config = ── cú pháp cấu hình cục bộ ─────────────────────────────────────────────
help-header-common = ── đường dẫn thông dụng ────────────────────────────────────────────────
help-header-inbox = ── hộp thư đến ────────────────────────────────────────────────────────────
help-header-documents = ── tài liệu ──────────────────────────────────────────────────────────────
help-header-i18n = ── ngôn ngữ ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── tiến vào 間-không gian ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Trợ giúp — lệnh operator ─────────────────────────────────────────────────
help-cmd-help =   .help                        văn bản này
help-cmd-clear =   .clear                       xóa terminal
help-cmd-panic =   .panic                       phương án cuối cùng — dùng khi gặp sự cố
help-cmd-history =   .history [n]                 lịch sử lệnh (bản trùng lặp liên tiếp được gộp); n tùy chọn chỉ hiển thị n dòng cuối cùng
help-cmd-logout =   .logout                      đăng xuất
help-cmd-batch =   .batch                       đánh giá tài liệu nháp song song
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         đánh giá tài liệu nháp từng dòng

# ── Trợ giúp — nhắn tin ──────────────────────────────────────────────────
help-msg-echo =   @alias                       hiển thị DID/DID-URL đã phân giải (không gửi tin nhắn)
help-msg-send = @alias!msg body @alias:verb args gửi tin nhắn tới diễn viên
help-msg-fragment =   @alias#fragment:verb body  gửi với phân mảnh DID rõ ràng
help-msg-escape =   \@name                       @name theo nghĩa đen (không tra bí danh)

# ── Trợ giúp — chế độ tiêu điểm ─────────────────────────────────────────

# ── Trợ giúp — cú pháp cấu hình ─────────────────────────────────────────
help-config-get =   .path                        lấy giá trị lá hoặc liệt kê cây con
help-config-filter =   .path [tên]                  liệt kê tên khóa con chứa tên
help-config-full =   .path. [tên]                 liệt kê giá trị đầy đủ của cây con chứa tên
help-config-set =   .path: value                 đặt lá
help-config-delete =   .path:                       xóa lá hoặc cây con
help-config-verb =   .path!verb [args]            gọi động từ cục bộ

# ── Trợ giúp — đường dẫn thông dụng ─────────────────────────────────────
help-my =   .my                          hiển thị tất cả cấu hình cá nhân
help-aliases =   .my.aliases                  danh sách bí danh
help-aliases-set =   .my.aliases.<name>: <did-url>    thêm/cập nhật bí danh (DID hoặc DID-URL)
help-aliases-del =   .my.aliases.<name>:          xóa bí danh
help-runtime-discover =   .ma: claim [port]          khám phá runtime cục bộ và tạo @ma
help-runtime-claim =   .ma: claim [port]             yêu cầu quyền sở hữu runtime bằng DID
help-identity =   .my.identity                 hiển thị cấu hình danh tính
help-identity-did =   .my.identity.did             hiển thị DID của mình (chỉ đọc)
help-identity-publish =   .my.identity!publish @pub    xuất bản DID qua dịch vụ xuất bản
help-identity-export =   .my.identity!export          tải xuống gói nhận dạng của bạn
help-config-path =   .config                      hiển thị tất cả mục .config.*

# ── Trợ giúp — hộp thư đến ───────────────────────────────────────────────
help-inbox =   .my.inbox                    danh sách hộp thư đến (chế độ cây con)
help-inbox-n =   .my.inbox.N                  hiển thị các trường của mục N
help-inbox-from =   .my.inbox.N.from             DID người gửi của mục N
help-inbox-reply =   .my.inbox.N!reply [body]     gửi trả lời (không có nội dung — mở soạn thảo)
help-inbox-open =   .my.inbox.N!open             mở nội dung chỉ đọc trong soạn thảo
help-inbox-del =   .my.inbox.N:                 xóa mục N
help-inbox-delall =   .my.inbox:                   xóa tất cả mục hộp thư đến
help-inbox-flush =   .my.inbox!flush              in tất cả mục ra terminal
help-inbox-filter =   .my.inbox!filter @who        chỉ hiển thị mục từ @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   duyệt lười tài liệu DID người gửi

# ── Trợ giúp — tài liệu ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           mở soạn thảo với nội dung đã lưu
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     tải CID, mở để xem lại
help-doc-eval =   .my.doc.<name>!eval           chạy nội dung đã lưu từng dòng
help-doc-publish =   .my.doc.<name>!publish @pub   lưu dưới dạng blob thô (bất kỳ loại)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  lưu YAML thành nút IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    nhập nội dung CID (không chạy)
help-doc-cid =   .my.doc.<name>!cid            hiển thị CID đã lưu
help-doc-del =   .my.doc.<name>:              xóa tài liệu

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n lưu trữ tùy chọn ngôn ngữ gắn liền với danh tính của bạn.
help-i18n-set = .my.i18n: <code>             choose the language operator uses for this identity
help-i18n-list = .my.i18n!list               liệt kê các mã ngôn ngữ có sẵn

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Phòng 間 là không gian giữa các danh tính 間. ma giúp các danh tính đó tìm thấy nhau và giao tiếp; khi danh tính của bạn đã được công bố, bạn có thể tham gia.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   kết nối với 間 runtime cục bộ, đọc /status.json và lưu .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     công bố tài liệu DID của bạn để người khác phân giải khóa và endpoint của bạn
help-ma-security = Ranh giới tin cậy rõ nhất là 間 runtime của chính bạn cùng IPFS Desktop/Kubo của chính bạn. Publisher từ xa có thể hữu ích, nhưng khi đó bạn dựa vào dịch vụ của người khác.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             cách vào phòng 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Khi danh tính của bạn đã được biết đến, .enter @ma cho phép bạn bước vào 間. Hãy tìm một thế giới, vào đó và tham gia từ đó.
help-ma-entry-steps = Khởi động IPFS Desktop và ma, rồi chạy .ma. Công bố bằng .my.identity!publish @ma, tìm một thế giới và vào bằng .enter @ma.
help-ma-entry-command =   .enter @ma                  vào 間 qua runtime @ma
help-ma-entry-toggle =   .enter                       bật hoặc tắt tiêu điểm phòng; danh tính của bạn vẫn hoạt động
help-ma-entry-url =   ?enter=<runtime>             vào sau khi đăng nhập từ URL được chia sẻ

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Ngôn ngữ có sẵn (đặt bằng .my.i18n: <code>):
err-lang-not-found = không tìm thấy ngôn ngữ: { $lang }

msg-send-failed = gửi thất bại: { $e }
msg-not-logged-in = chưa đăng nhập

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Lỗi phân tích YAML: { $e }
yaml-not-mapping = YAML phải là một mapping (cặp khóa: giá trị); văn bản thuần túy và vô hướng không thể lưu dưới dạng DAG-CBOR
dagcbor-encode-error = Lỗi mã hóa DAG-CBOR: { $e }
cbor-decode-error = Lỗi giải mã CBOR: { $e }
cbor-json-error = Lỗi chuyển đổi CBOR sang JSON: { $e }
yaml-serialise-error = Lỗi tuần tự hóa YAML: { $e }
edit-reply-invalid = Phản hồi chỉnh sửa không hợp lệ
doc-publish-ipld-error = Xuất bản IPLD thất bại: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Lỗi lưu dọn hộp thư đến: { $e }
err-config-load = Lỗi tải cấu hình: { $e }
err-lang-persist = Lỗi lưu ngôn ngữ: { $e }
err-history-parse = Lỗi phân tích lịch sử: { $e }
err-history-load = Lỗi tải lịch sử: { $e }
err-history-count-invalid = số lượng lịch sử phải là số nguyên dương
err-ipfs-reply-decode = Giải mã phản hồi IPFS thất bại: { $e }
err-edit-cbor = Lỗi chỉnh sửa CBOR: { $e }
err-popup-blocked = Trình duyệt đã chặn cửa sổ bật lên
status-publishing = đang xuất bản

# ── redigering ─────────────────────────────────────────────────────
term-error = lỗi
term-error-detail = lỗi: { $detail }
msg-new-message = ← [{ $from }] tin nhắn mới — { $count } trong hộp thư
msg-chat = { $sender } nói { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } nói { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } bước vào phòng.
room-leave = * { $name } rời khỏi phòng.
room-drop  = * { $name } làm rơi { $thing }.
room-take  = * { $name } nhặt { $thing }.
err-edit-decode-failed = chỉnh sửa: giải mã thất bại: { $e }
err-edit-fetch-failed = chỉnh sửa: tải thất bại: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = không có phiên hoạt động — không thể xóa hồ sơ
profile-delete-error = xóa hồ sơ thất bại: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = hồ sơ đã được mã hóa và gửi tới IPFS; tài liệu DID sẽ được cập nhật khi CID đến
profile-publish-done = hồ sơ đã xuất bản — tài liệu DID đã cập nhật với ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = danh tính đã được công bố - hồ sơ cập nhật
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = nội dung nhị phân (không hiển thị)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (không có)
profiles-deleted = hồ sơ { $name } đã xóa
profiles-not-found = không tìm thấy hồ sơ: { $name }

# -- Help topics index
help-header-topics = -- chủ đề -- nhập .help/<topic> để xem chi tiết
help-topic-msg = .help/msg nhắn tin
help-topic-ma = .help/ma                     間-không gian, xuất bản và nhập cảnh
help-topic-path = .help/path                   ngữ pháp đường dẫn chấm cục bộ
help-topic-my =   .help/my                     config cá nhân
help-topic-inbox =   .help/inbox                  hộp thư đến
help-topic-doc =   .help/doc                    tài liệu
help-topic-actor =   .help/actor                  actor từ xa
help-topic-z =   .help/z                      nội dung Scheme công khai và riêng tư
help-topic-zscheme =   .help/zscheme               biểu thức Scheme nội tuyến và tài liệu
help-unknown-topic =   .help/{ $topic }: chủ đề không xác định

# -- Help actor section
help-header-actor = -- actor từ xa
help-actor-echo =   @actor                       hiển thị DID đã phân giải
help-actor-text = @actor[#entity]!msg|!say|!emote body         gửi tin nhắn trực tiếp/trò chuyện/biểu tượng cảm xúc
help-actor-ping = @actor:ping                  ping sống động
help-actor-entities =   @actor/entities              liệt kê entity
help-actor-entities-get = @actor/entities/<n>          lấy nút thực thể
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     sửa entity
help-actor-entities-del = @actor/entities/<n>:         xóa thực thể
help-actor-config-get =   @actor/config/<key>          lấy giá trị config
help-actor-config-set =   @actor/config/<key>: val     đặt giá trị config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              sửa ACL
help-actor-fragment =   @actor#entity                gửi tới plugin
help-actor-fragment-verb = @actor#entity:verb [args] tới plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...) call an entity from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg)) giữ các câu trả lời 5 trong môi trường phiên

help-topic-url =   .help/url                    mở operator thông qua liên kết URL
help-topic-i18n = .help/i18n                   ưu tiên ngôn ngữ cho danh tính của bạn
help-header-url = ── tham số URL ──────────────────────────────────────────────────────────────────
help-url-intro =   Chia sẻ một liên kết mở operator với người nhận đã được điền sẵn:
help-url-msg =   ?msg=<did>                   điền sẵn: @<did>!msg (tin nhắn thông thường)
help-url-say =   ?say=<did>                   điền sẵn: @<did>!say (động từ say)
help-url-emote =   ?emote=<did>                 điền sẵn: @<did>!emote (động từ emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             bước vào thế giới thời gian chạy sau khi đăng nhập
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Ô nhập đã được điền sẵn nhưng chưa gửi — nhấn Enter để gửi.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                xuất bản danh tính của bạn lên mạng
help-header-publish = ── xuất bản danh tính ───────────────────────────────────────────────────────
help-publish-intro = Xuất bản giúp danh tính của bạn được tìm thấy trên mạng. Người khác có thể tra cứu DID của bạn để liên lạc.
help-publish-ma = Để xuất bản, bạn cần cài đặt 間 (runtime cục bộ). Nó kết nối operator với IPFS/IPNS thay mặt bạn.
help-publish-steps = Các bước: chạy '.ma: claim [port]' để phát hiện ma cục bộ, sau đó '.my.identity!publish @ma'.
help-publish-without = Không xuất bản thì người khác không thể liên lạc với bạn — dù biết DID của bạn, họ không thể phân giải endpoint của bạn.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = chỉ định tên hồ sơ: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Thu thập hàng loạt - gõ lệnh, kết thúc bằng .batch
batch-already-collecting = Đã thu thập một đợt - trước tiên hãy kết thúc bằng .batch
batch-empty = Lô trống - không có gì để chạy
batch-running = Đang chạy batch…
batch-step-timeout = bước hàng loạt đã hết thời gian

batch-done = Batch hoàn tất trong { $secs }s — { $steps } bước
batch-done-error = Batch hoàn tất với lỗi trong { $secs }s — { $steps } bước
msg-timeout = Tin nhắn hết thời gian chờ (không có trả lời trong 60s)
msg-outbox-open-timeout = không thể kết nối tới tác tử { $target } — kết nối hết thời gian chờ sau { $ms }ms
msg-outbox-send-timeout = gửi đến { $target } hết thời gian chờ sau { $ms }ms — kết nối có thể đã bị ngắt
err-unknown-command = lệnh không xác định: { $path }
err-read-only-path = { $path } chỉ đọc
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        đánh giá tài liệu nháp song song


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Không thể lấy CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID không hợp lệ: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Cảnh báo: Khóa riêng tư IPNS của bạn sẽ được gửi đến môi trường chạy này để xuất bản danh tính. Chỉ sử dụng môi trường chạy mà bạn hoàn toàn tin tưởng.

# -- Help text -- z and my
help-header-z = ── .z và .my ─────────────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       nội dung công khai hoặc có thể xuất bản; đừng lưu bí mật ở đây
help-z-scheme =   .z.scheme                  tập lệnh Scheme được tải và đánh giá khi khởi động
help-z-control =   .z.scheme                 bạn tự kiểm soát nội dung của tập lệnh khởi động
help-z-private =   .my.*                     cấu hình cục bộ riêng tư; Scheme có thể được lưu ở đây
help-z-choice =   .z.* / .my.*               dùng .z.* cho Scheme công khai và .my.* cho Scheme riêng tư

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme đánh giá các biểu thức Scheme được nhúng trong lệnh operator và chèn kết quả vào dòng trước khi gửi.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    ví dụ nội tuyến; gửi "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             các định nghĩa tồn tại trong phiên đăng nhập hiện tại
help-zscheme-doc = Tài liệu: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Cổng IPFS cục bộ (cần ngoại lệ trình duyệt)

tab-config = Cài đặt
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
