/**
 150 - Evaluate Reverse Polish Notation - Medium
 */
public struct Solution_0150 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     
     assumes `tokens` will be valid input for reverse polish notation
     */
    public static func evalRPN(_ tokens: [String]) -> Int {
        
        let operations: [String : (Int, Int) -> (Int)] = [
            "+" : { $0 + $1 },
            "-" : { $0 - $1 },
            "*" : { $0 * $1 },
            "/" : { $0 / $1 }
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
