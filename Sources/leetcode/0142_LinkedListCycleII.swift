import common
/**
 **[Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii)** - Medium
 
 Given the `head` of a linked list, return the node where the cycle begins.
 If there is no cycle, return `null`.

 There is a cycle in a linked list if there is some node in the list that can 
 be reached again by continuously following the `next` pointer.
 
 Internally, `pos` is used to denote the index of the node that tail's `next`
 pointer is connected to (0-indexed). It is `-1` if there is no cycle.
 
 Note that `pos` is not passed as a parameter. **Do not modify** the linked list.
 
 #### Constraints
 
 - The number of the nodes in the list is in the range `[0, 10^4]`.
 - `-10^5 <= Node.val <= 10^5`
 - `pos` is `-1` or a **valid index** in the linked-list.
 
*/
public struct Solution_0142 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     use slow/fast pointer, find where they intersect (else `nil` for no cycle)
     
     slow from head + slow from intersection will meet at beginning of cycle
    */
    public static func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                break
            }
        }
        
        guard fast?.next != nil else { return nil }

        fast = head
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next
        }

        return slow
    }
}
