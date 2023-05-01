import XCTest
import common
@testable import leetcode

final class InvertBinaryTreeTests : XCTestCase {
    
    let invertTree = Solution226.invertTree

    func testTree() {
        let input = arrayToTree([2,1,3])
        let expectedOutput = [2,3,1]
        let output = invertTree(input)
        XCTAssertEqual(expectedOutput, treeToArray(output))
    }
    
    func testLongerTree() {
        let input = arrayToTree([4,2,7,1,3,6,9])
        let expectedOutput = [4,7,2,9,6,3,1]
        let output = invertTree(input)
        XCTAssertEqual(expectedOutput, treeToArray(output))
    }
    
    func testEmptyTree() {
        let emptyArray: [Int?] = []
        let input = arrayToTree(emptyArray)
        let expectedOutput = emptyArray
        let output = invertTree(input)
        XCTAssertEqual(expectedOutput, treeToArray(output))
    }
}
