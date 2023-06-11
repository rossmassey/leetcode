/**
 217 - Contains Duplicate - Easy
 
 Given an integer array `nums`, return `true` if any value appears 
 **at least twice** in the array, and return `false` if every element is distinct.
 
 #### Constraints
 - `1 <= nums.length <= 10^5`
 - `-10^9 <= nums[i] <= 10^9`
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
