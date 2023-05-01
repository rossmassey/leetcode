import common

/**
 104 - Maximum Depth of Binary Tree - Easy
 
 Runtime:    O(n)
 Spacetime:  O(n)
 
 */
struct Solution104 {
    static func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
