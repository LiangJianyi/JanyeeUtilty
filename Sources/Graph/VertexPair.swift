/*
 表示一个顶点对
 */
public struct VertexPair: Hashable, Equatable {
    private var s: Int
    private var t: Int
    
    public var source: Int {
        get {
            return self.s
        }
    }
    public var target: Int {
        get {
            return self.t
        }
    }
    
    public init(source: Int, target: Int) {
        self.s = source
        self.t = target
    }
    
    public static func == (l: VertexPair, r: VertexPair) -> Bool {
        return l.s == r.s && l.t == r.t
    }
}
