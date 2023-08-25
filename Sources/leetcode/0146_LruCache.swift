/**
 **[LRU Cache](https://leetcode.com/problems/lru-cache)** - Medium
 
 Design a data structure that follows the constraints of a Least Recently Used 
 (LRU) cache.

 Implement the `LRUCache` class:
 
 - `LRUCache(int capacity) `
    Initialize the LRU cache with **positive** size `capacity`.
 - `int get(int key) `
    Return the value of the `key` if the key exists, otherwise return `-1`.
 - `void put(int key, int value) `
    Update the value of the `key` if the `key` exists.
    Otherwise, add the `key-value` pair to the cache.
    If the number of keys exceeds the `capacity` from this operation, 
    **evict** the least recently used key.

 The functions `get` and `put` must each run in `O(1)` average time complexity.
 
 #### Constraints
 - `1 <= capacity <= 3000`
 - `0 <= key <= 10^4`
 - `0 <= value <= 10^5`
 - At most `2 * 10^5` calls will be made to get and put.
 
 */
public class Solution_0146 {
    private class Node {
        let key: Int
        let value: Int
        var next: Node?
        var prev: Node?
        
        init (_ key: Int = -1, _ value: Int = -1) {
            self.value = value
            self.key = key
        }
    }
    private var cache: [Int: Node]
    private let capacity: Int

    // sentinel nodes
    private var head: Node // .next = least recently used (LRU)
    private var tail: Node // .prev = most recently used (MRU)
    
    /// Overall Space Complexity:    `O(n)`
    init(_ capacity: Int) {
        cache = [Int: Node]()
        self.capacity = capacity
        
        head = Node()
        tail = Node()
        
        head.next = tail
        tail.prev = head
    }
    
    /**
     Runtime:    `O(1)`
     Space:      `O(1)`
        
     get the `value` if `key` exists, else return `-1`
     if exists, set to most recently used
     */
    public func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        
        removeFromList(node)
        setMRU(node)
        
        return node.value
    }
    
    /**
     Runtime:    `O(1)`
     Space:      `O(1)`
     
     if `key` already exists, remove old one
     create `newNode` and set to most recently used
     if `cache` is at `capacity`, remove least recently used
     */
    public func put(_ key: Int, _ value: Int) {
        if let oldNode = cache[key] {
            removeFromList(oldNode)
        }
        
        let newNode = Node(key, value)
        cache[key] = newNode
        setMRU(newNode)
        
        if cache.count > capacity {
            let lru = head.next!
            removeFromList(lru)
            cache[lru.key] = nil
        }
    }
    
    private func setMRU(_ node: Node) {
        let currentMRU = tail.prev!
        currentMRU.next = node
        
        node.prev = currentMRU
        node.next = tail
        
        tail.prev = node
    }
    
    private func removeFromList(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
}
