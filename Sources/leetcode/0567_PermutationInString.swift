/**
 **[Permutation in String](https://leetcode.com/problems/permutation-in-string)** - Medium
 
 Given two strings `s1` and `s2`, return true if `s2` contains a permutation of
 `s1`, or false otherwise.

 In other words, return true if one of `s1`'s permutations is the substring of
 `s2`.
 
 #### Constraints
 - `1 <= s1.length, s2.length <= 10^4`
 - `s1` and `s2` consist of lowercase English letters.
*/
public struct Solution_0567 {

    /**
     Runtime:    `O(n + (m - n))`
     Space:      `O(1)`
     
     > `n` is length of `s1` (`pattern`), `m` is length of `s2` (`text`)
    
     use a fixed-length sliding window
     
     check if each substring size of pattern has matching character frequencies
     
     use variable `matches` to store how many frequencies currently matchning,
     to avoid scanning both arrays (`O(26)`) for each window
     
     just check character added/removed from window on each iteration
    */
    public static func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // pattern should be less than or equal to length of text
        guard s1.count <= s2.count else { return false }
        
        // use `Array()` to avoid string indexing
        let pattern = Array(s1)
        let text = Array(s2)
        
        // arrays to hold count for each letter (lowercase english alphabet)
        var patternCounts = [Int](repeating: 0, count: 26)
        var windowCounts = [Int](repeating: 0, count: 26)
        
        // get counts for initial window (size of pattern)
        let windowLength = pattern.count
        for i in 0..<windowLength {
            patternCounts[characterValue(pattern[i])] += 1
            windowCounts[characterValue(text[i])] += 1
        }

        // get number of character counts matching in initial window
        var matches = (0..<26).reduce(into: 0) { sum, character in
            if patternCounts[character] == windowCounts[character] {
                sum += 1
            }
        }

        let finalWindowStart = text.count - windowLength

        // check all substrigns size of pattern by sliding fixed length window
        for left in 0..<finalWindowStart {
            // check if previous window had all 26 characters matching
            if matches == 26 { break }
            
            let leftIndex = characterValue(text[left])
            let rightIndex = characterValue(text[left + windowLength])

            // if counts were previously the same, no longer will be, so decrement matches
            if windowCounts[leftIndex] == patternCounts[leftIndex] { matches -= 1 }
            if windowCounts[rightIndex] == patternCounts[rightIndex] { matches -= 1 }

            // left character is removed from window, right is added
            windowCounts[leftIndex] -= 1
            windowCounts[rightIndex] += 1

            // compare new counts for matches
            if windowCounts[leftIndex] == patternCounts[leftIndex] { matches += 1 }
            if windowCounts[rightIndex] == patternCounts[rightIndex] { matches += 1 }
        }
        
        //  pattern is a permutation of previous window if the counts are all matching
        return matches == 26
    }

    /**
     Converts a lowercase english alphabet letter to numeric value in [0, 26)

     - Parameter char: character to get index of
     - Returns: ascii value of character offset by "a"
     - Precondition: `char` is in "a"..."z"
     */
    static private func characterValue(_ char: Character) -> Int {
        Int(char.asciiValue! - Character("a").asciiValue!)
    }
}
