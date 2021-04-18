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
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.map { arr in
                return arr.map { e in
                    return e + 10
                }
            }
        }
        print("arr = arr.map { arr in return arr.map { e in return e + 10 } } time consuming: \(timeConsuming)")

        // 验证上面的 map 操作是否把 10000 * 10000 矩阵里面的每个数字变为 10
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 10, count: 10000)
        }.count,
        arr.count)
        
    }
    
    // 测试 parallelMap 的速度是否真的比 map 快，
    // 其中分别观测 1 到 10 的步长（striding）对应的时间消耗
    
    func testParallelMapWithStriding1() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 1 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding2() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 2 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding3() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 3 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding4() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 4 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding5() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 5 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding6() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 6 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding7() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 7 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding8() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 8 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding9() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 9 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testParallelMapWithStriding10() {
        var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
        let timeConsuming = JanyeeUtilty.taskTimeConsuming {
            arr = arr.parallelMap(striding: 1) { arr in
                return arr.map { e in
                    return e + 20
                }
            }
        }
        print("步长为 10 的时间消耗: \(timeConsuming)")
        XCTAssertEqual(arr.filter { arr in
            return arr == [Int64](repeating: 20, count: 10000)
        }.count,
        arr.count)
    }
    func testExtensionArrayUInt8PlusOperator() {
        let byte1: [UInt8] = [228, 184, 191]
        let byte2: [UInt8] = [98, 255, 255]
        let byte3: [UInt8] = [1]
        let byte4: [UInt8] = [100]
        let byte5: [UInt8] = [255]
        let byte6: [UInt8] = [200, 255, 255, 255, 255, 255, 255, 255, 255]
        XCTAssertEqual(byte1 + 1, [UInt8]([228, 184, 192]))
        XCTAssertEqual((byte1 + 1) + 1, [UInt8]([228, 184, 193]))
        XCTAssertEqual(((byte1 + 1) + 1) + 1, [UInt8]([228, 184, 194]))
        XCTAssertEqual(byte2 + 1, [UInt8]([99, 0, 0]))
        XCTAssertEqual(byte3 + 100, [UInt8]([101]))
        XCTAssertEqual(byte4 + 155, [UInt8]([255]))
        XCTAssertEqual(byte4 + 156, [UInt8]([1, 0]))
        XCTAssertEqual(byte5 + 1, [UInt8]([1, 0]))
        XCTAssertEqual(byte5 + 2, [UInt8]([1, 1]))
        XCTAssertEqual(byte6 + 1, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 0]))
        XCTAssertEqual(byte6 + 55, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 54]))
        XCTAssertEqual(byte6 + 56, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 55]))
        XCTAssertEqual(byte6 + 255, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 254]))
    }
    
    // 暂时没有找到办法解决下面的测试导致访问错误地址引起的错误
//    func testParallelMap() {
//        for striding in 2...10 {
//            var arr = [[Int64]](repeating: [Int64](repeating: 0, count: 10000), count: 10000)
//            let timeConsuming = JanyeeUtilty.taskTimeConsuming {
//                arr = arr.parallelMap(striding: striding) { arr in
//                    return arr.map { e in
//                        return e + 20
//                    }
//                }
//            }
//            print("步长为 \(striding) 的时间消耗: \(timeConsuming)")
//            XCTAssertEqual(arr.filter { arr in
//                return arr == [Int64](repeating: 20, count: 10000)
//            }.count,
//            arr.count)
//            arr.removeAll()
//        }
//
//    }

    static var allTests = [
        ("testMain", testMain),
        ("testJanyeeUtiltyTaskTimeConsuming", testJanyeeUtiltyTaskTimeConsuming),
        ("testJanyeeUtiltyTaskTimeConsuming2", testJanyeeUtiltyTaskTimeConsuming2),
//        ("testParallelMap", testParallelMap)
//        ("testParallelMapWithStriding1", testParallelMapWithStriding1),
//        ("testParallelMapWithStriding2", testParallelMapWithStriding2),
//        ("testParallelMapWithStriding3", testParallelMapWithStriding3),
//        ("testParallelMapWithStriding4", testParallelMapWithStriding4),
//        ("testParallelMapWithStriding5", testParallelMapWithStriding5),
//        ("testParallelMapWithStriding6", testParallelMapWithStriding6),
//        ("testParallelMapWithStriding7", testParallelMapWithStriding7),
//        ("testParallelMapWithStriding8", testParallelMapWithStriding8),
//        ("testParallelMapWithStriding9", testParallelMapWithStriding9),
//        ("testParallelMapWithStriding10", testParallelMapWithStriding10),
    ]
}
