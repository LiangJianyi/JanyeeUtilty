import Foundation

fileprivate extension Array {
    mutating func push(_ value: Element) {
        self.append(value)
    }
    
    mutating func pop() -> Element? {
        return self.removeLast()
    }
}

fileprivate extension LinkedList {
    func enqueue(_ value: Element) {
        self.appendLast(value)
    }
    
    func dequeue() -> Element? {
        return self.popLast()?.value
    }
}

public class Stack<Element, Seq>: Sequence where Seq: Sequence, Seq.Element == Element {
    private var rawSequence: Any
    
    public var count: Int {
        get {
            if let raw = rawSequence as? Array<Element> {
                return raw.count
            } else {
                return (rawSequence as! LinkedList<Element>).count
            }
        }
    }
    
    public var isEmpty: Bool {
        get {
            return self.count == 0
        }
    }
    
    public typealias Element = Element
    public typealias Iterator = StackIterator<Seq>
    
    public init() {
        if Seq.self is Array<Element>.Type {
            self.rawSequence = [Element]()
        } else if Seq.self is LinkedList<Element>.Type {
            self.rawSequence = LinkedList<Element>()
        } else {
            fatalError()
        }
    }
    
    public func push(_ value: Element) {
        if var raw = rawSequence as? Array<Element> {
            // 修改 raw 不会影响 rawSequence，因为 Array 是值传递的
            raw.push(value)
            rawSequence = raw
        } else {
            let raw = rawSequence as! LinkedList<Element>
            raw.enqueue(value)
        }
    }
    
    public func pop() -> Element? {
        if let raw = rawSequence as? LinkedList<Element> {
            return raw.dequeue()
        } else {
            var raw = rawSequence as! Array<Element>
            // 修改 raw 不会影响 rawSequence，因为 Array 是值传递的
            let first = raw.pop()
            rawSequence = raw
            return first
        }
    }
    
    public func makeIterator() -> Iterator {
        return StackIterator<Seq>(queue: self)
    }
    
    public class StackIterator<S>: IteratorProtocol where S: Sequence, S.Element == Element {
        private let stack: Stack<Element, S>
        
        init(queue: Stack<Element, S>) {
            self.stack = queue
        }
        
        public func next() -> Element? {
            return self.stack.pop()
        }
    }
}
