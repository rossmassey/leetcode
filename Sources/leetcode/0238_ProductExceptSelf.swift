/**
 **[Product Except Self](https://leetcode.com/problems/product-of-array-except-self/)** - Medium
 
 Given an integer array `nums`, return an array `answer` such that `answer[i]` 
 is equal to the product of all the elements of `nums` except `nums[i]`.
 
 #### Constraints
 - `2 <= nums.length <= 10^5`
 - `-30 <= nums[i] <= 30`
 - The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.
 */
public struct Solution_0238 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 1, count: nums.count)
        
        var leftProduct = 1
        for i in 0..<nums.count {
            result[i] *= leftProduct
            leftProduct *= nums[i]
        }
        
        var rightProduct = 1
        for i in (0..<nums.count).reversed() {
            result[i] *= rightProduct
            rightProduct *= nums[i]
        }
        
        return result
    }
}
