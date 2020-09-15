import Foundation

public protocol Graphable {
    var edges: Int { get }
    var vertex: Int { get }
    var adjust: Array<Array<Int>> { get }
    
    init(vertex: Int, edges: Int)
    init(tokens: [Substring]) throws
    
    func addEdge(v: Int, w: Int)
    func degree(vertex: Int) -> Int
    func maxDegree() -> Int
    func avgDegree() -> Double
    func numberOfSelfLoops() -> Int
    func depthFirstSearch (source: Int) -> (vertex: Int, connected: [Int])
    func toString() -> String
}

extension Graphable {
    // 计算顶点V的度数
    public func degree(vertex: Int) -> Int {
        return self.adjust[vertex].count
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
            for w in self.adjust[v] {
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
    // 图的字符串表示
    public func toString() -> String {
        var s = "\(self.vertex) vertices, \(self.edges) edges\n"
        for v in 0..<self.vertex {
            s += "\(v): "
            for w in self.adjust[v] {
                s += "\(w) "
            }
            s += "\n"
        }
        return s
    }
}
