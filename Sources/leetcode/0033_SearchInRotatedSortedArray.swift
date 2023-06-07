/**
 33 - Search in Rotated Sorted Array - Medium
*/
struct Solution33 {

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
    static func search(_ nums: [Int], _ target: Int) -> Int {
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
