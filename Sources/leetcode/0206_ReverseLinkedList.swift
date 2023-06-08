import common

/**
 206 - Reverse Linked List - Easy
 */
public struct Solution_0206 {
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     use two pointers (`previousNode`, and `pointer`) and temp to hold former
     next node (`nextNode`)
     */
    public static func reverseList(_ head: ListNode?) -> ListNode? {
        
        var previousNode = ListNode?.none
        var pointer = head
        
        while let currentNode = pointer {
            let nextNode = currentNode.next
            currentNode.next = previousNode
            previousNode = currentNode
            pointer = nextNode
        }
        
        return previousNode
    }
}
