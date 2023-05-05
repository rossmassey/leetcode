import XCTest
@testable import leetcode

final class TrappingRainWaterTests : XCTestCase {

    let trap = Solution42.trap

    func testTrappingRainWater() {
        XCTAssertEqual(trap([0,1,0,2,1,0,1,3,2,1,2,1]),6)
    }
    
    func testTrappingRainWaterAlternate() {
        XCTAssertEqual(trap([4,2,0,3,2,5]),9)
    }

}
