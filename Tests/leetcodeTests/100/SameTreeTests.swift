import XCTest
import common
@testable import leetcode

final class SameTreeTests : XCTestCase {

    let isSameTree = Solution100.isSameTree

    func testSameTree() {
        let p = arrayToTree([1,2,3])
        let q = arrayToTree([1,2,3])
        XCTAssertTrue(isSameTree(p,q))
    }

    func testNotSameTree() {
        let p = arrayToTree([1,2])
        let q = arrayToTree([1,nil,2])
        XCTAssertFalse(isSameTree(p,q))
    }

    func testDifferentNotSameTree() {
        let p = arrayToTree([1,2,1])
        let q = arrayToTree([1,1,2])
        XCTAssertFalse(isSameTree(p,q))
    }

}
