import common

/**
 543 - Diameter of Binary Tree - Easy
 
 Given the `root` of a binary tree, return the length of the **diameter** of the tree.

 The **diameter** of a binary tree is the **length** of the longest path between any two nodes in a tree. This path may or may not pass through the `root`.

 The **length** of a path between two nodes is represented by the number of edges between them.
 
 #### Constraints
 - The number of nodes in the tree is in the range `[1, 10^4]`.
 - `-100 <= Node.val <= 100`
 */
public struct Solution_0543 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var longestPath = 0
        
        @discardableResult
        func dfs(_ node: TreeNode?) -> Int {
            guard let currentNode = node else { return 0 }
            let (left, right) = (dfs(currentNode.left), dfs(currentNode.right))
            longestPath = max(longestPath, left + right)
            return 1 + max(left, right)
        }
        
        dfs(root)
        return longestPath
    }
}
