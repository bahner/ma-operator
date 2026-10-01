/**
 * @helia/verified-fetch shim for operator — SOURCE file.
 *
 * Bundled by `bun build` into `www/ipfs.js` (which is committed and is what
 * actually ships). Do not edit `www/ipfs.js` directly — edit this file and
 * re-run `make js-bundle`.
 *
 * Exposes `window.maIpfs` with:
 *   fetchBytes(resource, nocache?)  -> Promise<ArrayBuffer>  raw bytes, no JSON round-trip
 *   fetchText(resource, nocache?)   -> Promise<string>       UTF-8 text
 *   resolveIpns(resource, nocache?) -> Promise<string>       best-effort /ipfs/<cid> path
 *   clearCaches()                   -> Promise<void>         drop persisted routing caches
 *
 * `resource` is a normalized `ipfs://<cid>[/path]` or `ipns://<name>[/path]`.
 *
 * `nocache` forces fresh IPNS resolution: it skips verified-fetch's in-memory
 * IPNS record cache (the resolver's `nocache` option) so a DID document is
 * re-resolved from routing instead of being served from a stale cached record.
 * It does NOT bypass verified-fetch's persistent delegated-routing Cache
 * Storage (5-minute TTL) — call `clearCaches()` for that.
 *
 * verified-fetch retrieves content trustlessly (verifying every byte against
 * its CID) via Bitswap/WebRTC providers and trustless gateways, falling back
 * to delegated routing. It is vendored (bundled at build time) so there is no
 * CDN runtime dependency.
 */
import { verifiedFetch } from "@helia/verified-fetch";

async function checked(resource, opts) {
    const res = await verifiedFetch(resource, opts);
    if (!res.ok) {
        throw new Error(`verified-fetch failed (HTTP ${res.status}) for ${resource}`);
    }
    return res;
}

// Raw bytes, no JSON round-tripping — Rust owns decode/verify (e.g. DAG-CBOR
// DID documents and raw content blocks).
async function fetchBytes(resource, nocache = false) {
    const opts = { headers: { accept: "application/octet-stream" } };
    if (nocache) opts.nocache = true;
    const res = await checked(resource, opts);
    return await res.arrayBuffer();
}

async function fetchText(resource, nocache = false) {
    const res = await checked(resource, nocache ? { nocache: true } : undefined);
    return await res.text();
}

// Resolve an IPNS name to its current /ipfs/<cid> path. Best-effort: verified-
// fetch resolves the name internally while fetching; if it exposes the resolved
// path on the response URL we return it, otherwise this fails.
async function resolveIpns(resource, nocache = false) {
    const res = await checked(resource, nocache ? { nocache: true } : undefined);
    const url = res.url || "";
    if (url.startsWith("ipfs://")) {
        return "/" + url.slice("ipfs://".length);
    }
    if (url.startsWith("/ipfs/")) {
        return url;
    }
    throw new Error(`verified-fetch did not expose a resolved /ipfs path for ${resource}`);
}

// Drop verified-fetch's persisted delegated-routing cache so the next resolve
// fetches fresh routing/IPNS records instead of a stale cached response. This
// is the Cache Storage layer (5-minute TTL); the in-memory IPNS record cache is
// bypassed with `nocache`. verified-fetch is the only Cache Storage user here.
async function clearCaches() {
    if (typeof caches === "undefined") return;
    const names = await caches.keys();
    await Promise.all(names.map((name) => caches.delete(name)));
}

window.maIpfs = { fetchBytes, fetchText, resolveIpns, clearCaches };
