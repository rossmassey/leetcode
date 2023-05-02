/**
    704 - Binary Search - Easy
    
    Runtime:    O(log n)
    Space:      O(1)

    leetcode returns `Int`, but an `Int?` and `nil` would be clearer than -1

*/
struct Solution704 {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1

        while start <= end {
            let middle = (start + end) / 2
            if nums[middle] == target { return middle }
            nums[middle] > target ? (end = middle - 1) : (start = middle + 1)
        }
        return -1
    }
}
