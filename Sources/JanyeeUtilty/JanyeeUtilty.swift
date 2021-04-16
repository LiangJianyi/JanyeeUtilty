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
    var isPrime: Bool {
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

// 给 [UInt8] 添加加减算术运算
extension Array where Element == UInt8 {
    static func +(lhs: Self, rhs: Element) -> Self {
        if lhs.count == 0 {
            return [rhs]
        } else {
            var arr = lhs
            
            func addOne(_ lastIndex: Int) {
                if lastIndex >= 0 {
                    if arr[lastIndex] == 255 {
                        arr[lastIndex] = 0
                        addOne(lastIndex - 1)
                    } else {
                        arr[lastIndex] += 1
                    }
                } else {
                    arr[0] = 1
                    for i in 1..<arr.count {
                        arr[i] = 0
                    }
                    arr.append(0)
                }
            }
            
            for _ in 1...rhs {
                addOne(arr.count - 1)
            }
            return arr
        }
    }
}

// 给 String 添加转换为特定编码数字的函数
extension String {
    func toEncodeNumber(encoding: Encoding) -> [UInt8]? {
        if let data = self.data(using: encoding) {
            return [UInt8](data)
        } else {
            return nil
        }
    }
    
    func toEncodeNumber(encoding: Encoding) -> Data? {
        return self.data(using: encoding)
    }
}
