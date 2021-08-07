import XCTest
@testable import Sequence

final class QueueTests: XCTestCase {
    func testEnDeQueue1() {
        let queue = Queue<Int, LinkedList<Int>>()
        
        var count = 0
        XCTAssertTrue(queue.count == count)
        
        for n in -999...999 {
            queue.enqueue(n)
            count += 1
            XCTAssertTrue(queue.count == count)
        }
        var arr = [Int]()
        for item in queue {
            print(item)
            arr.append(item)
        }
        XCTAssertTrue(arr == [Int](-999...999))
    }
    
    func testEnDeQueue2() {
        let queue = Queue<String, LinkedList<String>>()
        XCTAssertTrue(queue.count == 0)
        
        queue.enqueue("🍎🍎🍎")
        XCTAssertTrue(queue.count == 1)
        
        queue.enqueue("🍍🍍🍍")
        XCTAssertTrue(queue.count == 2)
        
        queue.enqueue("🍊🍊🍊")
        XCTAssertTrue(queue.count == 3)
        
        XCTAssertTrue(queue.dequeue() == "🍎🍎🍎")
        XCTAssertTrue(queue.count == 2)

        XCTAssertTrue(queue.dequeue() == "🍍🍍🍍")
        XCTAssertTrue(queue.count == 1)

        XCTAssertTrue(queue.dequeue() == "🍊🍊🍊")
        XCTAssertTrue(queue.count == 0)
    }
    
    func testEnDeQueue3() {
        let queue = Queue<String, [String]>()
        XCTAssertTrue(queue.count == 0)
        
        queue.enqueue("🍎🍎🍎")
        XCTAssertTrue(queue.count == 1)
        
        queue.enqueue("🍍🍍🍍")
        XCTAssertTrue(queue.count == 2)
        
        queue.enqueue("🍊🍊🍊")
        XCTAssertTrue(queue.count == 3)
        
        XCTAssertTrue(queue.dequeue() == "🍎🍎🍎")
        XCTAssertTrue(queue.count == 2)

        XCTAssertTrue(queue.dequeue() == "🍍🍍🍍")
        XCTAssertTrue(queue.count == 1)

        XCTAssertTrue(queue.dequeue() == "🍊🍊🍊")
        XCTAssertTrue(queue.count == 0)
    }
    
    func testEnDeQueue4() {
        typealias T = Queue<String, [String]>
        let queue1 = T()
        typealias Q = Queue<T, LinkedList<T>>
        let queue2 = Q()
        let queue3 = Queue<Q, [Q]>()
        
        queue1.enqueue("🍎🍎🍎")
        queue1.enqueue("🍍🍍🍍")
        queue1.enqueue("🍊🍊🍊")
    }
}
