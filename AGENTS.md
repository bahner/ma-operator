Vi skal lage en agent webapp, hvor en agent er et menneske og appen holder denne brukerens identity
og fungerer som "kroppen" til brukeren. Som en app som gjør at de kan "agere" (som en  Hewitt Actor),
som sin did.
Den skal brukes til å sende og motta ma-meldinger vhja. ma-did og ma-core crates.
ma-did og ma-core er utfyllende dokumentert i hhv. <https://docs.rs/ma-did/latest/ma_did/> og <https://docs.rs/ma-core/latest/ma_core/>.
Det som mangler en en runtime (hvis midlertidige dokumentasjon er i ../ma-runtime/spec).
Den grunnleggende spesifikasjon for DID og ma messages er definerte i ../ma-spec med noe ekstra info i ../ma-spec/core som er mere
for å utvide ma-rammeverket.

The app must be seriosly cross platform and work equally well on mobiles and different browsers.

Denne er app'en skal være grensesnittet for å sende og motta meldinger til en slik runtime på. Appen må være lett og utvide, tenk modulær, siden vi skal gjøre dette til en effektiv "arbeidsstasjon" efterhvert. Men vi spiser vår egen hundemat og bruker de samme primitiver som i ma-did og ma-core internt.

Vi utvikler i rust og kompilerer til wasm så godt vi kan. Appene skal distes som statiske filer, som kan kopieres til en webserver eller serveres med IPFS. Vi skal ikke ha noen backend.

ma-core craten har funksjoner for å håndtere config og secret bundles - også for wasm.

SÅ, jeg trenger en webapp, som er litt sånn klassisk mud-klient. Før innlogging skal den ha en forisde for opprettelse av identitet.
Den skal ha støtte forskjellige brukere med forskjellige bundles.
Et brukernavn som brukes til å identifisere riktig bundle, som så kan låses opp med et passord. Jeg er nemlig avhengig av å teste med flere identiteter i forskjellige nettleserfaner.
På forsiden hvor bundles genereres og brukernavn og passord settes skal det også være mulighet for
eksport og import av hele bundle med evnt. config og med bundle fortsatt kryptert, selvfølgelig.
Brukernavnet må følge med for import et annetsted, men ikke passordet. Tapt passord, tapt identitet.

Når man er logget på skal det føles som en klassisk MUD-klient, men det er mere et dashboard/en arbeidsstasjon.
Et readline tekst input felt nederst og så et stort dialog vindue over.
Vi bruker hele tiden actor modellen. konsepter er bekrevet her og i ../ma-spec.

vi bruker konsekvent et dot-notasjons configtre lokalt, ie:

.my.aliases
.my.did
.my.home
.my.location
.my.inbox

Vi bruker konsekvent @did:ma:<identity>#<foo> for meldingsending, så det må vi kunne aliase. Det er bare dids vi skal kunne aliase, eg:

.my.aliases add @fjodor @did:ma:<fjodorsidentity>
.my.aliases add @secretbar @did:ma:<someworldsidentity>#secretbar
.my.aliases
fjodor     did:ma:<fjodorsidentity>
secretbar  did:ma:<someworldsidentity>#secretbar
mailbox    did:ma:<homeworld>#mymailbox

.my.home did:ma:<myworldsidentity>#bahners

Vi kan tenke på et eget meta rom her, eg:
.config.pull_interval: 245ms
This is just a silly pseudo example, but you get the gist of it. Meta config which isn't related to
me and my messages

Dette skal være en explorer for å kunne sende meldinger. Det har utkrystalliert seg en syntaks, vi kan ta utganspunkt i:
@fjodor Hello # sender bare en kryptert content type text/plain med content "Hello" til id:ma:<fjodorsidentity>. Dette er som en "epost" å regne.
@secretbar:order en øl # sender en application/x-ma-rpc med format [:order, "en øl] til did:ma:<someworldsidentity>#secretbar
Det nøyaktige format på meldingene er definert i spec'en.

Til å begynne med skal vi hovedsakelig send :ping meldinger og kanskje utvikle en :fortune et annet sted, men vi trenger å kunne sende meldinger til #root

Så snart en runtime er oppe skal vi altså gjøre alt herfra. Når vi mottar meldinger, så kan de foreløpige bare skrives til tekstvinduet. Så kan vi utvide efterhvert.

Vi skal og kunne ha ett "mode". Det er når vi "går nærmere på et object/en actor. Slik at vi endrer promptet litt og er mere "inni", eg:

.use @mailbox as @post og jeg får et prompt:
@post

@post list
1. alice says hi
2. bob says hello
@post:reply 1 hi alice
@post:reply 2 hello bob
@post:send @fjodor "I bought chips and beer. Come on over after work :-)
@post:send did:ma:<somenewacquiantence> Thanks for meeting up yesterday
.use

Her skriver jeg egentlig bare
:reply 1 hi alice
:reply 2 hello bob
:send @fjodor "I bought chips and beer. Come on over after work :-)
:send did:ma:<somenewacquiantence> Thanks for meeting up yesterday
.use

Det er bare syntaktisk sukker, så man har litt fokus og at promptet fylles ut i inputfeltet, men for enkelt kommandoer er det fortsatt bare å slette "@post" dersom man vil gjøre noe annet. Det er bare at systemet ferdig utfyller "@post" og vet at @post betyr "did:ma:<homeworld>#mymailbox" inntil .use skrives uten parametre.

Jeg tror den faktiske mailbox syntaks er beskrevet i spec. Dette er bare pseudo kode, mens "." prefix for lokal konfigurasjon spikres nu,
@actor spikres nu og @actor:verb spikres nu.

NB! aliaser må kunne knockes ut med \, så \@fjodor er bare tekstreng "@fjodor" ikke "@did:ma:<fjodorsidentity>". Ellers skal alle @alias oppløses, så 
@fjodor:say got mail from @secretbar
er dss.
@did:ma:<fjodorsidentity>:say got mail from did:ma:<someworldsidentity>#secretbar

Så tar vi det derfra. Når did skrives til tekstfeltet skal alias skrives, hvis det finnes. @tekststreng implisrer at "tekststreng" skal slåes opp i .my.aliases og det er en feil, hvis det ikke finnes, med mindre "tekststreng" er en did, da :-) Når aliaser skrives til tekstfeltet bør de ha en farve. Den kan settes med:

.config.alias.colour: ##ffdead

.config skal liste all konfigurasjon. .config.nøkkel: implserer at det skal settes, men config.nøkkel betyr at den gettes. ANdre farver og slikt du velger skal også innstilles der. Sånn sett er kanskje:
.config.colour.alias: #ffdead
.config.colour.text_background: #ffffff

Og slikt smartere. Strukturerer config slik du finner det best, men spør gjerne.

Spør gjerne før du begynner å gjøre implementasjonsvalg som vil være vanskelig å endre senere.

Jeg tenker at jeg skal kunne begynne å konfe en runtime snart som:

Jeg må kunne ha funksjoner, slik at jeg feks kan gjøre nanoid(). Ikke så mange, så vi trenger ikke et generell programmeringslag, men vi trenger en god notasjon.
Jeg tenker slik, @actor:nanoid sender en melding til @actor :nanoid, mens () betyr at vi venter på svaret tilbake og setter inn verdien, som kommer tilbake istedetfor.
Vi må mao parse og message, før vi kan sende vår melding.

.my.aliases add nanoid did:ma:<fjodorsutilsruntime>:nanoid

.use did:ma:<runtime>#root
@root:create {#@nanoid(), kind=generic, name="Generic Object"}
@root:destroy #mynanoid
.use

for kode struktur sørg for å dele godt opp i logiske filer, ikke lag wn stor en-fils app. Det gjelder både evnt. javascript kode i www og i rust koden i src.
Ikke dupliserkode, som allerede er i ma-did eller ma-core. Bruke dem for alt hva de er verdt. Sett deg godt inn i ma-core crate. Unngå store rammeverk, hvis
det ikke er nødvendig.
Appen skal alltid bruke publisert `ma-core` fra crates.io. Den skal aldri peke til `~/src/rust-ma-core` eller andre lokale path dependencies for `ma-core`.

Lag Makefile for alminnelie targets, bygg av app'en. Publisering til ipfs (eg. ipfs add www) og printing av resulterende cid eller dump til .cid slik at
jeg lett kan åpne den via ipfs:// i min nettleser.

---

## Architectural decisions (accumulated)

### Dot-command grammar

- `.path` — get (shows value if leaf, subtree listing if node)
- `.path value` — match/filter (get with query)
- `.path: value` — set
- `.path:` — delete (subtree if node, leaf if leaf)
- `.path:verb [args]` — local verb dispatch (not RPC)

Read-only keys (e.g. `.my.identity.did`) are enforced in `EgoConfig::is_read_only()`.
A key cannot be both a leaf and a parent node simultaneously.

### Alias rules

- Only leaf aliases expand. Subtree-only paths are an error on `@name`.
- `\@foo` escapes alias expansion — literal `@foo` text.
- Aliases are stored at `.my.aliases.<name>` (flat leaves, bare DIDs only — no fragments).
- CRUD via generic dot grammar (`.my.aliases.fjodor: did:ma:…` to set, `.my.aliases.fjodor:` to delete).

### Identity / session keys

Four 32-byte keys are held in thread-locals for the session:
- `SESSION_IROH_KEY` — iroh QUIC transport
- `SESSION_IPNS_KEY` — IPNS identity root
- `SESSION_SIGNING_KEY` — Ed25519 signing (DID `#sign`)
- `SESSION_ENCRYPTION_KEY` — X25519 encryption (DID `#enc`)

`did_encryption_key` is part of the session because it will be needed for decrypting
incoming messages. Always include it when constructing SessionState.

### Transport / services

- Register BOTH `INBOX_PROTOCOL_ID` and `RPC_PROTOCOL_ID` on the endpoint at connect time.
- Store a separate `SESSION_RPC_INBOX` thread-local for RPC replies (`:pong`, CID replies, etc.).
- Drain both inboxes in the polling loop (every 500 ms).
- When publishing the DID document, use `bundle.build_document(ep.ma_extension())` — this
  includes all registered services in the signed document so remote senders can resolve
  reply endpoints.

### .my.documents — document management

Documents are stored in EgoConfig as a subtree:
- `.my.documents.<name>.content` — the text body
- `.my.documents.<name>.content_type` — text/plain | text/markdown | text/yaml
- `.my.documents.<name>.cid` — IPFS CID (set after :publish)

Verbs on `.my.documents.<name>`:
- `:edit` — open CodeMirror 6 modal editor with stored content (or empty)
- `:edit <cid>` — fetch CID from IPFS gateway, open in editor for review (NOT auto-executed)
- `:eval` — execute SAVED `.content` line-by-line through the terminal evaluator
- `:publish <@publisher-or-did>` — send `application/x-ma-ipfs-store` to publisher; CID reply stored in `.cid`
- `:cid` — display `.my.documents.<name>.cid`
- `:fetch <cid>` — import CID content into `.content` + `.cid`, no editor, no execution
- `.my.documents.<name>:` — deletes entire document subtree

Editor buttons: **Save** (persists `.content`, editor stays open), **Eval** (runs current buffer
as commands, closes editor — does NOT require prior save), **Cancel** (close without saving).

### SECURITY — CID execution

**UNDER NO CIRCUMSTANCES may content fetched from a CID be executed automatically.**
`:edit <cid>` MUST open the editor for human review first.
Only `:eval` (on saved content) and the **Eval** button inside the editor (on the visible buffer)
may trigger execution. This rule must never be bypassed.

### application/x-ma-ipfs-store protocol

New content type on `/ma/ipfs/0.0.1`:
- Payload: CBOR `{content: bytes, content_type: string}`
- Encryption: required
- Reply: `application/x-ma-rpc-reply` with `[:ok, "<cid>"]` or `[:error, "msg"]`,
  `reply_to` = request msg ID, delivered to sender's `/ma/rpc/0.0.1`

### Editor

CodeMirror 6 loaded from CDN (esm.sh) via `www/editor.js` shim.
Exposed on `window.maEditor`: `create(el_id, value, language)`, `getValue(el_id)`,
`setLanguage(el_id, lang)`, `destroy(el_id)`.
Called from Rust via `js_sys` / `wasm_bindgen`.
Language modes: plain, markdown, yaml.

### ma-core patch

During development, `[patch.crates-io] ma-core = { path = "../rust-ma-core" }` is active.
New helpers added locally must be gated under the appropriate feature flag (e.g. `ipfs`)
and exported from `lib.rs`. When a new published version is available, switch back to the
crates.io version.
