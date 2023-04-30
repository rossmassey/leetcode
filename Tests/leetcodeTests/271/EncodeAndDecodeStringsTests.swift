import XCTest
@testable import leetcode

final class EncodeAndDecodeStringsTests : XCTestCase {
    
    let encode = Solution271.encode
    let decode = Solution271.decode
    
    func testEmptyString() {
        let input = [""]
        let encoded = encode(input)
        let decoded = decode(encoded)
        XCTAssertEqual(input, decoded)
    }
    
    // TODO add rest
    
}
