WASM		= target/wasm32-unknown-unknown/release/operator.wasm
TRUNK_OPTS	= --release
DIST_INDEX	= dist/index.html

# All Rust source files and assets that should trigger a rebuild.
SRC		= $(shell find src -name '*.rs') \
		  Cargo.toml Cargo.lock \
		  $(shell find i18n -name '*.ftl') \
		  index.html Trunk.toml \
		  $(shell find style -name '*.css' 2>/dev/null) \
		  $(shell find www -type f 2>/dev/null)

.PHONY: serve dev clean publish dist check twiggy twiggy-dom test js-bundle

dist: $(DIST_INDEX)

$(DIST_INDEX): $(SRC)
	trunk build $(TRUNK_OPTS)

#serve: TRUNK_OPTS=
serve: dist
	python3 -m http.server 8000 -d dist

dev:
	trunk serve --port 8000

clean:
	cargo clean
	rm -rf dist

publish: dist
	@echo "Adding to IPFS..."
	@ipfs add -r dist 2>&1 | tee /tmp/operator-ipfs-add.txt
	@tail -1 /tmp/operator-ipfs-add.txt | awk '{print $$2}' > .cid
	@echo "CID: $$(cat .cid)"
	@echo "Publishing Operator IPNS name..."
	@ipfs name publish --key=operator "$$(cat .cid)"
	@echo "Pinning Operator CID on Pinata..."
	@pinata_log=$$(mktemp); \
	if ipfs pin remote add --background --service=pinata --name="operator-$$(date --iso-8601)" "$$(cat .cid)" >"$$pinata_log" 2>&1; then \
		cat "$$pinata_log"; \
	else \
		cat "$$pinata_log"; \
		if grep -Eq 'DUPLICATE_OBJECT|already pinned to pinata' "$$pinata_log"; then \
			echo "Pinata already has this CID; continuing."; \
			true; \
		else \
			rm -f "$$pinata_log"; \
			exit 1; \
		fi; \
	fi; \
	rm -f "$$pinata_log"
	@echo "Open: ipfs://$$(cat .cid)"
	@touch .publish.sh
	@sh .publish.sh

cid:
	@cat .cid 2>/dev/null || echo "No .cid file. Run 'make publish' first."

check:
	cargo check --target wasm32-unknown-unknown

# Rebuild www/editor.js from js-src/ (vendored CodeMirror bundle).
# Requires bun (https://bun.sh) — not npm/node. Run this after editing
# js-src/editor-entry.js or js-src/zscheme-mode.js; the output is committed.
#
# editor.js is served under a stable filename (unlike trunk's hashed
# rust/wasm/css outputs), so browsers/proxies can cache it indefinitely.
# We bust that cache by stamping a content-hash query string onto the
# <script src="/editor.js?v=...">  reference in index.html.
js-bundle:
	bun install
	bun run build:editor
	@hash=$$(sha256sum www/editor.js | cut -c1-10); \
	sed -i -E "s|(src=\"/editor\.js)(\?v=[0-9a-f]+)?\"|\1?v=$$hash\"|" index.html; \
	echo "editor.js hash: $$hash (index.html updated)"

test:
	cargo test
	cargo clippy --all-targets -- -W clippy::pedantic -D warnings
	cargo clippy --target wasm32-unknown-unknown -- -W clippy::pedantic -D warnings

twiggy: $(WASM)
	twiggy top -n 40 $(WASM)

twiggy-dom: $(WASM)
	twiggy dominators $(WASM) | head -80

$(WASM): $(SRC)
	cargo build --release --target wasm32-unknown-unknown
