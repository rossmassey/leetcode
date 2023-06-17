/**
 **[Min Stack](https://leetcode.com/problems/min-stack/)** - Medium
 
 Design a stack that supports push, pop, top, and retrieving the minimum element 
 in constant time.

 Implement the `MinStack` class:

 - `MinStack() `initializes the stack object.
 - `void push(int val)` pushes the element `val` onto the stack.
 - `void pop()` removes the element on the top of - the stack.
 - `int top()` gets the top element of the stack.
 - `int getMin()` retrieves the minimum element in the stack.
 
 #### Constraints
 - `-2^31 <= val <= 2^31 - 1`
 - Methods `pop`, `top` and `getMin` operations will always be called on 
 **non-empty** stacks.
 - At most `3 * 10^4` calls will be made to `push`, `pop`, `top`, and `getMin`.
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
