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
        let queue = Queue<Int, LinkedList<Int>>()
        XCTAssertTrue(queue.count == 0)
        
        queue.enqueue(1)
        XCTAssertTrue(queue.count == 1)
        
        queue.enqueue(2)
        XCTAssertTrue(queue.count == 2)
        
        queue.enqueue(3)
        XCTAssertTrue(queue.count == 3)
        
        XCTAssertTrue(queue.dequeue() == 1)
        XCTAssertTrue(queue.count == 2)

        XCTAssertTrue(queue.dequeue() == 2)
        XCTAssertTrue(queue.count == 1)

        XCTAssertTrue(queue.dequeue() == 3)
        XCTAssertTrue(queue.count == 0)
    }
}
