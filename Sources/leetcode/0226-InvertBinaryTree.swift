import common

/**
    226 - Invert Binary Tree - Easy
 
    Runtime:    `O(n)`
    Space:      `O(n)`
 
 */
struct Solution226 {
    @discardableResult
    static func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (root.right, root.left)
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
