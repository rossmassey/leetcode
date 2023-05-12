/**
    1 - Two Sum - Easy
    
    Runtime:    `O(n)`
    Space:      `O(n)`
    
*/
struct Solution1 {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count != 2 else { return [0,1] }
        
        var indexOfComplements = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let otherIndex = indexOfComplements[num] {
                return [index, otherIndex]
            }
            indexOfComplements[target - num] = index
        }
        return [-1,-1]
    }
}
