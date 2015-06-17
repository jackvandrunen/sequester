## Lightweight library for the Nim language that contains procedures to convert
## between sequences and strings. Additionally includes PHP-inspired ``explode``
## and ``implode`` procedures.
##
## Written by Jack VanDrunen and distributed under the terms of the ISC license.


proc asString*(s: openarray[char]): string {.noSideEffect, procvar.} =
    ## Convert a sequence to a string.
    result = newString(s.len)
    for i, chr in s:
        result[i] = chr


proc asString*(s: openarray[uint8]): string {.noSideEffect, procvar.} =
    result = newString(s.len)
    for i, chr in s:
        result[i] = char(chr)


proc asString*(s: openarray[int]): string {.noSideEffect, procvar.} =
    result = newString(s.len)
    for i, chr in s:
        result[i] = char(chr)


proc explode*(s: string, delimiter = ""): seq[string] {.noSideEffect, procvar.} =
    ## Split a string at non-overlapping occurrences of the given delimiter.
    if delimiter.len == 0:
        result = newSeq[string](s.len)
        for i, chr in s:
            result[i] = newString(1)
            result[i][0] = chr
    else:
        result = @[]
        var buffer: seq[char] = @[]
        var look = delimiter.len - 1
        var skip = 0
        for i, chr in s:
            if skip > 0:
                skip -= 1
            elif s.substr(i, i + look) == delimiter:
                result.add(asString(buffer))
                buffer = @[]
                skip = look
            else:
                buffer.add(chr)
        result.add(asString(buffer))


proc implode*(s: openarray[string], separator = ""): string {.noSideEffect, procvar.} =
    ## Join a sequence, inserting the given separator in between substrings.
    var buffer: seq[char] = @[]
    var size = s.len - 1
    for i, sub in s:
        for chr in sub:
            buffer.add(chr)
        if i < size:
            for chr in separator:
                buffer.add(chr)
    return asString(buffer)
