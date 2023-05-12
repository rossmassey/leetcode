/**
    42 - Trapped Rain Water - Hard
    
    Runtime:    `O(n)`
    Space:      `O(1)`
    
    use two variables `leftMax` and `rightMax` to track bounding heights
    use two pointers to only need one pass, and no additional data structure
 
    converge towards middle based on lesser height
    use tallest height found on lesser height's side to determine water amount
    subtract the current height, since water only on top of it
    
*/
struct Solution42 {
    static func trap(_ height: [Int]) -> Int {
        
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
