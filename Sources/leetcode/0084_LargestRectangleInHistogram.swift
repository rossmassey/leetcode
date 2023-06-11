/**
 84 - Largest Rectangle in Histogram - Hard
 
 Given an array of integers `heights` representing the histogram's bar height where the width of each bar is `1`, return the _area of the largest rectangle in the histogram._
 
 #### Constraints
 - `1 <= heights.length <= 10^5`
 - `0 <= heights[i] <= 10^4`
*/
public struct Solution_0084 {

    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
    
     1. For each bar in the histogram, compare the bar's height (`currentHeight`) with the `height` of the `edge` at the `top` of the `stack`

     2. If the current bar is shorter or equal to the `edge` on the `stack`, start removing from the `stack`. This process involves forming rectangles with each removed `edge`. The height of the rectangle is the height of the removed `edge`, and the width is the distance between the index of the current bar (`currentIndex`) and the start index of the removed `edge` (`edge.start`)

     3. Find rectangle area for each removed `edge` using its `height` and calculated `width`, and update `largestArea` if the area of the current rectangle is larger

     4. After removing taller bars, add the current bar as  an `edge` to the `stack`, noting its starting point (`startOfCurrentHeight`). This `edge` will mark start of a new rectangle whose height was determined by this bar

     5. Once all bars are processed, the remaining `edges` in the `stack` are the ones without a shorter bar to their right. These bars represent rectangles that span all the way to the end of the histogram

     6. For each remaining `edge` in the stack, extend their area to the end of the histogram and update `largestArea` if the area of this rectangle is larger

     7. The function returns the `largestArea` found

     This process ensures all possible rectangle areas under the histogram are checked, and the largest one is found.
    */
    public static func largestRectangleArea(_ heights: [Int]) -> Int {
        var largestArea = 0

        // "left edge" of rectangle stored in stack
        var stack = [(start: Int, height: Int)]() 

        for (currentIndex, currentHeight) in heights.enumerated() {
            var startOfCurrentHeight = currentIndex

            // want to maintain an monotonic increasing stack
            // so when currentHeight breaks the order:
            // find previous areas taller than currentHeight for max
            // since going forward we are limited by currentHeight
            while let top = stack.last, top.height >= currentHeight {
                let edge = stack.removeLast()
                let width = currentIndex - edge.start
                largestArea = max(largestArea, edge.height * width)
                
                // this edge is >= currentHeight
                // so rectangle with currentHeight can extend to this edge
                startOfCurrentHeight = edge.start
            }
            stack.append((startOfCurrentHeight, currentHeight))
        }
        
        // these edges did not have bars lower than them
        // so their area extend to end of histogram
        for edge in stack {
            let width = heights.count - edge.start
            largestArea = max(largestArea, edge.height * width)
        }

        return largestArea
    }
    
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
    
     an additional iteration is added to the main for-loop that considers a
     `currentHeight` of `0` once we have iterated through heights (end of
     `heights` was at `heights.count - 1`).
     
     this is guaranteed to be smaller than any `height` on the stack, so it will
     cause all remaining heights to be popped from the `stack` and their areas
     calculated
     */
    public static func largestRectangleAreaCondensed(_ heights: [Int]) -> Int {
        var largestArea = 0

        var stack = [(start: Int, height: Int)]()

        for currentIndex in 0...heights.count {
            let currentHeight = (currentIndex == heights.count ? 0 : heights[currentIndex])
            var startOfCurrentHeight = currentIndex

            while let top = stack.last, top.height >= currentHeight {
                let edge = stack.removeLast()
                let width = currentIndex - edge.start
                largestArea = max(largestArea, edge.height * width)
                startOfCurrentHeight = edge.start
            }
            stack.append((startOfCurrentHeight, currentHeight))
        }
        
        return largestArea
    }
}
