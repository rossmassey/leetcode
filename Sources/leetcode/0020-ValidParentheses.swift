/**
    20 - Valid Parentheses - Easy
    
    Runtime:    `O(n)`
    Space:      `O(n)`
    
*/
struct Solution20 {
    static func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }

        let pairs: [Character: Character] = [
            "}" : "{",
            "]" : "[",
            ")" : "(",
        ]

        var stack = [Character]()

        for brace in s {
            if let openingBrace = pairs[brace] {
                if stack.isEmpty || openingBrace != stack.removeLast() { 
                    return false 
                }
            }
            else { stack.append(brace) }
        }

        return stack.isEmpty
    }
}
