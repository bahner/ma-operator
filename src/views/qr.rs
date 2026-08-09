/// QR generation and camera-based scanning for profile export/import.
use qrcode::render::svg;
use qrcode::{EcLevel, QrCode};
use wasm_bindgen::{JsCast, JsValue};
use wasm_bindgen_futures::JsFuture;
use web_sys::{
    CanvasRenderingContext2d, HtmlCanvasElement, HtmlVideoElement, MediaStream,
    MediaStreamConstraints,
};

/// Largest payload that fits a version-40 QR code at EC level L.
const QR_MAX_BYTES: usize = 2953;

pub enum QrGenError {
    TooLarge,
    Encode(String),
}

pub enum QrScanResult {
    WaitingForVideo,
    CaptureError,
    NoCode,
    Unreadable,
    Decoded(Vec<u8>),
}

pub fn did_payload(bytes: &[u8]) -> Option<String> {
    let value = std::str::from_utf8(bytes).ok()?.trim();
    if value.contains('#') || ma_core::Did::try_from(value).is_err() {
        return None;
    }
    Some(value.to_string())
}

pub struct NativeQrDetector(JsValue);

impl NativeQrDetector {
    pub fn new() -> Option<Self> {
        let window = web_sys::window()?;
        let constructor =
            js_sys::Reflect::get(&window, &JsValue::from_str("BarcodeDetector")).ok()?;
        let constructor = constructor.dyn_into::<js_sys::Function>().ok()?;
        let formats = js_sys::Array::new();
        formats.push(&JsValue::from_str("qr_code"));
        let options = js_sys::Object::new();
        js_sys::Reflect::set(&options, &JsValue::from_str("formats"), &formats).ok()?;
        let arguments = js_sys::Array::new();
        arguments.push(&options);
        js_sys::Reflect::construct(&constructor, &arguments)
            .ok()
            .map(Self)
    }

    pub async fn decode(&self, video: &HtmlVideoElement) -> Result<QrScanResult, String> {
        let detect = js_sys::Reflect::get(&self.0, &JsValue::from_str("detect"))
            .map_err(js_err)?
            .dyn_into::<js_sys::Function>()
            .map_err(js_err)?;
        let arguments = js_sys::Array::new();
        arguments.push(video);
        let promise = detect
            .apply(&self.0, &arguments)
            .map_err(js_err)?
            .dyn_into::<js_sys::Promise>()
            .map_err(js_err)?;
        let detected = JsFuture::from(promise).await.map_err(js_err)?;
        let detected = js_sys::Array::from(&detected);
        if detected.length() == 0 {
            return Ok(QrScanResult::NoCode);
        }
        for barcode in detected.iter() {
            if let Ok(raw_value) = js_sys::Reflect::get(&barcode, &JsValue::from_str("rawValue")) {
                if let Some(content) = raw_value.as_string() {
                    if !content.is_empty() {
                        return Ok(QrScanResult::Decoded(content.into_bytes()));
                    }
                }
            }
        }
        Ok(QrScanResult::Unreadable)
    }
}

/// Render `payload` as an SVG QR code (black on white, quiet zone included).
pub fn generate_qr_svg(payload: &str) -> Result<String, QrGenError> {
    if payload.len() > QR_MAX_BYTES {
        return Err(QrGenError::TooLarge);
    }
    // Prefer EC level M; fall back to L for payloads near the size limit.
    let code = QrCode::with_error_correction_level(payload.as_bytes(), EcLevel::M)
        .or_else(|_| QrCode::with_error_correction_level(payload.as_bytes(), EcLevel::L))
        .map_err(|e| match e {
            qrcode::types::QrError::DataTooLong => QrGenError::TooLarge,
            other => QrGenError::Encode(other.to_string()),
        })?;
    Ok(code
        .render::<svg::Color>()
        .min_dimensions(640, 640)
        .dark_color(svg::Color("#000000"))
        .light_color(svg::Color("#ffffff"))
        .build())
}

fn js_err(e: JsValue) -> String {
    e.as_string().unwrap_or_else(|| format!("{e:?}"))
}

/// Request camera access and attach the stream to `video`.
pub async fn open_camera(video: &HtmlVideoElement) -> Result<MediaStream, String> {
    let window = web_sys::window().ok_or("no window")?;
    let devices = window.navigator().media_devices().map_err(js_err)?;
    let constraints = MediaStreamConstraints::new();
    let video_constraints = js_sys::Object::new();
    let facing_mode = js_sys::Object::new();
    js_sys::Reflect::set(
        &facing_mode,
        &JsValue::from_str("ideal"),
        &JsValue::from_str("environment"),
    )
    .map_err(js_err)?;
    let width = js_sys::Object::new();
    js_sys::Reflect::set(
        &width,
        &JsValue::from_str("ideal"),
        &JsValue::from_f64(1920.0),
    )
    .map_err(js_err)?;
    let height = js_sys::Object::new();
    js_sys::Reflect::set(
        &height,
        &JsValue::from_str("ideal"),
        &JsValue::from_f64(1080.0),
    )
    .map_err(js_err)?;
    js_sys::Reflect::set(
        &video_constraints,
        &JsValue::from_str("facingMode"),
        &facing_mode,
    )
    .map_err(js_err)?;
    js_sys::Reflect::set(&video_constraints, &JsValue::from_str("width"), &width)
        .map_err(js_err)?;
    js_sys::Reflect::set(&video_constraints, &JsValue::from_str("height"), &height)
        .map_err(js_err)?;
    constraints.set_video(&video_constraints);
    constraints.set_audio(&JsValue::FALSE);
    let promise = devices
        .get_user_media_with_constraints(&constraints)
        .map_err(js_err)?;
    let stream: MediaStream = JsFuture::from(promise)
        .await
        .map_err(js_err)?
        .dyn_into()
        .map_err(js_err)?;
    video.set_src_object(Some(&stream));
    if let Ok(play) = video.play() {
        let _ = JsFuture::from(play).await;
    }
    Ok(stream)
}

/// Stop all tracks so the camera indicator turns off.
pub fn close_camera(stream: &MediaStream) {
    for track in stream.get_tracks().iter() {
        if let Ok(track) = track.dyn_into::<web_sys::MediaStreamTrack>() {
            track.stop();
        }
    }
}

/// Grab the current video frame and report whether a QR grid can be decoded.
pub fn try_decode_frame(video: &HtmlVideoElement) -> QrScanResult {
    let vw = video.video_width();
    let vh = video.video_height();
    if vw == 0 || vh == 0 {
        return QrScanResult::WaitingForVideo;
    }
    // Dense profile codes need enough pixels per module when they fill only part of the frame.
    let scale = if vw > 800 { 800.0 / f64::from(vw) } else { 1.0 };
    let w = (f64::from(vw) * scale) as u32;
    let h = (f64::from(vh) * scale) as u32;

    let Some(document) = web_sys::window().and_then(|window| window.document()) else {
        return QrScanResult::CaptureError;
    };
    let Ok(canvas) = document.create_element("canvas") else {
        return QrScanResult::CaptureError;
    };
    let Ok(canvas) = canvas.dyn_into::<HtmlCanvasElement>() else {
        return QrScanResult::CaptureError;
    };
    canvas.set_width(w);
    canvas.set_height(h);
    let Ok(Some(ctx)) = canvas.get_context("2d") else {
        return QrScanResult::CaptureError;
    };
    let Ok(ctx) = ctx.dyn_into::<CanvasRenderingContext2d>() else {
        return QrScanResult::CaptureError;
    };
    if ctx
        .draw_image_with_html_video_element_and_dw_and_dh(video, 0.0, 0.0, f64::from(w), f64::from(h))
        .is_err()
    {
        return QrScanResult::CaptureError;
    }
    let Ok(image) = ctx.get_image_data(0.0, 0.0, f64::from(w), f64::from(h)) else {
        return QrScanResult::CaptureError;
    };
    let rgba = image.data();

    let luma: Vec<u8> = rgba
        .chunks_exact(4)
        .map(|p| ((u16::from(p[0]) + u16::from(p[1]) + u16::from(p[2])) / 3) as u8)
        .collect();
    decode_camera_frame(w as usize, h as usize, &luma)
}

fn decode_camera_frame(w: usize, h: usize, luma: &[u8]) -> QrScanResult {
    let crop_w = w * 4 / 5;
    let crop_h = h * 4 / 5;
    let offset_x = (w - crop_w) / 2;
    let offset_y = (h - crop_h) / 2;
    let mut crop = Vec::with_capacity(crop_w * crop_h);
    for y in offset_y..offset_y + crop_h {
        crop.extend_from_slice(&luma[y * w + offset_x..y * w + offset_x + crop_w]);
    }

    match decode_greyscale(crop_w, crop_h, &crop) {
        QrScanResult::NoCode => decode_greyscale(w, h, luma),
        result => result,
    }
}

fn decode_greyscale(w: usize, h: usize, luma: &[u8]) -> QrScanResult {
    let mut prepared = rqrr::PreparedImage::prepare_from_greyscale(w, h, |x, y| luma[y * w + x]);
    let grids = prepared.detect_grids();
    if grids.is_empty() {
        return QrScanResult::NoCode;
    }
    for grid in grids {
        if let Ok((_meta, content)) = grid.decode() {
            return QrScanResult::Decoded(content.into_bytes());
        }
    }
    QrScanResult::Unreadable
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn did_export_fits_qr() {
        let (_, identity) = crate::identity::export::create_identity("testuser", "pw")
            .expect("create_identity failed");
        assert!(generate_qr_svg(&identity.sender_did).is_ok());
    }

    #[test]
    fn did_qr_decodes() {
        let (_, identity) = crate::identity::export::create_identity("testuser", "pw")
            .expect("create_identity failed");
        let payload = identity.sender_did;
        let code = QrCode::with_error_correction_level(payload.as_bytes(), EcLevel::M)
            .expect("profile payload should fit");
        let quiet_zone = 4;
        let scale = 4;
        let modules = code.width();
        let size = (modules + quiet_zone * 2) * scale;
        let mut pixels = vec![255; size * size];
        for y in 0..modules {
            for x in 0..modules {
                if code[(x, y)] == qrcode::Color::Dark {
                    for py in 0..scale {
                        for px in 0..scale {
                            let rx = (x + quiet_zone) * scale + px;
                            let ry = (y + quiet_zone) * scale + py;
                            pixels[ry * size + rx] = 0;
                        }
                    }
                }
            }
        }

        let QrScanResult::Decoded(decoded) = decode_greyscale(size, size, &pixels) else {
            panic!("generated profile QR was not decoded");
        };
        assert_eq!(decoded, payload.as_bytes());
    }

    #[test]
    fn did_qr_decodes_from_centre_of_camera_frame() {
        let (_, identity) = crate::identity::export::create_identity("testuser", "pw")
            .expect("create_identity failed");
        let payload = identity.sender_did;
        let code = QrCode::with_error_correction_level(payload.as_bytes(), EcLevel::M)
            .expect("profile payload should fit");
        let quiet_zone = 4;
        let scale = 4;
        let modules = code.width();
        let qr_size = (modules + quiet_zone * 2) * scale;
        let frame_w = qr_size * 2;
        let frame_h = qr_size * 3 / 2;
        let offset_x = (frame_w - qr_size) / 2;
        let offset_y = (frame_h - qr_size) / 2;
        let mut pixels = vec![210; frame_w * frame_h];
        for y in 0..modules {
            for x in 0..modules {
                let colour = if code[(x, y)] == qrcode::Color::Dark {
                    10
                } else {
                    245
                };
                for py in 0..scale {
                    for px in 0..scale {
                        let rx = offset_x + (x + quiet_zone) * scale + px;
                        let ry = offset_y + (y + quiet_zone) * scale + py;
                        pixels[ry * frame_w + rx] = colour;
                    }
                }
            }
        }

        let QrScanResult::Decoded(decoded) = decode_camera_frame(frame_w, frame_h, &pixels) else {
            panic!("profile QR in a camera-sized frame was not decoded");
        };
        assert_eq!(decoded, payload.as_bytes());
    }

    #[test]
    fn did_payload_accepts_only_bare_dids() {
        let did = format!(
            "did:ma:{}",
            ma_core::ipns_from_secret([1; 32]).expect("test IPNS identifier")
        );
        assert_eq!(did_payload(did.as_bytes()), Some(did.clone()));
        assert!(did_payload(format!("{did}#room").as_bytes()).is_none());
        assert!(did_payload(b"hello").is_none());
    }
}
