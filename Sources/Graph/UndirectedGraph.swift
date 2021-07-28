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
    public func degree(vertex: Int) -> Int {
        return self.adjust[vertex].count
    }
    // 返回深度优先搜索器
    public func depthFirstSearcher (source: Int) -> DepthFirstSearch<UndirectedGraph> {
        return DepthFirstSearch(graph: self, source: source)
    }
    // 返回广度优先搜索器
    public func breadthFirstSearcher (source: Int) -> BreadthFirstSearch<UndirectedGraph> {
        return BreadthFirstSearch(graph: self, source: source)
    }
    // 向现有顶点添加一条边 v-w，
    // 如果 v 已经存在，则直接把 w 追加到 v 的邻接表，
    // 否则扩充 adjust 列表的长度，增加 adjust.endIndex 到 v 范围的顶点并创建其邻接表。
    public func addEdge(v: Int, w: Int) {
        // v-w
        if v < self.adj.endIndex {
            self.adj[v].append(w)
        } else {
            for _ in self.adj.endIndex...v {
                self.adj.append([])
            }
            self.adj[v].append(w)
        }
        // w-v
        if w < self.adj.endIndex {
            self.adj[w].append(v)
        } else {
            for _ in self.adj.endIndex...w {
                self.adj.append([])
            }
            self.adj[w].append(v)
        }
        self.e += 1
    }
    // 克隆一个副本
    public func clone() -> UndirectedGraph {
        let copy = UndirectedGraph()
        copy.v = self.v
        copy.e = self.e
        copy.adj = self.adj
        return copy
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
    //  输出所有存在自环的顶点
    public func selfLoop() -> Set<Int> {
        var res = Set<Int>()
        for v in 0..<self.adj.endIndex {
            if self.adj[v].contains(v) {
                res.insert(v)
            }
        }
        return res
    }
    // 判断 UndirectedGraph 是否存在自环
    public func hasSelfLoop() -> Bool {
        for v in 0..<self.adj.endIndex {
            if self.adj[v].contains(v) {
                return true
            }
        }
        return false
    }
    //  判断指定的顶点是否存在自环
    public func hasSelfLoop(vertex: Int) -> Bool {
        return self.adj[vertex].contains(vertex)
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
