import XCTest
import common
@testable import leetcode

final class diameterOfBinaryTreeTests : XCTestCase {
    
    let diameterOfBinaryTree = Solution543.diameterOfBinaryTree

    func testDiameterThree() {
        XCTAssertEqual(diameterOfBinaryTree(TreeNode.binaryTreeFrom([1,2])), 1)
    }
    
    func testDiameterOne() {
        XCTAssertEqual(diameterOfBinaryTree(TreeNode.binaryTreeFrom([1,2,3,4,5])), 3)
    }

}
