import XCTest
@testable import leetcode

final class _0242_ValidAnagramTests : XCTestCase {
    
    let isAnagram = Solution242.isAnagram
    
    func testAnagram() {
        XCTAssertTrue(isAnagram("anagram", "nagaram"))
    }
    
    func testNotAnagram() {
        XCTAssertFalse(isAnagram("rat", "car"))
    }
}
