import XCTest
import common
@testable import leetcode

final class MaximumDepthOfBinaryTreeTests : XCTestCase {
    
    let maxDepth = Solution104.maxDepth

    func testDepthThreeTree() {
        let input = common.arrayToTree([3,9,20,nil,nil,15,7])
        XCTAssertEqual(maxDepth(input), 3)
    }

        func testDepthTwoTree() {
        let input = common.arrayToTree([1,nil,2])
        XCTAssertEqual(maxDepth(input), 2)
    }
}