/**
 125 - Valid Palindrome - Easy
 
 A phrase is a **palindrome** if, after converting all uppercase letters into 
 lowercase letters and removing all non-alphanumeric characters, it reads the 
 same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string `s`, return `true` if it is a **palindrome**, or `false` otherwise.
 
 #### Constraints
 - `1 <= s.length <= 2 * 10^5`
 - `s consists only of printable ASCII characters.`
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
