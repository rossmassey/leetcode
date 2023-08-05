import XCTest
import common
@testable import leetcode

final class _0141_LinkedListCycleTests : XCTestCase {

    let hasCycle = Solution_0141.hasCycle

    func testCycle() {
        let input = ListNode.linkedListFrom([3,2,0,-4], pos: 1)
        XCTAssertEqual(hasCycle(input), true)
    }

    func testSmallCycle() {
        let input = ListNode.linkedListFrom([1,2], pos: 0)
        XCTAssertEqual(hasCycle(input), true)
    }

    func testNoCycle() {
        let input = ListNode.linkedListFrom([1], pos: -1)
        XCTAssertEqual(hasCycle(input), false)
    }

}
