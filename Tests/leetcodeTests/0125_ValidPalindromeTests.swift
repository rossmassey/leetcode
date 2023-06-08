import XCTest
@testable import leetcode

final class _0125_ValidPalindromeTests : XCTestCase {
    
    let isPalindrome = Solution_0125.isPalindrome
    
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
