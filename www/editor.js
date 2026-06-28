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
 * NOTE: `import` declarations in ES modules must come before any other
 * statements, so we cannot define synchronous stubs before static imports.
 * Instead we use dynamic import() calls inside an async IIFE — the stubs are
 * registered synchronously (before any network requests start) and replaced
 * in-place once CM6 resolves.
 */

// ── Synchronous stubs (safe no-ops until CM6 loads) ───────────────────────
window.maEditor = {
    create()      {},
    getValue()    { return ""; },
    setLanguage() {},
    destroy()     {},
};

// ── Async CM6 load ────────────────────────────────────────────────────────
(async () => {
    const { EditorState } = await import("https://esm.sh/@codemirror/state@6");
    const { EditorView, keymap, lineNumbers, highlightActiveLine, drawSelection } =
        await import("https://esm.sh/@codemirror/view@6");
    const { defaultKeymap, history, historyKeymap } =
        await import("https://esm.sh/@codemirror/commands@6");
    const { markdown } = await import("https://esm.sh/@codemirror/lang-markdown@6");
    const { StreamLanguage } = await import("https://esm.sh/@codemirror/language@6");
    const { yaml }   = await import("https://esm.sh/@codemirror/legacy-modes/mode/yaml");
    const { scheme } = await import("https://esm.sh/@codemirror/legacy-modes/mode/scheme");

    /** Map of elId → EditorView */
    const _editors = {};

    function _languageExtension(lang) {
        switch (lang) {
            case "markdown": return [markdown()];
            case "yaml":     return [StreamLanguage.define(yaml)];
            case "scheme":   return [StreamLanguage.define(scheme)];
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
            EditorView.theme({ ".cm-content": { caretColor: "transparent" } }),
            EditorView.lineWrapping,
            ..._languageExtension(lang),
        ];
    }

    // Replace stubs with real implementations once CM6 has loaded.
    Object.assign(window.maEditor, {
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
    });
})();
