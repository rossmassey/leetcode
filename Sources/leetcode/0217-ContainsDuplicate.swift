/**
    217 - Contains Duplicate - Easy
    
    Runtime:    `O(n)`
    Space:      `O(n)`
    
*/
struct Solution217 {
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = [Int:Bool]()
        for num in nums {
            if seen[num] ?? false { return true }
            seen[num] = true
        }
        return false
    }
}
