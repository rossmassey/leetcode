import XCTest
import common
@testable import leetcode

final class _0110_BalancedBinaryTreeTests : XCTestCase {
    
    let isBalanced = Solution_0110.isBalanced

    func testBalancedTree() {
        XCTAssertTrue(isBalanced(TreeNode.binaryTreeFrom([3,9,20,nil,nil,15,7])))
    }

    func testUnBalancedTree() {
        XCTAssertFalse(isBalanced(TreeNode.binaryTreeFrom([1,2,2,3,3,nil,nil,4,4])))
    }

    func testEmptyTree() {
        XCTAssertTrue(isBalanced(TreeNode.binaryTreeFrom([])))
    }

}
