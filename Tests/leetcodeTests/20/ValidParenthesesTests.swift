import XCTest
@testable import leetcode

final class ValidParenthesesTests : XCTestCase {
    
    let isValid = Solution20.isValid

    func testOneValidPair() {
        XCTAssertEqual(isValid("()"), true)
    }

    func testThreeConsecutiveValidPair() {
        XCTAssertEqual(isValid("()[]{}"), true)
    }

    func testComplicatedPair() {
        XCTAssertEqual(isValid("([]{()})"), true)
    }

    func testInvalidPair() {
        XCTAssertEqual(isValid("([]"), false)
    }
}

