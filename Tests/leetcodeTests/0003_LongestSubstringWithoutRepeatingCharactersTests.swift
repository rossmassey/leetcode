import XCTest
@testable import leetcode

final class LongestSubstringWithoutRepeatingCharactersTests : XCTestCase {

    let lengthOfLongestSubstring = Solution_0003.lengthOfLongestSubstring

    func testLengthThree() {
        XCTAssertEqual(lengthOfLongestSubstring("abcabcbb"), 3)
    }
    
    func testRepeatingCharacters() {
        XCTAssertEqual(lengthOfLongestSubstring("bbbbb"), 1)
    }
    
    func testLengthThreeAgain() {
        XCTAssertEqual(lengthOfLongestSubstring("pwwkew"), 3)
    }
    
}
