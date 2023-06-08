import common

/**
 226 - Balanced Binary Tree - Easy
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
