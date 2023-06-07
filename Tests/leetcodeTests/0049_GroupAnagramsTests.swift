import XCTest
import common
@testable import leetcode

final class _0049_GroupAnagramsTests : XCTestCase {
    
    let groupAnagrams = Solution49.groupAnagrams
    
    func testAnagramsArray() {
        let input = ["eat","tea","tan","ate","nat","bat"]
        let possibleOutput = [["bat"],["nat","tan"],["eat","tea", "ate"]]
        let output = groupAnagrams(input)
        
        XCTAssertEqual(setOfUniqueElementSetsAnyOrder(output),
                       setOfUniqueElementSetsAnyOrder(possibleOutput))
    }
    
    func testNoAnagramsArray() {
        let input = ["eat", "dog", "card"]
        let possibleOutput = [["card"],["dog"],["eat"]]
        let output = groupAnagrams(input)
        
        XCTAssertEqual(setOfUniqueElementSetsAnyOrder(output),
                       setOfUniqueElementSetsAnyOrder(possibleOutput))
    }
    
    func testEmptyStringArray() {
        XCTAssertEqual(groupAnagrams([""]), [[""]])
    }
    
    func testSingleElementArray() {
        XCTAssertEqual(groupAnagrams(["a"]), [["a"]])
    }
}
