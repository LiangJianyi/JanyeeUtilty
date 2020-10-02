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
    func depthFirstSearcher (source: Int) -> DepthFirstSearch
    func breadthFirstSearcher (source: Int) -> BreadthFirstSearch
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
    // 返回深度优先搜索器
    public func depthFirstSearcher (source: Int) -> DepthFirstSearch {
        return DepthFirstSearch(graph: self, source: source)
    }
    // 返回广度优先搜索器
    public func breadthFirstSearcher (source: Int) -> BreadthFirstSearch {
        return BreadthFirstSearch(graph: self, source: source)
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

// 给邻接表（adj）做扩展。
// 如果 v 已经存在，则直接把 w 追加到 v 的邻接表，
// 否则扩充 adjust 列表的长度，增加 adjust.endIndex 到 v 范围的顶点并创建其邻接表。
// 如果无需扩充 adjust 列表的长度，返回 false，否则返回 true。
extension Array where Element == Array<Int> {
    mutating func insertVertex(v: Element.Element, w: Element.Element) -> Bool {
        if v < self.endIndex {
            self[v].append(w)
            return false
        } else {
            for _ in self.endIndex..<v {
                self.append([])
            }
            if endIndex == v {
                self.append([])
            }
            self[v].append(w)
            return true
        }
    }
}
