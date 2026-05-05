.PHONY: build serve clean publish

build:
	trunk build --release

serve:
	trunk serve

clean:
	cargo clean
	rm -rf dist

publish: build
	@echo "Adding to IPFS..."
	@ipfs add -r dist 2>&1 | tee /tmp/ego-ipfs-add.txt
	@tail -1 /tmp/ego-ipfs-add.txt | awk '{print $$2}' > .cid
	@echo "CID: $$(cat .cid)"
	@echo "Open: ipfs://$$(cat .cid)"

cid:
	@cat .cid 2>/dev/null || echo "No .cid file. Run 'make publish' first."

check:
	cargo check --target wasm32-unknown-unknown
