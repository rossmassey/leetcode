import XCTest
import common
@testable import leetcode

final class _0104_MaximumDepthOfBinaryTreeTests : XCTestCase {
    
    let maxDepth = Solution_0104.maxDepth

    func testDepthThreeTree() {
        let input = TreeNode.binaryTreeFrom([3,9,20,nil,nil,15,7])
        XCTAssertEqual(maxDepth(input), 3)
    }

        func testDepthTwoTree() {
        let input = TreeNode.binaryTreeFrom([1,nil,2])
        XCTAssertEqual(maxDepth(input), 2)
    }
}
