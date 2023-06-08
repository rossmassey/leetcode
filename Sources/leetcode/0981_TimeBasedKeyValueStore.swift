/**
 981 - Time Based Key Value Store - Medium
*/
public class Solution_0981 {
    
    var timeMap: [String : [(value: String, time: Int)]]

    init() {
        timeMap = [:]
    }
    
    /**
     Runtime:    `O(1)`
     Space:      `O(1)`
     
     all `timestamp` given will be strictly increasing (like unix time)
     
     so this will keep our `times` array sorted after each insert
     
     otherwise a `O(log n)` insert would be required to main sorted property
     
     while this operation is `O(1)` space, `timeMap` has overall space complexity of `O(n)`
     */
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        timeMap[key, default: []].append((value, timestamp))
    }
    
    /**
     Runtime:    `O(log n)`
     Space:      `O(1)`
     
     use binary search to find a tuple at`key` that has a `time <= timestamp`
     
     each `times` array of tuples in our `timeMap` is already sorted, to do how `set` is called
     */
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let times = timeMap[key] else { return "" }
                
        var closestValueBelowTimestamp = ""
        var left = 0, right = times.count - 1
        
        while left <= right {
            let mid = (right - left) / 2 + left
            
            if times[mid].time > timestamp {
                right = mid - 1
            } else if times[mid].time < timestamp {
                closestValueBelowTimestamp = times[mid].value
                left = mid + 1
            }
            else { return times[mid].value }
        }
        
        return closestValueBelowTimestamp

    }
}
