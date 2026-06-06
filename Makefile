WASM		= target/wasm32-unknown-unknown/release/zion.wasm
TRUNK_OPTS	= --release

# All Rust source files and assets that should trigger a rebuild.
SRC		= $(shell find src -name '*.rs') \
		  Cargo.toml Cargo.lock \
		  $(shell find i18n -name '*.ftl') \
		  index.html Trunk.toml \
		  $(shell find style -name '*.css' 2>/dev/null) \
		  $(shell find www -type f 2>/dev/null)

.PHONY: serve dev clean publish check dist twiggy twiggy-dom test

dist:
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
	@ipfs add -r dist 2>&1 | tee /tmp/zion-ipfs-add.txt
	@tail -1 /tmp/zion-ipfs-add.txt | awk '{print $$2}' > .cid
	@echo "CID: $$(cat .cid)"
	@echo "Open: ipfs://$$(cat .cid)"
	@touch .publish.sh
	@sh .publish.sh

cid:
	@cat .cid 2>/dev/null || echo "No .cid file. Run 'make publish' first."

check:
	cargo check --target wasm32-unknown-unknown

test:
	cargo test
	cargo clippy --target wasm32-unknown-unknown -- -D warnings

twiggy: $(WASM)
	twiggy top -n 40 $(WASM)

twiggy-dom: $(WASM)
	twiggy dominators $(WASM) | head -80

$(WASM): $(SRC)
	cargo build --release --target wasm32-unknown-unknown
