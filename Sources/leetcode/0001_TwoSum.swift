/**
 1 - Two Sum - Easy

 Given an array of integers `nums` and an integer `target`, return indices of 
 the two numbers such that they add up to target.
 
 You may assume that each input would have **exactly one solution**, and you may 
 not use the same element twice.
 
 You can return the answer in any order.
 
 #### Constraints
 - `2 <= nums.length <= 10^4`
 - `-10^9 <= nums[i] <= 10^9`
 - `-10^9 <= target <= 10^9`
 - Only one valid answer exists.
 */
public struct Solution_0001 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     
     use a dictionary `indexOfComplements` to store potential complements
     (difference of `target` and current `num`) and their indices
     
     iterate over `nums`, if current `num` is found in the dictionary,
     return its `index` along with the `otherIndex` from the dictionary,
     which will be two indices whose elements add up to the `target`
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
