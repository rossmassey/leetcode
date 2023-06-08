import common

/**
 543 - Diameter of Binary Tree - Easy
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
