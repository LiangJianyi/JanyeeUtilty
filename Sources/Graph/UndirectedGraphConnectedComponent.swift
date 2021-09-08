public class UndirectedGraphConnectedComponent {
    private var marked: [Bool]
    public private(set) var id: [Int]
    public private(set) var count: Int = 0
    
    public init(graph: UndirectedGraph) {
        self.marked = [Bool](repeating: false, count: graph.vertex)
        self.id = [Int](repeating: 0, count: graph.vertex)
        for s in 0..<graph.vertex {
            if self.marked[s] == false {
                self.dfs(graph: graph, v: s)
                self.count += 1
            }
        }
    }
    
    public func connected(v: Int, w: Int) -> Bool {
        return self.id[v] == self.id[w]
    }
    
    private func dfs(graph: UndirectedGraph, v: Int) {
        self.marked[v] = true
        self.id[v] = count
        for w in graph.adjust[v] {
            if self.marked[w] == false {
                dfs(graph: graph, v: w)
            }
        }
    }
}
