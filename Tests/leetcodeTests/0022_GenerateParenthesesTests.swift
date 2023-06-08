import XCTest
import common
@testable import leetcode

final class _0222_GenerateParenthesesTests : XCTestCase {

    let generateParenthesis = Solution_0022.generateParenthesis

    func testNThree() {
        let expectedOutput = setOfUniqueElementsAnyOrder(["((()))","(()())","(())()","()(())","()()()"])
        let output = setOfUniqueElementsAnyOrder(generateParenthesis(3))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testNTwo() {
        let expectedOutput = setOfUniqueElementsAnyOrder(["()"])
        let output = setOfUniqueElementsAnyOrder(generateParenthesis(1))
        XCTAssertEqual(expectedOutput, output)
    }

}
