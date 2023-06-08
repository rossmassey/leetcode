import XCTest
@testable import leetcode

final class _0155_MinStackTests : XCTestCase {
    
    typealias MinStack = Solution_0155

    func testMinStack() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        XCTAssertEqual(minStack.getMin(), -3)
        minStack.pop()
        XCTAssertEqual(minStack.top(), 0)
        XCTAssertEqual(minStack.getMin(), -2)
    }
}
