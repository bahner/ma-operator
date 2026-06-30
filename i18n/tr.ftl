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
btn-new-endpoint = yeni uç nokta
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
msg-auto-published = DID yerel ma ({ $url }) aracılığıyla yayımlandı
msg-identity-not-published = Kimlik çevrimiçi bulunamadı — ma yerel olarak yüklüyse, '.ma!discover' ardından '.my.identity:publish @ma' çalıştırın. Ayrıntılar için '.help.publish' yazın.
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
err-alias-has-dot = takma adlar '.' içeremez
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
discover-success = ma { $url } adresinde keşfedildi
discover-did-line = DID: { $did }
discover-alias-hint =   @ma takma adı oluşturuldu — kimliğini yayımlamak için '.my.identity:publish @ma' çalıştır.
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
identity-exported = Paket { $filename } olarak indirildi
identity-export-failed = Dışa aktarma başarısız: { $e }

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
help-cmd-history =   .history                     komut geçmişi (ardışık tekrarlar birleştirildi)
help-cmd-logout =   .logout                      çıkış yap
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

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
help-runtime-discover =   .ma!discover          yerel çalışma zamanını keşfet ve @ma oluştur
help-runtime-claim =   .ma!claim             DID'inle çalışma zamanı sahipliği talep et
help-identity =   .my.identity                 kimlik yapılandırmasını göster
help-identity-did =   .my.identity.did             kendi DID'ini göster (salt okunur)
help-identity-publish =   .my.identity:publish @pub    yayım servisi aracılığıyla DID yayımla
help-identity-export =   .my.identity:export          kendi kimlik paketini indir
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
help-inbox-filter =   .my.inbox:filter @who        yalnızca @who girdilerini göster
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

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML ayrıştırma hatası: { $e }
yaml-not-mapping = YAML bir mapping (anahtar: değer çiftleri) olmalıdır; düz metin ve skalalar DAG-CBOR olarak saklanamaz
dagcbor-encode-error = DAG-CBOR kodlama hatası: { $e }
cbor-decode-error = CBOR kod çözme hatası: { $e }
cbor-json-error = CBOR'dan JSON'a hata: { $e }
yaml-serialize-error = YAML serileştirme hatası: { $e }
edit-reply-invalid = Geçersiz düzenleme yanıtı
doc-publish-ipld-error = IPLD yayınlama başarısız oldu: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = Gelen kutusu budama kaydetme hatası: { $e }
err-config-load = Yapılandırma yükleme hatası: { $e }
err-lang-persist = Dil kaydetme hatası: { $e }
err-history-parse = Geçmiş ayrıştırma hatası: { $e }
err-history-load = Geçmiş yükleme hatası: { $e }
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
profile-no-ma = no ma runtime configured — run '.ma!discover' first
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
profiles-empty = (yok)
profiles-deleted = { $name } profili silindi
profiles-not-found = profil bulunamadı: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    zion'u bir URL bağlantısıyla aç
help-unknown-topic =   .help.{ $topic }: unknown topic

# -- Help actor section
help-header-actor = -- remote actors
help-actor-echo =   @actor                       echo resolved DID
help-actor-text =   @actor body                  send text message
help-actor-ping =   @actor:ping                  liveness ping
help-actor-entities =   @actor:entities              list entities
help-actor-entities-get =   @actor:entities.<n>          get entity
help-actor-entities-set =   @actor:entities.<n>: <cid>   set entity
help-actor-entities-edit =   @actor:entities.<n>:edit     edit entity
help-actor-entities-del =   @actor:entities.<n>:         delete entity
help-actor-config-get =   @actor:config.<key>          get config value
help-actor-config-set =   @actor:config.<key>: val     set config value
help-actor-acl =   @actor:acl                   get ACL
help-actor-acl-edit =   @actor:acl:edit              edit ACL
help-actor-fragment =   @actor#entity                send to plugin
help-actor-fragment-verb =   @actor#entity:verb [args]    RPC to plugin
help-header-cid-ops = -- CID content ops
help-actor-cat =   @actor:ent:cat               show file content inline
help-actor-head =   @actor:ent:head N            first N lines
help-actor-tail =   @actor:ent:tail N            last N lines
help-actor-wc =   @actor:ent:wc               line / word / char count
help-actor-wc-l =   @actor:ent:wc -l            line count only
help-header-url = ── URL parametreleri ───────────────────────────────────────────────────────
help-url-intro =   Önceden doldurulmuş alıcıyla zion'u açan bir bağlantı paylaş:
help-url-msg =   ?msg=<did>                   önceden doldurur: @<did> (metin mesajı)
help-url-say =   ?say=<did>                   önceden doldurur: @<did>:say (say fiili)
help-url-emote =   ?emote=<did>                 önceden doldurur: @<did>:emote (emote fiili)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   Alan doldurulur ama gönderilmez — göndermek için Enter'a bas.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                kimliğini ağa yayımla
help-header-publish = ── kimlik yayımlama ─────────────────────────────────────────────────────────
help-publish-intro = Yayımlama, kimliğini ağda bulunabilir hale getirir. Diğerleri sana ulaşmak için DID'ini arayabilir.
help-publish-ma = Yayımlamak için ma (yerel çalışma zamanı) yüklü olmalı. Senin adına ego'yu IPFS/IPNS'e bağlar.
help-publish-steps = Adımlar: yerel ma'yı algılamak için '.ma!discover' çalıştır, ardından '.my.identity:publish @ma'.
help-publish-without = Yayımlamadan başkaları sana ulaşamaz — DID'ini bilseler bile endpoint'ini çözemezler.
profile-fetch-did-resolve-failed = DID not published yet — run '.my.identity:publish @ma' first, then ':publish' your profile
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
scheme-cid-fetch-error = CID { $cid } alınamadı: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = Geçersiz CID: { $value }
