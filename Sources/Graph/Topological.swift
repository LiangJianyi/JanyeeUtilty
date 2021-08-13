import Foundation
import Sequence

public class Topological {
    public private(set) var order: Stack<Int, LinkedList<Int>>?
    
    public var isDAG: Bool {
        return self.order != nil
    }
    
    public init(digraph: DirectedGraph) {
        let cycleFinder = DirectedCycle(graph: digraph)
        if cycleFinder.hasCycle == false {
            let dfo = DepthFirstOrder(graph: digraph)
            self.order = dfo.reversePost
        }
    }
}
