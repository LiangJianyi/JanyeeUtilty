public class DirectedGraph: Graphable {
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
            return self.adj.count
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
    
    // 计算顶点V的度数
    // 有向图的顶点度数不能简单的返回 adjust 的长度来表示，即：self.adjust[vertex].count
    // 有向图的顶点有入度与出度的区别，这里需要计算入度与出度的总和
    public func degree(vertex: Int) -> Int {
        var d = self.adjust[vertex].count
        for vertexes in self.adjust {
            for v in vertexes {
                if v == vertex {
                    d += 1
                }
            }
        }
        return d
    }
    // 返回深度优先搜索器
    public func depthFirstSearcher (source: Int) -> DepthFirstSearch<DirectedGraph> {
        return DepthFirstSearch(graph: self, source: source)
    }
    // 返回广度优先搜索器
    public func breadthFirstSearcher (source: Int) -> BreadthFirstSearch<DirectedGraph> {
        return BreadthFirstSearch(graph: self, source: source)
    }
    // 向现有顶点添加一条边 v->w，
    // 如果 v 已经存在，则直接把 w 追加到 v 的邻接表，
    // 否则扩充 adjust 列表的长度，增加 adjust.endIndex 到 v 范围的顶点并创建其邻接表。
    public func addEdge(v: Int, w: Int) {
        // v->w
        if v < self.adj.endIndex {
            self.adj[v].append(w)
        } else {
            for _ in self.adj.endIndex...v {
                self.adj.append([])
            }
            self.adj[v].append(w)
        }
        // 插入顶点 w （如果不存在）
        if w >= self.adj.endIndex {
            for _ in self.adj.endIndex...w {
                self.adj.append([])
            }
        }
        self.e += 1
    }
    // 克隆一个副本
    public func clone() -> DirectedGraph {
        let copy = DirectedGraph()
        copy.v = self.v
        copy.e = self.e
        copy.adj = self.adj
        return copy
    }
    // 对有向图取反
    public func reverse() -> DirectedGraph {
        let digraph = DirectedGraph()
        digraph.v = self.v
        digraph.e = self.e
        for v in 0..<self.vertex {
            for w in self.adjust[v] {
                digraph.addEdge(v: w, w: v)
            }
        }
        return digraph
    }
    // 插入一个孤立的顶点
    public func insertVertex(v: Int) -> Bool {
        if v < self.adj.endIndex {
            return false
        } else {
            for _ in self.adj.endIndex...v {
                self.adj.append([])
            }
            return true
        }
    }
    // 判断是否存在有向环
    public func hasCycle() -> Bool {
        return DirectedCycle(graph: self).hasCycle
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
    
    public static func == (lhs: DirectedGraph, rhs: DirectedGraph) -> Bool {
        return lhs.adjust == rhs.adjust &&
            lhs.vertex == rhs.vertex &&
            lhs.edges == rhs.edges
    }
}
