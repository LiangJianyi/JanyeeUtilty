import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JanyeeUtiltyTests.allTests),
        testCase(GraphTests.allTests)
    ]
}
#endif
