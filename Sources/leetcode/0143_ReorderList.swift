import common
/**
 **[Reorder List](https://leetcode.com/problems/reorder-list)** - Medium
 
 You are given the head of a singly linked-list.
 The list can be represented as:

 `L0 → L1 → … → Ln - 1 → Ln`

 Reorder the list to be on the following form:

 `L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …`

 You may not modify the values in the list's nodes.
 Only nodes themselves may be changed.
 
 #### Constraints
 
 - The number of nodes in the list is in the range `[1, 5 * 10^4]`.
 - `1 <= Node.val <= 1000`
 
*/
public struct Solution_0143 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
     
     reverse second half of the linked list in-place
     interleave/merge it with first half in-place
    */
    public static func reorderList(_ head: ListNode?) {
        interleave(head, with: reverse(from: getMiddle(head)))
    }
    
    
    static func getMiddle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    static func reverse(from node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = node
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }

    static func interleave(_ list1: ListNode?, with list2: ListNode?) {
        var first = list1
        var second = list2
        var tmpNext: ListNode? = nil

        while second?.next != nil {
            tmpNext = first?.next
            first?.next = second
            first = tmpNext

            tmpNext = second?.next
            second?.next = first
            second = tmpNext
        }
    }
}
