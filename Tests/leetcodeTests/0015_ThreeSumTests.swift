import XCTest
import common
@testable import leetcode

final class _0015_ThreeSumTests : XCTestCase {

    let threeSum = Solution_0015.threeSum
    
    func testOne() {
        let expectedOutput = setOfUniqueElementsAnyOrder([[-1,-1,2],[-1,0,1]])
        let output = setOfUniqueElementsAnyOrder(threeSum([-1,0,1,2,-1,-4]))
        XCTAssertEqual(output, expectedOutput)
    }

    func testTwo() {
        let expectedOutput = setOfUniqueElementsAnyOrder([[Int]]())
        let output = setOfUniqueElementsAnyOrder(threeSum([0,1,1]))
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testEmpty() {
        let expectedOutput = setOfUniqueElementsAnyOrder([[0,0,0]])
        let output = setOfUniqueElementsAnyOrder(threeSum([0,0,0]))
        XCTAssertEqual(output, expectedOutput)
    }
    
}
