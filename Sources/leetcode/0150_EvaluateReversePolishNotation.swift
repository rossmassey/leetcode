/**
 **[Evaluate Reverse Polish Notation](https://leetcode.com/problems/evaluate-reverse-polish-notation/)** - Medium
 
 You are given an array of strings `tokens` that represents an arithmetic 
 expression in a Reverse Polish Notation.

 Evaluate the expression. Return an integer that represents the value of the expression.

 Note that:
 - The valid operators are `'+'`, `'-'`,`'*'`, and `'/'`.
 - Each operand may be an integer or another expression.
 - The division between two integers always **truncates toward zero**.
 - There will not be any division by zero.
 - The input represents a valid arithmetic - expression in a reverse polish notation.
 - The answer and all the intermediate calculations can be represented in a 
 **32-bit** integer.

 ##### Constraints
 - `1 <= tokens.length <= 104`
 - `tokens[i]` is either an operator: `+`, `-`, `*`, or `/`, or an integer in 
 the range `[-200, 200]`.
 */
public struct Solution_0150 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     
     assumes `tokens` will be valid input for reverse polish notation
     */
    public static func evalRPN(_ tokens: [String]) -> Int {
        
        let operations: [String: (Int, Int) -> (Int)] = [
            "+": { $0 + $1 },
            "-": { $0 - $1 },
            "*": { $0 * $1 },
            "/": { $0 / $1 }
        ]
        
        var stack: [Int] = []
        
        for token in tokens {
            if let operation = operations[token] {
                let right = stack.removeLast()
                let left = stack.removeLast()
                stack.append(operation(left, right))
            } else {
                stack.append(Int(token)!)
            }
        }
        
        return stack.removeLast()
    }
}
