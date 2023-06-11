/**
 33 - Search in Rotated Sorted Array - Medium
 
 There is an integer array `nums` sorted in ascending order (with **distinct** values).

 Prior to being passed to your function, `nums` is **possibly rotated** at an 
 unknown pivot index `k` (`1 <= k < nums.length`) such that the resulting array 
 is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` 
 **(0-indexed)**. For example, `[0,1,2,4,5,6,7]` might be rotated at pivot index 
 `3` and become `[4,5,6,7,0,1,2]`.

 Given the array `nums` **after** the possible rotation and an integer `target`,
  return the index of `target` if it is in `nums`, or `-1` if it is not in `nums`.
 
 #### Constraints
 - `1 <= nums.length <= 5000`
 - `-10^4 <= nums[i] <= 10^4`
 - All values of `nums` are **unique.**
 - `nums` is an ascending array that is possibly rotated.
 - `-10^4 <= target <= 10^4`
*/
public struct Solution_0033 {

    /**
     Runtime:    `O(log n)`
     Space:      `O(1)`
    
     perform a binary search
     
     `nums[left...right]` may contain a pivot if it was rotated
     
     if `nums[left] <= nums[mid]`, this part does not contain the pivot
     that means the entire subarray `nums[left...mid]` is sorted
     
     if `target` is in the bounds of `nums[left]` and `nums[mid]`,
     set `right` as `mid - 1`, else `target` might be in other part
     
     if `nums[left...mid]` was not sorted, and contained pivot,
     then `nums[mid...right]` will not have the pivot and be sorted
     
     if `target` is in the bounds of `nums[mid]` and `nums[right]`,
     set `left` as `mid + 1`, else `target` might be in other part
    
     return `-1` if not found
    */
    public static func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1

        while left <= right {
            let mid = (right - left) / 2 + left

            if nums[mid] == target { return mid }

            // check if nums[left...mid] is sorted
            else if nums[left] <= nums[mid] {
                let leftHalfContainsTarget = (nums[left] <= target && target < nums[mid])
                leftHalfContainsTarget ? (right = mid - 1) : (left = mid + 1)
            }

            // if nums[left...mid] was not sorted, then nums[mid...right] will be
            else {
                let rightHalfContainsTarget = (nums[mid] < target && target <= nums[right])
                rightHalfContainsTarget ? (left = mid + 1) : (right = mid - 1)
            }
        }

        return -1
    }
}
