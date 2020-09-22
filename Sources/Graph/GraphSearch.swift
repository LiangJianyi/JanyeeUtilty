public protocol Searchable {
    init(graph: Graphable, source: Int)
    // v 和 s 是连通的吗
    func isMarked(vertex: Int) -> Bool
}

public class GraphSearch {
    // 标记能够与 source 连通的顶点
    fileprivate var marked: [Bool]
    // 记录搜索过程中路过的顶点
    fileprivate var edgeTo: [Int]
    // 出发顶点
    fileprivate let source: Int
    // 连通的顶点数目
    fileprivate var count: Int
    
    fileprivate init(marked: [Bool], edgeTo: [Int], source: Int, count: Int) {
        self.marked = marked
        self.edgeTo = edgeTo
        self.source = source
        self.count = count
    }
}

// 深度优先搜索
public class DepthFirstSearch: GraphSearch, Searchable {
    public required init(graph: Graphable, source: Int) {
        super.init(
            marked: [Bool](repeating: false, count: graph.vertex),
            edgeTo: [Int](repeating: 0, count: graph.vertex),
            source: source,
            count: 0
        )
        search(graph: graph, v: super.source)
    }
    
    private func search(graph: Graphable, v: Int) {
        super.marked[v] = true
        super.count += 1
        for w in graph.adjust[v] {
            if super.marked[w] == false {
                super.edgeTo[w] = v
                search(graph: graph, v: w)
            }
        }
    }
    
    // source 到 v 的路径
    public func pathTo(_ v: Int) -> [Int] {
        var path: [Int] = [Int]()
        if hasPathTo(v) == false {
            return path
        } else {
            var x = v
            while x != super.source {
                path.append(x)
                x = super.edgeTo[x]
            }
            path.append(super.source)
            return path
        }
    }
    
    // 判断顶点 v 能否抵达
    public func hasPathTo(_ v: Int) -> Bool {
        return super.marked[v]
    }
    
    public func isMarked(vertex: Int) -> Bool {
        return super.marked[vertex]
    }
    
    // 提取已标记的顶点的下标；
    // arr 由 dfs 和 bfs 返回，数组的下标是顶点编号，对应的布尔值
    // 表示该顶点能否连通；
    public func connectedVertexes() -> [Int] {
        var res = [Int]()
        for i in 0..<super.marked.count {
            if super.marked[i] {
                res.append(i)
            }
        }
        return res
    }
}

// 广度优先搜素
public class BreadthFirstSearch: GraphSearch, Searchable {
    public required init(graph: Graphable, source: Int) {
        super.init(
            marked: [Bool](repeating: false, count: graph.vertex),
            edgeTo: [Int](repeating: 0, count: graph.vertex),
            source: source,
            count: 0
        )
        search(graph: graph, v: super.source)
    }
    
    private func search(graph: Graphable, v: Int) {
        var queue = [Int]()
        super.marked[v] = true
        queue.append(v)
        while queue.isEmpty == false {
            let nextVertex = queue.removeFirst()
            for w in graph.adjust[nextVertex] {
                super.edgeTo[w] = nextVertex
                super.marked[w] = true
                queue.append(w)
            }
        }
    }
    
    // source 到 v 的路径
    public func pathTo(_ v: Int) -> [Int] {
        var path: [Int] = [Int]()
        if hasPathTo(v) == false {
            return path
        } else {
            // 能否改 for
            var x = v
            while x != super.source {
                path.append(x)
                x = super.edgeTo[x]
            }
            path.append(super.source)
            return path
        }
    }
    
    // 判断顶点 v 能否抵达
    public func hasPathTo(_ v: Int) -> Bool {
        return super.marked[v]
    }
    
    public func isMarked(vertex: Int) -> Bool {
        return super.marked[vertex]
    }
    
    // 提取已标记的顶点的下标；
    // arr 由 dfs 和 bfs 返回，数组的下标是顶点编号，对应的布尔值
    // 表示该顶点能否连通；
    public func connectedVertexes() -> [Int] {
        var res = [Int]()
        for i in 0..<super.marked.count {
            if super.marked[i] {
                res.append(i)
            }
        }
        return res
    }
}
