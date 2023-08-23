import XCTest
@testable import leetcode

final class _0146_LruCacheTests : XCTestCase {

    typealias LRUCache = Solution_0146

    func testLRU() {
        let lru = LRUCache(2)
        lru.put(1,1)
        lru.put(2,2)
        XCTAssertEqual(lru.get(1), 1)
        lru.put(3,3)
        XCTAssertEqual(lru.get(2), -1)
        lru.put(4,4)
        XCTAssertEqual(lru.get(1), -1)
        XCTAssertEqual(lru.get(3), 3)
        XCTAssertEqual(lru.get(4), 4)
    }
    
}
