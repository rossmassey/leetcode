import common

/**
 21 - Merge Two Sorted Lists - Easy
 
 > `n` is length of `list1`, `m` is length of `list2`
 */
public struct Solution_0021 {
    /**
     Runtime:    `O(n + m)`
     Space:      `O(n + m)`
     */
    public static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        guard let node1 = list1 else { return list2 }
        guard let node2 = list2 else { return list1 }
        
        if node1.val < node2.val {
            node1.next = mergeTwoLists(node1.next, node2)
            return node1
        } else {
            node2.next = mergeTwoLists(node1, node2.next)
            return node2
        }
    }
    
    /**
     Runtime:    `O(n + m)`
     Space:      `O(1)`
     
     utilizing two pointers
     */
    public static func mergeTwoListsIteratively(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        let tempNode = ListNode()
        var tail: ListNode = tempNode
        
        var pointer1 = list1
        var pointer2 = list2
        
        while let node1 = pointer1, let node2 = pointer2 {
            if node1.val < node2.val {
                tail.next = node1
                pointer1 = node1.next
            } else {
                tail.next = node2
                pointer2 = node2.next
            }
            tail = tail.next!
        }
        
        if pointer1 != nil {
            tail.next = pointer1
        } else {
            tail.next = pointer2
        }
        
        return tempNode.next
    }
}