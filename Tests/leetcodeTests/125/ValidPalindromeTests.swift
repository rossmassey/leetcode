import XCTest
@testable import leetcode

final class ValidPalindromeTests : XCTestCase {
    
    let isPalindrome = Solution125.isPalindrome
    
    func testPalindrome() {
        XCTAssertEqual(isPalindrome("A man, a plan, a canal: Panama"), true)
    }
    
    func testNotPalindrome() {
        XCTAssertEqual(isPalindrome("race a car"), false)
    }
    
    func testEmptyString() {
        XCTAssertEqual(isPalindrome(" "), true)
    }
}
