import XCTest
@testable import leetcode

final class _0853_CarFleetTests : XCTestCase {

    let carFleet = Solution_0853.carFleet

    func testOneCar() {
        XCTAssertEqual(carFleet(12, [10,8,0,5,3], [2,4,1,1,3]), 3)
    }
    
    func testFiveCars() {
        XCTAssertEqual(carFleet(10, [3], [3]), 1)
    }
    
    func testThreeCarsBigTarget() {
        XCTAssertEqual(carFleet(100, [0,2,4], [4,2,1]), 1)
    }

}
