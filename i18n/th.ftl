# zion — ภาษาไทย
lang-name = ภาษาไทย

# ── หน้าเข้าสู่ระบบ ───────────────────────────────────────────────────────
tab-login = เข้าสู่ระบบ
tab-new-identity = ตัวตนใหม่
tab-import = นำเข้า
label-passphrase = วลีรหัสผ่าน
label-username = ชื่อผู้ใช้
label-confirm-passphrase = ยืนยันวลีรหัสผ่าน
btn-login = เข้าสู่ระบบ
btn-export = ส่งออก
btn-generate = สร้าง
passphrase-warning = หากสูญหายวลีรหัสผ่าน ตัวตนของคุณจะสูญหายไปด้วย ไม่มีการกู้คืน
import-help = เลือกไฟล์ .zion.json ที่ส่งออกไว้ กลุ่มคีย์ยังคงเข้ารหัสอยู่
status-unlocking = กำลังปลดล็อก...
status-generating = กำลังสร้างตัวตน...
status-reading-file = กำลังอ่านไฟล์...
status-imported = นำเข้า '{ $name }' สำเร็จ — ไปที่แท็บเข้าสู่ระบบ
error-wrong-passphrase = วลีรหัสผ่านไม่ถูกต้อง: { $e }
error-identity-not-found = ไม่พบตัวตน '{ $name }'
error-username-required = ต้องระบุชื่อผู้ใช้
error-passphrase-required = ต้องระบุวลีรหัสผ่าน
error-passphrases-no-match = วลีรหัสผ่านไม่ตรงกัน

# ── ข้อความระบบ terminal ─────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — เข้าสู่ระบบในนาม { $username }
msg-type-help = พิมพ์ .help เพื่อดูรายการคำสั่ง
msg-connecting = กำลังเชื่อมต่อ iroh...
msg-iroh-ready = endpoint iroh พร้อมใช้งาน
msg-iroh-failed = iroh: { $e }
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
msg-reply-sent = ส่งการตอบกลับแล้ว
msg-reply-failed = การตอบกลับล้มเหลว: { $e }
msg-entity-publish-sent = entity { $name }: ส่งคำขอเผยแพร่แล้ว
msg-entity-publish-failed = การเผยแพร่ entity ล้มเหลว: { $e }
msg-field-publish-sent = entity { $name }.{ $field }: ส่งคำขอเผยแพร่แล้ว
msg-field-publish-failed = การเผยแพร่ field ล้มเหลว: { $e }
msg-acl-publish-sent = ACL runtime: ส่งคำขอเผยแพร่แล้ว
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

# ── กริยา — runtime ───────────────────────────────────────────────────────
discover-fetch-failed = การค้นหาล้มเหลวที่ { $url }: { $e }
discover-json-error = การค้นหาล้มเหลว: JSON ไม่ถูกต้องจาก { $url }: { $e }
discover-missing-did = การค้นหาล้มเหลว: status.json ขาดฟิลด์ `did`
discover-invalid-did = การค้นหาล้มเหลว: `did` ต้องขึ้นต้นด้วย did:ma:, ได้รับ `{ $did }`
discover-no-endpoint = คำเตือนการค้นหา: `endpoint_id` ขาดใน status.json; บันทึกเฉพาะ DID
discover-success = พบ ma ที่ { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   สร้างนามแฝง @ma แล้ว — เผยแพร่: .my.identity:publish @ma
claim-success = Runtime ถูกอ้างสิทธิ์สำหรับ { $did }
claim-conflict = Runtime ถูกอ้างสิทธิ์โดยตัวตนอื่นแล้ว
claim-http-failed = คำขอล้มเหลว: HTTP { $status }
claim-error = คำขอล้มเหลว: { $e }
claim-no-session = ยังไม่ได้เข้าสู่ระบบ; โปรดเข้าสู่ระบบก่อนอ้างสิทธิ์ runtime
runtime-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }

# ── กริยา — ACL ───────────────────────────────────────────────────────────
acl-reset = รีเซ็ต .my.acl แล้ว (เปิดทั้งหมด)
acl-persist-error = ข้อผิดพลาดการบันทึก: { $e }
acl-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ .my.acl

# ── กริยา — identity ──────────────────────────────────────────────────────
publish-usage = การใช้งาน: .my.identity:publish <did-หรือ-นามแฝง>

# ── กริยา — documents ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content ว่างเปล่า
doc-save-first = { $path }.content ว่างเปล่า — บันทึกก่อน
doc-missing-name = ขาดชื่อเอกสาร
doc-publish-usage = การใช้งาน: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = การใช้งาน: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = เผยแพร่ { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = ส่งคำขอเก็บข้อมูลแล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-ipld-store-sent = ส่งคำขอเก็บข้อมูล IPLD แล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-fetch-done = ดึง { $cid } แล้ว → { $path }.content (ยังไม่รัน)
doc-fetch-failed = ดึง { $cid }: { $e }
doc-fetch-usage = การใช้งาน: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ยังไม่ได้ตั้งค่า
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
help-cmd-logout =   .logout                      ออกจากระบบ

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
help-config-verb =   .path:verb [args]            เรียกใช้กริยาท้องถิ่น

# ── ช่วยเหลือ — path ที่ใช้บ่อย ─────────────────────────────────────────
help-my =   .my                          แสดงการกำหนดค่าส่วนตัวทั้งหมด
help-aliases =   .my.aliases                  แสดงรายการนามแฝง
help-aliases-set =   .my.aliases.<name>: <did>    เพิ่ม/อัปเดตนามแฝง
help-aliases-del =   .my.aliases.<name>:          ลบนามแฝง
help-runtime-discover =   .my.ma:discover          ค้นหา runtime ท้องถิ่นและสร้าง @ma
help-runtime-claim =   .my.ma:claim             อ้างสิทธิ์ runtime ด้วย DID ของคุณ
help-identity =   .my.identity                 แสดงการกำหนดค่า identity
help-identity-did =   .my.identity.did             แสดง DID ของคุณ (อ่านอย่างเดียว)
help-identity-publish =   .my.identity:publish @pub    เผยแพร่ DID ผ่านบริการเผยแพร่
help-config-path =   .config                      แสดงรายการ .config.* ทั้งหมด

# ── ช่วยเหลือ — inbox ───────────────────────────────────────────────────
help-inbox =   .my.inbox                    แสดงรายการ inbox (มุมมอง subtree)
help-inbox-n =   .my.inbox.N                  แสดงฟิลด์ของรายการ N
help-inbox-from =   .my.inbox.N.from             DID ผู้ส่งของรายการ N
help-inbox-reply =   .my.inbox.N:reply [body]     ส่งการตอบกลับ (ไม่มีเนื้อหา — เปิดโปรแกรมแก้ไข)
help-inbox-open =   .my.inbox.N:open             เปิดเนื้อหาอ่านอย่างเดียวในโปรแกรมแก้ไข
help-inbox-del =   .my.inbox.N:                 ลบรายการ N
help-inbox-delall =   .my.inbox:                   ลบรายการ inbox ทั้งหมด
help-inbox-flush =   .my.inbox:flush              พิมพ์รายการทั้งหมดไปยัง terminal
help-inbox-traverse =   .my.inbox.N.sender.<field>   ดึงเอกสาร DID ผู้ส่งแบบ lazy

# ── ช่วยเหลือ — เอกสาร ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           เปิดโปรแกรมแก้ไขด้วยเนื้อหาที่บันทึก
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     ดึง CID เปิดเพื่อตรวจสอบเท่านั้น
help-doc-eval =   .my.doc.<name>:eval           รันเนื้อหาที่บันทึกทีละบรรทัด
help-doc-publish =   .my.doc.<name>:publish @pub   บันทึกเป็น blob ดิบ (ทุกประเภท)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  บันทึก YAML เป็น IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>:fetch <cid>    นำเข้าเนื้อหา CID (ไม่รัน)
help-doc-cid =   .my.doc.<name>:cid            แสดง CID ที่บันทึก
help-doc-del =   .my.doc.<name>:              ลบเอกสาร

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = ภาษาที่ใช้ได้ (ตั้งค่าด้วย .my.i18n: <code>):
err-lang-not-found = ไม่พบภาษา: { $lang }
