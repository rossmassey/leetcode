import Foundation

/**
    Returns a set of unique elements from the input array, regardless of their order.

    - Parameter arr: The input array of type `T` that conforms to `Hashable`.
    - Returns: A set of unique elements from the input array.
 */
public func anyOrderArray<T: Hashable>(_ arr: [T]) -> Set<T> {
    return Set(arr)
}

/**
    Returns a set of unique sets of elements from the input array of arrays, regardless of their order.

    - Parameter arr: The input array of arrays of type `T` that conforms to `Hashable`.
    - Returns: A set of unique sets of elements from the input array.
*/
public func anyOrderArrayOfArrays<T: Hashable>(_ arr: [[T]]) -> Set<Set<T>> {
    let innerSets = arr.map { Set($0) }
    return Set(innerSets)
}

/**
    Converts an array of Integers representing a level-order traversal of a binary tree into a binary tree of TreeNode objects.

    - Parameter array: An array of optional Integers, where each element represents a node value in the tree. Use `nil` for empty nodes.
    - Returns: The root node of the resulting binary tree. Returns `nil` if the input array is empty.
*/
public func arrayToTree(_ array: [Int?]) -> TreeNode? {
    if array.isEmpty { return nil }
    
    let root = TreeNode(array[0] ?? 0)
    var queue: [TreeNode] = [root]
    var index = 1
    
    while !queue.isEmpty && index < array.count {
        let currentNode = queue.removeFirst()
        
        if let leftValue = array[index] {
            currentNode.left = TreeNode(leftValue)
            queue.append(currentNode.left!)
        }
        
        index += 1
        
        if index < array.count, let rightValue = array[index] {
            currentNode.right = TreeNode(rightValue)
            queue.append(currentNode.right!)
        }
        
        index += 1
    }
    
    return root
}

/**
    Converts a binary tree of TreeNode objects into an array of Integers representing a level-order traversal of the binary tree.

    - Parameter root: The root node of the binary tree to be converted.
    - Returns: An array of optional Integers, where each element represents a node value in the tree. Empty nodes are represented by `nil`.
*/
public func treeToArray(_ root: TreeNode?) -> [Int?] {
    guard let rootNode = root else { return [] }

    var queue: [TreeNode?] = [rootNode]
    var array: [Int?] = []

    while !queue.isEmpty {
        let currentNode = queue.removeFirst()

        if let node = currentNode {
            array.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        } else {
            array.append(nil)
        }
    }

    // Remove trailing nil values
    while let last = array.last, last == nil {
        array.removeLast()
    }

    return array
}
