/**
 22 - Genereate Parentheses - Medium
 
 Given `n` pairs of parentheses, write a function to _generate all combinations of well-formed parentheses_.
 
 #### Constraints
 - `1 <= n <= 8`
 */
public struct Solution_0022 {
    /**
     Runtime:    `O(4^n / sqrt(n))`
     Space:      `O(4^n / sqrt(n))`
     
     valid parentheses string is a Dyck word, so time and space complexity
     related to growth of Catalan numbers
     */
    public static func generateParenthesis(_ n: Int) -> [String] {
        
        var result = [String]()
        
        func backtrack(_ candidate: String, _ open: Int, _ close: Int) {
            // valid
            if open == n && close == n {
                result.append(candidate)
                return
            }
            
            // can add "(" at any point until have n of them
            if open < n { backtrack(candidate + "(", open + 1, close) }
            
            
            // ")" also still bound by n, but also by number of "("
            if close < open { backtrack(candidate + ")", open, close + 1) }
        }
        
        backtrack("", 0, 0)
        return result
    }
    
    /**
     Runtime:    `O(4^n / sqrt(n))`
     Space:      `O(4^n / sqrt(n))`
     */
    public static func generateParenthesisDynamicProgramming(_ n: Int) -> [String] {
        
        // base case, return array with an empty string
        guard n > 0 else { return [""] }
        
        // iterate through numbers from 0 to n-1 and use flatMap to combine results
        return (0..<n).flatMap { i in
            // for each number i, generate valid parentheses for i pairs (left side)
            generateParenthesis(i).flatMap { left in
                // generate valid parentheses for (n-1-i) pairs (right side)
                generateParenthesis(n-1-i).map { right in
                    // combine the left and right parentheses and wrap them with a new pair of parentheses
                    "(\(left))\(right)"
                }
            }
        }
    }
}
