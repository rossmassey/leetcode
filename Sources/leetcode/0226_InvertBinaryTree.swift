import common

/**
 226 - Invert Binary Tree - Easy
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
