import common
/**
 **[Add Two Numbers](https://leetcode.com/problems/add-two-numbers)** - Medium
 
 You are given two **non-empty** linked lists representing two non-negative integers
 The digits are stored in **reverse** order, each of their nodes contains a single digit.
 
 Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, 
 except the number 0 itself
 
 #### Constraints
 
 - The number of nodes in each linked list is in the range `[1, 100]`.
 - `0 <= Node.val <= 9`
 - It is guaranteed that the list represents a number that does not have leading zeros.

*/
public struct Solution_0002 {

    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     digits are stored in little endian order, can just iterate through
     
     add node values (use `0` if one is `nil`) with the carry from previous sum
    */
    public static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var last = dummy

        var pointer1 = l1
        var pointer2 = l2

        var carry = 0

        // 3 cases where we are adding another node to sum list
        while pointer1 != nil || pointer2 != nil || carry != 0 {
            
            // treat nil values as 0
            let x = pointer1?.val ?? 0
            let y = pointer2?.val ?? 0

            let sum = x + y + carry
            carry = sum < 10 ? 0 : 1

            let newNode = ListNode(sum % 10)
            last.next = newNode
            last = newNode

            pointer1 = pointer1?.next
            pointer2 = pointer2?.next
        }

        return dummy.next
    }
}
