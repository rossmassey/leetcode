/**
 226 - Invert Binary Tree - Easy
 
 Runtime:    O(n)
 Spacetime:  O(n)
 
 */

import common

struct Solution226 {
    
    typealias TreeNode = common.TreeNode
    
    @discardableResult
    static func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (root.right, root.left)
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}