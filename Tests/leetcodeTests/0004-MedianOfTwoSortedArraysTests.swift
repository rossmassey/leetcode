import XCTest
@testable import leetcode

final class MedianOfTwoSortedArraysTests : XCTestCase {

    let findMedianSortedArrays = Solution4.findMedianSortedArrays

    func testOdd() {
        XCTAssertEqual(findMedianSortedArrays([1,3],[2]), 2)
    }
    
    func testEven() {
        XCTAssertEqual(findMedianSortedArrays([1,2],[3,4]), 2.5)
    }

}
