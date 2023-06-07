import XCTest
@testable import leetcode

final class _0020_ValidParenthesesTests : XCTestCase {
    
    let isValid = Solution20.isValid

    func testOneValidPair() {
        XCTAssertTrue(isValid("()"))
    }

    func testThreeConsecutiveValidPair() {
        XCTAssertTrue(isValid("()[]{}"))
    }

    func testComplicatedPair() {
        XCTAssertTrue(isValid("([]{()})"))
    }

    func testInvalidPair() {
        XCTAssertFalse(isValid("([]"))
    }
}

