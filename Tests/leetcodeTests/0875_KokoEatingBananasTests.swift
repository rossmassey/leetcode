import XCTest
@testable import leetcode

final class _0875_KokoEatingBananasTests : XCTestCase {

    let minEatingSpeed = Solution_0875.minEatingSpeed

    func testEightHours() {
        XCTAssertEqual(minEatingSpeed([3,6,7,11], 8), 4)
    }
    
    func testFiveHours() {
        XCTAssertEqual(minEatingSpeed([30,11,23,4,20], 5), 30)
    }
    
    func testSixHours() {
        XCTAssertEqual(minEatingSpeed([30,11,23,4,20], 6), 23)
    }

}
