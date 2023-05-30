import XCTest
@testable import leetcode

final class SearchInRotatedSortedArrayTests : XCTestCase {

    let search = Solution33.search

    func testPresent() {
        XCTAssertEqual(search([4,5,6,7,0,1,2], 0), 4)
    }
    
    func testNotPresent() {
        XCTAssertEqual(search([4,5,6,7,0,1,2], 3), -1)
    }
    
    func testNotPresentShortArray() {
        XCTAssertEqual(search([1], 0), -1)
    }
    
}
