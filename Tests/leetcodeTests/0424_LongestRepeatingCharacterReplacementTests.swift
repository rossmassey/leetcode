import XCTest
@testable import leetcode

final class _0424_LongestRepeatingCharacterReplacementTests : XCTestCase {

    let characterReplacement = Solution_0424.characterReplacement

    func testShort() {
        XCTAssertEqual(characterReplacement("ABAB", 2), 4)
    }
    
    func testAlsoShort() {
        XCTAssertEqual(characterReplacement("AABABBA", 1), 4)
    }
}
