/**
    Leetcode provided `ListNode` class
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


public extension ListNode {
    /**
        Converts an array into a Linked List of `ListNode?`

        - Parameter array: The array to be converted into a Linked List
        - Returns: The head of the Linked List, or nil if the array was empty
    */
    static func linkedListFrom(_ array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        
        let head = ListNode(array[0])
        var currentNode = head
        
        for value in array.dropFirst() {
            let newNode = ListNode(value)
            currentNode.next = newNode
            currentNode = newNode
        }
        
        return head
    }

    /**
        Converts a Linked List of `ListNode?` into an array

        - Returns: An array of Ints representing the values in the Linked List or an empty array if the list was nil
    */
    static func arrayFrom(_ head: ListNode?) -> [Int] {
        var currentNode: ListNode? = head
        var array: [Int] = []
        
        while let node = currentNode {
            array.append(node.val)
            currentNode = node.next
        }
        
        return array
    }

    /**
        Compares two LinkedLists value wise. Did not implement `Equatable` since 
        `ListNode` not always used in LinkedList context

        - Returns: A boolean representing whether the LinkedLists matched
    */
    static func areLinkedListsEqual(_ list1: ListNode?, _ list2: ListNode?) -> Bool {
        var pointer1: ListNode? = list1
        var pointer2: ListNode? = list2
        
        while let node1 = pointer1, let node2 = pointer2 {
            guard node1.val == node2.val else { return false }
            (pointer1, pointer2) = (node1.next, node2.next)
        }
        
        return pointer1 == nil && pointer2 == nil
    }
}
