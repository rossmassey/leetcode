/**
 **[Group Anagrams](https://leetcode.com/problems/group-anagrams/)** - Medium
 
 Given an array of strings `strs`, group **the anagrams** together. You can 
 return the answer in **any order.**

 An **Anagram** is a word or phrase formed by rearranging the letters of a 
 different word or phrase, typically using all the original letters exactly once.
 
 #### Constraints
 - `1 <= strs.length <= 10^4`
 - `0 <= strs[i].length <= 100`
 - `strs[i]` consists of lowercase English letters.
 */
public struct Solution_0049 {
    /**
     Runtime:    `O(n*k)`
     Space:      `O(n*k)`
     
     >  `k` is max length of string
     */
    public static func groupAnagrams(_ strs: [String]) -> [[String]] {
        let asciiStart = Character("a").asciiValue!
        
        var answer = [[Int]:[String]]()
        for s in strs {
            var count = Array(repeating: 0, count: 26)
            for character in s {
                count[Int(character.asciiValue! - asciiStart)] += 1
            }
            answer[count, default: []].append(s)
        }
        return answer.map { $0.value }
    }
}

