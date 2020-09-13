import Foundation

public enum GraphError: Error {
    case graphInitilizeError(message: String)
    case parseGraphTextError(message: String)
}

public class Graph {
    private var v: Int
    private var e: Int
    private var adj: Array<Array<Int>> // maybe could change to Dictionary<Int, Array<Int>>
    
    public var edges: Int {
        return self.e
    }
    public var vertex: Int {
        return self.v
    }
    public var adjust: Array<Array<Int>> {
        return self.adj
    }
    
    public init(vertex: Int, edges: Int) {
        self.v = vertex
        self.e = edges
        self.adj = Array<Array<Int>>(repeating: Array<Int>(), count: self.v)
    }
    private init(tokens: [Substring]) throws {
        self.v = Int(String(tokens[0]))!
        self.adj = Array<Array<Int>>(repeating: Array<Int>(), count: self.v)
        self.e = Int(String(tokens[1]))!
        
        for i in 2..<tokens.count {
            let v_w = try tokens[i].split(separator: " ").map({ (e: Substring) throws -> Int in
                guard let num = Int(e) else {
                    throw GraphError.parseGraphTextError(message: "\(e) 不是一个合法的数字")
                }
                return num
            })
            self.addEdge(v: v_w.first!, w: v_w.last!)
        }
    }
    public convenience init(readText: String) throws {
        let tokens = readText.split(separator: "\n")
        if tokens.count >= 2 {
            try self.init(tokens: tokens)
        } else {
            throw GraphError.parseGraphTextError(message: "表示Graph的文本至少需要两行数字，当前文本不合法：\(readText)")
        }
    }
    
    // 添加一条边 v-w
    public func addEdge(v: Int, w: Int) {
        self.adj[v].append(w)
        self.adj[w].append(v)
        self.e += 1
    }
    // 计算顶点V的度数
    public func degree(vertex: Int) -> Int {
        return self.adj[vertex].count
    }
    // 计算所有顶点的最大度数
    public func maxDegree() -> Int {
        return (0..<self.vertex).max { (x, y) in
            return degree(vertex: x) < degree(vertex: y)
        }!
    }
    // 计算所有顶点的平均度数
    public func avgDegree() -> Double {
        return 2.0 * Double(self.edges) / Double(self.vertex)
    }
    // 计算自环的个数
    public func numberOfSelfLoops() -> Int {
        var count = 0
        for v in 0..<self.vertex {
            for w in self.adj[v] {
                if v == w {
                    count += 1
                }
            }
        }
        return count / 2
    }
    // 深度优先搜索
    // 返回二元组，vertex属性与source参数相同，connected表示与vertex相连通的顶点组成的序列
    public func depthFirstSearch (source: Int) -> (vertex: Int, connected: [Int]) {
        let dfs = DepthFirstSearch(graph: self, source: source)
        dfs.search(graph: self, v: 0)
        return (source, dfs.connectedVertexes())
    }
    // 无向图的字符串表示
    public func toString() -> String {
        var s = "\(self.vertex) vertices, \(self.edges) edges\n"
        for v in 0..<self.vertex {
            s += "\(v): "
            for w in self.adj[v] {
                s += "\(w) "
            }
            s += "\n"
        }
        return s
    }
    
    // 提取已标记的顶点的下标；
    // arr 由 dfs 和 bfs 返回，数组的下标是顶点编号，对应的布尔值
    // 表示该顶点能否连通；
    private func connectedVertexes(_ arr: [Bool]) -> [Int] {
        var res = [Int]()
        for i in 0..<arr.count {
            if arr[i] {
                res.append(i)
            }
        }
        return res
    }
}
