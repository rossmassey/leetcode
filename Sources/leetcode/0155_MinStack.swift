/**
 155 - Min Stack - Medium
 
 Leetcode problem would be better if ``top()`` and ``getMin()`` returned `Int?`
 */
public class Solution_0155 {
    /// Space:    `O(1)`
    var stack: [(val: Int,min: Int?)]
    var min: Int? 
    
    public init() {
        stack = [(val: Int,min: Int?)]()
    }
    
    /// Runtime:    `O(1)` Space: `O(n)`
    public func push(_ val: Int) {
        if min == nil || val < min! {
            min = val
        }
        stack.append((val,min))
    }
    
    /// Runtime:    `O(1)`
    public func pop() {
        stack.removeLast()
        min = stack.last?.min
    }
    
    /// Runtime:    `O(1)`
    public func top() -> Int {
        return stack.last!.val
    }
    
    /// Runtime:    `O(1)`
    public func getMin() -> Int {
        return min!
    }
}
