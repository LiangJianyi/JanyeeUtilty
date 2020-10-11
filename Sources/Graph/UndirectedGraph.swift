import Foundation

public class UndirectedGraph: Graphable {
    private var v: Int
    private var e: Int
    private var adj: Array<Array<Int>> // maybe could change to Dictionary<Int, Array<Int>>
    
    public var edges: Int {
        get {
            return self.e
        }
    }
    public var vertex: Int {
        get {
            return self.v
        }
    }
    public var adjust: Array<Array<Int>> {
        get {
            return self.adj
        }
    }
    
    public required init() {
        self.v = 0
        self.e = 0
        self.adj = [[Int]]()
    }
    public required init(vertex: Int, edges: Int) {
        self.v = vertex
        self.e = edges
        self.adj = Array<Array<Int>>(repeating: Array<Int>(), count: self.v)
    }
    public required init(tokens: [Substring]) throws {
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
    
    // 返回深度优先搜索器
    public func depthFirstSearcher (source: Int) -> DepthFirstSearch<UndirectedGraph> {
        return DepthFirstSearch(graph: self, source: source)
    }
    // 返回广度优先搜索器
    public func breadthFirstSearcher (source: Int) -> BreadthFirstSearch<UndirectedGraph> {
        return BreadthFirstSearch(graph: self, source: source)
    }
    // 添加一条边 v-w
    public func addEdge(v: Int, w: Int) {
        self.adj[v].append(w)
        self.adj[w].append(v)
        self.v += 1
        self.e += 1
    }
    // 插入一条边 v-w
    public func insertEdge(v: Int, w: Int) {
        if self.adj.insertEdge(v: v, w: w) ||
            self.adj.insertEdge(v: w, w: v) {
            // 如果其中一个 insertVertex 返回 true，表明 adjust 增加了新的 vertex，
            // 需要修改 vertex 的计数
            self.v += 1
        }
        self.e += 1
    }
    // 插入一个孤立的顶点
    public func insertVertex(v: Int) {
        
    }
    // 克隆一个副本
    public func clone() -> UndirectedGraph {
        let copy = UndirectedGraph(vertex: self.v, edges: self.e)
        copy.adj = self.adj
        return copy
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
    
    public static func == (lhs: UndirectedGraph, rhs: UndirectedGraph) -> Bool {
        return lhs.adjust == rhs.adjust &&
            lhs.vertex == rhs.vertex &&
            lhs.edges == rhs.edges
    }
}
