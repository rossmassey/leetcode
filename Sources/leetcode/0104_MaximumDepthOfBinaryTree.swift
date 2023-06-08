import common

/**
 104 - Maximum Depth of Binary Tree - Easy
 */
public struct Solution_0104 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
