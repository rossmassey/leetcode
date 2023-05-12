/**
    739 - Daily Temperatures - Medium
     
    Runtime:    `O(n)`, each element only added/popped once from stack
    Space:      `O(n)`
     
 */
struct Solution739 {
    static func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
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
