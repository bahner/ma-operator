/// IndexedDB storage for ego identities — implemented directly with web-sys.
///
/// Schema: db="ego" version=2  (keep name "ego" for backward compat with stored bundles)
///   store "identities": out-of-line key (username string) -> JSON string
///   store "configs":    out-of-line key (username string) -> JSON string
///   store "histories":  out-of-line key (username string) -> JSON string
use js_sys::Promise;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use wasm_bindgen_futures::JsFuture;
use web_sys::{IdbDatabase, IdbOpenDbRequest, IdbRequest, IdbTransactionMode};

use crate::state::StoredIdentity;

const DB_NAME: &str = "ego";
const DB_VERSION: u32 = 2;
const STORE_IDENTITIES: &str = "identities";
const STORE_CONFIGS: &str = "configs";
const STORE_HISTORIES: &str = "histories";

async fn open_db() -> Result<IdbDatabase, String> {
    let window = web_sys::window().ok_or_else(|| "no window".to_string())?;
    let factory = window
        .indexed_db()
        .map_err(|e| format!("{e:?}"))?
        .ok_or_else(|| "no IndexedDB".to_string())?;

    let open_req: IdbOpenDbRequest = factory
        .open_with_u32(DB_NAME, DB_VERSION)
        .map_err(|e| format!("{e:?}"))?;

    let on_upgrade = Closure::<dyn FnMut(web_sys::IdbVersionChangeEvent)>::new(
        move |evt: web_sys::IdbVersionChangeEvent| {
            let target = match evt.target() {
                Some(t) => t,
                None => return,
            };
            let req: IdbOpenDbRequest = target.unchecked_into();
            let db_val = match req.result() {
                Ok(v) => v,
                Err(_) => return,
            };
            let db: IdbDatabase = db_val.unchecked_into();
            let names = db.object_store_names();
            if !names.contains(STORE_IDENTITIES) {
                let _ = db.create_object_store(STORE_IDENTITIES);
            }
            if !names.contains(STORE_CONFIGS) {
                let _ = db.create_object_store(STORE_CONFIGS);
            }
            if !names.contains(STORE_HISTORIES) {
                let _ = db.create_object_store(STORE_HISTORIES);
            }
        },
    );
    open_req.set_onupgradeneeded(Some(on_upgrade.as_ref().unchecked_ref()));
    on_upgrade.forget();

    let db: IdbDatabase = req_to_future(open_req.as_ref()).await?.unchecked_into();
    Ok(db)
}

async fn req_to_future(req_target: &web_sys::EventTarget) -> Result<JsValue, String> {
    let req: IdbRequest = req_target.clone().unchecked_into();

    let promise = Promise::new(&mut |resolve, reject| {
        let resolve2 = resolve.clone();
        let reject2 = reject.clone();

        let req_ok = req.clone();
        let onsuccess = Closure::<dyn FnMut(_)>::new(move |_: web_sys::Event| {
            let _ = resolve2.call1(&JsValue::UNDEFINED, &req_result(&req_ok));
        });

        let req_err = req.clone();
        let onerror = Closure::<dyn FnMut(_)>::new(move |_: web_sys::Event| {
            let _ = reject2.call1(&JsValue::UNDEFINED, &req_result(&req_err));
        });

        req.set_onsuccess(Some(onsuccess.as_ref().unchecked_ref()));
        req.set_onerror(Some(onerror.as_ref().unchecked_ref()));
        onsuccess.forget();
        onerror.forget();
    });

    JsFuture::from(promise).await.map_err(|e| format!("{e:?}"))
}

fn req_result(req: &IdbRequest) -> JsValue {
    req.result().unwrap_or(JsValue::UNDEFINED)
}

pub async fn save_identity(username: &str, export_json: &str) -> Result<(), String> {
    let identity = StoredIdentity {
        username: username.to_string(),
        export_json: export_json.to_string(),
    };
    let json = serde_json::to_string(&identity).map_err(|e| e.to_string())?;
    let db = open_db().await?;

    let tx = db
        .transaction_with_str_and_mode(STORE_IDENTITIES, IdbTransactionMode::Readwrite)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_IDENTITIES)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .put_with_key(&JsValue::from_str(&json), &JsValue::from_str(username))
        .map_err(|e| format!("{e:?}"))?;
    let _ = req_to_future(req.as_ref()).await?;
    Ok(())
}

pub async fn load_identity(username: &str) -> Result<Option<StoredIdentity>, String> {
    let db = open_db().await?;
    let tx = db
        .transaction_with_str(STORE_IDENTITIES)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_IDENTITIES)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .get(&JsValue::from_str(username))
        .map_err(|e| format!("{e:?}"))?;
    let val = req_to_future(req.as_ref()).await?;
    if val.is_undefined() || val.is_null() {
        return Ok(None);
    }
    let json = val
        .as_string()
        .ok_or_else(|| "invalid value in IndexedDB".to_string())?;
    let identity: StoredIdentity = serde_json::from_str(&json).map_err(|e| e.to_string())?;
    Ok(Some(identity))
}

pub async fn save_config(username: &str, config_json: &str) -> Result<(), String> {
    let db = open_db().await?;
    let tx = db
        .transaction_with_str_and_mode(STORE_CONFIGS, IdbTransactionMode::Readwrite)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_CONFIGS)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .put_with_key(
            &JsValue::from_str(config_json),
            &JsValue::from_str(username),
        )
        .map_err(|e| format!("{e:?}"))?;
    let _ = req_to_future(req.as_ref()).await?;
    Ok(())
}

pub async fn load_config(username: &str) -> Result<Option<String>, String> {
    let db = open_db().await?;
    let tx = db
        .transaction_with_str(STORE_CONFIGS)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_CONFIGS)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .get(&JsValue::from_str(username))
        .map_err(|e| format!("{e:?}"))?;
    let val = req_to_future(req.as_ref()).await?;

    if val.is_undefined() || val.is_null() {
        return Ok(None);
    }
    val.as_string()
        .map(Some)
        .ok_or_else(|| "invalid config value in IndexedDB".to_string())
}

pub async fn save_history(username: &str, history_json: &str) -> Result<(), String> {
    let db = open_db().await?;
    let tx = db
        .transaction_with_str_and_mode(STORE_HISTORIES, IdbTransactionMode::Readwrite)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_HISTORIES)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .put_with_key(
            &JsValue::from_str(history_json),
            &JsValue::from_str(username),
        )
        .map_err(|e| format!("{e:?}"))?;
    let _ = req_to_future(req.as_ref()).await?;
    Ok(())
}

pub async fn load_history(username: &str) -> Result<Option<String>, String> {
    let db = open_db().await?;
    let tx = db
        .transaction_with_str(STORE_HISTORIES)
        .map_err(|e| format!("{e:?}"))?;
    let store = tx
        .object_store(STORE_HISTORIES)
        .map_err(|e| format!("{e:?}"))?;
    let req = store
        .get(&JsValue::from_str(username))
        .map_err(|e| format!("{e:?}"))?;
    let val = req_to_future(req.as_ref()).await?;

    if val.is_undefined() || val.is_null() {
        return Ok(None);
    }
    val.as_string()
        .map(Some)
        .ok_or_else(|| "invalid history value in IndexedDB".to_string())
}
