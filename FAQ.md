# Zion FAQ

## Why does a bare name not evaluate as Scheme?

Zion shares one prompt between terminal commands and Scheme. A bare line such
as `foo` is therefore terminal input, not a Scheme expression. Put Scheme in
parentheses:

```scheme
(begin foo)
```

`begin` does not load the Scheme environment. It evaluates its contents and
returns the final value. Use it to inspect a variable without calling it.

```scheme
(foo)        ; call foo as a procedure
(begin foo)  ; evaluate and display foo's value
```

## Why does `(foo)` say that a value is not a procedure?

The first position in a parenthesised form is a procedure position. If `foo`
is bound to `bar`, then `(foo)` tries to call `bar`. To read the value, use
`(begin foo)` instead.

## How do I save Scheme source in `.my.z.scheme` from the prompt?

A plain setter stores its text literally, including quotation marks. Use a
Scheme expression that returns the source text:

```scheme
.my.z.scheme: (quote "(define foo 'bar)")
.my.z.scheme!eval
(begin foo)
```

The first line stores `(define foo 'bar)` without the surrounding quotation
marks. The second line rebuilds the current Scheme session from `.my.z.scheme`
and `.my.z.avatar`.

The same expansion and CRUD rules apply to every local configuration path;
`.my.z.scheme` and `.my.z.avatar` have no special storage behaviour.

## Why did `(display "some text")` delete my key?

`display` writes text to the terminal but returns `nil`. In a setter,
`nil` expands to an empty value:

```scheme
.my.note: (display "some text")
```

This becomes an empty setter and therefore deletes `.my.note`. To store a
computed value, the expression itself must return a string:

```scheme
.my.note: (string-append "some" " text")
```

## What is the difference between `ipfs-cat` and `include`?

`ipfs-cat` fetches content and returns it as text. This makes it suitable for
storing fetched source in a local key:

```scheme
.my.z.scheme: (ipfs-cat #/ipfs/<cid>)
```

`include` fetches and evaluates Scheme source immediately. It normally returns
`nil`, so it is appropriate inside source that is being evaluated, not as the
value of a setter:

```scheme
(include #/ipfs/<cid>)
```

There must be a space between the primitive name and its argument:

```scheme
(ipfs-cat #/ipfs/<cid>)
```

`(ipfs-cat#/ipfs/<cid>)` is one unknown symbol, not an `ipfs-cat` call.

## Why is successful `include` silent?

`include`, `define`, `display`, and `newline` have effects but return `nil`.
Zion deliberately suppresses successful `nil` output, so the terminal does not
fill with `()` lines. Errors still appear in red.

## What does `.my.z.scheme!eval` do, and why can it take a moment?

`.my.z.scheme!eval` builds a fresh Scheme session by evaluating the saved
`.my.z.scheme` source followed by `.my.z.avatar`. It stays dark green while remote
content is loading, turns bright green on success, and turns red with the
bootstrap error on failure.

It does not print the values of `define` or `include` forms. Verify a loaded
binding with a Scheme expression such as `(begin foo)`.
