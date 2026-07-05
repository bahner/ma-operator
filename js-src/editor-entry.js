/**
 * CodeMirror 6 shim for ma-agent — SOURCE file.
 *
 * This is bundled by `bun build` into `www/editor.js` (which is committed to
 * the repo and is what actually ships). Do not edit `www/editor.js` directly
 * — edit this file and re-run `make js-bundle`.
 *
 * Exposes `window.maEditor` with:
 *   create(elId, value, language)  — mount a CM6 editor inside `document.getElementById(elId)`
 *   getValue(elId)                 — return current editor content as a string
 *   setLanguage(elId, language)    — hot-swap the language mode
 *   destroy(elId)                  — unmount and free the editor
 *
 * Language values: "plain" | "markdown" | "yaml" | "zscheme"
 *
 * CodeMirror is vendored (bundled at build time) rather than loaded from a
 * CDN at runtime. A CDN dependency (esm.sh, jsdelivr, ...) means the editor
 * silently fails to load whenever that CDN has an outage — this happened in
 * production when esm.sh's storage backend filled up and started returning
 * 500 for @codemirror/view. Bundling removes that runtime dependency
 * entirely, consistent with this project's "no backend, static files only"
 * design.
 */
import { EditorState } from "@codemirror/state";
import {
    EditorView,
    keymap,
    lineNumbers,
    highlightActiveLine,
    drawSelection,
} from "@codemirror/view";
import { defaultKeymap, history, historyKeymap } from "@codemirror/commands";
import { markdownLanguage } from "@codemirror/lang-markdown";
import { StreamLanguage, LanguageSupport, HighlightStyle, syntaxHighlighting } from "@codemirror/language";
import { tags as t } from "@lezer/highlight";
import { yaml } from "@codemirror/legacy-modes/mode/yaml";
import { zscheme } from "./zscheme-mode.js";

// Matrix-terminal themed highlight style, driven by the same CSS custom
// properties the rest of the UI uses (see style/zion.css / .my.config.colour.*)
// so syntax colours stay consistent with the user's chosen theme.
const zionHighlightStyle = HighlightStyle.define([
    { tag: t.comment, color: "var(--colour-dimmed)", fontStyle: "italic" },
    { tag: t.keyword, color: "var(--colour-text)", fontWeight: "bold" },
    { tag: [t.string, t.special(t.string)], color: "var(--colour-cursor)" },
    { tag: [t.number, t.bool, t.atom], color: "var(--colour-cursor)" },
    { tag: t.variableName, color: "var(--colour-text)" },
    { tag: t.propertyName, color: "var(--colour-alias)" },
    { tag: t.className, color: "var(--colour-alias)" },
    { tag: t.link, color: "var(--colour-alias)", textDecoration: "underline" },
    { tag: t.operator, color: "var(--colour-dimmed)" },
    { tag: t.bracket, color: "var(--colour-dimmed)" },
    { tag: t.heading, color: "var(--colour-text)", fontWeight: "bold" },
    { tag: t.strong, fontWeight: "bold" },
    { tag: t.emphasis, fontStyle: "italic" },
    { tag: t.monospace, color: "var(--colour-cursor)" },
    { tag: t.meta, color: "var(--colour-system)" },
    { tag: t.invalid, color: "var(--colour-error)" },
]);

/** Map of elId → EditorView */
const _editors = {};

function _languageExtension(lang) {
    switch (lang) {
        // Bare markdown language (no embedded HTML/JS/CSS support) — keeps
        // the bundle small. lang-markdown's markdown() helper pulls in
        // @codemirror/lang-html -> lang-javascript + lang-css + autocomplete
        // by default (for embedded <script>/<style> highlighting), which we
        // don't need for plain document editing.
        case "markdown": return [new LanguageSupport(markdownLanguage)];
        case "yaml":     return [StreamLanguage.define(yaml)];
        case "zscheme":  return [StreamLanguage.define(zscheme)];
        default:         return [];   // plain text — no lang extension
    }
}

function _baseExtensions(lang) {
    return [
        history(),
        keymap.of([...defaultKeymap, ...historyKeymap]),
        lineNumbers(),
        highlightActiveLine(),
        drawSelection(),
        syntaxHighlighting(zionHighlightStyle),
        EditorView.theme({ ".cm-content": { caretColor: "transparent" } }),
        EditorView.lineWrapping,
        ..._languageExtension(lang),
    ];
}

window.maEditor = {
    /**
     * Create a CodeMirror 6 editor inside the element with id `elId`.
     * Replaces any existing editor on the same element.
     */
    create(elId, value = "", lang = "plain") {
        if (_editors[elId]) {
            this.destroy(elId);
        }
        const parent = document.getElementById(elId);
        if (!parent) {
            console.error("maEditor.create: element not found:", elId);
            return;
        }
        const state = EditorState.create({
            doc: value,
            extensions: _baseExtensions(lang),
        });
        _editors[elId] = new EditorView({ state, parent });
    },

    /** Return the current document content of the editor. */
    getValue(elId) {
        const view = _editors[elId];
        if (!view) return "";
        return view.state.doc.toString();
    },

    /** Swap language mode without losing content. */
    setLanguage(elId, lang = "plain") {
        const view = _editors[elId];
        if (!view) return;
        const content = view.state.doc.toString();
        const newState = EditorState.create({
            doc: content,
            extensions: _baseExtensions(lang),
        });
        view.setState(newState);
    },

    /** Destroy the editor and remove it from the registry. */
    destroy(elId) {
        const view = _editors[elId];
        if (view) {
            view.destroy();
            delete _editors[elId];
        }
    },
};
