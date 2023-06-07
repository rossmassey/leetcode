import XCTest
@testable import leetcode

final class _0217_ContainsDuplicateTests : XCTestCase {
    
    let containsDuplicate = Solution217.containsDuplicate
    
    func testSingleElementArray() {
        XCTAssertFalse(containsDuplicate([1]))
    }
    
    func testArrayWithDuplicate() {
        XCTAssertTrue(containsDuplicate([1,2,3,1]))
    }
    
    func testArrayWithoutDuplicate() {
        XCTAssertFalse(containsDuplicate([1,2,3,4]))
    }
}
