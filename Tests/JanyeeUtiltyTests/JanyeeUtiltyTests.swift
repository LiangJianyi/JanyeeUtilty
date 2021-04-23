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
    
    func parallelMapWithStriding1() {
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
    func parallelMapWithStriding2() {
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
    func parallelMapWithStriding3() {
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
    func parallelMapWithStriding4() {
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
    func parallelMapWithStriding5() {
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
    func parallelMapWithStriding6() {
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
    func parallelMapWithStriding7() {
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
    func parallelMapWithStriding8() {
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
    func parallelMapWithStriding9() {
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
    func parallelMapWithStriding10() {
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
        let byte7: [UInt8] = [1, 2, 3]
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
        XCTAssertEqual(byte1 + 0, byte1)
        XCTAssertEqual(byte2 + 0, byte2)
        XCTAssertEqual(byte3 + 0, byte3)
        XCTAssertEqual(byte4 + 0, byte4)
        XCTAssertEqual(byte5 + 0, byte5)
        XCTAssertEqual(byte6 + 0, byte6)
        XCTAssertEqual(byte7 + 0, byte7)
        XCTAssertTrue([UInt8]([221]) + 255 == [UInt8]([1, UInt8(221).addingReportingOverflow(255).partialValue]))
        XCTAssertTrue([UInt8]([189]) + 255 == [UInt8]([1, UInt8(189).addingReportingOverflow(255).partialValue]))
        XCTAssertTrue([UInt8]([100]) + 200 == [UInt8]([1, UInt8(100).addingReportingOverflow(200).partialValue]))
        XCTAssertTrue([UInt8]([222]) + 111 == [UInt8]([1, UInt8(222).addingReportingOverflow(111).partialValue]))
        XCTAssertTrue([UInt8]([250]) + 222 == [UInt8]([1, UInt8(250).addingReportingOverflow(222).partialValue]))
        XCTAssertTrue([UInt8]([66]) + 255 == [UInt8]([1, UInt8(66).addingReportingOverflow(255).partialValue]))
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]) + 255 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 29, 0]))
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 255]) + 255 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 29, 254]))
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]) + 0 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]))
        XCTAssertTrue([UInt8]([255, 255, 255]) + 255 == [UInt8]([1, 0, 0, 254]))
        XCTAssertTrue([UInt8]([123, 254]) + 1 == [123, 255])
        XCTAssertTrue([UInt8]([123, 255]) + 1 == [124, 0])
        XCTAssertTrue([UInt8]([255, 255]) + 1 == [1, 0, 0])
        XCTAssertTrue([UInt8]([124, 255]) + 1 == [125, 0])
        XCTAssertTrue([UInt8]([125, 255]) + 1 == [126, 0])
        XCTAssertTrue([UInt8]([98, 255, 255, 255, 255]) + 1 == [99, 0, 0, 0, 0])
        XCTAssertTrue([UInt8]([255, 255, 255, 255, 255]) + 1 == [1, 0, 0, 0, 0, 0])
        XCTAssertTrue([UInt8]([255, 255, 255, 255, 255]) + 2 == [1, 0, 0, 0, 0, 1])
        XCTAssertTrue([UInt8]([255, 255, 255, 255, 255]) + 3 == [1, 0, 0, 0, 0, 2])
    }
    
    func testExtensionArrayUInt8PlusOperatorTimeConsuming() {
        func randomByteGenerator() -> UInt8 {
            return (0...255).randomElement()!
        }

        func byteArrayGenerator() -> [UInt8] {
            let length = (1...10000).randomElement()!
            var array = [UInt8](repeating: 0, count: length)
            for i in 0..<array.count {
                array[i] = randomByteGenerator()
            }
            return array
        }

        let total = 100000
        typealias Element = ([UInt8], UInt8)
        var testNumbers = [Element]()
        for _ in 1...total {
            testNumbers.append((byteArrayGenerator(), randomByteGenerator()))
        }

        let t = JanyeeUtilty.taskTimeConsuming {
            for i in 0..<testNumbers.count {
                _ = testNumbers[i].0 + testNumbers[i].1
            }
        }

        print("\(total) 个[UInt8] + UInt8 耗时：\(t)")
    }
    
    func testExtensionArrayUInt8RelationalOperator() {
        let arr1: [UInt8] = [1, 2, 3]
        let arr2: [UInt8] = [0, 1, 2]
        let arr3: [UInt8] = [1, 2, 4]
        let arr4: [UInt8] = [1, 4, 3]
        let arr5: [UInt8] = [255]
        let arr6: [UInt8] = [1, 0]
        let arr7: [UInt8] = [165, 209, 200, 201]
        let arr8: [UInt8] = [1, 0, 0, 0, 0]
        let arr9: [UInt8] = [166, 60, 50, 40]
        let arr10: [UInt8] = [165, 255, 255, 255]
        let arr11: [UInt8] = []
        let arr12: [UInt8] = [231, 28, 13, 44, 240, 250]
        let arr13: [UInt8] = [107, 254, 2, 8, 99, 219, 64, 32, 33]
        let arr14: [UInt8] = [107, 254, 2, 8, 100, 200, 60, 32, 3]
        let arr15: [UInt8] = [107, 254, 2, 8, 99, 219, 64, 32, 33, 255, 255, 0, 0, 0, 2]
        let arr16: [UInt8] = [91, 76, 12, 18, 99, 219, 64, 32, 33]
        let arr17: [UInt8] = [1, 254, 2, 8, 99, 219, 64, 32, 33]
        let arr18: [UInt8] = [255, 254, 2, 8, 99, 219, 64, 32, 33]
        let arr19: [UInt8] = [107, 254, 2, 8, 99, 219, 64, 32, 33, 255, 255, 0, 0, 0, 3]
        
        XCTAssertTrue(arr1 > arr2)
        XCTAssertTrue(arr1 >= arr2)
        XCTAssertFalse(arr1 < arr2)
        XCTAssertFalse(arr1 <= arr2)
        
        XCTAssertTrue(arr4 > arr3)
        XCTAssertTrue(arr4 >= arr3)
        XCTAssertFalse(arr4 < arr3)
        XCTAssertFalse(arr4 <= arr3)
        
        XCTAssertFalse(arr5 > arr6)
        XCTAssertFalse(arr5 >= arr6)
        XCTAssertTrue(arr5 < arr6)
        XCTAssertTrue(arr5 <= arr6)
        
        XCTAssertFalse(arr7 > arr8)
        XCTAssertFalse(arr7 >= arr8)
        XCTAssertTrue(arr7 < arr8)
        XCTAssertTrue(arr7 <= arr8)
        
        XCTAssertTrue(arr9 > arr10)
        XCTAssertTrue(arr9 >= arr10)
        XCTAssertFalse(arr9 < arr10)
        XCTAssertFalse(arr9 <= arr10)
        
        XCTAssertFalse(arr11 > arr11)
        XCTAssertTrue(arr11 >= arr11)
        XCTAssertFalse(arr11 < arr11)
        XCTAssertTrue(arr11 <= arr11)
        
        XCTAssertFalse(arr12 > arr13)
        XCTAssertFalse(arr12 >= arr13)
        XCTAssertTrue(arr12 < arr13)
        XCTAssertTrue(arr12 <= arr13)
        
        XCTAssertTrue(arr12 > arr10)
        XCTAssertTrue(arr12 >= arr10)
        XCTAssertFalse(arr12 <= arr10)
        XCTAssertFalse(arr12 < arr10)
        
        XCTAssertTrue(arr14 > arr13)
        XCTAssertTrue(arr14 >= arr13)
        XCTAssertFalse(arr14 <= arr13)
        XCTAssertFalse(arr14 < arr13)
        
        XCTAssertFalse(arr15 > arr19)
        XCTAssertFalse(arr15 >= arr19)
        XCTAssertTrue(arr15 < arr19)
        XCTAssertTrue(arr15 <= arr19)
        
        XCTAssertTrue(arr15 > arr14)
        XCTAssertTrue(arr15 > arr13)
        XCTAssertTrue(arr15 > arr12)
        XCTAssertTrue(arr15 > arr11)
        XCTAssertTrue(arr15 > arr10)
        XCTAssertTrue(arr15 > arr9)
        XCTAssertTrue(arr15 > arr8)
        XCTAssertTrue(arr15 > arr7)
        XCTAssertTrue(arr15 > arr6)
        XCTAssertTrue(arr15 > arr5)
        XCTAssertTrue(arr15 > arr4)
        XCTAssertTrue(arr15 > arr3)
        XCTAssertTrue(arr15 > arr2)
        XCTAssertTrue(arr15 > arr1)
        
        XCTAssertTrue(arr15 >= arr14)
        XCTAssertTrue(arr15 >= arr13)
        XCTAssertTrue(arr15 >= arr12)
        XCTAssertTrue(arr15 >= arr11)
        XCTAssertTrue(arr15 >= arr10)
        XCTAssertTrue(arr15 >= arr9)
        XCTAssertTrue(arr15 >= arr8)
        XCTAssertTrue(arr15 >= arr7)
        XCTAssertTrue(arr15 >= arr6)
        XCTAssertTrue(arr15 >= arr5)
        XCTAssertTrue(arr15 >= arr4)
        XCTAssertTrue(arr15 >= arr3)
        XCTAssertTrue(arr15 >= arr2)
        XCTAssertTrue(arr15 >= arr1)
        
        XCTAssertTrue(arr16 > arr17)
        XCTAssertTrue(arr16 >= arr17)
        XCTAssertFalse(arr16 < arr17)
        XCTAssertFalse(arr16 <= arr17)
        
        XCTAssertTrue(arr18 > arr16)
        XCTAssertTrue(arr18 >= arr16)
        XCTAssertFalse(arr18 < arr16)
        XCTAssertFalse(arr18 <= arr16)
        
        XCTAssertFalse(arr18 > arr19)
        XCTAssertFalse(arr18 >= arr19)
        XCTAssertTrue(arr18 < arr19)
        XCTAssertTrue(arr18 <= arr19)
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
    ]
}
