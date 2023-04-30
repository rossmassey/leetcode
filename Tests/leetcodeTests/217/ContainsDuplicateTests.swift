import XCTest
@testable import leetcode

final class ContainsDuplicateTests : XCTestCase {
    
    let containsDuplicate = Solution217.containsDuplicate
    
    func testSingleElementArray() {
        XCTAssertEqual(containsDuplicate([1]), false)
    }
    
    func testArrayWithDuplicate() {
        XCTAssertEqual(containsDuplicate([1,2,3,1]), true)
    }
    
    func testArrayWithoutDuplicate() {
        XCTAssertEqual(containsDuplicate([1,2,3,4]), false)
    }
}
