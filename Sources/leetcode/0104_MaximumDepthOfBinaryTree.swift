import common

/**
 104 - Maximum Depth of Binary Tree - Easy
 
 Given the `root` of a binary tree, return its _maximum depth._

 A binary tree's **maximum depth** is the number of nodes along the longest path 
 from the root node down to the farthest leaf node.
 
 #### Constraints
 - The number of nodes in the tree is in the range `[0, 104]`.
 - `-100 <= Node.val <= 100`
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
