import XCTest
@testable import leetcode

final class LargestRectangleInHistogramTests : XCTestCase {

    let largestRectangleArea = Solution84.largestRectangleArea

    func testArray() {
        XCTAssertEqual(largestRectangleArea([2,1,5,6,2,3]), 10)
    }
    
    func testSmallerArray() {
        XCTAssertEqual(largestRectangleArea([2,4]), 4)
    }
    
    func testLongerArray() {
        XCTAssertEqual(largestRectangleArea([4,2,0,3,2,4,3,4]), 10)
    }

}
