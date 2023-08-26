import XCTest
import common
@testable import leetcode

final class _0023_MergeKSortedListsTests : XCTestCase {

    let mergeKLists = Solution_0023.mergeKLists

    func testList() {
        let inputArray = [[1,4,5],[1,3,4],[2,6]]
        let expectedOutput = [1,1,2,3,4,4,5,6]
        
        testMergeKSortedLists(inputArray, expectedOutput)
    }
    
    func testEmptyList() {
        testMergeKSortedLists([], [])
    }
    
    func testEmptyEmptyList() {
        testMergeKSortedLists([[]], [])
    }
    
    // use tester functions like this to reduce repeated setup tester code?
    private func testMergeKSortedLists(_ inputArray: [[Int]], _ expectedOutput: [Int]) {
        let lists = inputArray.map { ListNode.linkedListFrom($0) }
        let output = mergeKLists(lists)
        let outputArray = ListNode.arrayFrom(output)
        
        XCTAssertEqual(expectedOutput, outputArray)
    }

}
