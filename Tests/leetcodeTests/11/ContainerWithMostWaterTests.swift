import XCTest
@testable import leetcode

final class ContainerWithMostWaterTests : XCTestCase {

    let maxArea = Solution11.maxArea

    func testMaxArea() {
        XCTAssertEqual(maxArea([1,8,6,2,5,4,8,3,7]), 49)
    }
    
    func testTwoElements() {
        XCTAssertEqual(maxArea([1,1]), 1)
    }
    
    func testEmpty() {
        XCTAssertEqual(maxArea([]), 0)
    }
    
}
