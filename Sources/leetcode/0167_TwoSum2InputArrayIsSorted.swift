/**
 167 - Two Sum II Input Array Is Sorted - Medium
 
 Given a **1-indexed** array of integers `numbers` that is already **sorted in 
 non-decreasing order**, find two numbers such that they add up to a specific 
 `target` number. Let these two numbers be `numbers[index1]` and `numbers[index2]`
  where `1 <= index1 < index2 < numbers.length`.

 Return the indices of the two numbers, `index1` and `index2`, **added by one** 
 as an integer array `[index1, index2]` of length `2`.
 
 #### Constraints
 - `2 <= numbers.length <= 3 * 10^4`
 - `-1000 <= numbers[i] <= 1000`
 - `numbers` is sorted in **non-decreasing order.**
 - `-1000 <= target <= 1000`
 - The tests are generated such that there is **exactly one solution.**
 */
public struct Solution_0167 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     since `numbers` array is sorted, we can use two pointers
     */
    public static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target { return [left + 1, right + 1]}
            if sum > target { right -= 1 } else { left += 1 }
        }
        return [-1, -1]
    }
}
