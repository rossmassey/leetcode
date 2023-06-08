/**
 125 - Valid Palindrome - Easy
 */
public struct Solution_0125 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func isPalindrome(_ s: String) -> Bool {
        let filtered = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return String(filtered.reversed()) == filtered
    }
}
