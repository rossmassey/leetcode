import XCTest
@testable import leetcode

final class _0287_FindTheDuplicateNumberTests : XCTestCase {

    let findDuplicate = Solution_0287.findDuplicate

    func test() {
        let input = [1,3,4,2,2]
        let expectedOutput =  2
        
        let output = findDuplicate(input)
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testAnother() {
        let input = [3,1,3,4,2]
        let expectedOutput =  3
        
        let output = findDuplicate(input)
        XCTAssertEqual(output, expectedOutput)
    }
    
}
