# zion — Bahasa Indonesia
lang-name = Bahasa Indonesia
label-nick = nama panggilan
new-identity-nick-help = Pilih nama panggilan untuk 間-space. Ini hanya nama panggilan dan bisa diubah kapan saja.
error-nick-required = nama panggilan wajib diisi
error-nick-invalid = nama panggilan tidak boleh berisi spasi atau @

# ── Halaman masuk ─────────────────────────────────────────────────────────
tab-login = masuk
tab-new-identity = identitas baru
tab-import-profile = impor profil
label-passphrase = frasa sandi
label-username = nama pengguna
label-confirm-passphrase = konfirmasi frasa sandi
label-did = DID
label-profile-cid = CID profil
label-or-file = atau file
btn-login = masuk
btn-export = ekspor
btn-generate = buat
btn-new-endpoint = titik akhir baru
btn-import-profile = impor profil
btn-show-qr = tampilkan QR
btn-scan-qr = pindai QR
qr-scan-hint = Arahkan kamera ke kode QR profil zion.
qr-error-camera = kamera tidak tersedia: { $e }
qr-error-too-large = profil terlalu besar untuk kode QR
passphrase-warning = Frasa sandi hilang = identitas hilang. Tidak ada pemulihan.
import-profile-help = Impor profil menggunakan CID atau file. Anda memerlukan frasa sandi yang sama yang digunakan saat menerbitkan.
import-profile-detected-user = Profil milik: { $name }
status-unlocking = membuka kunci...
status-generating = membuat identitas...
status-reading-file = membaca file...
status-fetching-profile = mengambil profil dari IPFS...
login-restored-from-cache = IPFS profile unavailable ({ $e }) — restored from local cache
status-imported = berhasil mengimpor '{ $name }' — pindah ke tab Masuk
status-importing-profile = mengimpor profil...
profile-import-done = profil diimpor untuk '{ $name }' — { $n } kunci dimuat
error-wrong-passphrase = frasa sandi salah: { $e }
error-identity-not-found = identitas '{ $name }' tidak ditemukan
error-username-required = nama pengguna diperlukan
error-passphrase-required = frasa sandi diperlukan
error-passphrases-no-match = frasa sandi tidak cocok
error-profile-source-required = berikan CID atau unggah file
error-did-required = masukkan DID Anda
error-profile-fetch = tidak dapat mengambil profil: { $e }
error-profile-no-username = profil tidak memiliki nama pengguna
error-profile-no-identity = identitas '{ $name }' tidak ditemukan — impor identitas terlebih dahulu

# ── Pesan sistem terminal ─────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — masuk sebagai { $username }
msg-type-help = Ketik .help untuk daftar perintah.
msg-getting-started = Coba: say Hello world, look, .help, atau help.
msg-connecting = menghubungkan ke iroh...
msg-iroh-ready = endpoint iroh siap
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID diterbitkan melalui 間 lokal ({ $url })
msg-identity-publication-propagating = Publikasi identitas masih menyebar; entry ditunda: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Menerbitkan identitas. Ini dapat memakan waktu hingga { $seconds } detik.
msg-ma-connecting-matrix = mencoba menghubungkanmu ke 間trix
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = 間 lokal diklaim
msg-local-ma-already-claimed = 間 lokal sudah diklaim
msg-local-ma-claim-failed = gagal mengklaim 間 lokal
msg-identity-not-published = Identitas tidak ditemukan secara online — jika 間 terpasang secara lokal, jalankan '.ma: claim [port]' lalu '.my.identity!publish @ma'. Ketik '.help/publish' untuk detail.
msg-blocked = ⊗ diblokir [{ $cap }]: { $from }
msg-focus-cleared = fokus dibersihkan
msg-left = left
msg-focusing = memfokuskan { $did } sebagai { $prompt }
msg-set = { $path }: { $value }
msg-deleted = menghapus { $path } ({ $count } entri)
msg-read-only = { $path } hanya baca
msg-subtree-set = { $path } adalah subpohon; menolak pengaturan
msg-ancestor-leaf = leluhur { $path } adalah daun; menolak bayangan
msg-key-not-found = kunci tidak ditemukan: { $path }
msg-link-not-connected = kesalahan pengambilan tautan: tidak terhubung
msg-link-fetch-error = kesalahan pengambilan tautan: { $e }
msg-link-key-not-found = kunci `{ $key }` tidak ditemukan dalam dokumen tertaut

# ── Validasi alias ────────────────────────────────────────────────────────
err-alias-name-empty = nama alias tidak boleh kosong
err-alias-has-dot = nama alias tidak boleh mengandung '.'
err-alias-has-fragment = nama alias tidak boleh mengandung '#'
err-alias-value-fragment = nilai alias boleh berisi paling banyak satu fragmen DID-URL yang tidak kosong
err-alias-value-path = nilai alias harus berupa DID did:ma:<ipns> atau DID-URL (tanpa path)
err-alias-not-did = nilai alias harus dimulai dengan did:ma:
err-unknown-alias = alias tidak dikenal: @{ $name }
err-bare-did = diharapkan did:ma:<ipns> tanpa fragmen atau jalur, mendapat { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Simpan
btn-eval = Jalankan
btn-cancel = Batal
msg-jobs-cancelled = pekerjaan dibatalkan
btn-close = Tutup
btn-reply = Balas
btn-publish = Terbitkan
btn-publish-ipld = Terbitkan IPLD
msg-reply-sent = balasan terkirim
msg-reply-failed = balasan gagal: { $e }
msg-entity-publish-sent = entitas { $name }: penerbitan terkirim
msg-entity-publish-failed = penerbitan entitas gagal: { $e }
msg-kind-publish-failed = penerbitan jenis gagal: { $e }
msg-field-publish-sent = entitas { $name }.{ $field }: penerbitan terkirim
msg-field-publish-failed = penerbitan bidang gagal: { $e }
msg-acl-publish-sent = ACL runtime: penerbitan terkirim
msg-crud-edit-publish-sent = { $path }: penerbitan terkirim
msg-acl-publish-failed = penerbitan ACL runtime gagal: { $e }
msg-yaml-error = kesalahan YAML: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = berhasil mengambil { $cid } — tinjau sebelum menjalankan
msg-fetch-failed = pengambilan { $cid }: { $e }

# ── Kata kerja — kotak masuk ──────────────────────────────────────────────
inbox-empty = kotak masuk kosong
inbox-entry-not-found = entri kotak masuk { $n } tidak ditemukan
inbox-no-message-id = entri kotak masuk { $n } tidak memiliki message_id
inbox-no-verb = tidak ada kata kerja `{ $verb }` untuk entri kotak masuk { $n }
inbox-filter-no-arg = filter memerlukan argumen DID atau alias
inbox-filter-empty = tidak ada pesan dari { $did }

# ── Kata kerja — runtime ──────────────────────────────────────────────────
discover-fetch-failed = penemuan gagal di { $url }: { $e }
discover-json-error = penemuan gagal: JSON tidak valid dari { $url }: { $e }
discover-missing-did = penemuan gagal: status.json tidak memiliki bidang `did`
discover-invalid-did = penemuan gagal: `did` diharapkan dimulai dengan did:ma:, mendapat `{ $did }`
discover-no-endpoint = peringatan penemuan: `endpoint_id` tidak ada di status.json; hanya DID tersimpan
discover-hint-endpoint-not-found = Petunjuk: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = Petunjuk: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = Petunjuk: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = Petunjuk: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 ditemukan di { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma dibuat — jalankan '.my.identity!publish @ma' untuk mempublikasikan identitas Anda.
claim-success = Runtime diklaim untuk { $did }
claim-conflict = Runtime sudah diklaim oleh identitas lain
claim-already-owned = Runtime sudah diklaim oleh identitas ini
claim-http-failed = klaim gagal: HTTP { $status }
claim-error = klaim gagal: { $e }
claim-no-session = belum masuk; masuk dulu untuk mengklaim runtime
runtime-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }

# ── Kata kerja — ACL ──────────────────────────────────────────────────────
acl-reset = .my.acl direset (sepenuhnya terbuka)
err-persist = kesalahan persistensi: { $e }
acl-no-verb = tidak ada kata kerja `{ $verb }` untuk .my.acl

# ── Kata kerja — identitas ────────────────────────────────────────────────
publish-usage = penggunaan: .my.identity!publish <did-atau-alias>
identity-exported = Paket diunduh sebagai { $filename }
identity-export-failed = Ekspor gagal: { $e }

# ── Kata kerja — dokumen ──────────────────────────────────────────────────
doc-content-empty = { $path } kosong
doc-save-first = { $path } kosong — simpan dulu
doc-missing-name = nama dokumen tidak ada
doc-publish-usage = penggunaan: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = penggunaan: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = penerbitan { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = publikasi gagal [{ $code }]: { $err }
doc-publish-error-hint = Petunjuk: { $hint }
doc-publish-hint-session = masuk lagi agar ego dapat mengakses kunci identitas Anda
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = verifikasi dokumen DID penerbit diterbitkan dan berisi titik akhir yang dapat dijangkau
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = runtime/plugin menolak permintaan; periksa alasannya dan coba lagi setelah memperbaiki entitas/runtime
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = periksa log waktu proses untuk mengetahui penyebab detailnya dan coba lagi
doc-store-sent = permintaan penyimpanan terkirim ({ $id }) → { $publisher }; CID akan tiba melalui balasan RPC
doc-ipld-store-sent = permintaan penyimpanan IPLD terkirim ({ $id }) → { $publisher }; CID akan tiba melalui balasan RPC
doc-fetch-done = mengambil { $cid } → { $path } (tidak dijalankan)
doc-fetch-failed = pengambilan { $cid }: { $e }
doc-fetch-usage = penggunaan: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid belum diatur
doc-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }
path-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }

# ── Bantuan — judul ───────────────────────────────────────────────────────
help-header-zion = ── perintah zion ─────────────────────────────────────────────────────────
help-header-messaging = ── pesan ────────────────────────────────────────────────────────────────
help-header-config = ── sintaks konfigurasi lokal ─────────────────────────────────────────────
help-header-common = ── jalur umum ───────────────────────────────────────────────────────────
help-header-inbox = ── kotak masuk ──────────────────────────────────────────────────────────
help-header-documents = ── dokumen ──────────────────────────────────────────────────────────────
help-header-i18n = ── bahasa ─────────────────────────────────────────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── memasuki 間-ruang ─────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Bantuan — perintah zion ───────────────────────────────────────────────
help-cmd-help =   .help                        teks ini
help-cmd-clear =   .clear                       bersihkan terminal
help-cmd-panic =   .panic                       pilihan terakhir — gunakan saat bermasalah
help-cmd-history =   .history [n]                 riwayat perintah (duplikat berurutan digabung); n opsional hanya menampilkan n baris terakhir
help-cmd-logout =   .logout                      keluar
help-cmd-batch =   .batch                       evaluasi dokumen coretan secara paralel
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         evaluasi dokumen coretan baris demi baris

# ── Bantuan — pesan ───────────────────────────────────────────────────────
help-msg-echo =   @alias                       tampilkan DID/DID-URL yang diselesaikan (tidak mengirim pesan)
help-msg-send =   @alias!msg body / @alias:verb args           kirim pesan / RPC ke aktor
help-msg-fragment =   @alias#fragment:verb body  kirim ke alias dengan fragmen DID eksplisit
help-msg-escape =   \@name                       literal @name (tidak ada pencarian alias)

# ── Bantuan — mode fokus ──────────────────────────────────────────────────

# ── Bantuan — sintaks konfigurasi ─────────────────────────────────────────
help-config-get =   .path                        ambil nilai daun atau daftar subpohon
help-config-filter =   .path [nama]                 daftar nama kunci anak yang mengandung nama
help-config-full =   .path. [nama]                daftar nilai lengkap subpohon yang mengandung nama
help-config-set =   .path: value                 atur nilai daun
help-config-delete =   .path:                       hapus daun atau subpohon
help-config-verb =   .path!verb [args]            panggil kata kerja lokal

# ── Bantuan — jalur umum ──────────────────────────────────────────────────
help-my =   .my                          tampilkan semua konfigurasi pribadi
help-aliases =   .my.aliases                  daftar alias
help-aliases-set =   .my.aliases.<name>: <did-url>    tambah/perbarui alias (DID atau DID-URL)
help-aliases-del =   .my.aliases.<name>:          hapus alias
help-runtime-discover =   .ma: claim [port]          temukan runtime lokal dan buat alias @ma
help-runtime-claim =   .ma: claim [port]             klaim kepemilikan runtime dengan DID Anda
help-identity =   .my.identity                 tampilkan konfigurasi identitas
help-identity-did =   .my.identity.did             tampilkan DID sendiri (hanya baca)
help-identity-publish =   .my.identity!publish @pub    terbitkan DID melalui layanan penerbitan
help-identity-export =   .my.identity!export          unduh paket identitas sendiri
help-config-path =   .config                      tampilkan semua entri .config.*

# ── Bantuan — kotak masuk ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    daftar kotak masuk (tampilan subpohon)
help-inbox-n =   .my.inbox.N                  tampilkan bidang entri N
help-inbox-from =   .my.inbox.N.from             DID pengirim entri N
help-inbox-reply =   .my.inbox.N!reply [body]     kirim balasan (tanpa isi — buka editor)
help-inbox-open =   .my.inbox.N!open             buka konten entri di editor hanya baca
help-inbox-del =   .my.inbox.N:                 hapus entri N
help-inbox-delall =   .my.inbox:                   hapus semua entri kotak masuk
help-inbox-flush =   .my.inbox!flush              cetak semua entri ke terminal
help-inbox-filter =   .my.inbox!filter @who        tampilkan hanya entri dari @who
help-inbox-traverse =   .my.inbox.N.sender.<field>   jelajahi dokumen DID pengirim secara malas

# ── Bantuan — dokumen ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           buka editor dengan konten tersimpan
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     ambil CID, buka untuk ditinjau saja
help-doc-eval =   .my.doc.<name>!eval           jalankan konten tersimpan baris per baris
help-doc-publish =   .my.doc.<name>!publish @pub   simpan sebagai blob mentah (tipe apa saja)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  simpan YAML sebagai simpul IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    impor konten CID (tidak dijalankan)
help-doc-cid =   .my.doc.<name>!cid            tampilkan CID tersimpan
help-doc-del =   .my.doc.<name>:              hapus dokumen

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n menyimpan preferensi bahasa yang terkait dengan identitas Anda.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               daftar kode bahasa yang tersedia

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = Ruang 間 adalah ruang di antara identitas 間. ma membuat identitas-identitas itu dapat saling menemukan dan berkomunikasi; setelah identitasmu dipublikasikan, kamu bisa ikut serta.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   hubungkan ke 間 runtime lokal, baca /status.json, dan simpan .ma.ctx.*
help-ma-publish =   .my.identity!publish @ma     publikasikan dokumen DID-mu agar orang lain dapat menemukan kunci dan endpoint-mu
help-ma-security = Batas kepercayaan paling jelas adalah 間 runtime milikmu sendiri dengan IPFS Desktop/Kubo milikmu sendiri. Publisher jarak jauh bisa berguna, tetapi saat itu kamu bergantung pada layanan orang lain.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             cara masuk ke ruang 間

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Setelah identitasmu dikenal, .enter @ma membiarkanmu masuk ke 間. Temukan sebuah dunia, masuklah ke dalamnya, dan ikutlah dari sana.
help-ma-entry-steps = Jalankan IPFS Desktop dan ma, lalu jalankan .ma. Publikasikan dengan .my.identity!publish @ma, temukan dunia, dan masuk dengan .enter @ma.
help-ma-entry-command =   .enter @ma                  masuk ke 間 melalui runtime @ma
help-ma-entry-toggle =   .enter                       aktifkan atau nonaktifkan fokus ruang; identitasmu tetap aktif
help-ma-entry-url =   ?enter=<runtime>             masuk setelah login dari URL bersama

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Bahasa yang tersedia (atur dengan .my.i18n: <code>):
err-lang-not-found = bahasa tidak ditemukan: { $lang }

msg-send-failed = pengiriman gagal: { $e }
msg-not-logged-in = belum masuk

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = Kesalahan penguraian YAML: { $e }
yaml-not-mapping = YAML harus berupa mapping (pasangan kunci: nilai); teks biasa dan skalar tidak dapat disimpan sebagai DAG-CBOR
dagcbor-encode-error = Kesalahan enkode DAG-CBOR: { $e }
cbor-decode-error = Kesalahan dekode CBOR: { $e }
cbor-json-error = Kesalahan CBOR ke JSON: { $e }
yaml-serialise-error = Kesalahan serialisasi YAML: { $e }
edit-reply-invalid = Balasan pengeditan tidak valid
doc-publish-ipld-error = Penerbitan IPLD gagal: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kesalahan simpan pemangkasan kotak masuk: { $e }
err-config-load = Kesalahan memuat konfigurasi: { $e }
err-lang-persist = Kesalahan simpan bahasa: { $e }
err-history-parse = Kesalahan penguraian riwayat: { $e }
err-history-load = Kesalahan memuat riwayat: { $e }
err-history-count-invalid = jumlah riwayat harus berupa bilangan bulat positif
err-ipfs-reply-decode = Gagal dekode balasan IPFS: { $e }
err-edit-cbor = Kesalahan edit CBOR: { $e }
err-popup-blocked = Popup diblokir oleh browser
status-publishing = mempublikasikan

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = kesalahan
rpc-error-detail = kesalahan: { $detail }
msg-new-message = ← [{ $from }] pesan baru — { $count } di kotak masuk
msg-chat = { $sender } bilang { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } berkata { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } memasuki ruangan.
room-leave = * { $name } meninggalkan ruangan.
room-drop  = * { $name } menjatuhkan { $thing }.
room-take  = * { $name } mengambil { $thing }.
err-edit-decode-failed = pengeditan: gagal mendekode: { $e }
err-edit-fetch-failed = pengeditan: gagal mengambil: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = tidak ada sesi aktif — profil tidak dapat dihapus
profile-delete-error = penghapusan profil gagal: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil dienkripsi dan dikirim ke IPFS; dokumen DID akan diperbarui saat CID tiba
profile-publish-done = profil diterbitkan — dokumen DID diperbarui dengan ma.agent CID
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = identitas sudah diterbitkan — profil terkini
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = konten biner (tidak ditampilkan)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (tidak ada)
profiles-deleted = profil { $name } dihapus
profiles-not-found = profil tidak ditemukan: { $name }

# -- Help topics index
help-header-topics = -- topik -- ketik .help/<topic> untuk detail
help-topic-msg =   .help/msg                    pesan
help-topic-ma = .help/ma                     間-ruang, penerbitan, dan entri
help-topic-path = .help/path                   tata bahasa jalur titik lokal
help-topic-my =   .help/my                     config pribadi
help-topic-inbox =   .help/inbox                  kotak masuk
help-topic-doc =   .help/doc                    dokumen
help-topic-actor =   .help/actor                  actor jarak jauh
help-topic-z =   .help/z                      konten Scheme publik dan pribadi
help-topic-zscheme =   .help/zscheme               ekspresi Scheme sebaris dan dokumentasi
help-unknown-topic =   .help/{ $topic }: topik tidak dikenal

# -- Help actor section
help-header-actor = -- aktor jarak jauh
help-actor-echo =   @actor                       tampilkan DID yang diselesaikan
help-actor-text = @actor[#entity]!msg|!say|!emote body         kirim pesan langsung/obrolan/emote
help-actor-ping = @actor:ping                  ping keaktifan
help-actor-entities =   @actor/entities              daftar entitas
help-actor-entities-get = @actor/entities/<n>          dapatkan simpul entitas
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     edit entitas
help-actor-entities-del = @actor/entities/<n>:         hapus entitas
help-actor-config-get =   @actor/config/<key>          ambil nilai config
help-actor-config-set =   @actor/config/<key>: val     atur nilai config
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              sunting ACL
help-actor-fragment =   @actor#entity                kirim ke plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC ke plugin
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  simpan balasan 5 di lingkungan sesi

help-topic-url =   .help/url                    membuka zion melalui tautan URL
help-topic-i18n = .help/i18n                   preferensi bahasa untuk identitas Anda
help-header-url = ── parameter URL ────────────────────────────────────────────────────────────────
help-url-intro =   Bagikan tautan yang membuka zion dengan penerima yang sudah diisi:
help-url-msg =   ?msg=<did>                   isi otomatis: @<did>!msg (pesan biasa)
help-url-say =   ?say=<did>                   isi otomatis: @<did>!say (kata kerja say)
help-url-emote =   ?emote=<did>                 isi otomatis: @<did>!emote (kata kerja emote)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             masuk ke dunia runtime setelah login
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Input diisi otomatis tapi belum dikirim — tekan Enter untuk mengirim.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                publikasikan identitas Anda ke jaringan
help-header-publish = ── publikasi identitas ──────────────────────────────────────────────────────
help-publish-intro = Publikasi membuat identitas Anda dapat ditemukan di jaringan. Orang lain dapat mencari DID Anda untuk menghubungi Anda.
help-publish-ma = Untuk mempublikasikan, Anda memerlukan 間 (runtime lokal) terpasang. Ini menghubungkan ego ke IPFS/IPNS atas nama Anda.
help-publish-steps = Langkah: jalankan '.ma: claim [port]' untuk mendeteksi 間 lokal, lalu '.my.identity!publish @ma'.
help-publish-without = Tanpa publikasi, orang lain tidak dapat menghubungi Anda — meskipun mereka mengetahui DID Anda, mereka tidak dapat menyelesaikan endpoint Anda.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = tentukan nama profil: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Mengumpulkan batch — ketik perintah, akhiri dengan .batch
batch-already-collecting = Sudah mengumpulkan batch — akhiri dengan .batch terlebih dahulu
batch-empty = Batch kosong — tidak ada yang dijalankan
batch-running = Menjalankan batch…
batch-step-timeout = langkah batch habis waktunya

batch-done = Batch selesai dalam { $secs }d — { $steps } langkah
batch-done-error = Batch selesai dengan kesalahan dalam { $secs }d — { $steps } langkah
msg-timeout = Pesan habis waktu (tidak ada balasan dalam 60d)
msg-outbox-open-timeout = aktor { $target } tidak dapat dijangkau — koneksi habis waktu setelah { $ms }ms
msg-outbox-send-timeout = pengiriman ke { $target } habis waktu setelah { $ms }ms — koneksi mungkin terputus
err-unknown-command = perintah tidak dikenal: { $path }
err-read-only-path = { $path } hanya-baca
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        evaluasi dokumen coretan secara paralel


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = Gagal mengambil CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID tidak valid: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Peringatan: Kunci privat IPNS Anda akan dikirim ke runtime ini untuk penerbitan identitas. Gunakan hanya runtime yang sepenuhnya Anda percayai.

# -- Help text -- z and my
help-header-z = ── .z dan .my ───────────────────────────────────────────────────────────────────────
help-z-public =   .z.*                       konten publik atau dapat dipublikasikan; jangan simpan rahasia di sini
help-z-scheme =   .z.scheme                  skrip Scheme yang dimuat dan dievaluasi saat startup
help-z-control =   .z.scheme                 Anda sendiri yang mengontrol isi skrip startup
help-z-private =   .my.*                     konfigurasi lokal pribadi; Scheme dapat disimpan di sini juga
help-z-choice =   .z.* / .my.*               gunakan .z.* untuk Scheme publik dan .my.* untuk Scheme pribadi

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme mengevaluasi ekspresi Scheme yang disisipkan dalam perintah zion dan menyisipkan hasilnya ke baris sebelum dikirim.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    contoh sebaris; mengirim "say 7 + 5 = 12"
help-zscheme-define =   (define x 12)             definisi tetap ada selama sesi login saat ini
help-zscheme-doc = Dokumentasi: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Gateway IPFS lokal (perlu pengecualian browser)

tab-config = Pengaturan
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
