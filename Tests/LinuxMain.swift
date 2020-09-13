import XCTest

import JanyeeUtiltyTests
import GraphTests

var tests = [XCTestCaseEntry]()
tests += JanyeeUtiltyTests.allTests()
tests += GraphTests.allTests()
XCTMain(tests)
