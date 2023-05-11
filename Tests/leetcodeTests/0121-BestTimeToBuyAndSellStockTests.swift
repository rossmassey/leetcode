import XCTest
@testable import leetcode

final class BestTimeToBuyAndSellStockTests : XCTestCase {

    let maxProfit = Solution121.maxProfit

    func testBestTime() {
        XCTAssertEqual(maxProfit([7,1,5,3,6,4]), 5)
    }

    func testNoBestTime() {
        XCTAssertEqual(maxProfit([7,6,4,3,1]), 0)
    }
}
