import XCTest
import common
@testable import leetcode

final class _0543_DiameterOfBinaryTreeTests : XCTestCase {
    
    let diameterOfBinaryTree = Solution_0543.diameterOfBinaryTree

    func testDiameterThree() {
        XCTAssertEqual(diameterOfBinaryTree(TreeNode.binaryTreeFrom([1,2])), 1)
    }
    
    func testDiameterOne() {
        XCTAssertEqual(diameterOfBinaryTree(TreeNode.binaryTreeFrom([1,2,3,4,5])), 3)
    }

}
