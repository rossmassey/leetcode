import XCTest
@testable import leetcode

final class _0704_BinarySearchTests : XCTestCase {
    
    let search = Solution_0704.search

    func testEmptyArray() {
        XCTAssertEqual(search([],1), -1)
    }

    func testTargetFound() {
        XCTAssertEqual(search([-1,0,3,5,9,12],9), 4)
    }

    func testTargetNotFound() {
        XCTAssertEqual(search([-1,0,3,5,9,12],2), -1)
    }
}
