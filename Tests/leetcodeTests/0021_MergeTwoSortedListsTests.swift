import XCTest
import common
@testable import leetcode

final class _0021_MergeTwoSortedListsTests : XCTestCase {

    let mergeTwoLists = Solution_0021.mergeTwoLists

    func testMergeTwoLists() {
        let list1 = ListNode.linkedListFrom([1,2,4])
        let list2 = ListNode.linkedListFrom([1,3,4])
        let expectedOutput = ListNode.linkedListFrom([1,1,2,3,4,4])

        XCTAssertTrue(ListNode.areLinkedListsEqual(mergeTwoLists(list1, list2), expectedOutput))
    }

    func testMergeOneLists() {
        let list1 = ListNode.linkedListFrom([])
        let list2 = ListNode.linkedListFrom([0])
        let expectedOutput = ListNode.linkedListFrom([0])

        XCTAssertTrue(ListNode.areLinkedListsEqual(mergeTwoLists(list1, list2), expectedOutput))
    }

    func testMergeEmptyLists() {
        let list1 = ListNode.linkedListFrom([])
        let list2 = ListNode.linkedListFrom([])
        let expectedOutput = ListNode.linkedListFrom([])

        XCTAssertTrue(ListNode.areLinkedListsEqual(mergeTwoLists(list1, list2), expectedOutput))
    }

}
