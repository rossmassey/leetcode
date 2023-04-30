import XCTest
@testable import leetcode

final class MinStackTests : XCTestCase {
    
    let MinStack = Solution155.init

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
