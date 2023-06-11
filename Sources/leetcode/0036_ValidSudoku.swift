/**
 36 - Valid Sudoku - Medium
 
 Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated **according to the following rules:**

 - Each row must contain the digits `1-9` without repetition.
 - Each column must contain the digits `1-9` without repetition.
 - Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

 #### Note
 - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 - Only the filled cells need to be validated according to the mentioned rules.

 #### Constraints
 - `board.length == 9`
 - `board[i].length == 9`
 - `board[i][j]` is a digit `1-9` or `'.'`.
 */
public struct Solution_0036 {
    /**
     Runtime:    `O(1)`
     Space:      `O(1)`
     
     alternative for `squareIndex` is to create a struct that conforms to
     `Hashable` and contains a pair mapped to `row/3` and `col/3`
     */
    public static func isValidSudoku(_ board: [[Character]]) -> Bool {
        var cols = [Int:Set<Character>]()
        var rows = [Int:Set<Character>]()
        var squares = [Int:Set<Character>]()
        
        for row in 0..<9 {
            for col in 0..<9 {
                let value = board[row][col]
                guard value != "." else { continue }
                
                let rowContains = rows[row]?.contains(value) ?? false
                let colContains = cols[col]?.contains(value) ?? false
                
                let squareIndex = row / 3 * 3 + col / 3
                let squareContains = squares[squareIndex]?.contains(value) ?? false
                
                if rowContains || colContains || squareContains {
                    return false
                }
                
                cols[col, default: Set<Character>()].insert(value)
                rows[row, default: Set<Character>()].insert(value)
                squares[squareIndex, default: Set<Character>()].insert(value)
            }
        }
        
        return true
    }
}
