import XCTest
@testable import leetcode

final class ThreeSumTests : XCTestCase {

    let threeSum = Solution15.threeSum
    
    func testOne() {
        XCTAssertEqual(threeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]])
    }

    func testTwo() {
        XCTAssertEqual(threeSum([0,1,1]), [])
    }
    
    func testEmpty() {
        XCTAssertEqual(threeSum([0,0,0]), [[0,0,0]])
    }
    
}
