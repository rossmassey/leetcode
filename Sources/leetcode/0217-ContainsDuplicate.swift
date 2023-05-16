/**
 217 - Contains Duplicate - Easy
 */
struct Solution217 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = [Int:Bool]()
        for num in nums {
            if seen[num] ?? false { return true }
            seen[num] = true
        }
        return false
    }
}
