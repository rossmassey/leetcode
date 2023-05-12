/**
    125 - Valid Palindrome - Easy
    
    Runtime:    `O(n)`
    Space:      `O(n)`
    
*/
struct Solution125 {
    static func isPalindrome(_ s: String) -> Bool {
        let filtered = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return String(filtered.reversed()) == filtered
    }
}
