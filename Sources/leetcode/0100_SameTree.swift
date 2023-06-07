import common

/**
 100 - Same Tree - Easy
 */
struct Solution100 {
    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        p == q
    }
}

extension TreeNode: Equatable {
    /**
     Runtime:    `O(n)`
     Space:      `O(n)`
     
     Extends `TreeNode` to conform to equatable, implementing `==` using dfs/recursion
     */
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return match(lhs,rhs)
    }
    
    static func match (_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == q }
        if p.val != q.val { return false }
        return match(p.left, q.left) && match(p.right, q.right)
    }
}
