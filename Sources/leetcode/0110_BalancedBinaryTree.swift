import common

/**
 **[Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)** - Easy
 
 Given a binary tree, determine if it is _height-balanced._
 
 A **height-balanced** binary tree is a binary tree in which the depth of the 
 two subtrees of every node never differs by more than one.
 
 #### Constraints
 - The number of nodes in the tree is in the range `[0, 5000]`.
 - `-10^4 <= Node.val <= 10^4`
 */
public struct Solution_0110 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func isBalanced(_ root: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?) -> (isBalanced: Bool, height: Int) {
            guard let root = root else { return (true, 0) }
            let (left, right) = (dfs(root.left), dfs(root.right))
            let balance = left.isBalanced
            && right.isBalanced 
            && abs(left.height - right.height) <= 1
            return (balance, 1 + max(left.height, right.height))
        }
        return dfs(root).isBalanced
    }
}
