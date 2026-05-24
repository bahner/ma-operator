# zion — Tiếng Việt
lang-name = Tiếng Việt

# ── Trang đăng nhập ───────────────────────────────────────────────────────
tab-login = đăng nhập
tab-new-identity = danh tính mới
tab-import = nhập
label-passphrase = cụm mật khẩu
label-username = tên người dùng
label-confirm-passphrase = xác nhận cụm mật khẩu
btn-login = đăng nhập
btn-export = xuất
btn-generate = tạo
passphrase-warning = Mất cụm mật khẩu = mất danh tính. Không thể khôi phục.
import-help = Chọn tệp .zion.json đã xuất. Gói vẫn được mã hóa.
status-unlocking = đang mở khóa...
status-generating = đang tạo danh tính...
status-reading-file = đang đọc tệp...
status-imported = đã nhập '{ $name }' — chuyển sang tab Đăng nhập
error-wrong-passphrase = sai cụm mật khẩu: { $e }
error-identity-not-found = không tìm thấy danh tính '{ $name }'
error-username-required = cần có tên người dùng
error-passphrase-required = cần có cụm mật khẩu
error-passphrases-no-match = các cụm mật khẩu không khớp

# ── Thông báo hệ thống terminal ───────────────────────────────────────────
msg-logged-in = zion v{ $version } — đã đăng nhập với tư cách { $username }
msg-type-help = Nhập .help để xem danh sách lệnh.
msg-connecting = đang kết nối tới iroh...
msg-iroh-ready = điểm cuối iroh sẵn sàng
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ bị chặn [{ $cap }]: { $from }
msg-focus-cleared = đã xóa tiêu điểm
msg-focusing = đang tập trung { $did } thành { $prompt }
msg-set = { $path }: { $value }
msg-deleted = đã xóa { $path } ({ $count } mục)
msg-read-only = { $path } chỉ đọc
msg-subtree-set = { $path } là cây con; từ chối đặt
msg-ancestor-leaf = một tổ tiên của { $path } là lá; từ chối che khuất
msg-key-not-found = không tìm thấy khóa: { $path }
msg-no-match = không có kết quả phù hợp
msg-link-not-connected = lỗi tải liên kết: chưa kết nối
msg-link-fetch-error = lỗi tải liên kết: { $e }
msg-link-key-not-found = không tìm thấy khóa `{ $key }` trong tài liệu được liên kết

# ── Xác thực bí danh ──────────────────────────────────────────────────────
err-alias-name-empty = tên bí danh không được để trống
err-alias-has-fragment = tên bí danh không được chứa '#'
err-alias-value-fragment = giá trị bí danh phải là bare did:ma:<ipns> (không có phân mảnh)
err-alias-value-path = giá trị bí danh phải là bare did:ma:<ipns> (không có đường dẫn)
err-alias-not-did = giá trị bí danh phải bắt đầu bằng did:ma:
err-unknown-alias = bí danh không xác định: @{ $name }
err-bare-did = yêu cầu bare did:ma:<ipns> (không có phân mảnh hoặc đường dẫn), nhận được { $did }

# ── Trình soạn thảo ───────────────────────────────────────────────────────
btn-save = Lưu
btn-eval = Chạy
btn-cancel = Hủy
btn-close = Đóng
btn-reply = Trả lời
btn-publish = Xuất bản
msg-reply-sent = đã gửi trả lời
msg-reply-failed = trả lời thất bại: { $e }
msg-entity-publish-sent = thực thể { $name }: đã gửi yêu cầu xuất bản
msg-entity-publish-failed = xuất bản thực thể thất bại: { $e }
msg-field-publish-sent = thực thể { $name }.{ $field }: đã gửi yêu cầu xuất bản
msg-field-publish-failed = xuất bản trường thất bại: { $e }
msg-acl-publish-sent = ACL runtime: đã gửi yêu cầu xuất bản
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

# ── Động từ — runtime ─────────────────────────────────────────────────────
discover-fetch-failed = khám phá thất bại tại { $url }: { $e }
discover-json-error = khám phá thất bại: JSON không hợp lệ từ { $url }: { $e }
discover-missing-did = khám phá thất bại: status.json thiếu trường `did`
discover-invalid-did = khám phá thất bại: `did` phải bắt đầu bằng did:ma:, nhận được `{ $did }`
discover-no-endpoint = cảnh báo khám phá: `endpoint_id` thiếu trong status.json; chỉ lưu DID
discover-success = đã khám phá ma tại { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   đã tạo bí danh @ma — xuất bản: .my.identity:publish @ma
claim-success = Runtime đã được yêu cầu cho { $did }
claim-conflict = Runtime đã được yêu cầu bởi danh tính khác
claim-http-failed = yêu cầu thất bại: HTTP { $status }
claim-error = yêu cầu thất bại: { $e }
claim-no-session = chưa đăng nhập; đăng nhập trước để yêu cầu runtime
runtime-no-verb = không có động từ `{ $verb }` cho { $path }

# ── Động từ — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl đã đặt lại (mở hoàn toàn)
acl-persist-error = lỗi lưu trữ: { $e }
acl-no-verb = không có động từ `{ $verb }` cho .my.acl

# ── Động từ — danh tính ───────────────────────────────────────────────────
publish-usage = cách dùng: .my.identity:publish <did-hoặc-bí-danh>

# ── Động từ — tài liệu ────────────────────────────────────────────────────
doc-content-empty = { $path }.content trống
doc-save-first = { $path }.content trống — lưu trước
doc-missing-name = thiếu tên tài liệu
doc-publish-usage = cách dùng: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = cách dùng: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = xuất bản { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = đã gửi yêu cầu lưu trữ ({ $id }) → { $publisher }; CID sẽ đến qua trả lời RPC
doc-ipld-store-sent = đã gửi yêu cầu lưu trữ IPLD ({ $id }) → { $publisher }; CID sẽ đến qua trả lời RPC
doc-fetch-done = đã tải { $cid } → { $path }.content (chưa chạy)
doc-fetch-failed = tải { $cid }: { $e }
doc-fetch-usage = cách dùng: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid chưa được đặt
doc-no-verb = không có động từ `{ $verb }` cho { $path }
path-no-verb = không có động từ `{ $verb }` cho { $path }

# ── Trợ giúp — tiêu đề ───────────────────────────────────────────────────
help-header-zion = ── lệnh zion ─────────────────────────────────────────────────────────────
help-header-messaging = ── nhắn tin ──────────────────────────────────────────────────────────────
help-header-focus = ── chế độ tiêu điểm ─────────────────────────────────────────────────────
help-header-config = ── cú pháp cấu hình cục bộ ─────────────────────────────────────────────
help-header-common = ── đường dẫn thông dụng ────────────────────────────────────────────────
help-header-inbox = ── hộp thư đến ────────────────────────────────────────────────────────────
help-header-documents = ── tài liệu ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Trợ giúp — lệnh zion ─────────────────────────────────────────────────
help-cmd-help =   .help                        văn bản này
help-cmd-clear =   .clear                       xóa terminal
help-cmd-panic =   .panic                       phương án cuối cùng — dùng khi gặp sự cố
help-cmd-logout =   .logout                      đăng xuất

# ── Trợ giúp — nhắn tin ──────────────────────────────────────────────────
help-msg-echo =   @alias                       hiển thị DID đã phân giải (không gửi tin)
help-msg-send =   @alias[:verb] body           gửi tin nhắn / RPC tới diễn viên
help-msg-fragment =   @alias#fragment[:verb] body  gửi với phân mảnh DID rõ ràng
help-msg-escape =   \@name                       @name theo nghĩa đen (không tra bí danh)

# ── Trợ giúp — chế độ tiêu điểm ─────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       tập trung vào diễn viên (thay đổi dấu nhắc)
help-focus-clear =   .use                         xóa tiêu điểm

# ── Trợ giúp — cú pháp cấu hình ─────────────────────────────────────────
help-config-get =   .path                        lấy giá trị lá hoặc liệt kê cây con
help-config-filter =   .path value                  lọc theo giá trị
help-config-set =   .path: value                 đặt lá
help-config-delete =   .path:                       xóa lá hoặc cây con
help-config-verb =   .path:verb [args]            gọi động từ cục bộ

# ── Trợ giúp — đường dẫn thông dụng ─────────────────────────────────────
help-my =   .my                          hiển thị tất cả cấu hình cá nhân
help-aliases =   .my.aliases                  danh sách bí danh
help-aliases-set =   .my.aliases.<name>: <did>    thêm/cập nhật bí danh
help-aliases-del =   .my.aliases.<name>:          xóa bí danh
help-runtime-discover =   .my.ma:discover          khám phá runtime cục bộ và tạo @ma
help-runtime-claim =   .my.ma:claim             yêu cầu quyền sở hữu runtime bằng DID
help-identity =   .my.identity                 hiển thị cấu hình danh tính
help-identity-did =   .my.identity.did             hiển thị DID của mình (chỉ đọc)
help-identity-publish =   .my.identity:publish @pub    xuất bản DID qua dịch vụ xuất bản
help-config-path =   .config                      hiển thị tất cả mục .config.*

# ── Trợ giúp — hộp thư đến ───────────────────────────────────────────────
help-inbox =   .my.inbox                    danh sách hộp thư đến (chế độ cây con)
help-inbox-n =   .my.inbox.N                  hiển thị các trường của mục N
help-inbox-from =   .my.inbox.N.from             DID người gửi của mục N
help-inbox-reply =   .my.inbox.N:reply [body]     gửi trả lời (không có nội dung — mở soạn thảo)
help-inbox-open =   .my.inbox.N:open             mở nội dung chỉ đọc trong soạn thảo
help-inbox-del =   .my.inbox.N:                 xóa mục N
help-inbox-delall =   .my.inbox:                   xóa tất cả mục hộp thư đến
help-inbox-flush =   .my.inbox:flush              in tất cả mục ra terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   duyệt lười tài liệu DID người gửi

# ── Trợ giúp — tài liệu ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           mở soạn thảo với nội dung đã lưu
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     tải CID, mở để xem lại
help-doc-eval =   .my.doc.<name>:eval           chạy nội dung đã lưu từng dòng
help-doc-publish =   .my.doc.<name>:publish @pub   lưu dưới dạng blob thô (bất kỳ loại)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  lưu YAML thành nút IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>:fetch <cid>    nhập nội dung CID (không chạy)
help-doc-cid =   .my.doc.<name>:cid            hiển thị CID đã lưu
help-doc-del =   .my.doc.<name>:              xóa tài liệu

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Ngôn ngữ có sẵn (đặt bằng .my.i18n: <code>):
err-lang-not-found = không tìm thấy ngôn ngữ: { $lang }

msg-send-failed = gửi thất bại: { $e }
msg-not-logged-in = chưa đăng nhập
