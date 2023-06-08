import common

/**
 100 - Same Tree - Easy
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
        return match(lhs,rhs)
    }
    
    static func match (_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == q }
        if p.val != q.val { return false }
        return match(p.left, q.left) && match(p.right, q.right)
    }
}
