/**
    Leetcode provided `TreeNode` class
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public extension TreeNode {
    /**
        Converts an array of Integers representing a level-order traversal of a binary tree into a binary tree of TreeNode objects.

        - Parameter array: An array of optional Integers, where each element represents a node value in the tree. Use `nil` for empty nodes.
        - Returns: The root node of the resulting binary tree. Returns `nil` if the input array is empty.
    */
    static func binaryTreeFrom(_ array: [Int?]) -> TreeNode? {
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
    static func arrayFrom(_ root: TreeNode?) -> [Int?] {
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
}
