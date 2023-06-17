/**
 **[Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)** - Medium
 
 Given an array of integers `temperatures` represents the daily temperatures, 
 return an array `answer` such that `answer[i]` is the number of days you have 
 to wait after the ith day to get a warmer temperature. If there is no future 
 day for which this is possible, keep `answer[i] == 0` instead.
 
 #### Constraints
 - `1 <= temperatures.length <= 10^5`
 - `30 <= temperatures[i] <= 100`
 */
public struct Solution_0739 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     
     each element only added/popped once from stack
     */
    public static func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: temperatures.count)
        var stack = [(index: Int, temp: Int)]()
        
        for (index, currentTemp) in temperatures.enumerated() {
            // pop while currentTemp > temp at the top of the stack
            while let stackTop = stack.last, currentTemp > stackTop.temp {
                stack.removeLast()
                // first time we have found warmer temp for those popped,
                // set their corresponding value to # days it took
                result[stackTop.index] = (index - stackTop.index)
            }
            
            // push current temp / index onto stack
            stack.append((index, currentTemp))
        }
        
        return result
    }
}
