import XCTest
@testable import JanyeeUtilty
@testable import Sequence

final class LinkedListTests: XCTestCase {
    func testAppendLast() {
        let lik = LinkedList<Int>()
        XCTAssertNil(lik.first)
        XCTAssertNil(lik.last)
        XCTAssertNil(lik.first?.previous)
        XCTAssertNil(lik.first?.next)
        XCTAssertNil(lik.last?.previous)
        XCTAssertNil(lik.last?.next)
        XCTAssertEqual(lik.count, 0)
        
        lik.appendLast(1)
        XCTAssertEqual(lik.first?.value, 1)
        XCTAssertEqual(lik.last?.value, 1)
        XCTAssertNil(lik.first?.previous)
        XCTAssertNil(lik.first?.next)
        XCTAssertNil(lik.last?.previous)
        XCTAssertNil(lik.last?.next)
        XCTAssertEqual(lik.count, 1)
        
        lik.appendLast(2)
        XCTAssertEqual(lik.first?.value, 1)
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.next?.value, 2)
        XCTAssertEqual(lik.last?.value, 2)
        XCTAssertEqual(lik.last?.previous?.value, 1)
        XCTAssertNil(lik.last?.next)
        XCTAssertEqual(lik.count, 2)
        
        lik.appendLast(3)
        XCTAssertEqual(lik.first!.value, 1)
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.next?.value, 2)
        XCTAssertEqual(lik.first?.next?.next?.value, 3)
        XCTAssertNil(lik.first?.next?.next?.next)
        XCTAssertEqual(lik.first?.next?.next?.previous?.previous?.value, lik.first?.value)
        XCTAssertNil(lik.first?.next?.next?.previous?.previous?.previous)
        
        XCTAssertEqual(lik.last?.value, 3)
        XCTAssertEqual(lik.last?.previous?.value, 2)
        XCTAssertEqual(lik.last?.previous?.previous?.value, 1)
        XCTAssertNil(lik.last?.previous?.previous?.previous)
        XCTAssertEqual(lik.last?.previous?.previous?.next?.next?.value, lik.last?.value)
        
        XCTAssertEqual(lik.count, 3)
    }
    
    func testAppendFirst() {
        let lik = LinkedList<String>()
        XCTAssertNil(lik.first)
        XCTAssertNil(lik.last)
        XCTAssertNil(lik.first?.previous)
        XCTAssertNil(lik.first?.next)
        XCTAssertNil(lik.last?.previous)
        XCTAssertNil(lik.last?.next)
        XCTAssertEqual(lik.count, 0)
        
        lik.appendFirst("🍎🍎🍎")
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.value, "🍎🍎🍎")
        XCTAssertNil(lik.first?.next)
        XCTAssertEqual(lik.count, 1)

        
        lik.appendFirst("🍆🍆🍆")
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.value, "🍆🍆🍆")
        XCTAssertEqual(lik.first?.next?.value, "🍎🍎🍎")
        XCTAssertNil(lik.first?.next?.next)
        XCTAssertEqual(lik.count, 2)

        
        lik.appendFirst("🍌🍌🍌")
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.value, "🍌🍌🍌")
        XCTAssertEqual(lik.first?.next?.value, "🍆🍆🍆")
        XCTAssertEqual(lik.first?.next?.next?.value, "🍎🍎🍎")
        XCTAssertNil(lik.first?.next?.next?.next)
        XCTAssertEqual(lik.count, 3)

        
        
        lik.appendFirst("🥝🥝🥝")
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.value, "🥝🥝🥝")
        XCTAssertEqual(lik.first?.next?.value, "🍌🍌🍌")
        XCTAssertEqual(lik.first?.next?.next?.value, "🍆🍆🍆")
        XCTAssertEqual(lik.first?.next?.next?.next?.value, "🍎🍎🍎")
        XCTAssertNil(lik.first?.next?.next?.next?.next)
        XCTAssertEqual(lik.count, 4)

        
        
        lik.appendFirst("🍐🍐🍐")
        XCTAssertNil(lik.first?.previous)
        XCTAssertEqual(lik.first?.value, "🍐🍐🍐")
        XCTAssertEqual(lik.first?.next?.value, "🥝🥝🥝")
        XCTAssertEqual(lik.first?.next?.next?.value, "🍌🍌🍌")
        XCTAssertEqual(lik.first?.next?.next?.next?.value, "🍆🍆🍆")
        XCTAssertEqual(lik.first?.next?.next?.next?.next?.value, "🍎🍎🍎")
        XCTAssertNil(lik.first?.next?.next?.next?.next?.next)
        XCTAssertEqual(lik.count, 5)

        
        lik.appendFirst("🍊🍊🍊")
        XCTAssertNil(lik.last?.next)
        XCTAssertEqual(lik.last?.value, "🍎🍎🍎")
        XCTAssertEqual(lik.last?.previous?.value, "🍆🍆🍆")
        XCTAssertEqual(lik.last?.previous?.previous?.value, "🍌🍌🍌")
        XCTAssertEqual(lik.last?.previous?.previous?.previous?.value, "🥝🥝🥝")
        XCTAssertEqual(lik.last?.previous?.previous?.previous?.previous?.value, "🍐🍐🍐")
        XCTAssertEqual(lik.last?.previous?.previous?.previous?.previous?.previous?.value, "🍊🍊🍊")
        XCTAssertNil(lik.last?.previous?.previous?.previous?.previous?.previous?.previous)
        XCTAssertEqual(lik.count, 6)
    }
    
    func testInitWithArray1() {
        let arr = [UInt64](1...10000)
        let lik = LinkedList<UInt64>()
        for item in arr {
            lik.appendLast(item)
        }
        var arr2 = [UInt64]()
        for item in lik {
            arr2.append(item)
        }
        XCTAssertEqual(arr, arr2)
    }
    
    func testInitWithArray2() {
        let arr = [UInt64](1...10000)
        let lik = LinkedList<UInt64>(array: arr)
        var index = 0
        for item in lik {
            XCTAssertEqual(item, arr[index])
            index += 1
        }
    }
    
    func testRemoveLast() {
        var arr = [UInt64](1...10000)
        let lik = LinkedList<UInt64>(array: arr)
        for _ in 1...10000 {
            arr.removeLast()
            lik.removeLast()
            XCTAssertEqual(arr, lik.toArray())
        }
    }
    
    func testPopLast() {
        var arr = [UInt64](1...10000)
        let lik = LinkedList<UInt64>(array: arr)
        for _ in 1...10000 {
            XCTAssertEqual(lik.popLast()?.value, arr.removeLast())
//            XCTAssertEqual(lik, arr)
            XCTAssertTrue(lik == arr)
        }
    }
    
    func testToArray() {
        let lik = LinkedList<[Int]>()
        lik.appendLast([Int](-9...9))
        lik.appendLast([Int](-99...99))
        lik.appendLast([Int](-999...999))
        lik.appendLast([Int](-9999...9999))
        lik.appendLast([Int](-99999...99999))

        let likToArr: [[Int]] = lik.toArray()
        let arr: [[Int]] = [
            [Int](-9...9),
            [Int](-99...99),
            [Int](-999...999),
            [Int](-9999...9999),
            [Int](-99999...99999)
        ]
        XCTAssertTrue(arr == likToArr)
        XCTAssertTrue(arr == lik)
        
        let metaType1: [Int].Type = LinkedList<[Int]>.Element.self
        let metaType2: [Int].Type = [[Int]].Element.self
        XCTAssertTrue(metaType1 == metaType2)
    }
    
    // 比较 RemoveLast 与 PopLast 的速度
    func testRemoveLastVsPopLast() {
        var removeLastTimeCollection = Set<TimeInterval>()
        var popLastTimeCollection = Set<TimeInterval>()
        func thunk() {
            let lik1 = LinkedList<UInt64>(array: [UInt64](1...10000))
            let lik2 = LinkedList<UInt64>(array: [UInt64](1...10000))
            let removeLastTimeConsuming = JanyeeUtilty.taskTimeConsuming {
                for _ in 1...10000 {
                    lik1.removeLast()
                }
            }
            let popLastTimeConsuming = JanyeeUtilty.taskTimeConsuming {
                for _ in 1...10000 {
                    _ = lik2.popLast()
                }
            }
            removeLastTimeCollection.insert(removeLastTimeConsuming)
            popLastTimeCollection.insert(popLastTimeConsuming)
        }
        for _ in 1...100 {
            thunk()
        }
        
        // 在 thunk 中执行一百万次 removeLast 和 popLast 操作后（每一万次产生一个时间步长，用 removeLastTimeConsuming 表示），
        // 每一万次产生一个时间步长，用 removeLastTimeConsuming 和 popLastTimeConsuming 表示。
        // 在 for _ in 1...100 循环中收集一百个 removeLastTimeConsuming 和 popLastTimeConsuming，
        // 下面的代码检测有哪些 removeLastTimeConsuming 比 popLastTimeConsuming 耗时短，哪些耗时长。
        
        func f(collection1: Set<TimeInterval>, collection2: Set<TimeInterval>, predicate: (TimeInterval, TimeInterval) -> Bool) -> Set<TimeInterval> {
            let collection1_fasterThan_collection2 = collection1.filter { e in
                let e_fasterThan_n = collection2.filter { n in
                    predicate(e, n)
                }
                return e_fasterThan_n.count > 0
            }
            return collection1_fasterThan_collection2
        }
        
        let removeLastFasterThanPopLastCollection = f(collection1: removeLastTimeCollection,
                                                      collection2: popLastTimeCollection,
                                                      predicate: { $0 > $1 })
        print("removeLastFasterThanPopLastCollection = \(removeLastFasterThanPopLastCollection)")
        
        let popLastFasterThanRemoveLastCollection = f(collection1: popLastTimeCollection,
                                                      collection2: removeLastTimeCollection,
                                                      predicate: { $0 > $1 })
        print("popLastFasterThanRemoveLastCollection = \(popLastFasterThanRemoveLastCollection)")
    }
    
    func testEqualTo1() {
        let lik = LinkedList<Int>()
        XCTAssertTrue(lik == lik.clone())
        XCTAssertFalse(lik != lik.clone())
        
        for item in 1...1000 {
            lik.appendFirst(item)
            XCTAssertTrue(lik == lik.clone())
            XCTAssertFalse(lik != lik.clone())
        }
        
        lik.removeAll()
        
        for item in 1...1000 {
            lik.appendLast(item)
            XCTAssertTrue(lik == lik.clone())
            XCTAssertFalse(lik != lik.clone())
        }
    }
    
    private class MutableNode {
        var value: String
        var next: MutableNode?
        init(value: String, next: MutableNode? = nil) {
            self.value = value
            self.next = next
        }
        func toString() -> String {
            return "MutableNode(value: \(value), next: \(String(describing: next?.toString())))"
        }
    }
    
    func testEqualTo2() {
        let lik = LinkedList<MutableNode>()
        lik.appendFirst(MutableNode(value: "one"))
        lik.appendFirst(MutableNode(value: "two"))
        lik.appendFirst(MutableNode(value: "three"))
        
        /**
         虽然 LinkedList 和 Node 都提供了 clone() 实现内存值拷贝，
         但如果 Element 是 class type（比如 MutableNode），
         那么 clone 出来的 lik 的元素值仍然可以通过内部的指针修改 Element 的值。
         */
        let cp = lik.clone()
        cp.first?.value.value = "3⃣️"
        cp.first?.next?.value.value = "2⃣️"
        cp.last?.value.value = "1⃣️"
        XCTAssertEqual(lik.first!.value.value, "3⃣️")
        XCTAssertEqual(lik.first!.next!.value.value, "2⃣️")
        XCTAssertEqual(lik.last!.value.value, "1⃣️")
        
        // 上述情况类似下面这样：
        let arr = [
            MutableNode(value: "abc"),
            MutableNode(value: "def")
        ]
        let arr2 = arr
        arr2.first?.value = "ABC"
        arr2.last?.value = "DEF"
        /**
         arr2 = arr 是值拷贝的，但通过first和last属性的指针操作，
         arr2 的修改也影响到了 arr
         */
        XCTAssertEqual(arr.first!.value, "ABC")
        XCTAssertEqual(arr.last!.value, "DEF")
    }
    
    func testCloseRangeInit() {
        let lik = LinkedList(-1000...1000)
        let arr = [Int](-1000...1000)
        let arr2 = [Int](-1000...1001)
        XCTAssertTrue(lik == arr)
        XCTAssertFalse(lik == arr2)
    }
    
    func testContains1() {
        let lik = LinkedList(-9999...9999)
        let arr = [Int](-9999...9999)
        for item in arr {
            XCTAssertTrue(lik.contains(item))
        }
        XCTAssertFalse(lik.contains(99999))
    }
    
    private struct TempData {
        var data1: String
        var data2: UInt64
    }
    
    func testContains2() {
        let lik = LinkedList<TempData>()
        lik.appendFirst(TempData(data1: "🍎🍎🍎", data2: UInt64.max))
        lik.appendFirst(TempData(data1: "🍌🍌🍌", data2: UInt64.max - 1))
        lik.appendFirst(TempData(data1: "🍈🍈🍈", data2: UInt64.max - 2))
        lik.appendFirst(TempData(data1: "🍋🍋🍋", data2: UInt64.max - 3))
        lik.appendFirst(TempData(data1: "🍊🍊🍊", data2: UInt64.max - 4))
        XCTAssertTrue(lik.contains(where: { $0.data1 == "🍎🍎🍎" && $0.data2 == UInt64.max }))
        XCTAssertTrue(lik.contains(where: { $0.data1 == "🍌🍌🍌" && $0.data2 == UInt64.max - 1 }))
        XCTAssertTrue(lik.contains(where: { $0.data1 == "🍈🍈🍈" && $0.data2 == UInt64.max - 2 }))
        XCTAssertTrue(lik.contains(where: { $0.data1 == "🍋🍋🍋" && $0.data2 == UInt64.max - 3 }))
        XCTAssertTrue(lik.contains(where: { $0.data1 == "🍊🍊🍊" && $0.data2 == UInt64.max - 4 }))
        
        XCTAssertFalse(lik.contains(where: { $0.data1 == "🍊🍊" && $0.data2 == UInt64.max - 4 }))
        XCTAssertFalse(lik.contains(where: { $0.data1 == "apple" && $0.data2 == UInt64.max - 4 }))
        XCTAssertFalse(lik.contains(where: { $0.data1 == "🍈🍈🍈" && $0.data2 == UInt64.max }))
    }
}
