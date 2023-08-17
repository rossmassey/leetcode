/**
 **[Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)** - Medium
 
 Given an array of integers nums containing `n + 1` integers where each integer
 is in the range `[1, n]` inclusive.

 There is **only one repeated number** in `nums`, return this repeated number.

 You must solve the problem **without** modifying the array `nums` and uses only
 constant extra space.
 
 #### Constraints
 - `1 <= n <= 10^5`
 - `nums.length == n + 1`
 - `1 <= nums[i] <= n`
 - All the integers in `nums` appear only **once** except for precisely one integer 
   which appears **two or more times.**
*/
public struct Solution_0287 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     to meet time/space requirement, use floyd's slow/fast pointer approach
     
     construct as `node.val` = `i` and `node.next` = `nums[i]`
     
     ex) `[3,2,1,1]`   becomes `0 -> 3 -> 1 <-> 2`
     
     same approach as ``Solution_0142``
    */
    public static func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]

        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast

        slow = nums[0]

        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }
}
