import XCTest
import common
@testable import leetcode

final class _0138_CopyListWithRandomPointerTests : XCTestCase {

    let copyRandomList = Solution_0138.copyRandomList

    func testLong() {
        let inputArray = [[7,nil],[13,0],[11,4],[10,2],[1,0]]
        let input = Node.createRandomPointerLinkedList(from: inputArray)
        let output = copyRandomList(input)
        let outputArray = Node.randomPointerLinkedListToArray(head: output)
        
        XCTAssertEqual(outputArray, inputArray)
    }
    
    func testShorter() {
        let inputArray = [[3,nil],[3,0],[3,nil]]
        let input = Node.createRandomPointerLinkedList(from: inputArray)
        let output = copyRandomList(input)
        let outputArray = Node.randomPointerLinkedListToArray(head: output)
        
        XCTAssertEqual(outputArray, inputArray)
    }
    
    func testShort() {
        let inputArray = [[1,1],[2,1]]
        let input = Node.createRandomPointerLinkedList(from: inputArray)
        let output = copyRandomList(input)
        let outputArray = Node.randomPointerLinkedListToArray(head: output)
        
        XCTAssertEqual(outputArray, inputArray)
    }

}
