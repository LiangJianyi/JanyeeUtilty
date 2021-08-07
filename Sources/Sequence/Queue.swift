import Foundation

public class Queue<Element, Seq>: Sequence where Seq: Sequence {
    private var rawSequence: Any
    
    public private(set) var count: Int
    
    public typealias Element = Element
    public typealias Iterator = QueueIterator<Seq>
    
    public init() {
        self.count = 0
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
            raw.append(value)
            rawSequence = raw
        } else {
            let raw = rawSequence as! LinkedList<Element>
            raw.appendFirst(value)
        }
    }
    
    public func dequeue() -> Element {
        if let raw = rawSequence as? LinkedList<Element> {
            return raw.popFirst()!.value
        } else {
            var raw = rawSequence as! Array<Element>
            // 修改 raw 不会影响 rawSequence，因为 Array 是值传递的
            let first = raw.first!
            raw.removeFirst()
            rawSequence = raw
            return first
        }
    }
    
    public func makeIterator() -> Iterator {
        return QueueIterator<Seq>(queue: self)
    }
    
    public class QueueIterator<S>: IteratorProtocol where S: Sequence {
        private let queue: Queue<Element, S>
        
        init(queue: Queue<Element, S>) {
            self.queue = queue
        }
        
        public func next() -> Element? {
            return self.queue.dequeue()
        }
    }
}
