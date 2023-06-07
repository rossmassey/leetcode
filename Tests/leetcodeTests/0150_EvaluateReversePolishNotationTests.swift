import XCTest
@testable import leetcode

final class _0150_EvaluateReversePolishNotationTests : XCTestCase {
    
    let evalRPN = Solution150.evalRPN
    
    func testAddMultiply() {
        XCTAssertEqual(evalRPN(["2","1","+","3","*"]), 9)
    }
    
    func testDivideAdd() {
        XCTAssertEqual(evalRPN(["4","13","5","/","+"]), 6)
    }

    
    func testComplicated() {
        XCTAssertEqual(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]), 22)
    }

}
