/**
 20 - Valid Parentheses - Easy
 */
struct Solution20 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`

     checks string's parentheses validity using stack

     requires even string length
     
     pushes opening brackets to stack
     checks and pops stack if closing brackets match
     returns false if they don't
     
     returns true if stack empty after all characters processed
     */
    static func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        let pairs: [Character: Character] = [
            "}" : "{",
            "]" : "[",
            ")" : "(",
        ]
        
        var stack = [Character]()
        
        for bracket in s {
            if let openingBracket = pairs[bracket], !stack.isEmpty, openingBracket == stack.last {
                stack.removeLast()
            } else {
                stack.append(bracket)
            }
        }
        
        return stack.isEmpty
    }
}
