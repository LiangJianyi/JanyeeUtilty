import Foundation
import Sequence

public class DepthFirstOrder<G: Graphable> {
    private var marked: [Bool]
    public private(set) var pre: Queue<Int, LinkedList<Int>>
    public private(set) var post: Queue<Int, LinkedList<Int>>
    public private(set) var reversePost: Stack<Int, LinkedList<Int>>
    
    init(graph: G) {
        self.pre = Queue<Int, LinkedList<Int>>()
        self.post = Queue<Int, LinkedList<Int>>()
        self.reversePost = Stack<Int, LinkedList<Int>>()
        self.marked = [Bool](repeating: false, count: graph.vertex)
        
        for v in 0..<graph.vertex {
            if self.marked[v] == false {
                dfs(graph, v)
            }
        }
    }
    
    private func dfs(_ graph: G, _ v: Int) {
        self.pre.enqueue(v)
        self.marked[v] = true
        for w in graph.adjust[v] {
            if self.marked[w] == false {
                dfs(graph, w)
            }
        }
        self.post.enqueue(v)
        self.reversePost.push(v)
    }
}
