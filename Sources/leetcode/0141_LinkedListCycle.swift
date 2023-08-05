import common

/**
 **[Linked List Cycle](https://leetcode.com/problems/linked-list-cycle)** - Easy
 
 Given `head`, the head of a linked list, determine if the linked list 
 has a cycle in it.

 There is a cycle in a linked list if there is some node in the list 
 that can be reached again by continuously following the `next` pointer. 
 Internally, `pos` is used to denote the index of the node that tail's 
 `next` pointer is connected to. Note that `pos` is not passed as a parameter.

 Return `true` if there is a cycle in the linked list. Otherwise, return `false`.
 
 #### Constraints
 - The number of the nodes in the list is in the range `[0, 10^4]`.
 - `10^5 <= Node.val <= 10^5`
 - `pos` is -1 or a valid index in the linked-list.

*/
public struct Solution_0141 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     use floyd's cycle detection utilizing a fast/slow pointer

     if there is a cycle, the fast/slow pointer will meet in O(n) time
    */
    public static func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head, slow = head

        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next

            if fast === slow { return true }
        }
        return false
    }
}
