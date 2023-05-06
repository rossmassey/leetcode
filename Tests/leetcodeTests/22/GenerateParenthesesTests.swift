import XCTest
import common
@testable import leetcode

final class GenerateParenthesesTests : XCTestCase {

    let generateParenthesis = Solution22.generateParenthesis

    func testNThree() {
        let expectedOutput = anyOrderArray(["((()))","(()())","(())()","()(())","()()()"])
        let output = anyOrderArray(generateParenthesis(3))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testNTwo() {
        let expectedOutput = anyOrderArray(["()"])
        let output = anyOrderArray(generateParenthesis(1))
        XCTAssertEqual(expectedOutput, output)
    }

}
