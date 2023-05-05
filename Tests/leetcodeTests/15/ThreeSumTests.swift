import XCTest
import common
@testable import leetcode

final class ThreeSumTests : XCTestCase {

    let threeSum = Solution15.threeSum
    
    func testOne() {
        let expectedOutput = anyOrderArray([[-1,-1,2],[-1,0,1]])
        let output = anyOrderArray(threeSum([-1,0,1,2,-1,-4]))
        XCTAssertEqual(output, expectedOutput)
    }

    func testTwo() {
        let expectedOutput = anyOrderArray([[Int]]())
        let output = anyOrderArray(threeSum([0,1,1]))
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testEmpty() {
        let expectedOutput = anyOrderArray([[0,0,0]])
        let output = anyOrderArray(threeSum([0,0,0]))
        XCTAssertEqual(output, expectedOutput)
    }
    
}
