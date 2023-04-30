import XCTest
@testable import leetcode

final class ValidPalindromeTests : XCTestCase {
    
    let isPalindrome = Solution125.isPalindrome
    
    func testPalindrome() {
        XCTAssertTrue(isPalindrome("A man, a plan, a canal: Panama"))
    }
    
    func testNotPalindrome() {
        XCTAssertFalse(isPalindrome("race a car"))
    }
    
    func testEmptyString() {
        XCTAssertTrue(isPalindrome(" "))
    }
}
