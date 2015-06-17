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

    proc asString*(s: openarray[char]): string

    proc asString*(s: openarray[uint8]): string

    proc asString*(s: openarray[int]): string

    proc explode*(s: string; delimiter = ""): seq[string]

    proc implode*(s: openarray[string]; separator = ""): string
