/**
    Leetcode provided `Node` class
 */
public class Node: Hashable {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
          self.random = nil
    }
    
    // Leetcode's Swift implementation conforms to `Hashable`, by reference
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

public extension Node {
    /**
        Creates a random pointer linked list from a given 2D array
        Each element of the 2D array represents a node: `[[val, index of random node]]`

        - Parameter array: array representing the random pointer linked list
        - Returns: head of the random pointer linked list, or `nil` if the array was empty.
    */
    static func createRandomPointerLinkedList(from array: [[Int?]]) -> Node? {
        guard !array.isEmpty else { return nil }

        var nodes: [Node?] = []
        // create nodes
        for item in array {
            let val = item[0] ?? 0
            let node = Node(val)
            nodes.append(node)
        }
        // set next pointers
        for i in 0..<nodes.count - 1 {
            nodes[i]?.next = nodes[i + 1]
        }
        // set random pointers
        for (index, item) in array.enumerated() {
            if let randomIndex = item[1], randomIndex < nodes.count {
                nodes[index]?.random = nodes[randomIndex]
            }
        }

        return nodes[0]
    }
    
    /**
        Converts a given 2D array to a random pointer linked list from
        Each element of the 2D array represents a node: `[[val, index of random node]]`

        - Parameter head: head of the random pointer linked list
        - Returns: array representing the random pointer linked list
    */
    static func randomPointerLinkedListToArray(head: Node?) -> [[Int?]] {
        var array: [[Int?]] = []
        var nodes: [Node?] = []
        var current = head

        // add nodes to array and record their indices
        while current != nil {
            nodes.append(current)
            array.append([current!.val, nil])
            current = current?.next
        }

        // fill in random pointers using indices
        for (index, node) in nodes.enumerated() {
            if let randomNode = node?.random {
                array[index][1] = nodes.firstIndex { $0 === randomNode }
            }
        }

        return array
    }

}
