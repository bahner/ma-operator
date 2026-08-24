# zion — Türkçe
lang-name = Türkçe
label-nick = takma ad
new-identity-nick-help = 間-space için bir takma ad seçin. Bu sadece bir takma addır ve istediğiniz zaman değiştirebilirsiniz.
error-nick-required = takma ad gerekli
error-nick-invalid = takma ad boşluk veya @ içermemelidir

# ── Giriş sayfası ─────────────────────────────────────────────────────────
tab-login = giriş
tab-new-identity = yeni kimlik
tab-import-profile = profil içe aktar
label-passphrase = parola
label-username = kullanıcı adı
label-confirm-passphrase = parolayı onayla
label-did = DID
label-profile-cid = profil CID
label-or-file = veya dosya
btn-login = giriş yap
btn-export = dışa aktar
btn-generate = oluştur
btn-new-endpoint = yeni uç nokta
btn-import-profile = profil içe aktar
btn-show-qr = QR göster
btn-scan-qr = QR tara
qr-scan-hint = Kamerayı bir zion profil QR koduna doğrultun.
qr-error-camera = kamera kullanılamıyor: { $e }
qr-error-too-large = profil bir QR kod için çok büyük
passphrase-warning = Parola kaybolursa kimlik de kaybolur. Kurtarma mümkün değildir.
import-profile-help = CID veya dosya aracılığıyla profil içe aktarın. Yayımlarken kullanılan aynı parola ifadesi gereklidir.
import-profile-detected-user = Profil şuna ait: { $name }
status-unlocking = kilidi açılıyor...
status-generating = kimlik oluşturuluyor...
status-reading-file = dosya okunuyor...
status-fetching-profile = IPFS'ten profil alınıyor...
status-imported = '{ $name }' içe aktarıldı — Giriş sekmesine geçin
status-importing-profile = profil içe aktarılıyor...
profile-import-done = '{ $name }' için profil içe aktarıldı — { $n } anahtar yüklendi
error-wrong-passphrase = yanlış parola: { $e }
error-identity-not-found = kimlik '{ $name }' bulunamadı
error-username-required = kullanıcı adı gereklidir
error-passphrase-required = parola gereklidir
error-passphrases-no-match = parolalar eşleşmiyor
error-profile-source-required = CID sağlayın veya dosya yükleyin
error-did-required = DID'inizi girin
error-profile-fetch = profil alınamadı: { $e }
error-profile-no-username = profil kullanıcı adı içermiyor
error-profile-no-identity = kimlik '{ $name }' bulunamadı — önce kimliği içe aktarın

# ── Terminal sistem mesajları ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } olarak giriş yapıldı
msg-type-help = Komut listesi için .help yazın.
msg-getting-started = Deneyin: say Hello world, look, .help veya help.
msg-connecting = iroh'a bağlanılıyor...
msg-iroh-ready = iroh uç noktası hazır
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID yerel 間 ({ $url }) aracılığıyla yayımlandı
msg-identity-publication-propagating = Kimlik yayını hâlâ yayılıyor; entry gecikti: { $e }
msg-trusted-ma-searching = Searching for trusted MA ({ $did })
msg-trusted-ma-not-discovered = Trusted MA was not discovered. The lookup may have failed temporarily. Please try `.ma` again.
msg-identity-first-publish = Kimlik yayımlanıyor. Bu { $seconds } saniyeye kadar sürebilir.
msg-ma-connecting-matrix = seni 間trix'e bağlamaya çalışıyor
msg-ma-checking-url = 間: { $url }
msg-local-ma-unreachable = 間: { $url } × { $seconds }s
msg-runtime-pinging = ping: { $did }
msg-runtime-ping-timeout = ping: { $did } × { $seconds }s
msg-startup-enter-skipped = ↛ { $target }
msg-local-ma-claimed = yerel 間 talep edildi
msg-local-ma-already-claimed = yerel 間 zaten talep edilmiş
msg-local-ma-claim-failed = yerel 間 talep edilemedi
msg-identity-not-published = Kimlik çevrimiçi bulunamadı — 間 yerel olarak yüklüyse, '.ma: claim [port]' ardından '.my.identity!publish @ma' çalıştırın. Ayrıntılar için '.help/publish' yazın.
msg-blocked = ⊗ engellendi [{ $cap }]: { $from }
msg-focus-cleared = odak temizlendi
msg-left = left
msg-focusing = { $did } üzerine { $prompt } olarak odaklanılıyor
msg-set = { $path }: { $value }
msg-deleted = { $path } silindi ({ $count } girdi)
msg-read-only = { $path } salt okunur
msg-subtree-set = { $path } bir alt ağaçtır; ayar reddedildi
msg-ancestor-leaf = { $path } yolunun bir atası yapraktır; gölgeleme reddedildi
msg-key-not-found = anahtar bulunamadı: { $path }
msg-link-not-connected = bağlantı getirme hatası: bağlı değil
msg-link-fetch-error = bağlantı getirme hatası: { $e }
msg-link-key-not-found = bağlantılı belgede `{ $key }` anahtarı bulunamadı

# ── Takma ad doğrulama ────────────────────────────────────────────────────
err-alias-name-empty = takma ad boş olamaz
err-alias-has-dot = takma adlar '.' içeremez
err-alias-has-fragment = takma adlar '#' içeremez
err-alias-value-fragment = takma ad değeri en fazla bir boş olmayan DID-URL parçası içerebilir
err-alias-value-path = takma ad değeri did:ma:<ipns> DID veya DID-URL olmalıdır (yol yok)
err-alias-not-did = takma ad değeri did:ma: ile başlamalıdır
err-unknown-alias = bilinmeyen takma ad: @{ $name }
err-bare-did = salt did:ma:<ipns> (parça veya yol yok) beklendi, alındı: { $did }

# ── Editör ────────────────────────────────────────────────────────────────
btn-save = Kaydet
btn-eval = Çalıştır
btn-cancel = İptal
msg-jobs-cancelled = işler iptal edildi
btn-close = Kapat
btn-reply = Yanıtla
btn-publish = Yayımla
btn-publish-ipld = Yayımla IPLD
msg-reply-sent = yanıt gönderildi
msg-reply-failed = yanıt gönderilemedi: { $e }
msg-entity-publish-sent = varlık { $name }: yayım gönderildi
msg-entity-publish-failed = varlık yayımı başarısız: { $e }
msg-kind-publish-failed = tür yayınlama başarısız: { $e }
msg-field-publish-sent = varlık { $name }.{ $field }: yayım gönderildi
msg-field-publish-failed = alan yayımı başarısız: { $e }
msg-acl-publish-sent = çalışma zamanı ACL: yayım gönderildi
msg-crud-edit-publish-sent = { $path }: yayım gönderildi
msg-acl-publish-failed = çalışma zamanı ACL yayımı başarısız: { $e }
msg-yaml-error = YAML hatası: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } getirildi — çalıştırmadan önce inceleyin
msg-fetch-failed = getirme { $cid }: { $e }

# ── Fiiller — gelen kutusu ────────────────────────────────────────────────
inbox-empty = gelen kutusu boş
inbox-entry-not-found = gelen kutusu girdisi { $n } bulunamadı
inbox-no-message-id = gelen kutusu girdisi { $n } message_id içermiyor
inbox-no-verb = gelen kutusu girdisi { $n } için `{ $verb }` fiili yok
inbox-filter-no-arg = filtre bir DID veya takma ad bağımsız değişkeni gerektirir
inbox-filter-empty = { $did } adresinden mesaj yok

# ── Fiiller — çalışma zamanı ──────────────────────────────────────────────
discover-fetch-failed = keşif { $url } adresinde başarısız: { $e }
discover-json-error = keşif başarısız: { $url } adresinden geçersiz JSON: { $e }
discover-missing-did = keşif başarısız: status.json'da gerekli `did` alanı eksik
discover-invalid-did = keşif başarısız: `did` did:ma: ile başlamalıydı, alındı `{ $did }`
discover-no-endpoint = keşif uyarısı: status.json'da `endpoint_id` eksik; yalnızca DID depolandı
discover-hint-endpoint-not-found = İpucu: endpoint not found. Check that 間 exposes /status.json on port 5003.
discover-hint-server-error = İpucu: runtime returned a server error. Check 間 logs and retry.
discover-hint-network = İpucu: network/connectivity issue. Start 間, verify localhost:5003 is reachable, and allow local HTTP access in the browser.
discover-hint-generic = İpucu: verify 間 and IPFS Desktop are running, then retry `.ma`.
discover-success = 間 { $url } adresinde keşfedildi
discover-did-line = DID: { $did }
discover-alias-hint =   @ma takma adı oluşturuldu — kimliğini yayımlamak için '.my.identity!publish @ma' çalıştır.
claim-success = Çalışma zamanı { $did } için talep edildi
claim-conflict = Çalışma zamanı başka bir kimlik tarafından zaten talep edildi
claim-already-owned = Runtime zaten bu kimlik tarafından talep edilmiş
claim-http-failed = talep başarısız: HTTP { $status }
claim-error = talep başarısız: { $e }
claim-no-session = giriş yapılmadı; çalışma zamanını talep etmek için önce giriş yapın
runtime-no-verb = { $path } için `{ $verb }` fiili yok

# ── Fiiller — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl sıfırlandı (tamamen açık)
err-persist = kaydetme hatası: { $e }
acl-no-verb = .my.acl için `{ $verb }` fiili yok

# ── Fiiller — kimlik ──────────────────────────────────────────────────────
publish-usage = kullanım: .my.identity!publish <did-veya-takma-ad>
identity-exported = Paket { $filename } olarak indirildi
identity-export-failed = Dışa aktarma başarısız: { $e }

# ── Fiiller — belgeler ────────────────────────────────────────────────────
doc-content-empty = { $path } boş
doc-save-first = { $path } boş — önce kaydedin
doc-missing-name = belge adı eksik
doc-publish-usage = kullanım: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = kullanım: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = yayım { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-publish-error-detail = yayınlama başarısız [{ $code }]: { $err }
doc-publish-error-hint = İpucu: { $hint }
doc-publish-hint-session = Ego'nun kimlik anahtarlarınıza erişebilmesi için tekrar giriş yapın
doc-publish-hint-target = use a valid publisher DID or alias that resolves to bare did:ma:<ipns>
doc-publish-hint-network = verify 間 runtime and IPFS are reachable, then retry
doc-publish-hint-resolve = yayıncı DID belgesinin yayınlandığını ve ulaşılabilir bir uç nokta içerdiğini doğrulayın
doc-publish-hint-acl = ask the publisher operator to allow your DID in ACL
doc-publish-hint-runtime = çalışma zamanı/eklenti isteği reddetti; nedenini inceleyin ve varlığı/çalışma zamanını düzelttikten sonra yeniden deneyin
doc-publish-hint-ipfs = check local Kubo/IPFS health and publisher runtime status
doc-publish-hint-unknown = ayrıntılı neden için çalışma zamanı günlüklerini inceleyin ve yeniden deneyin
doc-store-sent = depolama isteği gönderildi ({ $id }) → { $publisher }; CID RPC yanıtıyla gelecek
doc-ipld-store-sent = IPLD depolama isteği gönderildi ({ $id }) → { $publisher }; CID RPC yanıtıyla gelecek
doc-fetch-done = { $cid } getirildi → { $path } (çalıştırılmadı)
doc-fetch-failed = getirme { $cid }: { $e }
doc-fetch-usage = kullanım: .my.doc.<name>!fetch /ipfs/<cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ayarlanmamış
doc-no-verb = { $path } için `{ $verb }` fiili yok
path-no-verb = { $path } için `{ $verb }` fiili yok

# ── Yardım — başlıklar ────────────────────────────────────────────────────
help-header-zion = ── zion komutları ────────────────────────────────────────────────────────
help-header-messaging = ── mesajlaşma ───────────────────────────────────────────────────────────
help-header-config = ── yerel yapılandırma sözdizimi ───────────────────────────────────────────
help-header-common = ── yaygın yollar ─────────────────────────────────────────────────────────
help-header-inbox = ── gelen kutusu ──────────────────────────────────────────────────────────
help-header-documents = ── belgeler ─────────────────────────────────────────────────────────────
help-header-i18n = ── dil ────────────────────────────── ───────────────────────────────
help-header-ma = ── 間-space ──────────────────────────────────────────────────────────────
help-header-ma-entry = ── 間-boşluğa girme ────────────────────────── ───────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Yardım — zion komutları ───────────────────────────────────────────────
help-cmd-help =   .help                        bu metin
help-cmd-clear =   .clear                       terminali temizle
help-cmd-panic =   .panic                       son çare — sorun çıkarsa kullan
help-cmd-history =   .history [n]                 komut geçmişi (ardışık tekrarlar birleştirildi); isteğe bağlı n yalnızca son n satırı gösterir
help-cmd-logout =   .logout                      çıkış yap
help-cmd-batch =   .batch                       taslak belgeyi paralel değerlendir
help-cmd-batch-sync =   .batch!sync [timeout=60s] / .batch         taslak belgeyi satır satır değerlendir

# ── Yardım — mesajlaşma ───────────────────────────────────────────────────
help-msg-echo =   @alias                       çözümlenen DID/DID-URL göster (mesaj gönderilmez)
help-msg-send =   @alias!msg body / @alias:verb args           aktöre mesaj / RPC gönder
help-msg-fragment =   @alias#fragment:verb body  açık DID parçasıyla gönder
help-msg-escape =   \@name                       değişmez @name (takma ad araması yok)

# ── Yardım — odak modu ────────────────────────────────────────────────────

# ── Yardım — yapılandırma sözdizimi ──────────────────────────────────────
help-config-get =   .path                        yaprak değer al veya alt ağacı listele
help-config-filter =   .path [ad]                   adı içeren alt anahtar adlarını listele
help-config-full =   .path. [ad]                  adı içeren tam alt ağaç değerlerini listele
help-config-set =   .path: value                 yaprak değer ayarla
help-config-delete =   .path:                       yaprak veya alt ağacı sil
help-config-verb =   .path!verb [args]            yerel fiil çağır

# ── Yardım — yaygın yollar ────────────────────────────────────────────────
help-my =   .my                          tüm kişisel yapılandırmayı göster
help-aliases =   .my.aliases                  takma adları listele
help-aliases-set =   .my.aliases.<name>: <did-url>    takma ad ekle/güncelle (DID veya DID-URL)
help-aliases-del =   .my.aliases.<name>:          takma adı kaldır
help-runtime-discover =   .ma: claim [port]          yerel çalışma zamanını keşfet ve @ma oluştur
help-runtime-claim =   .ma: claim [port]             DID'inle çalışma zamanı sahipliği talep et
help-identity =   .my.identity                 kimlik yapılandırmasını göster
help-identity-did =   .my.identity.did             kendi DID'ini göster (salt okunur)
help-identity-publish =   .my.identity!publish @pub    yayım servisi aracılığıyla DID yayımla
help-identity-export =   .my.identity!export          kendi kimlik paketini indir
help-config-path =   .config                      tüm .config.* girdilerini göster

# ── Yardım — gelen kutusu ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    gelen kutusunu listele (alt ağaç görünümü)
help-inbox-n =   .my.inbox.N                  N girdisinin alanlarını göster
help-inbox-from =   .my.inbox.N.from             N girdisinin gönderen DID'i
help-inbox-reply =   .my.inbox.N!reply [body]     yanıt gönder (gövde yoksa editör açılır)
help-inbox-open =   .my.inbox.N!open             içeriği salt okunur editörde aç
help-inbox-del =   .my.inbox.N:                 N girdisini sil
help-inbox-delall =   .my.inbox:                   tüm gelen kutusu girdilerini sil
help-inbox-flush =   .my.inbox!flush              tüm girdileri terminale yazdır
help-inbox-filter =   .my.inbox!filter @who        yalnızca @who girdilerini göster
help-inbox-traverse =   .my.inbox.N.sender.<field>   gönderici DID belgesini tembel gez

# ── Yardım — belgeler ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           kaydedilmiş içerikle editör aç
help-doc-edit-cid =   .my.doc.<name>!edit /ipfs/<cid>     CID getir, yalnızca inceleme için aç
help-doc-eval =   .my.doc.<name>!eval           kaydedilmiş içeriği satır satır çalıştır
help-doc-publish =   .my.doc.<name>!publish @pub   ham veri olarak depola (herhangi tür)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML'ı DAG-CBOR IPLD düğümü olarak depola
help-doc-fetch =   .my.doc.<name>!fetch /ipfs/<cid>    CID içeriğini içe aktar (çalıştırma)
help-doc-cid =   .my.doc.<name>!cid            depolanan CID'yi göster
help-doc-del =   .my.doc.<name>:              belgeyi sil

# ── Help text — language ──────────────────────────────────────────────────
help-i18n-intro = .my.i18n, kimliğinize bağlı dil tercihini saklar.
help-i18n-set = .my.i18n: <code>             choose the language zion uses for this identity
help-i18n-list = .my.i18n!list               mevcut dil kodlarını listele

# ── Help text — ma-space ──────────────────────────────────────────────────
help-ma-intro = 間 odası, 間 kimlikleri arasındaki alandır. ma bu kimliklerin birbirini bulmasını ve iletişim kurmasını sağlar; kimliğin yayımlandığında katılabilirsin.
help-ma-command =   .ma: claim [port] / .ma: did:ma:… / .ma                   yerel 間 runtime’a bağlan, /status.json oku ve .ma.ctx.* kaydet
help-ma-publish =   .my.identity!publish @ma     başkaları anahtarlarını ve endpoint’ini çözebilsin diye DID belgeni yayımla
help-ma-security = En açık güven sınırı, kendi IPFS Desktop/Kubo’nla birlikte kendi 間 runtime’ındır. Uzak bir publisher yararlı olabilir, ama o zaman başkasının hizmetine güvenirsin.
help-ma-links = IPFS Desktop: https://docs.ipfs.tech/install/ipfs-desktop/  間 runtime: https://github.com/bahner/ma-runtime
help-ma-entry-topic =   .help/ma/entry             間 odasına nasıl girilir

# ── Help text — ma-space entry ────────────────────────────────────────────
help-ma-entry-intro = Kimliğin bilindiğinde .enter @ma seni 間 içine sokar. Bir dünya bul, içine gir ve oradan katıl.
help-ma-entry-steps = IPFS Desktop ve ma’yı başlat, sonra .ma çalıştır. .my.identity!publish @ma ile yayımla, bir dünya bul ve .enter @ma ile gir.
help-ma-entry-command =   .enter @ma                  @ma runtime üzerinden 間 içine gir
help-ma-entry-toggle =   .enter                       oda odağını aç veya kapat; kimliğin aktif kalır
help-ma-entry-url =   ?enter=<runtime>             paylaşılan URL’den giriş yaptıktan sonra gir

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Kullanılabilir diller (.my.i18n: <code> ile ayarlayın):
err-lang-not-found = dil bulunamadı: { $lang }

msg-send-failed = gönderme başarısız: { $e }
msg-not-logged-in = giriş yapılmamış

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML ayrıştırma hatası: { $e }
yaml-not-mapping = YAML bir mapping (anahtar: değer çiftleri) olmalıdır; düz metin ve skalalar DAG-CBOR olarak saklanamaz
dagcbor-encode-error = DAG-CBOR kodlama hatası: { $e }
cbor-decode-error = CBOR kod çözme hatası: { $e }
cbor-json-error = CBOR'dan JSON'a hata: { $e }
yaml-serialise-error = YAML serileştirme hatası: { $e }
edit-reply-invalid = Geçersiz düzenleme yanıtı
doc-publish-ipld-error = IPLD yayınlama başarısız oldu: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Gelen kutusu budama kaydetme hatası: { $e }
err-config-load = Yapılandırma yükleme hatası: { $e }
err-lang-persist = Dil kaydetme hatası: { $e }
err-history-parse = Geçmiş ayrıştırma hatası: { $e }
err-history-load = Geçmiş yükleme hatası: { $e }
err-history-count-invalid = geçmiş sayısı pozitif bir tam sayı olmalıdır
err-ipfs-reply-decode = IPFS yanıt kodu çözme hatası: { $e }
err-edit-cbor = CBOR düzenleme hatası: { $e }
err-popup-blocked = Tarayıcı açılır pencereyi engelledi
status-publishing = yayınlanıyor

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = hata
rpc-error-detail = hata: { $detail }
msg-new-message = ← [{ $from }] yeni mesaj — { $count } gelen kutusunda
msg-chat = { $sender } diyor { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } diyor { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } odaya giriyor.
room-leave = * { $name } odadan çıkıyor.
room-drop  = * { $name } { $thing } düşürüyor.
room-take  = * { $name } { $thing } alıyor.
err-edit-decode-failed = düzenleme: kod çözme hatası: { $e }
err-edit-fetch-failed = düzenleme: getirme hatası: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = etkin oturum yok — profil silinemiyor
profile-delete-error = profil silme başarısız: { $e }
profile-wrong-user = cannot set CID for another profile — only your own
profile-wrong-user-name = cannot set CID for '{ $name }' — only your own profile
profile-no-ma = no 間 runtime configured — run '.ma: claim [port]' first
profile-no-cid = no CID stored for this profile — run '!publish' first
profile-no-cid-in-doc = no profile CID found in DID document — run '!publish' first
profile-publish-sent = profil şifrelendi ve IPFS'ye gönderildi; CID geldiğinde DID belgesi güncellenecek
profile-publish-done = profil yayımlandı — DID belgesi ma.agent CID ile güncellendi
profile-publish-failed = profile publish failed: { $e }
profile-fetch-done = profile fetched — { $n } keys loaded from IPFS
profile-fetch-failed = profile fetch failed: { $e }
msg-identity-exists = kimlik zaten yayınlandı — profil güncel
profile-import-exists = profile '{ $name }' already exists — delete it first
profile-import-wrong-user = file contains profile '{ $found }', expected '{ $expected }'

# -- CID content operations
cid-op-binary = ikili içerik (görüntülenmiyor)
cid-op-cat-truncated = ... (output truncated at { $n } lines)
cid-op-fetch-failed = failed to fetch content: { $e }
cid-op-unknown = unknown content operation: { $op }
cid-op-wc = { $lines } lines  { $words } words  { $chars } chars
profiles-empty = (yok)
profiles-deleted = { $name } profili silindi
profiles-not-found = profil bulunamadı: { $name }

# -- Help topics index
help-header-topics = -- konular -- ayrıntılar için .help/<topic> yazın
help-topic-msg =   .help/msg                    mesajlaşma
help-topic-ma = .help/ma                     間-boşluk, yayınlama ve giriş
help-topic-path = .help/path                   yerel nokta yolu dilbilgisi
help-topic-my =   .help/my                     kişisel config
help-topic-inbox =   .help/inbox                  gelen kutusu
help-topic-doc =   .help/doc                    belgeler
help-topic-actor =   .help/actor                  uzak actor
help-topic-zscheme =   .help/zscheme               satır içi Scheme ifadeleri ve belgeler
help-topic-url =   .help/url                    zion'u bir URL bağlantısıyla aç
help-topic-i18n = .help/i18n                   kimliğiniz için dil tercihi
help-unknown-topic =   .help/{ $topic }: bilinmeyen konu

# -- Help actor section
help-header-actor = -- uzak aktörler
help-actor-echo =   @actor                       çözümlenen DID göster
help-actor-text = @actor[#entity]!msg|!say|!emote body         doğrudan/sohbet/ifade mesajı gönder
help-actor-ping = @actor:ping                  canlılık pingi
help-actor-entities =   @actor/entities              entity listesini göster
help-actor-entities-get = @actor/entities/<n>          varlık düğümünü al
help-actor-entities-set = @actor/entities/<n>: /ipfs/<cid>   set entity by IPFS reference
help-actor-entities-edit =   @actor/entities/<n>!edit     entity düzenle
help-actor-entities-del = @actor/entities/<n>:         varlığı sil
help-actor-config-get =   @actor/config/<key>          config değerini al
help-actor-config-set =   @actor/config/<key>: val     config değerini ayarla
help-actor-acl = @actor/acl                   get ACL
help-actor-acl-edit =   @actor/acl!edit              ACL düzenle
help-actor-fragment =   @actor#entity                plugine gönder
help-actor-fragment-verb =   @actor#entity:verb [args]    plugine RPC
help-header-cid-ops = ── Scheme actor calls ───────────────────────────────────────────────────
help-actor-cat = (@actor#entity:verb arg...)  call an entity RPC from Scheme and await its reply
help-actor-head = (@actor/path)                fetch remote CRUD content from Scheme
help-actor-tail = (<bafy...>)                  include and evaluate Scheme from an IPFS CID
help-actor-wc = (define x (@actor:verb arg))  5 yanıtlarını oturum ortamında tut
help-actor-wc-l = .z.scheme.ma!edit           edit saved Scheme helpers for this identity
help-header-url = ── URL parametreleri ───────────────────────────────────────────────────────
help-url-intro =   Önceden doldurulmuş alıcıyla zion'u açan bir bağlantı paylaş:
help-url-msg =   ?msg=<did>                   önceden doldurur: @<did>!msg (metin mesajı)
help-url-say =   ?say=<did>                   önceden doldurur: @<did>!say (say fiili)
help-url-emote =   ?emote=<did>                 önceden doldurur: @<did>!emote (emote fiili)
help-url-ma = ?ma=<did-or-url>              pre-fill runtime DID / HTTP URL
help-url-enter = ?enter=<runtime>             Giriş yaptıktan sonra çalışma zamanı dünyasına girin
help-url-example =   https://ma.bahner.com/?enter=did:ma:k51…
help-url-note =   Alan doldurulur ama gönderilmez — göndermek için Enter'a bas.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help/publish                kimliğini ağa yayımla
help-header-publish = ── kimlik yayımlama ─────────────────────────────────────────────────────────
help-publish-intro = Yayımlama, kimliğini ağda bulunabilir hale getirir. Diğerleri sana ulaşmak için DID'ini arayabilir.
help-publish-ma = Yayımlamak için 間 (yerel çalışma zamanı) yüklü olmalı. Senin adına ego'yu IPFS/IPNS'e bağlar.
help-publish-steps = Adımlar: yerel ma'yı algılamak için '.ma: claim [port]' çalıştır, ardından '.my.identity!publish @ma'.
help-publish-without = Yayımlamadan başkaları sana ulaşamaz — DID'ini bilseler bile endpoint'ini çözemezler.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity!publish @ma' first, then '!publish' your profile
profile-update-done = profile updated — { $n } keys merged from CID
profile-delete-needs-name = bir profil adı belirtin: .profiles.<name>:

# ── Batch mode ────────────────────────────────────────────────────────────
batch-collecting-started = Toplu toplama — komutları yazın, .batch ile bitirin
batch-already-collecting = Zaten bir parti topluyorsunuz — önce .batch ile bitirin
batch-empty = Toplu iş boştu; çalıştırılacak bir şey yok
batch-running = Batch çalışıyor…
batch-step-timeout = toplu adım zaman aşımına uğradı

batch-done = Batch { $secs }s içinde bitti — { $steps } adım
batch-done-error = Batch hatalarla { $secs }s içinde bitti — { $steps } adım
msg-timeout = Mesaj zaman aşımına uğradı (60s içinde yanıt yok)
err-unknown-command = bilinmeyen komut: { $path }
err-read-only-path = { $path } salt okunur
help-cmd-batch-async =   .batch!async [timeout=60s] / .batch        taslak belgeyi paralel değerlendir


# ── Gossip broadcast ──────────────────────────────────────────────────────

# ── Scheme ────────────────────────────────────────────────────────────────
scheme-cid-fetch-error = CID { $cid } alınamadı: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Geçersiz CID: { $value }
label-runtime = 間
label-runtime-placeholder = did:ma:...
warning-remote-runtime = Uyarı: IPNS özel anahtarınız kimlik yayımlama için bu çalışma ortamına gönderilecektir. Yalnızca tamamen güvendiğiniz bir çalışma ortamı kullanın.

# -- Help text -- zscheme
help-header-zscheme-topic = ── zscheme ──────────────────────────────────────────────────────────────
help-zscheme-intro = zscheme, zion komutlarına gömülü Scheme ifadelerini değerlendirir ve gönderilmeden önce sonucu satıra ekler.
help-zscheme-inline =   > say 7 + 5 = (+ 7 5)    satır içi örnek; "say 7 + 5 = 12" gönderir
help-zscheme-define =   (define x 12)             tanımlar mevcut oturum açma süresince kalır
help-zscheme-doc = Belgeler: https://github.com/bahner/rust-ma-zscheme

label-local-ipfs = Yerel IPFS ağ geçidi (tarayıcı istisnası gerektirir)

tab-config = Ayarlar
label-gateway = gateway
help-aliases-qr =   .my.aliases.<name>!qr         open camera QR input and set alias/value

passphrase-placeholder = This password is your only defense against the Dark Arts!
error-passphrase-too-short = passphrase must be at least 20 characters
