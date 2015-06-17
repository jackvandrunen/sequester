# Sequester

    $ nimble install sequester

Sequester is a lightweight library for the Nim language that contains procedures
to convert between sequences and strings. Additionally, it includes PHP-inspired
`explode` and `implode` procedures.

## Quick Docs

Complete documentation can be generated with the command `nim doc
sequester.nim`, or found at
[http://fallingduck.net/docs/sequester](http://fallingduck.net/docs/sequester).

The following procedures are exported:

    proc asString*(s: openarray[char]): string {.noSideEffect, procvar.}

    proc asString*(s: openarray[uint8]): string {.noSideEffect, procvar.}

    proc asString*(s: openarray[int]): string {.noSideEffect, procvar.}

    proc asString*(s: openarray[int8]): string {.noSideEffect, procvar.}

    proc asIntSeq*(s: string): seq[int] {.noSideEffect, procvar.}

    proc explode*(s: string; delimiter = ""): seq[string] {.noSideEffect,
        procvar.}

    proc implode*(s: openarray[string]; separator = ""): string {.noSideEffect,
        procvar.}

    iterator intItems*(s: string): int {.noSideEffect.}
