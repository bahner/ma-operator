/// Per-key local verb registry.
///
/// `:verb` invocations on local dot-paths (`.path:verb [args]`) are
/// dispatched here. Each entry is `(path, verb)` and maps to an async
/// handler. Unknown `(path, verb)` pairs are an error.
use leptos::prelude::*;

use crate::config::EgoConfig;
use crate::state::AppState;
use crate::transport;

/// Resolve an argument that should refer to a bare `did:ma:<ipns>` (no
/// fragment, no path). Accepts either an alias name or a literal DID.
fn resolve_bare_did(arg: &str, cfg: &EgoConfig) -> Result<String, String> {
    let raw = arg.trim_start_matches('@');
    let resolved = if raw.starts_with("did:") {
        raw.to_string()
    } else {
        cfg.resolve_alias(raw)
            .map(|s| s.to_string())
            .ok_or_else(|| format!("unknown alias: @{raw}"))?
    };
    if resolved.contains('#') || resolved.contains('/') {
        return Err(format!(
            "expected bare did:ma:<ipns> (no fragment or path), got {resolved}"
        ));
    }
    Ok(resolved)
}

/// Dispatch `.path:verb args…`. Returns `Ok(())` if the verb was handled
/// (even if the underlying work is async and continues in the background).
pub fn dispatch_verb(
    path: &str,
    verb: &str,
    args: &[String],
    state: &AppState,
    config: RwSignal<EgoConfig>,
) -> Result<(), String> {
    match (path, verb) {
        (".my.identity", "publish") => {
            if args.len() != 1 {
                return Err("usage: .my.identity:publish <did-or-alias>".into());
            }
            let cfg = config.get_untracked();
            let publisher = resolve_bare_did(&args[0], &cfg)?;
            let state2 = state.clone();
            let publisher_disp = publisher.clone();
            leptos::task::spawn_local(async move {
                match transport::send_ipfs_publish(&publisher).await {
                    Ok(_msg_id) => state2
                        .push_system(format!("published DID → {publisher_disp}")),
                    Err(e) => state2.push_error(format!("publish failed: {e}")),
                }
            });
            Ok(())
        }
        _ => Err(format!("no verb `{verb}` for {path}")),
    }
}
