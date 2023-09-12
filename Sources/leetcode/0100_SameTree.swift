import common

/**
 **[Same Tree](https://leetcode.com/problems/same-tree/)** - Easy
 
 Given the roots of two binary trees `p` and `q`, write a function to check if 
 they are the same or not.

 Two binary trees are considered the same if they are structurally identical, 
 and the nodes have the same value.
 
 #### Constraints
 - The number of nodes in both trees is in the range `[0, 100]`.
 - `-10^4 <= Node.val <= 10^4`
 */
public struct Solution_0100 {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     */
    public static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        p == q
    }
}

// extends `TreeNode` to conform to equatable, implementing `==` using dfs/recursion
extension TreeNode: Equatable {

    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return match(lhs, rhs)
    }
    
    static func match (_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == q }
        if p.val != q.val { return false }
        return match(p.left, q.left) && match(p.right, q.right)
    }
}
