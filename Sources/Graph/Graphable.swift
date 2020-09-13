import Foundation

public protocol Graphable {
    var edges: Int { get set }
    var vertex: Int { get set }
    var adjust: Array<Array<Int>> { get set }
    
    init(vertex: Int, edges: Int)
    init(tokens: [Substring]) throws
    
    func degree(vertex: Int) -> Int
    func maxDegree() -> Int
    func avgDegree() -> Double
    func numberOfSelfLoops() -> Int
    func depthFirstSearch (source: Int) -> (vertex: Int, connected: [Int])
    func toString() -> String
}

extension Graphable {
    // 计算顶点V的度数
    func degree(vertex: Int) -> Int {
        return self.adj[vertex].count
    }
    // 计算所有顶点的最大度数
    func maxDegree() -> Int {
        return (0..<self.vertex).max { (x, y) in
            return degree(vertex: x) < degree(vertex: y)
        }!
    }
    // 计算所有顶点的平均度数
    func avgDegree() -> Double {
        return 2.0 * Double(self.edges) / Double(self.vertex)
    }
    // 计算自环的个数
    func numberOfSelfLoops() -> Int {
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
    func depthFirstSearch (source: Int) -> (vertex: Int, connected: [Int]) {
        let dfs = DepthFirstSearch(graph: self, source: source)
        dfs.search(graph: self, v: 0)
        return (source, dfs.connectedVertexes())
    }
    // 无向图的字符串表示
    func toString() -> String {
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
}
