import common
import XCTest
@testable import leetcode

final class _0019_RemoveNthNodeFromEndOfListTests : XCTestCase {

    let removeNthFromEnd = Solution_0019.removeNthFromEnd

    func testLongList() {
        let input = ListNode.linkedListFrom([1,2,3,4,5])
        let output = removeNthFromEnd(input, 2)
        let expectedOutput = ListNode.linkedListFrom([1,2,3,5])
        
        XCTAssertTrue(ListNode.areLinkedListsEqual(output, expectedOutput))
    }
    
    func testShortList() {
        let input = ListNode.linkedListFrom([1,2])
        let output = removeNthFromEnd(input, 1)
        let expectedOutput = ListNode.linkedListFrom([1])
        
        XCTAssertTrue(ListNode.areLinkedListsEqual(output, expectedOutput))
    }
    
    func testShorterList() {
        let input = ListNode.linkedListFrom([1,2])
        let output = removeNthFromEnd(input, 1)
        let expectedOutput = ListNode.linkedListFrom([1])
        
        XCTAssertTrue(ListNode.areLinkedListsEqual(output, expectedOutput))
    }
}
