import Foundation

public class LinkedList<Element>: Sequence {
    private var _first: Node?
    private var _last: Node?
    private var _count: Int
    
    public typealias Element = Element
    public typealias Iterator = LinkedListIterator
    
    public var first: Node? {
        get {
            return self._first
        }
    }
    public var last: Node? {
        get {
            return self._last
        }
    }
    public var count: Int {
        get {
            return self._count
        }
    }
    
    public init() {
        self._count = 0
    }
    
    public convenience init(array: [Element]) {
        self.init()
        for item in array {
            self.appendLast(item)
        }
    }
    
    public func appendFirst(_ value: Element) {
        if _last == nil {
            self._last = Node(value: value)
            self._first = self._last
        } else {
            self._first?.previous = Node(value: value, pre: nil, next: self._first)
            self._first = self.first?.previous
        }
        self._count += 1
    }
    
    public func appendLast(_ value: Element) {
        if _first == nil {
            self._first = Node(value: value)
            _last = _first
        } else {
            self._last?.next = Node(value: value, pre: self._last)
            self._last = self._last?.next
        }
        self._count += 1
    }
    
    public func removeLast() {
        self._last = self._last?.previous
        if let la = self._last {
            la.next = nil
        } else {
            self._first = nil
        }
        self._count -= 1
    }
    
    public func popLast() -> Node? {
        let last = self._last
        self.removeLast()
        last?.previous = nil
        return last
    }
    
    public func toString(shorthand: Bool = false) -> String {
        if _first != nil {
            return _first!.toString(shorthand: shorthand)
        } else {
            return "nil"
        }
    }
    
    public func makeIterator() -> Iterator {
        return LinkedListIterator(seed: self._first)
    }
    
    public class Node {
        var value: Element
        var previous: Node?
        var next: Node?
        init(value: Element, pre: Node? = nil, next: Node? = nil) {
            self.value = value
            self.previous = pre
            self.next = next
        }
        func toString(shorthand: Bool = false) -> String {
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
        deinit {
            print("Node(\(value)) deinitialized")
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

//extension Array where Element: Comparable {
//    init(range: ClosedRange<Element>) {
//        self.init()
//        for item in range {
//            self.appendLast(item)
//        }
//    }
//}
