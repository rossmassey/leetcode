/**
 4 - Median of Two Sorted Arrays - Hard
*/
struct Solution4 {

    /**
     Runtime:    `O(log n)`, `n` is smaller array (`short`)
     Space:      `O(1)`
    
     can just use the `short` array to perform a binary search,
     because for any potential `divider` we pick for `short`,
     there will be a complement in `long`.
     
     in the merged array, the elements to left of `shortDivider`
     and the elements to left of `longDivider` should sum to `halfCount`

     use `getElementsAdjacentToDivider` to obtain the elements adjacent
     to the divider in both arrays. if the divider is at the bounds of
     the array, it uses `Int.min` for left and `Int.max` for right,
     to handle edge cases

     if `shortLeft > longRight`, want more elements coming from `long`
     in left partition
     
     else want more elements coming from `short` in left partition

     once dividers result in case where left of divider elements is less than
     the right of divider elements, have partitioned correctly

    */
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let (short, long) = nums1.count < nums2.count ? (nums1, nums2) : (nums2, nums1)

        let mergedCount = short.count + long.count
        let halfCount = (mergedCount + 1) / 2
        let mergedCountIsEven = mergedCount % 2 == 0
        
        var left = 0, right = short.count
        
        while left <= right {
            let shortDivider = (left + right) / 2
            let longDivider = halfCount - shortDivider
            
            let (shortLeft, shortRight) = getElementsAdjacentToDivider(shortDivider, in: short)
            let (longLeft, longRight) = getElementsAdjacentToDivider(longDivider, in: long)
            
            if shortLeft > longRight {
                right = shortDivider - 1
            } else if longLeft > shortRight {
                left = shortDivider + 1

            } else {
                if mergedCountIsEven {
                    return Double(max(shortLeft, longLeft) + min(shortRight, longRight)) / 2.0
                } else {
                    return Double(max(shortLeft, longLeft))
                }
            }
        }
        
        return -1
    }
    
    static func getElementsAdjacentToDivider(_ divider: Int, in array: [Int]) -> (Int, Int) {
        let left = divider > 0 ? array[divider - 1] : Int.min
        let right = divider < array.count ? array[divider] : Int.max
        
        return (left, right)
    }
    
}
