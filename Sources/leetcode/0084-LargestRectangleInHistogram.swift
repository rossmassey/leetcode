/**
 84 - Largest Rectangle in Histogram - Hard
*/
struct Solution84 {

    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
    
     use a `stack` to track heights less than current one

     at each `height`, if the `height` at the `top` of `stack` is `>= currentHeight`,
     then the current height will be the limiting height for any future rectangles

     so we keep popping the stack until we find a `height` which is smaller than the `currentHeight`

     width of each rectangle is determined by how far it extends to the right in the histogram
     which is found using `currentIndex - element.start`

     since  we know `element.height` from `stack` is greater than `currentHeight`
     we can extend out `leftMostIndex` to `element.start`

     once we are at point where `stack` is empty
     or `top` of `stack` is `< currentHeight`
     then add to stack `currentHeight` and how far height extends to left

     after one pass, each remaining `element` in the `stack` represents a `height`
     for which we haven't found a smaller one to its right,
     so its corresponding rectangle can be extended till the end of the histogram

     iterate through remaining to update `maxArea` if needed (such as  case when `heights` in increasing order)
    */
    static func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [(start: Int, height: Int)]()

        for (currentIndex, currentHeight) in heights.enumerated() {
            var leftMostIndex = currentIndex
            while let top = stack.last, top.height >= currentHeight {
                let element = stack.removeLast()
                maxArea = max(maxArea, element.height * (currentIndex - element.start))
                leftMostIndex = element.start
            }
            stack.append((leftMostIndex, currentHeight))
        }
        
        return stack.reduce(into: maxArea) { maxArea, element in
            maxArea = max(maxArea, element.height * (heights.count - element.start))
        }
    }
}
