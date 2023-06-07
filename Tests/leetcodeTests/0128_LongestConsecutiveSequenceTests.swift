import XCTest
@testable import leetcode

final class _0128_LongestConsecutiveSequenceTests : XCTestCase {
    
    let longestConsecutiveSequence = Solution128.longestConsecutiveSequence
    
    func testEmptyArray() {
        XCTAssertEqual(longestConsecutiveSequence([]), 0)
    }
    
    func testSingleElementArray() {
        XCTAssertEqual(longestConsecutiveSequence([5]), 1)
    }
    
    func testArrayWithNoConsecutiveSequence() {
        XCTAssertEqual(longestConsecutiveSequence([1, 3, 5, 7]), 1)
    }
    
    func testArrayWithConsecutiveSequence() {
        XCTAssertEqual(longestConsecutiveSequence([100, 4, 200, 1, 3, 2]), 4)
    }
}
