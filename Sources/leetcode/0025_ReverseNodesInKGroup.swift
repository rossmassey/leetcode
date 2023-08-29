import common
/// **[Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group)** - Hard
///
/// Given the `head` of a linked list, reverse the nodes of the list `k` at a time,
/// and return the modified list.
///
/// `k` is a positive integer and is less than or equal to the length of the linked
/// list. If the number of nodes is not a multiple of `k` then left-out nodes, in
/// the end, should remain as it is.
///
/// You may not alter the values in the list's nodes, only nodes themselves may be
/// changed.
///
/// #### Constraints
/// - The number of nodes in the list is `n`.
/// - `1 <= k <= n <= 5000`
/// - `0 <= Node.val <= 1000`
///
public struct Solution_0025 {


    /// Runtime:    `O(n)`
    /// Space:      `O(1)`
    ///
    /// use helper function to get a node `k` places away from current
    ///
    /// use pointers to keep track of where groups start/end
    ///
    /// use regular linked list reversal algorithm on each group of `k` nodes
    ///
    public static func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let sentinel = ListNode(0, head)
        var prevGroupStart = sentinel

        // while at least 'k' nodes left
        while let currentGroupEnd = getKthNode(prevGroupStart, k) {
            let nextGroupStart = currentGroupEnd.next

            var prev = nextGroupStart
            var current = prevGroupStart.next

            // reverse k nodes
            while current !== nextGroupStart {
                let nextNode = current?.next
                current?.next = prev
                prev = current
                current = nextNode
            }

            // prepare for the next group
            let currentGroupStart = prevGroupStart.next
            prevGroupStart.next = currentGroupEnd
            prevGroupStart = currentGroupStart!
        }

        return sentinel.next
    }

    
    /**
     Return node `k` places away

     - Parameters:
        - start: node to start from
        - k: how far to travel
     
     - Returns: node `k` places away, or `nil` if does not exist
     */
    private static func getKthNode(_ start: ListNode?, _ k: Int) -> ListNode? {
        var node = start, count = k

        while let currentNode = node, count > 0 {
            node = currentNode.next
            count -= 1
        }

        return node
    }
}
