/**
 49 - Group Anagrams - Medium
 */
struct Solution49 {
    /**
     Runtime:    `O(n*k)`, `k` is max length of string
     Space:      `O(n*k)`
     */
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
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

