import XCTest
@testable import Sequence

final class StackTests: XCTestCase {
    func testStack1() {
        let stack = Stack<Int, LinkedList<Int>>()
        
        var count = 0
        XCTAssertTrue(stack.count == count)
        
        for n in -999...999 {
            stack.push(n)
            count += 1
            XCTAssertTrue(stack.count == count)
        }
        var arr = [Int]()
        for item in stack {
            arr.append(item)
        }
        XCTAssertTrue(arr == [Int](-999...999).reversed())
    }
    
    func testStack2() {
        let stack = Stack<String, LinkedList<String>>()
        XCTAssertTrue(stack.count == 0)
        
        stack.push("🍎🍎🍎")
        XCTAssertTrue(stack.count == 1)
        
        stack.push("🍍🍍🍍")
        XCTAssertTrue(stack.count == 2)
        
        stack.push("🍊🍊🍊")
        XCTAssertTrue(stack.count == 3)
        
        XCTAssertTrue(stack.pop() == "🍊🍊🍊")
        XCTAssertTrue(stack.count == 2)

        XCTAssertTrue(stack.pop() == "🍍🍍🍍")
        XCTAssertTrue(stack.count == 1)

        XCTAssertTrue(stack.pop() == "🍎🍎🍎")
        XCTAssertTrue(stack.count == 0)
    }
    
    func testStack3() {
        let stack = Stack<String, [String]>()
        XCTAssertTrue(stack.count == 0)
        
        stack.push("🍎🍎🍎")
        XCTAssertTrue(stack.count == 1)
        
        stack.push("🍍🍍🍍")
        XCTAssertTrue(stack.count == 2)
        
        stack.push("🍊🍊🍊")
        XCTAssertTrue(stack.count == 3)
        
        XCTAssertTrue(stack.pop() == "🍊🍊🍊")
        XCTAssertTrue(stack.count == 2)

        XCTAssertTrue(stack.pop() == "🍍🍍🍍")
        XCTAssertTrue(stack.count == 1)

        XCTAssertTrue(stack.pop() == "🍎🍎🍎")
        XCTAssertTrue(stack.count == 0)
    }
    
    func testStack4() {
        typealias Q1 = Stack<Int, [Int]>
        typealias Q2 = Stack<Q1, LinkedList<Q1>>
        typealias Q3 = Stack<LinkedList<Q2>, [LinkedList<Q2>]>
        
        let qa1 = Q1()
        qa1.push(1)
        qa1.push(2)
        qa1.push(3)
        
        let qa2 = Q1()
        qa2.push(4)
        qa2.push(5)
        qa2.push(6)
        
        let qa3 = Q1()
        qa3.push(7)
        qa3.push(8)
        qa3.push(9)
        
        let qa4 = Q1()
        qa4.push(10)
        qa4.push(11)
        qa4.push(12)
        
        let qa5 = Q1()
        qa5.push(13)
        qa5.push(14)
        qa5.push(15)
        
        let qa6 = Q1()
        qa6.push(16)
        qa6.push(17)
        qa6.push(18)
        
        let qa7 = Q1()
        qa7.push(19)
        qa7.push(20)
        qa7.push(21)
        
        let qa8 = Q1()
        qa8.push(22)
        qa8.push(23)
        qa8.push(24)
        
        let qa9 = Q1()
        qa9.push(25)
        qa9.push(26)
        qa9.push(27)
        
        let qa10 = Q1()
        qa10.push(28)
        qa10.push(29)
        qa10.push(30)
        
        let qa11 = Q1()
        qa11.push(31)
        qa11.push(32)
        qa11.push(33)
        
        let qa12 = Q1()
        qa12.push(34)
        qa12.push(35)
        qa12.push(36)
        
        let qa13 = Q1()
        qa13.push(37)
        qa13.push(38)
        qa13.push(39)
        
        let qa14 = Q1()
        qa14.push(40)
        qa14.push(41)
        qa14.push(42)
        
        let qa15 = Q1()
        qa15.push(43)
        qa15.push(44)
        qa15.push(45)
        
        let qa16 = Q1()
        qa16.push(46)
        qa16.push(47)
        qa16.push(48)
        
        let qa17 = Q1()
        qa17.push(49)
        qa17.push(50)
        qa17.push(51)
        
        let qa18 = Q1()
        qa18.push(52)
        qa18.push(53)
        qa18.push(54)
        
        let qa19 = Q1()
        qa19.push(55)
        qa19.push(56)
        qa19.push(57)
        
        let qa20 = Q1()
        qa20.push(58)
        qa20.push(59)
        qa20.push(60)
        
        let qa21 = Q1()
        qa21.push(61)
        qa21.push(62)
        qa21.push(63)
        
        let qa22 = Q1()
        qa22.push(64)
        qa22.push(65)
        qa22.push(66)
        
        let qa23 = Q1()
        qa23.push(67)
        qa23.push(68)
        qa23.push(69)
        
        let qa24 = Q1()
        qa24.push(70)
        qa24.push(71)
        qa24.push(72)
        
        let qa25 = Q1()
        qa25.push(73)
        qa25.push(74)
        qa25.push(75)
        
        let qa26 = Q1()
        qa26.push(76)
        qa26.push(77)
        qa26.push(78)
        
        let qa27 = Q1()
        qa27.push(79)
        qa27.push(80)
        qa27.push(81)
        
        ////////////////////////////
        
        let qb1 = Q2()
        qb1.push(qa1)
        qb1.push(qa2)
        qb1.push(qa3)
        
        let qb2 = Q2()
        qb2.push(qa4)
        qb2.push(qa5)
        qb2.push(qa6)
        
        let qb3 = Q2()
        qb3.push(qa7)
        qb3.push(qa8)
        qb3.push(qa9)
        
        let qb4 = Q2()
        qb4.push(qa10)
        qb4.push(qa11)
        qb4.push(qa12)
        
        let qb5 = Q2()
        qb5.push(qa13)
        qb5.push(qa14)
        qb5.push(qa15)
        
        let qb6 = Q2()
        qb6.push(qa16)
        qb6.push(qa17)
        qb6.push(qa18)
        
        let qb7 = Q2()
        qb7.push(qa19)
        qb7.push(qa20)
        qb7.push(qa21)
        
        let qb8 = Q2()
        qb8.push(qa22)
        qb8.push(qa23)
        qb8.push(qa24)
        
        let qb9 = Q2()
        qb9.push(qa25)
        qb9.push(qa26)
        qb9.push(qa27)
        
        ////////////////////////////
        
        let root = Q3()
        root.push(LinkedList<Q2>(array: [qb1, qb2, qb3]))
        root.push(LinkedList<Q2>(array: [qb4, qb5]))
        root.push(LinkedList<Q2>(array: [qb6, qb7]))
        root.push(LinkedList<Q2>(array: [qb8, qb9]))
        
        XCTAssertTrue(root.count == 4)
        
        var lik = root.pop()
        
        let re_qb8 = lik!.first!.value
        let re_qa24 = re_qb8.pop()!
        let re_qa23 = re_qb8.pop()!
        let re_qa22 = re_qb8.pop()!
        
        XCTAssertTrue(re_qa24.pop() == 72)
        XCTAssertTrue(re_qa24.pop() == 71)
        XCTAssertTrue(re_qa24.pop() == 70)
        XCTAssertTrue(re_qa23.pop() == 69)
        XCTAssertTrue(re_qa23.pop() == 68)
        XCTAssertTrue(re_qa23.pop() == 67)
        XCTAssertTrue(re_qa22.pop() == 66)
        XCTAssertTrue(re_qa22.pop() == 65)
        XCTAssertTrue(re_qa22.pop() == 64)
        
        let re_qb9 = lik!.first!.next!.value
        let re_qa27 = re_qb9.pop()!
        let re_qa26 = re_qb9.pop()!
        let re_qa25 = re_qb9.pop()!
        XCTAssertTrue(re_qa27.pop() == 81)
        XCTAssertTrue(re_qa27.pop() == 80)
        XCTAssertTrue(re_qa27.pop() == 79)
        XCTAssertTrue(re_qa26.pop() == 78)
        XCTAssertTrue(re_qa26.pop() == 77)
        XCTAssertTrue(re_qa26.pop() == 76)
        XCTAssertTrue(re_qa25.pop() == 75)
        XCTAssertTrue(re_qa25.pop() == 74)
        XCTAssertTrue(re_qa25.pop() == 73)
                
        lik = root.pop()
        let re_qb6 = lik!.first!.value
        let re_qa18 = re_qb6.pop()!
        let re_qa17 = re_qb6.pop()!
        let re_qa16 = re_qb6.pop()!
        XCTAssertTrue(re_qa18.pop() == 54)
        XCTAssertTrue(re_qa18.pop() == 53)
        XCTAssertTrue(re_qa18.pop() == 52)
        XCTAssertTrue(re_qa17.pop() == 51)
        XCTAssertTrue(re_qa17.pop() == 50)
        XCTAssertTrue(re_qa17.pop() == 49)
        XCTAssertTrue(re_qa16.pop() == 48)
        XCTAssertTrue(re_qa16.pop() == 47)
        XCTAssertTrue(re_qa16.pop() == 46)
        
        let re_qb7 = lik!.first!.next!.value
        let re_qa21 = re_qb7.pop()!
        let re_qa20 = re_qb7.pop()!
        let re_qa19 = re_qb7.pop()!
        XCTAssertTrue(re_qa21.pop() == 63)
        XCTAssertTrue(re_qa21.pop() == 62)
        XCTAssertTrue(re_qa21.pop() == 61)
        XCTAssertTrue(re_qa20.pop() == 60)
        XCTAssertTrue(re_qa20.pop() == 59)
        XCTAssertTrue(re_qa20.pop() == 58)
        XCTAssertTrue(re_qa19.pop() == 57)
        XCTAssertTrue(re_qa19.pop() == 56)
        XCTAssertTrue(re_qa19.pop() == 55)

        lik = root.pop()
        let re_qb4 = lik!.first!.value
        let re_qa12 = re_qb4.pop()!
        let re_qa11 = re_qb4.pop()!
        let re_qa10 = re_qb4.pop()!
        XCTAssertTrue(re_qa12.pop() == 36)
        XCTAssertTrue(re_qa12.pop() == 35)
        XCTAssertTrue(re_qa12.pop() == 34)
        XCTAssertTrue(re_qa11.pop() == 33)
        XCTAssertTrue(re_qa11.pop() == 32)
        XCTAssertTrue(re_qa11.pop() == 31)
        XCTAssertTrue(re_qa10.pop() == 30)
        XCTAssertTrue(re_qa10.pop() == 29)
        XCTAssertTrue(re_qa10.pop() == 28)
        
        let re_qb5 = lik!.first!.next!.value
        let re_qa15 = re_qb5.pop()!
        let re_qa14 = re_qb5.pop()!
        let re_qa13 = re_qb5.pop()!
        XCTAssertTrue(re_qa15.pop() == 45)
        XCTAssertTrue(re_qa15.pop() == 44)
        XCTAssertTrue(re_qa15.pop() == 43)
        XCTAssertTrue(re_qa14.pop() == 42)
        XCTAssertTrue(re_qa14.pop() == 41)
        XCTAssertTrue(re_qa14.pop() == 40)
        XCTAssertTrue(re_qa13.pop() == 39)
        XCTAssertTrue(re_qa13.pop() == 38)
        XCTAssertTrue(re_qa13.pop() == 37)
        
        lik = root.pop()
        let re_qb1 = lik!.first!.value
        let re_qa3 = re_qb1.pop()!
        let re_qa2 = re_qb1.pop()!
        let re_qa1 = re_qb1.pop()!
        XCTAssertTrue(re_qa3.pop() == 9)
        XCTAssertTrue(re_qa3.pop() == 8)
        XCTAssertTrue(re_qa3.pop() == 7)
        XCTAssertTrue(re_qa2.pop() == 6)
        XCTAssertTrue(re_qa2.pop() == 5)
        XCTAssertTrue(re_qa2.pop() == 4)
        XCTAssertTrue(re_qa1.pop() == 3)
        XCTAssertTrue(re_qa1.pop() == 2)
        XCTAssertTrue(re_qa1.pop() == 1)
        
        let re_qb2 = lik!.first!.next!.value
        let re_qa6 = re_qb2.pop()!
        let re_qa5 = re_qb2.pop()!
        let re_qa4 = re_qb2.pop()!
        XCTAssertTrue(re_qa6.pop() == 18)
        XCTAssertTrue(re_qa6.pop() == 17)
        XCTAssertTrue(re_qa6.pop() == 16)
        XCTAssertTrue(re_qa5.pop() == 15)
        XCTAssertTrue(re_qa5.pop() == 14)
        XCTAssertTrue(re_qa5.pop() == 13)
        XCTAssertTrue(re_qa4.pop() == 12)
        XCTAssertTrue(re_qa4.pop() == 11)
        XCTAssertTrue(re_qa4.pop() == 10)
        
        let re_qb3 = lik!.first!.next!.next!.value
        let re_qa9 = re_qb3.pop()!
        let re_qa8 = re_qb3.pop()!
        let re_qa7 = re_qb3.pop()!
        XCTAssertTrue(re_qa9.pop() == 27)
        XCTAssertTrue(re_qa9.pop() == 26)
        XCTAssertTrue(re_qa9.pop() == 25)
        XCTAssertTrue(re_qa8.pop() == 24)
        XCTAssertTrue(re_qa8.pop() == 23)
        XCTAssertTrue(re_qa8.pop() == 22)
        XCTAssertTrue(re_qa7.pop() == 21)
        XCTAssertTrue(re_qa7.pop() == 20)
        XCTAssertTrue(re_qa7.pop() == 19)
    }
}
