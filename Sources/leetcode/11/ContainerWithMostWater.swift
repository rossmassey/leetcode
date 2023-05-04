/**
    11 - Container WIth Most Water - Medium
    
    Runtime:    O(n)
    Space:      O(1)
 
    since `area` limited by shorter height, move that pointer
    
*/
struct Solution11 {
    static func maxArea(_ height: [Int]) -> Int {
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

