/**
 * @helia/verified-fetch shim for operator — SOURCE file.
 *
 * Bundled by `bun build` into `www/ipfs.js` (which is committed and is what
 * actually ships). Do not edit `www/ipfs.js` directly — edit this file and
 * re-run `make js-bundle`.
 *
 * Exposes `window.maIpfs` with:
 *   fetchBytes(resource)  -> Promise<ArrayBuffer>  raw bytes, no JSON round-trip
 *   fetchText(resource)   -> Promise<string>       UTF-8 text
 *   resolveIpns(resource) -> Promise<string>       best-effort /ipfs/<cid> path
 *
 * `resource` is a normalized `ipfs://<cid>[/path]` or `ipns://<name>[/path]`.
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
async function fetchBytes(resource) {
    const res = await checked(resource, { headers: { accept: "application/octet-stream" } });
    return await res.arrayBuffer();
}

async function fetchText(resource) {
    const res = await checked(resource);
    return await res.text();
}

// Resolve an IPNS name to its current /ipfs/<cid> path. Best-effort: verified-
// fetch resolves the name internally while fetching; if it exposes the resolved
// path on the response URL we return it, otherwise this fails.
async function resolveIpns(resource) {
    const res = await checked(resource);
    const url = res.url || "";
    if (url.startsWith("ipfs://")) {
        return "/" + url.slice("ipfs://".length);
    }
    if (url.startsWith("/ipfs/")) {
        return url;
    }
    throw new Error(`verified-fetch did not expose a resolved /ipfs path for ${resource}`);
}

window.maIpfs = { fetchBytes, fetchText, resolveIpns };
