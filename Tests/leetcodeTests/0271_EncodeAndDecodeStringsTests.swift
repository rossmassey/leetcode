import XCTest
@testable import leetcode

final class _0271_EncodeAndDecodeStringsTests : XCTestCase {
    
    let encode = Solution_0271.encode
    let decode = Solution_0271.decode
    
    func testEmptyString() {
        let input = [""]
        let encoded = encode(input)
        let decoded = decode(encoded)
        XCTAssertEqual(input, decoded)
    }
    
    // TODO add rest
    
}
