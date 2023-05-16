import XCTest
@testable import leetcode

final class SearchA2DMatrixTests : XCTestCase {

    let searchMatrix = Solution74.searchMatrix

    func testTargetPresent() {
        XCTAssertTrue(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
    }
    
    func testTargetNotPresent() {
        XCTAssertFalse(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))
    }

}
