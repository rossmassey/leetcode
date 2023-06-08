import XCTest
@testable import leetcode

final class _0167_TwoSum2InputArrayIsSortedTests : XCTestCase {

    let twoSum = Solution_0167.twoSum

    func testArrayLengthFour() {
        XCTAssertEqual(twoSum([2,7,11,15],9), [1,2])
    }

    func testArrayLengthThree() {
        XCTAssertEqual(twoSum([2,3,4],6), [1,3])
    }

    func testArrayLengthTwo() {
        XCTAssertEqual(twoSum([-1,0],-1), [1,2])
    }

}
