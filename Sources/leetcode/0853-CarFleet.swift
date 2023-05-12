/**
    853 - Car Fleet - Medium

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
struct Solution853 {
    static func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        
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
