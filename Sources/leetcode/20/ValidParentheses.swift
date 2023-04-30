/**
    20 - Valid Parentheses - Easy
    
    Runtime:    O(n)
    Spacetime:  O(n)
    
*/
struct Solution20 {
    static func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 { return false }

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
