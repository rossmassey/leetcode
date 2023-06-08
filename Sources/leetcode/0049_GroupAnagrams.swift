/**
 49 - Group Anagrams - Medium
 
 >  `k` is max length of string
 */
public struct Solution_0049 {
    /**
     Runtime:    `O(n*k)`
     Space:      `O(n*k)`
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

