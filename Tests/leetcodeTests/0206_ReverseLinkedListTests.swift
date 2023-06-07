import XCTest
import common
@testable import leetcode

final class _0206_ReverseLinkedListTests : XCTestCase {

    let reverseList = Solution206.reverseList

    func testSimpleList() {
        let input = ListNode.linkedListFrom([1,2])
        let output = ListNode.arrayFrom(reverseList(input))
        XCTAssertEqual(output, [2,1])
    }

    func testLongerList() {
        let input = ListNode.linkedListFrom([1,2,3,4,5])
        let output = ListNode.arrayFrom(reverseList(input))
        XCTAssertEqual(output, [5,4,3,2,1])
    }

    func testEmpty() {
        let input = ListNode.linkedListFrom([])
        let output = ListNode.arrayFrom(reverseList(input))
        XCTAssertEqual(output, [])
    }
    
}
