# zion — ภาษาไทย
lang-name = ภาษาไทย

# ── หน้าเข้าสู่ระบบ ───────────────────────────────────────────────────────
tab-login = เข้าสู่ระบบ
tab-new-identity = ตัวตนใหม่
tab-import-profile = นำเข้าโปรไฟล์
label-passphrase = วลีรหัสผ่าน
label-username = ชื่อผู้ใช้
label-confirm-passphrase = ยืนยันวลีรหัสผ่าน
label-did = DID
label-profile-cid = CID โปรไฟล์
label-or-file = หรือไฟล์
btn-login = เข้าสู่ระบบ
btn-export = ส่งออก
btn-generate = สร้าง
btn-new-endpoint = จุดเชื่อมต่อใหม่
btn-import-profile = นำเข้าโปรไฟล์
passphrase-warning = หากสูญหายวลีรหัสผ่าน ตัวตนของคุณจะสูญหายไปด้วย ไม่มีการกู้คืน
import-profile-help = นำเข้าโปรไฟล์ด้วย CID หรือไฟล์ ต้องใช้รหัสผ่านเดียวกับที่ใช้ตอนเผยแพร่
import-profile-detected-user = โปรไฟล์เป็นของ: { $name }
status-unlocking = กำลังปลดล็อก...
status-generating = กำลังสร้างตัวตน...
status-reading-file = กำลังอ่านไฟล์...
status-fetching-profile = กำลังดึงโปรไฟล์จาก IPFS...
status-imported = นำเข้า '{ $name }' สำเร็จ — ไปที่แท็บเข้าสู่ระบบ
status-importing-profile = กำลังนำเข้าโปรไฟล์...
profile-import-done = นำเข้าโปรไฟล์สำหรับ '{ $name }' แล้ว — โหลด { $n } คีย์
error-wrong-passphrase = วลีรหัสผ่านไม่ถูกต้อง: { $e }
error-identity-not-found = ไม่พบตัวตน '{ $name }'
error-username-required = ต้องระบุชื่อผู้ใช้
error-passphrase-required = ต้องระบุวลีรหัสผ่าน
error-passphrases-no-match = วลีรหัสผ่านไม่ตรงกัน
error-profile-source-required = ระบุ CID หรืออัปโหลดไฟล์
error-did-required = กรอก DID ของคุณ
error-profile-fetch = ไม่สามารถดึงโปรไฟล์ได้: { $e }
error-profile-no-username = โปรไฟล์ไม่มีชื่อผู้ใช้
error-profile-no-identity = ไม่พบตัวตน '{ $name }' — นำเข้าตัวตนก่อน

# ── ข้อความระบบ terminal ─────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — เข้าสู่ระบบในนาม { $username }
msg-type-help = พิมพ์ .help เพื่อดูรายการคำสั่ง
msg-connecting = กำลังเชื่อมต่อ iroh...
msg-iroh-ready = endpoint iroh พร้อมใช้งาน
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID ถูกเผยแพร่ผ่าน ma ในเครื่อง ({ $url })
msg-identity-not-published = ไม่พบตัวตนออนไลน์ — ถ้าติดตั้ง ma ในเครื่องแล้ว ให้รัน '.ma [port]' จากนั้น '/my/identity!publish @ma' พิมพ์ '.help.publish' เพื่อดูรายละเอียด
msg-blocked = ⊗ ถูกบล็อก [{ $cap }]: { $from }
msg-focus-cleared = ล้างโฟกัสแล้ว
msg-focusing = กำลังโฟกัส { $did } เป็น { $prompt }
msg-set = { $path }: { $value }
msg-deleted = ลบ { $path } แล้ว ({ $count } รายการ)
msg-read-only = { $path } อ่านได้อย่างเดียว
msg-subtree-set = { $path } เป็น subtree; ปฏิเสธการตั้งค่า
msg-ancestor-leaf = บรรพบุรุษของ { $path } เป็น leaf; ปฏิเสธการซ่อน
msg-key-not-found = ไม่พบคีย์: { $path }
msg-no-match = ไม่พบผลลัพธ์ที่ตรงกัน
msg-link-not-connected = ข้อผิดพลาดการดึงลิงก์: ยังไม่ได้เชื่อมต่อ
msg-link-fetch-error = ข้อผิดพลาดการดึงลิงก์: { $e }
msg-link-key-not-found = ไม่พบคีย์ `{ $key }` ในเอกสารที่ลิงก์

# ── การตรวจสอบนามแฝง ──────────────────────────────────────────────────────
err-alias-name-empty = ชื่อนามแฝงต้องไม่ว่างเปล่า
err-alias-has-dot = ชื่อนามแฝงต้องไม่มี '.'
err-alias-has-fragment = ชื่อนามแฝงต้องไม่มี '#'
err-alias-value-fragment = ค่านามแฝงต้องเป็น bare did:ma:<ipns> (ไม่มี fragment)
err-alias-value-path = ค่านามแฝงต้องเป็น bare did:ma:<ipns> (ไม่มี path)
err-alias-not-did = ค่านามแฝงต้องขึ้นต้นด้วย did:ma:
err-unknown-alias = ไม่พบนามแฝง: @{ $name }
err-bare-did = ต้องการ bare did:ma:<ipns> (ไม่มี fragment หรือ path), ได้รับ { $did }

# ── โปรแกรมแก้ไข ──────────────────────────────────────────────────────────
btn-save = บันทึก
btn-eval = รัน
btn-cancel = ยกเลิก
btn-close = ปิด
btn-reply = ตอบกลับ
btn-publish = เผยแพร่
btn-publish-ipld = เผยแพร่ IPLD
msg-reply-sent = ส่งการตอบกลับแล้ว
msg-reply-failed = การตอบกลับล้มเหลว: { $e }
msg-entity-publish-sent = entity { $name }: ส่งคำขอเผยแพร่แล้ว
msg-entity-publish-failed = การเผยแพร่ entity ล้มเหลว: { $e }
msg-kind-publish-failed = การเผยแพร่ประเภทล้มเหลว: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ส่งคำขอเผยแพร่แล้ว
msg-field-publish-failed = การเผยแพร่ field ล้มเหลว: { $e }
msg-acl-publish-sent = ACL runtime: ส่งคำขอเผยแพร่แล้ว
msg-crud-edit-publish-sent = { $path }: ส่งคำขอเผยแพร่แล้ว
msg-acl-publish-failed = การเผยแพร่ ACL runtime ล้มเหลว: { $e }
msg-yaml-error = ข้อผิดพลาด YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = ดึง { $cid } แล้ว — ตรวจสอบก่อนรัน
msg-fetch-failed = ดึง { $cid }: { $e }

# ── กริยา — inbox ──────────────────────────────────────────────────────────
inbox-empty = inbox ว่างเปล่า
inbox-entry-not-found = ไม่พบรายการ inbox { $n }
inbox-no-message-id = รายการ inbox { $n } ไม่มี message_id
inbox-no-verb = ไม่มีกริยา `{ $verb }` สำหรับรายการ inbox { $n }
inbox-filter-no-arg = ตัวกรองต้องการอาร์กิวเมนต์ DID หรือนามแฝง
inbox-filter-empty = ไม่มีข้อความจาก { $did }

# ── กริยา — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = การค้นหาล้มเหลวที่ { $url }: { $e }
discover-json-error = การค้นหาล้มเหลว: JSON ไม่ถูกต้องจาก { $url }: { $e }
discover-missing-did = การค้นหาล้มเหลว: status.json ขาดฟิลด์ `did`
discover-invalid-did = การค้นหาล้มเหลว: `did` ต้องขึ้นต้นด้วย did:ma:, ได้รับ `{ $did }`
discover-no-endpoint = คำเตือนการค้นหา: `endpoint_id` ขาดใน status.json; บันทึกเฉพาะ DID
discover-success = พบ ma ที่ { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   สร้างชื่อแทน @ma แล้ว — รัน '/my/identity!publish @ma' เพื่อเผยแพร่ตัวตนของคุณ
claim-success = Runtime ถูกอ้างสิทธิ์สำหรับ { $did }
claim-conflict = Runtime ถูกอ้างสิทธิ์โดยตัวตนอื่นแล้ว
claim-http-failed = คำขอล้มเหลว: HTTP { $status }
claim-error = คำขอล้มเหลว: { $e }
claim-no-session = ยังไม่ได้เข้าสู่ระบบ; โปรดเข้าสู่ระบบก่อนอ้างสิทธิ์ runtime
runtime-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }

# ── กริยา — ACL ───────────────────────────────────────────────────────────
acl-reset = รีเซ็ต /my/acl แล้ว (เปิดทั้งหมด)
acl-persist-error = ข้อผิดพลาดการบันทึก: { $e }
acl-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ /my/acl

# ── กริยา — identity ──────────────────────────────────────────────────────
publish-usage = การใช้งาน: /my/identity!publish <did-หรือ-นามแฝง>
identity-exported = ดาวน์โหลดบันเดิลเป็น { $filename }
identity-export-failed = การส่งออกล้มเหลว: { $e }

# ── กริยา — documents ─────────────────────────────────────────────────────
doc-content-empty = { $path }/content ว่างเปล่า
doc-save-first = { $path }/content ว่างเปล่า — บันทึกก่อน
doc-missing-name = ขาดชื่อเอกสาร
doc-publish-usage = การใช้งาน: /my/doc/<name>!publish <publisher>
doc-publish-ipld-usage = การใช้งาน: /my/doc/<name>!publish-ipld <publisher>
doc-publish-failed = เผยแพร่ { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = ส่งคำขอเก็บข้อมูลแล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-ipld-store-sent = ส่งคำขอเก็บข้อมูล IPLD แล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-fetch-done = ดึง { $cid } แล้ว → { $path }/content (ยังไม่รัน)
doc-fetch-failed = ดึง { $cid }: { $e }
doc-fetch-usage = การใช้งาน: /my/doc/<name>!fetch <cid>
doc-cid-value = { $path }/cid = { $cid }
doc-cid-not-set = { $path }/cid ยังไม่ได้ตั้งค่า
doc-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }
path-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }

# ── ช่วยเหลือ — หัวข้อ ───────────────────────────────────────────────────
help-header-zion = ── คำสั่ง zion ─────────────────────────────────────────────────────────────
help-header-messaging = ── การส่งข้อความ ──────────────────────────────────────────────────────────
help-header-focus = ── โหมดโฟกัส ─────────────────────────────────────────────────────────────
help-header-config = ── ไวยากรณ์การกำหนดค่าท้องถิ่น ─────────────────────────────────────────
help-header-common = ── path ที่ใช้บ่อย ─────────────────────────────────────────────────────
help-header-inbox = ── inbox ────────────────────────────────────────────────────────────────
help-header-documents = ── เอกสาร ────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── ช่วยเหลือ — คำสั่ง zion ─────────────────────────────────────────────
help-cmd-help =   .help                        ข้อความนี้
help-cmd-clear =   .clear                       ล้าง terminal
help-cmd-panic =   .panic                       ทางเลือกสุดท้าย — ใช้เมื่อมีปัญหา
help-cmd-history =   .history                     ประวัติคำสั่ง (รายการที่ซ้ำกันติดต่อกันถูกรวม)
help-cmd-logout =   .logout                      ออกจากระบบ
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── ช่วยเหลือ — การส่งข้อความ ───────────────────────────────────────────
help-msg-echo =   @alias                       แสดง DID ที่แก้ไขแล้ว (ไม่ส่งข้อความ)
help-msg-send =   @alias[:verb] body           ส่งข้อความ / RPC ไปยัง actor
help-msg-fragment =   @alias#fragment[:verb] body  ส่งพร้อม DID fragment ที่ระบุ
help-msg-escape =   \@name                       @name ตามตัวอักษร (ไม่ค้นหานามแฝง)

# ── ช่วยเหลือ — โหมดโฟกัส ───────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       โฟกัสที่ actor (เปลี่ยน prompt)
help-focus-clear =   .use                         ล้างโฟกัส

# ── ช่วยเหลือ — ไวยากรณ์การกำหนดค่า ──────────────────────────────────────
help-config-get =   .path                        ดึงค่า leaf หรือแสดงรายการ subtree
help-config-filter =   .path value                  กรองตามค่า
help-config-set =   .path: value                 ตั้งค่า leaf
help-config-delete =   .path:                       ลบ leaf หรือ subtree
help-config-verb =   .path!verb [args]            เรียกใช้กริยาท้องถิ่น

# ── ช่วยเหลือ — path ที่ใช้บ่อย ─────────────────────────────────────────
help-my =   /my                          แสดงการกำหนดค่าส่วนตัวทั้งหมด
help-aliases =   /my/aliases                  แสดงรายการนามแฝง
help-aliases-set =   /my/aliases/<name>: <did>    เพิ่ม/อัปเดตนามแฝง
help-aliases-del =   /my/aliases/<name>:          ลบนามแฝง
help-runtime-discover =   .ma [port]          ค้นหา runtime ท้องถิ่นและสร้าง @ma
help-runtime-claim =   .ma [port]             อ้างสิทธิ์ runtime ด้วย DID ของคุณ
help-identity =   /my/identity                 แสดงการกำหนดค่า identity
help-identity-did =   /my/identity/did             แสดง DID ของคุณ (อ่านอย่างเดียว)
help-identity-publish =   /my/identity!publish @pub    เผยแพร่ DID ผ่านบริการเผยแพร่
help-identity-export =   /my/identity!export          ดาวน์โหลดบันเดิลตัวตนของตัวเอง
help-config-path =   .config                      แสดงรายการ .config.* ทั้งหมด

# ── ช่วยเหลือ — inbox ───────────────────────────────────────────────────
help-inbox =   /my/inbox                    แสดงรายการ inbox (มุมมอง subtree)
help-inbox-n =   /my/inbox/N                  แสดงฟิลด์ของรายการ N
help-inbox-from =   /my/inbox/N/from             DID ผู้ส่งของรายการ N
help-inbox-reply =   /my/inbox/N!reply [body]     ส่งการตอบกลับ (ไม่มีเนื้อหา — เปิดโปรแกรมแก้ไข)
help-inbox-open =   /my/inbox/N!open             เปิดเนื้อหาอ่านอย่างเดียวในโปรแกรมแก้ไข
help-inbox-del =   /my/inbox/N:                 ลบรายการ N
help-inbox-delall =   /my/inbox:                   ลบรายการ inbox ทั้งหมด
help-inbox-flush =   /my/inbox!flush              พิมพ์รายการทั้งหมดไปยัง terminal
help-inbox-filter =   /my/inbox!filter @who        แสดงเฉพาะรายการจาก @who
help-inbox-traverse =   /my/inbox/N/sender/<field>   ดึงเอกสาร DID ผู้ส่งแบบ lazy

# ── ช่วยเหลือ — เอกสาร ──────────────────────────────────────────────────
help-doc-edit =   /my/doc/<name>!edit           เปิดโปรแกรมแก้ไขด้วยเนื้อหาที่บันทึก
help-doc-edit-cid =   /my/doc/<name>!edit <cid>     ดึง CID เปิดเพื่อตรวจสอบเท่านั้น
help-doc-eval =   /my/doc/<name>!eval           รันเนื้อหาที่บันทึกทีละบรรทัด
help-doc-publish =   /my/doc/<name>!publish @pub   บันทึกเป็น blob ดิบ (ทุกประเภท)
help-doc-publish-ipld =   /my/doc/<name>!publish-ipld @pub  บันทึก YAML เป็น IPLD DAG-CBOR node
help-doc-fetch =   /my/doc/<name>!fetch <cid>    นำเข้าเนื้อหา CID (ไม่รัน)
help-doc-cid =   /my/doc/<name>!cid            แสดง CID ที่บันทึก
help-doc-del =   /my/doc/<name>:              ลบเอกสาร

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = ภาษาที่ใช้ได้ (ตั้งค่าด้วย /my/i18n: <code>):
err-lang-not-found = ไม่พบภาษา: { $lang }

msg-send-failed = ส่งล้มเหลว: { $e }
msg-not-logged-in = ยังไม่ได้เข้าสู่ระบบ

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = ข้อผิดพลาดการแยกวิเคราะห์ YAML: { $e }
yaml-not-mapping = YAML ต้องเป็น mapping (คู่คีย์: ค่า); ข้อความธรรมดาและสเกลาร์ไม่สามารถเก็บเป็น DAG-CBOR ได้
dagcbor-encode-error = ข้อผิดพลาดการเข้ารหัส DAG-CBOR: { $e }
cbor-decode-error = ข้อผิดพลาดการถอดรหัส CBOR: { $e }
cbor-json-error = ข้อผิดพลาด CBOR เป็น JSON: { $e }
yaml-serialize-error = ข้อผิดพลาดการเรียงลำดับ YAML: { $e }
edit-reply-invalid = การตอบกลับการแก้ไขไม่ถูกต้อง
doc-publish-ipld-error = การเผยแพร่ IPLD ล้มเหลว: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = ข้อผิดพลาดบันทึกการตัดแต่งกล่องจดหมาย: { $e }
err-config-load = ข้อผิดพลาดในการโหลดการตั้งค่า: { $e }
err-lang-persist = ข้อผิดพลาดการบันทึกภาษา: { $e }
err-history-parse = ข้อผิดพลาดการแยกวิเคราะห์ประวัติ: { $e }
err-history-load = ข้อผิดพลาดการโหลดประวัติ: { $e }
err-ipfs-reply-decode = การถอดรหัสการตอบกลับ IPFS ล้มเหลว: { $e }
err-edit-cbor = ข้อผิดพลาดการแก้ไข CBOR: { $e }
err-popup-blocked = เบราว์เซอร์บล็อกป็อปอัป
status-publishing = กำลังเผยแพร่

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = ข้อผิดพลาด
rpc-error-detail = ข้อผิดพลาด: { $detail }
msg-new-message = ← [{ $from }] ข้อความใหม่ — { $count } ในกล่องขาเข้า
msg-chat = { $sender } พูดว่า { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } พูดว่า { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } เข้ามาในห้อง
room-leave = * { $name } ออกจากห้อง
room-drop  = * { $name } วาง { $thing }
room-take  = * { $name } หยิบ { $thing }
err-edit-decode-failed = แก้ไข: ถอดรหัสล้มเหลว: { $e }
err-edit-fetch-failed = แก้ไข: ดึงข้อมูลล้มเหลว: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = ไม่มีเซสชันที่ใช้งานอยู่ — ไม่สามารถลบโปรไฟล์ได้
profile-delete-error = การลบโปรไฟล์ล้มเหลว: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profile encrypted and sent to IPFS; DID document will be updated when CID arrives
profile-publish-done = profile published — DID document updated with ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identity already published — profile up to date
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = binary content (not displayed)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (ไม่มี)
profiles-deleted = โปรไฟล์ { $name } ถูกลบแล้ว
profiles-not-found = ไม่พบโปรไฟล์: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help/<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help/my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities/<n>          get entity
help-actor-entities-set =   @actor.entities/<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities/<n>!edit     edit entity
help-actor-entities-del =   @actor.entities/<n>:         delete entity
help-actor-config-get =   @actor.config/<key>          get config value
help-actor-config-set =   @actor.config/<key>: val     set config value
help-actor-acl =   @actor.acl                   get ACL
help-actor-acl-edit =   @actor.acl!edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only

help-topic-url =   .help.url                    เปิด zion ผ่านลิงก์ URL
help-header-url = ── พารามิเตอร์ URL ───────────────────────────────────────────────────────────────
help-url-intro =   แบ่งปันลิงก์ที่เปิด zion พร้อมผู้รับที่กรอกไว้ล่วงหน้า:
help-url-msg =   ?msg=<did>                   กรอกล่วงหน้า: @<did> (ข้อความธรรมดา)
help-url-say =   ?say=<did>                   กรอกล่วงหน้า: @<did>:say (กริยา say)
help-url-emote =   ?emote=<did>                 กรอกล่วงหน้า: @<did>:emote (กริยา emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   ช่องอินพุตถูกกรอกไว้ล่วงหน้าแต่ยังไม่ได้ส่ง — กด Enter เพื่อส่ง
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                เผยแพร่ตัวตนของคุณสู่เครือข่าย
help-header-publish = ── การเผยแพร่ตัวตน ───────────────────────────────────────────────────────────
help-publish-intro = การเผยแพร่ทำให้ตัวตนของคุณค้นหาได้บนเครือข่าย คนอื่นสามารถค้นหา DID ของคุณเพื่อติดต่อคุณได้
help-publish-ma = หากต้องการเผยแพร่ คุณต้องติดตั้ง ma (รันไทม์ท้องถิ่น) มันเชื่อมต่อ ego กับ IPFS/IPNS แทนคุณ
help-publish-steps = ขั้นตอน: รัน '.ma [port]' เพื่อตรวจหา ma ท้องถิ่น จากนั้น '/my/identity!publish @ma'
help-publish-without = หากไม่เผยแพร่ คนอื่นไม่สามารถติดต่อคุณได้ — แม้จะรู้ DID ของคุณ ก็ไม่สามารถแก้ไข endpoint ของคุณได้
profile-fetch-did-resolve-failed = DID not published yet — run '/my/identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Collecting batch — type commands, end with .batch
batch-already-collecting = Already collecting a batch — end with .batch first
batch-empty = Batch was empty — nothing to run
batch-running = Running batch sequentially…
batch-step-timeout = batch step timed out

batch-done = batch-done
batch-done-error = batch-done-error
msg-timeout = msg-timeout
help-cmd-batch-async = help-cmd-batch-async


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = ไม่สามารถดึง CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ไม่ถูกต้อง: { $value }
label-runtime = มา
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = คำเตือน: กุญแจส่วนตัว IPNS ของคุณจะถูกส่งไปยังรันไทม์นี้เพื่อเผยแพร่ข้อมูลประจำตัว ใช้เฉพาะรันไทม์ที่คุณไว้วางใจอย่างเต็มที่เท่านั้น
