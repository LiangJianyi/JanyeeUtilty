public class KosarajuSCC {
    private var marked: [Bool]
    
    public private(set) var id: [Int]
    public private(set) var count: Int = 0
    
    public init(digraph: DirectedGraph) {
        self.marked = [Bool](repeating: false, count: digraph.vertex)
        self.id = [Int](repeating: 0, count: digraph.vertex)
        let order = DepthFirstOrder(graph: digraph.reverse())
        for s in order.reversePost {
            if self.marked[s] == false {
                self.dfs(digraph: digraph, v: s)
                self.count += 1
            }
        }
    }
    
    private func dfs(digraph: DirectedGraph, v: Int) {
        self.marked[v] = true
        self.id[v] = count
        for w in digraph.adjust[v] {
            if self.marked[w] == false {
                dfs(digraph: digraph, v: w)
            }
        }
    }
    
    public func stronglyConnected(v: Int, w: Int) -> Bool {
        return self.id[v] == self.id[w]
    }
}
