import common
/**
 **[Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list)** - Medium
 
 Given the `head` of a linked list, remove the `n`th node from the end of the list
 and return its head.
 
 #### Constraints
 
 - The number of nodes in the list is `sz`.
 - `1 <= sz <= 30`
 - `0 <= Node.val <= 100`
 - `1 <= n <= sz`
 
*/
public struct Solution_0019 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     single pass approach using a `slow`/`fast` pointer
     `fast` pointer is offset by `n` places from `slow.next` (`head`)
     when it reaches end, `slow` is at the one we want to remove
     
     need reference to previous node, to have its next set to deleted node's next
     so offset is `n + 1` places
     
     if `n` is length of list, the new head will be `head.next`
     so a `dummy` node set before the head is used to store final head
    */
    public static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // use dummy node in case removing head
        let dummy = ListNode()
        dummy.next = head

        var slow: ListNode? = dummy
        var fast: ListNode? = head

        // set fast node ahead of slow (dummy) by `n + 1` places
        var offset = 0
        while offset < n {
            fast = fast?.next
            offset += 1
        }

        // when fast node is at end, slow.next is behind by `n` places
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }

        // remove it by setting slow.next to the node after
        slow?.next = slow?.next?.next

        // dummy.next will be current head of list
        return dummy.next
    }
}
