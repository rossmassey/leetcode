/**
 74 - Search a 2D Matrix - Medium
 
 You are given an `m x n` integer matrix `matrix` with the following two properties:

 - Each row is sorted in non-decreasing order.
 - The first integer of each row is greater than the last integer of the previous row.

 Given an integer `target`, return `true` if `target` is in `matrix` or `false` otherwise.
 
 #### Constraints
 - `m == matrix.length`
 - `n == matrix[i].length`
 - `1 <= m, n <= 100`
 - `-104 <= matrix[i][j], target <= 104`
*/
public struct Solution_0074 {
    
    /**
     Runtime:    `O(log m + log n)`
     Space:      `O(1)`
     
     > `m` is # rows, `n` is # cols’
    
     binary search approach, just treat the 2D array as a 1D array
     
     note: `O(log m + log n) = O(log (m * n))`
    */
    public static func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let colCount = matrix.count
        let rowCount = matrix[0].count

        // treat 2d array as 1d array
        func getElementAt(_ i: Int) -> Int {
            let row = i / rowCount
            let col = i % rowCount
            return matrix[row][col]
        }

        var left = 0
        var right = (colCount * rowCount) - 1

        while left <= right {
            let middle = left + (right - left) / 2
            let middleElement = getElementAt(middle)

            if middleElement > target {
                right = middle - 1
            }
            else if middleElement < target {
                left = middle + 1
            }
            else { // middleElement == target
                return true
            }
        }

        return false
    }
    
    
    /**
     Runtime:    `O(m + n)`
     Space:      `O(1)`
    
     unlike binary search (a dviide and conquer algorithm), this is specifically for this type of 2D sorted array

     start at bottom left of matrix, where we know:
     - smaller elements in a row above us (if present), or `row -= 1`
     - bigger elements to the right of us (if present), or `col += 1`

     eliminate each row/col as you proceed through, end when you have gone out of bounds

     alternative start location is top right
    */
    public static func searchMatrix2DAlgorithm(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rowCount = matrix.count
        let colCount = matrix[0].count

        var row = rowCount - 1
        var col = 0

        while row >= 0 && col < colCount {
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] > target {
                row -= 1
            } else {
                col += 1
            }
        }
        return false
    }
}
