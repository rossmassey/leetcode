import XCTest
@testable import leetcode

final class _0567_PermutationInStringTests : XCTestCase {

    let checkInclusion = Solution_0567.checkInclusion

    func testHasPermutation() {
        let pattern = "ab"
        let text = "eidbaooo"
        
        XCTAssertTrue(checkInclusion(pattern, text))
    }
    
    func testNoPermutation() {
        let pattern = "ab"
        let text = "eidboaoo"
        
        XCTAssertFalse(checkInclusion(pattern, text))
    }

}
