/**
 * CodeMirror 6 shim for ma-agent.
 *
 * Exposes `window.maEditor` with:
 *   create(elId, value, language)  — mount a CM6 editor inside `document.getElementById(elId)`
 *   getValue(elId)                 — return current editor content as a string
 *   setLanguage(elId, language)    — hot-swap the language mode
 *   destroy(elId)                  — unmount and free the editor
 *
 * Language values: "plain" | "markdown" | "yaml"
 *
 * Loaded as <script type="module"> so it runs after DOM is ready and avoids
 * polluting the global scope beyond the single `window.maEditor` export.
 */

import { EditorState } from "https://esm.sh/@codemirror/state@6";
import { EditorView, keymap, lineNumbers, highlightActiveLine } from "https://esm.sh/@codemirror/view@6";
import { defaultKeymap, history, historyKeymap } from "https://esm.sh/@codemirror/commands@6";
import { markdown } from "https://esm.sh/@codemirror/lang-markdown@6";
import { StreamLanguage } from "https://esm.sh/@codemirror/language@6";
import { yaml } from "https://esm.sh/@codemirror/legacy-modes/mode/yaml@6";

/** Map of elId → EditorView */
const _editors = {};

function _languageExtension(lang) {
    switch (lang) {
        case "markdown": return [markdown()];
        case "yaml":     return [StreamLanguage.define(yaml)];
        default:         return [];   // plain text — no lang extension
    }
}

function _baseExtensions(lang) {
    return [
        history(),
        keymap.of([...defaultKeymap, ...historyKeymap]),
        lineNumbers(),
        highlightActiveLine(),
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
