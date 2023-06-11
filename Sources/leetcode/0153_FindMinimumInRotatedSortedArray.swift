/**
 153 - Find Minimum in Rotated Sorted Array - Medium
 
 Suppose an array of length `n` sorted in ascending order is **rotated** between `1` and `n` times. For example, the array nums = `[0,1,2,4,5,6,7]` might become:

 - `[4,5,6,7,0,1,2]` if it was rotated `4` times.
 - `[0,1,2,4,5,6,7]` if it was rotated `7` times.

 Notice that **rotating** an array `[a[0], a[1], a[2], ..., a[n-1]]` 1 time results in the array `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]`.

 Given the sorted rotated array `nums` of **unique** elements, return the _minimum element of this array_.

 #### Constraints
 - `n == nums.length`
 - `1 <= n <= 5000`
 - `-5000 <= nums[i] <= 5000`
 - All the integers of `nums` are **unique.**
 - `nums` is sorted and rotated between `1` and `n` times.
*/
public struct Solution_0153 {

    /**
     Runtime:    `O(log n)`
     Space:      `O(1)`
    
     `nums` is sorted increasing (but rotated), so can apply binary search

     if `nums[left] < nums[right]` then `nums[left...right]` is in order
     so `left` has min value
     
     ```
              L       R                             L     R
        e.g. [20, 25, 36]   or   [6, 8, 12, 17, 30, 0, 1, 3]
              ^                                     ^
              minimum                               minimum
     ```

     otherwise there is a second partition with lower elements than the first partition
     (due to the rotation)
     
     ```
               L        M        R
        e.g. [ 4, 5, 6, 8, 1, 2, 3]  (rotated 4 times)
               ^           ^
               second      first (start of first is min)
     ```
     
     find `mid` value between `left` and `right`
     store as lowest value found if that is the case

     if `nums[mid] >= nums[left]` we are in second partition of sorted array
     (where `M` is in above example)
     move window to right of `mid`
     (first partition starts somewhere in `[mid + 1 ... right]`)

     otherwise we are in the first partition of sorted array
     move window to left of `mid`
     (start of this partition/min somewhere in `[left ... mid - 1]`)
    */
    public static func findMin(_ nums: [Int]) -> Int {
        var currentMin = nums[0]
        var left = 0, right = nums.count - 1

        while left <= right {
            if nums[left] < nums[right] {
                currentMin = min(nums[left], currentMin)
                break
            }

            let mid = (right - left) / 2 + left
            currentMin = min(nums[mid], currentMin)

            if nums[mid] >= nums[left] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return currentMin
    }
}
