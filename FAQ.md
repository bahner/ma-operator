# Operator FAQ

## Why does a bare name not evaluate as Scheme?

Operator shares one prompt between terminal commands and Scheme. A bare line such
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

## How do I save Scheme source in `.z.scheme` from the prompt?

A plain setter stores its text literally, including quotation marks. Use a
Scheme expression that returns the source text:

```scheme
.z.scheme: (quote "(define foo 'bar)")
.z.scheme!eval
(begin foo)
```

The first line stores `(define foo 'bar)` without the surrounding quotation
marks. The second line runs the saved `.z.scheme` script as normal `!eval`.

The same expansion and CRUD rules apply to every local configuration path;
`.z.scheme` has no special storage behaviour. Everything under `.z` is an
explicitly publishable script collection, so it must not contain secrets.

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
.z.scheme: (ipfs-cat #/ipfs/<cid>)
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
Operator deliberately suppresses successful `nil` output, so the terminal does not
fill with `()` lines. Errors still appear in red.

## What does `.z.scheme!eval` do, and why can it take a moment?

`.z.scheme!eval` runs the saved `.z.scheme` source as a normal Operator
script. The command stays dark green while remote content is loading, turns bright
green on success, and turns red with the bootstrap error on failure.

Giving `!eval` a content path combines fetch and eval explicitly:

```text
.z.foo!eval /ipfs/<cid>
```

Operator fetches the source, persistently creates or replaces `.z.foo`, and then
evaluates the stored value.  If fetching or persistence fails, evaluation does
not start.  If evaluation fails, the newly fetched `.z.foo` remains saved.
Use `.z.foo!fetch /ipfs/<cid>` to fetch and save without executing.

It does not print the values of `define` or `include` forms. Verify a loaded
binding with a Scheme expression such as `(begin foo)`.

## Is a trailing newline required in saved eval source?

Yes. Any source executed via `!eval` should end with a trailing newline.
Missing trailing newline is invalid source data, because line-oriented flows
can otherwise drop or delay the last logical line.

## How do I give my avatar a favicon and a sprite?

Set config links under `.my.sprites` that point at IPFS objects:

```text
.my.sprites.favicon: /ipfs/<cid>   # a multi-size .ico (16/32/48)
.my.sprites.32x32:   /ipfs/<cid>   # a 4x4 32x32 Godot sprite sheet
```

Both are plain object references — operator stores the link, not the image.
On publish, every `.my.sprites.*` link is embedded in the DID document as an
IPLD link under `ma.sprites`, so another client can fetch it directly with
`ipfs dag get /ipns/<did>/ma/sprites/32x32`.
The favicon is a `.ico` file containing 16x16, 32x32, and 48x48 avatar
images. The sprite is a 128x128 PNG sprite sheet laid out as a 4x4 grid of
32x32 frames:

| Axis | Meaning |
|------|---------|
| Row 0 | walk down |
| Row 1 | walk left |
| Row 2 | walk right |
| Row 3 | walk up |
| Column 0 | standing / neutral |
| Column 1 | first walking step |
| Column 2 | standing / neutral |
| Column 3 | second walking step |

The sheet must be true pixel art (1 artwork pixel = 1 PNG pixel), have a
transparent background, and contain no anti-aliasing, interpolation, padding,
text, labels, or grid lines. See the avatar visual-assets spec in the ma-spec
runtime documents for the full requirements.
