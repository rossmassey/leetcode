import XCTest
@testable import leetcode

final class Test242 : XCTestCase {
    
    let isAnagram = Solution242.isAnagram
    
    func testAnagram() {
        XCTAssertEqual(isAnagram("anagram", "nagaram"), true)
    }
    
    func testNotAnagram() {
        XCTAssertEqual(isAnagram("rat", "car"), false)
    }
}
