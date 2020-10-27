import Foundation

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
}

