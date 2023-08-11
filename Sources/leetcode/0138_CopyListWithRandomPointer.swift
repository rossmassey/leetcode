import common
/**
 **[Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer)** - Medium
 
 A linked list of length `n` is given such that each node contains an additional
 random pointer, which could point to any node in the list, or `null`.

 Construct a **deep copy** of the list. The deep copy should consist of exactly
 `n` brand new nodes, where each new node has its value set to the value of its
 corresponding original node. Both the `next` and `random` pointer of the new nodes
 should point to new nodes in the copied list such that the pointers in the
 original list and copied list represent the same list state. **None of the
 pointers in the new list should point to nodes in the original list.**

 For example, if there are two nodes `X` and `Y` in the original list, where
` X.random --> Y,` then for the corresponding two nodes `x` and `y` in the copied
 list, `x.random --> y`.

 Return the _head of the copied linked list._

 The linked list is represented in the input/output as a list of `n` nodes. Each
 node is represented as a pair of `[val, random_index]` where:

- `val`: an integer representing `Node.val`
- `random_index`: the index of the node (range from `0` to `n-1`) that the `random`
  pointer points to, or `null` if it does not point to any node.

 Your code will **only** be given the `head` of the original linked list.
 
 #### Constraints
 
 - `0 <= n <= 1000`
 - `-10^4 <= Node.val <= 10^4`
 - `Node.random` is `null` or is pointing to some node in the linked list.
 
*/
public struct Solution_0138 {

    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
    
     create copies and store in a dictionary, keyed to the original node
     
     use a second pass to map copied nodes to original's `.next` and `.random`
    */
    public static func copyRandomList(_ head: Node?) -> Node? {
        var originalToCopy = [Node?:Node]()

        // key copied nodes by originals in dictionary
        var pointer = head
        while let current = pointer {
            let copy = Node(current.val)
            originalToCopy[current] = copy

            pointer = pointer?.next
        }

        // use dictionary to map `.next` and `.random` to correct copys
        pointer = head
        while let current = pointer {
            let copy = originalToCopy[current]!
            copy.next = originalToCopy[current.next]
            copy.random = originalToCopy[current.random]

            pointer = pointer?.next
        }

        return originalToCopy[head]
    }
    
    /**
     Runtime:    `O(n)`
     Space:      `O(1)`
    
     interleave copied nodes adjacent to their original node
     
     use a second pass to set copied node's `.random`  to original node's
     (adjacent, therefore a copy) `.random` value
     
     use a third pass seperate original list from copy list
    */
    public static func copyRandomListNoAuxiliarySpace(_ head: Node?) -> Node? {
        guard head != nil else { return nil }

        // create copys and interleave with original list
        var pointer = head
        while let original = pointer {
            let copy = Node(original.val)
            copy.next = original.next
            original.next = copy

            pointer = copy.next
        }
        let clonedHead = head?.next

        // update random pointers in copy list
        pointer = head
        while let original = pointer, let copy = original.next {
            copy.random = original.random?.next

            pointer = copy.next
        }

        // seperate copys from original list
        pointer = head
        var copyPointer = clonedHead
        while let original = pointer, let copy = copyPointer {
            original.next = original.next?.next
            copy.next = copy.next?.next

            pointer = original.next
            copyPointer = copy.next
        }

        return clonedHead
    }
}
