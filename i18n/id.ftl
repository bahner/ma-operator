# zion — Bahasa Indonesia
lang-name = Bahasa Indonesia

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
passphrase-warning = Frasa sandi hilang = identitas hilang. Tidak ada pemulihan.
import-profile-help = Impor profil menggunakan CID atau file. Anda memerlukan frasa sandi yang sama yang digunakan saat menerbitkan.
import-profile-detected-user = Profil milik: { $name }
status-unlocking = membuka kunci...
status-generating = membuat identitas...
status-reading-file = membaca file...
status-fetching-profile = mengambil profil dari IPFS...
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
msg-connecting = menghubungkan ke iroh...
msg-iroh-ready = endpoint iroh siap
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID diterbitkan melalui ma lokal ({ $url })
msg-identity-not-published = Identitas tidak ditemukan secara online — jika ma terpasang secara lokal, jalankan '.ma [port]' lalu '.my.identity!publish @ma'. Ketik '.help.publish' untuk detail.
msg-blocked = ⊗ diblokir [{ $cap }]: { $from }
msg-focus-cleared = fokus dibersihkan
msg-focusing = memfokuskan { $did } sebagai { $prompt }
msg-set = { $path }: { $value }
msg-deleted = menghapus { $path } ({ $count } entri)
msg-read-only = { $path } hanya baca
msg-subtree-set = { $path } adalah subpohon; menolak pengaturan
msg-ancestor-leaf = leluhur { $path } adalah daun; menolak bayangan
msg-key-not-found = kunci tidak ditemukan: { $path }
msg-no-match = tidak ada kecocokan
msg-link-not-connected = kesalahan pengambilan tautan: tidak terhubung
msg-link-fetch-error = kesalahan pengambilan tautan: { $e }
msg-link-key-not-found = kunci `{ $key }` tidak ditemukan dalam dokumen tertaut

# ── Validasi alias ────────────────────────────────────────────────────────
err-alias-name-empty = nama alias tidak boleh kosong
err-alias-has-dot = nama alias tidak boleh mengandung '.'
err-alias-has-fragment = nama alias tidak boleh mengandung '#'
err-alias-value-fragment = nilai alias harus berupa did:ma:<ipns> tanpa fragmen
err-alias-value-path = nilai alias harus berupa did:ma:<ipns> tanpa jalur
err-alias-not-did = nilai alias harus dimulai dengan did:ma:
err-unknown-alias = alias tidak dikenal: @{ $name }
err-bare-did = diharapkan did:ma:<ipns> tanpa fragmen atau jalur, mendapat { $did }

# ── Editor ────────────────────────────────────────────────────────────────
btn-save = Simpan
btn-eval = Jalankan
btn-cancel = Batal
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
discover-success = ma ditemukan di { $url }
discover-did-line = DID: { $did }
discover-alias-hint =   alias @ma dibuat — jalankan '.my.identity!publish @ma' untuk mempublikasikan identitas Anda.
claim-success = Runtime diklaim untuk { $did }
claim-conflict = Runtime sudah diklaim oleh identitas lain
claim-http-failed = klaim gagal: HTTP { $status }
claim-error = klaim gagal: { $e }
claim-no-session = belum masuk; masuk dulu untuk mengklaim runtime
runtime-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }

# ── Kata kerja — ACL ──────────────────────────────────────────────────────
acl-reset = .my.acl direset (sepenuhnya terbuka)
acl-persist-error = kesalahan persistensi: { $e }
acl-no-verb = tidak ada kata kerja `{ $verb }` untuk .my.acl

# ── Kata kerja — identitas ────────────────────────────────────────────────
publish-usage = penggunaan: .my.identity!publish <did-atau-alias>
identity-exported = Paket diunduh sebagai { $filename }
identity-export-failed = Ekspor gagal: { $e }

# ── Kata kerja — dokumen ──────────────────────────────────────────────────
doc-content-empty = { $path }.content kosong
doc-save-first = { $path }.content kosong — simpan dulu
doc-missing-name = nama dokumen tidak ada
doc-publish-usage = penggunaan: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = penggunaan: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = penerbitan { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = permintaan penyimpanan terkirim ({ $id }) → { $publisher }; CID akan tiba melalui balasan RPC
doc-ipld-store-sent = permintaan penyimpanan IPLD terkirim ({ $id }) → { $publisher }; CID akan tiba melalui balasan RPC
doc-fetch-done = mengambil { $cid } → { $path }.content (tidak dijalankan)
doc-fetch-failed = pengambilan { $cid }: { $e }
doc-fetch-usage = penggunaan: .my.doc.<name>!fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid belum diatur
doc-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }
path-no-verb = tidak ada kata kerja `{ $verb }` untuk { $path }

# ── Bantuan — judul ───────────────────────────────────────────────────────
help-header-zion = ── perintah zion ─────────────────────────────────────────────────────────
help-header-messaging = ── pesan ────────────────────────────────────────────────────────────────
help-header-focus = ── mode fokus ───────────────────────────────────────────────────────────
help-header-config = ── sintaks konfigurasi lokal ─────────────────────────────────────────────
help-header-common = ── jalur umum ───────────────────────────────────────────────────────────
help-header-inbox = ── kotak masuk ──────────────────────────────────────────────────────────
help-header-documents = ── dokumen ──────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Bantuan — perintah zion ───────────────────────────────────────────────
help-cmd-help =   .help                        teks ini
help-cmd-clear =   .clear                       bersihkan terminal
help-cmd-panic =   .panic                       pilihan terakhir — gunakan saat bermasalah
help-cmd-history =   .history                     riwayat perintah (duplikat berurutan digabung)
help-cmd-logout =   .logout                      keluar
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── Bantuan — pesan ───────────────────────────────────────────────────────
help-msg-echo =   @alias                       tampilkan DID yang diselesaikan (tidak kirim pesan)
help-msg-send =   @alias[:verb] body           kirim pesan / RPC ke aktor
help-msg-fragment =   @alias#fragment[:verb] body  kirim ke alias dengan fragmen DID eksplisit
help-msg-escape =   \@name                       literal @name (tidak ada pencarian alias)

# ── Bantuan — mode fokus ──────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       fokus pada aktor (mengubah prompt)
help-focus-clear =   .use                         hapus fokus

# ── Bantuan — sintaks konfigurasi ─────────────────────────────────────────
help-config-get =   .path                        ambil nilai daun atau daftar subpohon
help-config-filter =   .path value                  filter berdasarkan nilai
help-config-set =   .path: value                 atur nilai daun
help-config-delete =   .path:                       hapus daun atau subpohon
help-config-verb =   .path!verb [args]            panggil kata kerja lokal

# ── Bantuan — jalur umum ──────────────────────────────────────────────────
help-my =   .my                          tampilkan semua konfigurasi pribadi
help-aliases =   .my.aliases                  daftar alias
help-aliases-set =   .my.aliases.<name>: <did>    tambah/perbarui alias (DID tanpa fragment)
help-aliases-del =   .my.aliases.<name>:          hapus alias
help-runtime-discover =   .ma [port]          temukan runtime lokal dan buat alias @ma
help-runtime-claim =   .ma [port]             klaim kepemilikan runtime dengan DID Anda
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
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     ambil CID, buka untuk ditinjau saja
help-doc-eval =   .my.doc.<name>!eval           jalankan konten tersimpan baris per baris
help-doc-publish =   .my.doc.<name>!publish @pub   simpan sebagai blob mentah (tipe apa saja)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  simpan YAML sebagai simpul IPLD DAG-CBOR
help-doc-fetch =   .my.doc.<name>!fetch <cid>    impor konten CID (tidak dijalankan)
help-doc-cid =   .my.doc.<name>!cid            tampilkan CID tersimpan
help-doc-del =   .my.doc.<name>:              hapus dokumen

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
yaml-serialize-error = Kesalahan serialisasi YAML: { $e }
edit-reply-invalid = Balasan pengeditan tidak valid
doc-publish-ipld-error = Penerbitan IPLD gagal: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Kesalahan simpan pemangkasan kotak masuk: { $e }
err-config-load = Kesalahan memuat konfigurasi: { $e }
err-lang-persist = Kesalahan simpan bahasa: { $e }
err-history-parse = Kesalahan penguraian riwayat: { $e }
err-history-load = Kesalahan memuat riwayat: { $e }
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
profile-no-ma = no ma runtime configured — run '.ma [port]' first
profile-no-cid = no CID stored for this profile — run ':publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run ':publish' first
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
profiles-empty = (tidak ada)
profiles-deleted = profil { $name } dihapus
profiles-not-found = profil tidak ditemukan: { $name }

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
help-actor-entities =   @actor.entities              list entities
help-actor-entities-get =   @actor.entities.<n>          get entity
help-actor-entities-set =   @actor.entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor.entities.<n>!edit     edit entity
help-actor-entities-del =   @actor.entities.<n>:         delete entity
help-actor-config-get =   @actor.config.<key>          get config value
help-actor-config-set =   @actor.config.<key>: val     set config value
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

help-topic-url =   .help.url                    membuka zion melalui tautan URL
help-header-url = ── parameter URL ────────────────────────────────────────────────────────────────
help-url-intro =   Bagikan tautan yang membuka zion dengan penerima yang sudah diisi:
help-url-msg =   ?msg=<did>                   isi otomatis: @<did> (pesan biasa)
help-url-say =   ?say=<did>                   isi otomatis: @<did>:say (kata kerja say)
help-url-emote =   ?emote=<did>                 isi otomatis: @<did>:emote (kata kerja emote)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Input diisi otomatis tapi belum dikirim — tekan Enter untuk mengirim.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                publikasikan identitas Anda ke jaringan
help-header-publish = ── publikasi identitas ──────────────────────────────────────────────────────
help-publish-intro = Publikasi membuat identitas Anda dapat ditemukan di jaringan. Orang lain dapat mencari DID Anda untuk menghubungi Anda.
help-publish-ma = Untuk mempublikasikan, Anda memerlukan ma (runtime lokal) terpasang. Ini menghubungkan ego ke IPFS/IPNS atas nama Anda.
help-publish-steps = Langkah: jalankan '.ma [port]' untuk mendeteksi ma lokal, lalu '.my.identity!publish @ma'.
help-publish-without = Tanpa publikasi, orang lain tidak dapat menghubungi Anda — meskipun mereka mengetahui DID Anda, mereka tidak dapat menyelesaikan endpoint Anda.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then ':publish' your profile
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
scheme-cid-fetch-error = Gagal mengambil CID { $cid }: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = CID tidak valid: { $value }
