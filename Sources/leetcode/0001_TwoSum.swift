/**
 1 - Two Sum - Easy

 Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.
 
 You may assume that each input would have **exactly one solution**, and you may not use the same element twice.
 
 You can return the answer in any order.
 
 #### Examples
 
 ```
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 ```
 
 ```
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 ```
 
 ```
 Input: nums = [3,3], target = 6
 Output: [0,1]
 ```
 
 #### Constraints
 ```
 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 
 Only one valid answer exists.
 ```
 
 #### Approach
 
 Can just use a dictionary to store elements we have seen already, to allow
 one pass through the array to check for values summing to `target`
 
 > Note: TODO, add this overview to all solutions?
 
 */
public struct Solution_0001 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count != 2 else { return [0,1] }
        
        var indexOfComplements = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let otherIndex = indexOfComplements[num] {
                return [index, otherIndex]
            }
            indexOfComplements[target - num] = index
        }
        return [-1,-1]
    }
}
