/**
 36 - Valid Sudoku - Medium
 */
struct Solution36 {
    /**
     Runtime:    `O(1)`
     Space:      `O(1)`
     
     alternative for `squareIndex` is to create a struct that conforms to
     `Hashable` and contains a pair mapped to `row/3` and `col/3`
     */
    static func isValidSudoku(_ board: [[Character]]) -> Bool {
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
