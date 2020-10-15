import Foundation

public protocol Graphable: Equatable {
    associatedtype Graph: Graphable
    var edges: Int { get }
    var vertex: Int { get }
    var adjust: Array<Array<Int>> { get }
    
    init ()
    init(tokens: [Substring]) throws
    
    func addEdge(v: Int, w: Int)
    func insertVertex(v: Int) -> Bool
    func degree(vertex: Int) -> Int
    func maxDegree() -> Int
    func avgDegree() -> Double
    func numberOfSelfLoops() -> Int
    func depthFirstSearcher (source: Int) -> DepthFirstSearch<Graph>
    func breadthFirstSearcher (source: Int) -> BreadthFirstSearch<Graph>
    func toString() -> String
    func clone() -> Graph
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

