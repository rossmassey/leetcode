/**
 121 - Best Time To Buy And Sell Stock - Easy
 */
public struct Solution_0121 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     */
    public static func maxProfit(_ prices: [Int]) -> Int {
        var min = Int.max, maxProfit = 0
        for price in prices {
            if price < min { min = price }
            else if price - min > maxProfit { maxProfit = price - min }
        }
        return maxProfit
    }
}
