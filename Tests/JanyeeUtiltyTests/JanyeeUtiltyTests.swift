import XCTest
@testable import JanyeeUtilty

final class JanyeeUtiltyTests: XCTestCase {
    func testMain() {
        let test = UndirectedGraphTests()
        for f in UndirectedGraphTests.allTests {
            print("Test \(f.0) started...")
            f.1(test)()
        }
    }

    static var allTests = [
        ("testMain", testMain)
    ]
}
