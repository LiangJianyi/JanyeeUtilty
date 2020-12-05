import Foundation

public var PRINT_DEINIT_INFO: Bool = false

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
            self._first?.previous = Node(value: value, previous: nil, next: self._first)
            self._first = self.first?.previous
        }
        self._count += 1
    }
    
    public func appendLast(_ value: Element) {
        if _first == nil {
            self._first = Node(value: value)
            _last = _first
        } else {
            self._last?.next = Node(value: value, previous: self._last)
            self._last = self._last?.next
        }
        self._count += 1
    }
    
    public func clone() -> LinkedList<Element> {
        let copy = LinkedList<Element>()
        copy._first = self._first?.clone()
        copy._last = self._last?.clone()
        copy._count = self._count
        return copy
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
    
    public func removeAll() {
        self._first = nil
        self._last = nil
        self._count = 0
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
    
    public func toArray() -> [Element] {
        var res = [Element]()
        for item in self {
            res.append(item)
        }
        return res
    }
    
    public func makeIterator() -> Iterator {
        return LinkedListIterator(seed: self._first)
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
        
        #if PRINT_DEINIT_INFO
        deinit {
            print("Node(\(value)) deinitialized")
        }
        #endif
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
