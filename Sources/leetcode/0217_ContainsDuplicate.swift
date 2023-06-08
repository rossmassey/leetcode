/**
 217 - Contains Duplicate - Easy
 */
public struct Solution_0217 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = [Int:Bool]()
        for num in nums {
            if seen[num] ?? false { return true }
            seen[num] = true
        }
        return false
    }
}
