import Foundation

fileprivate extension Array {
    mutating func enqueue(_ value: Element) {
        self.append(value)
    }
    
    mutating func dequeue() -> Element? {
        return self.removeFirst()
    }
}

fileprivate extension LinkedList {
    func enqueue(_ value: Element) {
        self.appendFirst(value)
    }
    
    func dequeue() -> Element? {
        return self.popLast()?.value
    }
}

public class Queue<Element, Seq>: Sequence where Seq: Sequence, Seq.Element == Element {
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
    public typealias Iterator = QueueIterator<Seq>
    
    public init() {
        if Seq.self is Array<Element>.Type {
            self.rawSequence = [Element]()
        } else if Seq.self is LinkedList<Element>.Type {
            self.rawSequence = LinkedList<Element>()
        } else {
            fatalError()
        }
    }
    
    public func enqueue(_ value: Element) {
        if var raw = rawSequence as? Array<Element> {
            // 修改 raw 不会影响 rawSequence，因为 Array 是值传递的
            raw.enqueue(value)
            rawSequence = raw
        } else {
            let raw = rawSequence as! LinkedList<Element>
            raw.enqueue(value)
        }
    }
    
    public func dequeue() -> Element? {
        if let raw = rawSequence as? LinkedList<Element> {
            return raw.dequeue()
        } else {
            var raw = rawSequence as! Array<Element>
            // 修改 raw 不会影响 rawSequence，因为 Array 是值传递的
            let first = raw.dequeue()
            rawSequence = raw
            return first
        }
    }
    
    public func makeIterator() -> Iterator {
        return QueueIterator<Seq>(queue: self)
    }
    
    public class QueueIterator<S>: IteratorProtocol where S: Sequence, S.Element == Element {
        private let queue: Queue<Element, S>
        
        init(queue: Queue<Element, S>) {
            self.queue = queue
        }
        
        public func next() -> Element? {
            return self.queue.dequeue()
        }
    }
}
