# zion — 한국어
lang-name = 한국어

# ── 로그인 페이지 ──────────────────────────────────────────────────────────
tab-login = 로그인
tab-new-identity = 새 신원
tab-import-profile = 프로필 가져오기
label-passphrase = 암호문
label-username = 사용자 이름
label-confirm-passphrase = 암호문 확인
label-did = DID
label-profile-cid = 프로필 CID
label-or-file = 또는 파일
btn-login = 로그인
btn-export = 내보내기
btn-generate = 생성
btn-new-endpoint = 새 엔드포인트
btn-import-profile = 프로필 가져오기
passphrase-warning = 암호문을 잃으면 신원을 잃습니다. 복구할 수 없습니다.
import-profile-help = CID 또는 파일로 프로필을 가져옵니다. 게시 시 사용한 것과 동일한 암호 문구가 필요합니다.
import-profile-detected-user = 프로필 소유자: { $name }
status-unlocking = 잠금 해제 중...
status-generating = 신원 생성 중...
status-reading-file = 파일 읽는 중...
status-fetching-profile = IPFS에서 프로필 가져오는 중...
status-imported = '{ $name }' 가져오기 완료 — 로그인 탭으로 이동하세요
status-importing-profile = 프로필 가져오는 중...
profile-import-done = '{ $name }' 의 프로필을 가져왔습니다 — 키 { $n }개 로드됨
error-wrong-passphrase = 잘못된 암호문: { $e }
error-identity-not-found = 신원 '{ $name }'을(를) 찾을 수 없습니다
error-username-required = 사용자 이름이 필요합니다
error-passphrase-required = 암호문이 필요합니다
error-passphrases-no-match = 암호문이 일치하지 않습니다
error-profile-source-required = CID를 입력하거나 파일을 업로드하세요
error-did-required = DID를 입력하세요
error-profile-fetch = 프로필을 가져올 수 없습니다: { $e }
error-profile-no-username = 프로필에 사용자 이름이 없습니다
error-profile-no-identity = 신원 '{ $name }' 을 찾을 수 없습니다 — 먼저 신원을 가져오세요

# ── 터미널 시스템 메시지 ──────────────────────────────────────────────────
msg-logged-in = zion v{ $version } — { $username }(으)로 로그인됨
msg-type-help = 명령어 목록을 보려면 .help를 입력하세요.
msg-connecting = iroh에 연결 중...
msg-iroh-ready = iroh 엔드포인트 준비됨
msg-iroh-failed = iroh: { $e }
msg-auto-published = DID가 로컬 ma ({ $url })를 통해 게시되었습니다
msg-identity-not-published = 온라인에서 신원을 찾을 수 없음 — ma가 로컬에 설치되어 있다면, '.ma [port]' 후 '.my.identity!publish @ma'를 실행하세요. 자세한 내용은 '.help.publish'를 입력하세요.
msg-blocked = ⊗ 차단됨 [{ $cap }]: { $from }
msg-focus-cleared = 포커스가 해제됨
msg-focusing = { $did }을(를) { $prompt }(으)로 포커스 중
msg-set = { $path }: { $value }
msg-deleted = { $path } 삭제됨 ({ $count }개 항목)
msg-read-only = { $path }은(는) 읽기 전용입니다
msg-subtree-set = { $path }은(는) 서브트리입니다; 설정 거부됨
msg-ancestor-leaf = { $path }의 한 조상이 리프입니다; 덮어쓰기 거부됨
msg-key-not-found = 키를 찾을 수 없음: { $path }
msg-no-match = 일치하는 항목 없음
msg-link-not-connected = 링크 가져오기 오류: 연결되지 않음
msg-link-fetch-error = 링크 가져오기 오류: { $e }
msg-link-key-not-found = 연결된 문서에서 키 `{ $key }`를 찾을 수 없음

# ── 별칭 유효성 검사 ──────────────────────────────────────────────────────
err-alias-name-empty = 별칭 이름은 비어있을 수 없습니다
err-alias-has-dot = 별칭 이름에 '.'을 포함할 수 없습니다
err-alias-has-fragment = 별칭 이름에 '#'을 포함할 수 없습니다
err-alias-value-fragment = 별칭 값은 bare did:ma:<ipns>이어야 합니다 (프래그먼트 없음)
err-alias-value-path = 별칭 값은 bare did:ma:<ipns>이어야 합니다 (경로 없음)
err-alias-not-did = 별칭 값은 did:ma:로 시작해야 합니다
err-unknown-alias = 알 수 없는 별칭: @{ $name }
err-bare-did = bare did:ma:<ipns> (프래그먼트나 경로 없음) 필요, 받은 값: { $did }

# ── 편집기 ────────────────────────────────────────────────────────────────
btn-save = 저장
btn-eval = 실행
btn-cancel = 취소
btn-close = 닫기
btn-reply = 답장
btn-publish = 게시
btn-publish-ipld = 게시 IPLD
msg-reply-sent = 답장 전송됨
msg-reply-failed = 답장 실패: { $e }
msg-entity-publish-sent = 엔티티 { $name }: 게시 전송됨
msg-entity-publish-failed = 엔티티 게시 실패: { $e }
msg-kind-publish-failed = 종류 게시 실패: { $e }
msg-field-publish-sent = 엔티티 { $name }.{ $field }: 게시 전송됨
msg-field-publish-failed = 필드 게시 실패: { $e }
msg-acl-publish-sent = 런타임 ACL: 게시 전송됨
msg-crud-edit-publish-sent = { $path }: 게시 전송됨
msg-acl-publish-failed = 런타임 ACL 게시 실패: { $e }
msg-yaml-error = YAML 오류: { $e }
msg-editor-saved = { $path }:save
msg-fetch-review = { $cid } 가져옴 — 실행 전 검토하세요
msg-fetch-failed = 가져오기 { $cid }: { $e }

# ── 동사 — 받은 편지함 ────────────────────────────────────────────────────
inbox-empty = 받은 편지함이 비어있습니다
inbox-entry-not-found = 받은 편지함 항목 { $n }을(를) 찾을 수 없음
inbox-no-message-id = 받은 편지함 항목 { $n }에 message_id가 없음
inbox-no-verb = 받은 편지함 항목 { $n }에 `{ $verb }` 동사가 없음
inbox-filter-no-arg = 필터에는 DID 또는 별칭 인수가 필요합니다
inbox-filter-empty = { $did }의 메시지가 없습니다

# ── 동사 — 런타임 ─────────────────────────────────────────────────────────
discover-fetch-failed = { $url }에서 검색 실패: { $e }
discover-json-error = 검색 실패: { $url }에서 잘못된 JSON: { $e }
discover-missing-did = 검색 실패: status.json에 `did` 필드 없음
discover-invalid-did = 검색 실패: `did`가 did:ma:로 시작해야 했으나 `{ $did }` 받음
discover-no-endpoint = 검색 경고: status.json에 `endpoint_id` 없음; DID만 저장됨
discover-success = { $url }에서 ma 발견됨
discover-did-line = DID: { $did }
discover-alias-hint =   별칭 @ma 생성됨 — '.my.identity!publish @ma'를 실행하여 신원을 게시하세요.
claim-success = { $did }에 대한 런타임 청구됨
claim-conflict = 런타임이 이미 다른 신원에 의해 청구됨
claim-http-failed = 청구 실패: HTTP { $status }
claim-error = 청구 실패: { $e }
claim-no-session = 로그인되지 않음; 런타임을 청구하려면 먼저 로그인하세요
runtime-no-verb = { $path }에 `{ $verb }` 동사가 없음

# ── 동사 — ACL ────────────────────────────────────────────────────────────
acl-reset = .my.acl 초기화됨 (완전히 열림)
acl-persist-error = 저장 오류: { $e }
acl-no-verb = .my.acl에 `{ $verb }` 동사가 없음

# ── 동사 — 신원 ───────────────────────────────────────────────────────────
publish-usage = 사용법: .my.identity!publish <did-또는-별칭>
identity-exported = 번들을 { $filename }(으)로 다운로드했습니다
identity-export-failed = 내보내기 실패: { $e }

# ── 동사 — 문서 ───────────────────────────────────────────────────────────
doc-content-empty = { $path }.content이(가) 비어있음
doc-save-first = { $path }.content이(가) 비어있음 — 먼저 저장하세요
doc-missing-name = 문서 이름 없음
doc-publish-usage = 사용법: .my.doc.<name>!publish <publisher>
doc-publish-ipld-usage = 사용법: .my.doc.<name>!publish-ipld <publisher>
doc-publish-failed = 게시 { $path }: { $e }
doc-publish-ipld-failed = publish-ipld { $path }: { $e }
doc-store-sent = 저장 요청 전송됨 ({ $id }) → { $publisher }; CID는 RPC 응답으로 도착합니다
doc-ipld-store-sent = IPLD 저장 요청 전송됨 ({ $id }) → { $publisher }; CID는 RPC 응답으로 도착합니다
doc-fetch-done = { $cid } 가져옴 → { $path }.content (실행되지 않음)
doc-fetch-failed = 가져오기 { $cid }: { $e }
doc-fetch-usage = 사용법: .my.doc.<name>!fetch <cid>
doc-cid-value = { $path }.cid = { $cid }
doc-cid-not-set = { $path }.cid가 설정되지 않음
doc-no-verb = { $path }에 `{ $verb }` 동사가 없음
path-no-verb = { $path }에 `{ $verb }` 동사가 없음

# ── 도움말 — 헤더 ─────────────────────────────────────────────────────────
help-header-zion = ── zion 명령어 ───────────────────────────────────────────────────────────
help-header-messaging = ── 메시징 ────────────────────────────────────────────────────────────────
help-header-focus = ── 포커스 모드 ──────────────────────────────────────────────────────────
help-header-config = ── 로컬 설정 문법 ─────────────────────────────────────────────────────
help-header-common = ── 공통 경로 ─────────────────────────────────────────────────────────────
help-header-inbox = ── 받은 편지함 ────────────────────────────────────────────────────────────
help-header-documents = ── 문서 ──────────────────────────────────────────────────────────────────
help-footer = ─────────────────────────────────────────────────────────────────────────

# ── 도움말 — zion 명령어 ──────────────────────────────────────────────────
help-cmd-help =   .help                        이 텍스트
help-cmd-clear =   .clear                       터미널 지우기
help-cmd-panic =   .panic                       최후 수단 — 문제 발생 시 사용
help-cmd-history =   .history                     명령 기록 (연속 중복 항목 병합)
help-cmd-logout =   .logout                      로그아웃
help-cmd-batch =   .batch                       eval scratch document (parallel)
help-cmd-batch-sync =   .batch:begin                  eval scratch document line-by-line (sequential)

# ── 도움말 — 메시징 ───────────────────────────────────────────────────────
help-msg-echo =   @alias                       해석된 DID 표시 (메시지 전송 없음)
help-msg-send =   @alias[:verb] body           액터에게 메시지 / RPC 전송
help-msg-fragment =   @alias#fragment[:verb] body  명시적 DID 프래그먼트로 전송
help-msg-escape =   \@name                       리터럴 @name (별칭 조회 없음)

# ── 도움말 — 포커스 모드 ──────────────────────────────────────────────────
help-focus-set =   .use @alias [as @name]       액터에 포커스 (프롬프트 변경)
help-focus-clear =   .use                         포커스 해제

# ── 도움말 — 설정 문법 ────────────────────────────────────────────────────
help-config-get =   .path                        리프 값 가져오기 또는 서브트리 나열
help-config-filter =   .path value                  값으로 필터링
help-config-set =   .path: value                 리프 설정
help-config-delete =   .path:                       리프 또는 서브트리 삭제
help-config-verb =   .path!verb [args]            로컬 동사 호출

# ── 도움말 — 공통 경로 ────────────────────────────────────────────────────
help-my =   .my                          모든 개인 설정 표시
help-aliases =   .my.aliases                  별칭 목록
help-aliases-set =   .my.aliases.<name>: <did>    별칭 추가/업데이트
help-aliases-del =   .my.aliases.<name>:          별칭 제거
help-runtime-discover =   .ma [port]          로컬 런타임 검색 및 @ma 생성
help-runtime-claim =   .ma [port]             DID로 런타임 소유권 청구
help-identity =   .my.identity                 신원 설정 표시
help-identity-did =   .my.identity.did             자신의 DID 표시 (읽기 전용)
help-identity-publish =   .my.identity!publish @pub    게시 서비스를 통해 DID 게시
help-identity-export =   .my.identity!export          내 신원 번들 다운로드
help-config-path =   .config                      모든 .config.* 항목 표시

# ── 도움말 — 받은 편지함 ──────────────────────────────────────────────────
help-inbox =   .my.inbox                    받은 편지함 목록 (서브트리 뷰)
help-inbox-n =   .my.inbox.N                  항목 N의 필드 표시
help-inbox-from =   .my.inbox.N.from             항목 N의 발신자 DID
help-inbox-reply =   .my.inbox.N!reply [body]     답장 전송 (내용 없음 — 편집기 열림)
help-inbox-open =   .my.inbox.N!open             편집기에서 읽기 전용으로 내용 열기
help-inbox-del =   .my.inbox.N:                 항목 N 삭제
help-inbox-delall =   .my.inbox:                   모든 받은 편지함 항목 삭제
help-inbox-flush =   .my.inbox!flush              모든 항목을 터미널에 출력
help-inbox-filter =   .my.inbox!filter @who        @who의 항목만 표시
help-inbox-traverse =   .my.inbox.N.sender.<field>   발신자 DID 문서 지연 탐색

# ── 도움말 — 문서 ─────────────────────────────────────────────────────────
help-doc-edit =   .my.doc.<name>!edit           저장된 내용으로 편집기 열기
help-doc-edit-cid =   .my.doc.<name>!edit <cid>     CID 가져오기, 검토 전용으로 열기
help-doc-eval =   .my.doc.<name>!eval           저장된 내용을 줄 단위로 실행
help-doc-publish =   .my.doc.<name>!publish @pub   원시 블롭으로 저장 (모든 유형)
help-doc-publish-ipld =   .my.doc.<name>!publish-ipld @pub  YAML을 DAG-CBOR IPLD 노드로 저장
help-doc-fetch =   .my.doc.<name>!fetch <cid>    CID 내용 가져오기 (실행 없음)
help-doc-cid =   .my.doc.<name>!cid            저장된 CID 표시
help-doc-del =   .my.doc.<name>:              문서 삭제

# ── Verbs — lang ─────────────────────────────────────────────────────────
lang-list-header = 사용 가능한 언어 (.my.i18n: <code> 로 설정):
err-lang-not-found = 언어를 찾을 수 없습니다: { $lang }

msg-send-failed = 전송 실패: { $e }
msg-not-logged-in = 로그인하지 않음

# ── CBOR / YAML codec errors ──────────────────────────────────────────────
yaml-parse-error = YAML 파싱 오류: { $e }
yaml-not-mapping = YAML은 매핑(키: 값 쌍)이어야 합니다; 일반 텍스트와 스칼라는 DAG-CBOR로 저장할 수 없습니다
dagcbor-encode-error = DAG-CBOR 인코딩 오류: { $e }
cbor-decode-error = CBOR 디코딩 오류: { $e }
cbor-json-error = CBOR에서 JSON 오류: { $e }
yaml-serialize-error = YAML 직렬화 오류: { $e }
edit-reply-invalid = 잘못된 편집 응답
doc-publish-ipld-error = IPLD 게시 실패: { $e }

# ── Internal / session errors ─────────────────────────────────────────────
err-inbox-prune-persist = 받은 편지함 정리 저장 오류: { $e }
err-config-load = 설정 불러오기 오류: { $e }
err-lang-persist = 언어 저장 오류: { $e }
err-history-parse = 기록 파싱 오류: { $e }
err-history-load = 기록 불러오기 오류: { $e }
err-ipfs-reply-decode = IPFS 응답 디코딩 실패: { $e }
err-edit-cbor = CBOR 편집 오류: { $e }
err-popup-blocked = 팝업이 브라우저에 의해 차단됨
status-publishing = 게시 중

# ── RPC / redigering ─────────────────────────────────────────────────────
rpc-error = 오류
rpc-error-detail = 오류: { $detail }
msg-new-message = ← [{ $from }] 새 메시지 — 받은 편지함에 { $count } 개
msg-chat = { $sender } 말한다 { $body }

# ── Room events ───────────────────────────────────────────────────────────
room-say   = { $name } 라고 말한다 { $text }
room-emote = * { $name } { $text }
room-enter = * { $name } 이(가) 입장했습니다.
room-leave = * { $name } 이(가) 퇴장했습니다.
room-drop  = * { $name } 이(가) { $thing } 을(를) 떨어뜨렸다.
room-take  = * { $name } 이(가) { $thing } 을(를) 집었다.
err-edit-decode-failed = 편집: 디코딩 실패: { $e }
err-edit-fetch-failed = 편집: 가져오기 실패: { $e }

# ── Profile management ────────────────────────────────────────────────────
profile-delete-no-session = 활성 세션이 없습니다 — 프로필을 삭제할 수 없습니다
profile-delete-error = 프로필 삭제 실패: { $e }
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
profiles-empty = (없음)
profiles-deleted = 프로필 { $name } 삭제됨
profiles-not-found = 프로필을 찾을 수 없음: { $name }

# -- Help topics index
help-header-topics = -- topics -- type .help.<topic> for details
help-topic-msg =   .help.msg                    messaging
help-topic-focus =   .help.focus                  focus mode
help-topic-path =   .help.path                   local dot-path grammar
help-topic-my =   .help.my                     personal config
help-topic-inbox =   .help.inbox                  inbox
help-topic-doc =   .help.doc                    documents
help-topic-actor =   .help.actor                  remote actor
help-topic-url =   .help.url                    URL 링크로 zion 열기
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
help-header-url = ── URL 매개변수 ──────────────────────────────────────────────────────────────
help-url-intro =   수신자가 미리 채워진 zion을 여는 링크를 공유하세요:
help-url-msg =   ?msg=<did>                   미리 채움: @<did> (텍스트 메시지)
help-url-say =   ?say=<did>                   미리 채움: @<did>:say (say 동사)
help-url-emote =   ?emote=<did>                 미리 채움: @<did>:emote (emote 동사)
help-url-example =   https://ma.bahner.com/?msg=did:ma:k51…
help-url-note =   입력란이 채워지지만 전송되지 않음 — Enter 키를 눌러 전송하세요.
# ── Help text — publishing ────────────────────────────────────────────────
help-topic-publish =   .help.publish                네트워크에 신원 게시하기
help-header-publish = ── 신원 게시 ─────────────────────────────────────────────────────────────────
help-publish-intro = 게시하면 네트워크에서 신원을 찾을 수 있습니다. 다른 사람들이 DID를 검색하여 연락할 수 있습니다.
help-publish-ma = 게시하려면 ma(로컬 런타임)가 설치되어 있어야 합니다. ego를 IPFS/IPNS에 연결해줍니다.
help-publish-steps = 단계: '.ma [port]'로 로컬 ma를 감지한 후 '.my.identity!publish @ma'를 실행하세요.
help-publish-without = 게시하지 않으면 다른 사람들이 당신에게 연락할 수 없습니다 — DID를 알더라도 endpoint를 확인할 수 없습니다.
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
scheme-cid-fetch-error = CID { $cid } 가져오기 실패: { $reason }
scheme-include-error = include: { $reason }
scheme-not-a-cid = 유효하지 않은 CID: { $value }
