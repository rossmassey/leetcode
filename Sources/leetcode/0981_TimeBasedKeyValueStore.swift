/**
 981 - Time Based Key Value Store - Medium
 
 Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.

 Implement the `TimeMap` class:

 - `TimeMap()` Initializes the object of the data structure.
 - `void set(String key, String value, int timestamp) `Stores the key `key` with the value `value` at the given time `timestamp`.
 - `String get(String key, int timestamp)` Returns a value such that set was called previously, with `timestamp_prev <= timestamp`. If there are multiple such values, it returns the value associated with the largest `timestamp_prev`. If there are no values, it returns `""`.

 #### Constraints
 - `1 <= key.length, value.length <= 100`
 - `key` and `value` consist of lowercase English letters and digits.
 - `1 <= timestamp <= 10^7`
 - All the timestamps `timestamp` of `set` are strictly increasing.
 - At most `2 * 10^5` calls will be made to `set` and `get`.
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
