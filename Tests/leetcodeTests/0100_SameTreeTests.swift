import XCTest
import common
@testable import leetcode

final class _0100_SameTreeTests : XCTestCase {

    let isSameTree = Solution_0100.isSameTree

    func testSameTree() {
        let p = TreeNode.binaryTreeFrom([1,2,3])
        let q = TreeNode.binaryTreeFrom([1,2,3])
        XCTAssertTrue(isSameTree(p,q))
    }

    func testNotSameTree() {
        let p = TreeNode.binaryTreeFrom([1,2])
        let q = TreeNode.binaryTreeFrom([1,nil,2])
        XCTAssertFalse(isSameTree(p,q))
    }

    func testDifferentNotSameTree() {
        let p = TreeNode.binaryTreeFrom([1,2,1])
        let q = TreeNode.binaryTreeFrom([1,1,2])
        XCTAssertFalse(isSameTree(p,q))
    }

}
