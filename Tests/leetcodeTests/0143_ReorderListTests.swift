import XCTest
import common
@testable import leetcode

final class _0143_ReorderListTests : XCTestCase {

    let reorderList = Solution_0143.reorderList

    func testShortList() {
        let input = ListNode.linkedListFrom([1,2,3,4])
        let expectedOutput = ListNode.linkedListFrom([1,4,2,3])
        reorderList(input)
        
        XCTAssertTrue(ListNode.areLinkedListsEqual(input, expectedOutput))
    }
    
    func testAnotherShortList() {
        let input = ListNode.linkedListFrom([1,2,3,4,5])
        let expectedOutput = ListNode.linkedListFrom([1,5,2,4,3])
        reorderList(input)
        
        XCTAssertTrue(ListNode.areLinkedListsEqual(input, expectedOutput))
    }
}
