/**
 15 - 3Sum - Medium
 
 Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` 
 such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

 Notice that the solution set must not contain duplicate triplets.
 
 #### Constraints
 - `3 <= nums.length <= 3000`
 - `-10^5 <= nums[i] <= 10^5`
 */
public struct Solution_0015 {
    /**
     Runtime:    `O(n^2)`
     Space:      `O(n)`
     
     sort `nums` array, and for each element use two pointers to scan for two nums
     to right of element that will add up to it
     
     using a `Set` to handle duplicates is more readable
     */
    public static func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var result = Set<[Int]>()
        let sortedNums = nums.sorted()
        
        for (i, target) in sortedNums.enumerated() {
            var left = i + 1
            var right = sortedNums.count - 1
            
            while left < right {
                let sum = target + sortedNums[left] + sortedNums[right]
                
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    result.insert([target, sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                }
            }
        }
        
        return Array(result)
    }
    
    /**
     Runtime:    `O(n^2)`
     Space:      `O(n)`
     
     sort `nums` array, and for each element use two pointers to scan for two nums
     to right of element that will add up to it
     */
    public static func threeSumCheckDuplicatesManually(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        
        for (i, target) in sortedNums.enumerated() {
            
            guard i == 0 || target != sortedNums[i-1] else { continue }
            
            var left = i + 1
            var right = sortedNums.count - 1
            
            while left < right {
                let sum = target + sortedNums[left] + sortedNums[right]
                
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    result.append([target, sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                    
                    while left < right && sortedNums[left] == sortedNums[left - 1] {
                        left += 1
                    }
                }
            }
        }
        
        return result
    }
}
