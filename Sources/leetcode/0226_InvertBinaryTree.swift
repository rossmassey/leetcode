import common

/**
 226 - Invert Binary Tree - Easy
 
 Given the `root` of a binary tree, invert the tree, and return its root.
 
 #### Constraints
 - The number of nodes in the tree is in the range `[0, 100]`.
 - `-100 <= Node.val <= 100`
 */
public struct Solution_0226 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    @discardableResult
    public static func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (root.right, root.left)
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
