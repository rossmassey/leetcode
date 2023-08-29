import XCTest
import common
@testable import leetcode

final class _0025_ReverseNodesInKGroupTests : XCTestCase {

    let reverseKGroup = Solution_0025.reverseKGroup

    func testK2() {
        let input = [1,2,3,4,5]
        let k = 2
        let expectedOutput = [2,1,4,3,5]
        
        let output = reverseKGroup(ListNode.linkedListFrom(input), k)
        let outputArray = ListNode.arrayFrom(output)

        
        XCTAssertEqual(outputArray, expectedOutput)
    }
    
    func testK3() {
        let input = [1,2,3,4,5]
        let k = 3
        let expectedOutput = [3,2,1,4,5]
        
        let output = reverseKGroup(ListNode.linkedListFrom(input), k)
        let outputArray = ListNode.arrayFrom(output)

        
        XCTAssertEqual(outputArray, expectedOutput)
    }

}
