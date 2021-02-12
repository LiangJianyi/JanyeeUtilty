import Foundation

public class LinkedList<Element>: Sequence {
    public private(set) var first: Node?
    public private(set) var last: Node?
    public private(set) var count: Int
    
    public typealias Element = Element
    public typealias Iterator = LinkedListIterator
    
    public init() {
        self.count = 0
    }
    
    public convenience init(array: [Element]) {
        self.init()
        for item in array {
            self.appendLast(item)
        }
    }
    
    public func appendFirst(_ value: Element) {
        if last == nil {
            self.last = Node(value: value)
            self.first = self.last
        } else {
            self.first?.previous = Node(value: value, previous: nil, next: self.first)
            self.first = self.first?.previous
        }
        self.count += 1
    }
    
    public func appendLast(_ value: Element) {
        if first == nil {
            self.first = Node(value: value)
            last = first
        } else {
            self.last?.next = Node(value: value, previous: self.last)
            self.last = self.last?.next
        }
        self.count += 1
    }
    
    public func clone() -> LinkedList<Element> {
        let copy = LinkedList<Element>()
        copy.first = self.first?.clone()
        copy.last = self.last?.clone()
        copy.count = self.count
        return copy
    }
    
    public func removeLast() {
        self.last = self.last?.previous
        if let la = self.last {
            la.next = nil
        } else {
            self.first = nil
        }
        self.count -= 1
    }
    
    public func removeAll() {
        self.first = nil
        self.last = nil
        self.count = 0
    }
    
    public func popLast() -> Node? {
        let last = self.last
        self.removeLast()
        last?.previous = nil
        return last
    }
    
    public func toString(shorthand: Bool = false) -> String {
        if first != nil {
            return first!.toString(shorthand: shorthand)
        } else {
            return "nil"
        }
    }
    
    public func toArray() -> [Element] {
        var res = [Element]()
        for item in self {
            res.append(item)
        }
        return res
    }
    
    public func makeIterator() -> Iterator {
        return LinkedListIterator(seed: self.first)
    }
    
    public class Node {
        public var value: Element
        public var previous: Node?
        public var next: Node?
        
        public init(value: Element, previous: Node? = nil, next: Node? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
        
        public func toString(shorthand: Bool = false) -> String {
            if shorthand {
                if next == nil {
                    return "\(value) -> nil"
                } else {
                    return "\(value) -> \(next!.toString(shorthand: true))"
                }
            } else {
                if next == nil {
                    return "Node(value: \(value), next: nil)"
                } else {
                    return "Node(value: \(value), next: \(next!.toString()))"
                }
            }
        }
        
        public func clone() -> Node {
            return Node(value: self.value, previous: self.previous, next: self.next)
        }
    }
    
    public class LinkedListIterator: IteratorProtocol {
        private var node: Node?
        
        public init(seed: Node?) {
            self.node = seed
        }
        
        public func next() -> Element? {
            if let n = node {
                node = n.next
                return n.value
            } else {
                return nil
            }
        }
    }
}

extension LinkedList: Equatable where Element: Comparable {
//    init(range: ClosedRange<Element>) {
//        self.init()
//        for item in range {
//            self.appendLast(item)
//        }
//    }
    
    static public func ==(left: LinkedList<Element>, right: LinkedList<Element>) -> Bool {
        if left.count == right.count {
            var leftCurrentNode: Element?
            var rightCurrentNode: Element?
            let leftIterator = left.makeIterator()
            let rightIterator = right.makeIterator()
            for _ in 0..<left.count {
                leftCurrentNode = leftIterator.next()
                rightCurrentNode = rightIterator.next()
                if leftCurrentNode! == rightCurrentNode! {
                    continue
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
    
    static public func ==(left: Array<Element>, right: LinkedList<Element>) -> Bool {
        if left.count == right.count {
            var leftCurrentNode: Element?
            var rightCurrentNode: Element?
            var leftIterator = left.makeIterator()
            let rightIterator = right.makeIterator()
            for _ in 0..<left.count {
                leftCurrentNode = leftIterator.next()
                rightCurrentNode = rightIterator.next()
                if leftCurrentNode! == rightCurrentNode! {
                    continue
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
    
    static public func ==(left: LinkedList<Element>, right: Array<Element>) -> Bool {
        if left.count == right.count {
            var leftCurrentNode: Element?
            var rightCurrentNode: Element?
            let leftIterator = left.makeIterator()
            var rightIterator = right.makeIterator()
            for _ in 0..<left.count {
                leftCurrentNode = leftIterator.next()
                rightCurrentNode = rightIterator.next()
                if leftCurrentNode! == rightCurrentNode! {
                    continue
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}
