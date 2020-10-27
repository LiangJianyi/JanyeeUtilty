import XCTest
@testable import JanyeeUtilty

final class JanyeeUtiltyTests: XCTestCase {
    func testMain() {
        XCTAssertNoThrow(self.testJanyeeUtiltyTaskTimeConsuming())
    }
    
    func testJanyeeUtiltyTaskTimeConsuming() {
        var arr = [Int](repeating: 0, count: Int(UInt16.max) * 10)
        
        var timeConsuming = JanyeeUtilty.taskTimeConsuming {
            for i in 0..<arr.count {
                arr[i] = i
            }
        }
        print("for i in 0..<arr.count time consuming: \(timeConsuming)")
        XCTAssertEqual(arr.first!, 0)
        XCTAssertEqual(arr.last!, arr.count - 1)

        timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.map { e in e * 10 }
        }
        print("arr = arr.map { e in e * 10 } time consuming: \(timeConsuming)")
        XCTAssertEqual(arr[1], 10)
        XCTAssertEqual(arr[2], 20)
        XCTAssertEqual(arr[3], 30)
        XCTAssertEqual(arr[4], 40)
        XCTAssertEqual(arr[5], 50)
        XCTAssertEqual(arr[6], 60)
        XCTAssertEqual(arr[7], 70)
        XCTAssertEqual(arr[8], 80)
        XCTAssertEqual(arr[9], 90)
        XCTAssertEqual(arr[10], 100)
        XCTAssertEqual(arr.last!, (arr.count - 1) * 10)
    }
    
    func testJanyeeUtiltyTaskTimeConsuming2() {
        var arr = [Int64](repeating: 0, count: Int.max)
        
        var timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.map { e in e + 10 }
        }
        print("arr = arr.map { e in e + 10 } time consuming: \(timeConsuming)")
        XCTAssertEqual(arr.filter { e in e == 10 }.count, arr.count)
        
//        timeConsuming = JanyeeUtilty.taskTimeConsuming {
//            arr = arr.parallelMap(striding: 1) { e in e * 10 }
//        }
//        print("rr = arr.parallelMap(striding: 1) { e in e * 10 } time consuming: \(timeConsuming)")
//        XCTAssertEqual(arr.filter { e in e == 10 }.count, arr.count)
    }

    static var allTests = [
        ("testMain", testMain)
    ]
}
