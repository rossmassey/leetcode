/**
 853 - Car Fleet - Medium
 
 There are `n` cars going to the same destination along a one-lane road. The 
 destination is `target` miles away.

 You are given two integer array `position` and `speed`, both of length `n`, 
 where `position[i]` is the position of the `ith` car and `speed[i]` is the 
 speed of the `ith` car (in miles per hour).

 A car can never pass another car ahead of it, but it can catch up to it and  
 drive bumper to bumper **at the same speed**. The faster car will **slow down** 
 to match the slower car's speed. The distance between these two cars is ignored 
 (i.e., they are assumed to have the same position).

 A **car fleet** is some non-empty set of cars driving at the same position and 
 same speed. Note that a single car is also a car fleet.

 If a car catches up to a car fleet right at the destination point, it will still 
 be considered as one car fleet.

 Return the **number of car fleets** that will arrive at the destination.
 
 #### Constraints
 - `n == position.length == speed.length`
 - `1 <= n <= 105`
 - `0 < target <= 106`
 - `0 <= position[i] < target`
 - All the values of `position` are **unique.**
 - `0 < speed[i] <= 106`
 */
public struct Solution_0853 {
    /**
     Runtime:    `O(n log n)`
     Space:      `O(n)`
     
     sort the combined arrays by descending `position` (first element)
     
     while `stack` is not empty and the current car's `arrivaltime` is greater or
     equal to the last car/fleet's `arrivaltime`, remove the last car/fleet from
     `stack`. this is because the current car catches up with the last one (or is
     faster) and becomes part of the same fleet
     
     at the end, the `stack` will contain the distinct fleets, each representing
     the arrival times of cars that cannot catch up with each other
     */
    public static func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        
        var stack = [Double]()
        
        for (position, speed) in zip(position, speed).sorted(by: <) {
            
            let arrivalTime = Double(target - position) / Double(speed)
            
            while let lastArrivalTime = stack.last, arrivalTime >= lastArrivalTime {
                stack.removeLast()
            }
            
            stack.append(arrivalTime)
        }
        
        return stack.count
    }
}
