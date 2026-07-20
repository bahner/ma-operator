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
msg-ma-connecting-matrix = กำลังพยายามเชื่อมต่อคุณกับ 間trix
msg-ma-checking-url = ma: { $url }
msg-local-ma-unreachable = ma: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = อ้างสิทธิ์ 間 ในเครื่องแล้ว
msg-local-ma-already-claimed = 間 ในเครื่องถูกอ้างสิทธิ์แล้ว
msg-local-ma-claim-failed = อ้างสิทธิ์ 間 ในเครื่องไม่สำเร็จ
msg-identity-not-published = ไม่พบตัวตนออนไลน์ — ถ้าติดตั้ง ma ในเครื่องแล้ว ให้รัน '.ma [port]' จากนั้น '.my.identity!publish @ma' พิมพ์ '.help/publish' เพื่อดูรายละเอียด
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
err-alias-value-fragment = ค่านามแฝงมี fragment DID-URL ที่ไม่ว่างได้ไม่เกินหนึ่งรายการ
err-alias-value-path = ค่านามแฝงต้องเป็น DID did:ma:<ipns> หรือ DID-URL (ไม่มี path)
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
discover-hint-endpoint-not-found = คำแนะนำ: endpoint not found. Check that `ma` exposes /status.json on port 5003.
discover-hint-server-error = คำแนะนำ: runtime returned a server error. Check `ma` logs and retry.
discover-hint-network = คำแนะนำ: network/connectivity issue. Start `ma`, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = คำแนะนำ: verify `ma` and IPFS Desktop are running, then retry `.ma`.
discover-success = พบ ma ที่ { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   สร้างชื่อแทน @ma แล้ว — รัน '.my.identity!publish @ma' เพื่อเผยแพร่ตัวตนของคุณ
claim-success = Runtime ถูกอ้างสิทธิ์สำหรับ { $did }
claim-conflict = Runtime ถูกอ้างสิทธิ์โดยตัวตนอื่นแล้ว
claim-already-owned = Runtime ถูกอ้างสิทธิ์โดยตัวตนนี้แล้ว
claim-http-failed = คำขอล้มเหลว: HTTP { $status }
claim-error = คำขอล้มเหลว: { $e }
claim-no-session = ยังไม่ได้เข้าสู่ระบบ; โปรดเข้าสู่ระบบก่อนอ้างสิทธิ์ runtime
runtime-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }

# ── กริยา — ACL ───────────────────────────────────────────────────────────
acl-reset = รีเซ็ต .my.acl แล้ว (เปิดทั้งหมด)
acl-persist-error = ข้อผิดพลาดการบันทึก: { $e }
acl-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ .my.acl

# ── กริยา — identity ──────────────────────────────────────────────────────
publish-usage = การใช้งาน: .my.identity!publish <did-หรือ-นามแฝง>
identity-exported = ดาวน์โหลดบันเดิลเป็น { $filename }
identity-export-failed = การส่งออกล้มเหลว: { $e }

# ── กริยา — documents ─────────────────────────────────────────────────────
doc-content-empty = { $path }.content ว่างเปล่า
doc-save-first = { $path }.content ว่างเปล่า — บันทึกก่อน
doc-missing-name = ขาดชื่อเอกสาร
doc-publish-usage = การใช้งาน: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = การใช้งาน: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = เผยแพร่ { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = เผยแพร่ล้มเหลว [{ $code }]: { $err }
doc-publish-error-hint = คำแนะนำ: { $hint }
doc-publish-hint-session = เข้าสู่ระบบอีกครั้งเพื่อให้อีโก้สามารถเข้าถึงรหัสประจำตัวของคุณได้
doc-publish-hint-target = ใช้ DID หรือนามแฝงของผู้จัดพิมพ์ที่ถูกต้องซึ่งแปลงเป็น 57
doc-publish-hint-network = ตรวจสอบรันไทม์ 7 และ 22 สามารถเข้าถึงได้ จากนั้นลองอีกครั้ง
doc-publish-hint-resolve = ตรวจสอบว่าเอกสาร DID ของผู้จัดพิมพ์ได้รับการเผยแพร่และมีปลายทางที่สามารถเข้าถึงได้
doc-publish-hint-acl = ขอให้ผู้จัดพิมพ์อนุญาต DID ของคุณใน 48
doc-publish-hint-runtime = รันไทม์/ปลั๊กอินปฏิเสธคำขอ ตรวจสอบเหตุผลและลองอีกครั้งหลังจากแก้ไขเอนทิตี/รันไทม์แล้ว
doc-publish-hint-ipfs = ตรวจสอบความสมบูรณ์ของ 12/17 ในเครื่องและสถานะรันไทม์ของผู้เผยแพร่
doc-publish-hint-unknown = ตรวจสอบบันทึกรันไทม์เพื่อดูสาเหตุโดยละเอียดแล้วลองอีกครั้ง
doc-store-sent = ส่งคำขอเก็บข้อมูลแล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-ipld-store-sent = ส่งคำขอเก็บข้อมูล IPLD แล้ว ({ $id }) → { $publisher }; CID จะมาทาง RPC reply
doc-fetch-done = ดึง { $cid } แล้ว → { $path }.content (ยังไม่รัน)
doc-fetch-failed = ดึง { $cid }: { $e }
doc-fetch-usage = การใช้งาน: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ยังไม่ได้ตั้งค่า
doc-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }
path-no-verb = ไม่มีกริยา `{ $verb }` สำหรับ { $path }

# ── ช่วยเหลือ — หัวข้อ ───────────────────────────────────────────────────
help-header-zion = ── คำสั่ง zion ─────────────────────────────────────────────────────────────
help-header-messaging = ── การส่งข้อความ ──────────────────────────────────────────────────────────
help-header-config = ── ไวยากรณ์การกำหนดค่าท้องถิ่น ─────────────────────────────────────────
help-header-common = ── path ที่ใช้บ่อย ─────────────────────────────────────────────────────
help-header-inbox = ── กล่องจดหมาย ────────────────────────────────────────────────────────────────
help-header-documents = ── เอกสาร ────────────────────────────────────────────────────────────────
help-header-i18n = ── ภาษา ──────────────────────────────────────────────────────────────
help-header-ma = ── 3 พื้นที่ ───────────────────────────────────────────────────────────────
help-header-ma-entry = ── เข้าสู่ 間-พื้นที่ ──────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── ช่วยเหลือ — คำสั่ง zion ─────────────────────────────────────────────
help-cmd-help =   .help                        ข้อความนี้
help-cmd-clear =   .clear                       ล้าง terminal
help-cmd-panic =   .panic                       ทางเลือกสุดท้าย — ใช้เมื่อมีปัญหา
help-cmd-history =   .history                     ประวัติคำสั่ง (รายการที่ซ้ำกันติดต่อกันถูกรวม)
help-cmd-logout =   .logout                      ออกจากระบบ
help-cmd-batch =   .batch                       ประเมินเอกสาร scratch แบบขนาน
help-cmd-batch-sync =   .batch:sync / .batch         ประเมินเอกสาร scratch ทีละบรรทัด

# ── ช่วยเหลือ — การส่งข้อความ ───────────────────────────────────────────
help-msg-echo =   @alias                       แสดง DID/DID-URL ที่แก้แล้ว (ไม่ส่งข้อความ)
help-msg-send =   @alias!msg body / @alias:verb args           ส่งข้อความ / RPC ไปยัง actor
help-msg-fragment =   @alias#fragment:verb body  ส่งพร้อม DID fragment ที่ระบุ
help-msg-escape =   \@name                       @name ตามตัวอักษร (ไม่ค้นหานามแฝง)

# ── ช่วยเหลือ — โหมดโฟกัส ───────────────────────────────────────────────

# ── ช่วยเหลือ — ไวยากรณ์การกำหนดค่า ──────────────────────────────────────
help-config-get =   .path                        ดึงค่า leaf หรือแสดงรายการ subtree
help-config-filter =   .path value                  กรองตามค่า
help-config-set =   .path: value                 ตั้งค่า leaf
help-config-delete =   .path:                       ลบ leaf หรือ subtree
help-config-verb =   .path!verb [args]            เรียกใช้กริยาท้องถิ่น

# ── ช่วยเหลือ — path ที่ใช้บ่อย ─────────────────────────────────────────
help-my =   .my                          แสดงการกำหนดค่าส่วนตัวทั้งหมด
help-aliases =   .my.aliases                  แสดงรายการนามแฝง
help-aliases-set =   .my.aliases.<name>: <did-url>    เพิ่ม/อัปเดตนามแฝง (DID หรือ DID-URL)
help-aliases-del =   .my.aliases.<name>:          ลบนามแฝง
help-runtime-discover =   .ma [port]          ค้นหา runtime ท้องถิ่นและสร้าง @ma
help-runtime-claim =   .ma [port]             อ้างสิทธิ์ runtime ด้วย DID ของคุณ
help-identity =   .my.identity                 แสดงการกำหนดค่า identity
help-identity-did =   .my.identity.did             แสดง DID ของคุณ (อ่านอย่างเดียว)
help-identity-publish =   .my.identity!publish @pub    เผยแพร่ DID ผ่านบริการเผยแพร่
help-identity-export =   .my.identity!export          ดาวน์โหลดบันเดิลตัวตนของตัวเอง
help-config-path =   .config                      แสดงรายการ .config.* ทั้งหมด

# ── ช่วยเหลือ — inbox ───────────────────────────────────────────────────
help-inbox =   .my.inbox                    แสดงรายการ inbox (มุมมอง subtree)
help-inbox-n =   .my.inbox.N                  แสดงฟิลด์ของรายการ N
help-inbox-from =   .my.inbox.N.from             DID ผู้ส่งของรายการ N
help-inbox-reply =   .my.inbox.N!reply [body]     ส่งการตอบกลับ (ไม่มีเนื้อหา — เปิดโปรแกรมแก้ไข)
help-inbox-open =   .my.inbox.N!open             เปิดเนื้อหาอ่านอย่างเดียวในโปรแกรมแก้ไข
help-inbox-del =   .my.inbox.N:                 ลบรายการ N
help-inbox-delall =   .my.inbox:                   ลบรายการ inbox ทั้งหมด
help-inbox-flush =   .my.inbox!flush              พิมพ์รายการทั้งหมดไปยัง terminal
help-inbox-filter =   .my.inbox!filter @who        แสดงเฉพาะรายการจาก @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   ดึงเอกสาร DID ผู้ส่งแบบ lazy

# ── ช่วยเหลือ — เอกสาร ──────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           เปิดโปรแกรมแก้ไขด้วยเนื้อหาที่บันทึก
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     ดึง CID เปิดเพื่อตรวจสอบเท่านั้น
help-doc-eval =   .my.doc.<name>!eval           รันเนื้อหาที่บันทึกทีละบรรทัด
help-doc-publish =   .my.doc.<name>!publish @pub   บันทึกเป็น blob ดิบ (ทุกประเภท)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  บันทึก YAML เป็น IPLD DAG-CBOR node
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    นำเข้าเนื้อหา CID (ไม่รัน)
help-doc-cid =   .my.doc.<name>!cid            แสดง CID ที่บันทึก
help-doc-del =   .my.doc.<name>:              ลบเอกสาร

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n จัดเก็บการตั้งค่าภาษาที่เชื่อมโยงกับข้อมูลประจำตัวของคุณ
help-i18n-set = .my.i18n: <code>             เลือกภาษาที่ 20 ใช้สำหรับข้อมูลระบุตัวตนนี้
help-i18n-list = .my.i18n!list               แสดงรายการรหัสภาษาที่มีอยู่

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = ห้อง 間 คือพื้นที่ระหว่างอัตลักษณ์ 間 ma ทำให้อัตลักษณ์เหล่านั้นพบกันและสื่อสารกันได้ เมื่อเผยแพร่อัตลักษณ์ของคุณแล้ว คุณก็เข้าร่วมได้
help-ma-command =   .ma [port]                   เชื่อมต่อกับ ma runtime ในเครื่อง อ่าน /status.json แล้วบันทึก .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     เผยแพร่เอกสาร DID ของคุณ เพื่อให้ผู้อื่นค้นหากุญแจและ endpoint ของคุณได้
help-ma-security = ขอบเขตความไว้วางใจที่ชัดที่สุดคือ ma runtime ของคุณเองพร้อม IPFS Desktop/Kubo ของคุณเอง publisher ระยะไกลอาจมีประโยชน์ แต่คุณจะพึ่งพาบริการของคนอื่น
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  ma runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             วิธีเข้าสู่ห้อง 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = เมื่ออัตลักษณ์ของคุณเป็นที่รู้จักแล้ว .enter @ma จะพาคุณเข้าสู่ 間 หา world สักแห่ง เข้าไปในนั้น แล้วมีส่วนร่วมจากตรงนั้น
help-ma-entry-steps = เริ่ม IPFS Desktop และ ma จากนั้นรัน .ma เผยแพร่ด้วย .my.identity!publish @ma หา world แล้วเข้าสู่ด้วย .enter @ma
help-ma-entry-command =   .enter @ma                  เข้าสู่ 間 ผ่าน @ma runtime
help-ma-entry-toggle =   .enter                       เปิดหรือปิดโฟกัสห้อง; อัตลักษณ์ของคุณยังทำงานอยู่
help-ma-entry-url =   ?enter=<runtime>             เข้าหลัง login จาก URL ที่แชร์

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = ภาษาที่ใช้ได้ (ตั้งค่าด้วย .my.i18n: <code>):
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
profile-wrong-user = ไม่สามารถตั้งค่า 11 สำหรับโปรไฟล์อื่นได้ — เฉพาะของคุณเองเท่านั้น
profile-wrong-user-name = ไม่สามารถตั้งค่า 11 สำหรับ 19 ได้ — เฉพาะโปรไฟล์ของคุณเองเท่านั้น
profile-no-ma = ไม่มีการกำหนดค่ารันไทม์ 3 — รัน 31 ก่อน
profile-no-cid = ไม่มี 3 เก็บไว้สำหรับโปรไฟล์นี้ — รัน 37 ก่อน
profile-no-cid-in-doc = ไม่พบโปรไฟล์ 11 ในเอกสาร DID — รัน 43 ก่อน
profile-publish-sent = โปรไฟล์ถูกเข้ารหัสและส่งไปยัง IPFS แล้ว; เอกสาร DID จะอัปเดตเมื่อ CID มาถึง
profile-publish-done = เผยแพร่โปรไฟล์แล้ว — อัปเดตเอกสาร DID ด้วย ma.agent CID แล้ว
profile-publish-failed = การเผยแพร่โปรไฟล์ล้มเหลว: 24
profile-fetch-done = ดึงโปรไฟล์แล้ว — คีย์ 18 โหลดจาก 43
profile-fetch-failed = การดึงโปรไฟล์ล้มเหลว: 22
msg-identity-exists = เผยแพร่ข้อมูลประจำตัวแล้ว — โปรไฟล์เป็นปัจจุบัน
profile-import-exists = มีโปรไฟล์ 8 อยู่แล้ว — ลบออกก่อน
profile-import-wrong-user = ไฟล์มีโปรไฟล์ 22 คาดว่า 42

# -- CID content operations
cid-op-binary = เนื้อหาไบนารี (ไม่แสดง)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = ไม่สามารถเรียกเนื้อหา: 25
cid-op-unknown = การดำเนินการเนื้อหาที่ไม่รู้จัก: 27
cid-op-wc = { $lines } บรรทัด 18 คำ 36 ตัวอักษร
profiles-empty = (ไม่มี)
profiles-deleted = โปรไฟล์ { $name } ถูกลบแล้ว
profiles-not-found = ไม่พบโปรไฟล์: { $name }

# -- Help topics index
help-header-topics = -- หัวข้อ -- พิมพ์ .help/<topic> เพื่อดูรายละเอียด
help-topic-msg =   .help/msg                    ข้อความ
help-topic-ma = .help/ma                     ma-ช่องว่าง การเผยแพร่ และรายการ
help-topic-path = .help/path                   ไวยากรณ์จุดเส้นทางท้องถิ่น
help-topic-my =   .help/my                     config ส่วนตัว
help-topic-inbox =   .help/inbox                  กล่องขาเข้า
help-topic-doc =   .help/doc                    เอกสาร
help-topic-actor =   .help/actor                  actor ระยะไกล
help-unknown-topic =   .help/{ $topic }: หัวข้อที่ไม่รู้จัก

# -- Help actor section
help-header-actor = -- actor ระยะไกล
help-actor-echo =   @actor                       แสดง DID ที่แก้ไขแล้ว
help-actor-text = @actor[#entity]!msg|!say|!emote body         ส่งข้อความโดยตรง/แชท/แสดงอารมณ์
help-actor-ping = @actor:ping                  ปิงความมีชีวิตชีวา
help-actor-entities =   @actor/entities              แสดงรายการ entity
help-actor-entities-get = @actor/entities/<n>          รับโหนดเอนทิตี
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   ตั้งค่าเอนทิตีโดยการอ้างอิง 14
help-actor-entities-edit =   @actor/entities/<n>!edit     แก้ไข entity
help-actor-entities-del = @actor/entities/<n>:         ลบเอนทิตี
help-actor-config-get =   @actor/config/<key>          รับค่า config
help-actor-config-set =   @actor/config/<key>: val     ตั้งค่า config
help-actor-acl = @actor/acl                   รับ 4
help-actor-acl-edit =   @actor/acl!edit              แก้ไข ACL
help-actor-fragment =   @actor#entity                ส่งไปยัง plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ไปยัง plugin
help-header-cid-ops = ── 3 นักแสดงเรียก ────────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  โทรหาเอนทิตี 15 จาก 24 และรอการตอบกลับ
help-actor-head = (@actor/path)                ดึงเนื้อหา CRUD ระยะไกลจาก 31
help-actor-tail = (<bafy...>)                  รวมและประเมิน 21 จาก 36 41
help-actor-wc = (define x (@actor:verb arg))  ให้ 5 ตอบกลับในสภาพแวดล้อมเซสชัน
help-actor-wc-l = .my.scheme.ma!edit           แก้ไขตัวช่วย 11 ที่บันทึกไว้สำหรับข้อมูลระบุตัวตนนี้

help-topic-url =   .help/url                    เปิด zion ผ่านลิงก์ URL
help-topic-i18n = .help/i18n                   การตั้งค่าภาษาสำหรับตัวตนของคุณ
help-header-url = ── พารามิเตอร์ URL ───────────────────────────────────────────────────────────────
help-url-intro =   แบ่งปันลิงก์ที่เปิด zion พร้อมผู้รับที่กรอกไว้ล่วงหน้า:
help-url-msg =   ?msg=<did>                   กรอกล่วงหน้า: @<did>!msg (ข้อความธรรมดา)
help-url-say =   ?say=<did>                   กรอกล่วงหน้า: @<did>!say (กริยา say)
help-url-emote =   ?emote=<did>                 กรอกล่วงหน้า: @<did>!emote (กริยา emote)
help-url-ma = ?ma=<did-or-url>              กรอกรันไทม์ DID / 23 URL ไว้ล่วงหน้า
help-url-enter = ?enter=<runtime>             เข้าสู่โลกรันไทม์หลังจากเข้าสู่ระบบ
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   ช่องอินพุตถูกกรอกไว้ล่วงหน้าแต่ยังไม่ได้ส่ง — กด Enter เพื่อส่ง
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                เผยแพร่ตัวตนของคุณสู่เครือข่าย
help-header-publish = ── การเผยแพร่ตัวตน ───────────────────────────────────────────────────────────
help-publish-intro = การเผยแพร่ทำให้ตัวตนของคุณค้นหาได้บนเครือข่าย คนอื่นสามารถค้นหา DID ของคุณเพื่อติดต่อคุณได้
help-publish-ma = หากต้องการเผยแพร่ คุณต้องติดตั้ง ma (รันไทม์ท้องถิ่น) มันเชื่อมต่อ ego กับ IPFS/IPNS แทนคุณ
help-publish-steps = ขั้นตอน: รัน '.ma [port]' เพื่อตรวจหา ma ท้องถิ่น จากนั้น '.my.identity!publish @ma'
help-publish-without = หากไม่เผยแพร่ คนอื่นไม่สามารถติดต่อคุณได้ — แม้จะรู้ DID ของคุณ ก็ไม่สามารถแก้ไข endpoint ของคุณได้
profile-fetch-did-resolve-failed = ยังไม่ได้เผยแพร่ — รัน 28 ก่อน จากนั้นจึง 67 โปรไฟล์ของคุณ
profile-update-done = อัปเดตโปรไฟล์แล้ว — คีย์ 18 ถูกรวมจาก 43
profile-delete-needs-name = ระบุชื่อโปรไฟล์: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = การรวบรวมแบทช์ — พิมพ์คำสั่ง ลงท้ายด้วย .batch
batch-already-collecting = รวบรวมชุดแล้ว — ปิดท้ายด้วย .batch ก่อน
batch-empty = แบตช์ว่างเปล่า — ไม่มีอะไรให้รัน
batch-running = กำลังรัน batch…
batch-step-timeout = ขั้นตอนแบทช์หมดเวลา

batch-done = batch เสร็จใน { $secs }s — { $steps } ขั้นตอน
batch-done-error = batch เสร็จพร้อมข้อผิดพลาดใน { $secs }s — { $steps } ขั้นตอน
msg-timeout = ข้อความหมดเวลา (ไม่มีคำตอบใน 60s)
err-unknown-command = คำสั่งที่ไม่รู้จัก: { $path }
err-read-only-path = { $path } เป็นแบบอ่านอย่างเดียว
help-cmd-batch-async =   .batch:async / .batch        ประเมินเอกสาร scratch แบบขนาน


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = ไม่สามารถดึง CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID ไม่ถูกต้อง: { $value }
label-runtime = มา
label-runtime-placeholder = did:ma:... or http://localhost:5003
warning-remote-runtime = คำเตือน: กุญแจส่วนตัว IPNS ของคุณจะถูกส่งไปยังรันไทม์นี้เพื่อเผยแพร่ข้อมูลประจำตัว ใช้เฉพาะรันไทม์ที่คุณไว้วางใจอย่างเต็มที่เท่านั้น
