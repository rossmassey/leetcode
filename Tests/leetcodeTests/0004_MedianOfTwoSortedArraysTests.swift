import XCTest
@testable import leetcode

final class _0004_MedianOfTwoSortedArraysTests : XCTestCase {

    let findMedianSortedArrays = Solution_0004.findMedianSortedArrays

    func testOdd() {
        XCTAssertEqual(findMedianSortedArrays([1,3],[2]), 2)
    }
    
    func testEven() {
        XCTAssertEqual(findMedianSortedArrays([1,2],[3,4]), 2.5)
    }

}
