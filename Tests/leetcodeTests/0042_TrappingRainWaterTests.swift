import XCTest
@testable import leetcode

final class _0042_TrappingRainWaterTests : XCTestCase {

    let trap = Solution_0042.trap

    func testTrappingRainWater() {
        XCTAssertEqual(trap([0,1,0,2,1,0,1,3,2,1,2,1]),6)
    }
    
    func testTrappingRainWaterAlternate() {
        XCTAssertEqual(trap([4,2,0,3,2,5]),9)
    }

}
