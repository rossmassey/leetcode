import XCTest
import common
@testable import leetcode

final class _0142_LinkedListCycleIITests : XCTestCase {

    let detectCycle = Solution_0142.detectCycle
    

    func test() {
        let pos = 1
        let input = ListNode.linkedListFrom([3,2,0,-4], pos: pos)
        let expectedOutput = ListNode.getNode(pos, from: input)
        
        let output = detectCycle(input)
        XCTAssertTrue(output === expectedOutput) // check same object
    }
    
    func testShort() {
        let pos = 0
        let input = ListNode.linkedListFrom([1,2], pos: pos)
        let expectedOutput = ListNode.getNode(pos, from: input)
        
        let output = detectCycle(input)
        XCTAssertTrue(output === expectedOutput)
    }
    
    func testNoCycle() {
        let pos = -1
        let input = ListNode.linkedListFrom([1], pos: pos)
        let expectedOutput = ListNode.getNode(pos, from: input)
        
        let output = detectCycle(input)
        XCTAssertTrue(output === expectedOutput)
    }

}
