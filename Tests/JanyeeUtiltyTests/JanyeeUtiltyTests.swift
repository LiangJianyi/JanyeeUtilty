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
    
    func testExtensionArrayUInt8AddingOperator() {
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
    
    private func randomByteGenerator() -> UInt8 {
        return (0...255).randomElement()!
    }
    
    private func byteArrayGenerator() -> [UInt8] {
        let length = (1...10000).randomElement()!
        var array = [UInt8](repeating: 0, count: length)
        for i in 0..<array.count {
            array[i] = randomByteGenerator()
        }
        return array
    }
    
    func testExtensionArrayUInt8AddingOperatorTimeConsuming() {
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
    
    func testExtensionArrayUInt8SubtractingOperator() {
        XCTAssertTrue([UInt8]([1, 4]) - 20 == [240])
        XCTAssertTrue([UInt8]([200, 100, 155]) - 156 == [200, 99, 255])
        XCTAssertTrue([UInt8]([1, 0, 25]) - 88 == [255, 193])
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 29, 0]) - 255 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]))
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 29, 254]) - 255 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 255]))
        XCTAssertTrue([UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]) - 0 == [UInt8]([7, 203, 14, 10, 32, 199, 235, 115, 255, 107, 28, 1]))
        XCTAssertTrue([UInt8]([1, 0, 0, 254]) - 255 == [255, 255, 255])
        XCTAssertTrue([UInt8]([123, 255]) - 1 == [123, 254])
        XCTAssertTrue([UInt8]([124, 0]) - 1 == [123, 255])
        XCTAssertTrue([UInt8]([1, 0, 0]) - 1 == [255, 255])
        XCTAssertTrue([UInt8]([125, 0]) - 1 == [124, 255])
        XCTAssertTrue([UInt8]([126, 0]) - 1 == [125, 255])
        XCTAssertTrue([UInt8]([99, 0, 0, 0, 0]) - 1 == [98, 255, 255, 255, 255])
        XCTAssertTrue([UInt8]([1, 0, 0, 0, 0, 0]) - 1 == [255, 255, 255, 255, 255])
        XCTAssertTrue([UInt8]([1, 0, 0, 0, 0, 1]) - 2 == [255, 255, 255, 255, 255])
        XCTAssertTrue([UInt8]([1, 0, 0, 0, 0, 2]) - 3 == [255, 255, 255, 255, 255])
    }
    
    func testArrayUInt8AddingAndSubtractingOperatorSymmetry() {
        let total = 100000
        typealias Element = ([UInt8], UInt8)
        var testNumbers = [Element]()
        for _ in 1...total {
            testNumbers.append((byteArrayGenerator(), randomByteGenerator()))
        }
        
        for item in testNumbers {
            let r = item.0 + item.1
            if r - item.1 == item.0 {
                XCTAssertTrue(true)
            } else {
                XCTAssertFalse(false, "r = \(r), item.0 = \(item.0), item.1 = \(item.1), r - item.1 = \(r - item.1)")
            }
        }
    }
    
    func testExtensionArrayUInt8AdditionAssignmentOperator() {
        var byte1: [UInt8] = [228, 184, 191]
        var byte2: [UInt8] = [98, 255, 255]
        var byte3: [UInt8] = [1]
        var byte4: [UInt8] = [100]
        var byte5: [UInt8] = [255]
        var byte6: [UInt8] = [200, 255, 255, 255, 255, 255, 255, 255, 255]
        var byte7: [UInt8] = [1, 2, 3]
        byte1 += 1
        XCTAssertEqual(byte1, [UInt8]([228, 184, 192]))
        byte1 += 1
        byte1 += 1
        XCTAssertEqual(byte1, [UInt8]([228, 184, 194]))
        byte1 += 1
        byte1 += 1
        byte1 += 1
        XCTAssertEqual(byte1, [UInt8]([228, 184, 197]))
        byte2 += 1
        XCTAssertEqual(byte2, [UInt8]([99, 0, 0]))
        byte3 += 100
        XCTAssertEqual(byte3, [UInt8]([101]))
        byte4 += 155
        XCTAssertEqual(byte4, [UInt8]([255]))
        byte4 += 156
        XCTAssertEqual(byte4, [UInt8]([255]) + 156)
        byte5 += 1
        XCTAssertEqual(byte5, [UInt8]([1, 0]))
        byte5 += 2
        XCTAssertEqual(byte5, [UInt8]([1, 0]) + 2)
        byte6 += 1
        XCTAssertEqual(byte6, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 0]))
        byte6 += 55
        XCTAssertEqual(byte6, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 55]))
        byte6 += 56
        XCTAssertEqual(byte6, [UInt8]([201, 0, 0, 0, 0, 0, 0, 0, 111]))
        byte6 += 255
        XCTAssertEqual(byte6, [UInt8]([201, 0, 0, 0, 0, 0, 0, 1, 110]))
        byte1 += 0
        XCTAssertEqual(byte1, byte1)
        byte2 += 0
        XCTAssertEqual(byte2, byte2)
        byte3 += 0
        XCTAssertEqual(byte3, byte3)
        byte4 += 0
        XCTAssertEqual(byte4, byte4)
        byte5 += 0
        XCTAssertEqual(byte5, byte5)
        byte6 += 0
        XCTAssertEqual(byte6, byte6)
        byte7 += 0
        XCTAssertEqual(byte7, byte7)
        
    }
    
    func testExtensionArrayUInt8SubtractingAssignmentOperator() {
        var byte1: [UInt8] = [1, 0, 0, 254]
        var byte2: [UInt8] = [1, 0, 25]
        var byte3: [UInt8] = [255, 193]
        byte1 -= 255
        XCTAssertEqual(byte1, [255, 255, 255])
        byte2 -= 88
        XCTAssertEqual(byte2, [255,193])
        byte3 -= 3
        XCTAssertEqual(byte3, [255, 190])
        byte3 -= 200
        XCTAssertEqual(byte3, [254, 246])
    }
    
    func testExtensionArrayUInt8AddingOtherArray()  {
        let arr1: [UInt8] = [107, 254, 112, 86, 99, 219, 64, 32, 16]
        let arr2: [UInt8] = [100, 255, 255, 255]
        let arr3: [UInt8] = [1, 2]
        let arr4: [UInt8] = [3, 4]
        let arr5: [UInt8] = [255, 255]
        let arr6: [UInt8] = [255, 128, 60]
        let arr7: [UInt8] = [255, 200]
        let arr8: [UInt8] = [212, 255, 199]
        let arr9: [UInt8] = [255, 255, 255]
        let arr10: [UInt8] = [255, 255, 255, 255, 255]
        let arr11: [UInt8] = [255, 255, 255, 255, 255, 55, 255, 167, 0, 233, 200, 0, 100, 100]
        let arr12: [UInt8] = [255, 111, 98, 64, 85, 0, 0, 0, 0, 254, 172, 1, 49, 79]
        let arr13: [UInt8] = [255, 255, 255, 255, 255, 255, 255]
        
        XCTAssertTrue(arr1 + arr2 == [107, 254, 112, 86, 100, 64, 64, 32, 15])
        XCTAssertTrue(arr2 + arr1 == [107, 254, 112, 86, 100, 64, 64, 32, 15])
        XCTAssertTrue(arr3 + arr4 == [4, 6])
        XCTAssertTrue(arr4 + arr3 == [4, 6])
        XCTAssertTrue(arr5 + arr5 == [1, 255, 254])
        XCTAssertTrue(arr6 + arr7 == [1, 0, 128, 4])
        XCTAssertTrue(arr7 + arr6 == [1, 0, 128, 4])
        XCTAssertTrue(arr8 + arr9 == [1, 212, 255, 198])
        XCTAssertTrue(arr9 + arr8 == [1, 212, 255, 198])
        XCTAssertTrue(arr10 + arr10 == [1, 255, 255, 255, 255, 254])
        XCTAssertTrue(arr11 + arr12 == [1, 255, 111, 98, 64, 84, 55, 255, 167, 1, 232, 116, 1, 149, 179])
        XCTAssertTrue(arr10 + arr13 == [1, 0, 0, 255, 255, 255, 255, 254])
        XCTAssertTrue(arr13 + arr10 == [1, 0, 0, 255, 255, 255, 255, 254])
    }
    
    func testExtensionArrayUInt8SubtractingOtherArray() {
        let arr1: [UInt8] = [107, 254, 112, 86, 99, 219, 64, 32, 16]
        let arr2: [UInt8] = [100, 255, 255, 255]
        let arr3: [UInt8] = [1, 2]
        let arr4: [UInt8] = [3, 4]
        let arr5: [UInt8] = [255, 255]
        let arr6: [UInt8] = [255, 128, 60]
        let arr7: [UInt8] = [255, 200]
        let arr8: [UInt8] = [212, 255, 199]
        let arr9: [UInt8] = [255, 255, 255]
        let arr10: [UInt8] = [255, 255, 255, 255, 255]
        let arr11: [UInt8] = [255, 255, 255, 255, 255, 55, 255, 167, 0, 233, 200, 0, 100, 100]
        let arr12: [UInt8] = [255, 111, 98, 64, 85, 0, 0, 0, 0, 254, 172, 1, 49, 79]
        let arr13: [UInt8] = [255, 255, 255, 255, 255, 255, 255]
        
        XCTAssertTrue([UInt8]([107, 254, 112, 86, 100, 64, 64, 32, 15]) - arr2 == arr1)
        XCTAssertTrue([UInt8]([107, 254, 112, 86, 100, 64, 64, 32, 15]) - arr1 == arr2)
        XCTAssertTrue([UInt8]([4, 6]) - arr4 == arr3)
        XCTAssertTrue([UInt8]([4, 6]) - arr3 == arr4)
        XCTAssertTrue([UInt8]([1, 0, 128, 4]) - arr7 == arr6)
        XCTAssertTrue([UInt8]([1, 0, 128, 4]) - arr6 == arr7)
        XCTAssertTrue([UInt8]([1, 212, 255, 198]) - arr9 == arr8)
        XCTAssertTrue([UInt8]([1, 212, 255, 198]) - arr8 == arr9)
        XCTAssertTrue([UInt8]([1, 255, 111, 98, 64, 84, 55, 255, 167, 1, 232, 116, 1, 149, 179]) - arr12 == arr11)
        XCTAssertTrue([UInt8]([1, 0, 0, 255, 255, 255, 255, 254]) - arr13 == arr10)
        XCTAssertTrue([UInt8]([1, 0, 0, 255, 255, 255, 255, 254]) - arr10 == arr13)
        XCTAssertTrue(arr1 - arr1 == [0])
        XCTAssertTrue(arr2 - arr2 == [0])
        XCTAssertTrue(arr3 - arr3 == [0])
        XCTAssertTrue(arr4 - arr4 == [0])
        XCTAssertTrue(arr5 - arr5 == [0])
        XCTAssertTrue(arr6 - arr6 == [0])
        XCTAssertTrue(arr7 - arr7 == [0])
        XCTAssertTrue(arr8 - arr8 == [0])
        XCTAssertTrue(arr9 - arr9 == [0])
        XCTAssertTrue(arr10 - arr10 == [0])
        XCTAssertTrue(arr11 - arr11 == [0])
        XCTAssertTrue(arr12 - arr12 == [0])
        XCTAssertTrue(arr13 - arr13 == [0])
    }
    
    private class Items {
        let bytes1: [UInt8]
        let bytes2: [UInt8]
        lazy var bytes3: [UInt8] = self.bytes1 + self.bytes2
        init(_ b1: [UInt8], _ b2: [UInt8]) {
            self.bytes1 = b1
            self.bytes2 = b2
        }
    }
    
    func testExtensionArrayUInt8SubtractingOtherArray2() {
        let total = 10000
        var testNumbers = [Items]()
        for _ in 1...total {
            testNumbers.append(Items(byteArrayGenerator(), byteArrayGenerator()))
        }
        
        for item in testNumbers {
            if item.bytes3 - item.bytes2 == item.bytes1 {
                XCTAssertTrue(true)
            } else {
                XCTAssertFalse(false, "item.bytes3 = \(item.bytes3), item.bytes1 = \(item.bytes1), item.bytes2 = \(item.bytes2), item.bytes3 - item.bytes2 = \(item.bytes3 - item.bytes2)")
            }
        }
    }
    
    func testSwapSubArray() {
        var a = [7, 101, 653, 82, 92, -57, 0, 333, 456, 978, 812]
        a.swapSubArray(leftRange: (0, 2), rightRange: (3, 8))
        XCTAssertTrue(a == [82, 92, -57, 0, 333, 456, 7, 101, 653, 978, 812])
        a.swapSubArray(leftRange: (0, 9), rightRange: (10, 10))
        XCTAssertTrue(a == [812, 82, 92, -57, 0, 333, 456, 7, 101, 653, 978])

        a = [Int](1...9)
        a.swapSubArray(leftRange: (0, 2), rightRange: (3, 8))
        XCTAssertTrue(a == [4, 5, 6, 7, 8, 9, 1, 2, 3])
        a.swapSubArray(leftRange: (3, 5), rightRange: (6, 8))
        XCTAssertTrue(a == [4, 5, 6, 1, 2, 3, 7, 8, 9])
        a.swapSubArray(leftRange: (1, 2), rightRange: (4, 5))
        XCTAssertTrue(a == [4, 2, 3, 1, 5, 6, 7, 8, 9])
        a.swapSubArray(leftRange: (1, 2), rightRange: (5, 8))
        XCTAssertTrue(a == [4, 6, 7, 8, 9, 1, 5, 2, 3])
        a.swapSubArray(leftRange: (0, 0), rightRange: (8, 8))
        XCTAssertTrue(a == [3, 6, 7, 8, 9, 1, 5, 2, 4])
    }
    
    func testSwapSubArray2() {
        var a = [343, -8, 8, 1, 2, 30, 11, 55, 99, -212, -31]
        a.swapSubArray(leftRange: (1, 7), rightRange: (9, 10))
        XCTAssertTrue(a == [343, -212, -31, 99, -8, 8, 1, 2, 30, 11, 55])
        a.swapSubArray(leftRange: (2, 3), rightRange: (6, 9))
        XCTAssertTrue(a == [343, -212, 1, 2, 30, 11, -8, 8, -31, 99, 55])
        a.swapSubArray(leftRange: (0, 6), rightRange: (8, 10))
        XCTAssertTrue(a == [-31, 99, 55, 8, 343, -212, 1, 2, 30, 11, -8])
        a.swapSubArray(leftRange: (0, 6), rightRange: (7, 10))
        XCTAssertTrue(a == [2, 30, 11, -8, -31, 99, 55, 8, 343, -212, 1])
    }

    static var allTests = [
        ("testMain", testMain),
        ("testJanyeeUtiltyTaskTimeConsuming", testJanyeeUtiltyTaskTimeConsuming),
        ("testJanyeeUtiltyTaskTimeConsuming2", testJanyeeUtiltyTaskTimeConsuming2),
    ]
}
