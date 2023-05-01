/**
    242 - Valid Anagram - Easy
    
    Runtime:    O(n)
    Space:      O(k), k # of unique characters
    
*/
struct Solution242 {
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        characterCounts(s) == characterCounts(t)
    }
    
    private static func characterCounts(_ s: String) -> [Character:Int] {
        s.reduce(into: [:]) {$0[$1, default: 0] += 1}
    }
}
