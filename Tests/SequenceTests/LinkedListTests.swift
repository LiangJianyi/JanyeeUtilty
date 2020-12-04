import XCTest
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
    
    // 比较 RemoveLast 与 PopLast 的速度
    func testRemoveLastVsPopLast() {
        
    }
    
    func testEqualTo1() {
        let lik1 = LinkedList<Int>()
        XCTAssertTrue(lik1 == lik1.clone())
        XCTAssertFalse(lik1 != lik1.clone())
        
        for item in 1...1000 {
            lik1.appendFirst(item)
            XCTAssertTrue(lik1 == lik1.clone())
            XCTAssertFalse(lik1 != lik1.clone())
        }
        
        lik1.removeAll()
        
        for item in 1...1000 {
            lik1.appendLast(item)
            XCTAssertTrue(lik1 == lik1.clone())
            XCTAssertFalse(lik1 != lik1.clone())
        }
    }
    
    func testEqualTo2() {
        
    }
    
    func testEqualTo3() {
        
    }
}
