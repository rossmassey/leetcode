/**
    217 - Contains Duplicate - Easy
    
    Runtime:    O(n)
    Spacetime:  O(n)
    
*/
struct Solution217 {
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = Set<Int>()
        for num in nums {
            if seen.contains(num) {
                return true
            }
            else {
                seen.insert(num)
            }
        }
        return false
    }
}
