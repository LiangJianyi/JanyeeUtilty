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
        typealias Q1 = Queue<Int, [Int]>
        typealias Q2 = Queue<Q1, LinkedList<Q1>>
        typealias Q3 = Queue<LinkedList<Q2>, [LinkedList<Q2>]>
        
        let qa1 = Q1()
        qa1.enqueue(1)
        qa1.enqueue(2)
        qa1.enqueue(3)
        
        let qa2 = Q1()
        qa2.enqueue(4)
        qa2.enqueue(5)
        qa2.enqueue(6)
        
        let qa3 = Q1()
        qa3.enqueue(7)
        qa3.enqueue(8)
        qa3.enqueue(9)
        
        let qa4 = Q1()
        qa4.enqueue(10)
        qa4.enqueue(11)
        qa4.enqueue(12)
        
        let qa5 = Q1()
        qa5.enqueue(13)
        qa5.enqueue(14)
        qa5.enqueue(15)
        
        let qa6 = Q1()
        qa6.enqueue(16)
        qa6.enqueue(17)
        qa6.enqueue(18)
        
        let qa7 = Q1()
        qa7.enqueue(19)
        qa7.enqueue(20)
        qa7.enqueue(21)
        
        let qa8 = Q1()
        qa8.enqueue(22)
        qa8.enqueue(23)
        qa8.enqueue(24)
        
        let qa9 = Q1()
        qa9.enqueue(25)
        qa9.enqueue(26)
        qa9.enqueue(27)
        
        let qa10 = Q1()
        qa10.enqueue(28)
        qa10.enqueue(29)
        qa10.enqueue(30)
        
        let qa11 = Q1()
        qa11.enqueue(31)
        qa11.enqueue(32)
        qa11.enqueue(33)
        
        let qa12 = Q1()
        qa12.enqueue(34)
        qa12.enqueue(35)
        qa12.enqueue(36)
        
        let qa13 = Q1()
        qa13.enqueue(37)
        qa13.enqueue(38)
        qa13.enqueue(39)
        
        let qa14 = Q1()
        qa14.enqueue(40)
        qa14.enqueue(41)
        qa14.enqueue(42)
        
        let qa15 = Q1()
        qa15.enqueue(43)
        qa15.enqueue(44)
        qa15.enqueue(45)
        
        let qa16 = Q1()
        qa16.enqueue(46)
        qa16.enqueue(47)
        qa16.enqueue(48)
        
        let qa17 = Q1()
        qa17.enqueue(49)
        qa17.enqueue(50)
        qa17.enqueue(51)
        
        let qa18 = Q1()
        qa18.enqueue(52)
        qa18.enqueue(53)
        qa18.enqueue(54)
        
        let qa19 = Q1()
        qa19.enqueue(55)
        qa19.enqueue(56)
        qa19.enqueue(57)
        
        let qa20 = Q1()
        qa20.enqueue(58)
        qa20.enqueue(59)
        qa20.enqueue(60)
        
        let qa21 = Q1()
        qa21.enqueue(61)
        qa21.enqueue(62)
        qa21.enqueue(63)
        
        let qa22 = Q1()
        qa22.enqueue(64)
        qa22.enqueue(65)
        qa22.enqueue(66)
        
        let qa23 = Q1()
        qa23.enqueue(67)
        qa23.enqueue(68)
        qa23.enqueue(69)
        
        let qa24 = Q1()
        qa24.enqueue(70)
        qa24.enqueue(71)
        qa24.enqueue(72)
        
        let qa25 = Q1()
        qa25.enqueue(73)
        qa25.enqueue(74)
        qa25.enqueue(75)
        
        let qa26 = Q1()
        qa26.enqueue(76)
        qa26.enqueue(77)
        qa26.enqueue(78)
        
        let qa27 = Q1()
        qa27.enqueue(79)
        qa27.enqueue(80)
        qa27.enqueue(81)
        
        ////////////////////////////
        
        let qb1 = Q2()
        qb1.enqueue(qa1)
        qb1.enqueue(qa2)
        qb1.enqueue(qa3)
        
        let qb2 = Q2()
        qb2.enqueue(qa4)
        qb2.enqueue(qa5)
        qb2.enqueue(qa6)
        
        let qb3 = Q2()
        qb3.enqueue(qa7)
        qb3.enqueue(qa8)
        qb3.enqueue(qa9)
        
        let qb4 = Q2()
        qb4.enqueue(qa10)
        qb4.enqueue(qa11)
        qb4.enqueue(qa12)
        
        let qb5 = Q2()
        qb5.enqueue(qa13)
        qb5.enqueue(qa14)
        qb5.enqueue(qa15)
        
        let qb6 = Q2()
        qb6.enqueue(qa16)
        qb6.enqueue(qa17)
        qb6.enqueue(qa18)
        
        let qb7 = Q2()
        qb7.enqueue(qa19)
        qb7.enqueue(qa20)
        qb7.enqueue(qa21)
        
        let qb8 = Q2()
        qb8.enqueue(qa22)
        qb8.enqueue(qa23)
        qb8.enqueue(qa24)
        
        let qb9 = Q2()
        qb9.enqueue(qa25)
        qb9.enqueue(qa26)
        qb9.enqueue(qa27)
        
        ////////////////////////////
        
        let root = Q3()
        root.enqueue(LinkedList<Q2>(array: [qb1, qb2, qb3]))
        root.enqueue(LinkedList<Q2>(array: [qb4, qb5]))
        root.enqueue(LinkedList<Q2>(array: [qb6, qb7]))
        root.enqueue(LinkedList<Q2>(array: [qb8, qb9]))
        
        XCTAssertTrue(root.count == 4)
        
        var lik = root.dequeue()
        
        let re_qb1 = lik!.first!.value
        let re_qa1 = re_qb1.dequeue()!
        let re_qa2 = re_qb1.dequeue()!
        let re_qa3 = re_qb1.dequeue()!
        XCTAssertTrue(re_qa1.dequeue() == 1)
        XCTAssertTrue(re_qa1.dequeue() == 2)
        XCTAssertTrue(re_qa1.dequeue() == 3)
        XCTAssertTrue(re_qa2.dequeue() == 4)
        XCTAssertTrue(re_qa2.dequeue() == 5)
        XCTAssertTrue(re_qa2.dequeue() == 6)
        XCTAssertTrue(re_qa3.dequeue() == 7)
        XCTAssertTrue(re_qa3.dequeue() == 8)
        XCTAssertTrue(re_qa3.dequeue() == 9)
        
        let re_qb2 = lik!.first!.next!.value
        let re_qa4 = re_qb2.dequeue()!
        let re_qa5 = re_qb2.dequeue()!
        let re_qa6 = re_qb2.dequeue()!
        XCTAssertTrue(re_qa4.dequeue() == 10)
        XCTAssertTrue(re_qa4.dequeue() == 11)
        XCTAssertTrue(re_qa4.dequeue() == 12)
        XCTAssertTrue(re_qa5.dequeue() == 13)
        XCTAssertTrue(re_qa5.dequeue() == 14)
        XCTAssertTrue(re_qa5.dequeue() == 15)
        XCTAssertTrue(re_qa6.dequeue() == 16)
        XCTAssertTrue(re_qa6.dequeue() == 17)
        XCTAssertTrue(re_qa6.dequeue() == 18)
        
        let re_qb3 = lik!.first!.next!.next!.value
        let re_qa7 = re_qb3.dequeue()!
        let re_qa8 = re_qb3.dequeue()!
        let re_qa9 = re_qb3.dequeue()!
        XCTAssertTrue(re_qa7.dequeue() == 19)
        XCTAssertTrue(re_qa7.dequeue() == 20)
        XCTAssertTrue(re_qa7.dequeue() == 21)
        XCTAssertTrue(re_qa8.dequeue() == 22)
        XCTAssertTrue(re_qa8.dequeue() == 23)
        XCTAssertTrue(re_qa8.dequeue() == 24)
        XCTAssertTrue(re_qa9.dequeue() == 25)
        XCTAssertTrue(re_qa9.dequeue() == 26)
        XCTAssertTrue(re_qa9.dequeue() == 27)
        
        lik = root.dequeue()
        let re_qb4 = lik!.first!.value
        let re_qa10 = re_qb4.dequeue()!
        let re_qa11 = re_qb4.dequeue()!
        let re_qa12 = re_qb4.dequeue()!
        XCTAssertTrue(re_qa10.dequeue() == 28)
        XCTAssertTrue(re_qa10.dequeue() == 29)
        XCTAssertTrue(re_qa10.dequeue() == 30)
        XCTAssertTrue(re_qa11.dequeue() == 31)
        XCTAssertTrue(re_qa11.dequeue() == 32)
        XCTAssertTrue(re_qa11.dequeue() == 33)
        XCTAssertTrue(re_qa12.dequeue() == 34)
        XCTAssertTrue(re_qa12.dequeue() == 35)
        XCTAssertTrue(re_qa12.dequeue() == 36)
        
        let re_qb5 = lik!.first!.next!.value
        let re_qa13 = re_qb5.dequeue()!
        let re_qa14 = re_qb5.dequeue()!
        let re_qa15 = re_qb5.dequeue()!
        XCTAssertTrue(re_qa13.dequeue() == 37)
        XCTAssertTrue(re_qa13.dequeue() == 38)
        XCTAssertTrue(re_qa13.dequeue() == 39)
        XCTAssertTrue(re_qa14.dequeue() == 40)
        XCTAssertTrue(re_qa14.dequeue() == 41)
        XCTAssertTrue(re_qa14.dequeue() == 42)
        XCTAssertTrue(re_qa15.dequeue() == 43)
        XCTAssertTrue(re_qa15.dequeue() == 44)
        XCTAssertTrue(re_qa15.dequeue() == 45)
        
        lik = root.dequeue()
        let re_qb6 = lik!.first!.value
        let re_qa16 = re_qb6.dequeue()!
        let re_qa17 = re_qb6.dequeue()!
        let re_qa18 = re_qb6.dequeue()!
        XCTAssertTrue(re_qa16.dequeue() == 46)
        XCTAssertTrue(re_qa16.dequeue() == 47)
        XCTAssertTrue(re_qa16.dequeue() == 48)
        XCTAssertTrue(re_qa17.dequeue() == 49)
        XCTAssertTrue(re_qa17.dequeue() == 50)
        XCTAssertTrue(re_qa17.dequeue() == 51)
        XCTAssertTrue(re_qa18.dequeue() == 52)
        XCTAssertTrue(re_qa18.dequeue() == 53)
        XCTAssertTrue(re_qa18.dequeue() == 54)
        
        let re_qb7 = lik!.first!.next!.value
        let re_qa19 = re_qb7.dequeue()!
        let re_qa20 = re_qb7.dequeue()!
        let re_qa21 = re_qb7.dequeue()!
        XCTAssertTrue(re_qa19.dequeue() == 55)
        XCTAssertTrue(re_qa19.dequeue() == 56)
        XCTAssertTrue(re_qa19.dequeue() == 57)
        XCTAssertTrue(re_qa20.dequeue() == 58)
        XCTAssertTrue(re_qa20.dequeue() == 59)
        XCTAssertTrue(re_qa20.dequeue() == 60)
        XCTAssertTrue(re_qa21.dequeue() == 61)
        XCTAssertTrue(re_qa21.dequeue() == 62)
        XCTAssertTrue(re_qa21.dequeue() == 63)
        
        lik = root.dequeue()
        let re_qb8 = lik!.first!.value
        let re_qa22 = re_qb8.dequeue()!
        let re_qa23 = re_qb8.dequeue()!
        let re_qa24 = re_qb8.dequeue()!
        XCTAssertTrue(re_qa22.dequeue() == 64)
        XCTAssertTrue(re_qa22.dequeue() == 65)
        XCTAssertTrue(re_qa22.dequeue() == 66)
        XCTAssertTrue(re_qa23.dequeue() == 67)
        XCTAssertTrue(re_qa23.dequeue() == 68)
        XCTAssertTrue(re_qa23.dequeue() == 69)
        XCTAssertTrue(re_qa24.dequeue() == 70)
        XCTAssertTrue(re_qa24.dequeue() == 71)
        XCTAssertTrue(re_qa24.dequeue() == 72)
        
        let re_qb9 = lik!.first!.next!.value
        let re_qa25 = re_qb9.dequeue()!
        let re_qa26 = re_qb9.dequeue()!
        let re_qa27 = re_qb9.dequeue()!
        XCTAssertTrue(re_qa25.dequeue() == 73)
        XCTAssertTrue(re_qa25.dequeue() == 74)
        XCTAssertTrue(re_qa25.dequeue() == 75)
        XCTAssertTrue(re_qa26.dequeue() == 76)
        XCTAssertTrue(re_qa26.dequeue() == 77)
        XCTAssertTrue(re_qa26.dequeue() == 78)
        XCTAssertTrue(re_qa27.dequeue() == 79)
        XCTAssertTrue(re_qa27.dequeue() == 80)
        XCTAssertTrue(re_qa27.dequeue() == 81)
        
    }
}
