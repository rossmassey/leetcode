/**
 **[Best Time To Buy And Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)** - Easy
 
 You are given an array `prices` where `prices[i]` is the price of a given stock 
 on the `ith` day.

 You want to maximize your profit by choosing a **single day** to buy one stock 
 and choosing a **different day in the future** to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot 
 achieve any profit, return `0`.
 
 #### Constraints
 - `1 <= prices.length <= 10^5`
 - `0 <= prices[i] <= 10^4`
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
