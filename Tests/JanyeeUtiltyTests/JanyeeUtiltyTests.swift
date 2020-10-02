import XCTest
@testable import JanyeeUtilty

final class JanyeeUtiltyTests: XCTestCase {
    func testMain() {
        let undirectedGraphTest = UndirectedGraphTests()
        for f in UndirectedGraphTests.allTests {
            print("Test \(f.0) started...")
            f.1(undirectedGraphTest)()
        }
        let directedGraphTest = DirectedGraphTests()
        for f in DirectedGraphTests.allTests {
            print("Test \(f.0) started...")
            f.1(directedGraphTest)()
        }
    }

    static var allTests = [
        ("testMain", testMain)
    ]
}
