/**
 * A minimal CodeMirror 6 "legacy mode" (stream parser) for zscheme.
 *
 * zscheme is plain Scheme (S-expressions, `define`/`lambda`/`let`/`if`/...)
 * plus three natives layered on top, per rust-ma-zscheme / AGENTS.md:
 *
 *   @actor#fragment:verb   — actor reference (e.g. `@ma#room:look`, `@sky`)
 *   .my.aliases.sky        — dot-path get/set (e.g. `.my.config.k: "v"`)
 *   <bafy...>              — CID / DID literal in angle brackets, callable
 *
 * Returned token tags are `@lezer/highlight` tag names (not just the classic
 * CodeMirror-5 legacy names) — `StreamLanguage`'s `TokenTable` resolves any
 * name it doesn't recognise as a CM5 legacy alias directly against
 * `@lezer/highlight`'s `tags` object. See `@codemirror/language`'s
 * `defaultTable` for the (small) set of CM5 aliases.
 */

const KEYWORDS = new Set([
    "define", "lambda", "let", "let*", "letrec", "if", "cond", "begin",
    "and", "or", "when", "unless", "set!", "quote", "guard",
    "case", "do", "delay", "define-syntax", "let-syntax", "letrec-syntax",
    "syntax-rules", "else",
]);

const ATOMS = new Set(["#t", "#f", "#true", "#false", "nil"]);

function isDelim(ch) {
    return ch === undefined || /[\s()"'`,]/.test(ch);
}

export const zscheme = {
    startState() {
        return { inString: false };
    },

    token(stream, state) {
        if (state.inString) {
            let escaped = false;
            let ch;
            while ((ch = stream.next()) != null) {
                if (ch === '"' && !escaped) {
                    state.inString = false;
                    break;
                }
                escaped = !escaped && ch === "\\";
            }
            return "string";
        }

        if (stream.eatSpace()) return null;

        const ch = stream.peek();

        // Brackets.
        if (ch === "(" || ch === ")") {
            stream.next();
            return "bracket";
        }

        // Strings.
        if (ch === '"') {
            stream.next();
            state.inString = true;
            let escaped = false;
            let c;
            while ((c = stream.next()) != null) {
                if (c === '"' && !escaped) {
                    state.inString = false;
                    break;
                }
                escaped = !escaped && c === "\\";
            }
            return "string";
        }

        // CID / DID literal: <...> — consumed as a single unit.
        if (ch === "<") {
            stream.next();
            while (stream.peek() != null && stream.peek() !== ">") stream.next();
            if (stream.peek() === ">") stream.next();
            return "link";
        }

        // Actor reference: @actor#fragment:verb
        if (ch === "@") {
            stream.next();
            stream.eatWhile(/[^\s()"'`,]/);
            return "className";
        }

        // Bare DID literal: did:ma:...
        if (stream.match(/^did:[\w:.-]*/)) {
            return "link";
        }

        // Dot-path: .my.aliases.sky | .my.config.k: | .my.path!verb
        if (ch === "." && !/[0-9]/.test(stream.string.charAt(stream.pos + 1) || "")) {
            stream.next();
            stream.eatWhile(/[\w.\-]/);
            if (stream.peek() === "!") {
                stream.next();
                stream.eatWhile(/[\w\-]/);
            }
            if (stream.peek() === ":") stream.next();
            return "propertyName";
        }

        // Quote / quasiquote / unquote sugar.
        if (ch === "'" || ch === "`" || ch === ",") {
            stream.next();
            if (ch === "," && stream.peek() === "@") stream.next();
            return "operator";
        }

        // Numbers.
        if (stream.match(/^[+-]?(\d+\.\d*|\.\d+|\d+)([esfdl][+-]?\d+)?/i)) {
            return "number";
        }

        // Booleans / nil-ish atoms.
        for (const a of ATOMS) {
            if (stream.match(a, true)) return "atom";
        }

        // Generic symbol / identifier.
        if (!isDelim(ch)) {
            let word = "";
            while (!isDelim(stream.peek())) word += stream.next();
            return KEYWORDS.has(word) ? "keyword" : "variableName";
        }

        // Fallback — consume one char to guarantee progress.
        stream.next();
        return null;
    },

    languageData: {},
};
