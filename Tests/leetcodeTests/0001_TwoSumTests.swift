import XCTest
import common
@testable import leetcode

final class _0001_TwoSumTests : XCTestCase {
    
    let twoSum = Solution_0001.twoSum
    
    func testLengthFourArray() {
        let expectedOutput = setOfUniqueElementsAnyOrder([0,1])
        let output = setOfUniqueElementsAnyOrder(twoSum([2,7,11,15], 9))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testLengthThreeArray() {
        let expectedOutput = setOfUniqueElementsAnyOrder([1,2])
        let output = setOfUniqueElementsAnyOrder(twoSum([3,2,4], 6))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testLengthTwoArray() {
        let expectedOutput = setOfUniqueElementsAnyOrder([0,1])
        let output = setOfUniqueElementsAnyOrder(twoSum([3,3], 6))
        XCTAssertEqual(expectedOutput, output)
    }
}
