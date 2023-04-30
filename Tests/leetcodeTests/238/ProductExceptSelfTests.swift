import XCTest
@testable import leetcode

final class ProductExceptSelfTests : XCTestCase {
    
    let productExceptSelf = Solution238.productExceptSelf
    
    func testTwoElementArray() {
        XCTAssertEqual(productExceptSelf([1,2]), [2,1])
    }
    
    func testArray() {
        XCTAssertEqual(productExceptSelf([1,2,3,4]), [24,12,8,6])
    }
    
    func testArray2() {
        XCTAssertEqual(productExceptSelf([-1,1,0,-3,3]), [0,0,9,0,0])
    }
}
