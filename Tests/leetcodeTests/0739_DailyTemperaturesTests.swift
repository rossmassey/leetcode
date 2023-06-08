import XCTest
@testable import leetcode

final class _0739_DailyTemperaturesTests : XCTestCase {

    let dailyTemperatures = Solution_0739.dailyTemperatures

    func testEightDays() {
        XCTAssertEqual(dailyTemperatures([73,74,75,71,69,72,76,73]), [1,1,4,2,1,1,0,0])
    }

    func testFourDays() {
        XCTAssertEqual(dailyTemperatures([30,40,50,60]), [1,1,1,0])
    }

    func testThreeDays() {
        XCTAssertEqual(dailyTemperatures([30,60,90]), [1,1,0])
    }
    
}
