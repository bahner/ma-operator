.PHONY: serve dev clean publish check dist

dist:
	trunk build --release

serve: dist
	python3 -m http.server 8000 -d dist

dev:
	trunk serve --port 8088

clean:
	cargo clean
	rm -rf dist

publish: dist
	@echo "Adding to IPFS..."
	@ipfs add -r dist 2>&1 | tee /tmp/zion-ipfs-add.txt
	@tail -1 /tmp/zion-ipfs-add.txt | awk '{print $$2}' > .cid
	@echo "CID: $$(cat .cid)"
	@echo "Open: ipfs://$$(cat .cid)"

cid:
	@cat .cid 2>/dev/null || echo "No .cid file. Run 'make publish' first."

check:
	cargo check --target wasm32-unknown-unknown
