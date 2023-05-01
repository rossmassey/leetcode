/**
    347 - Top K Frequent Elements - Medium
    
    Runtime:    O(n)
    Space:      O(n)

    after we remove all the empty arrays from intitilzation (flatMap), we know 
    freqBuckets is in order/sorted by frequency (since higher freq stored in higher 
    index at end of array, lower freq in lower index), and can just grab the numbers 
    associated with highest k frequencies

*/
struct Solution347 {
    static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqBuckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
        let counts = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        for (num, freq) in counts.map({( $0.key, $0.value )}) {
            freqBuckets[freq].append(num)
        }
        let flatList = freqBuckets.flatMap { $0 }
        return Array(flatList.suffix(k))
    }
}
