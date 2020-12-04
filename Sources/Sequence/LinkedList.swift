import Foundation

public class LinkedList<Element> {
    private var _first: Node?
    private var _last: Node?
    private var _count: Int
    
    var first: Node? {
        get {
            return self._first
        }
    }
    var last: Node? {
        get {
            return self._last
        }
    }
    var count: Int {
        get {
            return self._count
        }
    }
    
    init() {
        self._count = 0
    }
    
//    init(array: [Element]) {
//        for item in array {
//            self.append(value: item)
//        }
//    }
    
    func appendFirst(_ value: Element) {
        if _last == nil {
            self._last = Node(value: value)
            self._first = self._last
        } else {
            self._first?.previous = Node(value: value, pre: nil, next: self._first)
            self._first = self.first?.previous
        }
        self._count += 1
    }
    
    func appendLast(_ value: Element) {
        if _first == nil {
            self._first = Node(value: value)
            _last = _first
        } else {
            self._last?.next = Node(value: value, pre: self._last)
            self._last = self._last?.next
        }
        self._count += 1
    }
    
    func removeLast() {
        self._last = self._last?.previous
        if let la = self._last {
            la.next = nil
        } else {
            self._first = nil
        }
        self._count -= 1
    }
    
    func popLast() -> Node? {
        let last = self._last
        self.removeLast()
        last?.previous = nil
        return last
    }
    
    func toString(shorthand: Bool = false) -> String {
        if _first != nil {
            return _first!.toString(shorthand: shorthand)
        } else {
            return "nil"
        }
    }
    
    class Node {
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
}
