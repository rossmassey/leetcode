import XCTest
@testable import leetcode

final class FindMinimumInRotatedSortedArrayTests : XCTestCase {

    let findMin = Solution153.findMin

    func testRotatedByThree() {
        XCTAssertEqual(findMin([3,4,5,1,2]), 1)
    }
    
    func testRotatedByFour() {
        XCTAssertEqual(findMin([0,1,2,4,5,6,7]), 0)
    }
    
    func testRotatedByFourAgain() {
        XCTAssertEqual(findMin([11,13,15,17]), 11)
    }

}
