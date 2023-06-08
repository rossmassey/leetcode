/**
 242 - Valid Anagram - Easy
 
 > `k` # of unique characters
 */
public struct Solution_0242 {
    /**
     Runtime:    `O(n)`
     Space:      `O(k)`
     
     `s` and `t` are anagrams if they both have the same characters which
     occur the same number of times
     
     use dictionary returned by `characterCounts` which conforms to `Equatable`
     */
    public static func isAnagram(_ s: String, _ t: String) -> Bool {
        characterCounts(s) == characterCounts(t)
    }
    
    private static func characterCounts(_ s: String) -> [Character:Int] {
        s.reduce(into: [:]) { charactersSeen, character in
            charactersSeen[character, default: 0] += 1
        }
    }
}
