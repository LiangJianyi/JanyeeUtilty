import Foundation
import Graph

// 给 Set 添加下标访问
extension Set {
    public subscript(_ index: Int) -> Element {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

// 给 String 添加下标访问
extension String {
    public subscript(_ i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

// 给 Int 添加素数检测
extension Int {
    public var isPrime: Bool {
        if self <= 1 {
            return false
        }
        if self <= 3 {
            return true
        }
        var i = 2
        while i*i <= self {
            if self % i == 0 {
                return false
            }
            i = i + 1
        }
        return true
    }
}

// 给 Array 添加并行操作
extension Array {
    func parallelMap<R>(striding: Int, convertor: @escaping (Element) -> R) -> [R] {
        let N = self.count
        let res = UnsafeMutablePointer<R>.allocate(capacity: N)
        DispatchQueue.concurrentPerform(iterations: N/striding) { k in
            for i in (k * striding)..<((k + 1) * striding) {
                res[i] = convertor(self[i])
            }
        }
        for i in (N - (N % striding))..<N {
            res[i] = convertor(self[i])
        }
        
        let finalResult = Array<R>(UnsafeBufferPointer(start: res, count: N))
        res.deallocate()
        return finalResult
    }
}

public class JanyeeUtilty {
    public static func currentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        return "\(hour):\(minutes):\(seconds)"
    }
    // https://stackoverflow.com/questions/24097826/read-and-write-a-string-from-text-file
    public static func readTextToFile(filename: String) -> String {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filename)
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                return text
            }
            catch {/* error handling here */}
        }
        fatalError()
    }
    public static func writeTextToFile(text: String, filename: String) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filename)
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                /* error handling here */
                
            }
        }
    }
    // https://gist.github.com/ctreffs/785db636d68a211b25c989644b13f301
    public static func tupleToArray<Tuple, Value>(tuple: Tuple) -> [Value] {
        let tupleMirror = Mirror(reflecting: tuple)
        assert(tupleMirror.displayStyle == .tuple, "Given argument is no tuple")
        assert(tupleMirror.superclassMirror == nil, "Given tuple argument must not have a superclass (is: \(tupleMirror.superclassMirror!)")
        assert(!tupleMirror.children.isEmpty, "Given tuple argument has no value elements")
        return tupleMirror.children.compactMap { (child: Mirror.Child) -> Value? in
            let valueMirror = Mirror(reflecting: child.value)
            assert(valueMirror.subjectType == Value.self, "Given tuple argument's child type (\(valueMirror.subjectType)) does not reflect expected return value type (\(Value.self))")
            return child.value as? Value
        }
    }
    // 接收一个任务，返回执行这个任务消耗的秒数
    public static func taskTimeConsuming(task: () -> Void) -> TimeInterval {
        let startTime = Date()
        task()
        let endTime = Date()
        return endTime.timeIntervalSince(startTime)
    }
    // 创建一个随机有向图，每个顶点的长度为 Int16
    public static func randomDirectorGraphGenerator(vertexCount: Int16) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...Int16.max).randomElement()!
        let M = (1...Int16.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
    // 创建一个随机有向图，每个顶点的长度为 UInt16
    public static func randomDirectorGraphGenerator(vertexCount: UInt16) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...UInt16.max).randomElement()!
        let M = (1...UInt16.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
    // 创建一个随机有向图，每个顶点的长度为 Int32
    public static func randomDirectorGraphGenerator(vertexCount: Int32) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...Int32.max).randomElement()!
        let M = (1...Int32.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
    // 创建一个随机有向图，每个顶点的长度为 UInt32
    public static func randomDirectorGraphGenerator(vertexCount: UInt32) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...UInt32.max).randomElement()!
        let M = (1...UInt32.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
    // 创建一个随机有向图，每个顶点的长度为 Int64
    public static func randomDirectorGraphGenerator(vertexCount: Int64) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...Int64.max).randomElement()!
        let M = (1...Int64.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
    // 创建一个随机有向图，每个顶点的长度为 UInt64
    public static func randomDirectorGraphGenerator(vertexCount: UInt64) -> DirectedGraph {
        let dg = DirectedGraph()
        // 在不确定的循环次数中随机挑选一个顶点 s，
        // 从 s 出发随机连接其它的顶点。
        // 随机连接的次数为 M。
        let N = (1...UInt64.max).randomElement()!
        let M = (1...UInt64.max).randomElement()!
        for _ in 1...N {
            let s: Int = Int((0..<vertexCount).randomElement()!)
            for _ in 1...M {
                dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
            }
        }
        return dg
    }
}

// 给 [UInt8] 添加算术运算符与关系运算符
extension Array where Element == UInt8 {
    public static func +(lhs: Self, rhs: Element) -> Self {
        if lhs.count > 0 {
            var arr = lhs
            var overflow = false
            for i in (0..<arr.count).reversed() {
                if overflow == false {
                    let tmp = arr[i].addingReportingOverflow(rhs)
                    arr[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        break
                    }
                } else {
                    let tmp = arr[i].addingReportingOverflow(1)
                    arr[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        overflow = false
                        break
                    }
                }
            }
            if overflow {
                arr.append(0)
                if arr.count > 1 {
                    for index in (0...arr.count - 2).reversed() {
                        arr[index + 1] = arr[index]
                    }
                } else {
                    arr[1] = arr[0]
                }
                arr[0] = 1
            }
            arr.removePrefixZero()
            return arr
        } else {
            return [0 + rhs]
        }
    }
    
    public static func +(lhs: Self, rhs: Self) -> Self {
        if lhs.count > 0 {
            if rhs.count > 0 {
                func add(_ x: Self, _ y: Self) -> Self {
                    var arr = x
                    var j = y.count - 1
                    for i in (0..<arr.count).reversed() {
                        if j > -1 {
                            let tmp = arr[i].addingReportingOverflow(y[j])
                            if tmp.overflow == false {
                                arr[i] = tmp.partialValue
                            } else {
                                arr[i] = tmp.partialValue
                                _ = arr.carryForward(index: i - 1)
                            }
                            j -= 1
                        }
                    }
                    return arr
                }
                
                if rhs.count > lhs.count {
                    return add(rhs, lhs)
                } else if lhs.count > rhs.count {
                    return add(lhs, rhs)
                } else {
                    var arr = lhs
                    var i = arr.count - 1
                    var j = i
                    while i > -1 {
                        let tmp = arr[i].addingReportingOverflow(rhs[j])
                        if tmp.overflow == false {
                            arr[i] = tmp.partialValue
                        } else {
                            arr[i] = tmp.partialValue
                            i = arr.carryForward(index: i - 1)
                        }
                        i -= 1
                        j -= 1
                    }
                    return arr
                }
            } else {
                return lhs
            }
        } else {
            if rhs.count > 0 {
                return rhs
            } else {
                return []
            }
        }
    }
    
    public static func -(lhs: Self, rhs: Element) -> Self {
        if lhs.count > 0 {
            var arr = lhs
            var overflow = false
            for i in (0..<arr.count).reversed() {
                if overflow == false {
                    let tmp = arr[i].subtractingReportingOverflow(rhs)
                    arr[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        break
                    }
                } else {
                    let tmp = arr[i].subtractingReportingOverflow(1)
                    arr[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        overflow = false
                        break
                    }
                }
            }
            arr.removePrefixZero()
            return arr
        } else {
            return [0 - rhs]
        }
    }
    
    public static func -(lhs: Self, rhs: Self) -> Self {
        if lhs >= rhs {
            var arr = lhs
            var j = rhs.count - 1
            for i in (0..<arr.count).reversed() {
                if j > -1 {
                    let tmp = arr[i].subtractingReportingOverflow(rhs[j])
                    if tmp.overflow {
                        arr.carryBack(index: i - 1)
                    }
                    arr[i] = tmp.partialValue
                    j -= 1
                } else {
                    break
                }
            }
            arr.removePrefixZero()
            if arr.count == 0 {
                return [0]
            } else {
                return arr
            }
        } else {
            fatalError("Arithmetic operation '\(lhs) + \(rhs)' (on type '[UInt8]') results in an overflow.")
        }
    }
    
    public static func +=(lhs: inout Self, rhs: Element) {
        if lhs.count > 0 {
            lhs.removePrefixZero()
            var overflow = false
            for i in (0..<lhs.count).reversed() {
                if overflow == false {
                    let tmp = lhs[i].addingReportingOverflow(rhs)
                    lhs[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        break
                    }
                } else {
                    let tmp = lhs[i].addingReportingOverflow(1)
                    lhs[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        overflow = false
                        break
                    }
                }
            }
            if overflow {
                lhs.append(0)
                if lhs.count > 1 {
                    for index in (0...lhs.count - 2).reversed() {
                        lhs[index + 1] = lhs[index]
                    }
                } else {
                    lhs[1] = lhs[0]
                }
                lhs[0] = 1
            }
        } else {
            lhs = [0 + rhs]
        }
    }
    
    public static func -=(lhs: inout Self, rhs: Element) {
        if lhs.count > 0 {
            var overflow = false
            for i in (0..<lhs.count).reversed() {
                if overflow == false {
                    let tmp = lhs[i].subtractingReportingOverflow(rhs)
                    lhs[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        break
                    }
                } else {
                    let tmp = lhs[i].subtractingReportingOverflow(1)
                    lhs[i] = tmp.partialValue
                    if tmp.overflow {
                        overflow = true
                        continue
                    } else {
                        overflow = false
                        break
                    }
                }
            }
            lhs.removePrefixZero()
        } else {
            lhs = [0 - rhs]
        }
    }
    
    public static func <(lhs: Self, rhs: Self) -> Bool {
        if lhs.count < rhs.count {
            return true
        } else if lhs.count == rhs.count {
            for i in 0..<lhs.count {
                if lhs[i] == rhs[i] {
                    continue
                } else {
                    return lhs[i] < rhs[i]
                }
            }
            return false
        } else {
            return false
        }
    }
    
    public static func <=(lhs: Self, rhs: Self) -> Bool {
        if lhs.count < rhs.count {
            return true
        } else if lhs.count == rhs.count {
            for i in 0..<lhs.count {
                if lhs[i] == rhs[i] {
                    continue
                } else {
                    return lhs[i] < rhs[i]
                }
            }
            return true
        } else {
            return false
        }
    }
    
    public static func >(lhs: Self, rhs: Self) -> Bool {
        if lhs.count > rhs.count {
            return true
        } else if lhs.count == rhs.count {
            for i in 0..<lhs.count {
                if lhs[i] == rhs[i] {
                    continue
                } else {
                    return lhs[i] > rhs[i]
                }
            }
            return false
        } else {
            return false
        }
    }
    
    public static func >=(lhs: Self, rhs: Self) -> Bool {
        if lhs.count > rhs.count {
            return true
        } else if lhs.count == rhs.count {
            for i in 0..<lhs.count {
                if lhs[i] == rhs[i] {
                    continue
                } else {
                    return lhs[i] > rhs[i]
                }
            }
            return true
        } else {
            return false
        }
    }
    
    // 私有的工具函数，进位加一
    private mutating func carryForward(index: Self.Index) -> Self.Index {
        for i in (0...index).reversed() {
            let tmp = self[i].addingReportingOverflow(1)
            self[i] = tmp.partialValue
            if tmp.overflow == false {
                return index + 1
            }
            if i == 0 {
                self.append(0)
                if self.count > 1 {
                    for index in (0...self.count - 2).reversed() {
                        self[index + 1] = self[index]
                    }
                } else {
                    self[1] = self[0]
                }
                self[0] = 1
            }
        }
        return index + 1
    }
    
    // 私有的工具函数，退位减一
    private mutating func carryBack(index: Self.Index) {
        if self.first! > 0 {
            var index = index
            repeat {
                let tmp = self[index].subtractingReportingOverflow(1)
                self[index] = tmp.partialValue
                if tmp.overflow {
                    index -= 1
                } else {
                    break
                }
            } while true
        } else {
            fatalError("Arithmetic overflow. array=\(self)")
        }
    }
    
    // 私有的工具函数，用来移除byte array开头的无意义的0
    private mutating func removePrefixZero() {
        var prefixZero = true
        for item in self {
            if item == 0 && prefixZero {
                self.removeFirst()
                continue
            } else {
                prefixZero = false
            }
            break
        }
    }
}

// 给 String 添加转换为特定编码数字的函数
extension String {
    public func toEncodeNumber(encoding: Encoding) -> [UInt8]? {
        if let data = self.data(using: encoding) {
            return [UInt8](data)
        } else {
            return nil
        }
    }
    
    public func toEncodeNumber(encoding: Encoding) -> Data? {
        return self.data(using: encoding)
    }
}
