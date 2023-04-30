import XCTest
@testable import leetcode

final class TopKFrequentElementsTests : XCTestCase {
    
    let topKFrequent = Solution347.topKFrequent
    
    func testArray() {
        let possibleOutput = [1,2]
        let output = topKFrequent([1,1,1,2,2,3],2)
        
        XCTAssertEqual(anyOrderArray(possibleOutput),anyOrderArray(output))
    }
    
    func testSingleElementArray() {
        XCTAssertEqual(topKFrequent([1], 1), [1])
    }
}
