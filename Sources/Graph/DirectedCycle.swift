import Foundation

public class DirectedCycle {
    private var marked: [Bool]
    private var edgeTo: [Int?]
    private var cycle: [Int]?
    private var onStack: [Bool]
    
    public var hasCycle: Bool {
        get {
            return self.cycle != nil
        }
    }
    
    public var getCycle: [Int]? {
        get {
            return self.cycle
        }
    }
    
    public init(graph: DirectedGraph) {
        self.onStack = [Bool](repeating: false, count: graph.vertex)
        self.edgeTo = [Int?](repeating: nil, count: graph.vertex)
        self.marked = [Bool](repeating: false, count: graph.vertex)
        for v in 0..<graph.vertex {
            if marked[v] != false {
                dfs(graph, v)
            }
        }
    }
    
    private func dfs(_ graph: DirectedGraph, _ v: Int) {
        onStack[v] = true
        marked[v] = true
        for w in graph.adjust[v] {
            if hasCycle {
                return
            } else if marked[w] == false {
                edgeTo[w] = v
                dfs(graph, w)
            } else if onStack[w] {
                cycle = [Int]()
                var x = v
                while x != w {
                    cycle?.append(x)
                    x = edgeTo[x]!
                }
                cycle?.append(w)
                cycle?.append(v)
            }
        }
        onStack[v] = false
    }
}
