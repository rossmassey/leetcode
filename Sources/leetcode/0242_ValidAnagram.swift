/**
 **[Valid Anagram](https://leetcode.com/problems/valid-anagram/)** - Easy
 
 Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, 
 and `false` otherwise.

 An **Anagram** is a word or phrase formed by rearranging the letters of a 
 different word or phrase, typically using all the original letters exactly once.
 
 #### Constraints
 - `1 <= s.length, t.length <= 5 * 10^4`
 - `s` and `t` consist of lowercase English letters.
 */
public struct Solution_0242 {
    /**
     Runtime:    `O(n)`
     Space:      `O(k)`
     
     > `k` # of unique characters
     
     `s` and `t` are anagrams if they both have the same characters which
     occur the same number of times
     
     use dictionary returned by `characterCounts` which conforms to `Equatable`
     */
    public static func isAnagram(_ s: String, _ t: String) -> Bool {
        characterCounts(s) == characterCounts(t)
    }
    
    private static func characterCounts(_ s: String) -> [Character: Int] {
        s.reduce(into: [:]) { charactersSeen, character in
            charactersSeen[character, default: 0] += 1
        }
    }
}
