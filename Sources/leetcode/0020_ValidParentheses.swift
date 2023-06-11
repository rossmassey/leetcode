/**
 20 - Valid Parentheses - Easy
 
 Given a string `s` containing just the characters `(`,` )`,`{`,` }`, `[` and `]`, 
 determine if the input string is valid.

 An input string is valid if:
 - Open brackets must be closed by the same type of brackets.
 - Open brackets must be closed in the correct order.
 - Every close bracket has a corresponding open bracket of the same type.
 
 #### Constraints
 - `1 <= s.length <= 104`
 - `s` consists of parentheses only `'()[]{}'`.
 */
public struct Solution_0020 {
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
    public static func isValid(_ s: String) -> Bool {
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
