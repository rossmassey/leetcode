/**
    155 - Min Stack - Medium
    
    Runtime:    `O(1)` for each operation
    Space:      `O(n)`
                            
    Leetcode problem would be better if `top()` and `getMin()` returned `Int?`
    
*/
class Solution155 {
    var stack: [(val: Int,min: Int?)]
    var min: Int? 

    init() {
        stack = [(val: Int,min: Int?)]()
    }
    
    func push(_ val: Int) {
        if min == nil || val < min! {
            min = val
        }
        stack.append((val,min))
    }
    
    func pop() {
        stack.removeLast()
        min = stack.last?.min
    }
    
    func top() -> Int {
        return stack.last!.val
    }
    
    func getMin() -> Int {
        return min!
    }
}
