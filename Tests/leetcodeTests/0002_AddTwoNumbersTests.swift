import XCTest
import common
@testable import leetcode

final class _0002_AddTwoNumbersTests : XCTestCase {

    let addTwoNumbers = Solution_0002.addTwoNumbers

    func test() {
        let input1 = ListNode.linkedListFrom([2,4,3])
        let input2 = ListNode.linkedListFrom([5,6,4])
        let expectedOutput = [7,0,8]
        
        let actualOutput = addTwoNumbers(input1, input2)
        let arrayOutput = ListNode.arrayFrom(actualOutput)
        
        XCTAssertEqual(arrayOutput, expectedOutput)
    }
    
    func testZero() {
        let input1 = ListNode.linkedListFrom([0])
        let input2 = ListNode.linkedListFrom([0])
        let expectedOutput = [0]
        
        let actualOutput = addTwoNumbers(input1, input2)
        let arrayOutput = ListNode.arrayFrom(actualOutput)
        
        XCTAssertEqual(arrayOutput, expectedOutput)
    }
    
    func testNines() {
        let input1 = ListNode.linkedListFrom([9,9,9,9,9,9,9])
        let input2 = ListNode.linkedListFrom([9,9,9,9])
        let expectedOutput = [8,9,9,9,0,0,0,1]
        
        let actualOutput = addTwoNumbers(input1, input2)
        let arrayOutput = ListNode.arrayFrom(actualOutput)
        
        XCTAssertEqual(arrayOutput, expectedOutput)
    }

}
