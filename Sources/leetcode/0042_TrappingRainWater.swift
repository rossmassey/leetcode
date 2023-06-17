/**
 **[Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)** - Hard
 
 Given `n` non-negative integers representing an elevation map where the width 
 of each bar is `1`, compute how much water it can trap after raining.
 
 #### Constraints
 - `n == height.length`
 - `1 <= n <= 2 * 10^4`
 - `0 <= height[i] <= 10^5`
 */
public struct Solution_0042 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     use two variables `leftMax` and `rightMax` to track bounding heights
     use two pointers to only need one pass, and no additional data structure
     
     converge towards middle based on lesser height
     use tallest height found on lesser height's side to determine water amount
     subtract the current height, since water only on top of it
     */
    public static func trap(_ height: [Int]) -> Int {
        
        var left = 0
        var right = height.count - 1
        
        var leftMax = height[left]
        var rightMax = height[right]
        
        var trappedWater = 0
        
        while left < right {
            if height[left] < height[right] {
                leftMax = max(height[left], leftMax)
                trappedWater += leftMax - height[left]
                
                left += 1
            } else {
                rightMax = max(height[right], rightMax)
                trappedWater += rightMax - height[right]
                
                right -= 1
            }
        }
        
        return trappedWater
        
    }
}
