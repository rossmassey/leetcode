/**
    271 - Encode And Decode Strings - Medium
    
    Runtime:    O(n)
    Spacetime:  O(n)

    `strs[i] < 200` so we can assume all unicode representations of length will be one character (UTF8 context)
    unicode provide easy access to underlying value (`Character.asciiValue` only goes up to 127)
    e.g. `str.count == 65` => `'A'`
    note 0-32 are non-printable control characters (but will still be read in), can add/subtract 33 for debug purpose
    when decoding, use first character to determine length of following string, which can consist of any character
*/
struct Solution271 {
    static func encode(_ strs: [String]) -> String {
        strs.reduce(into: "") { encodedStr, str in
            let length = UnicodeScalar(str.count)!
            encodedStr.append("\(length)\(str)")
        }
    }
    
    static func decode(_ s: String) -> [String] {
        var output = [String]()
        let characters = Array(s)
        
        var i = 0
        while i < characters.count {
            let unicode = characters[i].unicodeScalars.first!
            let length = Int(unicode.value)
            i += 1
            output.append(String(characters[i..<(i + length)]))
            i += length
        }
        
        return output
    }
}
