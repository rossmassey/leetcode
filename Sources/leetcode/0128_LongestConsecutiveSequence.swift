/**
 128 - Longest Consecutive Sequence - Medium
 */
struct Solution128 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    static func longestConsecutiveSequence(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        let numSet  = Set(nums)
        var longestLength = 1
        
        for num in numSet {
            if !numSet.contains(num - 1) {
                var curentSequenceLength = 1
                var current = num
                while numSet.contains(current + 1) {
                    curentSequenceLength += 1
                    current += 1
                }
                longestLength = max(curentSequenceLength, longestLength)
            }
        }
        
        return longestLength
    }
}
