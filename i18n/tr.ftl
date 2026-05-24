# zion — Türkçe
lang-name = Türkçe

# ── Giriş sayfası ─────────────────────────────────────────────────────────
tab-login = giriş
tab-new-identity = yeni kimlik
tab-import = içe aktar
label-passphrase = parola
label-username = kullanıcı adı
label-confirm-passphrase = parolayı onayla
btn-login = giriş yap
btn-export = dışa aktar
btn-generate = oluştur
passphrase-warning = Parola kaybolursa kimlik de kaybolur. Kurtarma mümkün değildir.
import-help = Dışa aktarılmış .zion.json dosyasını seçin. Paket şifreli kalır.
status-unlocking = kilidi açılıyor...
status-generating = kimlik oluşturuluyor...
status-reading-file = dosya okunuyor...
status-imported = '{ $name }' içe aktarıldı — Giriş sekmesine geçin
error-wrong-passphrase = yanlış parola: { $e }
error-identity-not-found = kimlik '{ $name }' bulunamadı
error-username-required = kullanıcı adı gereklidir
error-passphrase-required = parola gereklidir
error-passphrases-no-match = parolalar eşleşmiyor

# ── Terminal sistem mesajları ─────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username } olarak giriş yapıldı
msg-type-help = Komut listesi için .help yazın.
msg-connecting = iroh'a bağlanılıyor...
msg-iroh-ready = iroh uç noktası hazır
msg-iroh-failed = iroh: { $e }
msg-blocked = ⊗ engellendi [{ $cap }]: { $from }
msg-focus-cleared = odak temizlendi
msg-focusing = { $did } üzerine { $prompt } olarak odaklanılıyor
msg-set = { $path }: { $value }
msg-deleted = { $path } silindi ({ $count } girdi)
msg-read-only = { $path } salt okunur
msg-subtree-set = { $path } bir alt ağaçtır; ayar reddedildi
msg-ancestor-leaf = { $path } yolunun bir atası yapraktır; gölgeleme reddedildi
msg-key-not-found = anahtar bulunamadı: { $path }
msg-no-match = eşleşme yok
msg-link-not-connected = bağlantı getirme hatası: bağlı değil
msg-link-fetch-error = bağlantı getirme hatası: { $e }
msg-link-key-not-found = bağlantılı belgede `{ $key }` anahtarı bulunamadı

# ── Takma ad doğrulama ────────────────────────────────────────────────────
err-alias-name-empty = takma ad boş olamaz
err-alias-has-fragment = takma adlar '#' içeremez
err-alias-value-fragment = takma ad değeri salt did:ma:<ipns> olmalıdır (parça yok)
err-alias-value-path = takma ad değeri salt did:ma:<ipns> olmalıdır (yol yok)
err-alias-not-did = takma ad değeri did:ma: ile başlamalıdır
err-unknown-alias = bilinmeyen takma ad: @{ $name }
err-bare-did = salt did:ma:<ipns> (parça veya yol yok) beklendi, alındı: { $did }

# ── Editör ────────────────────────────────────────────────────────────────
btn-save = Kaydet
btn-eval = Çalıştır
btn-cancel = İptal
btn-close = Kapat
btn-reply = Yanıtla
btn-publish = Yayımla
msg-reply-sent = yanıt gönderildi
msg-reply-failed = yanıt gönderilemedi: { $e }
msg-entity-publish-sent = varlık { $name }: yayım gönderildi
msg-entity-publish-failed = varlık yayımı başarısız: { $e }
msg-field-publish-sent = varlık { $name }.{ $field }: yayım gönderildi
msg-field-publish-failed = alan yayımı başarısız: { $e }
msg-acl-publish-sent = çalışma zamanı ACL: yayım gönderildi
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

# ── Fiiller — çalışma zamanı ──────────────────────────────────────────────
discover-fetch-failed = keşif { $url } adresinde başarısız: { $e }
discover-json-error = keşif başarısız: { $url } adresinden geçersiz JSON: { $e }
discover-missing-did = keşif başarısız: status.json'da gerekli `did` alanı eksik
discover-invalid-did = keşif başarısız: `did` did:ma: ile başlamalıydı, alındı `{ $did }`
discover-no-endpoint = keşif uyarısı: status.json'da `endpoint_id` eksik; yalnızca DID depolandı
discover-success = ma { $url } adresinde keşfedildi
discover-did-line = DID: { $did }
discover-alias-hint =   @ma takma adı oluşturuldu — yayımla: .my.identity:publish @ma
claim-success = Çalışma zamanı { $did } için talep edildi
claim-conflict = Çalışma zamanı başka bir kimlik tarafından zaten talep edildi
claim-http-failed = talep başarısız: HTTP { $status }
claim-error = talep başarısız: { $e }
claim-no-session = giriş yapılmadı; çalışma zamanını talep etmek için önce giriş yapın
runtime-no-verb = { $path } için `{ $verb }` fiili yok

# ── Fiiller — ACL ─────────────────────────────────────────────────────────
acl-reset = .my.acl sıfırlandı (tamamen açık)
acl-persist-error = kaydetme hatası: { $e }
acl-no-verb = .my.acl için `{ $verb }` fiili yok

# ── Fiiller — kimlik ──────────────────────────────────────────────────────
publish-usage = kullanım: .my.identity:publish <did-veya-takma-ad>

# ── Fiiller — belgeler ────────────────────────────────────────────────────
doc-content-empty = { $path }.content boş
doc-save-first = { $path }.content boş — önce kaydedin
doc-missing-name = belge adı eksik
doc-publish-usage = kullanım: .my.doc.<name>:publish <publisher>
doc-publish-ipld-usage = kullanım: .my.doc.<name>:publish-ipld <publisher>
doc-publish-failed = yayım { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = depolama isteği gönderildi ({ $id }) → { $publisher }; CID RPC yanıtıyla gelecek
doc-ipld-store-sent = IPLD depolama isteği gönderildi ({ $id }) → { $publisher }; CID RPC yanıtıyla gelecek
doc-fetch-done = { $cid } getirildi → { $path }.content (çalıştırılmadı)
doc-fetch-failed = getirme { $cid }: { $e }
doc-fetch-usage = kullanım: .my.doc.<name>:fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid ayarlanmamış
doc-no-verb = { $path } için `{ $verb }` fiili yok
path-no-verb = { $path } için `{ $verb }` fiili yok

# ── Yardım — başlıklar ────────────────────────────────────────────────────
help-header-zion = ── zion komutları ────────────────────────────────────────────────────────
help-header-messaging = ── mesajlaşma ───────────────────────────────────────────────────────────
help-header-focus = ── odak modu ────────────────────────────────────────────────────────────
help-header-config = ── yerel yapılandırma sözdizimi ───────────────────────────────────────────
help-header-common = ── yaygın yollar ─────────────────────────────────────────────────────────
help-header-inbox = ── gelen kutusu ──────────────────────────────────────────────────────────
help-header-documents = ── belgeler ─────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── Yardım — zion komutları ───────────────────────────────────────────────
help-cmd-help =   .help                        bu metin
help-cmd-clear =   .clear                       terminali temizle
help-cmd-panic =   .panic                       son çare — sorun çıkarsa kullan
help-cmd-logout =   .logout                      çıkış yap

# ── Yardım — mesajlaşma ───────────────────────────────────────────────────
help-msg-echo =   @alias                       çözümlenen DID'yi göster (mesaj gönderilmez)
help-msg-send =   @alias[:verb] body           aktöre mesaj / RPC gönder
help-msg-fragment =   @alias#fragment[:verb] body  açık DID parçasıyla gönder
help-msg-escape =   \@name                       değişmez @name (takma ad araması yok)

# ── Yardım — odak modu ────────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       aktöre odaklan (istemi değiştirir)
help-focus-clear =   .use                         odağı temizle

# ── Yardım — yapılandırma sözdizimi ──────────────────────────────────────
help-config-get =   .path                        yaprak değer al veya alt ağacı listele
help-config-filter =   .path value                  değere göre filtrele
help-config-set =   .path: value                 yaprak değer ayarla
help-config-delete =   .path:                       yaprak veya alt ağacı sil
help-config-verb =   .path:verb [args]            yerel fiil çağır

# ── Yardım — yaygın yollar ────────────────────────────────────────────────
help-my =   .my                          tüm kişisel yapılandırmayı göster
help-aliases =   .my.aliases                  takma adları listele
help-aliases-set =   .my.aliases.<name>: <did>    takma ad ekle/güncelle (salt DID)
help-aliases-del =   .my.aliases.<name>:          takma adı kaldır
help-runtime-discover =   .my.ma:discover          yerel çalışma zamanını keşfet ve @ma oluştur
help-runtime-claim =   .my.ma:claim             DID'inle çalışma zamanı sahipliği talep et
help-identity =   .my.identity                 kimlik yapılandırmasını göster
help-identity-did =   .my.identity.did             kendi DID'ini göster (salt okunur)
help-identity-publish =   .my.identity:publish @pub    yayım servisi aracılığıyla DID yayımla
help-config-path =   .config                      tüm .config.* girdilerini göster

# ── Yardım — gelen kutusu ─────────────────────────────────────────────────
help-inbox =   .my.inbox                    gelen kutusunu listele (alt ağaç görünümü)
help-inbox-n =   .my.inbox.N                  N girdisinin alanlarını göster
help-inbox-from =   .my.inbox.N.from             N girdisinin gönderen DID'i
help-inbox-reply =   .my.inbox.N:reply [body]     yanıt gönder (gövde yoksa editör açılır)
help-inbox-open =   .my.inbox.N:open             içeriği salt okunur editörde aç
help-inbox-del =   .my.inbox.N:                 N girdisini sil
help-inbox-delall =   .my.inbox:                   tüm gelen kutusu girdilerini sil
help-inbox-flush =   .my.inbox:flush              tüm girdileri terminale yazdır
help-inbox-traverse =   .my.inbox.N.sender.<field>   gönderici DID belgesini tembel gez

# ── Yardım — belgeler ─────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>:edit           kaydedilmiş içerikle editör aç
help-doc-edit-cid =   .my.doc.<name>:edit <cid>     CID getir, yalnızca inceleme için aç
help-doc-eval =   .my.doc.<name>:eval           kaydedilmiş içeriği satır satır çalıştır
help-doc-publish =   .my.doc.<name>:publish @pub   ham veri olarak depola (herhangi tür)
help-doc-publish-ipld =   .my.doc.<name>:publish-ipld @pub  YAML'ı DAG-CBOR IPLD düğümü olarak depola
help-doc-fetch =   .my.doc.<name>:fetch <cid>    CID içeriğini içe aktar (çalıştırma)
help-doc-cid =   .my.doc.<name>:cid            depolanan CID'yi göster
help-doc-del =   .my.doc.<name>:              belgeyi sil

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = Kullanılabilir diller (.my.i18n: <code> ile ayarlayın):
err-lang-not-found = dil bulunamadı: { $lang }

msg-send-failed = gönderme başarısız: { $e }
msg-not-logged-in = giriş yapılmamış
