protocol Searchable {
    // 找到和 v 连同的所有顶点
    func dfs(graph: Graph, v: Int)
    // v 和 s 是连通的吗
    func isMarked(vertex: Int) -> Bool
    // 与 s 连同的顶点总数
    func getCount() -> Int
}

public class DepthFirstSearch: Searchable {
    private var marked: [Bool]
    private var edgeTo: [Int]
    private var source: Int
    private var count: Int
    
    public init(graph: Graph, source: Int) {
        self.marked = [Bool](repeating: false, count: graph.vertex)
        self.edgeTo = [Int](repeating: 0, count: graph.vertex)
        self.source = source
        self.count = 0
        dfs(graph: graph, v: self.source)
    }
    
    public func dfs(graph: Graph, v: Int) {
        self.marked[v] = true
        self.count += 1
        for w in graph.adjust[v] {
            if self.marked[w] == false {
                self.edgeTo[w] = v
                dfs(graph: graph, v: w)
            }
        }
    }
    
    public func pathTo(_ v: Int) -> [Int] {
        var path: [Int] = [Int]()
        if hasPathTo(v) == false {
            return path
        } else {
            var x = v
            while x != self.source {
                path.append(x)
                x = self.edgeTo[x]
            }
            path.append(self.source)
            return path
        }
    }
    
    public func hasPathTo(_ v: Int) -> Bool {
        return self.marked[v]
    }
    
    public func isMarked(vertex: Int) -> Bool {
        return self.marked[vertex]
    }
    
    public func getCount() -> Int {
        return self.count
    }
    
    // 提取已标记的顶点的下标；
    // arr 由 dfs 和 bfs 返回，数组的下标是顶点编号，对应的布尔值
    // 表示该顶点能否连通；
    public func connectedVertexes() -> [Int] {
        var res = [Int]()
        for i in 0..<self.marked.count {
            if self.marked[i] {
                res.append(i)
            }
        }
        return res
    }
}
