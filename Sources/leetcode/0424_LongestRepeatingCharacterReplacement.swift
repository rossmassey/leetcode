/**
 **[Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement)** - Medium
 
 You are given a string `s` and an integer `k`. You can choose any character of 
 the string and change it to any other uppercase English character. You can
 perform this operation at most `k` times.

 Return the length of the longest substring containing the same letter you can 
 get after performing the above operations.
 
 #### Constraints
 - `1 <= s.length <= 10^5`
 - `s` consists of only uppercase English letters.
 - `0 <= k <= s.length`
*/
public struct Solution_0424 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     use sliding window, keeping track of chracter counts each time it moves
     with a dictionary
     
     finding the character with highest frequency in dictionary is `O(26)`,
     since the string only consists of upper case English letters
     
     valid substring is one where `k` characters can be replaced to match the
     most frequent character (`substringLength - mostFrequent <= k`)
    */
    public static func characterReplacement(_ s: String, _ k: Int) -> Int {
        let array = Array(s)
        var counts = [Character: Int]()
        var longestSubstring = 0
        
        // sliding window
        var left = 0, right = 0

        while right < array.count {
            counts[array[right], default: 0] += 1
            let mostFrequent = counts.values.max() ?? 0 // O(26)
            var substringLength = right - left + 1

            // move left pointer forward if need to replace more than `k`
            while substringLength - mostFrequent > k {
                counts[array[left], default: 0] -= 1
                left += 1
                substringLength -= 1
            }
 
            longestSubstring = max(longestSubstring, substringLength)
            right += 1
        }
        
        return longestSubstring
    }
}
