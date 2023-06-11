/**
 11 - Container WIth Most Water - Medium
 
 You are given an integer array height of length `n`. There are` n` vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and` (i, height[i])`.

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 _Return the maximum amount of water a container can store._

  **Notice** that you may not slant the container.
 
 #### Constraints
 - `n == height.length`
 - `2 <= n <= 10^5`
 - `0 <= height[i] <= 10^4`
 */
public struct Solution_0011 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     use two pointers `left` and `right` to scan the input
     
     since `area` limited by shorter height, move that pointer
     */
    public static func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var (left, right) = (0, height.count - 1)
        
        while left < right {
            let area = (right - left) * min(height[left], height[right])
            maxArea = max(area, maxArea)
            
            if height[left] < height[right] { left += 1}
            else { right -= 1}
        }
        
        return maxArea
    }
}
