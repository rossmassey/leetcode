/**
    242 - Valid Anagram - Easy
    
    Runtime:    `O(n)`
    Space:      `O(k)`, `k` # of unique characters
 
    `s` and `t` are anagrams if they both have the same characters which
    occur the same number of times
 
    use a dictionary returned by `characterCounts` which conforms to `Equatable`
    
*/
struct Solution242 {
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        characterCounts(s) == characterCounts(t)
    }
    
    private static func characterCounts(_ s: String) -> [Character:Int] {
        s.reduce(into: [:]) { charactersSeen, character in
            charactersSeen[character, default: 0] += 1
        }
    }
}