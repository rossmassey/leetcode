/**
 3 - Longest Substring Without Repeating Characters - Medium
 
 Given a string `s`, find the length of the longest **substring** without repeating characters.
 
 A **substring** is a contiguous non-empty sequence of characters within a string.
 
 #### Constraints
 - `0 <= s.length <= 5 * 10^4`
 - `s` consists of English letters, digits, symbols and spaces.
*/
struct Solution_0003 {

    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
    
     use a dictionary `seen` to keep track of the last seen index of each character
     
     iterate over `s`, if current `letter` is found in the dictionary and its last seen index is
     greater than or equal to `start`, update `start` to be one more than the last seen index
     
     else, calculate the length of current substring (`substringLength`) from `start`
     to current `index`, and update `longestSubstring` if needed
     
     after each iteration, update the last seen index of current `letter` to the current `index`
    */
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }

        var longestSubstring = 0
        
        var start = 0
        var seen = [Character: Int]()

        for (index, letter) in s.enumerated() {
            if let seenIndex = seen[letter], start <= seenIndex {
                start = seenIndex + 1
            } else {
                let substringLength = index - start + 1
                longestSubstring = max(longestSubstring, substringLength)
            }

            seen[letter] = index
        }

        return longestSubstring
    }
}
