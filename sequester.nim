proc seqToString(s: openarray[char]): string =
    result = newString(s.len)
    for i, chr in s:
        result[i] = chr


proc seqToString(s: openarray[uint8]): string =
    result = newString(s.len)
    for i, chr in s:
        result[i] = char(chr)


proc seqToString(s: openarray[int]): string =
    result = newString(s.len)
    for i, chr in s:
        result[i] = char(chr)


proc seqToString(s: openarray[int8]): string =
    result = newString(s.len)
    for i, chr in s:
        result[i] = char(chr)


proc seqToString(s: openarray[string]): string =
    result = newString(s.len)
    for i, chr in s:
        result[i] = chr[0]


proc stringToIntSeq(s: string): seq[int] =
    result = newSeq[int](s.len)
    for i, chr in s:
        result[i] = int(chr)


proc explode(s: string): seq[string] =
    result = newSeq[string](s.len)
    for i, chr in s:
        result[i] = newString(1)
        result[i][0] = chr


proc explode(s, delimiter: string): seq[string] =
    if delimiter.len == 0:
        return explode(s)
    result = @[]
    var buffer: seq[char] = @[]
    var look = delimiter.len - 1
    var skip = 0
    for i, chr in s:
        if skip > 0:
            skip -= 1
        elif s.substr(i, i + look) == delimiter:
            result.add(seqToString(buffer))
            buffer = @[]
            skip = look
        else:
            buffer.add(chr)
    result.add(seqToString(buffer))


proc implode(s: seq[string], delimiter = ""): string =
    var buffer: seq[char] = @[]
    var size = s.len - 1
    for i, sub in s:
        for chr in sub:
            buffer.add(chr)
        if i < size:
            for chr in delimiter:
                buffer.add(chr)
    return seqToString(buffer)
