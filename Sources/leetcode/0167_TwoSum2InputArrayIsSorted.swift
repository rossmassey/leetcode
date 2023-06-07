/**
 167 - Two Sum II Input Array Is Sorted - Medium
 */
struct Solution167 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     since `numbers` array is sorted, we can use two pointers
     */
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target { return [left + 1, right + 1]}
            if sum > target { right -= 1 } else { left += 1 }
        }
        return [-1, -1]
    }
}
